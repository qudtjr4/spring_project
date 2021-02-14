package com.ds.persistence;


import com.ds.domain.*;

public interface Mem_ThemeDAO {
	
	public void insertMem_Theme(Mem_ThemeVO vo) throws Exception;
	
	public void countUp(int theme_no)  throws Exception;
	
	public boolean check(Mem_ThemeVO vo)  throws Exception;
}
