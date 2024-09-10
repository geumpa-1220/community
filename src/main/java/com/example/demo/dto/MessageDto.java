package com.example.demo.dto;






public class MessageDto {
	
	private String sender;
    private String receiver;
    private String content;
    private String messagetime;
	
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
	public String getMessagetime() {
		return messagetime;
	}
	public void setMessagetime(String messagetime) {
		this.messagetime = messagetime;
	}


  
    
}