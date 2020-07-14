<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/host/epOnline/modify.css" rel="stylesheet">
<div class="container text-center">
	<div class="row">
		<div class="col-md-3">
			<h4>제목</h4>
		</div>
		<div class="col-md-9">
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="title">
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h4>내용</h4>
		</div>
		<div class="col-md-9">
			<div class="form-group">
				<textarea class="form-control" rows="5" id="content"></textarea>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h4>주소</h4>
		</div>
		<div class="col-md-9">
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="addr">
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h4>주소2</h4>
		</div>
		<div class="col-md-9">
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="addr_detail">
				</div>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<h4>주소2</h4>
		</div>
		<div class="col-md-3">
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="addr_detail">
				</div>
			</form>
		</div>
		<div class="col-md-3">
			<h4>주소2</h4>
		</div>
		<div class="col-md-3">
			<form class="user">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="addr_detail">
				</div>
			</form>
		</div>
	</div>

	<div class="modal-footer">
		<a class="btn btn-danger" href="">수정</a>
		<a class="btn btn-secondary" href="/host/epOnline/list">돌아가기</a>
	</div>
</div>