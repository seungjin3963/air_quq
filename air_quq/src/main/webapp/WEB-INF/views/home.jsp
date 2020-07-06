<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<!-- Topbar Search -->
	<form class="">
		<div class="input-group">
			<div class="col-md-3">
				<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
				<input type="text" class="form-control bg-light border-0 small" placeholder="어디로 여행가세요?">
			</div>
			<div class="col-md-3">
				<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">체크인</div>
				<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 추가">
			</div>
			<div class="col-md-3">
				<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">체크아웃</div>
				<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 추가">
			</div>
			<div class="col-md-2">
				<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
				<input type="text" class="form-control bg-light border-0 small" placeholder="게스트 추가">
			</div>
			<div class="input-group-append">
				<button class="btn btn-danger" type="button">
					<i class="fas fa-search fa-sm"> 검색</i>
				</button>
			</div>
		</div>
	</form>
</div>
