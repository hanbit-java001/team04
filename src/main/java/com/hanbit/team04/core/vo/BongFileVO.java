package com.hanbit.team04.core.vo;

public class BongFileVO {
	private int bfId;
	private int bId;
	private String bfOriginalName;
	private String bfSavedPath;
	
	public BongFileVO(){}
	
	public BongFileVO(int bfId, int bId, String bfOriginalName, String bfSavedPath) {
		this.bfId = bfId;
		this.bId = bId;
		this.bfOriginalName = bfOriginalName;
		this.bfSavedPath = bfSavedPath;
	}
	public int getBfId() {
		return bfId;
	}
	public void setBfId(int bfId) {
		this.bfId = bfId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getBfOriginalName() {
		return bfOriginalName;
	}
	public void setBfOriginalName(String bfOriginalName) {
		this.bfOriginalName = bfOriginalName;
	}
	public String getBfSavedPath() {
		return bfSavedPath;
	}
	public void setBfSavedPath(String bfSavedPath) {
		this.bfSavedPath = bfSavedPath;
	}
	
	
}
