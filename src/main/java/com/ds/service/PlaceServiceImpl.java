package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class PlaceServiceImpl implements PlaceService{

	@Inject
	private PlaceDAO dao;

	@Override
	public void placeRegist(PlaceVO vo, List<String> list) throws Exception {
		dao.placeCreate(vo, list);
		
	}

	@Override
	public PlaceVO placeRead(int plc_no) throws Exception {
		
		return dao.placeRead(plc_no);
	}

	@Override
	public void placeModify(PlaceVO vo) throws Exception {
		dao.placeUpdate(vo);
		
	}

	@Transactional
	@Override
	public void placeRemove(int plc_no) throws Exception {
		dao.placeDelete1(plc_no);
		dao.placeDelete2(plc_no);
		dao.placeDelete3(plc_no);
		dao.placeDelete4(plc_no);
		dao.placeDelete5(plc_no);
		dao.placeDelete6(plc_no);
		
	}

	@Override
	public List<PlaceVO> placeListAll(int loc_no, Criteria_Place cri, String plc_category) throws Exception {
		
		return dao.placeListAll(loc_no, cri,plc_category);
	}

	@Override
	public List<PlaceVO> placeBestStay(int loc_no) throws Exception {
		return dao.placeBestStay(loc_no);
	}

	@Override
	public List<PlaceVO> placeBestAttraction(int loc_no) throws Exception {

		return dao.placeBestAttraction(loc_no);
	}

	@Override
	public List<PlaceVO> placeBestRestaurant(int loc_no) throws Exception {
		return dao.placeBestRestaurant(loc_no);
	}

	@Override
	public int placeCount(int loc_no) throws Exception {
		return dao.placeCount(loc_no);
	}

	@Override
	public List<PlaceVO> placeCategory(int loc_no, String plc_category, Criteria cri) throws Exception {
		
		return dao.placeCategory(loc_no, plc_category, cri);
	}
	
	@Override
	public List<PlaceVO> bestPlace() throws Exception {
		
		return dao.bestPlace();
	}

//min
	@Override
	public List<PlaceVO> plc_ThemeList(int theme_no) throws Exception {
		
		return dao.plc_ThemeList(theme_no); 
	}

	@Override
	public List<PlaceVO> cartPlaceList(String mem_id) throws Exception {
		return dao.cartPlaceList(mem_id);
	}

	@Override
	public List<PlaceVO> cartPlaceListMinusPlc_ThemeList(String mem_id, int theme_no) throws Exception {

		return dao.cartPlaceListMinusPlc_ThemeList(mem_id, theme_no);
	}

	
	
	

}
