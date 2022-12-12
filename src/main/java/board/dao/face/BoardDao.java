package board.dao.face;

import java.util.List;
import java.util.Map;

import board.dto.Board;
import board.dto.BoardFile;
import board.utill.Paging;

public interface BoardDao {

	/**
	 * 페이징없는 게시판 목록
	 * 
	 * @return - Board
	 */
	public List<Board> selectList();

	/**
	 * 페이징있는 게시판 목록
	 * 
	 * @param paging
	 * @return - Board
	 */
//	public List<Board> selectAll(Paging paging);
	public List<Map<String,Object>> selectAll(Paging paging);

	/**
	 * 페이징 객체 생성 
	 * 
	 * @return curPage - 요청한 페이지 번호
	 */
	public int selectCntAll();

	
	/**
	 * 목록 상세보기
	 * 
	 * @param boardNo - 을 이용하여
	 * @return Board
	 */
	public Board select(int boardNo);

	/**
	 * DB에 HIT 컬럼에 +1증가시키기
	 * @param boardNo - 을 이용하여
	 * @return int
	 */
	public int hit(int boardNo);

	/**
	 * 글쓰기 - board정보 DB에 insert하기
	 * 
	 * @param board
	 */
	public void insertBoard(Board board);
	
	/**
	 * 글쓰기 - 첨부파일 DB에 insert하기
	 * 
	 * @param boardFile
	 */
	public void insertFile(BoardFile boardFile);

	/**
	 * 게시번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param view
	 * @return
	 */
	public BoardFile selectBoardFileByBoardNo(Board view);

	/**
	 * Board를 이용하여 상세보기
	 * 
	 * @param board 를 이용하여
	 * @return  Board
	 */
	public Board selectBoard(Board board);

	/**
	 * 게시글 정보 수정하기
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateBoard(Board board);

	/**
	 * 게시글을 참조하고 있는 기존 첨부파일 정보 삭제 
	 * @param board - 첨부파일을 삭제할 boardNo
	 */
	public void deleteFile(Board board);

	/**--사용안함--
	 * boardFile 있는지 없는지 체크
	 * 
	 * @param board - boardNo를 이용하여
	 * @return true/false
	 */
	public int selectCntBoardFileByBoardNo(Board board);

	/**
	 * 첨부파일 + Board 정보 삭제
	 * 
	 * @param board - 삭제할 boardNo
	 */
	public void delete(Board board);
	
	
}
