package com.dataom.app.web;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.dataom.app.dao.AttrDao;
import com.dataom.app.dao.DistributionDao;
import com.dataom.app.dao.SegmentDao;
import com.dataom.app.domain.Segment;
import com.dataom.app.svc.Utils;

@RequestMapping("/segments")
@Controller
public class SegmentController {
    @Autowired
    SegmentDao segmentDao;

    @Autowired
    AttrDao attrDao;

    @Autowired
    DistributionDao distributionDao;

    @RequestMapping(value="create",method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Segment segment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	if (bindingResult.hasErrors()) {
	    populateEditForm(uiModel, segment);
	    uiModel.addAttribute("error", Utils.getErrorMessage(bindingResult));
	    return "segments/create";
	}
	uiModel.asMap().clear();
	segmentDao.save(segment);
	uiModel.addAttribute("success", "saved successfuly");
	return "redirect:/segments/list";
    }

    @RequestMapping(value="create", produces = "text/html")
    public String createForm(Model uiModel) {
	populateEditForm(uiModel, new Segment());
	return "segments/create";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") BigInteger id, Model uiModel) {
	uiModel.addAttribute("segment", segmentDao.findOne(id));
	uiModel.addAttribute("itemId", id);
	return "segments/show";
    }

    @RequestMapping(value="list",produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
	if (page != null || size != null) {
	    int sizeNo = size == null ? 10 : size.intValue();
	    final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
	    uiModel.addAttribute("segments", segmentDao.findAll(new org.springframework.data.domain.PageRequest(firstResult / sizeNo, sizeNo)).getContent());
	    float nrOfPages = (float) segmentDao.count() / sizeNo;
	    uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
	} else {
	    uiModel.addAttribute("segments", segmentDao.findAll());
	}
	return "segments/list";
    }

    @RequestMapping(value="update",method = RequestMethod.POST, produces = "text/html")
    public String update(@Valid Segment segment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
	if (bindingResult.hasErrors()) {
	    populateEditForm(uiModel, segment);
	    uiModel.addAttribute("error", Utils.getErrorMessage(bindingResult));
	    return "segments/update";
	}
	uiModel.asMap().clear();
	segmentDao.save(segment);
	uiModel.addAttribute("success", "updated successfuly");
	return "redirect:/segments/list";
    }

    @RequestMapping(value = "/update/{id}", produces = "text/html")
    public String updateForm(@PathVariable("id") BigInteger id, Model uiModel) {
	populateEditForm(uiModel, segmentDao.findOne(id));
	return "segments/create";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("id") BigInteger id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
	Segment segment = segmentDao.findOne(id);
	segmentDao.delete(segment);
	uiModel.asMap().clear();
	uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
	uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
	uiModel.addAttribute("success", "deleted successfuly");
	return "forward:/segments/list";
    }

    void populateEditForm(Model uiModel, Segment segment) {
    	uiModel.addAttribute("attrs", attrDao.findAll());
    	uiModel.addAttribute("distribution", distributionDao.findAll());
    	uiModel.addAttribute("segment", segment);
    	Integer[] i = {1, 7, 14, 30, 60};
    	uiModel.addAttribute("recencyDaysList", Arrays.asList(i));
    }

    String encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
	String enc = httpServletRequest.getCharacterEncoding();
	if (enc == null) {
	    enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
	}
	try {
	    pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
	} catch (UnsupportedEncodingException uee) {
	}
	return pathSegment;
    }

}
