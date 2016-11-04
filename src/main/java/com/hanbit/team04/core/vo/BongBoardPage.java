package com.hanbit.team04.core.vo;

import java.util.List;

public class BongBoardPage {
	private List<BongBoardVO> articleList;
	private int requestPage;
	private int startPage;
	private int endPage;
	private int totalPageCount;

	////////////////////////////////////////////////////////
	public List<BongBoardVO> getArticleList() {
		return articleList;
	}

	public void setArticleList(List<BongBoardVO> articleList) {
		this.articleList = articleList;
	}

	public int getRequestPage() {
		return requestPage;
	}

	public void setRequestPage(int requestPage) {
		this.requestPage = requestPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public BongBoardPage() {
	}

	public BongBoardPage(List<BongBoardVO> articleList, int requestPage, int startPage, int endPage,
			int totalPageCount) {
		this.articleList = articleList;
		this.requestPage = requestPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPageCount = totalPageCount;
	}
}
