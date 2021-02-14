package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;

@Repository
public class Theme_ReviewDAOImpl implements Theme_ReviewDAO{

	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "com.ds.mappers.theme_ReviewMapper";
	
	@Override
	public List<Theme_ReviewDTO> theme_ReviewListAll(int theme_no) throws Exception {
		
		
		return sqlSession.selectList(namespace+".theme_ReviewListAll", theme_no);
	}

	@Override
	public void addTheme_Review(Theme_ReviewVO vo) throws Exception {
		sqlSession.insert(namespace + ".addTheme_Review", vo);
		
		
	}

	@Override
	public void updateTotalScore(int theme_no) throws Exception {
		sqlSession.update(namespace + ".updateTotalScore", theme_no);
	}

	@Override
	public Theme_ReviewVO readReview(int rev_no) throws Exception {
		return sqlSession.selectOne(namespace +".read",rev_no);
	}

	@Override
	public void theme_ReviewModify(Theme_ReviewVO vo) throws Exception {
		sqlSession.update(namespace + ".theme_ReviewModify", vo);
		
	}

	@Override
	public void theme_ReviewDelete(int rev_no) throws Exception {
		sqlSession.delete(namespace+".theme_ReviewDelete", rev_no);
		
	}

}
