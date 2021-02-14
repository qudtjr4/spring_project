package com.ds.controller;




import java.util.*;

import javax.inject.*;
import javax.servlet.http.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.service.*;


@Controller
@RequestMapping("/course/*")
public class CourseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Inject
	private CourseService service;
	
	
	@Inject
	private Course_ReviewService reviewService;
	
	@Inject
	private CartService cartService;
	
	@Inject
	private PlaceService placeServise;
		
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String mianGET(Criteria cri, Model model) throws Exception {
		// 코스 메인화면 GET
		System.out.println("maincri : " + cri);
		
		List<CourseMainInfoDTO> list = new ArrayList<>();
		List<CourseVO> listCourse = service.listAll(cri);
		for(CourseVO cVO :listCourse){
			CourseMainInfoDTO dto = new CourseMainInfoDTO();
			dto.setCour_days(cVO.getCour_days());
			dto.setCour_hashtag(cVO.getCour_hashtag());
			dto.setCour_no(cVO.getCour_no());
			dto.setCour_title(cVO.getCour_title());
			dto.setCour_totalscore(cVO.getCour_totalscore());
			dto.setMem_id(cVO.getMem_id());
			List<String> listPlcImg = new ArrayList<>();
			List<PlaceVO> listPlace = service.plcListAll(cVO.getCour_no());
			for(PlaceVO pVO :listPlace) {
				listPlcImg.add(pVO.getPlc_img());
			}
			int reviewCount = reviewService.countPaging(cVO.getCour_no());
			dto.setReviewCount(reviewCount);
			dto.setListPlcImg(listPlcImg);
			list.add(dto);
		}
		System.out.println("list : " + list);
		
		model.addAttribute("list", list);
		
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriAndTotalCount(cri, service.countPaging(cri));
		System.out.println("mainpageMaker : " + pageMaker);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/course/course_main";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detailGET(Criteria cri,@RequestParam("cour_no") int cour_no, Model model) throws Exception {
		// 코스 세부정보 GET
		CourseVO vo = service.read(cour_no); // 코스 정보
		model.addAttribute("courseVO",vo);
		
		List<Course_ReviewDTO> listReview = reviewService.listAll(cour_no,cri); // 리뷰 리스트
			
		model.addAttribute("listReview", listReview);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriAndTotalCount(cri, reviewService.countPaging(cour_no));
		//System.out.println("reviewService.countPaging : " + reviewService.countPaging(cour_no));
		model.addAttribute("pageMaker", pageMaker);
		
		List<PlaceVO> listPlace = service.plcListAll(cour_no);
		model.addAttribute("listPlace", listPlace);
		
//		System.out.println("listPlace : " + listPlace);
		
		
		int listPlaceSize = listPlace.size();
		model.addAttribute("listPlaceSize", listPlaceSize);
		
		List<Double> listPointX = new ArrayList<>();
		List<Double> listPointY = new ArrayList<>();
		List<String> listPlcName = new ArrayList<>();
		
		for(int i = 0; i < listPlaceSize; i++) {
			listPointX.add(listPlace.get(i).getPlc_map_x());
			listPointY.add(listPlace.get(i).getPlc_map_y());
			String name = '"' + listPlace.get(i).getPlc_name() + '"';
			System.out.println("name : " + name);
			listPlcName.add(name);
		}
		System.out.println("listPlcName : " + listPlcName);
		model.addAttribute("listPlcName", listPlcName);
		model.addAttribute("listPointX", listPointX);
		model.addAttribute("listPointY", listPointY);
		

		return "/course/course_detail";
	}
	
	@Transactional
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String courseAddGET(HttpServletRequest request, Model model) throws Exception {
		// 코스 추가 GET
		
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
				List<PlaceVO> list_plc = cartService.listAll2(mem_id);
				model.addAttribute("list_plc", list_plc);
				model.addAttribute("mem_id",mem_id);
				return "/course/course_add";
			}
		}
		
		
		
		
		
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String courseAddPOST(CourseVO courseVo, @RequestParam("cour_plc_no") List<Integer> plc_nos) throws Exception {
		// 코스정보 저장 POST -> cour_no -> 코스 장소 저장
		service.create(courseVo, plc_nos);
		return "redirect:/course/main?page=1";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("cour_no") int cour_no,HttpServletRequest request, Model model) throws Exception{
		
		// 코스 추가 GET
		
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
						// 코스수정 GET
						// 카트 장소VO 받아서 보내기
						List<PlaceVO> cart_list_plc = cartService.listAll2(mem_id);
						model.addAttribute("cart_list_plc", cart_list_plc);
						model.addAttribute("mem_id",mem_id);
						// 코스 내용VO 받아서 보내기
						CourseVO vo = service.read(cour_no);
						model.addAttribute("CourseVO", vo);
						// 코스 장소VO 받아서 보내기
						List<PlaceVO> listPlace = service.plcListAll(cour_no);
						model.addAttribute("listPlace", listPlace);
						
						
						return "/course/course_modify";
					}
				}
		
		
		
		
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(CourseVO courseVo, @RequestParam("cour_plc_no") List<Integer> plc_nos) throws Exception{
		// 수정 POST
		// 코스 내용 업로드
		service.update(courseVo, plc_nos);
		// 코스 장소 업로드
		return "redirect:/course/main?page=1";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(@RequestParam("cour_no") int cour_no) throws Exception{
		// 코스 삭제 GET
		// TODO : 비밀번호 체킹 
		service.delete(cour_no);
		return "redirect:/course/main?page=1";
	}
	
	@Transactional
	@RequestMapping(value = "/AddCourseReview", method = RequestMethod.POST)
	public String addCourseReviewPOST(Cour_reviewVO vo,Criteria cri) throws Exception{
		//리뷰등록 POST
		reviewService.create(vo);
		service.totalScoreUpdate(vo.getCour_no());
		return "redirect:/course/detail?cour_no=" + vo.getCour_no() + "&page=" + cri.getPage();
	}
	
	@RequestMapping(value = "/ModifyCourseReview", method = RequestMethod.POST)
	public String modifyReviewPOST(Cour_reviewVO vo,Criteria cri) throws Exception{
		// 댓글 수정하기 POST
		reviewService.update(vo);
		service.totalScoreUpdate(vo.getCour_no());
		int cour_no = vo.getCour_no();
		return "redirect:/course/detail?cour_no=" + cour_no + "&page=" + cri.getPage();
	}
	
	@ResponseBody
	@RequestMapping(value="/reviewModify/{rev_no}", method=RequestMethod.GET)
	public Cour_reviewVO getReviewModify(@PathVariable("rev_no") int rev_no) throws Exception{
		return reviewService.read(rev_no);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteCourseReview/{rev_no}/{cour_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> deleteCourseReview(@PathVariable("rev_no") int rev_no,@PathVariable("cour_no") int cour_no) throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			reviewService.delete(rev_no);
			//System.out.println("=========================댓글지우기==========================");
			service.totalScoreUpdate(cour_no);
			//System.out.println("=========================리뷰평균업데이트==========================");
			entity = new ResponseEntity<String>(
					"SUCCESS", HttpStatus.OK);
			//System.out.println("=========================entity보냄o==========================");
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
			//System.out.println("=========================entity보냄x==========================");
		}
		
		return entity;
	}
	
	
}
