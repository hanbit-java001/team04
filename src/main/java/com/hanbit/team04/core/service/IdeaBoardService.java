package com.hanbit.team04.core.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.IdeaBoardDAO;
import com.hanbit.team04.core.vo.IdeaBoardVO;


@Service
public class IdeaBoardService {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaBoardService.class);
	
	@Autowired
	private IdeaBoardDAO ideaBoardDAO;

	public List<IdeaBoardVO> getIdeaBoards() {
		return ideaBoardDAO.selectBoards();
	}

	public int getTotCnt() {
		return ideaBoardDAO.selectTotCnt();
	}

	public List<IdeaBoardVO> getIdeaBoards2(int pageNum) {
		return ideaBoardDAO.selectBoards2(pageNum);
	}
	
}