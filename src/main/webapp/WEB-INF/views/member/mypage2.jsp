<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
#join {
	margin-left: 170px; 
	font-size: 1.2em;
}
#join label { 
	display: inline-block;
	width: 122px;
}
#submit { margin-left: 130px; }
img { width: 15px; height: 15px; margin-bottom: 7px; }
input {
	margin-bottom: 7px;
	width: 300px;
}
#btn { font-size: 1.2em;  }
</style>

<br><h4>마이페이지</h4>
<hr>
 
<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<div id="join">
<%-- <form action="<%=request.getContextPath() %>./join" method="post" onsubmit="return validate();">   --%>

	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" class="id" id="id" name="id" required placeholder=" 4~10의 영문자, 숫자만 입력해주세요"><br>
	
	
	<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw" name="pw" required placeholder=" 4~8의 영문자, 숫자만 입력해주세요"><br>
	
	
	<label>비밀번호 확인<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw_check" name="pw_check" required><br>
	
	
	<label>닉네임<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="nick" name="nick" required placeholder=" 3~10의 모든 문자를 입력해주세요"><br>
	
	
	<label>이름<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="name" name="name" required><br>
	
	<label>성별</label>
	<input type="radio" name="gender" value="man" checked="checked" style="width: 50px; margin: 0px -20px -20px;">&nbsp;남자
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" value="woman" required style="width: 50px; margin: 0px -20px -20px;">&nbsp;여자<br>
	
	<label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<select id="phone1" name="phone" style="width: 75px; height: 29.99px;" required><br>
		<option value="010">010</option>	
		<option value="011">011</option>	
		<option value="02">02</option>	
		<option value="070">070</option>
<!-- 		<option value="none" selected="selected">없음</option> -->	
	</select>
	-&nbsp;<input id="phone2" name="phone" style="width: 97px; height: 29.99px;">
	-&nbsp;<input id="phone3" name="phone" style="width: 97px; height: 29.99px;"><br>

<!-- <label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label> DB저장 됨 -->
<!-- <input name="phone" id="phone4" required="required" placeholder="  '-' 를 포함해 입력해주세요" -->
<!--  style="width: 300px; border: 1px solid black;"><span id="phonemsg"></span><br> -->

<!-- 각각 받아온 걸 같은 컬럼에 저장하려면 java코드로 따로 합성해서 사용하기 -->

	
	
	<label>주소</label>
<!-- 	<input type="text" id="addr" name="addr"><br> -->

	<!-- https://postcode.map.daum.net/guide -->
	<input type="text" class="address_input_1"  name="addr" id="sample6_postcode" placeholder="우편번호" style="width: 75px;">
	<input type="button" onclick="sample6_execDaumPostcode()" value="주소검색" style="width: 100px;">
	<input type="hidden" class="sample6_extraAddress" id="sample6_extraAddress" placeholder="(동)" style="width: 135px;"><br>
	
	<label></label>&nbsp;<input type="text" class="address_input_2" name="addr" id="sample6_address" placeholder="주소" style="width: 400px;"><br>
	
	<label></label>&nbsp;<input type="text" class="address_input_3" name="addr" id="sample6_detailAddress" placeholder="나머지 주소" style="width: 400px;"><br>
		
	
	
	
	<label>이메일</label>
	<input type="email" id="email" name="email" placeholder="example@gmail.com"><br><br>
	
	<div id="btn">
		<button type="submit" id="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
		<button type="reset" id="btnCancel">취소</button></div><!-- #btn end -->
		
<!-- </form> -->
</div><!-- #join end -->




</c:if>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />