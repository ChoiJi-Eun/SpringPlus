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
	width: 120px;
}
#submit { margin-left: 100px; }
img { width: 15px; height: 15px; margin-bottom: 7px; }
</style>

<br><h4>회원 가입 페이지</h4>
<hr>

<div id="join">
<form action="<%=request.getContextPath() %>./join" method="post">
	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="id" name="id">
	<button type="button">중복검사</button><br>
	
	<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw" name="pw"><br>
	
	<label>비밀번호확인<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pwcheck" name="pwcheck"><br>
	
	<label>닉네임</label>
	<input type="text" id="nick" name="nick"><br>
	
	<label>이름<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="name" name="name"><br>
	
	<label>성별</label>
	<input type="radio" name="gender" value="man" checked="checked">&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" value="woman">&nbsp;여자<br>
	
	<label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<select id="phone1" name="phone[]" style="width: 60px;">
		<option value="010">010</option>	
		<option value="011">011</option>	
		<option value="02">02</option>	
		<option value="070">070</option>
<!-- 		<option value="none" selected="selected">없음</option>	 -->
	</select>
	-&nbsp;<input id="phone2" name="phone[]" style="width: 60px; height: 23px;">
	-&nbsp;<input id="phone3" name="phone[]" style="width: 60px; height: 23px;"><br>
	
	
	<label>주소</label>
	<input type="text" id="addr" name="addr"><br>
	
	<label>이메일</label>
	<input type="email" id="email" name="email" placeholder="example@gmail.com" required><br><br>
	
	<button id="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
	<button type="reset" id="cancel">취소</button>
<!-- 	<input type="reset" id="cancel" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소" style=" border: 1px solid black;"> -->
<!-- 	<a style="color: red; border: 1px solid black; padding: 5px;" onclick="history.go(-1)">취소</a> -->
<!-- 	<a style="color: red;"><button class="btn btn-outline-danger" onclick="history.go(-1)">취소</button></a> -->
<!-- 	<input style="color: red;" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소"> -->
</form>
</div>


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />