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

}
