package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private int id,userid,floor;
	private String username,pwd,email,bio;
	private Timestamp usertime; 
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Timestamp getUsertime() {
		return usertime;
	}
	public void setUsertime(Timestamp usertime) {
		this.usertime = usertime;
	}

}
