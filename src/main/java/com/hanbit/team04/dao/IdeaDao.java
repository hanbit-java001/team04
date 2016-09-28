package com.hanbit.team04.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.IdeaVo;

@Repository
public class IdeaDao {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaDao.class);

	@Autowired
	private SqlSession sqlSession;

	public int insertIdea(IdeaVo Idea) {// 게시글 등록
		LOGGER.debug("insertIdea");
		int result = sqlSession.insert("Idea.insertIdea", Idea);

		return result;
	}

	public int updateIdea(IdeaVo Idea) {// 게시글 수정
		int result = sqlSession.update("Idea.updateIdea", Idea);

		return result;
	}

	public int deleteIdea(String IdeaId) {// 게시글 삭제
		int result = sqlSession.delete("Idea.deleteIdea", IdeaId);

		return result;
	}

	public List<IdeaVo> selectIdeas() {// 게시글 목록 보기
		List<IdeaVo> result = sqlSession.selectList("Idea.selectIdeas");

		return result;
	}

	public IdeaVo selectIdea(String idxNum) {// 상세 보기
		IdeaVo Idea = sqlSession.selectOne("Idea.selectIdea", idxNum);

		return Idea;
	}
	
}
