package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.persistence.*;

import sun.print.resources.*;

@Service
public class CourseServiceImpl implements CourseService{
	
	@Inject
	private CourseDAO courseDAO;

	@Override
	public void create(CourseVO vo, List<Integer> plc_nos) throws Exception {
		courseDAO.create(vo, plc_nos);
		
	}

	@Override
	public CourseVO read(int cour_no) throws Exception {
		return courseDAO.read(cour_no);
	}

	@Override
	public void update(CourseVO vo,List<Integer> plc_nos) throws Exception {
		courseDAO.update(vo,plc_nos);
		
	}

	@Override
	public void delete(int cour_no) throws Exception {
		courseDAO.delete(cour_no);
	}

	@Override
	public List<CourseVO> listAll(Criteria cri) throws Exception {
		return courseDAO.listAll(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return courseDAO.countPaging(cri);
	}

	@Override
	public void totalScoreUpdate(int cour_no) throws Exception {
		courseDAO.totalScoreUpdate(cour_no);
	}

	@Override
	public List<PlaceVO> plcListAll(int cour_no) throws Exception {
		return courseDAO.plcListAll(cour_no);
	}

	@Override
	public List<CourseMainInfoDTO> courseTopList(int index) throws Exception {
		return courseDAO.courseTop(index);
	}

	@Override
	public List<CourseMainInfoDTO> myCourse(String mem_id) throws Exception {
		return courseDAO.myCourse(mem_id);
	}

	@Override
	public List<CourseMainInfoDTO2> myCourse2(String mem_id) throws Exception {
		return courseDAO.myCourse3(mem_id);
	}



	
	
	
}
