package com.hanbit.team04.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.IdeaMemberService;
import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.service.ReplyService;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.IdeaMemberVO;
import com.hanbit.team04.core.vo.IdeaVO;
import com.hanbit.team04.core.vo.ReplyVO;

@Controller
public class BoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);


	@Autowired
	private IdeaService ideaService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private IdeaMemberService ideaMemberService;

	@RequestMapping("/list2")
	public String test2() {

		return "/board/board0";
	}
//	@RequestMapping("/list1")
//	public String test1() {
//
//		return "/board/board";
//	}

	@RequestMapping("/api/board/start")
	@ResponseBody
	public List<IdeaVO> getLikeCount() {

		List<IdeaVO> result = new ArrayList<>();
		result = ideaService.getTop3();

		return result;
	}

	 @RequestMapping("/api/board/replyinsert")
	 @ResponseBody
	 public Map<String,Object>ReplyList(@RequestParam int page){

		 LOGGER.info("댓글 가져오기 스타트");

		List<ReplyVO>replyLists	= replyService.getReply(page);
		int totalCount = replyService.getTotalCount();

		Map<String, Object>result = new HashMap<>();

		result.put("totalCount", totalCount);
		result.put("replyLists", replyLists);


		LOGGER.info("댓글 가져오기 스타트 엔드");

	 return result;
	 }

	 @RequestMapping("/api/isLogin")
	 @ResponseBody
	 public Map isLogin(){


		 Session session = SessionHelpler.getSession();

		 Map result = new HashMap<>();

		 if(!session.isLoggedIn()){
			 result.put("userId", "");
		 }
		 else{
			 result.put("userId", session.getUserId());
		 }

		 LOGGER.debug("유저아이디:"+result.get("userId"));

		 return result;
	 }

	 @RequestMapping("/api/board/gologin")
	 @ResponseBody
	 public Map gologin(@RequestParam("userId")String userId , @RequestParam("password")String password){

		 Map result = new HashMap<>();
		 IdeaMemberVO member = ideaMemberService.getMember(userId,password);
		 Session session = SessionHelpler.getSession();

		session.setLoggedIn(true);
		session.setUserId(member.getUserId());

		 result.put("userId", member.getUserId());

		 return result;

	 }

	 @RequestMapping("/board/logout")
	 public void logout(HttpServletResponse response) throws IOException{

		 Session session = SessionHelpler.getSession();
		 session.logout();

		 response.sendRedirect("/list2");
	 }

}
