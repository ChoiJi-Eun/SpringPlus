<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- 스마트 에디터2 라이브러리 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		updateContents() //작성한 내용 적용시키기
		$("form").submit();
	})

	
})
function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>

<div class="container">
<br><h4>게시글 쓰기</h4><br>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<form action="./write" method="post" enctype="multipart/form-data">

<table class="table t table-condensed"> 

<tr><td style="width: 20%; text-align: center;">작성자 아이디</td>
	<td style="width: 80%"><input type="text" id="id" value="${id }" style="width: 400px;" readonly="readonly"><span style="color: red; font-size: 0.8em;">&nbsp;&nbsp;* 수정 불가</span></td></tr>

<tr><td style="width: 20%; text-align: center;">작성자 닉네임</td>
	<td style="width: 80%"><input type="text" id="writer" value="${nick }" style="width: 400px;" readonly="readonly"><span style="color: red; font-size: 0.8em;">&nbsp;&nbsp;* 수정 불가</span></td></tr>

	
<tr><td style="width: 20%; text-align: center;">제목</td>
	<td style="width: 80%"><input type="text" id="title" name="title" style="width: 600px;"></td></tr>
	
<tr><td style="width: 20%; text-align: center;">본문</td>
	<td style="width: 80%"><textarea id="content" name="content" style="width: 600px;" rows="5"></textarea></td></tr>

<tr><td style="width: 20%; text-align: center;">첨부파일</td>
	<td style="width: 80%"><input type="file" name="file"></td></tr>
</table>

<div class="btnSaveCancel" style=" text-align: center; height: 100px;">
	<button type="button" class="btn btn-info" id="btnWrite">저장</button>&nbsp;&nbsp;
	<input type="reset" id="cancel" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소">
<!-- 	<a style="color: red;"><button type="button" class="btn btn-outline-danger" onclick="history.go(-1)">취소</button></a> -->
</div>
</form>
</c:if>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>


</div><!-- .container -->

<c:import url="../layout/footer.jsp" />