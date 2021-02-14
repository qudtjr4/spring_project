package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface ImageDAO {

// 이미지 리스트 불러오기
	public List<ImageVO> imageList(int plc_no) throws Exception;
	
	public void imageUpdate(int plc_no, List<String> list) throws Exception;
	
}
