package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.Transactional;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class Plc_ReviewServiceImpl implements Plc_ReviewService{

	@Inject 
	private Plc_ReviewDAO dao;

	@Transactional
	@Override
	public void reviewRegist(Plc_ReviewVO vo) throws Exception {
		
		dao.plcReviewCreate(vo);
		dao.updateTotalScore(vo.getPlc_no());
	}

	@Override
	public List<Place_ReviewDTO> reviewRead(int plc_no) throws Exception {
		
		return dao.plcReviewRead(plc_no);
	}

	@Transactional
	@Override
	public void reviewModify(Plc_ReviewVO vo) throws Exception {
		dao.plcReviewUpdate(vo);
		dao.updateTotalScore(vo.getPlc_no());
	}

	@Transactional
	@Override
	public void reviewRemove(int rev_no, int plc_no) throws Exception {
		dao.plcReviewDelete(rev_no);
		dao.updateTotalScore(plc_no);
	}

	@Override
	public Plc_ReviewVO reviewReadOne(int rev_no) throws Exception {
		
		return dao.plcReviewReadOne(rev_no);
	}



}
