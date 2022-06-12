<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal">SBMall</h5>
  <nav class="my-2 my-md-0 mr-md-3">
    
    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
    
    	<a class="p-2 text-dark" href="/member/login">LOGIN</a>
    	<a class="p-2 text-dark" href="/member/join">JOIN</a>
    	
    </c:if>
    
    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
    
    	<a class="p-2 text-dark" href="/member/logout">LOGOUT</a>
    	<a class="p-2 text-dark" href="/member/modify">MODIFY</a>
    	
    </c:if>
    
    <a class="p-2 text-dark" href="/member/mypage">MYPAGE</a>
    <a class="p-2 text-dark" href="#">ORDER</a>
    <a class="p-2 text-dark" href="/cart/cartList">CART</a>
  </nav>
</div>
<div class="container">
	<ul class="nav nav-tabs">
		<!-- 
	  <li class="nav-item">
	    <a class="nav-link active" href="#">Active</a>
	  </li>
	   -->
	  <%--
	  <c:forEach items="${userCategory}" var="categoryVO">
		  <li class="nav-item dropdown">
		    <a class="nav-link" data-toggle="dropdown" href="${categoryVO.cate_code }" role="button" aria-expanded="false">${categoryVO.cate_name }</a>
		    <div class="dropdown-menu" id="subCategory_${categoryVO.cate_code }">
		    </div>
		  </li>
	  </c:forEach>
	   --%>
	   
	  <c:forEach items="${userCategory}" var="categoryVO">
		  <li class="nav-item dropdown">
		    <a class="nav-link" data-toggle="dropdown" href="${categoryVO.cate_code }" role="button">${categoryVO.cate_name }</a>
		    <div class="subCategory" id="subCategory_${categoryVO.cate_code }"></div>
		  </li>
	  </c:forEach>
	 </ul>
</div>

<script>
	$(function(){
	  
	  //1차카테고리 클릭시
	  $(".nav .nav-item a.nav-link").on("click", function(){
		console.log("1차카테고리");

		let url = "/product/subCategory/" + $(this).attr("href");
		let curAnchor = $(this); // ajax메서드 호출전에 선택자 this를 전역변수로 받아야 한다.

	      $.getJSON(url, function(data){
			
			// 2차카테고리 정보를 모두 삭제해라.(기존제거)
			$(".nav .nav-item div.subCategory").each(function(){
				
				$(this).empty();
			});


	        //subCategoryBindingView(data, $("#subCategory"), $("#subCategoryTemplate"));
			let subCategoryStr = "";
			for(let i=0; i<data.length; i++) {
				//data[i].cate_code;
				//data[i].cate_name;
				let selector = "#subCategory_" + data[i].cate_prt_code;
				//selector.css("display", "inline");
				//console.log("선택자: " + selector)
				//$(selector).empty();
				subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a>";
				$(selector).append(subCategoryStr);
			}
			
			
			/*
			curAnchor.next().empty();
			curAnchor.next().append(subCategoryStr);
			*/

	      });
	  });

	  $("div.subCategory").on("click", "a.sub_cate", function(e){
		e.preventDefault();

		//console.log("2차카테고리 클릭");
		location.href = "/product/productList?cate_code=" + $(this).attr("href");
	  });
	});
  </script>