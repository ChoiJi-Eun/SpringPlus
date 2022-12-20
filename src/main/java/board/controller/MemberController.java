package board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/member/id")
	@ResponseBody
	public int idCheck1(Member member) {
		logger.info("/member/id 접속");
		
		int result = memberService.idChk(member);
		logger.info("result: {}", result);
	
		return result;
	}	
	//원래는 Map<Object, Object> 로 만들어야하는데 지금은 굳이 필요없는 코드
	@RequestMapping("/member/id2")
	@ResponseBody
	public Map<Object, Object> idCheck2(Member member) {
		logger.info("/member/id2 접속");
		
        int count = 0;
        
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = memberService.idChk(member);
        logger.info("count: {}", count);
        map.put("result", count);
        
        return map;
	}
	@RequestMapping("/member/nick")
	@ResponseBody
	public int nickCheck1(Member member) {
		logger.info("/member/nick 접속");
		
		int result = memberService.nickChk(member);
		logger.info("result: {}", result);
	
		return result;
	}	
	//------------------------------------------------------------
	
	@RequestMapping("/member/mypage")
	public void mypage(Member member, HttpSession session, Model model) {
		logger.info("/member/mypage");
		
		Member data = memberService.getUserinfo(member);
		
		data.setPw( (String) session.getAttribute("pw") );
		data.setEmail( (String) session.getAttribute("email") );
		data.setName( (String) session.getAttribute("name"));
		data.setAddr( (String) session.getAttribute("addr") );
		data.setGender( (String) session.getAttribute("gender") );
		data.setEmail( (String) session.getAttribute("phone") );
		
//		String i = data.getName();
//		logger.info("i: {}", i);
		
		logger.info("pw: {}", data.getPw());
		logger.info("member: {}", member);
		logger.info("data: {}", data);
		
//		model.addAttribute("data", data);
		
	}
}
