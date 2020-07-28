<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row mb-5">
	<div class="col-md-12">
		<!-- Topbar Search -->
		<div class="container">
			<div class="navbar navbar-expand-lg navbar-light bg-light mb-5">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="/"> 숙소 </a>
						</li>
						<li class="nav-item active border-bottom-danger">
							<a class="nav-link" href="/experience/search">체험</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="/ep_OnlineList">온라인 체험</a>
						</li>
					</ul>
				</div>
			</div>
			<form class="border-left-danger rounded" method="post" action="/experience/search/result" id="host_formEx">
				<div class="form-group input-group">
					<div class="col-md-5">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
						<input type="text" class="form-control bg-light border-0 small" placeholder="어디로 여행가세요?" name="addr" id="addr">
					</div>
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">날짜</div>
						<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 선택" name="day" id="day">
					</div>
					<div class="col-md-2">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
						<input type="number" class="form-control bg-light border-0 small" placeholder="인원수" name="cnt" id="cnt">
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
<script type="text/javascript" src="/resources/js/exFormCheck.js"></script>