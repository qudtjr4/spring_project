package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface LocationDAO {

	// location 등록
	public void locationCreate(LocationVO vo) throws Exception;

	// location 검색
	public LocationVO locationSelete(int loc_no) throws Exception;

	// location 수정
	public void locationUpdate(LocationVO vo) throws Exception;

	// location 삭제
	public void locationDelete1(int loc_no) throws Exception;
	public void locationDelete2(int loc_no) throws Exception;
	public void locationDelete3(int loc_no) throws Exception;
	public void locationDelete4(int loc_no) throws Exception;
	public void locationDelete5(int loc_no) throws Exception;
	public void locationDelete0(int loc_no) throws Exception;
	public void locationDelete0_1(int loc_no) throws Exception;

	// location 정보 불러오기
	public List<LocationVO> locationListAll() throws Exception;

	public void deleteImgOne(String fullName) throws Exception;

}
