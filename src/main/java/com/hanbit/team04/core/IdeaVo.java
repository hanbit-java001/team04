package com.hanbit.team04.core;


public class IdeaVo {
	private int idxNum; 
	private String userId;
	private String subject;
	private String content;
	private String confirm;
	private String date;
	private int likeCount;
	public int getIdxNum() {
		return idxNum;
	}
	public void setIdxNum(int idxNum) {
		this.idxNum = idxNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
}
