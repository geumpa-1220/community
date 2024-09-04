package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.UserDto;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String home()
	{
		return userService.home();
	}
	
	
	
	@GetMapping("/user/signUp")
	public String signUpForm()
	{
		return userService.signUpForm();
	}
	@PostMapping("/user/signUp")
	public String signUp(UserDto userDto,HttpSession session)
	{	
		return userService.signUp(userDto,session);
	}
	
	
	
	@GetMapping("/user/login")
	public String loginForm()
	{
		return userService.loginForm();
	}
	@PostMapping("/user/login")
	public String login(UserDto userDto,Model model,HttpSession session)
	{
		return userService.login(userDto , model , session);
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		return userService.logout(session);
	}
	

}
