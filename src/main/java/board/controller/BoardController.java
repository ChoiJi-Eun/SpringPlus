package board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.dto.Board;
import board.dto.BoardFile;
import board.dto.Member;
import board.service.face.BoardService;
import board.utill.Paging;

@Controller
public class BoardController {

	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired BoardService boardService;
//	@Autowired private MemberService memberService;
	
	@RequestMapping("/board/list")
	public void list(
			Model model
			, @RequestParam(defaultValue = "0") int curPage
			, MultipartFile file
			) {
		logger.info("/board/list ");
		
//		List<Board> boardlist = boardService.list(); 
//		for( Board b : boardlist )	logger.info("{}", b); //콘솔,웹페이지 모두 뜸
		
		Paging paging = boardService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		//Board 정보들 목록에 불러오기 
//		List<Board> boardlist = boardService.list(paging);
//		for( Board b : boardlist )	logger.info("b:{}", b);
		
		//Board와 Boardfile(첨부파일 유무 아이콘 띄우기 작업) 함께 목록에 불러오기
		List<Map<String,Object>> boardlist = boardService.list(paging);
		for( Map<String, Object> b : boardlist )	logger.info("b:{}", b);
		model.addAttribute("boardlist", boardlist);
	}
	
	@RequestMapping("/board/view")
	public void view(
			@RequestParam(required=true) int boardNo, Model model  ) {
		logger.info("/board/view");
		
		//boardNo 불러오기
		logger.info("boardNo: {}", boardNo);
		
		//상세보기 + 조회수 1개 증가하기
		Board view = boardService.view(boardNo);
		logger.info("조회결과: {}", view);
		model.addAttribute("view", view);
		
		logger.info("boardNo: {}", boardNo);
		
		//첨부파일 모델값 전달
		BoardFile boardFile = boardService.getAttachFile(view);
		model.addAttribute("boardFile", boardFile);
	}
	
	@GetMapping("/board/write")
	public void write() { 	logger.info("/board/write [GET]"); }
	
	@PostMapping("/board/write")
	public String writeProc(
			HttpSession session,
			Board board,
			MultipartFile file
			, Member member
			) {
		logger.info("/board/write [POST]");
//		logger.info("write - board: {}", board);
//		logger.info("write - file: {}", file);
//		
		board.setWriterId( (String) session.getAttribute("id") ); //필수코드
		board.setWriterNick( (String) session.getAttribute("nick")); //필수코드
		
		boardService.write(board, file);
		
		logger.info("/board/write [POST] writerId: {}", board.getWriterId());
		logger.info("/board/write [POST] wirterNick: {}", board.getWriterNick());
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/board/update")
	public void update(
//			HttpSession session,
			int boardNo,
			MultipartFile file,
			Model model
			) { 
		logger.info("/board/update [GET]"); 
		
		Board board = boardService.view(boardNo);
		model.addAttribute("view", board);	
		
		//첨부파일 모델값 전달
		BoardFile boardFile = boardService.getAttachFile(board);
		model.addAttribute("boardFile", boardFile);
		
		logger.info("update - board: {}", board);
		logger.info("update - boardFile: {}", boardFile);
	}

	@PostMapping("/board/update")
	public String updateProc(
			HttpSession session,
			Board board,
			MultipartFile file
			) {
		logger.info("/board/update [POST]");
		
		boardService.update(board, file);
		
		logger.info("update [POST] - board: {}", board);
		logger.info("update [POST] - file: {}", file);
		
		return "redirect:/board/view?boardNo=" + board.getBoardNo(); 
	}

	@RequestMapping("/board/delete") 
	public String download(Board board) {
		logger.info("/board/delete");
		
		boardService.delete(board);
		
		return "redirect:/board/list";
	}
	
	
}













