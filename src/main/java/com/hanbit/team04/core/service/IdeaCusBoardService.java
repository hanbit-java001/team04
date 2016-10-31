package com.hanbit.team04.core.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.IdeaCusBoardDAO;
import com.hanbit.team04.core.vo.IdeaCusBoardVO;

@Service
public class IdeaCusBoardService {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaCusBoardService.class);
@Autowired
private IdeaCusBoardDAO cusBoardDAO;
	public int insertBoard(IdeaCusBoardVO ideaCusBoardVO) {
		return cusBoardDAO.insertCusBoard(ideaCusBoardVO);

	}
	public Map getSysdate(){
		return cusBoardDAO.getSysdate();
	}
	public int getIDX(){
		return cusBoardDAO.getIDX();
	}
	public List getIdeas(int pageNum, int age) {
		LOGGER.debug("cus 게시글 목록보기");
		List<Map<String, Object>> lists =  cusBoardDAO.getIdeas(pageNum,age);
		return lists;
	}
	public int totalPageNum(int age) {
		LOGGER.debug("cus 게시글 숫자");
		int lists =  cusBoardDAO.getCusNum(age);
		return lists;
	}


}
