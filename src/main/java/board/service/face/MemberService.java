package board.service.face;

import board.dto.Member;

public interface MemberService {

	
	/**
	 * 회원 가입
	 * 
	 * @param memberParam - 회원가입한 유저의 정보들
	 */
	public void join(Member memberParam);

	/**
	 * 로그인하기
	 * 
	 * @param loginParam - 로그인한 유저의 정보
	 * @return - boolean t/f
	 */
	public boolean login(Member loginParam);

	/**
	 * 로그인한 유저의 id를 이용하여 nick을 조회하기
	 * 
	 * @param loginParam 조회하려는 회원의 id를 가진 정보들
	 * @return 조회된 nick
	 */
	public String getNick(Member loginParam); 
	

	/**
	 * 아이디 중복 체크
	 * 
	 * @param member
	 * @return int 0 or int 1
	 */
	public int idChk(Member member);

	/**
	 * 닉네임 중복 체크
	 * 
	 * @param member
	 * @return int 0 or int 1
	 */
	public int nickChk(Member member);

	/**
	 * 로그인한 회원의 정보 가져오기
	 * 
	 * @param member - 회원 정보
	 * @return member
	 */
	public Member getUserinfo(Member member);

	/**
	 * 회원 탈퇴
	 * 
	 * @param id - 로그인한 회원의 정보
	 * @return 
	 */
	public void deleteMember(String id);

	/**
	 * 회원탈퇴시 필요한 pw값 있는지 없는지
	 * 
	 * @param member - 회원 정보
	 * @return int
	 */
	public int pwChk(Member member);

}
