package com.ds.test;

import javax.inject.*;

import org.junit.*;
import org.junit.runner.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

import com.ds.domain.*;
import com.ds.service.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class LocationServiceTest {

	@Inject
	private LocationService locationService;
	
	@Test
	public void testLocationInputService() throws Exception{
		LocationVO vo = new LocationVO();
		vo.setLoc_name("����");
		vo.setLoc_info("����");
		vo.setLoc_img("����");
		//locationService.registerLocation(vo);
	}
	
	@Test
	public void testListAllLocation() throws Exception{
		//locationService.listAllLocation();
	}
}
