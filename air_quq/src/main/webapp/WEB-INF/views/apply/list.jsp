<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate var="now" value="${today }" pattern="yyyyMMdd" />
<link href="/resources/css/userapply/list.css" rel="stylesheet" type="text/css">
<div class="container">
	<div class="row text-center">
		<h1>예약 현황</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>예약 번호</th>
						<th>숙소 번호</th>
						<th>숙소 제목</th>
						<th>시작 날짜</th>
						<th>종료 날짜</th>
						<th>상태</th>
						<th>인원 수</th>
						<th>결제 금액</th>
						<th>리뷰 & 평점</th>
						<th>예약 취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list }">
						<c:choose>
							<c:when test="${list.status == 1 }">
								<c:set var="status" value="미취소"></c:set>
							</c:when>
							<c:when test="${list.status == 2 }">
								<c:set var="status" value="취소"></c:set>
								<c:set var="statusBackColor" value="cencelBackColor"></c:set>
							</c:when>
						</c:choose>
						<tr class=${statusBackColor }>
							<td>${list.rtnum }</td>
							<td>${list.hinum }</td>
							<td>${list.title }</td>
							<td>${list.startrent }</td>
							<td>${list.endrent }</td>
							<td>${status }</td>
							<td>${list.person }</td>
							<td>${list.pay_price }</td>

							<fmt:formatDate var="endrant" type="date" value="${list.endrent}" pattern="yyyyMMdd" />
							<td>
								<c:choose>
									<c:when test="${endrant - now > 0 }">
										<a class="text-success" href="#" data-toggle="modal" data-target="#ReviewAndGradeModal">
											<i class="fa fa-thumbs-up fa-2x"></i>
										</a>
									</c:when>
									<c:otherwise>
										<a class="text-Secondary disable">
											<i class="fa fa-thumbs-up fa-2x"></i>
										</a>
									</c:otherwise>
								</c:choose>
							</td>

							<fmt:formatDate var="startrent" type="date" value="${list.startrent}" pattern="yyyyMMdd" />
							<td>
								<c:choose>
									<c:when test="${startrent - now > 0 }">
										<a href="" class="text-warning">
											<i class="fa fa-calendar-times-o fa-2x"></i>
										</a>
									</c:when>
									<c:otherwise>
										<a class="text-Secondary disable">
											<i class="fa fa-calendar-times-o fa-2x"></i>
										</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="modal fade" id="ReviewAndGradeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">리뷰 & 평점</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="col-md-6 marginAuto">
							<div class="starRev">
								<span class="starR1 on">0.5</span>
								<span class="starR2">1.0</span>
								<span class="starR1">1.5</span>
								<span class="starR2">2.0</span>
								<span class="starR1">2.5</span>
								<span class="starR2">3.0</span>
								<span class="starR1">3.5</span>
								<span class="starR2">4.0</span>
								<span class="starR1">4.5</span>
								<span class="starR2">5.0</span>
							</div>
						</div>
						<div class="col-md-6 text-center marginAuto">
							<div class="font-weight-bold text-danger display-4">5.0</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<button class="btn btn-danger">저장</button>
			</div>
		</div>
	</div>
</div>
<script src="/resources/js/userapply/list.js"></script>