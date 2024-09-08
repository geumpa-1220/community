package com.example.demo.service;

import java.util.List;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;

public interface CommunityService {
	
	List<UserDto> getUserList();
	List<MessageDto> getAllMessages();

}
