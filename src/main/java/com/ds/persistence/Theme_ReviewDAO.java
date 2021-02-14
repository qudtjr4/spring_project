package com.ds.persistence;


import java.util.*;

import com.ds.domain.*;
import com.ds.dto.*;


public interface Theme_ReviewDAO {
	public Theme_ReviewVO readReview(int rev_no) throws Exception;
	
	public void addTheme_Review(Theme_ReviewVO vo) throws Exception;
	
	public void updateTotalScore(int theme_no) throws Exception;
	
	public List<Theme_ReviewDTO> theme_ReviewListAll(int theme_no) throws Exception;
	
	public void theme_ReviewModify(Theme_ReviewVO vo) throws Exception;
	
	public void theme_ReviewDelete(int rev_no) throws Exception;
}
