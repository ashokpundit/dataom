package com.dataom.app.web;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dataom.app.dao.DistributionDao;
import com.dataom.app.domain.Distribution;
import com.dataom.app.svc.Utils;

@RequestMapping("/distributions")
@Controller
public class DistributionController {
    @Autowired
    DistributionDao distributionDao2;

    @RequestMapping(value = "create")
    public String createDistribution(Model uiModel) {
	uiModel.addAttribute("distribution", new Distribution());
	return "distributions/create";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String saveDistribution(Distribution distribution, BindingResult results, Model uiModel) {
	if (results.hasErrors()) {
	    uiModel.addAttribute("distribution", distribution);
	    uiModel.addAttribute("error", Utils.getErrorMessage(results));
	    return "distributions/create";
	}
	distributionDao2.save(distribution);
	if(distribution.getSyncCall() != null && distribution.getSyncCall().indexOf("dataom.com")<0 ){
		distribution.setSyncCall(distribution.getSyncCall() + "?http://pm.dataom.com/map?distribution=" + distribution.getId() + "&mapped_uid=$UID");
		distributionDao2.save(distribution);
	}
	uiModel.asMap().clear();
	uiModel.addAttribute("success","saved successfuly");
	return "redirect:/distributions/list";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String listDistribution(Model uiModel) {
	List<Distribution> distrs = distributionDao2.findAll();
	uiModel.addAttribute("distributions", distrs);
	return "distributions/list";
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public String showDistribution(Model uiModel, @PathVariable("id") BigInteger id) {
	Distribution distribution = distributionDao2.findOne(id);
	uiModel.addAttribute("distribution", distribution);
	return "distributions/show";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateDistribution(Model uiModel, @PathVariable("id") BigInteger id) {
	Distribution distribution = distributionDao2.findOne(id);
	uiModel.addAttribute("distribution", distribution);
	uiModel.addAttribute("success","updated successfuly");
	return "distributions/create";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String listDistribution(@PathVariable("id") BigInteger id,Model uiModel) {
	distributionDao2.delete(id);
	uiModel.asMap().clear();
	
	uiModel.addAttribute("success","deleted successfuly");
	return "forward:/distributions/list";
    }

}
