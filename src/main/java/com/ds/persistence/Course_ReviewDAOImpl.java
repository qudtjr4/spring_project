package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;
@Repository
public class Course_ReviewDAOImpl implements Course_ReviewDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ds.mappers.courseReviewMapper";
	
	@Override
	public void create(Cour_reviewVO vo) throws Exception {
		sqlSession.insert(namespace + ".createReview", vo);
	}

	@Override
	public List<Course_ReviewDTO> listAll(int cour_no, Criteria cri) throws Exception {
		List<Course_ReviewDTO> listDTO = new ArrayList();
		Map<String, Object> param = new HashMap();
		param.put("cour_no", cour_no);
		param.put("cri", cri);
		List<Cour_reviewVO> listCourseVo = sqlSession.selectList(namespace + ".listAll", param);
		for(int i = 0; i < listCourseVo.size(); i++){
			Course_ReviewDTO dto = new Course_ReviewDTO();
			dto.setCour_no(listCourseVo.get(i).getCour_no());
			dto.setMem_id(listCourseVo.get(i).getMem_id());
			dto.setRev_content(listCourseVo.get(i).getRev_content());
			dto.setRev_no(listCourseVo.get(i).getRev_no());
			dto.setRev_score(listCourseVo.get(i).getRev_score());
			String mem_img = sqlSession.selectOne(namespace + ".getMemImg", listCourseVo.get(i).getMem_id());
			dto.setMem_img(mem_img);
			dto.setRev_time(listCourseVo.get(i).getRev_time());
			listDTO.add(dto);
		}
		return listDTO;
	}

	@Override
	public void delete(int rev_no) throws Exception {
		sqlSession.delete(namespace + ".delete", rev_no);
	}

	@Override
	public void update(Cour_reviewVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
	}

	@Override
	public int countPaging(int cour_no) throws Exception {
		return sqlSession.selectOne(namespace + ".countPaging", cour_no);
	}

	@Override
	public double totalScore(int cour_no) throws Exception {
		int cour_Count = sqlSession.selectOne(namespace + ".countPaging", cour_no);
		int cour_Score = sqlSession.selectOne(namespace + ".cour_Score", cour_no);
		double totalScore = (double)cour_Score / (double)cour_Count;
		return totalScore;
	}

	@Override
	public Cour_reviewVO read(int rev_no) throws Exception {
		return sqlSession.selectOne(namespace + ".read", rev_no);
	}




}
