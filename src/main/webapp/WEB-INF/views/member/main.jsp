<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<br><h4>회원가입 메인 페이지</h4>
<hr>

<div id="logInOut" style=" text-align: center;">
<%-- 비로그인 상태 --%>
<c:if test="${empty isLogin }">
<a href="<%=request.getContextPath() %>./login"><button style="font-size: 1.5em;">로그인</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath() %>./join"><button style="font-size: 1.5em;">회원가입</button></a><br>
</c:if>


<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">
<a href="<%=request.getContextPath() %>./logout"><button style="font-size: 1.5em;">로그아웃</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=request.getContextPath() %>../board/list"><button style="font-size: 1.5em;">게시판</button></a><br>
</c:if>
</div>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />