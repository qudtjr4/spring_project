package com.ds.service;

import java.util.*;

import com.ds.domain.*;

public interface Plc_ReviewService {

// 댓글 입력
	public void reviewRegist(Plc_ReviewVO vo) throws Exception;
// 댓글 리스트 조회
	public List<Place_ReviewDTO> reviewRead(int plc_no) throws Exception;
// 댓글 수정
	public void reviewModify(Plc_ReviewVO vo) throws Exception;
// 댓글 삭제
	public void reviewRemove(int rev_no, int plc_no) throws Exception;
// 댓글 읽기
	public Plc_ReviewVO reviewReadOne(int rev_no) throws Exception;
}
