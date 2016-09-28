package com.hanbit.team04.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hanbit.team04.core.IdeaVo;
import com.hanbit.team04.dao.IdeaDao;

@Service
public class IdeaService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaService.class);
	
	@Autowired
	IdeaDao ideaDao = new IdeaDao();
	
	public int addIdea(IdeaVo Idea) {
		LOGGER.debug("게시글 추가");
		return ideaDao.insertIdea(Idea);
	}

	public int modifyIdea(IdeaVo Idea) {
		LOGGER.debug("게시글 수정");
		return ideaDao.updateIdea(Idea);
	}

	public int removeSchedule(String IdeaId) {
		LOGGER.debug("게시글 삭제");
		return ideaDao.deleteIdea(IdeaId);
	}

	public List<IdeaVo> listSchedules() {
		LOGGER.debug("게시글 목록보기");
		return ideaDao.selectIdeas();
	}

	public IdeaVo getDetailBoard(String idxNum) {
		return ideaDao.selectIdea(idxNum);
	}
	
	
	
	
	
	
	
	
	
	private int addIdea;
	private  List<IdeaVo> getIdeaList;
	private  IdeaVo getIdeaone;
	private  int modifyIdea;
	private  int deleteIdea;
	private  List<String> searchIdea;






}
