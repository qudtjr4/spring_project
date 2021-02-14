package com.ds.test;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.service.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberServiceTest {

	@Inject
	private MemberService memberService;
	
	@Test
	public void testJoinService() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMem_id("serviceId1");
		vo.setMem_pw("1234");
		vo.setMem_name("serviceName1");
		vo.setMem_email("serviceEmail@naver.com");
		memberService.memberJoin(vo);
	}
	
	@Test
	public void testMemberListAll() throws Exception{
		memberService.memberList();
	}
	@Test
	public void testMyInfoContext() throws Exception{
		memberService.myInfoContext("park");
	}
	
	
	@Test
	public void testmodifyInfo() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMem_pw("12");
		vo.setMem_name("서비스수정");
		vo.setMem_email("서비스수정메일");
		vo.setMem_id("park");
		memberService.modifyInfo(vo);
	}
	
}
