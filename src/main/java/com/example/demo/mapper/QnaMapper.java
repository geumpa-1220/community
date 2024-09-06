package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;

@Mapper
public interface QnaMapper {
	
	public ArrayList<QuestionDto> getAllList();
	public void writeQuestion(QuestionDto questionDto);
	public void deleteQuestion(int id);
	public QuestionDto getQuestionContent(int id);
	public ArrayList<AnswerDto> getAnswer(int id);
	public void addAnswer(AnswerDto answerDto);
	public void deleteAnswer(int id);

}
