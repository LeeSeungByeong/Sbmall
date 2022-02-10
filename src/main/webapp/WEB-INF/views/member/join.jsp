<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Pricing example · Bootstrap v4.6</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- 
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Pricing</h1>
  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
</div>
 -->
<div class="container">
  
  <!-- 회원가입 폼 작업 -->
  <h3>회원가입 폼</h3>
  <form action="/member/join" method="post" id="joinForm">
  <div class="form-row">
    <div class="col-md-10">
	    <label for="mbsp_id">아이디</label>
	    <input type="text" class="form-control" id="mbsp_id" name="mbsp_id">
	</div>
	<div class="col-md-2">
		<label id="idUseState">&nbsp;</label>
	    <button type="button" class="form-control" id="btnUseIDChk">중복체크</button>
    </div>
  </div>
  <div class="form-group">
    <label for="mbsp_password">비밀번호</label>
    <input type="password" class="form-control" id="mbsp_password" name="mbsp_password">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">비밀번호 확인</label>
    <input type="text" class="form-control" id="exampleInputEmail1">
  </div>
  <div class="form-group">
    <label for="mbsp_name">이름</label>
    <input type="text" class="form-control" id="mbsp_name" name="mbsp_name">
  </div>
  <div class="form-row">
    <div class="col-md-6">
	    <label for="mbsp_email">전자우편</label>
	    <input type="text" class="form-control" id="mbsp_email" name="mbsp_email">
	</div>
	<div class="col-md-2">
		<label for="btnMailAuthReq">메일확인바랍니다.</label>
	    <button type="button" class="form-control" id="btnMailAuthReq">메일인증요청</button>
    </div>
    <div class="col-md-2">
	    <label for="auth_mail">메일인증코드입력</label>
	    <input type="text" class="form-control" id="auth_mail" name="auth_mail">
	</div>
	<div class="col-md-2">
		<label id="authMailState">&nbsp;</label>
	    <button type="button" class="form-control" id="btnMailAuthConfirm">메일인증확인</button>
    </div>
  </div>
 
   <div class="form-row">
    <div class="col-md-4">
      <label for="mbsp_addr">기본주소</label>
      <input type="text" class="form-control" id="mbsp_addr" name="mbsp_addr">
    </div>
    <div class="col-md-4">
      <label for="mbsp_deaddr">나머지주소</label>
      <input type="text" class="form-control" id="mbsp_deaddr" name="mbsp_deaddr">
      <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
    </div>
    <div class="col-md-2">
      <label for="mbsp_zipcode">우편번호</label>
      <input type="text" class="form-control" id="mbsp_zipcode" name="mbsp_zipcode">
    </div>
    <div class="col-md-2">
      <label for="btnPostCode">&nbsp;</label>
      <input type="button" class="form-control" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()">
    </div>
   </div>
   
   <div class="form-group">
    <label for="mbsp_phone">전화번호</label>
    <input type="text" class="form-control" id="mbsp_phone" name="mbsp_phone">
  </div>

  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="mbsp_receive" name="mbsp_receive" value="Y">
    <label class="form-check-label" for="mbsp_receive">메일수신여부</label>
  </div>
  <button type="submit" id="btnJoin" class="btn btn-primary">회원가입</button>
</form>
  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

  $(document).ready(function(){

    //아이디중복체크 
    let isCheckID = false;

    //메일인증확인체크
    let isMailAuthConfirm = false;
    //폼에서 전송버튼<input type="submit">을 클릭하면 호출되는 이벤트설정
    $("#joinForm").on("submit", function(){
      //alert("호출");
      
      console.log("아이디중복체크? " + isCheckID)

      if(isCheckID == false){
        alert("아이디 중복체크 확인바람");
        $("#mbsp_id").focus();
        return false;
      }

      if(isMailAuthConfirm == false){
        alert("메일인증요청 확인바람");
        $("#btnMailAuthReq").focus();
        return false;
      }
 
      // 전송이 이루어진다.
    });

    //폼에서 일반버튼<input type="button">을 클릭하면 호출되는 이벤트설정
    /*
    $("#btnJoin").on("click", function(){
      alert("버튼 클릭됨");
      return;

      //로직이 틀리면 nothing
      
      //로직이 맞으면 전송가능
      $("#joinForm").submit();

    });
    */



    //아이디중복체크
    $("#btnUseIDChk").on("click", function(){
      isCheckID = false;
      let mbsp_id = $("#mbsp_id");

      if(mbsp_id.val() == "" || mbsp_id.val() == null){
        alert("아이디를 입력하세요");
        mbsp_id.focus();
        return;
      }

      $.ajax({
        url: '/member/checkID',
        type: 'get',
        dataType: 'text',
        data: { mbsp_id : mbsp_id.val() },
        success: function(data){
          
          $("#idUseState").css("color","red");
          if(data == "Y"){
            isCheckID = true;
            $("#idUseState").html("아이디 사용가능");
          }else if(data == "N"){
            mbsp_id.val("");
            $("#idUseState").html("아이디 사용불가능");
          }
        }
      });
    });


    //메일인증요청
    $("#btnMailAuthReq").on("click", function(){
      isMailAuthConfirm = false;
      let mbsp_email = $("#mbsp_email");

      if(mbsp_email.val() == "" || mbsp_email.val() == null){
        alert("메일주소를 입력하세요.");
        mbsp_email.focus();
        return;
      }

      $.ajax({
        url: '/member/sendMailAuth',
        type: 'get',
        dataType: 'text',
        data: { mbsp_email : mbsp_email.val() },
        success: function(data){
          
          if(data == "success"){
            isMailAuthConfirm = true;
            alert("인증요청 메일발송됨.");
          }else if(data == "fail"){
        	alert("인증요청 메일발송 에러.");
          }
        }
      });
    });

    //메일인증확인
    $("#btnMailAuthConfirm").on("click", function(){

      let auth_mail = $("#auth_mail");

      if(auth_mail.val() == "" || auth_mail.val() == null){
        alert("인증코드를 입력하세요.");
        auth_mail.focus();
        return;
      }

      $.ajax({
        url: '/member/mailAuthConfirm',
        type: 'get',
        dataType: 'text',
        data: { uAuthCode : auth_mail.val() },
        success: function(data){
          
          if(data == "success"){
            alert("인증요청 성공.");
          }else if(data == "fail"){
            alert("인증요청 실패\n 인증코드를 다시 입력하세요. 또는 인증요청을 다시 하기바랍니다.");
            auth_mail.val("");
          }
        } 
      });
    });

  });


</script>

<!--우폅번호 DAUM API-->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
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
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('mbsp_zipcode').value = data.zonecode;
                  document.getElementById("mbsp_addr").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("mbsp_deaddr").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>


    
  </body>
</html>
