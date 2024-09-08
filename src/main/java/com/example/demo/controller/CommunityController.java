package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;
import com.example.demo.service.CommunityService;

@Controller
@RequestMapping("/api")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/residents/list")
	public List<UserDto> getUserList()
	{
		return communityService.getUserList();
	}
	
	@GetMapping("/messages")
	public List<MessageDto> getAllMessage()
	{
		return communityService.getAllMessages();
	}
}
