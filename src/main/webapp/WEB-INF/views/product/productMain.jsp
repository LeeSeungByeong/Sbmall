<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

    

    <!-- Bootstrap core CSS -->
    
    <!-- <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"> -->
    <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/4.6/dist/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
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


<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Pricing</h1>
  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
</div>

<div class="container">
<!-- Top(1) -->
   <div class="row">
     <c:forEach items="${topProductList}" var="topProductVO">
     <div class="col-md-3 parentDetail">
       <div class="card mb-4 shadow-sm">
         <a href="${topProductVO.pro_num }" class="proDetail">
			<img name="proudctImage" width="100%" height="225" src="/product/displayFile?fileName=s_<c:out value="${topProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${topProductVO.pro_uploadpath }"></c:out>">
		 </a>
		<input type="hidden" name="cate_code" value="${topProductVO.cate_code }">
         <div class="card-body">
              <p class="card-text">
              	<a href="${topProductVO.pro_num }" class="proDetail">
              		<c:out value="${topProductVO.pro_name }"></c:out>
              	</a>
              	<br>
              	<fmt:formatNumber type="currency" value="${topProductVO.pro_price }" /> 
              	<input type="hidden" name="pro_num" value="${topProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>
                  <button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>
                </div>
                
              </div>
            </div>
       </div>
     </div>
     </c:forEach>
    </div> 
    <!-- Pants(2) -->
    <div class="row">
     <c:forEach items="${pantsProductList}" var="pantsProductVO">
     <div class="col-md-3 parentDetail">
       <div class="card mb-4 shadow-sm">
         <a href="${pantsProductVO.pro_num }" class="proDetail">
			<img name="proudctImage" width="100%" height="225" src="/product/displayFile?fileName=s_<c:out value="${pantsProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${pantsProductVO.pro_uploadpath }"></c:out>">
		 </a>
		 <input type="hidden" name="cate_code" value="${pantsProductVO.cate_code }">
         <div class="card-body">
              <p class="card-text">
              	<a href="${pantsProductVO.pro_num }" class="proDetail">
              		<c:out value="${pantsProductVO.pro_name }"></c:out>
              	</a>
              	<br>
              	<fmt:formatNumber type="currency" value="${pantsProductVO.pro_price }" /> 
              	<input type="hidden" name="pro_num" value="${pantsProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>
                  <button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>
                </div>
                
              </div>
            </div>
       </div>
     </div>
     </c:forEach>
    </div> 
    <!-- Shirts(3) -->
    <div class="row">
     <c:forEach items="${shirtsProductList}" var="shirtsProductVO">
     <div class="col-md-3 parentDetail">
       <div class="card mb-4 shadow-sm">
         <a href="${shirtsProductVO.pro_num }" class="proDetail">
			<img name="proudctImage" width="100%" height="225" src="/product/displayFile?fileName=s_<c:out value="${shirtsProductVO.pro_img }"></c:out>&uploadPath=<c:out value="${shirtsProductVO.pro_uploadpath }"></c:out>">
		 </a>
		<input type="hidden" name="cate_code" value="${shirtsProductVO.cate_code }">
         <div class="card-body">
              <p class="card-text">
              	<a href="${shirtsProductVO.pro_num }" class="proDetail">
              		<c:out value="${shirtsProductVO.pro_name }"></c:out>
              	</a>
              	<br>
              	<fmt:formatNumber type="currency" value="${shirtsProductVO.pro_price }" /> 
              	<input type="hidden" name="pro_num" value="${shirtsProductVO.pro_num }">
              </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                  <button type="button" name="btnBuyAdd" class="btn btn-sm btn-outline-secondary">Buy</button>
                  <button type="button" name="btnCartAdd" class="btn btn-sm btn-outline-secondary">Cart</button>
                </div>
                
              </div>
            </div>
       </div>
     </div>
     </c:forEach>
    </div>       
</div>
      <%@include file="/WEB-INF/views/include/footer.jsp" %>

	<script>

      $(function(){

        //장바구니 담기  
        $("button[name='btnCartAdd']").on("click", function(){
            
            let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
            
           // console.log("상품코드" + pro_num);

           $.ajax({
              url: '/cart/cartAdd',
              type: 'post',
              dataType: 'text',
              data: {pro_num: pro_num, cart_amount : 1},
              success: function(data) {
                if(data == "success") {
                  if(confirm("장바구니에 추가되었습니다.\n 지금 확인하겠습니까?")){
                    location.href = "/cart/cartList";
                  }
                }
              }
           });
        });

        $("button[name='btnBuyAdd']").on("click", function(){
            
            let pro_num = $(this).parents("div.card-body").find("input[name='pro_num']").val();
            let pro_amount = 1;
            location.href = "/order/orderInfo?type=direct&pro_num="+pro_num+"&pro_amount="+ pro_amount;

           
        });
        
        
    
    //상세페이지 이동
    $("a.proDetail").on("click", function(e){
      e.preventDefault();
      /*
      let pro_num = $(this).attr("href");
      actionForm.append("<input type='hidden' name='pro_num' value='" + pro_num + "'>");
      actionForm.attr("action", "/product/productDetail");
      actionForm.submit();
      */
      let cate_code = $(this).parents(".parentDetail").find("input[name='cate_code']").val();
      console.log("카테고리: " + cate_code);
      //return;
      location.href = "/product/productDetail?pro_num=" + $(this).attr("href") + "&cate_code=" + cate_code + "&type=N";

    });
  });
    </script>    
  </body>
</html>
