package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;
import com.example.demo.service.CommunityService;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/community/chat")
	public String communityForm()
	{
		return "/community/chat";
	}
	
	@GetMapping("/residents/list")
	public @ResponseBody  List<UserDto> getUserList()
	{
		return communityService.getUserList();
	}
	
	@GetMapping("/api/messages")
	public @ResponseBody List<MessageDto> getAllMessage()
	{
		return communityService.getAllMessages();
	}
	
	
	 @PostMapping("/api/messages")
	    public void saveMessage(@RequestBody MessageDto messageDto) {
	        communityService.saveMessage(messageDto);
	    }
	 
	 @GetMapping("/messages")
	 public List<MessageDto> getMessagesByUser(@RequestParam String username) {
	     return communityService.getMessagesByUser(username);
	 }
	
}
