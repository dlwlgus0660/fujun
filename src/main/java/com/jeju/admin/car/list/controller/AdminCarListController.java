package com.jeju.admin.car.list.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jeju.admin.car.list.service.AdminCarListService;
import com.jeju.admin.car.list.vo.AdminCarListVO;
import com.jeju.admin.common.file.FileUploadUtil;

@Controller
@RequestMapping(value = "/")
public class AdminCarListController {

	private Logger log = LoggerFactory.getLogger(AdminCarListController.class);

	@Inject
	AdminCarListService adminCarListService;

	// 1. 차량 리스트
	@RequestMapping("/admin/carlist/carList")
	public ModelAndView list(HttpSession session) throws Exception {
		log.info("admin carlist 호출 성공");

		List<AdminCarListVO> list = adminCarListService.list();
		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("/admin/login/adminLogin");
			return login;
		} else {
			mav.setViewName("admin/carlist/adminCarList"); // 뷰 설정
			mav.addObject("list", list);
			return mav;
		}
	}
	
	// 2-1. 차량 등록화면
	@RequestMapping("/admin/carlist/carListInsertForm")
	public ModelAndView insertForm(HttpSession session) throws Exception {
		log.info("admin carlist 호출 성공");

		ModelAndView mav = new ModelAndView();
		ModelAndView login = new ModelAndView();

		if (session.getAttribute("AdminLogin") == null) {
			login.setViewName("admin/login/adminLogin");
			return login;
		} else {
			mav.setViewName("admin/carlist/adminCarListInsert"); // 뷰 설정
			return mav;
		}
	}

	// 2-2. 차량 등록 처리
	@RequestMapping(value = "/admin/carlist/carListInsert", method = RequestMethod.POST)
	public String insert(@ModelAttribute AdminCarListVO vo, Model model, HttpServletRequest request)
			throws IllegalStateException, IOException {
		log.info("insert 호출 성공");
		// 확인 후 주석 처리
		//log.info("fileName : " + vo.getFile().getOriginalFilename());
		log.info("car_name : " + vo.getCar_name());

		int result = 0;

		if (vo.getFile() != null) {
			String car_image_ = FileUploadUtil.fileUpload(vo.getFile(), request, "carList");
			vo.setCar_image(car_image_);
		}

		result = adminCarListService.listInsert(vo);
		if (result == 1) {
			return "redirect:/admin/carlist/carList";
		} else {
			model.addAttribute("code", 1);
			return "redirect:/admin/carlist/carListInsertForm";
		}
	}

	// 3. 리스트 상세내용 조회
	@RequestMapping(value = "/admin/carlist/carListDetail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam int car_model_number, HttpSession session) throws Exception {
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/carlist/adminCarListDetail");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminCarListService.detail(car_model_number));
		return mav;
	}

	// 4-1. 차량 수정 폼
	@RequestMapping(value = "/admin/carlist/carListUpdateForm", method = RequestMethod.POST)
	public ModelAndView updateForm(@RequestParam int car_model_number, HttpSession session) throws Exception {
		log.info("updateForm 호출 성공");
		// 모델(데이터) + 뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("admin/carlist/adminCarListUpdate");
		// 뷰에 전달할 데이터
		mav.addObject("vo", adminCarListService.detail(car_model_number));
		return mav;
	}

	//4-2. 차량 수정 처리
	@RequestMapping(value = "/admin/carlist/carListUpdate", method = RequestMethod.POST)
	public String update(@ModelAttribute AdminCarListVO vo) throws Exception {
		log.info("update 호출 성공");

		int result = 0;
		String url = "";

		result = adminCarListService.update(vo);

		if (result == 1) {
			url = "/admin/carlist/carList";

		} else {
			url = "/admin/carlist/carListDetail?car_model_number = " + vo.getCar_model_number();
		}

		return "redirect:" + url;
	}

	// 5. 차량 삭제
	@RequestMapping("/admin/carlist/carLsitDelete")
	public String delete(@RequestParam int car_model_number) throws Exception {
		adminCarListService.delete(car_model_number);
		return "redirect:/admin/carlist/carList";
	}
}
