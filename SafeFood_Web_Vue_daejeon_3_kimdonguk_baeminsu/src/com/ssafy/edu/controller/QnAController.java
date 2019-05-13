package com.ssafy.edu.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);

	@RequestMapping(value = "qna.do", method = RequestMethod.GET)
	public String getFoodList(Model model) throws Exception {
		return "qna/qna";
	}



}
