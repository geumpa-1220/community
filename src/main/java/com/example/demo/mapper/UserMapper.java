package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;
import com.example.demo.dto.UserDto;

@Mapper
public interface UserMapper {
	
	public void signUp(UserDto userDto);
	public UserDto login(int userid);
	public UserDto userDate(int id);
	public ArrayList<QuestionDto> getQuestionList(String username);
	public ArrayList<AnswerDto> getAnswerList(String username);
	public void updateUser(UserDto userDto);

}
