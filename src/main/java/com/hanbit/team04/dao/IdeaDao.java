package com.hanbit.team04.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hanbit.team04.core.IdeaVo;


public class IdeaDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaDao.class);

	@Autowired
	private SqlSession sqlSession;

	public int insertIdea(IdeaVo Idea) {
		LOGGER.debug("insertIdea");

		int result = sqlSession.insert("Idea.insertIdea", Idea);

		return result;
	}

	public int updateIdea(IdeaVo Idea) {
		int result = sqlSession.update("Idea.updateIdea", Idea);

		return result;
	}

	public int deleteIdea(String IdeaId) {
		int result = sqlSession.delete("Idea.deleteIdea", IdeaId);

		return result;
	}

	public List<IdeaVo> selectIdeas(String startDt, String endDt) {

		List<IdeaVo> result = sqlSession.selectList("Idea.selectIdeas", params);

		return result;
	}

	public IdeaVo selectIdea(String IdeaId) {
		IdeaVo Idea = sqlSession.selectOne("Idea.selectIdea", IdeaId);

		return Idea;
	}

	public int countIdea(String startDt, String endDt) {

		Map params = new HashMap();
		params.put("startDt", startDt);
		params.put("endDt", endDt);

		int result = sqlSession.selectOne("Idea.countIdea", params);

		return result;
	}
}
