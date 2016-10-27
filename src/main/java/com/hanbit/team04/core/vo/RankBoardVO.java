package com.hanbit.team04.core.vo;

public class RankBoardVO {

	private int boardIdx;
	private String title;
	private String regDate;
	private String contents;
	private String userId;
	private String modDate;
	private String confirm;
	private int hitCnt;
	private String fileId;


	@Override
	public String toString() {
		return "IdeaBoardVO [boardIdx=" + boardIdx + ", title=" + title + ", regDate=" + regDate + ", contents="
				+ contents + ", userId=" + userId + ", modDate=" + modDate + ", confirm=" + confirm + ", hitCnt="
				+ hitCnt + ", fileId=" + fileId + "]";
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public int getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(int hitCnt) {
		this.hitCnt = hitCnt;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public RankBoardVO() {
		super();
	}
	public RankBoardVO(int boardIdx, String title, String regDate, String contents, String userId, String modDate,
			String confirm, int hitCnt, String fileId) {
		super();
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


}
