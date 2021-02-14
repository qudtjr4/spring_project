package com.ds.test;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class LocationDAOTest {
	
	@Inject
	private LocationDAO locationDAO;
	
	@Test
	public void locationCreateTest() throws Exception{
		LocationVO vo = new LocationVO();
		vo.setLoc_name("테스트1");
		vo.setLoc_info("테스트1");
		vo.setLoc_img("테스트1");
		//locationDAO.create(vo);
	}
	
	@Test
	public void testLocationListAll() throws Exception{
		//locationDAO.listAll();
	}

}
