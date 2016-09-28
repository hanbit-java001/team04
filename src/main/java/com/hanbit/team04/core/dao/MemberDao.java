package com.hanbit.team04.core.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hanbit.team04.core.vo.MemberVo;

public class MemberDao {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberDao.class);

	@Autowired
	private SqlSession sqlSession;

	public int countMember(String email) {

		return 0;
	}

	public int insertMember(MemberVo member) {

		return 0;
	}

	public String selectPassword(int memberId) {

		return null;
	}

	public int updateMember(MemberVo member) {

		return 0;
	}


		
	
}
