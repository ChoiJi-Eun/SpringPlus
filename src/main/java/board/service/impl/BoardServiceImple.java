package board.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import board.dao.face.BoardDao;
import board.dto.Board;
import board.dto.BoardFile;
import board.service.face.BoardService;
import board.utill.Paging;

@Service
public class BoardServiceImple implements BoardService {

	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서블릿 컨텍스트 객체 (첨부파일관련)
	@Autowired ServletContext context;
	
	//DAO객체
	@Autowired BoardDao boardDao;
	
// /board/list	
	@Override
	public List<Board> list() {
		return boardDao.selectList();
	}
	
	@Override
	public Paging getPaging(int curPage) {
		
		int totalCount = boardDao.selectCntAll(); //총 게시글 수 조회
		
		Paging paging = new Paging(totalCount, curPage); //페이징 계산
		
		return paging;
	}

//	@Override
//	public List<Board> list(Paging paging) {
//		return boardDao.selectAll(paging);
//	}
	@Override  		//게시판리스트 + 첨부파일 select
	public List<Map<String,Object>> list(Paging paging) {
//		return boardDao.selectAll(paging);
		return boardDao.selectAll(paging);
	}
	
// /board/view
	@Override
	public Board view(int boardNo) {
		if( boardDao.hit(boardNo) > 0 ) {
			Board boardHit = new Board();
			boardHit .setHit(boardNo);
		}
		return boardDao.select(boardNo);
	}
	
// /board/write
	@Override
	public void write(Board board, MultipartFile file) {
		logger.info("write()-boardService"); 
		
	//게시글 처리
		if( "".equals( board.getTitle() ) ) {
			board.setTitle("(제목없음)");
		}
		boardDao.insertBoard(board);
		
	//첨부파일 처리
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath: {}", storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//--------------------------------------------
		//첨부파일 정보 DB 기록
		BoardFile boardFile = new BoardFile();
		boardFile.setBoardNo( board.getBoardNo() );
		boardFile.setOriginName(originName);
		boardFile.setStoredName(storedName);
						
		boardDao.insertFile(boardFile);
	}

	@Override
	public BoardFile getAttachFile(Board view) {
		return boardDao.selectBoardFileByBoardNo(view);
	}
// /board/update
	@Override
	public void update(Board board, MultipartFile file) {
		logger.info("update()-boardService"); 
	//게시글 처리
		if( "".equals( board.getTitle() ) ) {
			board.setTitle("(제목없음)");
		}
		boardDao.updateBoard(board); //게시글 처리
		
	//첨부파일 처리
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		logger.info("storedPath: {}", storedPath);
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		//--------------------------------------------
		//첨부파일 정보 DB 기록
		BoardFile boardFile = new BoardFile();
		boardFile.setBoardNo( board.getBoardNo() );
		boardFile.setOriginName(originName);
		boardFile.setStoredName(storedName);
						
		boardDao.deleteFile(board);		 //기존 첨부파일 삭제	
		boardDao.insertFile(boardFile);	 //새로운 첨부파일 삽입	
	}
	
//사용안함
	@Override		
	public boolean selectBoardfile(Board board) {
		int result = boardDao.selectCntBoardFileByBoardNo(board);
		logger.info("service-result:{}", result);
		if(result>0) return true;
		return false;
//		return boardDao.selectCntBoardFileByBoardNo(board);
	}
	
// /board/delete
	@Override
	public void delete(Board board) {
		boardDao.deleteFile(board); //첨부파일 삭제
		boardDao.delete(board); //board 정보 삭제
	}







}























