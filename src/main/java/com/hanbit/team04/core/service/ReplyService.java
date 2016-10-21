package com.hanbit.team04.core.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.ReplyDAO;
import com.hanbit.team04.core.vo.ReplyVO;

@Service
public class ReplyService {

	@Autowired
	private ReplyDAO replyDao;

	private static final Logger LOGGER = LoggerFactory.getLogger(ReplyService.class);

	public List<ReplyVO> getReply(int page) {

		return replyDao.selectReply(page);
	}

	public int getTotalCount() {

		return replyDao.selectTotalCount();
	}

	public int getIndex() {
		return replyDao.selectNextIndex();
	}

	public int addMiniBoard(ReplyVO replyVO) {
		replyVO.setMinSeq(getIndex());
		return replyDao.insertBoard(replyVO);
	}

}
