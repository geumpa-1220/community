package com.example.demo.service;

import org.springframework.ui.Model;

import com.example.demo.dto.UserDto;

import jakarta.servlet.http.HttpSession;

public interface UserService {

	public String home();
	
	public String signUpForm();
	public String signUp(UserDto userDto , HttpSession session);
	
	public String loginForm();
	public String login(UserDto userDto , Model model , HttpSession session);
	
	public String logout(HttpSession session);
	
	public String profile();
	
	
}
