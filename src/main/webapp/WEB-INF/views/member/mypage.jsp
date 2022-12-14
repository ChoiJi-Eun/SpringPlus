<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />
<!-- <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="../resources/eye-solid.svg"> -->

<style type="text/css">
#mypage {
	margin-left: 170px; 
	font-size: 1.2em;
}
#mypage label { 
/* 	display: inline-block; */
	width: 122px;
	
}
#btnUpdate { margin-left: 130px; }
img { width: 15px; height: 15px; margin-bottom: 7px; }
input {
	margin-bottom: 7px;
	width: 300px;
}
#btn { font-size: 1.2em;  }
#addr { margin-left: 5px; }
</style>
<script type="text/javascript">
$(document).ready(function() {			/* 페이지 이동 */
	$("#btnLogout").click(function() {
		$(location).attr("href", "/member/logout")
	})
	$("#btnCancel").click(function() {
		$(location).attr("href", "../member/main?id=${id}")
	})
	$("#btnLogin").click(function() {
		$(location).attr("href", "/member/login")
	})
	$("#btnMain").click(function() {
		$(location).attr("href", "/member/main?id=${id}")
	})
	$("#btnDelete").click(function() {
		$(location).attr("href", "/member/delete?id=${id}")
	})

})
$(document).ready(function() {			/* 유효성 검증 */
	
	/* 비밀번호 눈 img */
    $('.pass img').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });	
    
	/* 가져온 성별 데이터 radio로 체크표시 */
	$("#" + "${m.gender }").prop("checked", true)
	
	/* phone[] */
	$("#phone1").val( '${m.phone}'.split(",")[0] )  
	$("#phone2").val( '${m.phone}'.split(",")[1] )
	$("#phone3").val( '${m.phone}'.split(",")[2] )
  
	
	
})
	
</script>

<%-- 비로그인 상태 --%>
<c:if test="${empty isLogin }">
	<br><h4>마이페이지  
	<button type="button" id="btnMain">멤버메인페이지</button>
	<button type="button" id="btnLogin">로그인</button>
	</h4>
	<hr>
</c:if>
 
<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">
	<br><h4>마이페이지 
	<button type="button" id="btnMain">멤버메인페이지</button>
	<button type="button" id="btnLogout">로그아웃</button>
	</h4>
	<hr>
	
	
<div id="mypage">
<form action="<%=request.getContextPath() %>./mypage" method="post">  

	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" class="id" id="id" name="id" required value="${id }"><br>
	
	
	<div class="input password">
		<div class="pass">
			<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
			<input type="password" id="pw" name="pw" required value="${pw }">
			<img alt="eyes" src="../resources/eye-solid.svg" class="fa fa-eye fa-lg"><br>
		</div>
	</div>
	

	<label>닉네임<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="nick" name="nick" required value="${nick }"><br>
	
	
	<label>이름<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="name" name="name" required value="${m.name }"><br>
	
	
	<label>성별</label>
<%-- 	<input type="text" id="gender" name="gender" value="${m.gender }" required > --%>
	
	<input type="radio" name="gender" id="man" style="width: 50px; margin: 0px -20px -20px;">&nbsp;남자
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" id="woman" style="width: 50px; margin: 0px -20px -20px;">&nbsp;여자<br>
	
	
	<label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
		   <input id="phone1" name="phone" style="width: 90px; height: 29.99px;">
	-&nbsp;<input id="phone2" name="phone" style="width: 90px; height: 29.99px;">
	-&nbsp;<input id="phone3" name="phone" style="width: 90px; height: 29.99px;"><br>

	
	<label style="float: left;">주소</label>
	<textarea id="addr" name="addr" style="width: 300px; height:80px;">${m.addr }</textarea><br>
	
	
	<label style="text-align: justify;">이메일</label>
	<input type="email" id="email" name="email" placeholder="example@gmail.com" value="${m.email }"><br><br>
	
	
	<div id="btn">
<!-- 		<button type="button" id="btnUpdate">수정</button>&nbsp;&nbsp;&nbsp; -->
		<button type="button" id="btnCancel">취소</button>&nbsp;&nbsp;&nbsp;
		<button type="button" id="btnDelete">회원탈퇴</button>
	</div><!-- #btn end -->
		
</form>
</div><!-- #mypage end -->

</c:if>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />