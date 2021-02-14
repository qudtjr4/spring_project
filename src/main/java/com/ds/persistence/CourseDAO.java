package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface CourseDAO {
	
	// 코스 정보 추가하기
	public void create(CourseVO vo, List<Integer> plc_nos) throws Exception;
	
	// 코스 내용 읽기
	public CourseVO read(int cour_no) throws Exception;
	
	// 코스 수정하기
	public void update(CourseVO vo, List<Integer> plc_nos) throws Exception;
	
	// 코스 삭제하기
	public void delete(int cour_no) throws Exception;
	
	// 코스 리스트
	public List<CourseVO> listAll(Criteria cri) throws Exception;
	
	// 코스 갯수
	public int countPaging(Criteria cri) throws Exception;
	
	// 코스 점수 업데이트
	public void totalScoreUpdate(int cour_no) throws Exception;
	
	// 코스 장소 들고오기
	public List<PlaceVO> plcListAll(int cour_no) throws Exception;
	
	// 코스 TOP3 list 가져오기
	public List<CourseMainInfoDTO> courseTop (int index) throws Exception;
	
	// 나의 코스 가져오기
	public List<CourseMainInfoDTO> myCourse (String mem_id) throws Exception;
	
	//minseok
	public List<CourseMainInfoDTO2> myCourse3 (String mem_id) throws Exception;	
}
