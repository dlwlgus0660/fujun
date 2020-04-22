package com.jeju.admin.notice.service;

import java.util.List;

import com.jeju.admin.notice.vo.AdminNoticeVO;

public interface AdminNoticeService {

	//공지사항 리스트
	public List<AdminNoticeVO> NoticeList();
	
	//공지사항 상세 내역
	public AdminNoticeVO detail(String nt_title)throws Exception;
}
