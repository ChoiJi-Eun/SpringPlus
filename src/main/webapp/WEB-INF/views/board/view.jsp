<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
th, td { text-align: center; }

</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#list").click(function() {
		$(location).attr("href", "/board/list")
	})
	$("#btnUpdate").click(function() {
		$(location).attr("href", "./update?boardNo=${view.boardNo }")
	})
	$("#btnDelete").click(function() {
		$(location).attr("href", "./delete?boardNo=${view.boardNo }")
	})


	
})
</script>

<div id="result">
<br><h4>상세보기</h4>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }"><!-- 로그인한 회원만 보이게 -->

<!-- 글쓴이와 로그인한 회원과 일치하면 보이게 -->
<%-- 	<c:if test="${id eq view.writerId }"> --%>
<!-- <h4 style="text-align: right"> -->
<%-- <a href="<%=request.getContextPath() %>./update?boardNo=${view.boardNo }"><button id="btnUpdate" class="btn btn-info" >글수정</button></a></h4> --%>
<!-- <button id="btnUpdate" class="btn btn-info" >글수정</button> -->
<!-- <button id="btnDelete" class="btn btn-danger" >삭제</button></h4> -->
<%-- 	</c:if> --%>

<table class="table t table-striped table-condensed"> 
<tr>
	<th style="width: 5%">글번호</th>	
	<th style="width: 15%">제목</th>
	<th style="width: 30%">본문</th>
	<th style="width: 15%">작성자</th>
	<th style="width: 15%">닉네임</th>
	<th style="width: 5%">조회수</th>
	<th style="width: 15%">작성일</th>
</tr>

<tr>
	<td>${view.boardNo }</td>
	<td>${view.title }</td>
	<td>${view.content }</td>
	<td>${view.writerId }</td>
	<td>${view.writerNick }</td>
	<td>${view.hit }</td>
	<td><fmt:formatDate value="${view.writeDate }" pattern="yy-MM-dd"/> </td>
</tr>
<tr>
	<th colspan="7" style="text-align: left;">첨부파일</th>
</tr>
<tr>
<%-- 	<td colspan="7"  style="text-align: left;"><a href="">${boardFile.originName }</a></td> --%>
	<td colspan="7"  style="text-align: left;"><a href="../upload/${boardFile.storedName }" download="${boardFile.originName }">${boardFile.originName }</a></td>
</tr>
</table>
<br><br>
</c:if>

<%-- <span class="pull-right">total : ${paging.totalCount }</span> --%>
<%-- <c:import url="/WEB-INF/views/layout/paging.jsp" /> --%>

<div class="clearfix" style=" text-align: center; height: 100px;">

<!-- 	<button type="button" class="btn btn-primary" onclick="history.go(-1)">목록</button>  -->
	<input type="reset" id="list" class="btn btn-outline-danger" value="목록">&nbsp;&nbsp;
	
<%-- 	<c:if test="${id eq view.writerId }"> --%>
		<button id="btnUpdate" class="btn btn-info">수정</button>&nbsp;&nbsp;
		<button id="btnDelete" class="btn btn-danger">삭제</button>
<%-- 	<a href="<%=request.getContextPath() %>./update?boardNo=${view.boardNo }"><button id="btnUpdate" class="btn btn-info" >수정</button></a>&nbsp;&nbsp; --%>
<%-- 	<a href="<%=request.getContextPath() %>./delete?boardNo=${view.boardNo }"><button id="btnDelete" class="btn btn-danger" >삭제</button></a> --%>
<%-- 	</c:if> --%>

</div>

</div><!-- .result -->
<!-- </div>.container -->

<c:import url="../layout/footer.jsp" />