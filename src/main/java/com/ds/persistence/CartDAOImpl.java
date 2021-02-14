package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ds.mappers.cartMapper";

	@Override
	public List<Integer> listAll(String mem_id) throws Exception { //
		return sqlSession.selectList(namespace + ".listAll", mem_id);
	}

	@Override
	public List<PlaceVO> listAll2(String mem_id) throws Exception {
		return sqlSession.selectList(namespace + ".listAll2", mem_id);
	}

	//īƮ�� ���
	public String addCart(CartVO vo) throws Exception{
		List<CartVO> list = sqlSession.selectList(namespace+".checkAdd",vo);
		if(list.isEmpty()){
			sqlSession.insert(namespace+".addCart",vo);
			return "SUCCESS";
		}else{
			return "FAIL";
		}
	}

	@Override
	public void deleteCart(CartVO vo) throws Exception {
		sqlSession.delete(namespace + ".deleteCart", vo);
	}
}
