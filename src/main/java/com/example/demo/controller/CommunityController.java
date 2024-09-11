package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@GetMapping("/userlist")
	public @ResponseBody  List<UserDto> getUserList()
	{
		return communityService.getUserList();
	}
	
	@GetMapping("/community/messages/{chatUserId}/{userId}")
	public @ResponseBody ArrayList<MessageDto> getMessage(
			@PathVariable("chatUserId") String chatUserId,
			@PathVariable("userId") String userId)
	{
		System.out.println(chatUserId+" "+userId);
		 ArrayList<MessageDto> messages = communityService.getAllMessages(chatUserId, userId);
		    
		    // 만약 메시지가 없다면 빈 배열 반환
		    if (messages == null) {
		        return new ArrayList<>();  // 빈 배열 반환
		    }
		    else {
		    	 ArrayList<MessageDto> mlist=communityService.getAllMessages(chatUserId , userId);
		    	 System.out.println(mlist.size());
		    	 return mlist;
		    }
		 
		
	}
	
	
	
	 
	
	
}
