<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
      
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
#join {
	margin-left: 300px; 
	font-size: 1.2em;
}
#join label { 
	display: inline-block;
	width: 100px;
}
button { margin-left: 100px; }
</style>

<br><h4>회원 가입 페이지</h4>
<hr>

<div id="join">
<form action="<%=request.getContextPath() %>./join" method="post">
	<label>아이디</label>
	<input type="text" id="id" name="id"><br>
	
	<label>비밀번호</label>
	<input type="password" id="pw" name="pw"><br>
	
	<label>닉네임</label>
	<input type="text" id="nick" name="nick"><br>
	
	<label>이름</label>
	<input type="text" id="name" name="name"><br>
	
	<label>생년월일</label>
	<input type="text" id="birth" name="birth"><br>
	
	<label>성별</label>
	<input type="radio" id="birth" name="birth"><br>
	
	<label>전화번호</label>
	<input type="text" id="phone" name="phone"><br>
	
	<label>이메일</label>
	<input type="email" id="email" name="email"><br><br>
	
	<button>회원가입</button>

</form>
</div>


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />