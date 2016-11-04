package com.hanbit.team04.core.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.MamVO;

@Repository
public class MamDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<MamVO> selectData(){
		return sqlSession.selectList("bong.selectData");

	}
}
