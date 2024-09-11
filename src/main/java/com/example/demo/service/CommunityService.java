package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;

public interface CommunityService {
	
	List<UserDto> getUserList();
	ArrayList<MessageDto> getAllMessages(String chatUserId , String userId);
	void saveMessage(MessageDto messageDto);
	
	List<MessageDto> getMessagesByUser(String username);


}
