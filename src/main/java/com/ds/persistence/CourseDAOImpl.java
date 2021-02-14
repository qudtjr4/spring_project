package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;

@Repository
public class CourseDAOImpl implements CourseDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ds.mappers.courseMapper";
	private static final String namespace_Review ="com.ds.mappers.courseReviewMapper";

	@Override
	public void create(CourseVO vo, List<Integer> plc_nos) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
		int cour_no = vo.getCour_no();
		
		for (int plc_no : plc_nos) {
			Map<String, Integer> param = new HashMap();
			param.put("cour_no", cour_no);
			param.put("plc_no", plc_no);
			sqlSession.insert(namespace + ".create_cour_plc", param);
		}
		
	}

	@Override
	public void update(CourseVO vo,List<Integer> plc_nos) throws Exception {
		sqlSession.update(namespace + ".update", vo);
		int cour_no = vo.getCour_no();
		sqlSession.delete(namespace + ".delete_cour_plc", cour_no);
		for (int plc_no : plc_nos) {
			Map<String, Integer> param = new HashMap();
			param.put("cour_no", cour_no);
			param.put("plc_no", plc_no);
			sqlSession.insert(namespace + ".create_cour_plc", param);
		}
		
	}

	@Override
	public void delete(int cour_no) throws Exception {
		// 코스 장소 지우기
		sqlSession.delete(namespace + ".delete_cour_plc", cour_no);
		// 코스 리뷰 지우기
		sqlSession.delete(namespace_Review + ".delete_cour_no", cour_no);
		// 코스 정보 지우기
		sqlSession.delete(namespace + ".delete", cour_no);
		
	}

	@Override
	public CourseVO read(int cour_no) throws Exception {
		return sqlSession.selectOne(namespace + ".read", cour_no);
	}

	@Override
	public List<CourseVO> listAll(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listAll", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return sqlSession.selectOne(namespace + ".countPaging", cri);
	}

	@Override
	public void totalScoreUpdate(int cour_no) throws Exception {
		int cour_Count = sqlSession.selectOne(namespace + ".cour_Count", cour_no);
		double total;
		if (cour_Count == 0) {
			total = 0;
		}else {
			int cour_Score = sqlSession.selectOne(namespace + ".cour_Score", cour_no);
			total = (double)cour_Score / (double)cour_Count;
		}
		Map<String, Object> param = new HashMap();
		param.put("total", total);
		param.put("cour_no", cour_no);
		sqlSession.update(namespace + ".totalScoreUpdate", param);
	}

	@Override
	public List<PlaceVO> plcListAll(int cour_no) throws Exception {
		return sqlSession.selectList(namespace + ".plcListAll", cour_no);
	}

	@Override
	public List<CourseMainInfoDTO> courseTop(int index) throws Exception {
		List<CourseMainInfoDTO> infoDTOs = new ArrayList();
		List<CourseVO> courseVOs = sqlSession.selectList(namespace + ".courseTop", index);
		for(CourseVO cVO :courseVOs){
			CourseMainInfoDTO dto = new CourseMainInfoDTO();
			dto.setCour_days(cVO.getCour_days());
			dto.setCour_hashtag(cVO.getCour_hashtag());
			dto.setCour_no(cVO.getCour_no());
			dto.setCour_title(cVO.getCour_title());
			dto.setCour_totalscore(cVO.getCour_totalscore());
			dto.setMem_id(cVO.getMem_id());
			List<String> listPlcImg = new ArrayList();
			int cour_no = cVO.getCour_no();
			List<PlaceVO> listPlace = sqlSession.selectList(namespace + ".plcListAll", cour_no);
			for(PlaceVO pVO :listPlace) {
				listPlcImg.add(pVO.getPlc_img());
			}
			dto.setListPlcImg(listPlcImg);
			infoDTOs.add(dto);
		}
		return infoDTOs;
	}

	@Override
	public List<CourseMainInfoDTO> myCourse(String mem_id) throws Exception {
		List<CourseMainInfoDTO> infoDTOs = new ArrayList();
		List<CourseVO> courseVOs = sqlSession.selectList(namespace + ".myCourse", mem_id);
		for(CourseVO cVO :courseVOs){
			CourseMainInfoDTO dto = new CourseMainInfoDTO();
			dto.setCour_days(cVO.getCour_days());
			dto.setCour_hashtag(cVO.getCour_hashtag());
			dto.setCour_no(cVO.getCour_no());
			dto.setCour_title(cVO.getCour_title());
			dto.setCour_totalscore(cVO.getCour_totalscore());
			dto.setMem_id(cVO.getMem_id());
			List<String> listPlcImg = new ArrayList();
			
			Map<String, List<String>> listPlcMap = new HashMap();
			int cour_no = cVO.getCour_no();
			List<PlaceVO> listPlace = sqlSession.selectList(namespace + ".plcListAll", cour_no);
			for(PlaceVO pVO :listPlace) {
				listPlcImg.add(pVO.getPlc_img());
			}
			dto.setListPlcImg(listPlcImg);
			infoDTOs.add(dto);
		}
		return infoDTOs;
	}

	@Override
	public List<CourseMainInfoDTO2> myCourse3(String mem_id) throws Exception {
		List<CourseVO> list = sqlSession.selectList(namespace+".myCourse",mem_id);
		List<CourseMainInfoDTO2> dtoList = new ArrayList();
		for(CourseVO vo : list){
			CourseMainInfoDTO2 dto = new CourseMainInfoDTO2();
			List<Map<String,String>> mapList = new ArrayList();
			String title = vo.getCour_title();
			int no = vo.getCour_no();
			List<PlaceVO> plcList = sqlSession.selectList(namespace+".plcListAll2",no);
			for(PlaceVO xo : plcList){
				Map<String, String> map = new HashMap();
				map.put("plc_img", xo.getPlc_img());
				map.put("plc_name", xo.getPlc_name());
				mapList.add(map);
			}
			dto.setCour_no(no);
			dto.setCour_title(title);
			dto.setListMap(mapList);
			dto.setMem_id(mem_id);
			dtoList.add(dto);
		}
		return dtoList;
		
	} 
	
	
	


}
