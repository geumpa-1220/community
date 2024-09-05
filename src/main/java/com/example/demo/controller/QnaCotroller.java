package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dto.AnswerDto;
import com.example.demo.dto.QuestionDto;
import com.example.demo.service.QnaService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/qna")
public class QnaCotroller {
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/questionList")
	public String questionList(Model model)
	{
		qnaService.getList(model);
		return "qna/questionList";
	}
	
	
	
	@GetMapping("/writeQuestion")
	public String questionWriteForm()
	{
		return "qna/writeQuestion";
	}
	@PostMapping("/writeQuestion")
	public String writeQuestion(QuestionDto questionDto , HttpSession session)
	{
		qnaService.writeQuestion(questionDto , session);
		
		return "redirect:/qna/questionList";
	}
	
	
	@PostMapping("/deleteQuestion")
	public String deleteQuestion(@RequestParam("questionId") int id)
	{
		qnaService.deleteQuestion(id);
		
		return "redirect:/qna/questionList";
	}
	
	
	@GetMapping("/qnaContent/{questionId}")
	public String qnaContent(@PathVariable("questionId") int id, Model model)
	{
		qnaService.getQuestionContent(id, model);
		qnaService.getAnswerContent(id,model);
		
		return "qna/qnaContent";
	}
	
	
	@PostMapping("/addAnswer")
	public String addAnswer(AnswerDto answerDto)
	{
		qnaService.addAnswer(answerDto);
		
		return "redirect:/qna/qnaContent/" + answerDto.getQid();
	}
	
	@PostMapping("/deleteAnswer")
	public String deleteAnswer(@RequestParam("answerId") int id , @RequestParam("questionId") int questionId)
	{
		qnaService.deleteAnswer(id);
		
		return "redirect:/qna/qnaContent/" + questionId;
	}
	

}
