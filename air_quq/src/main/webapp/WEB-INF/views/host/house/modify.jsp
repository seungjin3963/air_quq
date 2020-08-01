<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/resources/css/host/epOnline/modify.css" rel="stylesheet">
<div class="container text-center">
	<form action="/host/house/modify" method="post">
		<div class="row">
			<input type="hidden" name="hinum" value="${vo.hinum }">
			<div class="col-md-3">
				<h4>제목</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtTitle" name="title" value="${vo.title }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>내용</h4>
			</div>
			<div class="col-md-9">
				<div class="form-group">
					<textarea class="form-control" rows="5" id="txtContent" name="content">${vo.content }</textarea>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>주소</h4>
			</div>
			<div class="col-md-5">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtAddr" name="addr" value="${vo.addr }">
				</div>
			</div>
			<div class="col-md-2">
				<h4>상세 주소</h4>
			</div>
			<div class="col-md-2">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtAddrDetail" name="addr_detail" value="${vo.addr_detail }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>가격</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtPrice" name="price" value="${vo.price }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>인원 수</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtMax_n" name="max_n" value="${vo.max_n }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>침실 수</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtBedroom" name="bedroom" value="${vo.bedroom }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>체크인 시간</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" id="txtCheckin_time" name="checkin_time" value="${vo.checkin_time }">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h4>시작 날짜</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="date" class="form-control form-control-user" id="startdate" name="startdate" value="${vo.startdate }">
				</div>
			</div>
			<div class="col-md-3">
				<h4>종료 날짜</h4>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<input type="date" class="form-control form-control-user" id="enddate" name="enddate" value="${vo.enddate }">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<input type="submit" class="btn btn-danger" value="수정">
			<a class="btn btn-secondary" href="/host/house/list">돌아가기</a>
		</div>
	</form>
</div>
<script src="/resources/js/host/epOnline/modify.js"></script>