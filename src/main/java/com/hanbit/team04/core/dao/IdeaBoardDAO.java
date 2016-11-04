package com.hanbit.team04.core.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.IdeaBoardVO;
import com.hanbit.team04.core.vo.IdeaMemberVO;
import com.hanbit.team04.core.vo.IdeaVO;


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

	public Map selectSysDate() {
		return sqlSession.selectOne("ideaBoard.selectSysdate");
	}

	public int insertBoard(IdeaBoardVO bVO) {
		return sqlSession.insert("ideaBoard.insertIdea",bVO);
	}

	public int selectConfirmCount(String userId) {
		return sqlSession.selectOne("ideaBoard.selectConfirmCount", userId);
	}

	public int selectWriteCount(String userId) {
		return sqlSession.selectOne("ideaBoard.selectWriteCount", userId);
	}

	public int insertIdea(Map param) {
		return sqlSession.insert("ideaBoard.insertIdeas", param);
	}

	public List<IdeaBoardVO> selectUserDetail(String userId) {
		return sqlSession.selectList("ideaBoard.selectUserDetail", userId);
	}

	public int insertData(IdeaBoardVO ideaBoardVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert("ideaBoard.insertData", ideaBoardVO);
	}

	public int deleteBoardData(String userId, int boardNum) {
		Map param = new HashMap<>();
		LOGGER.debug("delete start ?: "+userId +" , "+boardNum);
		param.put("boardNum", boardNum);
		param.put("userId", userId);

		int result = sqlSession.delete("ideaBoard.deleteBoardData", param);
		LOGGER.debug("delete number : "+ result);
		return result;
	}

	public int addHitCnt(int IdxNum) {
		return sqlSession.update("ideaBoard.addHitCnt", IdxNum);
	}

	public int confirmClick(int IdxNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("ideaBoard.confirmClick", IdxNum);
	}

	public IdeaBoardVO selectIdea(int idxNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ideaBoard.ideaOne", idxNum);
	}

}
