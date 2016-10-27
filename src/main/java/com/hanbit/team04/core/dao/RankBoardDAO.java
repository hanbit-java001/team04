package com.hanbit.team04.core.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.RankBoardVO;


@Repository
public class RankBoardDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(RankBoardDAO.class);

	@Autowired
	private SqlSession sqlSession;

	public List<RankBoardVO> selectRankBoards() {
		return sqlSession.selectList("rankboard.selectBoards");
	}

}
