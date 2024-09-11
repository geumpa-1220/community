package com.example.demo.dto;

import java.sql.Timestamp;

public class MessageDto {
	
	private String mtype;
	private String sender;
    private String receiver;
    private String content;
    private Timestamp messagetime;
	
    

    public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
    public Timestamp getMessagetime() {
		return messagetime;
	}
	public void setMessagetime(Timestamp messagetime) {
		this.messagetime = messagetime;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	


  
    
}