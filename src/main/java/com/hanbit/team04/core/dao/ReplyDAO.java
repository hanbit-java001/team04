package com.hanbit.team04.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hanbit.team04.core.vo.ReplyVO;
import com.hanbit.team04.web.controller.BoardController;

@Repository
public class ReplyDAO {

	private static final Logger LOGGER = LoggerFactory.getLogger(ReplyDAO.class);
@Autowired
private SqlSession Sqlsession;


public List<ReplyVO>selectReply(int page){

	return Sqlsession.selectList("reply.selectReply", page);

}


public int selectTotalCount() {
int result =Sqlsession.selectOne("reply.selectTotalCount");
LOGGER.debug("result int: "+result);
	return result;
}
public int selectNextIndex() {
	LOGGER.debug("index_num adding");
	return Sqlsession.selectOne("reply.selectNextIndex");
}


public int insertBoard(ReplyVO replyVO) {
	return Sqlsession.insert("reply.insertmini", replyVO);
}


}
