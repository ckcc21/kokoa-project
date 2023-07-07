package com.kokoa.together.fundraising.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FundraisingFileServiceImpl implements FundraisingFileService {

	public String getMessage(String message, String url) {
		String message2 = null;
		message2 = "<script>alert('" + message + "');";
		message2 += "location.href='" + url + "';</script>";
		return message2;
	}

	public String saveFile(MultipartFile file) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_");
		String systemFileName = sdf.format(new Date());
		systemFileName += file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO + "/" + systemFileName);

		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return systemFileName;
	}

}
