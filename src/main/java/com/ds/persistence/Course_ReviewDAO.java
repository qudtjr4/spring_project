package com.ds.persistence;

import java.util.*;

import com.ds.domain.*;

public interface Course_ReviewDAO {
	
	// 리뷰 추가
	public void create(Cour_reviewVO vo) throws Exception;
	
	// 리뷰 리스트
	public List<Course_ReviewDTO> listAll(int cour_no, Criteria cri) throws Exception;
	
	// 리뷰 읽기
	public Cour_reviewVO read(int rev_no) throws Exception;
	
	// 리뷰 삭제
	public void delete(int rev_no) throws Exception;
	
	// 리뷰 수정
	public void update(Cour_reviewVO vo) throws Exception;
	
	// 리뷰 갯수
	public int countPaging(int cour_no) throws Exception;
	
	// 리뷰 총점 계산
	public double totalScore(int cour_no) throws Exception;
	
}
