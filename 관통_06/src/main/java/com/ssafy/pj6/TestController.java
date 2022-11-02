package com.ssafy.pj6;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.pj6.home.model.HomeDto;
import com.ssafy.pj6.home.model.service.HomeService;
import com.ssafy.pj6.member.model.MemberDto;
import com.ssafy.pj6.member.model.service.MemberService;

@Controller
@RequestMapping("/test")
public class TestController {

    private final Logger logger = LoggerFactory.getLogger(TestController.class);

    private final HomeService homeService;

    @Autowired
    public TestController(HomeService homeService) {
        this.homeService = homeService;
    }

    
    @GetMapping("/1")
    public @ResponseBody String one() {
    	Map<String,String> map = new HashMap<>();
    	List<HomeDto> homes = null;
		map.put("dong", "1111011500");
		//map.put("aptName", aptName);
    	
    	try {
			homes = homeService.listDeal(map);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return homes.toString();
    }
    
    
    @GetMapping("/2")
    public @ResponseBody String two() {
    	HomeDto home = null;
    	try {
			home = homeService.findApt("11110000000001");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return home.toString();
    }
    
    
    

}

