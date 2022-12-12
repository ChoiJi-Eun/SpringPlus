package board.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.face.MemberDao;
import board.dto.Member;
import board.service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired private MemberDao memberDao;

	@Override
	public void join(Member memberParam) {
		logger.info("join(): {}", memberParam);
		memberDao.insert(memberParam);		
	}

	@Override
	public boolean login(Member loginParam) {
		logger.info("login(): {}", loginParam);

		if( memberDao.selectCntByIdPw(loginParam)>0 ) {
			return true; //로그인 인증 성공
		}
		
		return false; //로그인 인증 실패
	}

	@Override
	public String getNick(Member loginParam) {
		logger.info("getNick() - memberService");
		return memberDao.selectNick(loginParam);
	}
	


}
