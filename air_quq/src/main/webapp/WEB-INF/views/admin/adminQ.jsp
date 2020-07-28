<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/admin/question.css" rel="stylesheet"
	type="text/css">


<div class="container">
	<h1 id="fontcenter" class="text-center">Q&A</h1>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
  						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#nav-home" role="tab"
							aria-controls="nav-home" aria-selected="true">사용자</a>
						<a class="nav-item nav-link" id="nav-profile-tab"
							data-toggle="tab" href="#nav-profile" role="tab"
							aria-controls="nav-profile" aria-selected="false">호스트</a>
					</div>
				</nav>
			</div>
			<div class="col-4">
				<select class="form-control" name="field">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>		
				<input type="text" class="form-control form-control" name="keyword">
			</div>
		</div>
	</div>
	<div class="tab-content" id="nav-tabContent">
		<!-- 사용자 탭 -->
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
							<td>${vo.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container" style="margin-left: 400px;">
				<div class="row">
					<!-- 이전 -->
					<button id="previous">
						<i class="fas fa-backward"></i>
					</button>
					<!-- 숫자 -->
					<div id="paging">
						<input type="hidden" value=${pu.pageNum } id="pageNum">
						<input type="hidden" value=${pu.totalPageCount } id="pagetotal">
						<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									<a href="/admin/adminQ?pageNum=${i}&keyword=${keyword}&field=${field}"><span id="fontred" style="font-family: "Lucida Console"; color: #008CBA;">[${i}]</span></a>
								</c:when>
								<c:otherwise>
									<a href="/admin/adminQ?pageNum=${i}&keyword=${keyword}&field=${field}"><span>[${i}]</span></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<!-- 이후 -->
					<button id="next">
						<i class="fas fa-forward"></i>
					</button>
				</div>
			</div>
		</div>
		<!-- 호스트 탭 -->
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
							<td>${vo.regdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="container" style="margin-left: 400px;">
				<div class="row">
					<!-- 이전 -->
					<button id="previous">
						<i class="fas fa-backward"></i>
					</button>
					<!-- 숫자 -->
					<div id="paging">
						<c:forEach var="i" begin="${pu.startPageNum }" end="${pu.endPageNum }">
							<c:choose>
								<c:when test="${pu.pageNum == i }">
									<a href="/admin/adminQ?pageNum=${i}&div=2&keyword=${keyword}&field=${field}"><span id="fontred">[${i}]</span></a>
								</c:when>
								<c:otherwise>
									<a href="/admin/adminQ?pageNum=${i}&div=2&keyword=${keyword}&field=${field}"><span>[${i}]</span></a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<!-- 이후 -->
					<button id="next">
						<i class="fas fa-forward"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value=${pu.pageNum } id="pageNum">
	<input type="hidden" value=${pu.totalPageCount } id="pagetotal">
	<input type="hidden" id="fieldcopy">
	<input type="hidden" id="keywordcopy">
	<input type="hidden" id="divcopy" value="${divide }">
</div>

<script src="/resources/js/epOnline/adminInfo.js"></script>