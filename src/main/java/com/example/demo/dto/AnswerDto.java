package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerDto {
	
	private int id,qid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getAnswertime() {
		return answertime;
	}
	public void setAnswertime(Timestamp answertime) {
		this.answertime = answertime;
	}
	private String username,content;
	private Timestamp answertime;

}
