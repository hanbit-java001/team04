package com.hanbit.team04.core.vo;

public class IdeaVO {
	private int boardIdx;
	private String title;
	private String regDate;
	private String contents;
	private String userId;
	private String modDate;
	private char confirm;
	private int hitCnt;
	private String fileId;

	public int getBoardIdx() {
		return boardIdx;
	}

	public String getTitle() {
		return title;
	}

	public String getRegDate() {
		return regDate;
	}

	public String getContents() {
		return contents;
	}

	public String getUserId() {
		return userId;
	}

	public String getModDate() {
		return modDate;
	}

	public char getConfirm() {
		return confirm;
	}

	public int getHitCnt() {
		return hitCnt;
	}

	public String getFileId() {
		return fileId;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	public void setConfirm(char confirm) {
		this.confirm = confirm;
	}

	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	@Override
	public String toString() {
		return "IdeaVO [boardIdx=" + boardIdx + ", title=" + title + ", regDate=" + regDate + ", contents=" + contents
				+ ", userId=" + userId + ", modDate=" + modDate + ", confirm=" + confirm + ", hitCnt=" + hitCnt
				+ ", fileId=" + fileId + "]";
	}

	public IdeaVO(int boardIdx, String title, String regDate, String contents, String userId, String modDate,
			char confirm, int hitCnt, String fileId) {
		this.boardIdx = boardIdx;
		this.title = title;
		this.regDate = regDate;
		this.contents = contents;
		this.userId = userId;
		this.modDate = modDate;
		this.confirm = confirm;
		this.hitCnt = hitCnt;
		this.fileId = fileId;
	}

	public IdeaVO() {
	}

}
