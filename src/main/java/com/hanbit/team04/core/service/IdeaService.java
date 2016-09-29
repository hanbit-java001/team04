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
		return ideaDAO.insertIdea(idea);
	}

	public int modifyIdea(IdeaVO idea) {
		LOGGER.debug("게시글 수정");
		return ideaDAO.updateIdea(idea);
	}

	public int removeIdea(String ideaId) {
		LOGGER.debug("게시글 삭제");
		return ideaDAO.deleteIdea(ideaId);
	}

	public List<IdeaVO> listIdeas(int pageNum) {
		LOGGER.debug("게시글 목록보기");
		List<IdeaVO> lists = new ArrayList<>();
		int totalCount = ideaDAO.countIdeas();
		int tempNum = (totalCount - pageNum*10);
		// 작성중.. 헷갈림
		for (int i = 0; i < 10; i++) {
			lists.addAll((tempNum+i), ideaDAO.selectIdeas());
		}
		
		return ideaDAO.selectIdeas();
	}

	public IdeaVO getDetailBoard(String idxNum) {
		
		return ideaDAO.selectIdea(idxNum);
	}

}
