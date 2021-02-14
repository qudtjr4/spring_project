package com.ds.util;

import java.awt.image.*;
import java.io.*;
import java.text.*;
import java.util.*;

import javax.imageio.*;

import org.imgscalr.*;
import org.springframework.util.*;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		String savedPath = calcPath(uploadPath);

		File target = new File(uploadPath + savedPath, savedName);
		// -> D:/upload/2014/04/21/13d1d1-3dqf103-13fe32_이름.JPG"

		FileCopyUtils.copy(fileData, target);

		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);

		String uploadedFileName = null;

		// 업로드한 파일이 이미지라면
		if (MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 처리
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}

		return uploadedFileName;
	}

	// 업로드 경로 계산 기능 (폴더 생성 포함)
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

		System.out.println("dataPath: " + datePath);
		makeDir(uploadPath, yearPath, monthPath, datePath);

		return datePath;
	}

	// ... : 가변 인자값
	private static void makeDir(String uploadPath, String... paths) {

		// paths: 2017, 04, 21
		// 해당 날짜의 폴더가 이미 존재하면 폴더 생성을 하지 않음
		File f = new File(paths[paths.length - 1]);
		if (f.exists()) {
			return;
		}

		// 년 -> 월 -> 일 순으로 체크해서
		// 해당 경로가 없으면 생성
		// -> 한번에 하위 폴더 여러개를 생성할 수 없기 때문
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);

			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}

	}

	// 썸네일 생성
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT, 210);
		// -> 원본이미지를 높이를 100으로 설정하고,
		// 너비를 높이에 맞게 자동으로 비율 설정

		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		// 파일의 확장자 얻기(.jpg, .png...)
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		// 운영체제에 따라 다른 경로 표현 방식을 표준 방식으로 변경해서 리턴
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		String iconName = uploadPath + path + File.separator + fileName;

		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}
