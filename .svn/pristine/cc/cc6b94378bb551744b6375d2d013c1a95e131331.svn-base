package com.dataom.app.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dataom.app.svc.PixelDataProcessorSvc;
import com.dataom.app.svc.ReportsImpl;

@RequestMapping("/reports")
@Controller
public class ReportsController {
	@Autowired
	private PixelDataProcessorSvc processorSvc;
	
        @Autowired
        private ReportsImpl reportsSvc;
        
	@RequestMapping("totaluv")
	public String statsTotalUV(Model uiModel) {
	    uiModel.addAttribute("title", "Total Unique Vistors");
	    uiModel.addAttribute("jsonData",reportsSvc.dailyUVReport());
	    return "reports/totaluv";
	}
	@RequestMapping("attruv")
	public String statsAttrUV(Model uiModel) {
	    uiModel.addAttribute("title", "Unique Vistors/Attributes");
	    uiModel.addAttribute("jsonData",reportsSvc.dailyUVReport());
	    return "reports/attruv";
	}
        @RequestMapping("seguv")
	public String statsSegUV(Model uiModel) {
	    uiModel.addAttribute("title", "Unique Vistors/Segments");
	    uiModel.addAttribute("jsonData",reportsSvc.dailyUVReport());
	    return "reports/seguv";
	}
        
}


