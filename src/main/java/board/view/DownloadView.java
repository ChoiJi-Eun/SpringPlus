package board.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import board.dto.BoardFile;


public class DownloadView extends AbstractView {

	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서블릿 컨텍스트 객체
	@Autowired ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(
			
			Map<String, Object> model
			, HttpServletRequest request
			, HttpServletResponse response
			
		) throws Exception {
		
		logger.info("응답 테스트");
		
//		response.setContentType("text/html;charset=utf-8");  //응답메시지 헤더 설정
//		response.getWriter().println("<h1>직접 HTML 출력</h1>"); //응답메시지 바디 설정
		
		//---------------------------------------------------------------------
		
		//모델값 가져오기
		BoardFile downFile = (BoardFile) model.get("downFile");
		logger.info("downFile : {}", downFile); 
		
		//저장된 파일의 폴더(upload)
		String path = context.getRealPath("upload");
		
		//저장된 파일의 이름
		String filename = downFile.getStoredName();
		
		//실제 업로드된 파일에 대한 객체
		File src = new File(path, filename);
		
		logger.info("서버에 업로드된 파일 : {}", src);
		logger.info("파일 존재 여부 : {}", src.exists());
		
		//---------------------------------------------------------------------

		//** HTTP응답을 직접 구성하여 처리한다
		//	-> HTTP Response HEADER 정보 작성 필요
		//	-> HTTP Response BODY 정보 작성 필요
		
		//---- 응답 메시지의 HEADER영역 설정 ----
		
		//파일을 전송하는 콘텐트타입으로 설정
		//	-> application/octet-stream : 이진 데이터 평식을 나타낸다 -> 모든 형식의 파일
		response.setContentType("application/octet-stream");
		
		//응답 데이터의 크기 설정 (int형, 0~약 21억 바이트까지(2147483647) == 2GB )
		response.setContentLength( (int)src.length() );
		
		//응답 데이터의 인코딩 설정
		response.setCharacterEncoding("UTF-8");
		
		//브라우저가 다운로드할 파일의 이름을 설정
		String outputName = URLEncoder.encode(downFile.getOriginName(), "UTF-8");  
		
//		response.setHeader("content-Disposition", "attachment; filename=\"다운로드받을파일명\" ");
		response.setHeader("content-Disposition", "attachment; filename=\"" + outputName + "\" ");
		
		//----------------------------------------
		//---- 응답 메시지의 BODY영역 설정 ----
		
		//** 서버의 File객체 -> FileInputStream 입력 -> HTTP Response OutputStream 출력
		
		//서버의 파일 입력 스트림
		FileInputStream in = new FileInputStream(src);
		
		//클라이언트 응답 출력 스트림
		OutputStream out = response.getOutputStream();
		
		//서버->클라이언트 파일 복사
		FileCopyUtils.copy(in, out);
		
		
		//----------------------------------------
		
		
		
	}

}












