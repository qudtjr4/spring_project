package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class PlaceDAOImpl implements PlaceDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ds.mappers.placeMapper";
	
	@Override
	public void placeCreate(PlaceVO vo, List<String> list) throws Exception {
		sqlSession.insert(namespace + ".create", vo);
		int plc_no = vo.getPlc_no();
		for (String a : list){
			ImageVO imgVO = new ImageVO();
			imgVO.setPlc_no(plc_no);
			imgVO.setImg_name(a);
			sqlSession.insert(namespace + ".imgCreate", imgVO);
		}
	}

	@Override
	public PlaceVO placeRead(int plc_no) throws Exception {
		
		
		return sqlSession.selectOne(namespace + ".read", plc_no);
	}

	@Override
	public void placeUpdate(PlaceVO vo) throws Exception {
		sqlSession.update(namespace + ".update", vo);
		
	}

	@Override
	public List<PlaceVO> placeListAll(int loc_no, Criteria_Place cri, String plc_category) throws Exception {
		Map<String, Object> map = new HashMap(); 
		map.put("loc_no", loc_no);
		map.put("cri", cri);
		map.put("plc_category", plc_category);
		return sqlSession.selectList(namespace + ".listAll", map);
	}

	@Override
	public void placeDelete(int plc_no) throws Exception {
		sqlSession.delete(namespace + ".deleteTheme", plc_no);
		sqlSession.delete(namespace + ".delete", plc_no);
		
	}


	@Override
	public List<PlaceVO> placeBestStay(int loc_no) throws Exception {
		
		return sqlSession.selectList(namespace + ".bestStay", loc_no);
	}

	@Override
	public List<PlaceVO> placeBestAttraction(int loc_no) throws Exception {
		return sqlSession.selectList(namespace + ".bestAttraction", loc_no);
	}

	@Override
	public List<PlaceVO> placeBestRestaurant(int loc_no) throws Exception {
		return sqlSession.selectList(namespace + ".bestRestaurant", loc_no);
	}

	@Override
	public int placeCount(int loc_no) throws Exception {
		return sqlSession.selectOne(namespace +".count", loc_no);
	}

	@Override
	public List<PlaceVO> placeCategory(int loc_no, String plc_category, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap();
		System.out.println(loc_no);
		System.out.println(plc_category);
		System.out.println(cri);
		
		
		map.put("loc_no", loc_no);
		map.put("plc_category", plc_category);
		map.put("cri", cri);
		
		
		return sqlSession.selectList(namespace + ".listCategory", map);
	}
	
	@Override
	public List<PlaceVO> bestPlace() throws Exception {
		List<PlaceVO> list = new ArrayList();
		String[] category = {"숙박", "명소", "맛집"};
		for(String plc_category: category){
			PlaceVO vo = sqlSession.selectOne(namespace + ".best_place", plc_category);
			list.add(vo);
		}
		return list;
	}

//min
	@Override
	public List<PlaceVO> plc_ThemeList(int theme_no) throws Exception {
		
		return sqlSession.selectList(namespace + ".readPlc_Theme", theme_no);
	}


	@Override
	public List<PlaceVO> cartPlaceList(String mem_id) throws Exception {
		return sqlSession.selectList(namespace+".cartPlaceList", mem_id);
	}


	@Override
	public List<PlaceVO> cartPlaceListMinusPlc_ThemeList(String mem_id, int theme_no) throws Exception {
		Map<String, Object> map = new HashMap();
		map.put("mem_id", mem_id);
		map.put("theme_no", theme_no);
		return sqlSession.selectList(namespace + ".cartPlaceListMinusPlc_ThemeList" , map);
	}

	@Override
	public void placeDelete1(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete1", plc_no);
	}
	@Override
	public void placeDelete2(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete2", plc_no);
	}
	@Override
	public void placeDelete3(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete3", plc_no);
	}
	@Override
	public void placeDelete4(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete4", plc_no);
	}
	@Override
	public void placeDelete5(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete5", plc_no);
	}
	@Override
	public void placeDelete6(int plc_no) throws Exception {
		
		sqlSession.delete(namespace + ".delete6", plc_no);
	}

}
