<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/resources/css/admin/AdmainExperience_info.css" rel="stylesheet" type="text/css">
<link href="/resources/css/adminPage.css" rel="stylesheet"
	type="text/css">
    <br>
    <div class="row">
    	<div class="col-md-1"></div>
    	<div class="col-md-10">
    		<h1 id="host_ep_font">호스트가 등록한 체험 목록</h1>
	<div id="host_ep_div">
		<form action="/admin/ep_info/list" method="post" >
			<input type="submit" value="검색" class="btn btn-danger host_ep_btn">
			<input type="text" name="keyword" class="form-control form-control host_ep_text">
			<select name="field" class="form-control" id="host_ep_select">
				<option value="title" >제목</option>
				<option value="loc">주소</option>
			</select> 
		</form>
	</div>
	<br>
	<br>
	
	<table class="table table-striped">
		<tr>
			<th>등록된 집 번호</th>
			<th>체험 유형</th>
			<th>제목</th>
			<th>주소</th>
			<th>가격</th>
			<th>진행 시간</th>
			<th>삭제여부</th>
		</tr>
		<c:forEach var="i" items="${experience_infolist }">
			<tr class="hovertr">
				<td>${i.hinum }</td>
				<c:choose>
					<c:when test="${i.div_type==3 }">
						<td>온라인 체험</td>
					</c:when>
					<c:otherwise>
						<td>대면 체험</td>
					</c:otherwise>
				</c:choose>
				<td>${i.title }</td>
				<td>${i.loc }</td>
				<td>${i.price }</td>
				<td>${i.times }</td>
				<c:choose>
					<c:when test="${i.del_yn == 'n'}">
						<td>일반</td>
					</c:when>
					<c:otherwise>
						<td>삭제</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<br>
	<div  id="ep_pagediv">
	<button  <c:if test="${pu.pageNum == 1 }">disabled="disabled"</c:if>  id="ep_pageBtnL">
		<i class="fas fa-backward"></i>
	</button>
	<div id="ep_pageNum">
		<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
			<c:choose>
				<c:when test="${pu.pageNum == i }">
					<a href="/admin/ep_info/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span id="fontred">[${i}]</span></a>
				</c:when>
				<c:otherwise>
					<a href="/admin/ep_info/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span>[${i}]</span></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<button  <c:if test="${pu.pageNum == pu.totalPageCount }">disabled="disabled"</c:if> id="ep_pageBtnR">
		<i class="fas fa-forward"></i>
	</button>
</div>
    	</div>
    	<div class="col-md-1"></div>
    </div>

	
	


<div class="modal fade" id="epappModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">상세 보기</h3>
				</div>
				<div class="modal-body" id="epappModalBody">
					<h3>체험 정보</h3>
					<br>
					<h5>▶&nbsp;&nbsp;체험 유형</h5>
					<div class="epappinfo"></div>
					<br> <br>
					<h5>▶&nbsp;&nbsp;체험 주제</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;체험 제목</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;체험 주소</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;프로그램 설명</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;자기소개</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;체험 가격</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h5>▶&nbsp;&nbsp;체험 준비물</h5>
					<div class="epappinfo"></div>
					<br> <br>
					<h5>▶&nbsp;&nbsp;진행 시간</h5>
					<div class="epappinfo"></div>

					<br> <br>
					<h3>커버 사진</h3>
					<div id="epappmainimg"></div>
					<h3>갤러리 사진</h3>

					<br> <br>
					<div id="epappModalimg"></div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="/resources/js/experience/ep_approve.js"></script>
	<!-- 영노 -->