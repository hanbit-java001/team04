package com.hanbit.team04.core.vo;

public class ReplyVO {

	private String replyDb;
	private String userId;
	private String replyDate;

	public String getReplyDb() {
		return replyDb;
	}
	public void setReplyDb(String replyDb) {
		this.replyDb = replyDb;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyDb=" + replyDb + ", userId=" + userId + ", replyDate=" + replyDate + "]";
	}






}
