package com.hanbit.team04.core.dao;

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

		return sqlSession.insert("IdeaTweet.insertTweet",ideaTweet);
	}

}
