package com.ssafy.edu.vue.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.edu.vue.dto.NoticeDto;

@Mapper
public interface NoticeMapper {
	public List<NoticeDto> showAllNotice() throws Exception;
	public int addNotice(NoticeDto notice) throws Exception;
	public boolean deleteNotice(int num) throws Exception;
	public NoticeDto detailNotice(int num) throws Exception;
	public boolean updateNotice(NoticeDto notice) throws Exception;
}
