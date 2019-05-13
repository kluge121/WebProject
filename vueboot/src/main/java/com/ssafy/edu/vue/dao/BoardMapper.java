package com.ssafy.edu.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.edu.vue.dto.BoardAnswerDto;
import com.ssafy.edu.vue.dto.BoardDto;

@Mapper
public interface BoardMapper {
	public List<BoardDto> findAllBoard() throws Exception;
	public BoardDto findBoardByNum(int number) throws Exception;
	public BoardAnswerDto findAnswerByNum(int number) throws Exception;
	
	public void addBoard(BoardDto boarddto) throws Exception;
	public void addAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception;
	public boolean updateBoard(BoardDto boarddto) throws Exception;
	public boolean updateAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception;
	public boolean updateViewCnt(int number) throws Exception;
	public boolean deleteBoard(int number) throws Exception;
	
	public int findNumber() throws Exception;
}
