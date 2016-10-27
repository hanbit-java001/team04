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

@Controller
public class KakaoController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WelcomeController.class);
	@Autowired
	private IdeaService ideaService;
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
//	@LoginRequired
//	aop 입니다.
	@RequestMapping("/board/list_oh")
	public String listOh() {
		LOGGER.info("testController - test");
		return "board_first";
	}

	@RequestMapping("/Home")
	public String mainPage() {
		LOGGER.info("testController - test");
		 Date date = new Date();
//		 for(int i=0;i<32;i++){
//			 IdeaBoardVO BVO = new IdeaBoardVO();
//					  BVO.setTitle("hyundo_title_"+i);
////					  BVO.setRegDate(date.toString());
////					  BVO.setModDate(date.toString());
//					  BVO.setContents("hyundo_contents_"+i);
//					  BVO.setUserId("hyundo_userId_"+i);
//					int result=  ideaService.insertboard(BVO);
//					if(result==0){
//						LOGGER.info("testController - insert board error");
//					}
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
	@RequestMapping(value="/api/board/add", method=RequestMethod.POST)
	@ResponseBody
	public Map doJoin(MultipartHttpServletRequest request) throws Exception {

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String age_group = request.getParameter("ageGroup");
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
