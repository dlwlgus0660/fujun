package com.jeju.admin.member.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeju.admin.member.reservation.dao.AdminMemberReservationDao;
import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;

@Service
@Transactional
public class AdminMemberReservationServiceImpl implements AdminMemberReservationService {

	@Autowired
	private AdminMemberReservationDao adminMemberReservationDao;
	
	//회원 예약 내역 리스트
	@Override
	public List<AdminMemberReservationVO> memResList(){
		return adminMemberReservationDao.memResList();
	}
	
	//회원 예약 내역 상세 정보
	@Override
	public AdminMemberReservationVO detail(int rsv_number) throws Exception {
		return adminMemberReservationDao.detail(rsv_number);
	}

	//회원 예약 상태 변경 저장 
	@Override
	public int update(AdminMemberReservationVO vo) {
		int result = 0;
		try {
			result = adminMemberReservationDao.update(vo);
		} catch (Exception e) {
			e.printStackTrace();
			result = 0;
		}
		return result;

	}
}
