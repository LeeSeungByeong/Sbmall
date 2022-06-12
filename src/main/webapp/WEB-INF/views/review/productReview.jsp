<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<h4>상품후기</h4>
	
		<div class="col-sm-12">
			<label>Review</label>
			<div class="rating">
				<p id="star_grade">
					<a href="#">★</a>
					<a href="#">★</a>
					<a href="#">★</a>
					<a href="#">★</a>
					<a href="#">★</a>
				</p>
				
			</div>
			<input type="hidden" id="reviewNum">
			<input type="hidden" id="reviewScore">
			<textarea id="reviewContent" rows="3" style="width: 100%;"></textarea><br>
			<button id="btnReviewAdd">상품후기등록</button><button id="btnReviewEdit" style="display: none;">상품후기수정</button>
		</div>
	
	
	
		<div class="col-sm-12">
			<table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
				<tbody>
	
					<c:forEach items="${reviewListVO }" var="reviewVO" varStatus="status">
						<tr>
							<td>
								<input type="hidden" name="rew_num" value="${reviewVO.rew_num }">
								별점.${reviewVO.rew_score } <input type="hidden" name="rew_score" value="${reviewVO.rew_score }">
								<c:set var="star" />
								<c:choose>
									<c:when test="${ reviewVO.rew_score eq 1 }">
										<c:set var="star" value="★☆☆☆☆" />
									</c:when>
									<c:when test="${ reviewVO.rew_score eq 2 }">
										<c:set var="star" value="★★☆☆☆" />
									</c:when>
									<c:when test="${ reviewVO.rew_score eq 3 }">
										<c:set var="star" value="★★★☆☆" />
									</c:when>
									<c:when test="${ reviewVO.rew_score eq 4 }">
										<c:set var="star" value="★★★★☆" />
									</c:when>
									<c:when test="${ reviewVO.rew_score eq 5 }">
										<c:set var="star" value="★★★★★" />
									</c:when>
								</c:choose>
								
								<c:out value="${star }" />							
								
							</td>
							<td>
								<textarea name="rew_content" rows="3" style="width: 100%;">${reviewVO.rew_content }</textarea> 
								<br>
								${fn:substring(reviewVO.mbsp_id, 0, 4)  }***** | <fmt:formatDate value="${reviewVO.rew_regdate }" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td>
								<button type="button" name="btnReviewEditModal" class="btn btn-link">수정</button>
								<button type="button" name="btnReviewDelModal" class="btn btn-link">삭제</button>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
	
			</table>
		</div>
	
		
		<div class="col-sm-12">
			<%--
			<div class="dataTables_paginate paging_simple_numbers"
				id="example2_paginate">
				<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class='paginate_button previous ${pageMaker.prev ? "": "disabled" }'
						id="example2_previous"><a href="${pageMaker.startPage - 1}"
						aria-controls="example2" data-dt-idx="0" tabindex="0">Previous</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">	
					<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }'><a href="${num}"
						aria-controls="example2" data-dt-idx="1" tabindex="0">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next }">	
					<li class="paginate_button next" id="example2_next"><a
						href="${pageMaker.endPage + 1}" aria-controls="example2" data-dt-idx="7"
						tabindex="0">Next</a></li>
				</c:if>
				</ul>
			</div>
			 --%>
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			  <c:if test="${pageMaker.prev }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			   </c:if>
			   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
			    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':'' }"><a class="page-link" href="${num}">${num}</a></li>
			   </c:forEach>
			   <c:if test="${pageMaker.next }">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			   </c:if>
			  </ul>
			</nav>
			
		</div>
		<!--prev,page number, next 를 클릭하면 아래 form이 작동된다.-->
		<form id="reviewForm" action="/review/productReview" method="get">
			<!--list.jsp 가 처음 실행되었을 때 pageNum의 값을 사용자가 선택한 번호의 값으로 변경-->
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			
			<!--글번호추가-->
		</form>
		
		
		
		