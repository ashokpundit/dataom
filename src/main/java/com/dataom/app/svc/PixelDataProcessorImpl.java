package com.dataom.app.svc;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.script.Bindings;
import javax.script.ScriptContext;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.script.SimpleScriptContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.dataom.app.dao.AttrDao;
import com.dataom.app.dao.DistributionDao;
import com.dataom.app.domain.Attr;
import com.dataom.app.domain.Distribution;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;

//db.distrmapping.ensureIndex( { u: 1, duid: 1, dist:1 }, { unique: true } )

@Service("PixelDataProcessor")
public class PixelDataProcessorImpl implements PixelDataProcessorSvc {
	
	@Autowired
	private MongoTemplate mongo;
	
	private ThreadPoolExecutor executor;
	
	@Autowired
	private AttrDao attrDao;
	
	@Autowired
	private DistributionDao distributionDao;
	
	private List<Attr> attributes;
	
	private List<Distribution> distributions;
	
	private ScriptEngineManager factory = new ScriptEngineManager();

    private ScriptEngine engine = factory.getEngineByName("JavaScript");

	private volatile String collectionName;
	
	private String realPath;
    
	@PostConstruct
	public void initIt() {
		System.out.println((new Date()) + " PixelDataProcessorImpl: init() - started");
		executor = new ThreadPoolExecutor(10, 100, 4, TimeUnit.MINUTES, new LinkedBlockingQueue<Runnable>());
		
		initVars();
	}
	
	@Scheduled(cron= "0 0 * * * *")
	public void initVars(){
		List<Attr> attrs = attrDao.findAll();
		List<Attr> tempattributes = new ArrayList<Attr>();
		int i = 0;
		for(Attr attr : attrs) {
			if(attr.getDisabled() == null ||  attr.getDisabled().booleanValue()==false ) {
				tempattributes.add(attr);
				++i;
			}
		}
		attributes = tempattributes;
		System.out.println((new Date()) +" PixelDataProcessorImpl.initVars: active attr " + i);
		
		Calendar cl = Calendar.getInstance();
		collectionName =  "raw" + Utils.getDateString(0);
		System.out.println((new Date()) +" PixelDataProcessorImpl.initVars: completed. collectonName=" + collectionName);
		
		List<Distribution> distributionList = distributionDao.findAll();
		List<Distribution> tempDistributionList = new ArrayList<Distribution>();
		
		int j = 0;
		for(Distribution d : distributionList) {
			if(d.getDisabled() == null || d.getDisabled().booleanValue() ==false) {
				tempDistributionList.add(d);
			}
			++j;
		}
		distributions = tempDistributionList;
		System.out.println((new Date()) +" PixelDataProcessorImpl.initVars: active distr " + j);
	}
	
	@Override
	public void processData(String ip, String u, Map<String, Object> parameterMap, String country, String region) {
		executor.submit(new Process(ip, u, parameterMap, country, region));
	}
	
	@Override
	public void mapDistributionData(String distribution, String u, String duid) {
		executor.submit(new MappingProcess(distribution, u, duid));
	}
	
	
	private static String getStrValue(Object obj){
		if(obj!=null){
			if(obj instanceof Object[] && ((Object [])obj).length!=0){
				return (String)((Object [])obj)[0];
			}else{
				return (String)obj;
			}
		}
		return null;
	}
	
	@Override
	public ThreadPoolExecutor getExecutor() {
		return this.executor;
	}
	
	@Override
	public List<Distribution> getDistributions() {
		return this.distributions;
	}
	
	@PreDestroy 
	public void cleanUp(){
		if(executor != null) {
			List l = executor.shutdownNow();
			System.out.println(new Date() + "- PixeldDataProcessor:: Destroyed. Tasks waiting " + l.size());
		}
	}
	
	
	class Process implements Runnable{
		private String ip;
		private String u;
		private Map<String, Object> parameterMap;
		private String country;
		private String region;
		
		Process(String ip, String u, Map<String, Object> parameterMap, String country, String region) {
			this.ip = ip;
			this.u = u;
			this.parameterMap = parameterMap;
			this.country = country;
			this.region = region;
		}
		
		@Override
		public void run() {
			try {
				ScriptContext ctx = new SimpleScriptContext();
		        Bindings bindings = ctx.getBindings(ScriptContext.ENGINE_SCOPE);
				
		        for(String key : parameterMap.keySet()) {
					String val = getStrValue(parameterMap.get(key));
					if(val != null) {
						bindings.put(key, val);
					}
				}
				
		        BasicDBObject obj = new BasicDBObject();
		        obj.put("u", u);
		        obj.put("ip", ip);
		        obj.put("_dn", getStrValue(parameterMap.get("_dn")));
		        if(country != null) {
		        	obj.put("CN", country);
		        }
		        if(region != null) {
		        	obj.put("RN", region);
		        }
		        
		        boolean attributeMatch = false;
		        for(Attr attr : attributes) {
					boolean attrPresent = false;
					try {
						attrPresent = (Boolean)engine.eval(attr.getExpr(), bindings);
						
						if(attrPresent) {
							obj.append("A" + attr.getId(), 1);
							attributeMatch = true;
						}
			        } catch (ScriptException e) {
			        	if(getStrValue(parameterMap.get("_err")) != null) {
			        		e.printStackTrace();
			        	}
			        }
				}
		        if(!attributeMatch) {
		        	obj.append("_X_", 1);
		        }
		        DB db = mongo.getDb();
		        db.getCollection(collectionName).insert(obj);
		        
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	class MappingProcess implements Runnable{
		private String distribution;
		private String u;
		private String duid;
		
		public MappingProcess(String distr, String  u, String duid) {
			this.distribution = distr;
			this.u = u;
			this.duid = duid;
		}
		
		public void run() {
			try {
				BasicDBObject obj = new BasicDBObject();
		        obj.put("_id", u);
		        obj.put("duid", duid);
		        
		        DB db = mongo.getDb();
		        db.getCollection("distrmapping"+distribution).insert(obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	
}
