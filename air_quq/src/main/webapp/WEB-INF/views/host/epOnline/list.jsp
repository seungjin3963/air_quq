<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/resources/css/host/epOnline/list.css" rel="stylesheet">
<div class="container">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">체험 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>구분</th>
							<th>제목</th>
							<th>체험 시작</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<c:set var="div_type" value="${list.div_type }"></c:set>
								<td>${list.hinum }</td>
								<c:choose>
									<%-- <c:when test="${list.div_type == 3 }"> --%>
									<c:when test="${fn:contains(div_type,'3')}">
										<td>온라인 체험</td>
									</c:when>
									<c:otherwise>
										<td>체험</td>
									</c:otherwise>
								</c:choose>
								<td>${list.title }</td>
								<td>
									<%-- <c:if test="${list.div_type == 3 }"> --%>
									<c:if test="${fn:contains(div_type,'3')}">
										<a href="/epOnline/epOnline?hinum=${list.hinum }" class="epIcon">
											<i class="fas fa-photo-video fa-2x"></i>
										</a>
									</c:if>
								</td>
								<td>
									<a href="/host/epOnline/modify?einum=${list.einum }" class="modiIcon">
										<i class="fa fa-folder-open fa-2x"></i>
									</a>
								</td>
								<td>
									<a href="/host/epOnline/delete?hinum=${list.hinum }" class="delIcon">
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
