package com.ds.controller;

import java.text.DateFormat;
import java.util.*;

import javax.inject.*;
import javax.servlet.http.*;

import org.json.simple.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.ds.domain.*;
import com.ds.service.*;

import sun.print.resources.*;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/place/*")
public class PlaceController {
	
	@Inject
	private PlaceService placeService;
	
	@Inject
	private LocationService locationService;
	
	@Inject
	private Plc_ReviewService plc_ReviewService;
	
	@Inject
	private ImageService imageService;
	
	@Inject
	private CartService cartService;
	
	@RequestMapping(value = "/location", method = RequestMethod.GET)
	public void placeBest(@RequestParam("loc_no") int loc_no,
			@RequestParam("plc_category") String plc_category,
			Criteria_Place cri, Model model) throws Exception {
		PageMaker_Place pageMaker = new PageMaker_Place();
		pageMaker.setCriAndTotalCount(cri, placeService.placeCount(loc_no));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("placeList", placeService.placeListAll(loc_no, cri, plc_category));
		model.addAttribute("locationInfo", locationService.locationRead(loc_no));
		model.addAttribute("locationList", locationService.locationListAll());
		
		System.out.println("locationInfo : " +  locationService.locationRead(loc_no));
		model.addAttribute("plc_category", plc_category);
		// 移댄뀒怨좊━蹂� best
		model.addAttribute("bestStay", placeService.placeBestStay(loc_no));
		model.addAttribute("bestAttraction", placeService.placeBestAttraction(loc_no));
		model.addAttribute("bestRestaurant", placeService.placeBestRestaurant(loc_no));
		
	}
	
	//카트에 담기
	@RequestMapping(value="/addCart", method= RequestMethod.GET)
	public String addCart(HttpServletRequest request,
			@RequestParam("plc_no") int plc_no,
			@RequestParam("loc_no") int loc_no,
			RedirectAttributes rttr) throws Exception{
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
				String result;
				CartVO vo = new CartVO(mem_id,plc_no);
				result = cartService.addCart(vo);
				rttr.addFlashAttribute("msg",result);
				
				return "redirect:/place/placeDetail?plc_no="+plc_no+"&loc_no="+loc_no;
			}
		}
		
		
	}


	
	
	
	
	
	@RequestMapping(value="/placeDetail", method = RequestMethod.GET)
	public void read(@RequestParam("loc_no") int loc_no,
			@RequestParam("plc_no") int plc_no,
			@ModelAttribute("cri") Criteria_Place cri,
			Model model) throws Exception {
		PlaceVO placeVO= placeService.placeRead(plc_no);
		
		model.addAttribute("PlaceVO",placeVO);
		
		System.out.println(cri);
		
		// �씠誘몄� 媛��졇�삤湲�
		model.addAttribute("listImage", imageService.ImageList(plc_no));
		// �뙎湲� 媛��졇�삤湲�
		model.addAttribute("listReview", plc_ReviewService.reviewRead(plc_no));
		
			
			JSONObject jObject = new JSONObject();
			jObject.put("plc_name", placeVO.getPlc_name());
			jObject.put("plc_map_x", placeVO.getPlc_map_x());
			jObject.put("plc_map_y", placeVO.getPlc_map_y());

		System.out.println("jArray" +jObject);
		
		model.addAttribute("plcMap", jObject.toJSONString());
		
		
	}
	
	@RequestMapping(value = "/AddPlaceReview", method = RequestMethod.POST)
	public String AddPlaceReview(@RequestParam("plc_no") int plc_no, @RequestParam("loc_no") int loc_no, Plc_ReviewVO vo) throws Exception {
		
		// �뙎湲� �엯�젰�븯湲�
		plc_ReviewService.reviewRegist(vo);
		
		return "redirect:/place/placeDetail?plc_no="+plc_no+"&loc_no="+loc_no;
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewModify/{rev_no}", method=RequestMethod.GET)
	public Plc_ReviewVO getReviewModify(@PathVariable("rev_no") int rev_no) throws Exception{
		return plc_ReviewService.reviewReadOne(rev_no);
	}
	
	//�뙎湲� �닔�젙�븯湲�
	@RequestMapping(value = "/reviewModify", method = RequestMethod.POST)
	public String modifyReviewPOST(Plc_ReviewVO vo, @RequestParam("loc_no") int loc_no ) throws Exception{
		// �뙎湲� �닔�젙�븯湲� POST
		// �뙎湲� �궡�슜 �뾽�뜲�씠�듃
		System.out.println("11111111111111111111" + vo);
		plc_ReviewService.reviewModify(vo);
		// place �뀒�씠釉붿뿉�꽌 珥앹젏 �뾽�뜲�씠�듃
//		placeService.totalScoreUpdate(vo.getPlc_no());
		int plc_no = vo.getPlc_no();
		return "redirect:/place/placeDetail?plc_no="+plc_no+"&loc_no="+loc_no;
	}
	
	
	@RequestMapping(value = "/placeInput", method = RequestMethod.GET)
	public void placeRegist(Locale locale, Model model) throws Exception{

		// 吏��뿭 �궡�뿭 媛��졇�삤湲�(select box)
		model.addAttribute("locationList", locationService.locationListAll());
		
		
	}
	
	@RequestMapping(value = "/placeInput", method = RequestMethod.POST)
	public String placeRegist(PlaceVO vo,@RequestParam("img_name") List<String> list, Model model, RedirectAttributes rttr) throws Exception{

		System.out.println("vo : " + vo);
		System.out.println("list : " + list);
		
		
		placeService.placeRegist(vo, list);
		// 吏��뿭 �궡�뿭 媛��졇�삤湲�(select box)
//		model.addAttribute("locationList", locationService.locationListAll());
		
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/placeInput";
	}
	
	@RequestMapping(value = "/placeModify", method = RequestMethod.GET)
	public void placeModify(PlaceVO vo, Model model, @RequestParam("plc_no") int plc_no, @RequestParam("loc_no") int loc_no) throws Exception {
		
		model.addAttribute("plcVO", placeService.placeRead(plc_no));
		
		// �씠誘몄� �궡�뿭 媛��졇�삤湲�
		model.addAttribute("imageList", imageService.ImageList(plc_no));
		
		// 吏��뿭 �궡�뿭 媛��졇�삤湲�(select box)
		model.addAttribute("locationList", locationService.locationListAll());
		 
	}
	
	@Transactional
	@RequestMapping(value = "/placeModify", method = RequestMethod.POST)
	public String placeModify(PlaceVO vo,@RequestParam("img_name") List<String> list, @RequestParam("plc_no")int plc_no) throws Exception{
		
		imageService.imageUpdate(plc_no, list);
		placeService.placeModify(vo);
		return "redirect:/admin/placeManagement2?loc_no="+vo.getLoc_no()+"&page=1&plc_category=";
		
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public String placeDelete(@RequestParam("plc_no")int plc_no, 
								@RequestParam("loc_no")int loc_no, 
								@RequestParam("plc_category") String plc_category, 
								@RequestParam("page") int page) throws Exception {
		
		placeService.placeRemove(plc_no);
		return "redirect:location?loc_no="+ loc_no+ "&plc_category=" + plc_category + "&page=" + page;
	}
	
	@ResponseBody
	@RequestMapping(value="/deletePlaceReview/{rev_no}/{plc_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> placeReviewDelete(@PathVariable("rev_no")int rev_no, @PathVariable("plc_no")int plc_no) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			plc_ReviewService.reviewRemove(rev_no, plc_no);
			System.out.println("지우기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
			System.out.println("보냄~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			System.out.println("안보내짐~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		}		
		
		return entity;
	}
}
