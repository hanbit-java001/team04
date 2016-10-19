package com.hanbit.team04.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.vo.IdeaVO;

@Controller
public class KakaoController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);
	@Autowired
	IdeaService ideaService;

	@RequestMapping("/kakao")
	public String list() {
		LOGGER.info("IdeaController - start");
		return "kakaotest";
	}

	@RequestMapping("/mytestoh")
	public String testoh() {
		LOGGER.info("testController - test");
		return "testoh";
	}
	@RequestMapping("/board/list_oh")
	public String listOh() {
		LOGGER.info("testController - test");
		return "board_first";
	}

	@RequestMapping("/mytestoh2")
	public String testoh2() {
		LOGGER.info("testController - test");
		return "testoh2";
	}

	@RequestMapping("/Home")
	public String mainPage() {
		LOGGER.info("testController - test");
		return "mainHome";
	}

	@RequestMapping(value = "/data/list{pageNum}", method = RequestMethod.GET)
	@ResponseBody
	public Map getList(@PathVariable("pageNum") int pageNum) {
		LOGGER.info("testController - pageList === " + pageNum);
//		for (int i = 300; i < 325; i++) {
//			IdeaVO idea = new IdeaVO();
//			idea.setIdxNum(i);
//			idea.setUserId("id"+i);
//			idea.setConfirm("confirm"+i);
//			idea.setContent("content"+i);
//			idea.setDate("date"+i);
//			idea.setLikeCount(i);
//			idea.setSubject("subject"+i);
//			ideaService.addIdea(idea);
//		}
		Map myresult = new HashMap();
		List list = ideaService.getIdeas(pageNum);
		int totalPage= ideaService.totalPageNum();
		myresult.put("list", list);
		myresult.put("totoalPage", totalPage);
		LOGGER.info("testController - result" + myresult);
		return myresult;
	}

}
