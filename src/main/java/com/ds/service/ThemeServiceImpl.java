package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.persistence.*;

@Service
public class ThemeServiceImpl implements ThemeService{

	
	@Inject
	private ThemeDAO dao;
	
	
	@Override
	public void regist(ThemeVO vo , List<Integer> list) throws Exception {
		dao.createTheme(vo, list);
		
	}

	@Override
	public ThemeVO read(int theme_no) throws Exception {
		ThemeVO vo = dao.readTheme(theme_no);
		return vo;
	}

	@Override
	public void modify(ThemeVO vo,List<Integer> list) throws Exception {
		dao.updateTheme(vo);
		dao.deletePlc_Theme(vo.getTheme_no());
		dao.updatePlc_Theme(vo.getTheme_no(), list);
		
	}
	//�듃�옖�젥�뀡 (�뀒留� �궘�젣!)
	@Transactional
	@Override
	public void remove(int theme_no) throws Exception {
		dao.deleteTheme_Review(theme_no);
		dao.deletePlc_Theme(theme_no);
		dao.deleteMem_Theme(theme_no);
		dao.deleteTheme(theme_no);
	}

	@Override
	public List<ThemeVO> listAll() throws Exception {
		
		
		return dao.listAll();
	}

	@Override
	public List<ThemeVO> listTop(int num) throws Exception {
		return dao.listTop(num);
	}

	@Override
	public int themeCount(int theme_no) throws Exception {
		return dao.themeCount(theme_no);
	}

	@Override
	public List<ThemeVO> listPage(Criteria_Theme cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int totalCount() throws Exception {
		return dao.totalCount();
	}

	@Override
	public List<ThemeInfoDTO> myTheme(String mem_id) throws Exception {
		return dao.myTheme(mem_id);
	}
	
	// 메인에 테마 랜덤 정보 가져오기
	@Override
	public List<ThemeVO> randomTheme() throws Exception {
		
		return dao.randomTheme();
	}


}
