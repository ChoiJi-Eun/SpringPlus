package board.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import board.dto.Member;
import board.service.face.MemberService;

@Controller
public class MemberRegisterController {
	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	@RequestMapping("/member/id")
	@ResponseBody
	public int idCheck1(Member member) {
		logger.info("/member/id 접속");
		
		int result = memberService.idChk(member);
		logger.info("result: {}", result);
	
		return result;
		
		
	}	
	
	@RequestMapping("/member/id2")
	@ResponseBody
	public Map<Object, Object> idCheck2(Member member) {
		logger.info("/member/id2 접속");
		
        int count = 0;
        
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = memberService.idChk(member);
        logger.info("count: {}", count);
        map.put("result", count);
 
//        String usderid = member.getId();
//        if(usderid != null) {
//        	count = 1;
//        }
        
        return map;
		
		
	}	
	
	
}
