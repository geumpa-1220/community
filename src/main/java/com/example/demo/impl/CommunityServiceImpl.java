package com.example.demo.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;
import com.example.demo.mapper.CommunityMapper;
import com.example.demo.service.CommunityService;
@Service
public class CommunityServiceImpl  implements CommunityService{
	
	@Autowired
	private CommunityMapper communityMapper;

	
	@Override
	public List<UserDto> getUserList()
	{
		return communityMapper.getUserList();
	}
	
	@Override
	public ArrayList<MessageDto> getAllMessages(String chatUserId , String userId)
	{
		return communityMapper.getAllMessages(chatUserId , userId);
	}
	
	
	 @Override
     public void saveMessage(MessageDto messageDto) {
	        communityMapper.saveMessage(messageDto);
	    }
	 
	 
	 @Override
	 public List<MessageDto> getMessagesByUser(String username) {
	     return communityMapper.getMessagesByUser(username);
	 }

	 
	 
}
