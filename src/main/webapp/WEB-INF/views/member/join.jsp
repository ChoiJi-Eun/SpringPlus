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
	
	<label></label>
	<input type="text" id="" name=""><br>
	
	<label></label>
	<input type="password" id="" name=""><br>
	
	<label></label>
	<input type="text" id="" name=""><br>
	
	<label></label>
	<input type="password" id="" name=""><br><br>
	
	
	
	<button>회원가입</button>

</form>
</div>


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />