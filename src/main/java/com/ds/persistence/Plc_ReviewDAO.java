package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface Plc_ReviewDAO {

// 댓글 리스트 읽기
	public List<Place_ReviewDTO> plcReviewRead(int plc_no) throws Exception;
	
// 댓글 적기
	public void plcReviewCreate(Plc_ReviewVO vo) throws Exception;
	
// 총점 구하기
	public void updateTotalScore(int plc_no) throws Exception;
	
// 댓글 수정
	public void plcReviewUpdate(Plc_ReviewVO vo) throws Exception;
	
// 댓글 삭제
	public void plcReviewDelete(int rev_no) throws Exception;
	
// 댓글 읽기
	public Plc_ReviewVO plcReviewReadOne(int rev_no) throws Exception;
	
	
}
