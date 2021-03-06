package com.hanbit.team04.web.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.annotation.JsonTypeIdResolver;
import com.hanbit.team04.core.service.BoardService;
import com.hanbit.team04.core.session.LoginRequired;
import com.hanbit.team04.core.session.Session;
import com.hanbit.team04.core.session.SessionHelpler;
import com.hanbit.team04.core.vo.BongBoardPage;
import com.hanbit.team04.core.vo.BongBoardVO;
import com.hanbit.team04.core.vo.BongCommentVO;
import com.hanbit.team04.core.vo.BongFileVO;

@Controller
public class BongBoardController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BongBoardController.class);
	@Autowired
	private BoardService service;

	public void setService(BoardService service) {
		this.service = service;
	}

	@RequestMapping("/boardMain.do")
	public ModelAndView boardMain(@RequestParam(defaultValue = "1") int page) {
		System.out.println("page:" + page);
		BongBoardPage articlePage = service.makePage(page);
		List<BongBoardVO> currentArticleList = service.makeCurrentArticleList();

		ModelAndView mv = new ModelAndView();
		mv.addObject("articlePage", articlePage);
		mv.addObject("currentArticleList", currentArticleList);
		Session session = SessionHelpler.getSession();
		if (session.isLoggedIn()) {
			mv.addObject("userName", session.getUserId());
			// mv.addObject("userName", session.getName());
		}
		mv.addObject("userName", session.getUserId());
		mv.setViewName("board_list");

		return mv;
	}

	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "write";
	}

	@RequestMapping("/write.do")
	public ModelAndView write(BongBoardVO article) {
		ModelAndView mv = new ModelAndView();
		LOGGER.debug("check bong article : " + article);
		int result = service.writeArticle(article);
		if (result > 0) {
			mv.addObject("bId", article.getbId());
			mv.setViewName("write_success");
		} else {
			mv.setViewName("write_fail");
		}
		return mv;
	}

	@RequestMapping("/read.do")
	public ModelAndView read(int bId, @RequestParam(defaultValue = "false") boolean rc) {
		ModelAndView mv = new ModelAndView();
		LOGGER.debug("check init :" + bId + " , " + rc);
		BongBoardVO article = service.readArticle(bId, rc);
		List<BongBoardVO> currentArticleList = service.makeCurrentArticleList();

		mv.addObject("currentArticleList", currentArticleList);
		mv.addObject("article", article);
		mv.setViewName("detail");
		LOGGER.debug("check Bong read : " + mv.getModel().get("article"));
		return mv;
	}

	@RequestMapping("/replyForm.do")
	public ModelAndView replyForm(int parentId) {
		BongBoardVO parent = service.readArticle(parentId, false);

		ModelAndView mv = new ModelAndView();
		mv.addObject("parent", parent);
		mv.setViewName("reply_form");
		return mv;
	}

	@RequestMapping("/reply.do")
	public ModelAndView reply(BongBoardVO article, int parentId) {
		ModelAndView mv = new ModelAndView();
		int result = service.writeReply(article, parentId);
		if (result > 0) {
			mv.addObject("bId", article.getbId());
			mv.setViewName("write_success");
		} else {
			mv.setViewName("write_fail");
		}
		return mv;
	}

	@RequestMapping("/updateForm.do")
	@ResponseBody
	public BongBoardVO updateForm(int bId) {
		BongBoardVO origin = service.readArticle(bId, false);

		// ModelAndView mv = new ModelAndView();
		// mv.addObject("origin", origin);
		// mv.setViewName("update_form");
		Map map = new HashMap<>();
		map.put("bTitle", origin.getbTitle());
		map.put("bContent", origin.getbContent());
		map.put("bId", origin.getbId());
		Session session = SessionHelpler.getSession();
		LOGGER.debug("check session info : " + session);
		map.put("userName", session.getName());
		return origin;
	}

	@RequestMapping("/modify/info")
	@ResponseBody
	public Map modifyInfo(int bId) {
		BongBoardVO origin = service.readArticle(bId, false);

		Map map = new HashMap<>();
		map.put("bTitle", origin.getbTitle());
		map.put("bContent", origin.getbContent());
		Session session = SessionHelpler.getSession();
		LOGGER.debug("check session info : " + session);
		map.put("bId", origin.getbId());
		map.put("userName", session.getName());
		return map;
	}

	@RequestMapping("/update.do")
	   public ModelAndView update(BongBoardVO article){
	      ModelAndView mv = new ModelAndView();
	      int result = service.modify(article);
	      if(result == 1){
	         mv.addObject("articleId", article.getbId());
	         mv.setViewName("update_success");
	      }else{
	         mv.setViewName("update_fail");
	      }      
	      return mv;
	   }

	@RequestMapping("/deleteForm.do")
	public ModelAndView deleteForm(int articleId) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleId", articleId);
		mv.setViewName("deleteForm");
		return mv;
	}

	@RequestMapping("/delete.do")
	public String delete(int bId) {
		Session session = SessionHelpler.getSession();
		int result = service.delete(bId, session.getUserId());
		if (result > 0) {
			return "delete_success";
		} else {
			return "delete_fail";
		}
	}

	@RequestMapping("/writeComment.do")
	public void writeComment(BongCommentVO comment, HttpServletResponse response) {
		service.writeComment(comment);
		ModelAndView mv = new ModelAndView();

		BongBoardVO article = service.readArticle(comment.getbId(), false);

		try {
			response.sendRedirect("read.do?bId=" + comment.getbId());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/api/loginCheck")
	@ResponseBody
	public Map loginCheck() {
		boolean result = false;
		Map map = new HashMap();
		Session session = SessionHelpler.getSession();
		if (session.isLoggedIn()) {
			result = true;
			map.put("userName", session.getUserId());
			System.out.println("yang:" + session.getUserId());
		}
		map.put("isloggedIn", result);
		//// 연습중입니다.
		return map;
	}

	@RequestMapping("/download.do")
	public void download(HttpServletResponse response, int bfId) {
		BongFileVO fileInfo = service.readFileInfo(bfId);

		response.setContentType("application/octet-stream; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileInfo.getBfOriginalName() + "\"");

		try {
			FileInputStream is = new FileInputStream(fileInfo.getBfSavedPath());
			ServletOutputStream os = response.getOutputStream();

			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = is.read(buf)) != -1) {
				os.write(buf, 0, size);
			}

			is.close();
			os.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
