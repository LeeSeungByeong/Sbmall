<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<script>
  	
  	let msg = '${msg}'; // EL구문.  'modifyFail'
  	if(msg == 'modifyFail'){
  		alert("비밀번호를 확인바랍니다.");
  	}
  
  </script>
    
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
  
  <h3>마이페이지</h3>
  <div class="form-row">
    <div class="col-md-12">
	    <label for="mbsp_id">아이디</label>
	    <input type="text" class="form-control" id="mbsp_id" name="mbsp_id" value='<c:out value="${memberVO.mbsp_id }" />'  readonly>
	</div>
  </div>
   <div class="form-group">
    <label for="mbsp_name">이름</label>
    <input type="text" class="form-control" id="mbsp_name" name="mbsp_name" value='<c:out value="${memberVO.mbsp_name }" />' readonly>
  </div>
  <div class="form-row">
    <div class="col-md-12">
	    <label for="mbsp_email">전자우편</label>
	    <input type="text" class="form-control" id="mbsp_email" name="mbsp_email" value='<c:out value="${memberVO.mbsp_email }" />' readonly>
	</div>
  </div>
 
   <div class="form-row">
    <div class="col-md-5">
      <label for="mbsp_addr">기본주소</label>
      <input type="text" class="form-control" id="mbsp_addr" name="mbsp_addr" value='<c:out value="${memberVO.mbsp_addr }" />' readonly>
    </div>
    <div class="col-md-5">
      <label for="mbsp_deaddr">나머지주소</label>
      <input type="text" class="form-control" id="mbsp_deaddr" name="mbsp_deaddr" value='<c:out value="${memberVO.mbsp_deaddr }" />' readonly>
      <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
    </div>
    <div class="col-md-2">
      <label for="mbsp_zipcode">우편번호</label>
      <input type="text" class="form-control" id="mbsp_zipcode" name="mbsp_zipcode" value='<c:out value="${memberVO.mbsp_zipcode }" />' readonly>
    </div>
 
   </div>
   
   <div class="form-group">
    <label for="mbsp_phone">전화번호</label>
    <input type="text" class="form-control" id="mbsp_phone" name="mbsp_phone" value='<c:out value="${memberVO.mbsp_phone }" />' readonly>
  </div>
  
  <div class="form-row">
    <div class="col-md-6">
      <label for="mbsp_addr">메일수신여부</label>
      <input type="text" class="form-control" id="mbsp_deaddr" name="mbsp_deaddr" value='<c:out value="${memberVO.mbsp_receive == 'Y' ? '가능': '불가능' }" />' readonly>
    </div>
    <div class="col-md-6">
      <label for="mbsp_deaddr">포인트</label>
      <input type="text" class="form-control" id="mbsp_deaddr" name="mbsp_deaddr" value='<c:out value="${memberVO.mbsp_point }" />' readonly>
    </div>
   </div>
  <hr>
  <div class="form-row">
    <div class="col-md-5">
	    <label for="cur_mbsp_password">현재 비밀번호</label>
	    <input type="password" class="form-control" id="cur_mbsp_password" name="cur_mbsp_password">
	</div>
	<div class="col-md-5">
	    <label for="change_mbsp_password">변경 비밀번호</label>
	    <input type="password" class="form-control" id="change_mbsp_password" name="change_mbsp_password">
  	</div>
  	<div class="col-md-2">
  		<label for="cur_mbsp_password">&nbsp;</label>
   		<button type="button" class="form-control" id="btnChangePw">비밀번호 변경</button>
    </div>
  </div>
  
  <div class="form-row">
    <div class="col-md-5">
	    <label for="mbsp_password">현재 비밀번호</label>
	    <input type="password" class="form-control" id="mbsp_password" name="mbsp_password">
	</div>
	<div class="col-md-2">
  		<label for="btnRegDelete">&nbsp;</label>
   		<button type="button" class="form-control" id="btnRegDelete">회원 탈퇴</button>
    </div>
  </div>
  
  


  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

  $(document).ready(function(){

	//비밀번호 변경
    $("#btnChangePw").on("click", function(){

      let cur_mbsp_password = $("#cur_mbsp_password");
      let change_mbsp_password = $("#change_mbsp_password");

      if(cur_mbsp_password.val() == "" || cur_mbsp_password.val() == null){
        alert("현재비밀번호를 입력하세요.");
        cur_mbsp_password.focus();
        return;
      }
      
      if(change_mbsp_password.val() == "" || change_mbsp_password.val() == null){
          alert("변경비밀번호를 입력하세요.");
          change_mbsp_password.focus();
          return;
        }

      $.ajax({
        url: '/member/changePw',
        type: 'post',
        dataType: 'text',
        data: { cur_mbsp_password : cur_mbsp_password.val(), change_mbsp_password : change_mbsp_password.val() },
        success: function(data){
          
          if(data == "success"){
            alert("비밀번호 성공.");
          }else if(data == "noPw"){
            alert("현재 비밀번호가 다릅니다. 확인하세요.");
            cur_mbsp_password.val("");
            cur_mbsp_password.focus();
          }
        } 
      });
    });
	
  //회원탈퇴
    $("#btnRegDelete").on("click", function(){

      let mbsp_password = $("#mbsp_password");
      
      if(mbsp_password.val() == "" || mbsp_password.val() == null){
        alert("현재비밀번호를 입력하세요.");
        mbsp_password.focus();
        return;
      }
      
      $.ajax({
        url: '/member/regDelete',
        type: 'post',
        dataType: 'text',
        data: { mbsp_password : mbsp_password.val()},
        success: function(data){
          
          if(data == "1"){
            alert("회원삭제가 되었습니다.");
            location.href = "/";		
          }else if(data == "0"){
            alert("현재 비밀번호가 다릅니다. 확인하세요.");
            mbsp_password.val("");
            mbsp_password.focus();
          }
        } 
      });
    });
    
 });


</script>
    
  </body>
</html>
