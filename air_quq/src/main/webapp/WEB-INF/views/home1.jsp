<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="navbar navbar-expand-lg navbar-light bg-light mb-5">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/"> 숙소 </a></li>
				<li class="nav-item active border-bottom-danger"><a
					class="nav-link" href="#">체험</a></li>
				<li class="nav-item"><a class="nav-link" href="/online/home">온라인
						체험</a></li>
			</ul>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-md-12">
			<!-- Topbar Search -->
			<form class="border-left-danger rounded">
				<div class="form-group input-group">
					<div class="col-md-6">
						<div
							class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
						<input type="text" class="form-control bg-light border-0 small"
							placeholder="어디로 여행가세요?">
					</div>
					<div class="col-md-5">
						<div class="dropdown show">
							<div
								class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
							<input
								class="form-control bg-light border-0 small dropdown-toggle eptotalPeople"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" placeholder="게스트 추가">

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<br>
								<div >
									<input type="button" class="btn adultBtnM" value="-"><span id="adultCount">0</span>
									<input class="btn adultBtnP" type="button" value="+">
								</div>
								<h5>성인</h5>
								<p>만 13세 이상</p>
								<div>
									<br>
									<input type="button" class="btn childBtnM" value="-"><span id="childCount">0</span>
									<input class="btn childBtnP" type="button" value="+">
								</div>
								<br>
								<h5>어린이</h5>
								<p>2 ~ 12세</p>

								<p></p>
								<br>
							</div>
						</div>
					</div>

					<div class="input-group-append">
						<button class="btn btn-danger" type="button">
							<i class="fas fa-search fa-sm"> 검색</i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<h1 class="text-danger">이제 가까운 곳에서 소중한 것들을 찾아보세요.</h1>

	<div class="row">
		<div class="col-md-4">
			<a href="" class="text-decoration-none"> <img
				src="/resources/img/logo_bak.png" class="rounded-lg img-thumbnail">
				<div
					class="text-lg font-weight-bold text-danger text-uppercase mb-1">가까운
					여행지</div>
				<div class="text-danger text-uppercase">자동차로 금방 다녀올 수 있는 근교
					여행지에서 휴식을 즐기세요.</div>
			</a>
		</div>
		<div class="col-md-4">
			<a href="" class="text-decoration-none"> <img
				src="/resources/img/logo_bak.png" class="rounded img-thumbnail">
				<div
					class="text-lg font-weight-bold text-danger text-uppercase mb-1">온라인
					체험</div>
				<div class="text-danger text-uppercase">세계 각지의 호스트가 진행하고 모두 함께
					즐기는 독특한 액티비티</div>
			</a>
		</div>
		<div class="col-md-4">
			<a href="" class="text-decoration-none"> <img
				src="/resources/img/logo_bak.png" class="rounded img-thumbnail">
				<div
					class="text-lg font-weight-bold text-danger text-uppercase mb-1">집
					전체</div>
				<div class="text-danger text-uppercase">일행만을 위한 편안한 공간에서 친구 및
					가족과 오붓한 시간을 보내세요. 최고의 셰프와 함께하는 온라인 체험</div>
			</a>
		</div>
	</div>
</div>

<!-- home  js -->
	<script type="text/javascript" src="/resources/js/home.js"></script>
