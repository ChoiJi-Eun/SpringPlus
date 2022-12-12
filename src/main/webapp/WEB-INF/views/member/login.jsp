<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
#login {
	margin-left: 300px; 
	font-size: 1.2em;
}
#login label { 
	display: inline-block;
	width: 100px;
}
button { margin-left: 100px; }
</style>


<br><h4>회원 로그인 페이지</h4>
<hr>

<div id="login">
<form action="<%=request.getContextPath() %>./login" method="post">
id: 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: 2&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉: 3<br>
id: a&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: b&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉: c<br>
id: b&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: c&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉: d<br>
id: r&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: rr&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닉: rrr<br>
id: writer1&nbsp;&nbsp;&nbsp;pw: writer11&nbsp;&nbsp;닉: writer111<br>
id: writer2&nbsp;&nbsp;&nbsp;pw: writer22&nbsp;&nbsp;닉: writer222<br>
id: writer3&nbsp;&nbsp;&nbsp;pw: writer33&nbsp;&nbsp;닉: writer333<br>
id: aaaa&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: 123&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp닉: dfsdf<br>
id: Apple&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pw: 123&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp닉: dfsdf<br>

<br>
	<label>아이디</label> <input type="text" name="id"><br>
	<label>비밀번호</label> <input type="password" name="pw"><br><br>
	
	<button>로그인</button>

</form>
</div>


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />