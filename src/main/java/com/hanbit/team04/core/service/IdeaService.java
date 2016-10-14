package com.hanbit.team04.core.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hanbit.team04.core.vo.IdeaVO;
import com.hanbit.team04.core.dao.IdeaDAO;

@Service
public class IdeaService {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaService.class);

	@Autowired
	IdeaDAO ideaDAO = new IdeaDAO();

	public int addIdea(IdeaVO idea) {
		LOGGER.debug("게시글 추가");
		IdeaVO myIdea= idea;
		myIdea.setIdxNum(ideaDAO.selectNextIndex());
		LOGGER.debug("게시글 추가 end");
		return ideaDAO.insertIdea(myIdea);
	}

	public int modifyIdea(IdeaVO idea) {
		LOGGER.debug("게시글 수정");
		return ideaDAO.updateIdea(idea);
	}

	public int removeIdea(IdeaVO idea) {
		LOGGER.debug("게시글 삭제");
		return ideaDAO.deleteIdea(idea);
	}

	public List<IdeaVO> listIdeas(int pageNum) {
		LOGGER.debug("게시글 목록보기");
		List<IdeaVO> lists = new ArrayList<>();
		int totalCount = ideaDAO.countIdeas();
		if (totalCount < 10) {
			lists = ideaDAO.selectIdeas();
		} else {
			lists = ideaDAO.selectIdeas((pageNum - 1) * 10+1, pageNum * 10 );
		}
		return lists;
	}
	public List<Map<String, Object>> getIdeas(int pageNum) {
		LOGGER.debug("게시글 목록보기");
		List<Map<String, Object>> lists =  ideaDAO.getIdeas(pageNum);
		return lists;
	}

	public IdeaVO getDetailBoard(String idxNum) {

		return ideaDAO.selectIdea(idxNum);
	}

	public int totalPageNum() {

		return ideaDAO.countIdeas();
	}


}
