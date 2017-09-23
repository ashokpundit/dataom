package com.dataom.app.svc;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.dataom.app.dao.SegmentDao;
import com.dataom.app.domain.Distribution;
import com.dataom.app.domain.Segment;
import com.dataom.app.domain.SegmentCondition;
import com.dataom.app.web.PixelServer;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MapReduceCommand;
import com.mongodb.QueryBuilder;

@Service
public class MapReduceJobsImpl implements MapReduceJobs {

	@Autowired
	private MongoTemplate mongo;
	
	@Autowired
	private SegmentDao segmentDao;
	
	@Override
        @Scheduled(cron= "0 10 8 * * *")
	public void dailyTotals() {
            System.out.println(new Date() + " Starting dailytotalsjob." );
		DB db = mongo.getDb();
		DBCollection dbCol =  db.getCollection("dailyattributes" );
		
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		today.add(Calendar.DATE, -1);
		
		QueryBuilder qb = QueryBuilder.start("_id.day").is(today.getTime());
        System.out.println("query="+ qb.get().toString());
		try {
			dbCol.mapReduce(getFile("aggregatedaily/mapdailyuvattributevise.js"), getFile("aggregatedaily/reducedailyuvattributevise.js"), "dailyuvstats", MapReduceCommand.OutputType.REPLACE, qb.get());
		} catch (Exception e) {
			e.printStackTrace();
		}       
		System.out.println(new Date() + " Finished dailytotals job." );
	}

