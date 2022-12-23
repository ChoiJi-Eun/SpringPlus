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

	@Override
	public int idChk(Member member) {
		int result = memberDao.idChk(member);
		return result;
	}

	@Override
	public int nickChk(Member member) {
		int result = memberDao.nickChk(member);
		return result;
	}

	@Override
	public Member getUserinfo(Member member) {
		logger.info("ser.memberInfo- {}", member);
		return memberDao.selectMember(member);
	}

	@Override
	public void deleteMember(String id) {
		logger.info("ser.deleteMember(String id)");
		memberDao.delete(id);
	}

	@Override
	public int pwChk(Member member) {
		int result = memberDao.selectPw(member);
		return result;
	}
	
	

}
