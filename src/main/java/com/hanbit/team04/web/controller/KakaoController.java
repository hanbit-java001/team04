package com.hanbit.team04.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.vo.IdeaVO;

@Controller
public class KakaoController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);

	@RequestMapping("/kakao")
	public String list() {
		LOGGER.info("IdeaController - start");
		return "kakaotest";
	}
//	@RequestMapping("/api/insertdata/")
//	@ResponseBody
//	public IdeaVO insertdata(@RequestBody IdeaVO ideaVo) {
//
//		LOGGER.info("IdeaController - insert"+ideaVo);
//		return ideaVo;
//	}
//



}
