package com.hanbit.team04.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.IdeaBoardService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.vo.IdeaBoardVO;


@Controller
public class IdeaBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaBoardController.class);

	@Autowired
	private IdeaBoardService ideaBoardService;

//	@LoginRequired
//	aop �엯�땲�떎.
	@RequestMapping("/hyundo/board")
	public String IdeaBoards(){
		return "idea_board";
	}

	@RequestMapping("/api/data")
	@ResponseBody
	public List<IdeaBoardVO> getIdeaBoards(){
		List<IdeaBoardVO> voList = ideaBoardService.getIdeaBoards();

		return voList;
	}

	@RequestMapping("/api/totCnt")
	@ResponseBody
	public int getTotalCnt(){
		int totCnt = ideaBoardService.getTotCnt();
		return totCnt;
	}

	@RequestMapping(value="/api/datas",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> IdeaBoards(@RequestParam("pageNum") int pageNum){
		Map<String, Object> result = new HashMap<>();
		List<IdeaBoardVO> voList = ideaBoardService.getIdeaBoards2(pageNum);
		int totalCount = ideaBoardService.getTotCnt();

		result.put("totCnt", totalCount);
		result.put("list", voList);

		return result;
	}

	
	@RequestMapping("/api/IdeaBoard/insert")
	@ResponseBody
	public int insertIdea(@RequestParam("userId") String userId, @RequestParam("title") String title, @RequestParam("contents") String contents){
		
		Map param = new HashMap<>();
		
		param.put("userId", userId);
		param.put("title", title);
		param.put("contents", contents);
		
		int result = ideaBoardService.putIdea(param);
		
		return result;
		
	}
}
