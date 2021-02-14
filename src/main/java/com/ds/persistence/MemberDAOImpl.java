package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String namespace = "com.ds.mappers.memberMapper";

	@Inject
	private SqlSession sqlSession;
	

	@Override
	public void join(MemberVO vo) throws Exception {
		sqlSession.insert(namespace + ".join", vo);
	}

	@Override
	public List<MemberVO> listAll() throws Exception {
		return sqlSession.selectList(namespace + ".memberList");
	}

	@Override
	public MemberVO myInfo(String mem_id) throws Exception {
		return sqlSession.selectOne(namespace + ".myInfoContext", mem_id);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		sqlSession.update(namespace + ".modify", vo);
	}

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		
		return sqlSession.selectOne(namespace + ".login", dto);
	}

	@Override
	public int idCheckCount(String mem_id) throws Exception {
		return sqlSession.selectOne(namespace + ".idCheckCount", mem_id);
	}

	@Override
	public boolean idAndEmailCheck(String mem_id, String mem_email) throws Exception {
		Map<String,String> idAndEmail = new HashMap();
		idAndEmail.put("mem_id", mem_id);
		idAndEmail.put("mem_email", mem_email);
		if(sqlSession.selectOne(namespace + ".idAndEmail", idAndEmail) == null){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void setPassword(String mem_pw,String mem_id) throws Exception {
		Map<String,String> idAndPw = new HashMap();
		idAndPw.put("mem_id", mem_id);
		idAndPw.put("mem_pw", mem_pw);
		sqlSession.update(namespace+".setPassword", idAndPw);
	}
	
	@Override
	public void blindTrue(String mem_id) throws Exception {
		Map<String, Object> param = new HashMap();
		param.put("blind", 1);
		param.put("mem_id", mem_id);
		sqlSession.update(namespace + ".blind", param);
		
	}

	@Override
	public void blindFalse(String mem_id) throws Exception {
		Map<String, Object> param = new HashMap();
		param.put("blind", 0);
		param.put("mem_id", mem_id);
		sqlSession.update(namespace + ".blind", param);
		
	}


}
