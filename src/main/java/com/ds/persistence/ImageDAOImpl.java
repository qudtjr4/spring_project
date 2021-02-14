package com.ds.persistence;

import java.util.*;

import javax.inject.*;

import org.apache.ibatis.session.*;
import org.springframework.stereotype.*;

import com.ds.domain.*;

@Repository
public class ImageDAOImpl implements ImageDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.ds.mappers.imageMapper";
	private static String namespace2 = "com.ds.mappers.placeMapper";

	@Override
	public List<ImageVO> imageList(int plc_no) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".readList", plc_no);
	}

	@Override
	public void imageUpdate(int plc_no, List<String> list) throws Exception {
		// 이미지를 전체 지우고
		session.delete(namespace2 + ".imgDelete", plc_no);
		// 새로 이미지 생성
		for (String a : list){
			ImageVO imgVO = new ImageVO();
			imgVO.setPlc_no(plc_no);
			imgVO.setImg_name(a);
			session.insert(namespace2 + ".imgCreate", imgVO);
		}
		
	}

}
