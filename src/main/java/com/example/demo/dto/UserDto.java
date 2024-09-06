package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private int id,userid,floor;
	private String username,pwd,email,bio;
	private Timestamp usertime; 
	
	

}
