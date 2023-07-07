package com.kokoa.together.fundraising.service;

import org.springframework.web.multipart.MultipartFile;

public interface FundraisingFileService {
	
	public String IMAGE_REPO = "c:/spring/image_repo";
	
	public String getMessage(String message, String url);
	
	public String saveFile(MultipartFile file);

}
