package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class QuestionDto {

	private int id;
	private String username,title,content;
	private Timestamp questiontime;
}
