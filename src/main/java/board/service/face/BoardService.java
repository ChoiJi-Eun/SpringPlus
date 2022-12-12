package board.service.face;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import board.dto.Board;
import board.dto.BoardFile;
import board.utill.Paging;

public interface BoardService {

//게시판 목록 불러오기
	public List<Board> list();

	public Paging getPaging(int curPage);

//	public List<Board> list(Paging paging);
	public List<Map<String,Object>> list(Paging paging);

	
//boardNo를 이용하여 상세보고 조회수 +1하기
	public Board view(int boardNo);

	/**
	 * 글쓰기 + 첨부파일 
	 * 
	 * @param board
	 * @param file
	 */
	public void write(Board board, MultipartFile file);

	/**
	 * 파일번호를 이용하여 업로드된 첨부파일 정보 조회하기
	 * 
	 * @param view 조회할 게시글 번호 객체
	 * @return 첨부 파일 정보
	 */
	public BoardFile getAttachFile(Board view);

	/**
	 * 게시글, 첨부파일을 update한다
	 * 
	 * @param board - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(Board board, MultipartFile file);

	/**
	 * boardfile을 select하기
	 * 
	 * @param board - board 정보를 이용해서
	 * @return BoardFile
	 */
	public boolean selectBoardfile(Board board);

	/**
	 * 게시판 글 + 첨부파일 삭제하기
	 * @param board - boardNo를 이용해서
	 */
	public void delete(Board board);


	


	


}
