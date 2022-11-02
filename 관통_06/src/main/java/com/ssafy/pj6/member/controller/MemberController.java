package com.ssafy.pj6.member.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.pj6.member.model.MemberDto;
import com.ssafy.pj6.member.model.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {

	private final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		logger.info("MemberCotroller 생성자 호출!!!!");
		this.memberService = memberService;
	}

	@GetMapping("/join")
	public String join() {
		return "user/joinMember";
	}

	@PostMapping("/join")
	public String join(RedirectAttributes attr, MemberDto memberDto, Model model) {
		logger.debug("memberDto info : {}", memberDto);
		try {
			memberService.joinMember(memberDto);
			attr.addFlashAttribute("msg", "회원 가입을 완료하였습니다.");
			return "redirect:/user/login";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제 발생!!!");
			return "error/error";
		}
	}

	@GetMapping("/update/{userid}")
	public String showUpdateForm(@PathVariable("userid") String userId, Model model) {
		try {
			MemberDto user = memberService.getMember(userId);
			System.out.println(user.toString());
			model.addAttribute("userinfo", user);
			return "user/updateMember";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 정보 조회 중 문제 발생!!!");
			return "error/error";
		}
	}

	@PostMapping("/update")
	public String updateMember(RedirectAttributes attr, HttpSession session, MemberDto user, Model model) {
		try {
			memberService.updateMember(user);
			session.setAttribute("userinfo", user);
			attr.addFlashAttribute("msg", "회원 정보를 수정했습니다.");
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 정보 수정 중 문제 발생!!!");
			return "error/error";
		}
	}

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session,
			HttpServletResponse response) {
		logger.debug("map : {}", map.get("userid"));
		try {
			MemberDto memberDto = memberService.loginMember(map);
			logger.debug("memberDto : {}", memberDto);
			if (memberDto != null) {
				session.setAttribute("userinfo", memberDto);

				Cookie cookie = new Cookie("ssafy_id", map.get("userid"));
				cookie.setPath("/board");
				if ("ok".equals(map.get("saveid"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				return "redirect:/";
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
				return "user/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제 발생!!!");
			return "error/error";
		}
	}

	@GetMapping("/logout")
	public String logout(RedirectAttributes attr, HttpSession session) {
		attr.addFlashAttribute("msg", "로그아웃 하였습니다.");
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/delete/{userid}")
	public String deleteMember(@PathVariable("userid") String userId, RedirectAttributes attr, HttpSession session,
			Model model) {
		try {
			memberService.deleteMember(userId);
			attr.addFlashAttribute("msg", "회원 탈퇴를 완료하였습니다.");
			session.invalidate();
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 탈퇴 중 문제 발생!!!");
			return "error/error";
		}
	}

//    @GetMapping("/list")
//    public String list() {
//        return "redirect:/assets/list.html";
//    }

	// @GetMapping("/{userid}")
//    @ResponseBody
//    public String idCheck(@PathVariable("userid") String userId) throws Exception {
//        logger.debug("idCheck userid : {}", userId);
//        int cnt = memberService.idCheck(userId);
//        return cnt + "";
//    }
}
