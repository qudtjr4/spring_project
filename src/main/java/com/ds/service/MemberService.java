package com.ds.service;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface MemberService {

	
	public void memberJoin(MemberVO vo) throws Exception;
	
	public List<MemberVO> memberList() throws Exception; 
	
	//min : writerInfo 
	public MemberVO myInfoContext(String mem_id) throws Exception;
	
	public void modifyInfo(MemberVO vo) throws Exception;
	
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public int idCheckCount(String mem_id) throws Exception;
	
	public boolean idAndEmail(String mem_id, String mem_email) throws Exception;
	
	public void setPassword(String mem_pw,String mem_id)throws Exception;
	
	// 블라인드 적용
		public void blindTrue(String mem_id) throws Exception;
		
		// 블라인드 해지
		public void blindFalse(String mem_id) throws Exception;
}
