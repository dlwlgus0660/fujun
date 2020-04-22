package com.jeju.admin.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.jeju.admin.notice.vo.AdminNoticeVO;

public class AdminNoticeDaoImpl implements AdminNoticeDao {
	
	@Inject
	private SqlSession session;
	
	//공지사항 리스트
	@Override
	public List<AdminNoticeVO> NoticeList() {
		
		return session.selectList("NoticeList");
	}
	//공지사항 상세 내역
	@Override
	public AdminNoticeVO detail(String nt_title)throws Exception{
		
		return session.selectOne("detail",nt_title);
	}
}
