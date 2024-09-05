package com.example.demo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;
import com.example.demo.mapper.UserMapper;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper mapper;
	
	
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
		mapper.signUp(userDto);
		session.setAttribute("username", userDto.getUsername());
		
		return "redirect:/";
	}
	
	
	
	@Override
	public String loginForm()
	{
		return "/user/login";
	}
	@Override
	public String login(UserDto userDto,Model model,HttpSession session)
	{
		UserDto dto = mapper.login(userDto.getUserid());
		if( dto != null && dto.getPwd().equals(userDto.getPwd()) )
		{
			session.setAttribute( "id", dto.getId() );
			session.setAttribute("username", dto.getUsername());
			
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

	
	public String profile()
	{
		return "user/profile";
	}
}













