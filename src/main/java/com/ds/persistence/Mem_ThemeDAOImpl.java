package com.ds.persistence;




import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class Mem_ThemeDAOImpl implements Mem_ThemeDAO{

	@Inject
	private SqlSession sqlSession;
	
	
	private static final String namespace = "com.ds.mappers.mem_ThemeMapper";
	
	@Override
	public void insertMem_Theme(Mem_ThemeVO vo) throws Exception {
		sqlSession.insert(namespace + ".insert", vo);
		
	}

	@Override
	public void countUp(int theme_no) throws Exception {
		sqlSession.update(namespace+".countUp", theme_no);
	}

	@Override
	public boolean check(Mem_ThemeVO vo) throws Exception {
		boolean result = false;
		
		if(sqlSession.selectOne(namespace+".check", vo) != null){
			result = true;
		}
		
		System.out.println(result);
		return result;
				
	}
	
	
}
