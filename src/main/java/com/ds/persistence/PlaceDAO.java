package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface PlaceDAO {

// place 장소등록
	public void placeCreate(PlaceVO vo, List<String> list) throws Exception;
	
// place 장소정보 불러오기
	public PlaceVO placeRead(int plc_no) throws Exception;
	
// place 장소 업데이트
	public void placeUpdate(PlaceVO vo) throws Exception;
	
// place 장소 삭제
	public void placeDelete(int plc_no) throws Exception;
	
// place 장소 리스트
	public List<PlaceVO> placeListAll(int loc_no, Criteria_Place cri, String plc_category) throws Exception;
	
// 장소 조회 카운트
	public int placeCount(int loc_no) throws Exception;
	
// plcae 
	public List<PlaceVO> placeBestStay(int loc_no) throws Exception;
	public List<PlaceVO> placeBestAttraction(int loc_no) throws Exception;
	public List<PlaceVO> placeBestRestaurant(int loc_no) throws Exception;
	
// 카테고리별 리스트 가져오기
	public List<PlaceVO> placeCategory(int loc_no, String plc_category, Criteria cri) throws Exception;
	
// 베스트 플레이스 불러오기
	public List<PlaceVO> bestPlace() throws Exception;
	
// min	
	//테마에 저장된 장소 불러오기
	public List<PlaceVO> plc_ThemeList(int theme_no) throws Exception;
	//테마 만들기 할때 카트에 담은 장소 리스트 불러오기
	public List<PlaceVO> cartPlaceList(String mem_id) throws Exception;
	
	//선택한 장소 - 테마에 저장된 장소
	public List<PlaceVO> cartPlaceListMinusPlc_ThemeList(String mem_id,int theme_no) throws Exception;
	
	
	// place 삭제
		public void placeDelete1(int plc_no) throws Exception;
		public void placeDelete2(int plc_no) throws Exception;
		public void placeDelete3(int plc_no) throws Exception;
		public void placeDelete4(int plc_no) throws Exception;
		public void placeDelete5(int plc_no) throws Exception;
		public void placeDelete6(int plc_no) throws Exception;	
}
