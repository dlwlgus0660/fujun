package com.jeju.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.notice.dao.AdminNoticeDao;
import com.jeju.admin.notice.vo.AdminNoticeVO;

@Service
@Transactional
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	
	//공지사항 리스트
	@Override
	public List<AdminNoticeVO> NoticeList(){
		return adminNoticeDao.NoticeList();
	}
	//공지사항 상세 내역
	@Override
	public AdminNoticeVO detail(String nt_title) throws Exception {
		return adminNoticeDao.detail(nt_title);
	}
}
