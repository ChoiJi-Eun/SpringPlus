<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
* {  
	font-size: 1.05em;  
}
label {  	margin-left: 290px;  }
/* #pw { width: 120px; } */
#pwmsg { color: red;  }
img { width: 23px; height: 23px; margin-bottom: 7px; }
</style>
<script type="text/javascript">
$(document).ready(function() {			/* 페이지 이동 */
// 	$("#btnUpdate").click(function() {
// 		$(location).attr("href", "/member/update")
// 	})
	$("#btnMain").click(function() {
		$(location).attr("href", "/member/main?id=${id}")
	})
	$("#btnCancel1").click(function() {
		$(location).attr("href", "/member/main?id=${id}")
	})
	$("#btnLogin").click(function() {
		$(location).attr("href", "/member/login?id=${id}")
	})
// 	$("#btnDelete").click(function() {
// 		$(location).attr("href", "/member/delete")
// 	})
	$("#btnLogout").click(function() {
		$(location).attr("href", "/member/logout")
	})
})
$(document).ready(function() {			/* 유효성 검증 */

	/* 비밀번호 눈 img */
    $('.pass img').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        } else {
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });	


	/* 탈퇴버튼 클릭시 탈퇴 진행 https://prettywho.tistory.com/51   */
<%--    $("#btnDelete").click(function(){

        // pwchk
        if(confirm("삭제하시겠습니까?")){
    		console.log("pw 중복검사 테스트");	
    		
    		var pw = $('#pw').val();// .id에 입력되는 값
    		console.log("입력한 pw값 : " + pw);
    		
    		$.ajax({
    			type : "post",
    			url : "/member/mypage/delete",
    			data : {pw : pw},
    			dataType : "json",
    			success : function( result ){
    				
    				if(result == 0) { // 1=>이미있는pw, 0=>없는pw(사용가능)
    					$("#pwmsg").html('다시 시도해주세요');
    				} else {
    					alert("탈퇴되었습니다.")
    					$("#btnDelete").submit();
    				}
    			},
    			error : function(){
    				alert("서버요청이 실패하였습니다");
    			}
    		}); //ajax end 
    	}); //pwchk end
    	return true //pwchk 검증 완료
    	
    }); //btnDelete end
 --%>    
})

</script>

<%-- 비로그인 상태 --%>
<c:if test="${empty isLogin }">
	<br><h4>회원 탈퇴  
	<button type="button" id="btnMain">멤버메인페이지</button>
	<button type="button" id="btnLogin">로그인</button>
	</h4>
	<hr>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<br><h4>회원 탈퇴
<button type="button" id="btnMain">멤버메인페이지</button>
<button type="button" id="btnLogout">로그아웃</button>
</h4>
<hr>
 

<div id="delete">

    <form name="deleteform" method="post" action="./delete" >
 
    <div class="input password">
		<div class="pass">
			<label>비밀번호</label>
			<input type="password" id="pw"  name="pwd" maxlength="50">
			<img alt="eyes" src="../resources/eye-solid.svg" class="fa fa-eye fa-lg" ><br>
		</div>
	</div>
	
    <br> 

	<div id="btn">
        <input id="btnCancel1" type="button" value="취소" style="margin-left: 370px;">
		&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="btnDelete" type="button" value="탈퇴" /> 
	</div><!-- #btn end -->
	
    </form>

</div><!-- #delete end -->
</c:if>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />