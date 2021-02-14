package com.ds.util;

import java.util.*;

import org.springframework.http.*;

public class MediaUtils {

	// mime-type : text/html, text/css, image/jpeg
	// java.util.Map, org.springframework.http.MediaType
	private static Map<String, MediaType> mediaMap;
	
	// static 초기화
	static {
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG); // image/jpeg
		mediaMap.put("JPEG", MediaType.IMAGE_JPEG); // image/jpeg
		mediaMap.put("GIF", MediaType.IMAGE_GIF); // image/gif
		mediaMap.put("PNG", MediaType.IMAGE_PNG); // image/png
	}
	
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
}
