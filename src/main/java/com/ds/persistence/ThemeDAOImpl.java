package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.dto.*;
import com.sun.org.apache.xml.internal.dtm.*;

@Repository
public class ThemeDAOImpl implements ThemeDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ds.mappers.themeMapper";
	
	
	@Override
	public void createTheme(ThemeVO vo,List<Integer> list) throws Exception {
		
		sqlSession.insert(namespace + ".insert", vo);
		
		
		for(int a : list){
			Plc_ThemeVO plcVo = new Plc_ThemeVO();
			plcVo.setTheme_no(vo.getTheme_no());
			System.out.println("vo.getTheme_no : "+vo.getTheme_no());
			
			plcVo.setPlc_no(a);
			sqlSession.insert(namespace + ".insertPlcTheme", plcVo);
			
			
		}
		
		
		
		
		
		
	}

	@Override
	public ThemeVO readTheme(int theme_no) throws Exception {
		sqlSession.update(namespace + ".increaseViewCount", theme_no);
		return sqlSession.selectOne(namespace+".read", theme_no);
	}

	@Override
	public void updateTheme(ThemeVO vo) throws Exception {
		sqlSession.update(namespace+".update",vo);
	}
	@Override
	public void updatePlc_Theme(int theme_no,List<Integer> list) throws Exception {
		
		for(int i : list){
		Plc_ThemeVO vo = new Plc_ThemeVO();
		vo.setPlc_no(i);
		vo.setTheme_no(theme_no);
		
		sqlSession.insert(namespace+".insertPlcTheme", vo);
		}
		
	}
	//�뀒留� �궘�젣(�뀒留� �뀒�씠釉� 4)
	@Override
	public void deleteTheme(int theme_no) throws Exception {
		sqlSession.delete(namespace + ".delete", theme_no);
		
	}
	//�뀒留� �궘�젣(�뀒留덈━酉� �뀒�씠釉� 1)
	@Override
	public void deleteTheme_Review(int theme_no) throws Exception {
		sqlSession.delete(namespace+".deleteTheme_Review",theme_no);
	}

	//�뀒留� �궘�젣(�뀒留덉옣�냼 �뀒�씠釉� 2)
	@Override
	public void deletePlc_Theme(int theme_no) throws Exception {
		sqlSession.delete(namespace+".deletePlc_Theme",theme_no);		
	}
	//�뀒留� �궘�젣(�뀒留덈ħ踰� �뀒�씠釉� 3)
	@Override
	public void deleteMem_Theme(int theme_no) throws Exception {
		sqlSession.delete(namespace+".deleteMem_Theme",theme_no);		
	}

	
	@Override
	public List<ThemeVO> listAll() throws Exception {
		
		return sqlSession.selectList(namespace + ".listAll");
	}

	@Override
	public List<ThemeVO> listTop(int num) throws Exception {
		return sqlSession.selectList(namespace + ".listTop", num);
	}

	@Override
	public int themeCount(int theme_no) throws Exception {
		return sqlSession.selectOne(namespace+".themeCount",theme_no);
	}

	@Override
	public List<ThemeVO> listPage(Criteria_Theme cri) throws Exception {
		
		return sqlSession.selectList(namespace + ".listPage", cri);
	}

	@Override
	public int totalCount() throws Exception {
		return sqlSession.selectOne(namespace+".totalCount");
	}

	@Override
	public List<ThemeInfoDTO> myTheme(String mem_id) throws Exception {
		 List<ThemeVO> themeList = sqlSession.selectList(namespace + ".myTheme", mem_id);
		 List<ThemeInfoDTO> myThemeList = new ArrayList();
		 for(ThemeVO vo : themeList){
			 ThemeInfoDTO dto = new ThemeInfoDTO();
			 List<Map<String,String>> mapList = new ArrayList();
			 
			 String theme_title = vo.getTheme_title();
			 int theme_no = vo.getTheme_no();
			
			List<PlaceVO> plcList = sqlSession.selectList(namespace + ".plcListAll", theme_no);
			 for(PlaceVO vo1 : plcList){
				 Map<String,String> map = new HashMap();
				 map.put("plc_img", vo1.getPlc_img());
				 map.put("plc_name", vo1.getPlc_name());
				 mapList.add(map);
			 }
			 dto.setMem_id(mem_id);
			 dto.setTheme_no(theme_no);
			 dto.setTheme_title(theme_title);
			 dto.setListMap(mapList);
			 myThemeList.add(dto);
		 }
		 return myThemeList;
	}
	
	// 랜덤 테마정보 가져오기
	@Override
	public List<ThemeVO> randomTheme() throws Exception {
		
		return sqlSession.selectList(namespace + ".random");
	}


}
