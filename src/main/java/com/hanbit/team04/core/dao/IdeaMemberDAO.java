package com.hanbit.team04.core.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaMemberVO;

@Repository
public class IdeaMemberDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaMemberDAO.class);
	@Autowired
	private SqlSession sqlSession;
	public String checkLogin(Map<String,String> logInfo) {
		LOGGER.debug("check loginfo"+logInfo);
		return sqlSession.selectOne("IdeaMember.checkloInfo", logInfo);
	}
	public int createLogInfo(IdeaMemberVO createUser) {
		int result= sqlSession.insert("IdeaMember.createLogInfo", createUser);
		LOGGER.debug("check create info "+result);
		return result ;
	}
	public String checking(String checkingId) {
		LOGGER.debug("checking id ");
		return sqlSession.selectOne("IdeaMember.checking", checkingId);
	}
	public IdeaMemberVO selectMember(String userId, String password) {

		Map param = new HashMap<>();
		param.put("userId", userId);
		param.put("password", password);

		return sqlSession.selectOne("IdeaMember.selectMember",param);

	}
}
