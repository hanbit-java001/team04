package com.hanbit.team04.core.vo;

public class IdeaMemberVO {
	private String userId;
	private String password;
	private int age;
	private String name;
	private String fileId;
	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public int getAge() {
		return age;
	}
	public String getName() {
		return name;
	}
	public String getFileId() {
		return fileId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public IdeaMemberVO(String userId, String password, int age, String name, String fileId) {
		super();
		this.userId = userId;
		this.password = password;
		this.age = age;
		this.name = name;
		this.fileId = fileId;
	}
	public IdeaMemberVO() {
		super();
	}
	@Override
	public String toString() {
		return "IdeaMemberVO [userId=" + userId + ", password=" + password + ", age=" + age + ", name=" + name
				+ ", fileId=" + fileId + "]";
	}


}
