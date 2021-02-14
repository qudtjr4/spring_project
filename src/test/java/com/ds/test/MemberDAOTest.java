package com.ds.test;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.persistence.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MemberDAOTest {
	
	@Inject
	private MemberDAO memberDAO;
	
	
	@Test
	public void testJoin() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMem_id("park");
		vo.setMem_pw("1234");
		vo.setMem_name("jemin");
		vo.setMem_email("park@naver.com");
		memberDAO.join(vo);
	}

	@Test
	public void testMemberList() throws Exception{
		memberDAO.idAndEmailCheck("admin", "111@11");
	}
	
	@Test
	public void testMyInfoContext() throws Exception{
		memberDAO.myInfo("park");
	}
	
	
	@Test
	public void testMemberModify() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMem_pw("123");
		vo.setMem_name("������ ȫ");
		vo.setMem_email("������ �̸���");
		vo.setMem_id("park");
		memberDAO.update(vo);
	}
	
	@Test
	public void testCheckId() throws Exception{
		 memberDAO.idCheckCount("admin");
		
	}
}
