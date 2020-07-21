<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<th>번호</th>
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
						<tr>
							<td>${list.rtnum }</td>
							<td>${list.startrent }</td>
							<td>${list.endrent }</td>
							<td>${list.status }</td>
							<td>${list.person }</td>
							<td>${list.pay_price }</td>
							<td>
								<a href="" class="text-success">
									<i class="fa fa-krw fa-2x"></i>
								</a>
							</td>
							<td>
								<a href="" class="text-warning">
									<i class="fa fa-calendar-times-o fa-2x"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>