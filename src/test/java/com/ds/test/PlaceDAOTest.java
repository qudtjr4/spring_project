package com.ds.test;

import java.util.*;

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
public class PlaceDAOTest {

	@Inject
	private Plc_ReviewDAO reviewDAO;
	
	@Inject 
	private PlaceDAO placeDAO;
	
	@Test
	public void testReview() throws Exception{
		
		List<Place_ReviewDTO> list = reviewDAO.plcReviewRead(370);
		System.out.println("list : " + list );
	}
	
	@Test
	public void testPlaceInput() throws Exception{
		PlaceVO vo = new PlaceVO();
		vo.setPlc_name("�׽�Ʈ");
		vo.setPlc_category("�׽�Ʈ");
		vo.setPlc_addr("�׽�Ʈ");
		vo.setPlc_tel("�׽�Ʈ");
		vo.setPlc_info("�׽�Ʈ");
		vo.setPlc_map_x(1);
		vo.setPlc_map_y(2);
		vo.setPlc_totalscore(1);
		vo.setPlc_time("�׽�Ʈ");
		vo.setPlc_hashtag("�׽�Ʈ");
		vo.setLoc_no(5);
		vo.setPlc_img("�׽�Ʈ");
		//placeDAO.create(vo);
	}
	
	
}
