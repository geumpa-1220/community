package com.example.demo.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;
import com.example.demo.mapper.QnaMapper;
import com.example.demo.service.QnaService;

import jakarta.servlet.http.HttpSession;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public ArrayList<QuestionDto> getList(Model model)
	{
		ArrayList<QuestionDto> list = qnaMapper.getAllList();
		model.addAttribute("qdto", list);
		
		return list;
	}
	
	
	@Override
	public void writeQuestion(QuestionDto questionDto , HttpSession session)
	{
		String username =(String) session.getAttribute("username");
		
		questionDto.setUsername(username);
		
		qnaMapper.writeQuestion(questionDto);
	}
	
	
	@Override
	public void deleteQuestion(int id)
	{
		qnaMapper.deleteQuestion(id);
	}
	
	
	@Override
	public QuestionDto getQuestionContent(int id , Model model)
	{
		QuestionDto questionDto = qnaMapper.getQuestionContent(id);
		model.addAttribute("question", questionDto);
		
		return questionDto;
	}
	@Override
	public ArrayList<AnswerDto> getAnswerContent(int id , Model model)
	{
		ArrayList<AnswerDto> answerList = qnaMapper.getAnswer(id);
		model.addAttribute("answer", answerList);
		
		return answerList;
	}
	
	
	@Override
	public void addAnswer(AnswerDto answerDto)
	{
		qnaMapper.addAnswer(answerDto);
	}
	
	
	@Override
	public void deleteAnswer(int id)
	{
		qnaMapper.deleteAnswer(id);
	}

}






















