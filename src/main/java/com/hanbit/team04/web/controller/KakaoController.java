package com.hanbit.team04.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hanbit.team04.core.service.FileService;
import com.hanbit.team04.core.service.IdeaBoardService;
import com.hanbit.team04.core.service.IdeaCusBoardService;
import com.hanbit.team04.core.service.IdeaMemberService;
import com.hanbit.team04.core.service.IdeaService;
import com.hanbit.team04.core.service.ReplyService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.FileVO;
import com.hanbit.team04.core.vo.IdeaBoardVO;
import com.hanbit.team04.core.vo.IdeaCusBoardVO;
import com.hanbit.team04.core.vo.IdeaMemberVO;
import com.hanbit.team04.twitter.UpdateTweet;

@Controller
public class KakaoController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);
	@Autowired
	private IdeaService ideaService;
	@Autowired
	private IdeaBoardService ideaBoardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private IdeaMemberService ideaMemberService;
	@Autowired
	private IdeaCusBoardService ideaCusBoardService;
	@Autowired
	private FileService fileService;

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
//	aop 입니다.
	@RequestMapping("/board/list_oh")
	public String listOh() {
		LOGGER.info("testController - test");
		return "board_first";
	}
	@UpdateTweet
	@RequestMapping("/Home")
	public String mainPage() {
		LOGGER.info("testController - test");
		 Date date = new Date();
//		 for(int i=0;i<50;i++){
//			 IdeaBoardVO BVO = new IdeaBoardVO();
//					  BVO.setTitle("hyundo_title_"+"hundo_"+i);
////					  BVO.setRegDate(date.toString());
////					  BVO.setModDate(date.toString());
//					  BVO.setContents("hyundo_contents_"+"hundo_"+i+"contentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontentscontents");
//					  BVO.setUserId("dd@test.com");
//					  BVO.setFileId("NULL");
//					  ideaBoardService.insertBoard(BVO);
//					  //			 IdeaCusBoardVO CVO = new IdeaCusBoardVO();
////			 CVO.setAgeGroup(i+1);
////			 CVO.setContents("contents"+i);
////			 CVO.setFileId("null");
////			 CVO.setHitcnt(1);
////			 CVO.setTitle("title"+i);
////			 int result=ideaCusBoardService.insertBoard(CVO);
////					if(result==0){
////						LOGGER.info("testController - insert board error");
////					}
//		 }

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
		Session session = SessionHelpler.getSession();
		if(!session.isLoggedIn()){
			session.setAge(20);
		}
		List list = ideaCusBoardService.getIdeas(pageNum,session.getAge());
		int totalPage = ideaCusBoardService.totalPageNum(session.getAge());
		myresult.put("list", list);
		myresult.put("totoalPage", totalPage);
		LOGGER.info("testController - result" + myresult);
		return myresult;
	}

	@RequestMapping(value="/api/Create/user" , method=RequestMethod.POST)
	@ResponseBody
	public int createLogInfo(MultipartHttpServletRequest request) throws Exception {
		int result=0;
		IdeaMemberVO createUser = new IdeaMemberVO();
		createUser.setAge(Integer.parseInt(request.getParameter("age")));
		createUser.setName(request.getParameter("name"));
		createUser.setPassword(request.getParameter("password"));
		createUser.setUserId(request.getParameter("userId"));
		String fileId = "NULL";

		Iterator<String> paramNames = request.getFileNames();
		LOGGER.info("checking FILE" +createUser.getFileId()+ " , "+createUser.getName() +" , "+paramNames);
		if (paramNames.hasNext()) {
			String paramName = paramNames.next();

			MultipartFile file = request.getFile(paramName);

			FileVO fileVO = new FileVO();
			fileVO.setContentType(file.getContentType());
			fileVO.setFileSize(file.getSize());
			fileVO.setFileName(file.getName());
			fileVO.setFileData(file.getBytes());
			LOGGER.info("checking FILE 2 : "+fileVO.getFileName());
			fileId = fileService.storeFile(fileVO);
		}
		try {
			createUser.setFileId(fileId);
			if(ideaMemberService.createlogInfo(createUser)==1){
				LOGGER.info("checking insert: 잘들어가는군");
			}
			result=1;
		}
		catch (Exception e) {
			if (StringUtils.isNotBlank(fileId)) {
				fileService.removeFile(fileId);
			}

			throw new RuntimeException(e.getMessage(), e);
		}


		LOGGER.info("check create" + createUser);
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
		session.setName(ideaMemberVO.getName());
		}
		return result;
	}

	@RequestMapping(value="/api/CheckId", method=RequestMethod.GET)
	@ResponseBody
	public int getSchedule(@RequestParam("checkingId") String checkingId) {
		LOGGER.info("checking id" +checkingId);
		return ideaMemberService.checking(checkingId);
	}
	@RequestMapping(value="/api/update/hitCnt", method=RequestMethod.GET)
	@ResponseBody
	public int uptoHitCnt(@RequestParam("cusIDX") int cusIDX, @RequestParam("hitCnt") int hitCnt) {
		LOGGER.info("checking up to hitcnt :" +cusIDX+" , "+hitCnt);
		return ideaCusBoardService.uptoHitCnt(cusIDX,hitCnt);
	}
	@RequestMapping(value="/api/check/admin", method=RequestMethod.GET)
	@ResponseBody
	public boolean getCheckAdmin() {
		LOGGER.info("checking admin");
		return ideaMemberService.checkAdmin();
	}
	@RequestMapping(value="/api/board/add", method=RequestMethod.POST)
	@ResponseBody
	public Map doJoin(MultipartHttpServletRequest request) throws Exception {

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		int age_group = Integer.parseInt((String)request.getParameter("age"));
		String fileId = "";

		Iterator<String> paramNames = request.getFileNames();
		LOGGER.info("checking FILE" +title+ " , "+contents +" , "+paramNames);
		if (paramNames.hasNext()) {
			String paramName = paramNames.next();

			MultipartFile file = request.getFile(paramName);

			FileVO fileVO = new FileVO();
			fileVO.setContentType(file.getContentType());
			fileVO.setFileSize(file.getSize());
			fileVO.setFileName(file.getName());
			fileVO.setFileData(file.getBytes());
			LOGGER.info("checking FILE 2 : "+fileVO.getFileName());
			fileId = fileService.storeFile(fileVO);
		}
		try {
			IdeaCusBoardVO ideaCusBoardVO = new IdeaCusBoardVO();
			ideaCusBoardVO.setTitle(title);
			ideaCusBoardVO.setContents(contents);
			ideaCusBoardVO.setAgeGroup(age_group);
			ideaCusBoardVO.setFileId(fileId);
			if(ideaCusBoardService.insertBoard(ideaCusBoardVO)==1){
				LOGGER.info("checking insert: 잘들어가는군");
			}

		}
		catch (Exception e) {
			if (StringUtils.isNotBlank(fileId)) {
				fileService.removeFile(fileId);
			}

			throw new RuntimeException(e.getMessage(), e);
		}

		Map result = new HashMap();
		result.put("check", "잘들어감");

		return result;
//		return null;
		}
}
