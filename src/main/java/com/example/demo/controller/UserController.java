package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {
	
	@GetMapping("/")
	public String home()
	{
		return "/main/index";
	}
	
	@GetMapping("/user/signUp")
	public String signUpForm()
	{
		return "/user/signUp";
	}
	
	@GetMapping("/user/login")
	public String loginForm()
	{
		return "/user/login";
	}
	

}
