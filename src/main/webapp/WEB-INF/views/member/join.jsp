<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
      
    <%-- JSTL 태그 활성화 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {			/* 페이지 이동 */
	$("#btnMain").click(function() {
		$(location).attr("href", "./main")
	})
	$("#btnCancel").click(function() {
		$(location).attr("href", "/member/main?id=${id}")
	})
	$("#id_check").click(function() {
		$(location).attr("href", "/member/id")
	})
	
})
$(document).ready(function() {			/* 유효성 검증 */
	
	$("form").submit(function() {
		console.log("<form> submit event")

		validate();
		
		alert("회원가입을 축하합니다!!");
		
		return true //submit 실행 시키기
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
	
	$("#nick").focus(function() {
		$("#nickmsg").html('')
	})
	//---------------------------------

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
})
function validate() {
	if( !validateID( $("#id").val() ) ) { //id 유효성 검증 실패
		return false //submit 중단
	}
	if(!validatePW( $("#pw").val() )) {   //pw 유효성 검증 실패
		return false //submit 중단
	}	
	if(!validatePhone(  )) {   //phone 유효성 검증 실패
		return false //submit 중단
	}	
	if(!validateNick( $("#nick").val() )) {   //nick 유효성 검증 실패
		return false //submit 중단
	}	
	//-----------------------------------
	<%--	//아이디 중복검사를 했는지 안했는지 확인 	
	if( $('#id_check_btn') == 0 ) {
		$("#idmsg").html("아이디 중복검사를 해주세요!")
		return false //submit 중단
	}
	//닉네임 중복검사를 했는지 안했는지 확인
	if( $('#nick_check_btn') == 0 ) {
		$("#nickmsg").html("닉네임 중복검사를 해주세요!")
		return false	
	}
	//아이디 중복검사+닉네임 중복검사를 했는지 안했는지 확인
	if(id_check_btn==0 || nick_check_btn==0){
     	alert('아이디와 닉네임 중복체크를 해주세요');
		$("#idmsg").html("아이디 중복검사를 해주세요!")
		$("#nickmsg").html("닉네임 중복검사를 해주세요!")
   		return false;
	} --%>
	
	if($("input[name='checked_id']").val()==''){
		alert('아이디 중복 확인을 해주세요!!'); 
		return false;
	}
	if($("input[name='checked_nick']").val()==''){
		alert('닉네임 중복 확인을 해주세요!!');
		return false;
	}	

	//-----------------------------------
	return true
}
<%-- https://sir.kr/qa/322058  --%>
<%-- https://okky.kr/articles/371837  --%>
<%-- https://books.google.co.kr/books?id=5KfJDwAAQBAJ&pg=PA144&lpg=PA144&dq=%EC%95%84%EC%9D%B4%EB%94%94+%EC%A4%91%EB%B3%B5%EC%B2%B4%ED%81%AC+%ED%96%88%EB%8A%94%EC%A7%80+%ED%99%95%EC%9D%B8&source=bl&ots=in7ed4ve6F&sig=ACfU3U2RHj8tadwCQeXRmG06S_D4U8qp3g&hl=ko&sa=X&ved=2ahUKEwit1q7OqZz8AhUAgVYBHQFeBS84HhDoAXoECBcQAw#v=onepage&q=%EC%95%84%EC%9D%B4%EB%94%94%20%EC%A4%91%EB%B3%B5%EC%B2%B4%ED%81%AC%20%ED%96%88%EB%8A%94%EC%A7%80%20%ED%99%95%EC%9D%B8&f=false --%>
<%--   --%>
<%-- 아이디 중복 alert 나온뒤 검사해도 계속 가입진행 안되는데??(닉네임은 아얘 안되고) --%>
$(function(){   
    $("#submit").click(function(){
    	
    	$("#id_check_btn").click(function(){
    		$("input[name=checked_id]").val("y")
    	})
    	$("#nick_check_btn").click(function(){
    		$("input[name=checked_nick]").val("y")
    	})

    });  
});
//input 데이터 유효성 검증하기
function validateID( id ) {
	//-----아이디 유효성 검증
	// 아이디를 입력했는지 검증
// 	if( $("#id").val() == '' ) {
	if( id == '' ) {
		$("#idmsg").html("아이디를 입력해주세요!")
// 		return false
	}
	// 아이디 입력값 검증
// 	if( !/^[a-zA-Z0-9]{4,10}$/.test( $("#id").val() )  ) {
// 	if( !/^[a-zA-Z0-9]{4,10}$/.test( id )  ) {
// 		$("#idmsg").html("아이디는 4~10의 영문자, 숫자만 가능합니다.")	
// // 		return false
// 	}

	//아이디 중복검사
	var id_check_btn = 0; //아이디 체크 여부 확인용 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	
	$('#id_check_btn').click( function(){
		
		//------------------------------
		console.log("id 중복검사 테스트");	
		var id = $('#id').val();// .id에 입력되는 값
// 		var data = {id : id}	// '컨트롤러에 넘길 데이터 이름' : '데이터(.id에 입력되는 값)'
		console.log("입력한 id값 : " + id);
		
		$.ajax({
			type : "post",
			url : "/member/id",
			data : {id : id},
			dataType : "json",
			success : function( result ){
				
				if(result > 0) { // 1=>이미있는아이디, 0=>없는아이디(사용가능)
					$("#idmsg").html('사용 불가능한 아이디입니다. 다시 시도해주세요');
					$("submit").attr("disabled", "disabled");
				} else {
					if( !/^[a-zA-Z0-9]{4,10}$/.test( id )  ) {
						$("#idmsg").html("아이디는 4~10의 영문자, 숫자만 가능합니다.")	
						return false
					}
					$("#idmsg").html('사용 가능한 아이디입니다.');
					$("#idmsg").attr('color','blue'); //작동안함
					$("submit").removerAttr("disabled");
				} 
			},
			error : function(){
				alert("서버요청이 실패하였습니다");
			} 
		}); //ajax end
	}) //id 중복검사 end
	//-----------------------------
	return true // id 유효성 검증 완료
}	
function validatePW( pw ) {	
	//-----패스워드 유효성 검증
	// 패스워드를 입력했는지 검증
	if(pw == '' ) {
		$("#pwmsg").html("패스워드를 입력해주세요!")
		return false
	}
	// 패스워드 입력값 검증
	if( !/^[a-zA-Z0-9]{4,8}$/.test( pw )  ) {
		$("#pwmsg").html("패스워드는 4~8의 영문자, 숫자만 가능합니다.")	
		return false
	}
	// 패스워드체크 입력값과 패스워드 입력값 같은지 검증
	if(  pw != $("#pw_check").val()   ) {
		$("#pw_check_msg").html("패스워드가 일치하지 않습니다. 다시 시도해주세요")	
// 		return false
	}
	//--------------------
	return true // pw 유효성 검증 완료
}
function validatePhone(  ) {
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
	return true // phone 유효성 검증 완료	
}
function validateNick( nick ) {
	console.log("nick checkbtn")
	//-----닉네임 유효성 검증	
	//닉네임  입력값 검증
	if( nick == '' ) {
		$("#nickmsg").html("닉네임을 입력해주세요!")
// 		return false	
	}
	// 닉네임 입력값 검증
// 	if( !/^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{3,10}$/.test( nick )  ) {
// 		$("#nickmsg").html("닉네임은 3~10의 모든 문자가 가능합니다.")	
// 		return false
// 	}
	//닉네임 중복검사
	var nick_check_btn = 0; //아이디 체크 여부 확인용 (닉네임 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
	
	$('#nick_check_btn').click( function(){
		
		//------------------------------
		console.log("nick 중복검사 테스트");	
		var nick = $('#nick').val();// nick에 입력되는 값
		console.log("입력한 nick값 : " + nick);
		
		$.ajax({
			type : "post",
			url : "/member/nick",
			data : {nick : nick},
			dataType : "json",
			success : function( result ){
				
				if(result > 0) { // 1이상=>이미있는아이디, 0=>없는아이디(사용가능)
					$("#nickmsg").html('사용 불가능한 닉네임 입니다. 다시 시도해주세요');
					$("#nickmsg").attr('color','red');
					$("submit").attr("disabled", "disabled");
				} else {
					if( !/^[가-힣a-zA-Z0-9]{3,10}$/.test( nick )  ) {
						$("#nickmsg").html("닉네임은 3~10의 모든 문자가 가능합니다.(특수문자 제외)")	
						return false
					}
					$("#nickmsg").html('사용 가능한 닉네임 입니다.');
					$("#nickmsg").attr('color','blue');
					$("submit").removerAttr("disabled");
				} 
			},
			error : function(){
				alert("서버요청이 실패하였습니다");
			} 
		}); //ajax end
	}) //nick 중복검사 end
	
	//--------------------
	return true // nick 유효성 검증 완료	
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
span { margin-left: 10px; font-weight: bolder;   }
[id*="msg"] { color: red;  }   
input {
	margin-bottom: 7px;
	width: 300px;
}
#btn { font-size: 1.2em;  }
</style>

<br><h4>회원 가입 페이지
<button type="button" id="btnMain">멤버메인페이지</button></h4>
<hr>

<div id="join">
<form action="<%=request.getContextPath() %>./join" method="post">  
<%-- <form action="<%=request.getContextPath() %>./join" method="post" onsubmit="return validate();">   --%>

	<label>아이디<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" class="id" id="id" name="id" required placeholder=" 4~10의 영문자, 숫자만 입력해주세요">
	<button type="button" id="id_check_btn" onclick="validateID(id)">중복검사</button> 
	<span id="idmsg"></span><br>
	<input type="hidden" name="checked_id" value="">
	
	
	<div class="input password">
		<div class="pass">
			<label>비밀번호<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
			<input type="password" id="pw" name="pw" required placeholder=" 4~8의 영문자, 숫자만 입력해주세요">
			<img alt="eyes" src="<%=request.getContextPath() %>../resources/eye-solid.svg" class="fa fa-eye fa-lg">
			<span id="pwmsg"></span><br>
		</div>
	</div>
	
	
	<label>비밀번호 확인<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="password" id="pw_check" name="pw_check" required>
	<span id="pw_check_msg"></span><br>
	
	
	<label>닉네임<img class="mustimg" alt="필수" src="../resources/mustimg.png"></label>
	<input type="text" id="nick" name="nick" required placeholder=" 3~10의 모든 문자를 입력해주세요">
	<button type="button" id="nick_check_btn" onclick="validateNick(nick)">중복검사</button> 
	<span id="nickmsg"></span><br>
	<input type="hidden" name="checked_nick" value="">
	
	
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
		<button type="button" id="submit">회원가입</button>&nbsp;&nbsp;&nbsp;
		<button type="button" id="btnCancel">취소</button>
	</div><!-- #btn end -->
	
</form>
</div><!-- #join end -->


<div class="clearfix" style=" text-align: center; height: 100px;" ></div>

<c:import url="../layout/footer.jsp" />