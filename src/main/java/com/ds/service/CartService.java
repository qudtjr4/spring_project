package com.ds.service;

import java.util.*;

import com.ds.domain.*;

public interface CartService {
	
	public List<Integer> listAll(String mem_id) throws Exception;
	public List<PlaceVO> listAll2(String mem_id) throws Exception;
	public String addCart(CartVO vo) throws Exception;
	public void removeCart(CartVO vo) throws Exception;
}
