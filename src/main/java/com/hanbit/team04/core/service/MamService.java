package com.hanbit.team04.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.MamDAO;
import com.hanbit.team04.core.vo.MamVO;

@Service
public class MamService {
	@Autowired
	private MamDAO mamDAO;

	public List<MamVO> dataView(){
		return mamDAO.selectData();

	}

}
