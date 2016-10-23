package com.hanbit.team04.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbit.team04.core.service.IdeaMemberService;
import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.service.ReplyService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.IdeaMemberVO;

@Controller
public class KakaoController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);
	@Autowired
	private IdeaService ideaService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private IdeaMemberService ideaMemberService;

	@RequestMapping("/kakao")
	public String list() {
		LOGGER.info("IdeaController - start");
		return "kakaotest";
	}

	@RequestMapping("/mytestoh")
	public String testoh() {
		LOGGER.info("testController - test");
		return "testoh";
	}

	@RequestMapping("/mytestoh2")
	public String testoh2() {
		LOGGER.info("testController - test");
		return "testoh2";
	}
	@LoginRequired
	@RequestMapping("/board/list_oh")
	public String listOh() {
		LOGGER.info("testController - test");
		return "board_first";
	}

	@RequestMapping("/Home")
	public String mainPage() {
		LOGGER.info("testController - test");
		// Date date = new Date();
		// for(int i=0;i<200;i++){
		// IdeaVO ideaVO = new IdeaVO(0, "title"+i, date.toString(),
		// "contents"+i, "userId"+i, date.toString(), 'N', 1, "NULL");
		// ideaService.addIdea(ideaVO);
		// if(i%2==0){
		// ReplyVO replyVO = new ReplyVO(0, "userId"+i, "contents"+i,
		// date.toString());
		// replyService.addMiniBoard(replyVO);
		// }
		// }

		return "mainHome";
	}

	@RequestMapping("/user/create")
	public String createUser() {
		LOGGER.info("testController - create user");
		return "createUser";
	}

	@RequestMapping("/login")
	public String loginUser() {
		LOGGER.info("testController - login user");
		return "login";
	}

	@RequestMapping(value = "/data/list{pageNum}", method = RequestMethod.GET)
	@ResponseBody
	public Map getList(@PathVariable("pageNum") int pageNum) {
		LOGGER.info("testController - pageList === " + pageNum);

		Map myresult = new HashMap();
		List list = ideaService.getIdeas(pageNum);
		int totalPage = ideaService.totalPageNum();
		myresult.put("list", list);
		myresult.put("totoalPage", totalPage);
		LOGGER.info("testController - result" + myresult);
		return myresult;
	}

	@RequestMapping("/api/Create/user")
	@ResponseBody
	public int createLogInfo(@RequestBody IdeaMemberVO createUser) {
		LOGGER.info("check create" + createUser);
		int result  = ideaMemberService.createlogInfo(createUser);
		return result;
//		return 0;
	}

	@RequestMapping(value="/api/logInfo", method=RequestMethod.POST)
	@ResponseBody
	public int checkLogin(@RequestParam("userId") String userId, @RequestParam("password") String password) {
		LOGGER.info("check create" + userId + " , " + password);
		int result = ideaMemberService.checkLogin(userId, password);
		LOGGER.info("check result : " + result);
		if(result==1){
			IdeaMemberVO ideaMemberVO = ideaMemberService.getMember(userId, password);
		Session session = SessionHelpler.getSession();
		session.setLoggedIn(true);
		session.setUserId(ideaMemberVO.getUserId());
		session.setAge(ideaMemberVO.getAge());
		session.setName(ideaMemberVO.getname());
		}
		return result;
	}
	
	@RequestMapping(value="/api/CheckId", method=RequestMethod.GET)
	@ResponseBody
	public int getSchedule(@RequestParam("checkingId") String checkingId) {
		LOGGER.info("checking id" +checkingId);
		return ideaMemberService.checking(checkingId);
	}

}
