package com.hanbit.team04.web.controller;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.team04.core.service.BoardService;
import com.hanbit.team04.core.vo.BongBoardPage;
import com.hanbit.team04.core.vo.BongBoardVO;
import com.hanbit.team04.core.vo.BongCommentVO;
import com.hanbit.team04.core.vo.BongFileVO;

@Controller
public class BongBoardController {
	@Autowired
	private BoardService service;
	public void setService(BoardService service) {
		this.service = service;
	}
	@RequestMapping("/boardMain.do")
	public ModelAndView boardMain(@RequestParam(defaultValue="1")int page){
		System.out.println("page:"+page);
		BongBoardPage articlePage = service.makePage(page);
		List<BongBoardVO> currentArticleList = service.makeCurrentArticleList();

		ModelAndView mv = new ModelAndView();
		mv.addObject("articlePage", articlePage);
		mv.addObject("currentArticleList", currentArticleList);
		mv.setViewName("board_list");

		return mv;
	}
	@RequestMapping("/writeForm.do")
	public String writeForm(){
		return "write";
	}

	@RequestMapping("/write.do")
	public ModelAndView write(BongBoardVO article){
		ModelAndView mv = new ModelAndView();
		int result=service.writeArticle(article);
		if(result>0){
			mv.addObject("bId", article.getbId());
			mv.setViewName("write_success");
		}else{
			mv.setViewName("write_fail");
		}
		return mv;
	}

	@RequestMapping("/read.do")
	public ModelAndView read(int bId, @RequestParam(defaultValue="false")boolean rc){
		ModelAndView mv = new ModelAndView();

		BongBoardVO article = service.readArticle(bId, rc);
		List<BongBoardVO> currentArticleList = service.makeCurrentArticleList();

		mv.addObject("currentArticleList", currentArticleList);
		mv.addObject("article", article);
		mv.setViewName("detail");
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
	public ModelAndView reply(BongBoardVO article,int parentId){
		ModelAndView mv = new ModelAndView();
		int result=service.writeReply(article, parentId);
		if(result>0){
			mv.addObject("bId", article.getbId());
			mv.setViewName("write_success");
		}else{
			mv.setViewName("write_fail");
		}
		return mv;
	}

	@RequestMapping("/updateForm.do")
	public ModelAndView updateForm(int articleId){
		BongBoardVO origin = service.readArticle(articleId, false);

		ModelAndView mv = new ModelAndView();
		mv.addObject("origin", origin);
		mv.setViewName("update_form");
		return mv;
	}

	@RequestMapping("/update.do")
	public ModelAndView update(BongBoardVO article){
		ModelAndView mv = new ModelAndView();
		int result = service.modify(article);
		if(result>0){
			mv.addObject("articleId", article.getbId());
			mv.setViewName("update_success");
		}else{
			mv.setViewName("update_fail");
		}
		return mv;
	}

	@RequestMapping("/deleteForm.do")
	public ModelAndView deleteForm(int articleId){
		ModelAndView mv = new ModelAndView();
		mv.addObject("articleId", articleId);
		mv.setViewName("deleteForm");
		return mv;
	}

	@RequestMapping("/delete.do")
	public String delete(int articleId, String password){
		int result = service.delete(articleId, password);
		if(result>0){
			return "delete_success";
		}else{
			return "delete_fail";
		}
	}

	@RequestMapping("/writeComment.do")
	public void writeComment(BongCommentVO comment, HttpServletResponse response) {
		service.writeComment(comment);
		ModelAndView mv = new ModelAndView();

		BongBoardVO article = service.readArticle(comment.getbId(), false);

		try {
			response.sendRedirect("read.do?bId="+comment.getbId());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/download.do")
	public void download(HttpServletResponse response,int bfId) {
		BongFileVO fileInfo = service.readFileInfo(bfId);

		response.setContentType("application/octet-stream; charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment; filename=\""+fileInfo.getBfOriginalName()+"\"");

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
