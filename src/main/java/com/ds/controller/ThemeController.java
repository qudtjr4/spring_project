package com.ds.controller;



import java.util.*;

import javax.inject.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.ds.domain.*;
import com.ds.service.*;

@Controller
@RequestMapping("/theme/*")
public class ThemeController {
	
	@Inject
	private ThemeService service;
	
	@Inject
	private PlaceService plcService;
	
	@Inject
	private Mem_ThemeService mem_ThemeService;
	
	@Inject
	private MemberService memService;
	
	@Inject
	private Theme_ReviewService theme_ReviewService;
	
//테마 메인 페이지
	@RequestMapping(value = "/theme", method = RequestMethod.GET)
	public void themeList(Criteria_Theme cri,Model model) throws Exception{
		System.out.println("cri:" + cri);
		
		model.addAttribute("listTop3",service.listTop(3));
		model.addAttribute("list" , service.listPage(cri));
		PageMaker_Theme pageMaker = new PageMaker_Theme();
		pageMaker.setCriAndTotalCount(cri, service.totalCount());
		model.addAttribute("pageMaker", pageMaker);
		System.out.println(pageMaker);
		
	}
	
	
//테마 리뷰 작성
	@RequestMapping(value = "/addTheme_Review", method = RequestMethod.POST)
	public String theme_Review(Criteria_Theme cri, Theme_ReviewVO vo) throws Exception{
		theme_ReviewService.addTheme_Review(vo);
		
		return "redirect:/theme/themeDetail?page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&lineUp="+cri.getLineUp()+"&theme_no="+vo.getTheme_no();
	}
		
//테마 리뷰 수정(정보 얻어오기)
	@ResponseBody
	@RequestMapping(value = "/reviewModify/{rev_no}", method = RequestMethod.GET)
	public Theme_ReviewVO themePOST(@PathVariable("rev_no") int rev_no) throws Exception{
		System.out.println("rev_no!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+rev_no);
		
		return theme_ReviewService.readReview(rev_no);
	}
	
	
	//테마 리뷰 수정 런
	@RequestMapping(value= "/theme_ReviewModify", method = RequestMethod.POST)
	public String theme_ReviewModify(Theme_ReviewVO vo,Criteria_Theme cri) throws Exception{
		theme_ReviewService.theme_ReviewModify(vo);
		
		return "redirect:/theme/themeDetail?page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&lineUp="+cri.getLineUp()+"&theme_no="+vo.getTheme_no();
	
	}
	//테마 리뷰 삭제
	@ResponseBody
	@RequestMapping(value="/deleteTheme_Review/{rev_no}/{theme_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteCourseReview(@PathVariable("rev_no") int rev_no,@PathVariable("theme_no") int theme_no) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			theme_ReviewService.theme_ReviewDelete(rev_no,theme_no);
			entity = new ResponseEntity<String>(
					"SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	
	//테마 등록하기 페이지 이동
	@RequestMapping(value = "/themeRegist", method = RequestMethod.GET)
	public String themeRegist( HttpServletRequest request, Model model) throws Exception{
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
				model.addAttribute("cartPlaceList", plcService.cartPlaceList(mem_id));
				return "/theme/themeRegist";
			}
		}
		
		
		
		
		
		
		
	}
	
	//테마 등록 런	
	@RequestMapping(value = "/themeAdd", method = RequestMethod.POST)
	public String themeAdd(ThemeVO vo,RedirectAttributes rttr ,@RequestParam("theme_plc_no") List<Integer> list) throws Exception{
		System.out.println("vo : "+ vo);
		System.out.println("list : "+list);
	
		service.regist(vo, list);
		String result = "SUCCESS";
		rttr.addFlashAttribute("msg", result);
		
		return "redirect:/theme/theme?page=1&keyword=&lineUp=";
	}
	
	//테마 상세페이지 이동
	@RequestMapping(value = "/themeDetail", method = RequestMethod.GET)
	public void themeDetail(Model model, @RequestParam("theme_no") int theme_no, Criteria_Theme cri) throws Exception{
		ThemeVO vo = service.read(theme_no);
		String mem_id = vo.getMem_id();
		int recomand = (int)(((double)vo.getRecomand()/(double)vo.getViewcount())*100);
		List<PlaceVO> plcList = plcService.plc_ThemeList(theme_no);
		model.addAttribute("vo" ,vo);
		model.addAttribute("MemberVO", memService.myInfoContext(mem_id));
		model.addAttribute("cri" ,cri);
		model.addAttribute("recomand" ,recomand);
		model.addAttribute("revList" , theme_ReviewService.revListAll(theme_no));
		model.addAttribute("plcList" , plcService.plc_ThemeList(theme_no));
		
		
		//제이슨 오브젝트 이용 좌표 전달	

		JSONArray jArray = new JSONArray();
		for(int i =0; i < plcList.size() ; i ++){
			PlaceVO tempvo = plcList.get(i);
			JSONObject jObject = new JSONObject();
			jObject.put("plc_name", tempvo.getPlc_name());
			jObject.put("plc_map_x", tempvo.getPlc_map_x());
			jObject.put("plc_map_y", tempvo.getPlc_map_y());
			jArray.add(jObject);

		}
		System.out.println("jArray" + jArray.toJSONString());
		
		model.addAttribute("plcMapList", jArray.toJSONString());		
	}
	
	//테마 수정 페이지이동 
	@RequestMapping(value="/themeModify" , method = RequestMethod.POST)
	public String themeModify(HttpServletRequest request,ThemeVO vo, Model model) throws Exception{
		
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
				model.addAttribute("vo", vo);
				model.addAttribute("cartPlaceList", plcService.cartPlaceListMinusPlc_ThemeList(mem_id, vo.getTheme_no()));
				model.addAttribute("plcList" , plcService.plc_ThemeList(vo.getTheme_no()));
				
				return "/theme/themeModify";
			}
		}
		
		
		
	
		
	}
	
	//테마 수정 런
	@RequestMapping(value="/themeModifyRun", method = RequestMethod.POST)
	public String themeModifyRun(ThemeVO vo,@RequestParam("theme_plc_no") List<Integer> list) throws Exception{
		
		
		service.modify(vo,list);
		
		return "redirect:/theme/theme?page=1&keyword=&lineUp=";
	}
	//테마 삭제
	@RequestMapping(value = "/themeDelete" , method = RequestMethod.GET)
	public String themeDelete(@RequestParam("theme_no") int theme_no) throws Exception{
			service.remove(theme_no);
		
		
		return "redirect:/theme/theme?page=1&keyword=&lineUp=";
	}
	
	
	
	//테마 추천하기
	@RequestMapping(value = "/themeDetailRecomand", method = RequestMethod.GET)
	public String themeRecomand(@RequestParam("theme_no") int theme_no, 
			RedirectAttributes rttr,
			HttpServletRequest request,
			Criteria_Theme cri) throws Exception{
		
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
				Mem_ThemeVO vo = new Mem_ThemeVO();
				vo.setMem_id(mem_id);
				vo.setTheme_no(theme_no);
				String result = mem_ThemeService.insertMem_Theme(vo);
				rttr.addFlashAttribute("msg", result);
				
				return "redirect:/theme/themeDetail?page="+cri.getPage()+"&keyword="+cri.getKeyword()+"&lineUp="+cri.getLineUp()+"&theme_no="+vo.getTheme_no();
			}
		}
		
		
		
		
	}
	
}
