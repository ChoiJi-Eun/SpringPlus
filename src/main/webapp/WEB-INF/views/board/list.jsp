<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
th, td { text-align: center; }
img {
	width: 15px;
	height: 15px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/board/write")
	})

	
})
</script>


<div id="result">
<br><h4>목록보기</h4>
<h4 style="text-align: right"><button id="btnWrite" class="btn btn-light" >글쓰기</button>&nbsp;&nbsp;&nbsp;

<%-- 비로그인 상태 --%>
<c:if test="${empty isLogin }">
<a href="<%=request.getContextPath() %>/member/login"><button type="button" class="btn btn-light">로그인</button></a><br><br>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">
<a href="<%=request.getContextPath() %>/member/logout"><button type="button" class="btn btn-light">로그아웃</button></a>
</c:if>
</h4>

<table class="table t table-striped table-hover table-condensed"> 
<tr>
	<th>글번호</th>	
	<th>제목</th>
	<th>작성자</th>
	<th>닉네임</th>
	<th>조회수</th>
	<th>작성일</th>
	<th>첨부파일</th>
</tr>

<c:forEach items="${boardlist }" var="b">
<tr>
<%-- 	<td style="width: 10%">${b.boardNo }</td> --%>
<%-- 	<td style="width: 25%"><a href="./view?boardNo=${b.boardNo }">${b.title }</a></td> --%>
<%-- 	<td style="width: 15%">${b.writerId }</td> --%>
<%-- 	<td style="width: 15%">${b.writerNick }</td> --%>
<%-- 	<td style="width: 10%">${b.hit }</td> --%>
<%-- 	<td style="width: 15%"><fmt:formatDate value="${b.writeDate }" pattern="yyyy-MM-dd"/> </td> --%>
	<td style="width: 10%">${b.BOARD_NO }</td>
	<td style="width: 25%"><a href="./view?boardNo=${b.BOARD_NO }">${b.TITLE }</a></td>
	<td style="width: 15%">${b.WRITER_ID }</td>
	<td style="width: 15%">${b.WRITER_NICK }</td>
	<td style="width: 10%">${b.HIT }</td>
	<td style="width: 15%"><fmt:formatDate value="${b.WRITE_DATE }" pattern="yyyy-MM-dd"/> </td>
	<td style="width: 10%">
		<c:if test="${not empty b.FILE_NO }">
			<a href="../upload/${b.STORED_NAME }" download="${b.ORIGIN_NAME }"><img class="attachedimg" alt="attachedimg" src="../resources/free-icon-attach-file-8138520.png"></a>
		</c:if>
<%-- 			<a href=""><img class="attachedimg" alt="attachedimg" src="<%=request.getContextPath() %>../resources/free-icon-attach-file-8138520.png"></a> --%>

<!-- 			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-paperclip" viewBox="0 0 16 16"> -->
<!-- 			  <path d="M4.5 3a2.5 2.5 0 0 1 5 0v9a1.5 1.5 0 0 1-3 0V5a.5.5 0 0 1 1 0v7a.5.5 0 0 0 1 0V3a1.5 1.5 0 1 0-3 0v9a2.5 2.5 0 0 0 5 0V5a.5.5 0 0 1 1 0v7a3.5 3.5 0 1 1-7 0V3z"/> -->
<!-- 			</svg> -->
	</td>
</tr>
</c:forEach>
</table>


<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .result -->
<!-- </div>.container -->

<c:import url="../layout/footer.jsp" />