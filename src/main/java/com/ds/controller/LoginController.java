package com.ds.controller;

import java.util.*;

import javax.inject.*;
import javax.servlet.http.*;

import org.apache.commons.collections4.map.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.service.*;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	@Inject
	private MemberService memberService;
	
	
	@Inject
	private CartService cartService;
	@Inject
	private CourseService courseService;
	@Inject
	private ThemeService themeService;
	@Inject
	private MailService mailService;
	
	
	//비밀번호 찾기 페이지
	@RequestMapping(value="/find", method = RequestMethod.GET)
	public void findPassword2() throws Exception{
		
	}
	
	//비밀번호 찾기 처리
	@RequestMapping(value="/findPassword", method = RequestMethod.POST)
	public String findPassword(@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_email") String mem_email,
			RedirectAttributes rttr
			) throws Exception{
		if(memberService.idAndEmail(mem_id, mem_email) == true){
			
			String mem_pw = mailService.SendId(mem_id, mem_email);
			memberService.setPassword(mem_pw, mem_id);
			rttr.addFlashAttribute("msg1","success");
			return "redirect:/";
		}else{
			rttr.addFlashAttribute("msg1","fail");
			return "redirect:/"; 
		}
	}
	
	//회원가입 페이지
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET) 
	public void join(Model model) throws Exception {
		
	}
	
	@ResponseBody //아이디 중복여부 처리
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST) 
	public String idCheck(Model model , @RequestParam("mem_id") String mem_id) throws Exception {
		
		int count = memberService.idCheckCount(mem_id);
		
		if (count == 0) {
			return "success";
		}
		return "fail";
	}
	
	
	//가입처리
	@RequestMapping(value = "/joinRun", method = RequestMethod.POST)
	public String joinRun(MemberVO vo, Model model) throws Exception{
		memberService.memberJoin(vo);
		return "redirect:/";
		
	}
	
	
	//로그인 처리
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST) 
	public String loginRun(
			LoginDTO dto,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response,
			RedirectAttributes rttr,
			@RequestParam("addr") String addr
			) throws Exception {

		
		Map<String, Object> loginMap = null; 
		loginMap = new HashMap<>();// map <- service - dao
		HttpSession loginSession = request.getSession();
		Cookie[] cookies = request.getCookies();
		
	
		
		for (Cookie cookie : cookies) {
			String name = cookie.getName();
			String val = cookie.getValue();
			System.out.println(name + ":" + val);
		}
		
		System.out.println(dto.isUseCookie());

		MemberVO memberVO = memberService.login(dto);
		
		if (memberVO != null) {
			int blind = memberVO.getMem_blind();
			System.out.println("blind :" + blind);
			if(blind == 0){
			
			loginMap.put("mem_id", dto.getMem_id());
			loginSession.setAttribute("login", loginMap);
			if (dto.isUseCookie()) {
				System.out.println("--------------------------cookie");
				Cookie cookie1 = new Cookie("isUseCookie", String.valueOf(dto.isUseCookie()));
				cookie1.setMaxAge(60 * 60 * 24 * 7);
				cookie1.setPath("/");
				Cookie cookie2 = new Cookie("mem_id", dto.getMem_id());
				cookie2.setMaxAge(60 * 60 * 24 * 7);
				cookie2.setPath("/");
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			return "redirect:"+addr;
			
			}
			
			
			else if(blind == 1){
//				System.out.println("login : " + loginMap);
				rttr.addFlashAttribute("msg2", "fail2");
				return "redirect:/";
			}
		}
		
//		System.out.println("login : " + loginMap);
		rttr.addFlashAttribute("msg", "fail");
		
		return "redirect:/";
		
	}
	
	
	//관리자 로그인 처리
		@RequestMapping(value = "/adminRun", method = RequestMethod.POST)  //������ �α���ó��
		public void adminRun(
				@RequestParam("mem_id") String mem_id,
				@RequestParam("mem_pw") String mem_pw,
				HttpServletRequest request
				) throws Exception {
			
			String db_id = "admin";
			String db_pw = "1234";
			
			Map<String, Object> loginMap = null; 
			
			if (mem_id.equals(db_id) && mem_pw.equals(db_pw)) {
				loginMap = new HashMap<>();// map <- service - dao
				loginMap.put("mem_id", mem_id);
				HttpSession loginSession = request.getSession();
				loginSession.setAttribute("login", loginMap);
			}
	}

	//로그아웃 처리	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logout(HttpServletRequest request,
			@RequestParam("addr1") String addr1
			) throws Exception{
		HttpSession loginSession = request.getSession();
		System.out.println("loginSession:" + loginSession);
		loginSession.invalidate();
		return "redirect:" + addr1;
		
	}
	
	//마이코스 페이지 
	@SuppressWarnings("unused")
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)  
	public String myPage(Model model, HttpServletRequest request) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "redirect:/";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "redirect:/";
			}else{
				model.addAttribute("CourseList",courseService.myCourse2(mem_id));
				System.out.println("courseList : " + courseService.myCourse2(mem_id));
				model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
				return "/login/myPage";
			}
		}
	}
	
	//마이테마 페이지
	@RequestMapping(value = "/myPage2", method =RequestMethod.GET)
	public String myPage2(Model model, HttpServletRequest request) throws Exception{
		HttpSession loginSession = request.getSession();
		Map<String,Object> map =(Map<String, Object>)loginSession.getAttribute("login");
		if(map==null){
			return "redirect:/";
		}else{
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if(mem_id ==null){
				return "redirect:/";
			}else{
				model.addAttribute("ThemeList",themeService.myTheme(mem_id));
				System.out.println("myThemeList : " + themeService.myTheme(mem_id));
				model.addAttribute("MemberVO", memberService.myInfoContext(mem_id));
				return "/login/myPage2";
			}
		}
		
	}
	
	//마이카트 페이지
	@RequestMapping(value = "/myCart", method = RequestMethod.GET) // ����īƮ ������
	public String myCart(HttpServletRequest request, Model model) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "redirect:/";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "redirect:/";
			}else{
				System.out.println("PlaceList : " + cartService.listAll2(mem_id));
				model.addAttribute("PlaceList",cartService.listAll2(mem_id));
				
				model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
				return "/login/myCart";
			}
		}
		
	} 
	
	//마이카트 삭제
	@RequestMapping(value= "/myCartDelete" ,method = RequestMethod.GET)
	public String myCartDelete(HttpServletRequest request, CartVO vo, Model model) throws Exception{
		HttpSession loginSession = request.getSession();
		Map<String,Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if(map == null){
			return "redirect:/";
		}else{
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if(mem_id == null){
				return "redirect:/";
			}else{
				cartService.removeCart(vo); 
				System.out.println("PlaceList : " + cartService.listAll2(mem_id));
				model.addAttribute("PlaceList" , cartService.listAll2(mem_id));
				
				model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
				return "/login/myCart";
			}
		}
		
	}
	
	//나의정보 페이지
	@RequestMapping(value = "/myInfo", method = RequestMethod.GET)
	public String myModifyInfoGET(HttpServletRequest request, Model model ) throws Exception {
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "redirect:/";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "redirect:/";
			}else{
				model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
				return "/login/myInfo";
			}
		}
	}
	
	//나의정보 수정처리
	@RequestMapping(value = "/myModifyInfo", method = RequestMethod.POST)
	public String myModifyInfoPOST(HttpServletRequest request,
								   MemberVO vo,
								   Model model) throws Exception{
		
		HttpSession loginSession = request.getSession();
		Map<String, Object> map = (Map<String, Object>)loginSession.getAttribute("login");
		if (map == null) {
			return "redirect:/";
		} else {
			String mem_id = null;
			mem_id = (String) map.get("mem_id");
			
			if ( mem_id == null) {
				return "redirect:/";
			}else{
				vo.setMem_id(mem_id);
				memberService.modifyInfo(vo);
				model.addAttribute("MemberVO",memberService.myInfoContext(mem_id));
				return "redirect:/login/myInfo";
			}
		}
	}
	
}
