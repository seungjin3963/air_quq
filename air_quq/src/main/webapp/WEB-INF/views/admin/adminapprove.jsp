<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/adminPage.css" rel="stylesheet"
	type="text/css">
<br>
<br>

<div id="tabs">
	<h2>승인 대기 리스트</h2>
	<br>
	<ul>
		<li><a href="#tabs-1">장기 단기 숙소</a></li>
		<li><a href="#tabs-2">온라인 ,대면 체험</a></li>
		<!-- 영노 -->

	</ul>
	<div id="tabs-1">
		<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a,
			risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam
			elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris
			dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus
			sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
			tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et
			mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt
			interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
	</div>
	<div id="tabs-2">
		<br>

		<div class="container">
			<h4>승인 목록</h4>
			<br>
			<table class="table eplisttable">
				<thead>
					<tr>

						<th>회원 번호</th>
						<th>체험 유형</th>
						<th>체험 주제</th>
						<th>체험 제목</th>
						<th>상세 정보 보기</th>
						<th>승 인</th>
						<th>반 려</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${eplist }">
						<tr class="epappTr">

							<td>${i.memnum }</td>
							<c:choose>
								<c:when test="${i.div_type==32 || i.div_type==39}">
									<td>온라인 체험</td>
								</c:when>
								<c:otherwise>
									<td>대면 체험</td>
								</c:otherwise>
							</c:choose>
							<td>${i.subname }</td>
							<td>${i.title }</td>
							<td><input type="button" value="상세 보기"
								class="btn btn-danger btn-icon-split epgetinfo"><input
								type="hidden" value="${i.hinum }" class="epapphinum"></td>
							<td><input type="button" value="승인 완료"
								class="btn btn-danger btn-icon-split epapproveOk"> <input
								type="hidden" value="${i.div_type }" class="epappdivtype1"></td>
							<td><input type="button" value="반려 하기"
								class="btn btn-danger btn-icon-split epapproveNo"><input
								type="hidden" value="${i.div_type }" class="epappdivtype"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>

	<!-- 상세보기 modal  영노-->

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