	@Override
	@Scheduled(cron= "0 1 1 * * *")
	public void dailyAttributes() {
            
		System.out.println(new Date() + " Starting dailyaggregate job." );
                
		DB db = mongo.getDb();
                System.out.println("raw" + Utils.getDateString(-1));
		DBCollection dbCol =  db.getCollection("raw" + Utils.getDateString(-1));
		
		try {
			dbCol.mapReduce(getFile("aggregatedaily/map.js"), getFile("aggregatedaily/reduce.js"), "dailyattributes", MapReduceCommand.OutputType.MERGE, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(new Date() + " Finished dailyaggregate job." );
	}
	
	@Override
	@Scheduled(cron= "0 5 2 * * *")
	public void last1dayAggr() {
		multiDayMapReduce(1);
	}
	
	@Override
	@Scheduled(cron= "0 5 2 * * *")
	public void last7dayAggr() {
		multiDayMapReduce(7);
	}
	
	@Override
	@Scheduled(cron= "0 4 4 * * *")
	public void last14dayAggr() {
		multiDayMapReduce(14);
	}
	
	@Override
	@Scheduled(cron= "0 30 6 * * *")
	public void last30dayAggr() {
		multiDayMapReduce(30);
	}
	
	@Override
	@Scheduled(cron= "0 40 7 * * *")
	public void last60dayAggr() {
		multiDayMapReduce(60);
	}
	
	@Override
	public void multiDayMapReduce(int days) {
		System.out.println(new Date() + " Starting multiDayMapReduce job for days " + days);
		DB db = mongo.getDb();
		DBCollection dbCol =  db.getCollection("dailyattributes");
		
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		Calendar prevday = Calendar.getInstance();
		prevday.set(Calendar.HOUR_OF_DAY, 0);
		prevday.set(Calendar.MINUTE, 0);
		prevday.set(Calendar.SECOND, 0);
        prevday.set(Calendar.MILLISECOND, 0);
		prevday.add(Calendar.DATE, -days);
		
		QueryBuilder qb = QueryBuilder.start("_id.day").greaterThanEquals(prevday.getTime()).lessThan(today.getTime());
		
		try {
			dbCol.mapReduce(getFile("aggregate7/map.js"), getFile("aggregate7/reduce.js"), "aggregate" + days + "d", MapReduceCommand.OutputType.REPLACE, qb.get());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(new Date() + " Finished multidailyaggregate job." );
                
	}
	

	private String getFile(String jsFile) throws IOException {
		InputStreamReader reader = new InputStreamReader(new FileInputStream(PixelServer.mapReducePath + "/" + jsFile));
		StringBuilder strBuilder = new StringBuilder();
		
		char[] chbuff = new char[128];
		int l = reader.read(chbuff, 0, 128);
		while(l > 0) {
			strBuilder.append(chbuff, 0, l);
			l = reader.read(chbuff, 0, 128);
		}
		reader.close();
		return strBuilder.toString();
	}
	
	@Override
	@Scheduled(cron= "0 0 5 * * *")
	public void evalExportSegments() {
		System.out.println(new Date() + " evalExportSegments:: started");
		List<Segment> segments = segmentDao.findAll();
		
		for(Segment seg : segments) {
			if(seg.getDisabled() == null || seg.getDisabled().booleanValue()== false){
				final Segment tsegment = seg;
				Thread t = new Thread(){
					public void run() {
						try {
							evaluateAndExport(tsegment);
						} catch(Exception e) {
							e.printStackTrace();
						}
					}
				};
				
				t.start();
			}
		}
		System.out.println(new Date() + " evalExportSegments:: done");
	}
	
	
	@Override
	public void evaluateAndExport(Segment seg) throws IOException{
		System.out.println(new Date() + " evaluateAndExport:: started segment " + seg.getId());
		DBCursor cursor = evaluateSegment(seg);
		DB db = mongo.getDb();
		DBCollection col = db.getCollection("segment_" + seg.getId() + "_" + Utils.getDateString(-1));
		
		Map<String, PrintWriter>  writerMap = new HashMap<String, PrintWriter>();
		Map<String, DBCollection>  distroMap = new HashMap<String, DBCollection>();
		for(BigInteger d : seg.getDistribution().keySet()){
			File f = new File(PixelServer.exportpath+ "/" + d + "/" + Utils.getDateString(-1) );
			f.mkdirs();
			f = new File(PixelServer.exportpath + "/" + d + "/" + Utils.getDateString(-1) + "/" + seg.getId() + ".txt");
			if(!f.exists())
				f.createNewFile();
			PrintWriter writer = new PrintWriter(f);
			writerMap.put(d.toString(), writer);
			distroMap.put(d.toString(), db.getCollection("distrmapping"+d));
		}
		
		DBCollection lastday = db.getCollection("segment_" + seg.getId() + "_" + Utils.getDateString(-2));
		
		int c = 0;
		while(cursor.hasNext()) {
			++c;
			DBObject obj = cursor.next();
			String u = ((DBObject)obj.get("_id")).get("u").toString();
			DBObject newObj = new BasicDBObject();
			newObj.put("_id", u);
			col.save(newObj);
			
			if(lastday.findOne(QueryBuilder.start("_id").is(u).get()) == null) {
				for(BigInteger d : seg.getDistribution().keySet()){
					DBCollection distromapping = distroMap.get(d.toString());
					DBObject mappedId = distromapping.findOne(QueryBuilder.start("_id").is(u).get());
					if(mappedId != null) {
						String mapped = ((BasicDBObject)mappedId).getString("duid");
						writerMap.get(d.toString()).println(mapped + "," + seg.getDistribution().get(d));
					}
				}
			}
		}
		System.out.println("**Segment total count = " + c);
		DBCollection dailyuvstats = db.getCollection("dailyuvstats");
		Calendar today = Calendar.getInstance();
		today.set(Calendar.HOUR_OF_DAY, 0);
		today.set(Calendar.MINUTE, 0);
		today.set(Calendar.SECOND, 0);
		today.set(Calendar.MILLISECOND, 0);
		today.add(Calendar.DATE, -1);
		
		DBObject stat = dailyuvstats.findOne(QueryBuilder.start("_id").is(today.getTime()).get());
		((DBObject)stat.get("value")).put("S" + seg.getId(), c);
		dailyuvstats.save(stat);
		
		for(PrintWriter w : writerMap.values()) {
			w.close();
		}
		System.out.println(new Date() + " evaluateAndExport:: DONE segment " + seg.getId());
	}
	
	
	@Override
	public DBCursor evaluateSegment(Segment seg) {
		if(seg.getRecencyDays() == null || seg.getRecencyDays() == 0)
			seg.setRecencyDays(1);
		
		DB db = mongo.getDb();
		DBCollection dbCol =  db.getCollection("aggregate" + seg.getRecencyDays() + "d");
		
		QueryBuilder qb = null;
		String lastConjunction = null;
		
		for(SegmentCondition sg : seg.getConditions()){
			if(sg.getAttrs() != null && sg.getAttrs().size() > 0) {
				int freq = (sg.getMinFrequency() == null || sg.getMinFrequency() == 0)? 1 : sg.getMinFrequency().intValue();
				BigInteger attr = sg.getAttrs().get(0);
				if(qb == null) {
					qb = QueryBuilder.start("value.A" + attr).greaterThanEquals(freq);
				} else {
					if(lastConjunction == null || !lastConjunction.equals("OR")) {
						qb.and("value.A" + attr).greaterThanEquals(freq);
					} else {
						qb = QueryBuilder.start().or(qb.get(), QueryBuilder.start("value.A" + attr).greaterThanEquals(freq).get());
					}
				}
				lastConjunction = sg.getConjunction();
			}
		}
		System.out.println("**Segment Query: " + qb.get().toString());
		return dbCol.find(qb.get());
		
	}
	
	
	public static void main(String[] args) throws Exception{
		Object s = MapReduceJobsImpl.class.getClass().getResourceAsStream("/mapreduce/aggregatedaily/map.js");
		System.out.println("S========" + s);
	}

}
