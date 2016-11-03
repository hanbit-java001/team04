package com.hanbit.team04.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hanbit.team04.core.service.FileService;
import com.hanbit.team04.core.service.IdeaBoardService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.FileVO;
import com.hanbit.team04.core.vo.IdeaBoardVO;


@Controller
public class IdeaBoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(IdeaBoardController.class);

	@Autowired
	private IdeaBoardService ideaBoardService;
	@Autowired
	private FileService fileService;

	@LoginRequired
	@RequestMapping("/hyundo/board")
	public String IdeaBoards(){
		return "idea_board";
	}

	@RequestMapping("/api/data")
	@ResponseBody
	public List<IdeaBoardVO> getIdeaBoards(){
		List<IdeaBoardVO> voList = ideaBoardService.getIdeaBoards();

		return voList;
	}
	@RequestMapping("/api/login/data")
	@ResponseBody
	public Session getloginInfo(){
		Session session = SessionHelpler.getSession();
		LOGGER.debug("loginfo check : "+session);
		return session;
	}

	@RequestMapping("/api/totCnt")
	@ResponseBody
	public int getTotalCnt(){
		int totCnt = ideaBoardService.getTotCnt();
		return totCnt;
	}

	@RequestMapping(value="/api/datas",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> IdeaBoards(@RequestParam("pageNum") int pageNum){
		Map<String, Object> result = new HashMap<>();
		List<IdeaBoardVO> voList = ideaBoardService.getIdeaBoards2(pageNum);
		int totalCount = ideaBoardService.getTotCnt();

		result.put("totCnt", totalCount);
		result.put("list", voList);

		return result;
	}


	@RequestMapping("/api/IdeaBoard/insert")
	@ResponseBody
	public int insertIdea(@RequestParam("userId") String userId, @RequestParam("title") String title, @RequestParam("contents") String contents){

		Map param = new HashMap<>();

		param.put("userId", userId);
		param.put("title", title);
		param.put("contents", contents);

		int result = ideaBoardService.putIdea(param);

		return result;
	}

	@RequestMapping(value="/api/IdeaBoard/insert2", method=RequestMethod.POST)
	@ResponseBody
	public int insertIdeaData(MultipartHttpServletRequest request) throws IOException{
		int result = 1;
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String fileId = "";

		Iterator<String> paramNames = request.getFileNames();

		if(paramNames.hasNext()){
			String paramName = paramNames.next();
			MultipartFile file = request.getFile(paramName);

			FileVO fileVO = new FileVO();
			fileVO.setContentType(file.getContentType());
			fileVO.setFileData(file.getBytes());
			fileVO.setFileName(file.getName());
			fileVO.setFileSize(file.getSize());
			fileId = fileService.storeFile(fileVO);

		}
		try{
		IdeaBoardVO ideaBoardVO = new IdeaBoardVO();
		ideaBoardVO.setUserId(userId);
		ideaBoardVO.setTitle(title);
		ideaBoardVO.setContents(contents);
		ideaBoardVO.setFileId(fileId);
		if(ideaBoardService.insertBoard(ideaBoardVO)==1){
			LOGGER.info("checking insert: 잘들어가는군");
		}
		}catch (Exception e) {
			if (StringUtils.isNotBlank(fileId)) {
				try {
					fileService.removeFile(fileId);
					result = 0;
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			throw new RuntimeException(e.getMessage(), e);
		}

		return result;
	}
	
	@RequestMapping("/api/data/hitcnt")
	@ResponseBody
	public int addHitCnt(@RequestParam int IdxNum){
		System.out.println(IdxNum);
		int result = ideaBoardService.addHitCnt(IdxNum);
		return result;
	}
	
	@RequestMapping("/api/data/confirm")
	@ResponseBody
	public int confirmClick(@RequestParam int IdxNum){
		int result = ideaBoardService.confirmClick(IdxNum);
		return result;
	}
	
}
