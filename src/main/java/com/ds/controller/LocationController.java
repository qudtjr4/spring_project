package com.ds.controller;

import java.text.DateFormat;
import java.util.*;

import javax.inject.*;
import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ds.domain.*;
import com.ds.service.*;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/location/*")
public class LocationController {
	
	@Inject
	private LocationService service;
	
	
	@RequestMapping(value = "/locationManagement", method = RequestMethod.GET)
	public void locationManagement(Locale locale, Model model) throws Exception{

		model.addAttribute("list", service.locationListAll());
		System.out.println(service.locationListAll().get(0));
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/locationManagement", method = RequestMethod.POST,
			produces="text/plain;charset=utf-8")
	public String locationManagement(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="loc_no",required=true) List<Integer> list) throws Exception{
	
		for(Integer loc_no : list) {
			service.locationDelete(loc_no);
		}
		
		return "redirect:/locationManagement";
		
	}
	
	@RequestMapping(value = "/locationModify", method = RequestMethod.GET)
	public void locationModifyGET(@RequestParam("loc_no") int loc_no, Model model) throws Exception {
		model.addAttribute("locVO", service.locationRead(loc_no));
		
	}
	
	@RequestMapping(value = "/locationModify", method = RequestMethod.POST)
	public String locationModifyPOST(LocationVO vo) throws Exception {
	
		service.locationModify(vo);
		
		return "redirect:/locationModify?loc_no=" + vo.getLoc_no();
		
	}
	
	
	@RequestMapping(value = "/locationInput", method = RequestMethod.GET)
	public String locationRegistGET(Locale locale, Model model) throws Exception{
		
		return "locationInput";
		
	}

	@RequestMapping(value = "/locationInput", method = RequestMethod.POST)
	public String locationRegistPOST(LocationVO vo) throws Exception {
		
		service.locationRegist(vo);
		
		return "redirect:/location/locationManagement";
		
	}
	
	
}
