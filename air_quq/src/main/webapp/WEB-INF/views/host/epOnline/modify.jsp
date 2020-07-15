<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/host/epOnline/modify.css" rel="stylesheet">
<div class="container text-center">
	<form action="/host/epOnline/modify" method="post">
		<div class="row">
			<input type="hidden" name="hinum" value="${vo.hinum }">
			<div class="col-md-3">
				<h4>제목</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="title" name="title" value="${vo.title }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>내용</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<textarea class="form-control" rows="5" id="content" name="content">${vo.content }</textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>일일 가격</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="price" name="price" value="${vo.price }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>인원 수</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="max_n" name="max_n" value="${vo.max_n}">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>침대 수</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="bedroom" name="bedroom" value="${vo.bedroom }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>체크인 시간</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="checkin_time" name="checkin_time" value="${vo.checkin_time }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>시작일</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="date" class="form-control form-control-user" id="startdate" name="startdate" value="${vo.startdate }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>종료일</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="date" class="form-control form-control-user" id="enddate" name="enddate" value="${vo.enddate }">
				</div>
			</div>
		</div>

		<div class="modal-footer">
			<input type="submit" class="btn btn-danger" value="수정">
			<a class="btn btn-secondary" href="/host/epOnline/list">돌아가기</a>
		</div>
	</form>
</div>
<script src="/resources/js/host/modify.js"></script>