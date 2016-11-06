package com.hanbit.team04.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaTweetVO;

@Repository
public class TweetDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(TweetDAO.class);
	@Autowired
	private SqlSession sqlSession;

	public int insertTweet(IdeaTweetVO ideaTweet) {
		LOGGER.debug("tweet DAO : "+ideaTweet);

		return sqlSession.insert("ideaTweet.insertTweet",ideaTweet);
	}

	public int updateTweet(List<Map> selectUpdateList) {
		int result =0;
		for (Map map : selectUpdateList) {
			result =sqlSession.update("ideaTweet.updateTweet", map);
		}
		return result;
	}

	public List selectTweet() {
		List<IdeaTweetVO> list =sqlSession.selectList("ideaTweet.selectTweet");
		LOGGER.debug("tweet list : "+list );
		return list;
	}

}
