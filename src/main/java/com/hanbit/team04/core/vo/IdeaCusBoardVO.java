package com.hanbit.team04.core.vo;

public class IdeaCusBoardVO {
	private int cusIDX;
	private String title;
	private String regDate;
	private String contents;
	private int hitcnt;
	private int ageGroup;
	private String fileId;
	public int getCusIDX() {
		return cusIDX;
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
	public int getHitcnt() {
		return hitcnt;
	}
	public int getAgeGroup() {
		return ageGroup;
	}
	public String getFileId() {
		return fileId;
	}
	public void setCusIDX(int cusIDX) {
		this.cusIDX = cusIDX;
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
	public void setHitcnt(int hitcnt) {
		this.hitcnt = hitcnt;
	}
	public void setAgeGroup(int ageGroup) {
		this.ageGroup = ageGroup;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	@Override
	public String toString() {
		return "IdeaCusBoardVO [cusIDX=" + cusIDX + ", title=" + title + ", regDate=" + regDate + ", contents="
				+ contents + ", hitcnt=" + hitcnt + ", ageGroup=" + ageGroup + ", fileId=" + fileId + "]";
	}
	public IdeaCusBoardVO() {
		super();
	}
	public IdeaCusBoardVO(int cusIDX, String title, String regDate, String contents, int hitcnt, int ageGroup,
			String fileId) {
		super();
		this.cusIDX = cusIDX;
		this.title = title;
		this.regDate = regDate;
		this.contents = contents;
		this.hitcnt = hitcnt;
		this.ageGroup = ageGroup;
		this.fileId = fileId;
	}

}
