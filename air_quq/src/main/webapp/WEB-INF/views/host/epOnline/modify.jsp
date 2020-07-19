<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/host/epOnline/modify.css" rel="stylesheet">
<div class="container text-center">
	<form action="/host/epOnline/modify" method="post">
		<div class="row">
			<input type="hidden" name="einum" value="${vo.einum }">
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
				<h4>주소</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="loc" name="loc" value="${vo.loc }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>자기 소개</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<textarea class="form-control" rows="5" id="intr" name="intr">${vo.intr }</textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>프로그램</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<textarea class="form-control" rows="5" id="program" name="program">${vo.program }</textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>가격</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="price" name="price" value="${vo.price }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>진행 시간</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="times" name="times" value="${vo.times }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>인원 수</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" id="people" name="people" value="${vo.people }">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-danger" value="수정">
			<a class="btn btn-secondary" href="/host/epOnline/list">돌아가기</a>
		</div>
	</form>
</div>
<script src="/resources/js/host/epOnline/modify.js"></script>