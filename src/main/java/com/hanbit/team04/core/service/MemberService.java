package com.hanbit.team04.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanbit.team04.core.dao.MemberDAO;
import com.hanbit.team04.core.vo.IdeaMemberVO;


@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;

	public IdeaMemberVO getMember(String userId, String password) {

		IdeaMemberVO member = memberDAO.selectMember(userId, password);

		if(member==null){
			throw new RuntimeException("가입되지 않은 이메일입니다.");
		}

		return member;

	}
//
//private static final Logger LOGGER = LoggerFactory.getLogger(IdeaService.class);
//
//
//
//@Autowired
//private MemberDAO memberDAO;
//
//public String joinMember(MemberVo member) {
//	int countMember = memberDAO.countMember(member.getEmail());
//
//	if (countMember > 0) {
//		throw new RuntimeException("이미 가입된 이메일입니다.");
//	}
//
//	String encryptedPassword = encryptPassword(member.getPassword());
//	member.setPassword(encryptedPassword);
//
//	memberDAO.insertMember(member);
//
//	return member.getName();
//}
//
//public boolean modifyMember(MemberVo member) {
//	String passwordFromDB = memberDAO.selectPassword(member.getMemberId());
//	String passwordCurrent = member.getCurrentPassword();
//	String encryptedPasswordCurrent = encryptPassword(passwordCurrent);
//
//	if (!passwordFromDB.equals(encryptedPasswordCurrent)) {
//		throw new RuntimeException("현재 패스워드를 잘못 입력하셨습니다.");
//	}
//
//	String encryptedPassword = encryptPassword(member.getPassword());
//	member.setPassword(encryptedPassword);
//
//	int countUpdate = memberDAO.updateMember(member);
//
//	return countUpdate > 0;
//}
//
//private String encryptPassword(String password) {
//	String encryptedPassword = password;
//
//	return encryptedPassword;
//}

}

