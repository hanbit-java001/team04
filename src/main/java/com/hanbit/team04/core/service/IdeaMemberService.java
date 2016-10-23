package com.hanbit.team04.core.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.IdeaMemberDAO;
import com.hanbit.team04.core.vo.IdeaMemberVO;
import com.hanbit.team04.web.controller.WelcomeController;

@Service
public class IdeaMemberService {
	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaMemberService.class);
	@Autowired
	private IdeaMemberDAO ideaMemberDAO;

	public int checkLogin(String userId, String password) {
		Map<String,String> logInfo = new HashMap<>();
		logInfo.put("userId", userId);
		logInfo.put("password", password);
		int result; 
		if(ideaMemberDAO.checkLogin(logInfo)!=null)
			result=1;
		else
			result=0;
		return result;
	}

	public int createlogInfo(IdeaMemberVO createUser) {
		return ideaMemberDAO.createLogInfo(createUser);
	}

}
