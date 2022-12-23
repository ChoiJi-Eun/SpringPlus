<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
#deleteComp {
	text-align: center;
	margin-top: 50px;
}


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


})

</script>

<br><h4>마이페이지 - 회원 탈퇴 완료 
<button type="button" id="btnCancel">멤버메인페이지</button>
<button type="button" id="btnLogin">로그인</button>
<button type="button" id="btnLogout">로그아웃</button>
</h4>
<hr>
 
<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<div id="delete">


	<div id="deleteComp">
		<h3>탈퇴가 완료되었습니다</h3>
	</div>


</div><!-- #delete end -->

</c:if>

<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />