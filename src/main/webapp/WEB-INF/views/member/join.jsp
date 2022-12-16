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
	$("#id_check").click(function() {
		$(location).attr("href", "/member/id")
	})
	
})
$(document).ready(function() {			/* 유효성 검증 */
	
	$("form").submit(function() {
		console.log("<form> submit event")
		
// 		//유효성 검증 후 submit하기
// 		if( validate() ) {
// 			$(this).submit()
// 		}
// 		return false //submit 중단 시키기

		return validate();
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
	$("#phone4").focus(function() {
		$("#phonemsg").html('')
	})

	
	//-----------------------------------
	
	//아이디 중복검사
	var id_check_btn = 0; //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	
	$('#id_check_btn').click( function(){
		console.log("id 중복검사 테스트");	
		
		var id = $('.id').val();// .id에 입력되는 값
		var data = {id : id}	// '컨트롤러에 넘길 데이터 이름' : '데이터(.id에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/id2",
			data : data,
			dataType : "json",
			sucesss : function(result){
				if(result == 0) {
					$("#idmsg").html('사용 불가능한 아이디입니다. 다시 시도해주세요');
					$("#idmsg").attr('color','red');
					alert('사용 불가능한 아이디입니다. 다시 시도해주세요')
				} else {
					$("#idmsg").html('사용 가능한 아이디입니다.');
					$("#idmsg").attr('color','green');
					alert('사용 가능한 아이디입니다.')
				} 
			},
			error : function(){
				alert("서버요청이 실패하였습니다");
			} 
		}); //ajax end
	
	}) //id 중복검사 end
	
// 	if(confirm("회원가입을 하시겠습니까?")){
//  if(id_check_btn==0){
//      alert('아이디 중복체크를 해주세요');
//      return false;
//  }else{
//      alert("회원가입을 축하합니다");
//// 	        $("form").submit();
//  }
//} //회원가입 버튼에 TYPE을 submit에서 button으로 바꿔주고 
//	form 에 name="" id=""을 추가
	
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
	// 전화번호 입력값 검증1 [000]-[0000]-[0000]
	if( !/^[0-9]{4}$/.test( $("#phone2").val() )  ) {
		$("#phonemsg").html("#phone2 전화번호는 각각 숫자 4자리만 가능합니다")	
		return false
	}
	if( !/^[0-9]{4}$/.test( $("#phone3").val() )  ) {
		$("#phonemsg").html("#phone3 전화번호는 각각 숫자 4자리만 가능합니다")	
		return false
	}

	// 전화번호 입력값 검증2 [000-0000-0000]  /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/
// 	if( !/01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/.test( $("#phone4").val() )  ) {
// 		$("#phonemsg").html("#phone4 전화번호는 01?-???(?)-???? 형식만 가능합니다")	
// 		return false
// 	}  

	
	
	
	//--------------------
	return true
}

</script>

<!-- 다음카카오 주소 API, https://postcode.map.daum.net/guide -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addre = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addre = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addre = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
//                 document.getElementById("sample6_extraAddress").value = extraAddr; **구글링으로삭제한코드
            	
                //주소변수 문자열과 참고항목(동) 문자열 합치기 **구글링으로추가한코드
                addre += extraAddr;
                
            } else {
//                 document.getElementById("sample6_extraAddress").value = ''; **구글링으로삭제한코드
           		addre += ' '; //**구글링으로추가한코드
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
//             document.getElementById('sample6_postcode').value = data.zonecode; **구글링으로삭제한코드
//             document.getElementById("sample6_address").value = addr; **구글링으로삭제한코드
	        // **구글링으로추가한코드
            $(".address_input_1").val(data.zonecode);
            $(".address_input_2").val(addre);
            
            // 커서를 상세주소 필드로 이동한다.
//             document.getElementById("sample6_detailAddress").focus(); **구글링으로삭제한코드

            // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
            $(".address_input_3").attr("readonly",false); //**구글링으로추가한코드
            $(".address_input_3").focus(); // **구글링으로추가한코드
        }
    }).open();
}
//https://kimvampa.tistory.com/110

</script>
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
span { margin-left: 10px; font-weight: bolder; color: red;  }
input {
	margin-bottom: 7px;
	width: 300px;
}
#btn { font-size: 1.2em;  }
</style>

<br><h4>회원 가입 페이지</h4>
<hr>

<div id="join">
<form action="<%=request.getContextPath() %>./join" method="post" onsubmit="return validate();">  

	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" class="id" id="id" name="id" required placeholder=" 4~10의 영문자, 숫자만 입력해주세요">
	<button type="button" id="id_check_btn">중복검사</button>
	<span id="idmsg"></span><br>
	
	
	<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw" name="pw" required placeholder=" 4~8의 영문자, 숫자만 입력해주세요">
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
	<input type="radio" name="gender" value="man" checked="checked" style="width: 50px; margin: 0px -20px -20px;">&nbsp;남자
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" name="gender" value="woman" required style="width: 50px; margin: 0px -20px -20px;">&nbsp;여자<br>
<!-- 	<span id="gendermsg" name=""></span> -->
	
	<label>전화번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<select id="phone1" name="phone" style="width: 75px; height: 29.99px;" required>
		<option value="010">010</option>	
		<option value="011">011</option>	
		<option value="02">02</option>	
		<option value="070">070</option>
<!-- 		<option value="none" selected="selected">없음</option> -->	
	</select>
	-&nbsp;<input id="phone2" name="phone" style="width: 97px; height: 29.99px;">
	-&nbsp;<input id="phone3" name="phone" style="width: 97px; height: 29.99px;">
<!-- 	<button type="button">인증하기</button> -->
	<span id="phonemsg"></span><br>

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
		<button type="reset" id="btnCancel">취소</button></div>
</form>
</div><!-- join end -->


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />