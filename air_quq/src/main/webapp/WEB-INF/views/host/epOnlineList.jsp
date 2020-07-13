<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">온라인 체험 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>주소</th>
							<th>가격</th>
							<th>체크인 시간</th>
							<th>시작일</th>
							<th>종료일</th>
							<th>체험 시작</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td>${list.hinum }</td>
								<td>${list.title }</td>
								<td>${list.addr } ${list.addr_detail }</td>
								<td>${list.price }</td>
								<td>${list.checkin_time }</td>
								<td>${list.startdate }</td>
								<td>${list.enddate }</td>
								<td><a href="/"><i class="fa fa-camera"></i></a></td>
								<td><a href="/"><i class="fa fa-folder-open fa-2x"></i></a></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
