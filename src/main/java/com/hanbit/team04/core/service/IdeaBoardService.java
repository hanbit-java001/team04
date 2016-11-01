package com.hanbit.team04.core.service;

import java.util.List;
import java.util.Map;

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
	public int getConfirmCount(String userId) {

		return ideaBoardDAO.selectConfirmCount(userId);
	}

	public int getWriteCount(String userId) {
		return ideaBoardDAO.selectWriteCount(userId);
	}

	public int putIdea(Map param) {
		// TODO Auto-generated method stub
		return ideaBoardDAO.insertIdea(param);
	}

	public List<IdeaBoardVO> getUserDetail(String userId) {
		return ideaBoardDAO.selectUserDetail(userId);
	}

	public int insertBoard(IdeaBoardVO ideaBoardVO) {
		// TODO Auto-generated method stub
		return ideaBoardDAO.insertData(ideaBoardVO);
	}
}
