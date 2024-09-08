package com.example.demo.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MessageDto {
	private int id;	
	private String username,content;
	private LocalDateTime messageTime;
	
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(LocalDateTime messageTime) {
		this.messageTime = messageTime;
	}


}
