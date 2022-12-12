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
	$("#list").click(function() {
		$(location).attr("href", "/board/list")
	})
	$("#btnUpdate").click(function() {
		updateContents() //작성한 내용 적용시키기
		$("form").submit();
// 		$(location).attr("href", "/board/view?boardNo=${boardlist.boardNo }")
	})
	if( ${empty boardFile } ) {
		$("#newFileName").show()  //기존첨부파일이 없다면 새로운첨부파일 보이게
	} else {
		$("#originFileName").show() //첨부파일이 있다면 새로운첨부파일 안보이게
	}
	
	$("#deleteFile").click(function() {
		$("#newFileName").toggle()
// 		$("#newFileName").show()
// 		showRow()
		$("#originFileName").toggleClass("through")
	})

// 	if( ${empty boardFile.originName } ) {  /* 삭제취소를 하고나서 newFileName 안없어짐,,-그래도 수정은 됨 */
// 		showRow() //기존첨부파일이 없다면 새로운첨부파일 보이게
// 	} 
// 	if( ${not empty boardFile.originName } ) { //기존첨부파일이 있을 때
// 			hideRow() //첨부파일이 있다면 새로운첨부파일 안보이게

// 			$("#deleteFile").click(function() {
// 				$("#newFile").toggle()
// 				$("#originFileName").toggleClass("through") /* originFileName 요소에 through 클래스가 없으면 추가하고, 있으면 제거 */

// 			})
// //				$("#deleteFile").dbclick(function() {
// //					hideRow() //첨부파일이 있다면 새로운첨부파일 안보이게
// //				})
// 	}	


})
function hideRow()  {
  const row = document.getElementById('newFileName');
  row.style.display = 'none';
}
function showRow()  {
  const row = document.getElementById('newFileName');
  row.style.display = '';
}
function updateContents() {
	//스마트 에디터에 작성된 내용을 #content에 반영한다
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>
<style type="text/css">
.through {
	text-decoration: line-through; /* 글자 중간에 줄이 그어짐 */
}
#deleteFile {
	color: red;
	cursor: pointer; /* 마우스 포인트시 모양바뀜 */
}
/* #newFileName { display: none; }  */
#originFileName, #newFileName { 
	display: none;  } 
</style>
<div class="container">
<br><h4>게시글 수정하기</h4><br>

<%-- 로그인 상태 --%>
<c:if test="${not empty isLogin }">

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="boardNo" value="${view.boardNo }">

<table class="table t table-condensed"> 

<!-- <tr><td style="width: 20%; text-align: center;">boardNo</td> -->
<%-- 	<td style="width: 80%;"><input type="text" id="boardNo" value="${view.boardNo }" style="width: 400px;" readonly="readonly"><span style="color: red; font-size: 0.8em;">&nbsp;&nbsp;* 수정 불가</span></td></tr> --%>

<tr><td style="width: 20%; text-align: center;">작성자 아이디</td>
<%-- 	<td style="width: 80%;"><input type="text" id="id" value="${id }" style="width: 400px;" readonly="readonly"><span style="color: red; font-size: 0.8em;">&nbsp;&nbsp;* 수정 불가</span></td></tr> --%>
	<td style="width: 80%;"><span style="font-size: 1em; font-weight: 600;">${id }</span></td></tr>

<tr><td style="width: 20%; text-align: center;">작성자 닉네임</td>
<%-- 	<td style="width: 80%"><input type="text" id="writer" value="${nick }" style="width: 400px;" readonly="readonly"><span style="color: red; font-size: 0.8em;">&nbsp;&nbsp;* 수정 불가</span></td></tr> --%>
	<td style="width: 80%"><span style="font-size: 1em; font-weight: 600;">${nick }</span></td></tr>

	
<tr><td style="width: 20%; text-align: center;">제목</td>
	<td style="width: 80%"><input type="text" id="title" name="title" value="${view.title }" style="width: 600px;"></td></tr>
	
<tr><td style="width: 20%; text-align: center;">본문</td>
	<td style="width: 80%"><textarea id="content" name="content" style="width: 600px;" rows="5">${view.content }</textarea></td></tr>



<!-- <div id="originFileName"></div> -->
	<tr><td style="width: 20%; text-align: center;">첨부파일</td>
<%-- 	<td style="width: 80%" id="originFileName">${boardFile.originName }<input type="text" id="deleteFile" value="삭제"></td></tr> --%>
<%-- 	<td style="width: 80%" id="originFileName">${boardFile.originName }<span id="deleteFile" dbclick="hideRow();">&nbsp;&nbsp;삭제</span></td></tr> --%>
	<td style="width: 80%" id="originFileName">${boardFile.originName }<span id="deleteFile">&nbsp;&nbsp;삭제</span></td></tr>
<%-- 	<td style="width: 80%" id="originFileName">${boardFile.originName }&nbsp;&nbsp;<button id="reRoad" dbclick="hideRow();">삭제</button></td></tr> --%>
<!-- 	<input type="text" id="deleteFile" value="삭제"> -->
	
<!-- <div id="newFileName"></div> -->
	<tr><td style="width: 20%; text-align: center;">첨부파일 추가</td>
	<td style="width: 80%"><input type="file" name="file" id="newFileName"></td></tr>


</table>

<div class="btnSaveCancel" style=" text-align: center; height: 100px;">
	<button type="button" class="btn btn-info" id="btnUpdate">저장</button>&nbsp;&nbsp;
	<input type="reset" id="cancel" class="btn btn-outline-danger" onclick="history.go(-1)" value="취소(상세페이지)">&nbsp;&nbsp;
	<input type="reset" id="list" class="btn btn-outline-danger" value="목록">
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