package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface MemberDAO {
	
	//ȸ������
	public void join(MemberVO vo) throws Exception;
	
	//��ϵ� ��� ����
	public List<MemberVO> listAll() throws Exception;
	
	// ������ ����
	public MemberVO myInfo(String mem_id) throws Exception;
	
	// ������ ����
	public void update(MemberVO vo) throws Exception;
	
	// �α��� ���� �ҷ�����
	public MemberVO login(LoginDTO dto) throws Exception;
	
	public int idCheckCount(String mem_id) throws Exception;
	
	public boolean idAndEmailCheck(String mem_id, String mem_email) throws Exception;
	
	public void setPassword(String mem_pw,String mem_id)throws Exception;

	// 블라인드 적용
	public void blindTrue(String mem_id) throws Exception;
	
	// 블라인드 해지
	public void blindFalse(String mem_id) throws Exception;
	
}
