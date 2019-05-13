package com.ssafy.edu.vue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.vue.dto.BoardAnswerDto;
import com.ssafy.edu.vue.dto.BoardDto;
@Repository
public class BoardDao implements BoardMapper{
	private String ns = "com.ssafy.edu.vue.dao.BoardMapper.";
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardDto> findAllBoard() throws Exception {
		return sqlSession.selectList(ns+"findAllBoard");
	}

	@Override
	public BoardDto findBoardByNum(int number) throws Exception {
		return sqlSession.selectOne(ns+"findBoardByNum",number);
	}

	@Override
	public BoardAnswerDto findAnswerByNum(int number) throws Exception {
		return sqlSession.selectOne(ns+"findAnswerByNum",number);
	}

	@Override
	public void addBoard(BoardDto boarddto) throws Exception {
		sqlSession.insert(ns+"addBoard",boarddto);
	}

	@Override
	public void addAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception {
		sqlSession.insert(ns+"addAnswerBoard",boardanswerdto);
	}

	@Override
	public boolean updateBoard(BoardDto boarddto) throws Exception {
		sqlSession.update(ns+"updateBoard",boarddto);
		return true;
	}

	@Override
	public boolean updateAnswerBoard(BoardAnswerDto boardanswerdto) throws Exception {
		sqlSession.update(ns+"updateAnswerBoard",boardanswerdto);
		return true;
	}

	@Override
	public boolean deleteBoard(int number) throws Exception {
		sqlSession.delete(ns+"deleteBoard",number);
		return true;
	}

	@Override
	public int findNumber() throws Exception {
		return sqlSession.selectOne(ns+"findNumber");
	}

	public boolean updateViewCnt(int num) {
		sqlSession.update(ns+"updateViewCnt",num);
		return true;
	}

}
