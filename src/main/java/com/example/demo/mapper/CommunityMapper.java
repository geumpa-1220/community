package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MessageDto;
import com.example.demo.dto.UserDto;

@Mapper
public interface CommunityMapper {
	
	List<UserDto> getUserList();
	List<MessageDto> getAllMessages();

}
