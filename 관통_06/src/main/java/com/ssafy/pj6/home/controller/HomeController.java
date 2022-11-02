package com.ssafy.pj6.home.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.pj6.home.model.HomeDto;
import com.ssafy.pj6.home.model.service.HomeService;
import com.ssafy.pj6.member.controller.MemberController;
import com.ssafy.pj6.member.model.service.MemberService;

@Controller
@RequestMapping("/home")
public class HomeController {
	private final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private final HomeService homeService;

    @Autowired
    public HomeController(HomeService homeService) {
        logger.info("HomeCotroller 생성자 호출!!!!");
        this.homeService = homeService;
    }
	@GetMapping("/")
	public String showSearchForm() {
		return "apart/apart";
	}
	
	@PostMapping("/list")
	public String homeList(@RequestParam Map<String, String> map, Model model) {
		// sido, gugun, dong, aptname
		System.out.println("map 테스트" + map.get("sido"));
		System.out.println("map 테스트" + map.get("gugun"));
		System.out.println("map 테스트" + map.get("dong"));
		System.out.println("map 테스트" + map.get("aptname"));
		try {
			List<HomeDto> deals = homeService.listDeal(map);
			model.addAttribute("deals", deals);
			return "apart/apart";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "매매 정보 출력 중 에러 발생!");
			return "error/error";
		}
	}
	
	@GetMapping("/detail/{deal_no}")
	public String showHomeDetail(@PathVariable("deal_no") String deal_no, Model model) {
		try {
			HomeDto homeinfo = homeService.findApt(deal_no);
			model.addAttribute("homeinfo", homeinfo);
			return "apart/detail";
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "주택 정보 출력 중 에러 발생!");
			return "error/error";
		}
	}
}
