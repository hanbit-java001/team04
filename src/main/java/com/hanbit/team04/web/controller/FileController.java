package com.hanbit.team04.web.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.FileService;
import com.hanbit.team04.core.vo.FileVO;

@Controller
public class FileController {
	private static final Logger LOGGER = LoggerFactory.getLogger(FileController.class);
	@Autowired
	private FileService fileService;

	@RequestMapping("/file/{fileId}")
	@ResponseBody
	public void getFile(@PathVariable("fileId") String fileId, HttpServletResponse response) throws Exception {
		LOGGER.debug("come in get file");

		FileVO fileVO = fileService.getFile(fileId);

		response.setContentType(fileVO.getContentType());
		response.setContentLengthLong(fileVO.getFileSize());

		OutputStream outputStream = response.getOutputStream();
		outputStream.write(fileVO.getFileData());
		outputStream.close();
	}

}
