package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	
	public void signUp(UserDto userDto);
	public UserDto login(int userid);

}
