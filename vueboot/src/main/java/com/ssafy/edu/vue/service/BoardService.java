package com.ssafy.edu.vue.service;

import java.util.List;

import com.ssafy.edu.vue.dto.BoardAnswerDto;
import com.ssafy.edu.vue.dto.BoardDto;

public interface BoardService {
	public List<BoardDto> findAllBoard() throws Exception;
	public BoardDto findBoardByNum(int number) throws Exception;
	public BoardAnswerDto findAnswerByNum(int number) throws Exception;
	
	public int addBoard(BoardDto boarddto) throws Exception;
	public void addAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception;
	public boolean updateBoard(BoardDto boarddto) throws Exception;
	public boolean updateAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception;
	public boolean updateViewCnt(int number) throws Exception;
	public boolean deleteBoard(int number) throws Exception;
}
