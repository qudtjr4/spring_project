package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class LocationDAOImpl implements LocationDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.ds.mappers.locationMapper";

	@Override
	public void locationCreate(LocationVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
	}

	@Override
	public LocationVO locationSelete(int loc_no) throws Exception {
		return session.selectOne(namespace + ".read", loc_no);
	}

	
	@Override
	public List<LocationVO> locationListAll() throws Exception {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public void locationUpdate(LocationVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void locationDelete1(int loc_no) throws Exception {
		session.delete(namespace + ".delete1", loc_no);
		
	}

	@Override
	public void locationDelete2(int loc_no) throws Exception {
		session.delete(namespace + ".delete2", loc_no);
		
	}

	@Override
	public void locationDelete3(int loc_no) throws Exception {
		session.delete(namespace + ".delete3", loc_no);
	}

	@Override
	public void locationDelete4(int loc_no) throws Exception {
		session.delete(namespace + ".delete4", loc_no);
		
	}

	@Override
	public void locationDelete5(int loc_no) throws Exception {
		session.delete(namespace + ".delete5", loc_no);
		
	}

	@Override
	public void locationDelete0(int loc_no) throws Exception {
		session.delete(namespace + ".delete0", loc_no);
		
	}

	@Override
	public void locationDelete0_1(int loc_no) throws Exception {
		session.delete(namespace + ".delete0_1", loc_no);
		
	}

	@Override
	public void deleteImgOne(String fullName) throws Exception {
		// TODO Auto-generated method stub
		
	} 
	
	
	

}
