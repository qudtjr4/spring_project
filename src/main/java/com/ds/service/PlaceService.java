package com.ds.service;

import java.util.*;

import com.ds.domain.*;

public interface PlaceService {

// place �벑濡�
	public void placeRegist(PlaceVO vo, List<String> list) throws Exception;
	
// place 議고쉶
	public PlaceVO placeRead(int plc_no) throws Exception;
	
// place �닔�젙
	public void placeModify(PlaceVO vo) throws Exception;
	
// place �궘�젣
	public void placeRemove(int plc_no) throws Exception;
	
// place 由ъ뒪�듃 
	public List<PlaceVO> placeListAll(int loc_no, Criteria_Place cri, String plc_category) throws Exception;
	
// 移댁슫�똿
	public int placeCount(int loc_no) throws Exception;
	
// place 移댄뀒怨좊━ best
	public List<PlaceVO> placeBestStay(int loc_no) throws Exception;
	public List<PlaceVO> placeBestAttraction(int loc_no) throws Exception;
	public List<PlaceVO> placeBestRestaurant(int loc_no) throws Exception;
	
// place 移댄뀒怨좊━
	public List<PlaceVO> placeCategory(int loc_no, String plc_category, Criteria cri) throws Exception;
	
// 메인에 베스트 플레이스
	public List<PlaceVO> bestPlace() throws Exception;
	
//min
	public List<PlaceVO> plc_ThemeList(int theme_no) throws Exception;
	
	public List<PlaceVO> cartPlaceList(String mem_id) throws Exception;
	
	public List<PlaceVO> cartPlaceListMinusPlc_ThemeList(String mem_id, int theme_no) throws Exception;
	
	
}
