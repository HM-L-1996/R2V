package com.enc.project1;

public class userVO {
	private int usernum;
	private String id;
	private String nickname;
	private String pw;
	private String username; 
	private String birth;
	private String email; 
	private int interest; 
	private String userdate;
					
	// 생성자
	public userVO(){ }
	public userVO(int usernum,String id,String nickname,String pw,String username,String birth,String email,int interest,String userdate) {
		this.usernum=usernum;
		this.id=id;
		this.nickname=nickname;
		this.pw=pw;
		this.username=username;
		this.birth=birth;
		this.email=email;
		this.interest=interest;
		this.userdate=userdate;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getInterest() {
		return interest;
	}
	public void setInterest(int interest) {
		this.interest = interest;
	}
	public String getUserdate() {
		return userdate;
	}
	public void setUserdate(String userdate) {
		this.userdate = userdate;
	}
	
	
		
}
