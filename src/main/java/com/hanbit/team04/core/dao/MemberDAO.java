package com.hanbit.team04.core.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.MemberVo;


@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	public MemberVo selectMember(String name, String password) {

		Map param = new HashMap<>();
		param.put("name", name);
		param.put("password", password);

		return sqlSession.selectOne("member.selectMember",param);

	}
//
//	private static final Logger LOGGER = LoggerFactory.getLogger(MemberDAO.class);
//
//	@Autowired
//	private SqlSession sqlSession;
//
//	public static int countMember(String email) {
//
//		return 0;
//	}
//
//	public static int insertMember(MemberVo member) {
//
//		return 0;
//	}
//
//	public String selectPassword(int memberId) {
//
//		return null;
//	}
//
//	public int updateMember(MemberVo member) {
//
//		return 0;
//	}
//
}
