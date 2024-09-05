package com.example.demo.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;

import jakarta.servlet.http.HttpSession;

public interface QnaService {
	
	public ArrayList<QuestionDto> getList(Model model);
	
	public void writeQuestion(QuestionDto questionDto , HttpSession session);
	
	public void deleteQuestion(int id);
	
	public QuestionDto getQuestionContent(int id , Model model);
	
	public ArrayList<AnswerDto> getAnswerContent(int id , Model model);
	
	public void addAnswer(AnswerDto answerDto);
	
	public void deleteAnswer(int id);

}
