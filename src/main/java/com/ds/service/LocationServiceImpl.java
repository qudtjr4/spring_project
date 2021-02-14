package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class LocationServiceImpl implements LocationService{

	@Inject
	private LocationDAO dao;
	
	@Override
	public void locationRegist(LocationVO vo) throws Exception {
	
		dao.locationCreate(vo);
		
	}

	@Override
	public LocationVO locationRead(int loc_no) throws Exception {
		return dao.locationSelete(loc_no);
		
	}

	@Override
	public void locationModify(LocationVO vo) throws Exception {
		dao.locationUpdate(vo);
		
	}

	@Override
	public List<LocationVO> locationListAll() throws Exception {
		return dao.locationListAll();
	}

	@Transactional
	@Override
	public void locationDelete(int loc_no) throws Exception {
		dao.locationDelete1(loc_no);
		dao.locationDelete0_1(loc_no);
		dao.locationDelete0(loc_no);
		dao.locationDelete2(loc_no);
		dao.locationDelete3(loc_no);
		dao.locationDelete4(loc_no);
		dao.locationDelete5(loc_no);
		
	}



}
