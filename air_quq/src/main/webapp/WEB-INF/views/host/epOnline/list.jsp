<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/host/epOnline/list.css" rel="stylesheet">
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
								<td>${list.addr }-${list.addr_detail }</td>
								<td>${list.price }</td>
								<td>${list.checkin_time }</td>
								<td>${list.startdate }</td>
								<td>${list.enddate }</td>
								<td>
									<a href="/epOnline/epOnline" class="epIcon">
										<i class="fas fa-photo-video fa-2x"></i>
									</a>
								</td>
								<td>
									<a href="/host/epOnline/modify" class="modiIcon">
										<i class="fa fa-folder-open fa-2x"></i>
									</a>
								</td>
								<td>
									<a href="/" class="delIcon">
										<i class="far fa-trash-alt fa-2x"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="modal fade" id="ModifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">온라인 체험 수정</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body text-center align-middle"></div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
					<a class="btn btn-danger" href="login.html">수정</a>
				</div>
			</div>
		</div>
	</div>
</div>
