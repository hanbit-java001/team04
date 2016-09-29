package com.hanbit.team04.core.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.hanbit.team04.core.dao.IdeaDao;
import com.hanbit.team04.core.dao.MemberDAO;
import com.hanbit.team04.core.vo.IdeaVo;
import com.hanbit.team04.core.vo.MemberVo;

public class MemberService {

private static final Logger LOGGER = LoggerFactory.getLogger(IdeaService.class);
	


@Autowired
private MemberDAO memberDAO;

public String joinMember(MemberVo member) {
	int countMember = memberDAO.countMember(member.getEmail());

	if (countMember > 0) {
		throw new RuntimeException("이미 가입된 이메일입니다.");
	}

	String encryptedPassword = encryptPassword(member.getPassword());
	member.setPassword(encryptedPassword);

	memberDAO.insertMember(member);

	return member.getName();
}

public boolean modifyMember(MemberVo member) {
	String passwordFromDB = memberDAO.selectPassword(member.getMemberId());
	String passwordCurrent = member.getCurrentPassword();
	String encryptedPasswordCurrent = encryptPassword(passwordCurrent);

	if (!passwordFromDB.equals(encryptedPasswordCurrent)) {
		throw new RuntimeException("현재 패스워드를 잘못 입력하셨습니다.");
	}

	String encryptedPassword = encryptPassword(member.getPassword());
	member.setPassword(encryptedPassword);

	int countUpdate = memberDAO.updateMember(member);

	return countUpdate > 0;
}

private String encryptPassword(String password) {
	String encryptedPassword = password;

	return encryptedPassword;
}

}

