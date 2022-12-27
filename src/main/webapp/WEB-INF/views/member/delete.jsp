<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
* {  
	font-size: 1.05em;  
}
table {  
	margin-left: 250px; 
}
#pw { width: 120px; }
/* #btn { margin-left: 370px;  } */
img { width: 25px; height: 25px; margin-bottom: 7px; }
</style>
<script type="text/javascript">
$(document).ready(function() {			/* 페이지 이동 */
// 	$("#btnUpdate").click(function() {
// 		$(location).attr("href", "/member/update")
// 	})
	$("#btnCancel").click(function() {
		$(location).attr("href", "/member/main")
	})
	$("#btnLogin").click(function() {
		$(location).attr("href", "/member/login")
	})
	$("#btnDelete").click(function() {
		$(location).attr("href", "/member/delete")
	})
	$("#btnLogout").click(function() {
		$(location).attr("href", "/member/logout")
	})

	
	/* 비밀번호 눈 img */
    $('.pwEye img').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });


	/* 탈퇴버튼 클릭시 탈퇴 진행 https://prettywho.tistory.com/51   */
    $("#btnDelete").click(function(){

        // 확인 대화상자 
        if(confirm("삭제하시겠습니까?")){

//             document.deleteform.action = "memberDeleteProc";
//             document.deleteform.submit();
//         	$("#btnDelete").submit();
//         	$(location).attr("href", "/member/main")

        	if(){
    	     	alert('비밀번호가 틀렸습니다.');
    	     	return false;
        } else {
        	alert("탈퇴되었습니다.")
        	$("#btnDelete").submit();
        }
        return true
    });
})

</script>

<%-- 비로그인 상태 --%>
<c:if test="${empty isLogin }">
	<br><h4>회원 탈퇴  
	<button type="button" id="btnCancel">멤버메인페이지</button>
	<button type="button" id="btnLogin">로그인</button>
	</h4>
	<hr>
</c:if>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<br><h4>회원 탈퇴
<button type="button" id="btnCancel">멤버메인페이지</button>
<button type="button" id="btnLogout">로그아웃</button>
</h4>
<hr>
 

<div id="delete">

    <form name="deleteform" method="post" action="./delete" >
 
        <table>
            <tr>
                <td id="pw">비밀번호</td>

                <td class="pwEye">
                	<input type="password" name="pwd" maxlength="50">
                	<img alt="eyes" src="../resources/eye-solid.svg" class="fa fa-eye fa-lg">
                </td>
            </tr>
        </table>


        <br> 
        <input id="btnCancel" type="button" value="취소" style="margin-left: 370px;">
		&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="btnDelete" type="submit" value="탈퇴" /> 

    </form>



</div><!-- #delete end -->

</c:if>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />