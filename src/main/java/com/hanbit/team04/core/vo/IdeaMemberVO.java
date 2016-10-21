package com.hanbit.team04.core.vo;

public class IdeaMemberVO {
	private String userId;
	private String password;
	private int age;
	private String name;

	public String getUserId() {
		return userId;
	}

	public String getPassword() {
		return password;
	}

	public int getAge() {
		return age;
	}

	public String getname() {
		return name;
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

	public void setname(String name) {
		this.name = name;
	}

	public IdeaMemberVO(String userId, String password, int age, String name) {
		super();
		this.userId = userId;
		this.password = password;
		this.age = age;
		this.name = name;
	}

	@Override
	public String toString() {
		return "IdeaMember [userId=" + userId + ", password=" + password + ", age=" + age + ", name=" + name + "]";
	}

	public IdeaMemberVO() {
		super();
	}

}
