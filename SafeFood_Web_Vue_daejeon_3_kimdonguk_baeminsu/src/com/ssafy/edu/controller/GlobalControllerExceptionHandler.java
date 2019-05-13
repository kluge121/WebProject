package com.ssafy.edu.controller;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalControllerExceptionHandler {
	
//	@ExceptionHandler(Exception.class)
//	public ModelAndView common(Exception e) {
//		
//		ModelAndView mav = new ModelAndView("error");
//		mav.addObject("e", e);  //예외를 뷰에 던져서 주자.
//	
//		return mav;
//	}
//	
	

}
