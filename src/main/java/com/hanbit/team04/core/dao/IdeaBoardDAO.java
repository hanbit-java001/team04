package com.hanbit.team04.core.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaBoardVO;


@Repository
public class IdeaBoardDAO {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaBoardDAO.class);
	
	@Autowired
	private SqlSession sqlSession;

	public List<IdeaBoardVO> selectBoards() {
		return sqlSession.selectList("ideaBoard.selectBoards");
	}

	public int selectTotCnt() {
		return sqlSession.selectOne("ideaBoard.selectTotCnt");
	}

	public List<IdeaBoardVO> selectBoards2(int pageNum) {
		return sqlSession.selectList("ideaBoard.selectBoards2", pageNum);
	}

}