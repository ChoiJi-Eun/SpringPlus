package board.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import board.dto.Member;
import board.service.face.MemberService;

@Controller
public class MemberController {
	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	@RequestMapping("/member/main")
	public void main() {
		logger.info("/member/main");
	}
	
	@GetMapping("/member/join")
	public void join() {
		logger.info("/member/join [GET]");
	}
	
	@PostMapping("/member/join")
	public String joinProc(Member memberParam) {
		logger.info("/member/join [POST]");
		
		logger.info("{}", memberParam);
		
		memberService.join(memberParam);
		
		return "redirect:/member/main";
	}
	
	@GetMapping("/member/login")
	public void login() {
		logger.info("/member/login [get]");
	}
	
	@PostMapping("/member/login")
	public String loginProc(Member loginParam, HttpSession session) {
		logger.info("/member/login [POST]");
		
		logger.info("{}", loginParam);
		
		boolean isLogin = memberService.login(loginParam);
		logger.info("isLogin : {}", isLogin);
		
		
		if( isLogin ) {  //로그인 성공
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("id", loginParam.getId()); 
			session.setAttribute("nick", memberService.getNick(loginParam));
			logger.info("로그인 성공");
		} else {  //로그인 실패
			session.invalidate();  //강제 로그아웃 처리하는 코드(세션 정보 지우기)
			logger.info("로그인 실패");
		}
		return "redirect:/member/main";
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		logger.info("/member/logout");
		session.invalidate();
		return "redirect:/member/main";
	}
//--------------------------------------------------------------------------------------
////	@PostMapping("/member/id")
//	@RequestMapping(value = "/member/id",  method = RequestMethod.POST)
//	@ResponseBody
//	public void idCheck(Member member) {
//		logger.info("/member/id");
//		
//	}
	
	
	
}
