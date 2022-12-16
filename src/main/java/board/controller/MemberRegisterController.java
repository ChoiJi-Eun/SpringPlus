package board.controller;

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
public class MemberRegisterController {
	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
//	@GetMapping("/member/id")
//	@ResponseBody
//	public void idCheck(Member member) {
//		logger.info("/member/id [GET]");
////		return "redirect:/member/join";
//	}
	
//	@PostMapping("/member/id")
//	@RequestMapping(value = "/member/id",  method = RequestMethod.POST)
	@RequestMapping("/member/id")
//	@GetMapping("/member/id")
	@ResponseBody
	public int idCheckProc(Member member) {
		logger.info("/member/id 접속");
		
		int result = memberService.idChk(member);
		
		if( member.getId() != null ) {
			result = 1;
			logger.info("result: {}", result);
		}
		return result;
	}	
	
	
}
