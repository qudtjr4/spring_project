package com.ds.controller;

import java.util.*;

import javax.inject.*;
import javax.servlet.*;
import javax.servlet.http.*;

import org.slf4j.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.service.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private LocationService locationService;
	
	@Inject
	private CourseService service;
	
	@Inject
	private PlaceService placeService;
	
	@Inject
	private ThemeService themeService;
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Criteria cri, Model model, HttpServletRequest request) throws Exception {
		System.out.println("maincri : " + cri);	
		
		List<CourseMainInfoDTO> list = service.courseTopList(3);
		List<CourseMainInfoDTO> list2 = service.courseTopList(10);
		List<PlaceVO> plc_bestList = placeService.bestPlace(); 	
		List<ThemeVO> themeListTop3 = themeService.listTop(3);
		List<ThemeVO> themeListTop10 = themeService.listTop(10);
		System.out.println("list 3 : " +  list );
		 
		ServletContext context = request.getServletContext();
		
		System.out.println("--------------------------------------------------------" + locationService.locationListAll());
		
		model.addAttribute("list" , list);
		model.addAttribute("list2" , list2);
		model.addAttribute("themeListTop3",themeListTop3 );
		model.addAttribute("themeListTop10",themeListTop10);
		model.addAttribute("plc_bestList", plc_bestList);
		model.addAttribute("random_Theme", themeService.randomTheme());
		context.setAttribute("locationList", locationService.locationListAll());
		System.out.println("locationList: " + locationService.locationListAll());
		return "index";
	}
	
}
