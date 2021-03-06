package com.jeju.admin.member.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.member.reservation.service.AdminMemberReservationService;
import com.jeju.admin.member.reservation.vo.AdminMemberReservationVO;


@Controller
@RequestMapping(value="/admin")
public class AdminMemberReservationController {
	private Logger log = LoggerFactory.getLogger(AdminMemberReservationController.class);
	
	@Autowired
	private AdminMemberReservationService adminMemberReservationService;
	
	//1.회원 예약 리스트
	@RequestMapping(value="/memreservation/memRes", method = RequestMethod.GET)
	public ModelAndView memResList(HttpSession session){
		
		log.info("admin memRes 호출 성공");
		
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();
		
		List<AdminMemberReservationVO> memList = adminMemberReservationService.memResList();
		
		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("admin/login/adminLogin");
			return login;
		} else {
			mav.addObject("memResList", memList);
			mav.setViewName("admin/memreservation/adminMemReservation");
			return mav;
		}
	}
	
	//2.회원 예약 상세 내역
	@RequestMapping(value="/memreservation/adminMemReservationDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int rsv_number, HttpSession session) throws Exception {
		log.info("admin Detail 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/memreservation/adminMemReservationDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminMemberReservationService.detail(rsv_number));
		return mav;
	}
	
	//3.회원 상태 변경 and 렌트 테이블에 저장
		@RequestMapping(value = "/memreservation/adminMemReservationUpdate", method = RequestMethod.POST)
		public String update(@ModelAttribute AdminMemberReservationVO vo) throws Exception {
			log.info("update 호출 성공");

			System.out.println(vo.getRsv_number());
			int result = 0;
			String url = "";
			

			result = adminMemberReservationService.update(vo);
			
			
			if (result == 1) {
				url = "/admin/memreservation/memRes";

			} else {
				url = "/admin/memreservation/adminMemReservationDetail?rsv_number = " + vo.getRsv_number();
			}

			return "redirect:" + url;
		}
	

}
