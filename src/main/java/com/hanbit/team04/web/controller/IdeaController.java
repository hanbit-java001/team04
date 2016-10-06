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
public class IdeaController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);

	@Autowired
	IdeaService ideaService;



	@RequestMapping("/Idea")
	public String list() {
		LOGGER.info("IdeaController - start");
		return "Idea";
	}
	@RequestMapping("/api/insertdata/")
	@ResponseBody
	public IdeaVO insertdata(@RequestBody IdeaVO ideaVo) {

		LOGGER.info("IdeaController - insert"+ideaVo);
		ideaService.addIdea(ideaVo);
		return ideaVo;
	}
	@RequestMapping("/api/selectdata/")
	@ResponseBody
	public List<IdeaVO> insertdata(@RequestParam int pageNum) {

		LOGGER.info("IdeaController - pagenum"+pageNum);
		List<IdeaVO> ideaVOs;
		ideaVOs=ideaService.listIdeas(pageNum);
		LOGGER.info("IdeaController - list"+ideaVOs);
		return ideaVOs;
	}

//	@RequestMapping("/api/schedule/add")
//	@ResponseBody
//	public ScheduleVO addSchedule(@RequestBody ScheduleVO schedule) {
//
//		String scheduleId = schedulerService.generateId();
//		schedule.setScheduleId(scheduleId);
//
//		int countAdded = schedulerService.addSchedule(schedule);
//
//		if (countAdded == 0) {
//			throw new RuntimeException();
//		}
//
//		return schedule;
//	}

}
