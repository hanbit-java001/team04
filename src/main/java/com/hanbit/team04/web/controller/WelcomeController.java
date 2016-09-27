package com.hanbit.team04.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hanbit.tutor.core.service.SchedulerService;


@Controller
public class WelcomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);

	@RequestMapping("/")
	public String welcome() {
		return "index";
	}

	@RequestMapping("/list")
	public String list() {
		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: start");

		LOGGER.info(">>>>>>>>>> WelcomeController :: name :: end");

		return "list";
	}

}
