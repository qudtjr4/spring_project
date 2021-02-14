package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.ds.persistence.*;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	private MemberDAO memberDAO;
	

	@Override
	public void memberJoin(MemberVO vo) throws Exception {
		memberDAO.join(vo);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return memberDAO.listAll();
	}
	@Override
	public MemberVO myInfoContext(String mem_id) throws Exception {

		return memberDAO.myInfo(mem_id);
	}

	@Override
	public void modifyInfo(MemberVO vo) throws Exception {
		memberDAO.update(vo);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return memberDAO.login(dto);
	}

	@Override
	public int idCheckCount(String mem_id) throws Exception {
		return memberDAO.idCheckCount(mem_id);
	}

	@Override
	public boolean idAndEmail(String mem_id, String mem_email) throws Exception {
		return memberDAO.idAndEmailCheck(mem_id, mem_email);
	}

	@Override
	public void setPassword(String mem_pw,String mem_id) throws Exception {
		memberDAO.setPassword(mem_pw,mem_id);
		
	}

	@Override
	public void blindTrue(String mem_id) throws Exception {
		memberDAO.blindTrue(mem_id);
		
	}

	@Override
	public void blindFalse(String mem_id) throws Exception {
		memberDAO.blindFalse(mem_id);
		
	}
}
