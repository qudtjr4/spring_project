package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface ThemeDAO {

	//테마 생성
	public void createTheme(ThemeVO vo,List<Integer> list) throws Exception;
	//테마 상세페이지 읽기
	public ThemeVO readTheme(int theme_no) throws Exception;
	//테마 수정
	public void updateTheme(ThemeVO vo) throws Exception;
	//테마 수정(장소)
	public void updatePlc_Theme(int theme_no,List<Integer> list) throws Exception;
	//테마삭제
	public void deleteTheme(int theme_no) throws Exception;
	//테마삭제(테마리뷰)
	public void deleteTheme_Review(int theme_no) throws Exception;
	//테마삭제(테마장소)
	public void deletePlc_Theme(int theme_no) throws Exception;
	//테마삭제(추천테마)
	public void deleteMem_Theme(int theme_no) throws Exception;
	
		
	//전체 테마 불러오기
	public List<ThemeVO> listAll() throws Exception;
	//테마 상위 num 불러오기
	public List<ThemeVO> listTop(int num) throws Exception;
	//테마 개수
	public int themeCount(int theme_no) throws Exception;
	//테마 페이지네이션
	public List<ThemeVO> listPage(Criteria_Theme cri) throws Exception;
	//테마 토탈 카운트
	public int totalCount() throws Exception;
	
	//--jemin--
	public List<ThemeInfoDTO> myTheme(String mem_id) throws Exception;
	
	// main화면에 랜덤 테마 정보 가져오기
	public List<ThemeVO> randomTheme() throws Exception;
	
}
