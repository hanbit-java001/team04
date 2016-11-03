package com.hanbit.team04.core.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.IdeaMemberDAO;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.IdeaMemberVO;

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



	public IdeaMemberVO getMember(String userId, String password) {

		IdeaMemberVO member = ideaMemberDAO.selectMember(userId, password);

		if(member==null){
			throw new RuntimeException("가입되지 않은 이메일입니다.");
		}

		return member;

	}

	public int checking(String checkingId) {
		int result=0;
		if(ideaMemberDAO.checking(checkingId)!=null)
			result=1;
		return result;
	}

	public boolean checkAdmin() {
		Session session =SessionHelpler.getSession();
		LOGGER.debug("check admin service : "+session.getUserId());
		boolean result=false;
		if(session.getUserId()!=null&&session.getUserId().compareTo("admin")==0)
			{result=true;}
		LOGGER.debug("check admin service : "+result);
		return result;
	}

	public String getfileId(String userId) {
		return ideaMemberDAO.selectFileId(userId);
	}


}
