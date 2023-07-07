package com.kokoa.together.fundraising.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.kokoa.together.common.SessionName;
import com.kokoa.together.fundraising.dto.FundraisingDTO;
import com.kokoa.together.fundraising.service.FundraisingFileService;
import com.kokoa.together.fundraising.service.FundraisingService;

@Controller
public class FundraisingController implements SessionName {

	@Autowired
	FundraisingService fs;

	@GetMapping(value = "fundraisings/now")
	public String fundraising(@RequestParam(value = "sort", required = false, defaultValue = "1") int sort,
			@RequestParam(value = "topic_id", required = false, defaultValue = "0") int topicId,
			HttpServletResponse response) throws Exception {

		return "fundraising/fundraising_now";
	}

	@GetMapping("fundraisings/{fundraising_num}")
	public String fundraisingLoad(@PathVariable("fundraising_num") int num, Model model) {
		fs.fundraisingLoad(num, model);
		return "fundraising/fundraising_content";
	}

	@PostMapping(value = "fundraisings/fundraisingListSearch.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<FundraisingDTO> fundraisingList(@RequestBody Map<String, Integer> sortAndTopidIdAndPage, Model model) {
		int sort = sortAndTopidIdAndPage.get("sort");
		int topicId = sortAndTopidIdAndPage.get("topicId");
		int page = sortAndTopidIdAndPage.get("page");

		return fs.fundraisingList(sort, topicId, page, model);
	}

	@GetMapping("fundraisings/write")
	public String fundraisingWrite() {
		return "fundraising/fundraising_write";
	}

	@GetMapping("imageLoad")
	public void imageLoad(@RequestParam String imageFileName, HttpServletResponse response) throws Exception {
		File file = new File(FundraisingFileService.IMAGE_REPO + "/" + imageFileName);
		response.addHeader("content-disposition", "attachment;fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}

	@RequestMapping(value = "fundraisings/fileUpload.do", method = RequestMethod.POST)
	@ResponseBody
	public void fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();
						// 저장 경로
						String uploadPath = request.getServletContext().getRealPath("/resources/image/fundraising");

						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						String fileName2 = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName2 + fileName;

						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						printWriter = response.getWriter();
						String fileUrl = request.getContextPath() + "/resources/image/fundraising/" + fileName2 + fileName;

						// json 데이터로 등록
						// {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
						// 이런 형태로 리턴이 나가야 함
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.print(json);

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
	}

//https://dantes.kr/576
	@PostMapping("fundraisings/writeSave")
	public void writeSave(MultipartHttpServletRequest mhsr, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {
		String id = (String) session.getAttribute(SessionName.LOGIN);
		String message = fs.writeSave(mhsr, request, id);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}

}
