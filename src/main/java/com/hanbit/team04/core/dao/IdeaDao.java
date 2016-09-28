package com.hanbit.team04.core.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaVo;


@Repository
public class IdeaDao {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaDao.class);

	@Autowired
	private SqlSession sqlSession;
	
	public int insertIdea(IdeaVo Idea) {
		LOGGER.debug("게시물 등록");

		int result = sqlSession.insert("Idea.insertIdea", Idea);

		return result;
	}

	public int updateIdea(IdeaVo Idea) {
		LOGGER.debug("게시물 수정");
		int result = sqlSession.update("Idea.updateIdea", Idea);

		return result;
	}

	public int deleteIdea(String userId) {
		LOGGER.debug("게시물 삭제");
		int result = sqlSession.delete("Idea.deleteIdea", userId);

		return result;
	}

	public List<IdeaVo> selectIdeas() {
		LOGGER.debug("게시물 목록보기");

		List<IdeaVo> result = sqlSession.selectList("schedule.selectSchedules");
		return result;
	}

	public IdeaVo selectIdea(String idxNum) {
		IdeaVo Idea = sqlSession.selectOne("Idea.selectIdea", idxNum);

		return Idea;
	}
	
}
