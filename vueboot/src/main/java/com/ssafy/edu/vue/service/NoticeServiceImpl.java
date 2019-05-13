package com.ssafy.edu.vue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.edu.vue.dao.NoticeDao;
import com.ssafy.edu.vue.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticedao;

	@Override
	public List<NoticeDto> showAllNotice() throws Exception {
		return noticedao.showAllNotice();
	}

	@Override
	public int addNotice(NoticeDto notice) throws Exception {
		return noticedao.addNotice(notice);
	}

	@Override
	public boolean deleteNotice(int num) throws Exception {
		return noticedao.deleteNotice(num);
	}

	@Override
	public NoticeDto detailNotice(int num) throws Exception {
		return noticedao.detailNotice(num);
	}

	@Override
	public boolean updateNotice(NoticeDto notice) throws Exception {
		return noticedao.updateNotice(notice);
	}

}
