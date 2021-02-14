package com.ds.service;

import java.util.*;

import com.ds.domain.*;

public interface LocationService {
	
// location 등록
	public void locationRegist(LocationVO vo) throws Exception;

// location 조회
	public LocationVO locationRead(int loc_no) throws Exception;
	
// location 수정
	public void locationModify(LocationVO vo) throws Exception;
	
// location 리스트
	public List<LocationVO> locationListAll() throws Exception;

// location 삭제
	public void locationDelete(int loc_no) throws Exception;
	
}
