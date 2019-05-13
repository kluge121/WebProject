package com.ssafy.edu.vue.service;

import java.util.List;

import com.ssafy.edu.vue.dto.NoticeDto;

public interface NoticeService {
	public List<NoticeDto> showAllNotice() throws Exception;
	public int addNotice(NoticeDto notice) throws Exception;
	public boolean deleteNotice(int num) throws Exception;
	public NoticeDto detailNotice(int num) throws Exception;
	public boolean updateNotice(NoticeDto notice) throws Exception;
}
