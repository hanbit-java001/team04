package com.hanbit.team04.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.RankBoardService;
import com.hanbit.team04.core.vo.RankBoardVO;


@Controller
public class RankBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(RankBoardController.class);

	@Autowired
	private RankBoardService rankBoardService;

	@RequestMapping("/hyundo_rank")
	public String RankBoard(){
		return "rankBoard";
	}

	@RequestMapping("/api/rankBoard")
	@ResponseBody
	public List<RankBoardVO> getRankBoardList(){
		List<RankBoardVO> rankBoardList = rankBoardService.getRankBoards();
		return rankBoardList;
	}

}
