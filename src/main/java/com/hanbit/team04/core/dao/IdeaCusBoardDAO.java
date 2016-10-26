package com.hanbit.team04.core.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaCusBoardVO;

@Repository
public class IdeaCusBoardDAO {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaCusBoardDAO.class);
	@Autowired
	private SqlSession Sqlsession;
	public Map getSysdate() {
		// TODO Auto-generated method stub
		return Sqlsession.selectOne("cusBoard.selectSysdate");
	}
	public int getIDX() {
		// TODO Auto-generated method stub
		return Sqlsession.selectOne("cusBoard.selectNextIndex");
	}
	public void insertCusBoard(IdeaCusBoardVO ideaCusBoardVO) {
		// TODO Auto-generated method stub
		Sqlsession.insert("cusBoard.insertCus",ideaCusBoardVO);
	}

}
