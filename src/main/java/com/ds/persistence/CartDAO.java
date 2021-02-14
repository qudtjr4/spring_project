package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface CartDAO {
	
	public List<Integer> listAll(String mem_id) throws Exception; //���� �� īƮ �ѹ�����
	public List<PlaceVO> listAll2(String mem_id) throws Exception; //���� �� īƮ �ѹ�����
	public String addCart(CartVO vo) throws Exception;
	public void deleteCart(CartVO vo) throws Exception;
	
}
