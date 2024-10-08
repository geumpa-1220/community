package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;

@Mapper
public interface CommunityMapper {
	
	List<UserDto> getUserList();
	ArrayList<MessageDto> getAllMessages(String chatUserId , String userId);
	void saveMessage(MessageDto messageDto);
	
	List<MessageDto> getMessagesByUser(String username);


}
