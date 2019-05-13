package com.ssafy.edu.vue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.edu.vue.dao.BoardDao;
import com.ssafy.edu.vue.dto.BoardAnswerDto;
import com.ssafy.edu.vue.dto.BoardDto;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boarddao;

	@Override
	@Transactional(readOnly=true)
	public List<BoardDto> findAllBoard() throws Exception {
		return boarddao.findAllBoard();
	}

	@Override
	public BoardDto findBoardByNum(int number) throws Exception {
		return boarddao.findBoardByNum(number);
	}

	@Override
	public BoardAnswerDto findAnswerByNum(int number) throws Exception {
		return boarddao.findAnswerByNum(number);
	}

	@Override
	public int addBoard(BoardDto boarddto) throws Exception {
		boarddto.setNumber(boarddao.findNumber()+1);
		boarddao.addBoard(boarddto);
		return boarddao.findNumber();
	}

	@Override
	public void addAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception {
		boarddao.addAnswerBoard(boardanswerdto);
	}

	@Override
	public boolean updateBoard(BoardDto boarddto) throws Exception {
		return boarddao.updateBoard(boarddto);
	}

	@Override
	public boolean updateAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception {
		return boarddao.updateAnswerBoard(boardanswerdto);
	}

	@Override
	public boolean deleteBoard(int number) throws Exception {
		return boarddao.deleteBoard(number);
	}

	@Override
	public boolean updateViewCnt(int number) throws Exception {
		return boarddao.updateViewCnt(number);
	}
}