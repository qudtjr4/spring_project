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
public class PlaceServiceTest {

	@Inject
	private PlaceService placeService;
	/*@Inject
	private MailService mService;*/
	@Test
	public void testRegisterPlace() throws Exception{
		/*PlaceVO vo = new PlaceVO();
		vo.setPlc_name("����");
		vo.setPlc_category("����");
		vo.setPlc_addr("����");
		vo.setPlc_tel("����");
		vo.setPlc_info("����");
		vo.setPlc_map_x(3);
		vo.setPlc_map_y(2);
		vo.setPlc_totalscore(1);
		vo.setPlc_time("����");
		vo.setPlc_hashtag("����");
		vo.setLoc_no(5);
		vo.setPlc_img("����");*/
		//placeService.registerPlace(vo);
		
		//mService.SendId("민석쨩", "rkaqudtjr@naver.com");
	}
}
