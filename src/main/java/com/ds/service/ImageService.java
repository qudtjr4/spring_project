package com.ds.service;

import java.util.*;

import com.ds.domain.*;

public interface ImageService {

// 이미지 리스트 가져오기
	public List<ImageVO> ImageList(int plc_no) throws Exception;
	
// 이미지 업데이트
	public void imageUpdate(int plc_no, List<String> list) throws Exception;

}
