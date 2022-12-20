package board.dao.face;

import board.dto.Member;

public interface MemberDao {

	/**
	 * 회원가입 DB에 insert
	 * 
	 * @param memberParam 회원가입 정보들
	 */
	public void insert(Member memberParam);

	/**
	 * 아이디 비번을 조회해서 행 count를 이용하여 처리
	 * 
	 * @param loginParam - 로그인한 유저의 정보
	 * @return - int
	 */
	public int selectCntByIdPw(Member loginParam);

	/**
	 * id를 이용하여 nick 조회하기
	 * 
	 * @param loginParam 조회하혀는 회원의 정보
	 * @return 조회된 nick
	 */
	public String selectNick(Member loginParam);

	/**
	 * id 중복 체크
	 * 
	 * @param member - 새로 가입할 id값을 DB와 비교하여 체크 
	 * @return int
	 */
	public int idChk(Member member);

	/**
	 * nick 중복 체크
	 * 
	 * @param member - 새로 가입할 nick값을 DB와 비교하여 체크 
	 * @return int
	 */
	public int nickChk(Member member);

	/**
	 * 로그인한 회원의 정보 조회하기
	 * @param member - 회원의 정보들
	 * @return member
	 */
	public Member selectMember(Member member);
	
	
}
