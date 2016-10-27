package com.hanbit.team04.core.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.RankBoardDAO;
import com.hanbit.team04.core.vo.RankBoardVO;


@Service
public class RankBoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RankBoardService.class);

	@Autowired
	private RankBoardDAO rankBoardDAO;

	public List<RankBoardVO> getRankBoards() {
		return rankBoardDAO.selectRankBoards();
	}



}
