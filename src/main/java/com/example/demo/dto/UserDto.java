package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private int id,userid;
	private String username,pwd;
	private Timestamp usertime; 
	
	

}
