package com.ds.service;

import java.util.*;

import javax.inject.*;

import org.springframework.stereotype.*;

import com.ds.domain.*;
import com.ds.persistence.*;

@Service
public class ImageServiceImpl implements ImageService{

	@Inject
	private ImageDAO dao;
	
	@Override
	public List<ImageVO> ImageList(int plc_no) throws Exception {
		
		return dao.imageList(plc_no);
	}

	@Override
	public void imageUpdate(int plc_no, List<String> list) throws Exception {
		dao.imageUpdate(plc_no, list);
		
	}

	
	
}
