package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.persistence.*;

@Service
public class Theme_ReviewServiceImpl implements Theme_ReviewService{

	@Inject
	private Theme_ReviewDAO dao;
	
	@Override
	public List<Theme_ReviewDTO> revListAll(int theme_no) throws Exception {
		return dao.theme_ReviewListAll(theme_no);
	}

	@Transactional
	@Override
	public void addTheme_Review(Theme_ReviewVO vo) throws Exception {
		dao.addTheme_Review(vo);
		dao.updateTotalScore(vo.getTheme_no());
		
	}

	@Override
	public Theme_ReviewVO readReview(int rev_no) throws Exception {
		return dao.readReview(rev_no);
	}
	
	@Transactional
	@Override
	public void theme_ReviewModify(Theme_ReviewVO vo) throws Exception {
		dao.theme_ReviewModify(vo);
		dao.updateTotalScore(vo.getTheme_no());
	}

	@Transactional
	@Override
	public void theme_ReviewDelete(int rev_no, int theme_no) throws Exception {
		dao.theme_ReviewDelete(rev_no);
		dao.updateTotalScore(theme_no);
	}

}
