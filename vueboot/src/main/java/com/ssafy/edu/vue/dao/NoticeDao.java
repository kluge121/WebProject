package com.ssafy.edu.vue.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.edu.vue.dto.NoticeDto;

@Repository
public class NoticeDao implements NoticeMapper {
	private String ns = "com.ssafy.edu.vue.dao.NoticeMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeDto> showAllNotice() throws Exception {
		return sqlSession.selectList(ns+"showAllNotice");
	}

	@Override
	public int addNotice(NoticeDto notice) throws Exception {
		return sqlSession.insert(ns+"addNotice",notice);
	}

	@Override
	public boolean deleteNotice(int num) throws Exception {
		sqlSession.delete(ns+"deleteNotice",num);
		return true;
	}

	@Override
	public NoticeDto detailNotice(int num) throws Exception {
		return sqlSession.selectOne(ns+"detailNotice",num);
	}

	@Override
	public boolean updateNotice(NoticeDto notice) throws Exception {
		sqlSession.update(ns+"updateNotice",notice);
		return true;
	}

}
