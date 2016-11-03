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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.team04.core.service.FileService;
import com.hanbit.team04.core.service.IdeaBoardService;
import com.hanbit.team04.core.service.IdeaMemberService;
import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.service.ReplyService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.IdeaBoardVO;
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

	@Autowired
	private IdeaBoardService ideaBoardService;

//	aop 입니다.
	@LoginRequired
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

		System.out.println("top3 데이터지:::::"+result.toString());

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

		 response.sendRedirect("/Home");
	 }

	 @RequestMapping("/api/board/chatinsert")
	 @ResponseBody
	 public Map chatInsert(@RequestParam int page ,@RequestParam("contents")String contents){

		 LOGGER.info("댓글달기 시작");

		 Map result = new HashMap<>();


		 Session session = SessionHelpler.getSession();

		 String userId = session.getUserId();

		 ReplyVO replyVO = new ReplyVO();

		 replyVO.setUserId(userId);
		 replyVO.setContents(contents);

		int success = replyService.addMiniBoard(replyVO);

		result.put("success", success);

//		 result.put("page", 1);
//		 result.put("contents", contents);

		 LOGGER.info("댓글달기 종료");
		 return result;
	 }

	 @RequestMapping("/board/userDetail1")
	public String name() {
		LOGGER.info(">>>>>>>>>> BoardController :: userDetail :: start");



		LOGGER.info(">>>>>>>>>> BoardController :: userDetail :: end");
		return "board/userDetail1";
	}

	 @RequestMapping("/board/userDetail")
	 public String userDetail1(){

		 return "/board/userDetail";
	 }

	 @RequestMapping("/api/board/userDetail")
	 @ResponseBody
	 public Map userDetail(){

	 Session session = SessionHelpler.getSession();

	 int age= session.getAge();
	 String name = session.getName();
	 String userId = session.getUserId();


	int confirmCount = ideaBoardService.getConfirmCount(userId);
	int writeCount = ideaBoardService.getWriteCount(userId);
	String fileId = ideaMemberService.getfileId(userId);

//	 LOGGER.info("시작!!!!!!!!!:"+confirmCount);


	 Map result = new HashMap<>();

	 result.put("name", name);
	 result.put("age", age);
	 result.put("userId", userId);
	 result.put("confirmCount", confirmCount);
	 result.put("writeCount", writeCount);
	 result.put("fileId", fileId);

	 return result;
 }

	 @RequestMapping("tests")
	 public String aa(){

		 return "/board/boardHover";
	 }

	 @RequestMapping("/api/userDetail/writeContents")
	 @ResponseBody
	 public Map getdata(){

		 Map result = new HashMap<>();

		 List<IdeaBoardVO> BoList = new ArrayList<>();

		 Session session = SessionHelpler.getSession();

		 String userId = session.getUserId();

		 BoList = ideaBoardService.getUserDetail(userId);


		 LOGGER.debug("여기여:::::"+BoList.get(1).getTitle());

		 result.put("board_idx" , BoList);
		 result.put("userId", userId);

		 return result;
	 }

//	 @RequestMapping("/api/userDetail/writeContents1")
//	 @ResponseBody
//	 public ModelAndView getdata(ModelMap modelMap){
//
//		 List<IdeaBoardVO> BoList = new ArrayList<>();
//
//		 Session session = SessionHelpler.getSession();
//
//		 String userId = session.getUserId();
//
//		 BoList = ideaBoardService.getUserDetail(userId);
//
//		 LOGGER.debug("여기여:::::"+BoList.get(1).getTitle());
//
//		 modelMap.put("board_idx" , BoList);
//		 modelMap.put("userId", userId);
//		 return new ModelAndView("/board/listUserDetail", modelMap);
//	 }


	 @RequestMapping("/api/userDetail/deleteIcon")
	 @ResponseBody
	 public Map deleteIcon(@RequestParam int boardNum){

		 Map result = new HashMap<>();

		 LOGGER.debug("boardNum"+boardNum);
		 Session session = SessionHelpler.getSession();

		 String userId = session.getUserId();

		 int success = ideaBoardService.deleteData(userId,boardNum);

		 LOGGER.debug("success : "+success);

		 result.put("success", success);

		 return result;
	 }
}
