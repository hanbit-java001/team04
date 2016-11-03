package com.hanbit.team04.core.dao;

import java.util.HashMap;
import java.util.List;
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
	public int insertCusBoard(IdeaCusBoardVO ideaCusBoardVO) {
		return Sqlsession.insert("cusBoard.insertCus",ideaCusBoardVO);
	}
	public List<Map<String, Object>> getIdeas(int pageNum, int age) {
		LOGGER.debug("get page");
		Map map =new HashMap<>();
		map.put("pageNum", pageNum);
		map.put("age", age);
		List<Map<String, Object>> result = Sqlsession.selectList("cusBoard.selectPage", map);
		return result;
	}
	public int getCusNum(int age) {
		LOGGER.debug("get DAO age : "+age);
		return Sqlsession.selectOne("cusBoard.selectPageNum", age);
	}
	public int uptoHitCnt(int cusIDX, int hitCnt) {

		Map parameter =new HashMap<>();
		parameter.put("cusIDX", cusIDX);
		parameter.put("hitCnt", hitCnt);

		return Sqlsession.update("cusBoard.updateHitCnt", parameter);
	}
	public int selectHitCnt(int cusIDX) {
		Map parameter =new HashMap<>();
		parameter.put("cusIDX", cusIDX);
		return Sqlsession.selectOne("cusBoard.selectHitCnt",parameter);
	}

}
