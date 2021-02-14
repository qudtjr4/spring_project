package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class Plc_ReviewDAOImpl implements Plc_ReviewDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.ds.mappers.plc_ReviewMapper";
	
	@Override
	public List<Place_ReviewDTO> plcReviewRead(int plc_no) throws Exception {
		
		return session.selectList(namespace + ".readPlc_review", plc_no);
	}

	@Override
	public void plcReviewCreate(Plc_ReviewVO vo) throws Exception {

		session.insert(namespace + ".create", vo);
	}

	@Override
	public void plcReviewUpdate(Plc_ReviewVO vo) throws Exception {
		
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void plcReviewDelete(int rev_no) throws Exception {
		
		session.delete(namespace + ".delete", rev_no);
	}

	@Override
	public Plc_ReviewVO plcReviewReadOne(int rev_no) throws Exception {
		
		return session.selectOne(namespace + ".read", rev_no);
	}

	@Override
	public void updateTotalScore(int plc_no) throws Exception {
		session.update(namespace + ".updateTotalScore", plc_no);
		
	}

}
