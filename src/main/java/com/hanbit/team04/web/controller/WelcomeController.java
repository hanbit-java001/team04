package com.hanbit.team04.web.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.vo.IdeaVO;



@Controller
public class WelcomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);

	@RequestMapping("/")
	public String welcome() {
		return "mainHome";
	}

	@RequestMapping("/list")
	public String list() {
		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: start");

		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: end");

		return "list";
	}




}
