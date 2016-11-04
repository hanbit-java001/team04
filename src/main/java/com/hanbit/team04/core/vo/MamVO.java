package com.hanbit.team04.core.vo;

public class MamVO {

	private String userId;
	private String contents;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getcontents() {
		return contents;
	}
	public void setcontents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "MamVO [userId=" + userId + ", contents=" + contents + ", getUserId()=" + getUserId()
				+ ", getcontents()=" + getcontents() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	
	
}
