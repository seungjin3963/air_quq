<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/adminPage.css" rel="stylesheet" type="text/css">

<br>
<br>

<div id="tabs">
	<h1 class="text-center">승인 대기 리스트</h1>
	<ul>
		<li>
			<a href="#tabs-1">장기 단기 숙소</a>
		</li>
		<li>
			<a href="#tabs-2">온라인 ,대면 체험</a>
		</li>
		<!-- 영노 -->
	</ul>

	<!-- 호스트 승인 확인 목록 기능 -->
	<div id="tabs-1">
		<div class="container">
			<table class="table eplisttable">
				<thead>
					<tr>
						<th scope="col">하우스 번호</th>
						<th scope="col">제목</th>
						<th scope="col">주소</th>
						<th scope="col">가격</th>
						<th scope="col"></th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody id="Tablehmlist">
					<c:forEach items="${ hmlist }" var="list">
						<tr>
							<td>${ list.hinum }</td>
							<td>${ list.title }</td>
							<td>${ list.addr }</td>
							<td>${ list.price }</td>
							<td>
								<a href="/admin/approve/rnjOk?hinum=${ list.hinum }">
									<button type="button" class="btn btn-success">승인</button>
								</a>
							</td>
							<td>
								<a href="/admin/approve/rnjFail?hinum=${ list.hinum }">
									<button type="button" class="btn btn-danger">거절</button>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div class="col-md-5"></div>
				<div class="col-md-3">
					<input type="button" class="btn btn-danger btn-icon-split" value="<<" style=" width:15%;" id="hm_approveM">
					<span id="hm_pageNum">${housePage.pageNum }</span>
					/
					<c:choose>
						<c:when test="${housePage.totalPageCount == 0}">
							<span id=hm_totalPageCount>1</span>
						</c:when>
						<c:otherwise>
							<span id="hm_totalPageCount">${housePage.totalPageCount}</span>
						</c:otherwise>
					</c:choose>
					<input type="button" class="btn btn-danger btn-icon-split" value=">>" style="width: 15%;" id="hm_approveP">
				</div>
				<div class="col-md-4"></div>
			</div>
		</div>
	</div>

	<div id="tabs-2">
		<!-- id="tabs-2" -->
		<div class="container">
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
				<tbody id="Tableeplist">
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
							<input type="hidden" value="${i.hinum }" class="epapphinum">
							<input type="hidden" value="${i.div_type }" class="epappdivtype">
							<td>
								<input type="button" value="상세 보기" class="btn btn-danger btn-icon-split epgetinfo">
							</td>
							<td>
								<input type="button" value="승인 완료" class="btn btn-danger btn-icon-split epapproveOk">
							</td>
							<td>
								<input type="button" value="반려 하기" class="btn btn-danger btn-icon-split epapproveNo">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-3">
				<input type="button" class="btn btn-danger btn-icon-split" value="<<" style=" width:15%;" id="ep_approveM">
				<span id="ep_pageNum">${experiencePage.pageNum }</span>
				/
				<c:choose>
					<c:when test="${experiencePage.totalPageCount == 0}">
						<span id="ep_totalPageCount">1</span>
					</c:when>
					<c:otherwise>
						<span id="ep_totalPageCount">${experiencePage.totalPageCount}</span>
					</c:otherwise>
				</c:choose>
				<input type="button" class="btn btn-danger btn-icon-split" value=">>" style="width: 15%;" id="ep_approveP">
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

	<!-- 반려 이유  modal  영노-->
	<div class="modal fade" id="reasonModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">반려 사유</h3>
				</div>

				<div class="modal-body">
					<form>
						<br>
						<h4>반려 사유를 적어주세요</h4>
						<br>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Message:</label>
							<br>
							<textarea class="form-control" rows="8" id="message-text"></textarea>
						</div>
					</form>
					<div id="reasonModalB"></div>
				</div>
				<div class="modal-footer">
					<input type="button" value="취 소" class="btn btn-danger btn-icon-split epappmodalBtn" id="reasonModalC">
					<input type="button" value="반려 등록" class="btn btn-danger btn-icon-split epappmodalBtn" id="reasonModalO">
				</div>
			</div>
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
					<br>
					<br>
					<h5>▶&nbsp;&nbsp;체험 주제</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;체험 제목</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;체험 주소</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;프로그램 설명</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;자기소개</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;체험 가격</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h5>▶&nbsp;&nbsp;체험 준비물</h5>
					<div class="epappinfo"></div>
					<br>
					<br>
					<h5>▶&nbsp;&nbsp;진행 시간</h5>
					<div class="epappinfo"></div>

					<br>
					<br>
					<h3>커버 사진</h3>
					<div id="epappmainimg"></div>
					<h3>갤러리 사진</h3>

					<br>
					<br>
					<div id="epappModalimg"></div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/resources/js/experience/ep_approve.js"></script>
	<!-- 영노 -->