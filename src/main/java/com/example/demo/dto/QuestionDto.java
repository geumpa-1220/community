package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class QuestionDto {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getQuestiontime() {
		return questiontime;
	}
	public void setQuestiontime(Timestamp questiontime) {
		this.questiontime = questiontime;
	}
	private String username,title,content;
	private Timestamp questiontime;
}
