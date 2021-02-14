package com.ds.controller;

import java.io.*;
import java.util.*;

import javax.annotation.*;
import javax.inject.*;
import javax.servlet.http.*;

import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.mvc.support.*;

import com.ds.domain.*;
import com.ds.service.*;
import com.ds.util.*;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private LocationService locationService;
	
	@Inject
	private PlaceService placeService;
	
	
	@RequestMapping(value = "/locationInput", method = RequestMethod.GET) //관리자의 지역등록페이지
	public String adminLocationInputGET(Model model, HttpServletRequest request ) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					return "/admin/locationInput";
				}else{
					return "redirect:/";
				}
				
			}
		}
		
		
		
	}
	
	@RequestMapping(value = "/locationInput", method = RequestMethod.POST) //관리자의 지역등록처리
	public String adminLocationInputPOST(@RequestParam("mem_id") String mem_id,
										RedirectAttributes rttr,
									   LocationVO vo, Model model) throws Exception{
		
		locationService.locationRegist(vo);
		
		model.addAttribute("mem_id",mem_id);
		model.addAttribute("LocationVO",vo);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/locationManagement";
		
	}
	
	@RequestMapping(value = "/placeInput", method = RequestMethod.GET) //관리자의 상세장소 등록페이지
	public String adminPlaceInput(HttpServletRequest request, Model model ) throws Exception {
		
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					model.addAttribute("locationList",locationService.locationListAll());
					return "/admin/placeInput";
				}else{
					return "redirect:/";
				}
				
			}
		}
	}
	
	@RequestMapping(value = "/placeInput", method = RequestMethod.POST) //관리자의 상세장소 등록처리
	public String placeRegist(HttpServletRequest request,PlaceVO vo,@RequestParam("img_name") List<String> list, Model model, RedirectAttributes rttr) throws Exception{

		System.out.println("vo : " + vo);
		System.out.println("list : " + list);
		
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				if(mem_id.equals("admin")){
					placeService.placeRegist(vo, list);
					rttr.addFlashAttribute("msg", "success");
					return "redirect:/admin/placeInput";
				}else{
					return "redirect:/";
				}
				
			}
		}
	}
	
	
	@RequestMapping(value = "/adminUserSearch", method = RequestMethod.GET)  //관리자의 상세등록 지도찾기
	public String adminUserSearchGET(HttpServletRequest request, Model model ) throws Exception{
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					model.addAttribute("MemberList",memberService.memberList());
					System.out.println(locationService.locationListAll().get(0));
				return "/admin/adminUserSearch";
				}else{
					return "redirect:/";
				}
			}
		}
	}

	
	@RequestMapping(value = "/locationManagement", method = RequestMethod.GET) //관리자의 지역관리페이지
	public String locationManagement(Model model, HttpServletRequest request) throws Exception{
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					model.addAttribute("list", locationService.locationListAll());
					System.out.println(locationService.locationListAll().get(0));
					return "/admin/locationManagement";
				}else{
					return "redirect:/";
				}
			}
		}
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/locationManagement", method = RequestMethod.POST, //관리자의 지역페이지 삭제
			produces="text/plain;charset=utf-8")
	public String locationManagement(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="loc_no",required=true) List<Integer> list) throws Exception{
	
		for(Integer loc_no : list) {
			locationService.locationDelete(loc_no);
		}
		
		return "redirect:/admin/locationManagement";
		
	}
	
	@RequestMapping(value = "/locationModify", method = RequestMethod.GET) //관리자의 지역 수정페이지
	public String locationModifyGET(@RequestParam("loc_no") int loc_no,
			HttpServletRequest request, Model model) throws Exception {
		
		HttpSession loginSession = request.getSession();
		System.out.println("loginSession : "+loginSession);
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					model.addAttribute("locVO", locationService.locationRead(loc_no));
					return "/admin/locationModify";
				}else{
					return "redirect:/";
				}
				
			}
		}
	}
	
	@RequestMapping(value = "/locationModify", method = RequestMethod.POST) //관리자의 지역 수정 처리
	public String locationModifyPOST(LocationVO vo) throws Exception {
	
		locationService.locationModify(vo);
		
		return "redirect:/admin/locationManagement";
		
	}
	
	@RequestMapping(value = "/placeManagement1", method = RequestMethod.GET) //관리자의 상세장소페이지
	public String placeManagement1GET(PlaceVO plc_vo, 
			HttpServletRequest request, Model model) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				
				if(mem_id.equals("admin")){
					model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
					model.addAttribute("list", locationService.locationListAll());
					System.out.println(locationService.locationListAll().get(0));
					return "/admin/placeManagement1";
				}else{
					return "redirect:/";
				}
			}
		}
		
		
	}
	
	
	@RequestMapping(value = "/placeManagement2", method = RequestMethod.GET) //관리자의 상세장소 페이지 클릭시
	public String placeManagement2GET(PlaceVO plc_vo, 
					@RequestParam("loc_no") int loc_no,
					@RequestParam("plc_category") String plc_category,
					Criteria_Place cri,
					HttpServletRequest request, Model model) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "index";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "index";
			}else{
				
				if(mem_id.equals("admin")){
					PageMaker_Place pageMaker = new PageMaker_Place();
					pageMaker.setCriAndTotalCount(cri, placeService.placeCount(loc_no));
					
					model.addAttribute("MemberVO", memberService.myInfoContext(mem_id));
					model.addAttribute("pageMaker", pageMaker);
					model.addAttribute("loc_info", locationService.locationRead(loc_no));
					model.addAttribute("plcVO", placeService.placeListAll(loc_no, cri, plc_category));
					System.out.println("loc_no~~~~~~~~~~~~~~~~~~~"+ loc_no);
					return "/admin/placeManagement2";
				}else{
					return "redirect:/";
				}
			}
		}
		
		
	}
	
	@ResponseBody //블라인드 성공시 처리
	@RequestMapping(value="/updateBlindTrue", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateBlindTrue(String mem_id) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			memberService.blindTrue(mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody //블라인드 실패시 처리
	@RequestMapping(value="/updateBlindFalse", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> updateBlindFalse(String mem_id) throws Exception {
		ResponseEntity<String> entity = null;
		
		try {
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			memberService.blindFalse(mem_id);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
}
