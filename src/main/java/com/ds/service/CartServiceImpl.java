package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO dao;
	
	@Override
	public List<Integer> listAll(String mem_id) throws Exception {
		return dao.listAll(mem_id);
	}

	@Override
	public List<PlaceVO> listAll2(String mem_id) throws Exception {
		return dao.listAll2(mem_id);
	}
	@Override
	public String addCart(CartVO vo) throws Exception {
		return dao.addCart(vo);
		
	}

	@Override
	public void removeCart(CartVO vo) throws Exception {
		dao.deleteCart(vo);
	}

}
