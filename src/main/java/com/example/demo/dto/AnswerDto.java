package com.example.demo.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerDto {
	
	private int id,qid;
	private String username,content;
	private Timestamp answertime;

}
