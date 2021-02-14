package com.ds.service;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface ThemeService {

	//�뀒留덈벑濡�
	public void regist(ThemeVO vo, List<Integer> list) throws Exception;
	//�뀒留� �씫湲�
	public ThemeVO read(int theme_no) throws Exception;
	//�뀒留� �닔�젙
	public void modify(ThemeVO vo,List<Integer> list) throws Exception;
	//�뀒留� �궘�젣
	public void remove(int theme_no) throws Exception;
	//�뀒留� �쟾泥� �씫�뼱�삤湲�
	public List<ThemeVO> listAll() throws Exception;
	//�뀒留� 3媛쒕쭔 �씫�뼱�삤湲�
	public List<ThemeVO> listTop(int num) throws Exception;
	//�뀒留� �옣�냼 移댁슫�듃 媛��닔 媛��졇�삤湲�
	public int themeCount(int theme_no) throws Exception;
	//�뀒留� 由ъ뒪�듃�럹�씠吏� 遺덈윭�삤湲�
	public List<ThemeVO> listPage(Criteria_Theme cri) throws Exception;
	//�뀒留� 移댁슫�듃 遺덈윭�삤湲�
	public int totalCount() throws Exception;
	
	public List<ThemeInfoDTO> myTheme(String mem_id) throws Exception;
	
	// 메인에 테마 랜덤정보 가져오기
	public List<ThemeVO> randomTheme() throws Exception;
}
