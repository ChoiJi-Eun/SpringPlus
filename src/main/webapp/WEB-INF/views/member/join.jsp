<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
      
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />
<script type="text/javascript">
$(document).ready(function() {			/* 페이지 이동 */
	$("#btnCancel").click(function() {
		$(location).attr("href", "/member/main")
	})
	
})
$(document).ready(function() {			/* 유효성 검증 */
	$("#submit").click(function() {
		console.log("submit event")
		
		//유효성 검증 후 submit하기
		if( validate() ) {
			$(this).submit()
		}
		return false //submit 중단 시키기
	})

	//아이디 입력을 시도할 때 아이디 메시지 삭제하기
	$("#id").focus(function() {
		$("#idmsg").html('')
	})
	//패스워드 입력을 시도할 때 패스워드 메시지 삭제하기
	$("#pw").focus(function() {
		$("#pwmsg").html('')
	})
	//패스워드체크 입력을 시도할 때 패스워드체크 메시지 삭제하기
	$("#pw_check").focus(function() {
		$("#pw_check_msg").html('')
	})
	//전화번호 입력을 시도할 때 전화번호 메시지 삭제하기
	$("#phone2").focus(function() {
		$("#phonemsg").html('')
	})
	$("#phone3").focus(function() {
		$("#phonemsg").html('')
	})
	
})
//input 데이터 유효성 검증하기
function validate() {
	//-----아이디 유효성 검증
	// 아이디를 입력했는지 검증
	if( $("#id").val() == '' ) {
// 		alert("아이디를 입력해주세요!")
		$("#idmsg").html("아이디를 입력해주세요!")
		return false
	}
	// 아이디 입력값 검증
	if( !/^[a-zA-Z0-9]{4,10}$/.test( $("#id").val() )  ) {
		$("#idmsg").html("아이디는 4~10의 영문자, 숫자만 가능합니다.")	
		return false
	}
	
	//-----패스워드 유효성 검증
	// 패스워드를 입력했는지 검증
	if( $("#pw").val() == '' ) {
		$("#pwmsg").html("패스워드를 입력해주세요!")
		return false
	}
	// 패스워드 입력값 검증
	if( !/^[a-zA-Z0-9]{4,8}$/.test( $("#pw").val() )  ) {
		$("#pwmsg").html("패스워드는 4~8의 영문자, 숫자만 가능합니다.")	
		return false
	}
	// 패스워드체크 입력값과 패스워드 입력값 같은지 검증
	if(  $("#pw").val() != $("#pw_check").val()   ) {
		$("#pw_check_msg").html("패스워드가 일치하지 않습니다. 다시 시도해주세요")	
		return false
	}
	
	//-----전화번호 유효성 검증	
	// 전화번호 입력값 검증
	if( !/^[0-9]{4}$/.test( $("#phone2").val() )  ) {
		$("#phonemsg").html("phone2 전화번호는 각각 숫자 4자리만 가능합니다")	
		return false
	}
	if( !/^[0-9]{4}$/.test( $("#phone3").val() )  ) {
		$("#phonemsg").html("phone3 전화번호는 각각 숫자 4자리만 가능합니다")	
		return false
	}

	
	
	
	//--------------------
	return true
}

</script>
<style type="text/css">
#join {
	margin-left: 300px; 
	font-size: 1.2em;
}
#join label { 
	display: inline-block;
	width: 122px;
}
#submit { margin-left: 100px; }
img { width: 15px; height: 15px; margin-bottom: 7px; }
span { margin-left: 10px; font-weight: bolder; color: red;  }
input {
	margin-bottom: 5px;
}
</style>

<br><h4>회원 가입 페이지</h4>
<hr>

<div id="join">
<form action="<%=request.getContextPath() %>./join" method="post" onsubmit="return validate();"> 

	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="id" name="id" required>
<!-- 	<button type="button">중복검사</button> -->
	<span id="idmsg"></span><br>
	
	
	<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw" name="pw" required>
	<span id="pwmsg"></span><br>
	
	
	<label>비밀번호 확인<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw_check" name="pw_check" required>
	<span id="pw_check_msg"></span><br>
	
	
	<label>닉네임<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="nick" name="nick" required>
	<span id="nickmsg"></span><br>
	
	
	<label>이름<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="name" name="name" required>
	<span id="namemsg"></span><br>
	
	<label>성별</label>
	<input type="radio" name="gender" value="man" checked="checked">&nbsp;남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" value="woman" required>&nbsp;여자<br>
<!-- 	<span id="gendermsg" name=""></span> -->
	
	<label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<select id="phone1" name="phone" style="width: 62px; height: 29.99px;" required>
		<option value="010">010</option>	
		<option value="011">011</option>	
		<option value="02">02</option>	
		<option value="070">070</option>
<!-- 		<option value="none" selected="selected">없음</option>	 -->
	</select>
	-&nbsp;<input id="phone2" name="phone" style="width: 61px; height: 29.99px;">
	-&nbsp;<input id="phone3" name="phone" style="width: 62px; height: 29.99px;">
	<span id="phonemsg"></span><br>

<!-- <label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label> -->
<!-- <input type="text" name="phone" id="phone" required="required" placeholder=" '-' 를 포함해 입력해주세요" -->
<!--  style="width: 212px; border: 1px solid black;"> -->
<!-- <span id="phoneCheck" name="phoneCheck"></span><br> -->

<!-- 각각 받아온 걸 같은 컬럼에 저장하려면 java코드로 따로 합성해서 사용하기 -->

	
	
	<label>주소</label>
	<input type="text" id="addr" name="addr"><br>
	
	<label>이메일</label>
	<input type="email" id="email" name="email" placeholder="example@gmail.com"><br><br>
	
	<button id="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
	<button type="reset" id="btnCancel">취소</button>
<!-- 	<input type="reset" id="cancel" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소" style=" border: 1px solid black;"> -->
<!-- 	<a style="color: red; border: 1px solid black; padding: 5px;" onclick="history.go(-1)">취소</a> -->
<!-- 	<a style="color: red;"><button class="btn btn-outline-danger" onclick="history.go(-1)">취소</button></a> -->
<!-- 	<input style="color: red;" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소"> -->
</form>
</div>


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />