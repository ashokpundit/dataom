package com.dataom.app.web;

import java.util.concurrent.ThreadPoolExecutor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dataom.app.svc.MapReduceJobs;
import com.dataom.app.svc.PixelDataProcessorSvc;

@RequestMapping("/stats")
@Controller
public class StatsController {
	@Autowired
	private PixelDataProcessorSvc processorSvc;
	
	@Autowired
	private MapReduceJobs jobs;
	
	@RequestMapping("")
	public String stats(Model uiModel) {
	    ThreadPoolExecutor executor= processorSvc.getExecutor();
	    uiModel.addAttribute("active", executor.getActiveCount());
	    uiModel.addAttribute("completed", executor.getCompletedTaskCount());
	    uiModel.addAttribute("largest", executor.getLargestPoolSize());
	    uiModel.addAttribute("poolsize", executor.getPoolSize());
	    uiModel.addAttribute("remainingCapacity", executor.getQueue().remainingCapacity());
	    uiModel.addAttribute("queue", executor.getQueue().size());
	    
	    return "stats";
	}
	
	@RequestMapping("run")
	public String runJob(@RequestParam("job") int job , @RequestParam(value="d", required=false, defaultValue="0") int d){
		if(job == 1) {
			jobs.multiDayMapReduce(d);
		} else if(job == 2) {
			jobs.dailyAttributes();
		} else if(job == 3) {
			jobs.dailyTotals();
		}else if(job == 4) {
			jobs.evalExportSegments();
		} else if(job==5){
			jobs.last1dayAggr();
		}
		
		return "stats";
	}
	
}


