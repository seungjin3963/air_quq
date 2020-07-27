<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row mb-5">
	<div class="col-md-12">
		<!-- Topbar Search -->
		<div class="container">
		<form class="border-left-danger rounded" method="post" action="/experience/search/result" id="host_form">
			<div class="form-group input-group">
				<div class="col-md-5">
					<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
					<input type="text" class="form-control bg-light border-0 small" placeholder="어디로 여행가세요?" name="addr">
				</div>
				<div class="col-md-3">
					<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">날짜</div>
					<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 선택" name="day">
				</div>
				<div class="col-md-2">
					<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
					<input type="number" class="form-control bg-light border-0 small" placeholder="인원수" name="cnt">
				</div>
				<div class="input-group-append">
					<button class="btn btn-danger" type="submit">
						<i class="fas fa-search fa-sm"> 검색</i>
					</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>