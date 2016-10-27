package com.hanbit.team04.core.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.IdeaCusBoardDAO;
import com.hanbit.team04.core.vo.IdeaCusBoardVO;

@Service
public class IdeaCusBoardService {
@Autowired
private IdeaCusBoardDAO cusBoardDAO;
	public int insertBoard(IdeaCusBoardVO ideaCusBoardVO) {
		ideaCusBoardVO.setRegDate(getSysdate().get("SYSDATE").toString());
		ideaCusBoardVO.setCusIDX(getIDX());
		ideaCusBoardVO.setHitcnt(1);
		return cusBoardDAO.insertCusBoard(ideaCusBoardVO);

	}
	public Map getSysdate(){
		return cusBoardDAO.getSysdate();
	}
	public int getIDX(){
		return cusBoardDAO.getIDX();
	}

}
