package com.ds.service;



import javax.inject.*;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class Mem_ThemeServiceImpl implements Mem_ThemeService{
	@Inject
	Mem_ThemeDAO dao;

	@Transactional
	@Override
	public String insertMem_Theme(Mem_ThemeVO vo) throws Exception {
		
		if(dao.check(vo) == true){
		return "FALSE";	
			
		}else{
		dao.insertMem_Theme(vo);
		
		dao.countUp(vo.getTheme_no());
		return "SUCCESS";
		}
		
	}
	
	
}
