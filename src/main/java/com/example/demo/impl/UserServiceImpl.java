package com.example.demo.impl;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;
import com.example.demo.dto.UserDto;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	
	@Override
	public String home()
	{
		return "/main/index";
	}
	
	
	
	@Override
	public String signUpForm()
	{
		return "/user/signUp";
	}
	@Override
	public String signUp(UserDto userDto , HttpSession session)
	{
		userMapper.signUp(userDto);
		
		return "redirect:/user/login";
	}
	
	
	
	@Override
	public String loginForm()
	{
		return "/user/login";
	}
	@Override
	public String login(UserDto userDto,Model model,HttpSession session)
	{
		UserDto dto = userMapper.login( userDto.getUserid() );
		if( dto != null && dto.getPwd().equals( userDto.getPwd() ) )
		{
			session.setAttribute( "id", dto.getId() );
			session.setAttribute("username", dto.getUsername());
			
			System.out.println("User logged in: " + dto.getUsername() + ", ID: " + dto.getId());
			return "redirect:/";
		}
		else
		{
			String error="아이디 혹은 비밀번호가 틀렸습니다";
			model.addAttribute("error", error);
			return "/user/login";
		}
		
	}
	
	
	
	
	@Override
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}

	
	@Override
	public String profile(HttpSession session,Model model)
	{
		int id=(int)session.getAttribute("id");
		UserDto user=userMapper.userDate( id );
		model.addAttribute("user", user);
		
		String username = (String)user.getUsername();
		ArrayList<QuestionDto> questionList = userMapper.getQuestionList(username);
		model.addAttribute("question", questionList);
		
		
		ArrayList<AnswerDto> answerList = userMapper.getAnswerList(username);
		model.addAttribute("answer", answerList);
		
		return "user/profile";
	}
	
	
	@Override
	public String editProfileForm(Model model , HttpSession session)
	{
		int id = (int)session.getAttribute("id");
		
		 UserDto user = userMapper.userDate( id );
		 model.addAttribute("user", user);
		 
		 return "/user/editProfile";
		 
	}
	@Override
	public String editProfile(UserDto userDto , HttpSession session)
	{
		
		int id =(int) session.getAttribute("id");
		userDto.setId(id);
		
		String pwd = (String)userMapper.userDate( id ).getPwd();
		if(userDto.getPwd() == null || userDto.getPwd().isEmpty())
		{
			userDto.setPwd( pwd );
		}
		userMapper.updateUser(userDto);
		
		return "redirect:/user/profile";
	}
	
}













