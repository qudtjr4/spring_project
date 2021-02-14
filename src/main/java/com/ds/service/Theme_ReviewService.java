package com.ds.service;

import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;

public interface Theme_ReviewService {
	
	public void addTheme_Review(Theme_ReviewVO vo) throws Exception;
	
	public List<Theme_ReviewDTO> revListAll(int theme_no) throws Exception;
	
	public Theme_ReviewVO readReview(int rev_no) throws Exception;
	
	public void theme_ReviewModify(Theme_ReviewVO vo) throws Exception;
	
	public void theme_ReviewDelete(int rev_no,int theme_no) throws Exception;
}
