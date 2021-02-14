package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.persistence.*;
@Service
public class Course_ReviewServiceImpl implements Course_ReviewService {
	
	@Inject
	private Course_ReviewDAO dao;
	
	@Override
	public void create(Cour_reviewVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public List<Course_ReviewDTO> listAll(int cour_no, Criteria cri) throws Exception {
		return dao.listAll(cour_no, cri);
	}

	@Override
	public void delete(int rev_no) throws Exception {
		dao.delete(rev_no);
		
	}

	@Override
	public void update(Cour_reviewVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public int countPaging(int cour_no) throws Exception {
		return dao.countPaging(cour_no);
	}

	@Override
	public double totalScore(int cour_no) throws Exception {
		return dao.totalScore(cour_no);
	}

	@Override
	public Cour_reviewVO read(int rev_no) throws Exception {
		return dao.read(rev_no);
	}

}
