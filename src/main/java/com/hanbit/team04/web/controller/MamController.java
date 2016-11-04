package com.hanbit.team04.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.team04.core.service.BoardService;
import com.hanbit.team04.core.vo.BongBoardPage;

@Controller
public class MamController {
	@Autowired
	private BoardService service;
	public void setService(BoardService service) {
		this.service = service;
	}
//	@Autowired
//	private MamService mamService;

	@RequestMapping("/home")
	public ModelAndView MamView(@RequestParam(defaultValue="1")int page) {
		BongBoardPage articlePage = service.makePage(page);
		ModelAndView mv = new ModelAndView();
		mv.addObject("articlePage", articlePage);
		mv.setViewName("BoardList");



		return mv;
	}

	@RequestMapping("/write")
	public String write(){

		return "Write";
	}



//	@RequestMapping("/api/data")
//	@ResponseBody
//	public List<MamVO> dataView(){
//	List<MamVO> resultdata = mamService.dataView();
//
//
//	return resultdata;
//
//	}
}
