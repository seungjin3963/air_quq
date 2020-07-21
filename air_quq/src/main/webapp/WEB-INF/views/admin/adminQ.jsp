<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/admin/question.css" rel="stylesheet"
	type="text/css">


<div class="container">
	<h1 id="fontcenter">Q&A</h1>
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<a class="nav-item nav-link active" id="nav-home-tab"
				data-toggle="tab" href="#nav-home" role="tab"
				aria-controls="nav-home" aria-selected="true">사용자</a> <a
				class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
				href="#nav-profile" role="tab" aria-controls="nav-profile"
				aria-selected="false">호스트</a>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<!-- 사용자 -->
		<!-- 탭 -->
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
			aria-labelledby="nav-home-tab">
			<!-- 테이블 -->
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${user}">
						<tr>
							<td>${vo.bnum }</td>
							<td>${vo.title }</td>
							<td>${vo.content }</td>
							<td>${vo.date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container" style="margin-left: 400px;">
				<!-- 이전 -->
				<button id="previous">
					<i class="fas fa-backward"></i>
				</button>
				<!-- 숫자 -->
				<!-- 이후 -->
				<button id="next">
					<i class="fas fa-forward"></i>
				</button>
			</div>
		</div>
		<!-- 탭 -->
		<div class="tab-pane fade" id="nav-profile" role="tabpanel"
			aria-labelledby="nav-profile-tab">
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">회원번호</th>
						<th scope="col">제목</th>
						<th scope="col">내용</th>
						<th scope="col">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vo" items="${host}">
						<tr>
							<td>${vo.bnum }</td>
							<td>${vo.title }</td>
							<td>${vo.content }</td>
							<td>${vo.date }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container" style="margin-left: 400px;">
				<!-- 이전 -->
				<button id="previous">
					<i class="fas fa-backward"></i>
				</button>
				<!-- 숫자 -->
				<!-- 이후 -->
				<button id="next">
					<i class="fas fa-forward"></i>
				</button>
			</div>
		</div>
	</div>
</div>