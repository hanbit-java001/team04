package com.hanbit.team04.core.vo;

public class ReplyVO {
	private int minSeq;
	private String userId;
	private String contents;
	private String regDate;

	public int getMinSeq() {
		return minSeq;
	}

	public String getUserId() {
		return userId;
	}

	public String getContents() {
		return contents;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setMinSeq(int minSeq) {
		this.minSeq = minSeq;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [minSeq=" + minSeq + ", userId=" + userId + ", contents=" + contents + ", regDate=" + regDate
				+ "]";
	}

	public ReplyVO(int minSeq, String userId, String contents, String regDate) {
		super();
		this.minSeq = minSeq;
		this.userId = userId;
		this.contents = contents;
		this.regDate = regDate;
	}

	public ReplyVO() {
		super();
	}

}
