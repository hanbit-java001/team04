package com.hanbit.team04.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaVO;

@Repository
public class IdeaDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaDAO.class);

	@Autowired
	private SqlSession sqlSession;

	public int insertIdea(IdeaVO Idea) {
		LOGGER.debug("게시물 등록");

		int result = sqlSession.insert("Idea.insertIdea", Idea);
		return result;
	}

	public int updateIdea(IdeaVO Idea) {
		LOGGER.debug("게시물 수정");
		int result = sqlSession.update("Idea.updateIdea", Idea);

		return result;
	}

	public int deleteIdea(IdeaVO idea) {
		LOGGER.debug("게시물 삭제");
		int result = sqlSession.delete("Idea.deleteIdea", idea.getIdxNum());

		return result;
	}

	public List<IdeaVO> selectIdeas() {
		LOGGER.debug("게시물 목록보기");
		List<IdeaVO> result = sqlSession.selectList("Idea.selectIdeas");

		return result;
	}

	public IdeaVO selectIdea(String idxNum) {
		LOGGER.debug("게시물 상세보기");
		IdeaVO Idea = sqlSession.selectOne("Idea.selectIdea", idxNum);

		return Idea;
	}

	public int countIdeas() {
		LOGGER.debug("전체 게시물 숫자 보기");
		int result = sqlSession.selectOne("Idea.countIdea");

		return result;

	}

	public List<IdeaVO> selectIdeas(int i, int j) {
		LOGGER.debug("페이지 게시물 select");
		Map<String, Integer> parameter=new HashedMap();
		parameter.put("startIndex", i);
		parameter.put("endIndex", j);
		List<IdeaVO> result = sqlSession.selectList("Idea.selectIdeaPage", parameter);

		return result;
	}

	public int selectNextIndex() {
		LOGGER.debug("index_num adding");
		return sqlSession.selectOne("Idea.selectNextIndex");
	}

	public List<Map<String, Object>> getIdeas(int pageNum) {
		LOGGER.debug("get page");
		List<Map<String, Object>> result = sqlSession.selectList("Idea.selectPage", pageNum);
		return result;
	}


}