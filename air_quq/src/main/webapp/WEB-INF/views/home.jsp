<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
	<div class="navbar navbar-expand-lg navbar-light bg-light mb-5">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active border-bottom-danger" id="houseNav">
					<a class="nav-link" href="javascript:;" onclick="javascript:houseSearch();"> 숙소 </a>
				</li>
				<li class="nav-item" id="expNav">
					<!-- <a class="nav-link" href="/experience/search">체험</a> -->
					<a class="nav-link" href="javascript:;" onclick="javascript:expSearch();">체험</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/ep_OnlineList">온라인 체험</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="row mb-5">
		<div class="col-md-12">
			<!-- Topbar Search -->
			<form class="border-left-danger rounded" method="post" action="/search/host?pageNum=1" id="host_form">
				<div class="form-group input-group">
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
						<input type="text" class="form-control bg-light border-0 small" placeholder="어디로 여행가세요?" id="searchPassport2" name="locationAdress">
					</div>
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">체크인</div>
						<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 추가" id="start_day" name="start_day">
					</div>
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">체크아웃</div>
						<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 추가" id="end_day" name="end_day">
					</div>
					<div class="col-md-2">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
						<input type="number" class="form-control bg-light border-0 small" placeholder="게스트 추가" id="people_count" name="people_count">
					</div>
					<div class="input-group-append">
						<button class="btn btn-danger" type="submit">
							<i class="fas fa-search fa-sm"> 검색</i>
						</button>
					</div>
				</div>
			</form>
			<form class="border-left-danger rounded d-none w-100" method="post" action="/experience/search/result" id="host_formEx">
				<div class="form-group input-group">
					<div class="col-md-6">
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
	
	<h1 class="text-danger">이제 가까운 곳에서 소중한 것들을 찾아보세요.</h1>
	<script type="text/javascript" src="/resources/js/hostFormValidation.js"></script>
	<!-- <script type="text/javascript" src="/resources/js/passport/passport_main.js"></script> -->
	<br>
	<div class="row">
		<div class="col-md-4">
			<a href="" class="text-decoration-none">
				<img src="/resources/img/Ij9o0LjK3rMUxtyJTVMpvN2uDvgk.jpg" class="rounded-lg img-thumbnail homeImg">
				<div class="text-lg font-weight-bold text-danger text-uppercase mb-1">가까운 여행지</div>
				<div class="text-secondary text-uppercase">자동차로 금방 다녀올 수 있는 근교 여행지에서 휴식을 즐기세요.</div>
			</a>
		</div>
		<div class="col-md-4">
			<a href="" class="text-decoration-none">
				<img src="/resources/img/restmb_allidxmake1.jpg" class="rounded img-thumbnail homeImg">
				<div class="text-lg font-weight-bold text-danger text-uppercase mb-1">온라인 체험</div>
				<div class="text-secondary text-uppercase">세계 각지의 호스트가 진행하고 모두 함께 즐기는 독특한 액티비티</div>
			</a>
		</div>
		<div class="col-md-4">
			<a href="/search/host/all" class="text-decoration-none">
				<img src="/resources/img/3e7363ad1dbdedbb0efdf984cb485224.jpg" class="rounded img-thumbnail homeImg">
				<div class="text-lg font-weight-bold text-danger text-uppercase mb-1">집 전체</div>
				<div class="text-secondary text-uppercase">일행만을 위한 편안한 공간에서 친구 및 가족과 오붓한 시간을 보내세요. 최고의 셰프와 함께하는 온라인 체험</div>
			</a>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="row">
		<div class="UseWay">
				<img src="/resources/img/e3f18889-61ca-445b-94ac-8bc26c71f0f3.jpg"  id="UseWayImg">
			<div>
				<h2>에어큐유큐를 만나보세요</h2>
				<br>
				에어큐유큐에 오신 것을 환영합니다. 여행지가 어디이든 에어큐유큐에서는 내게 꼭 맞는 숙소를 찾을 수 있습니다.
			</div>
		</div>	
	</div>
	<br>
	<br>
	<div class="row">
			<div class="col-md-6">
				<img src="/resources/img/UseWayImg1.jpg"  >
				<div class="col-md-12">
					<h2 class="text-dark">모든 여행에 적합한 숙소</h2>
					<br>
					<p class="text-dark">찾으시는 숙소가 주말 여행을 위한 트리하우스이든 온 가족이 편히 머물 수 있는 공간이든, 에어비앤비 호스트의 따뜻한 환대는 여행의 즐거움을 더해줍니다. 에어비앤비의 모든 숙소에는 체크인 및 편안한 숙박을 위해 필요한 정보를 알려줄 수 있는 호스트가 있다는 사실을 기억하세요.</p>
				
				</div>
			</div>	
			<div class="col-md-6">
				<img src="/resources/img/UseWayImg2.jpg"  >
				<div class="col-md-12">
					<h2 class="text-dark">독특한 체험</h2>
					<br>
					<p class="text-dark">에어비앤비 체험은 흔하디 흔한 투어 상품이 아닙니다. 여행 중이든, 내 도시를 둘러보는 중이든, 집에 머물고 있든, 전문가로부터 새로운 것을 배워보세요. 댄스 레슨, 파스타 만들기, 심지어 염소와 함께하는 요가를 배우실 수 있습니다.</p>
				</div>
			</div>	
	</div>
	<br>
	<br>
	<h1 class="text-dark">간단한 이용 방법</h1>
	<br>
	<div class="row">
		<div class="col-md-3" >
			<img src="/resources/img/UseWayImg3.jpg"  class="UseWayImg1">
			<br>
			<h5 class="text-dark">원하는 결과 찾기</h5>
			<p class="text-dark">원하는 조건에 맞는 결과를 찾을 수 있도록 가격대나 수영장 같은 필터를 적용하여 검색을 맞춤설정하세요.</p>
		</div>
		<div class="col-md-3">
			<img src="/resources/img/UseWayImg4.jpg"  class="UseWayImg1">
			<br>
			<h5 class="text-dark">자세히 알아보기</h5>
			<p class="text-dark">사진을 확인해보세요. 그런 다음 이전 게스트의 후기를 통해 예약이 어떠할지 가늠해보세요.</p>
		</div>
		<div class="col-md-3">
			<img src="/resources/img/UseWayImg5.jpg"  class="UseWayImg1">
			<br>
			<h5 class="text-dark">안심하고 예약하세요.</h5>
			<p class="text-dark">안전한 결제 처리를 위해 에어비앤비는 개인정보를 철저히 보호하고 글로벌 보안 기준을 준수합니다.</p>
		</div>
		<div class="col-md-3">
			<img src="/resources/img/UseWayImg6.jpg"  class="UseWayImg1">
			<br>
			<h5 class="text-dark">도착 후 여행을 즐겨보세요!</h5>
			<p class="text-dark">궁금한 사항이 있는 경우 호스트에게 메시지를 보내 물어보세요. 유용한 현지 팁과 조언을 얻으실 수 있습니다.</p>
		</div>
	</div>
</div>
<script>
	function expSearch(){
		$("#houseNav").removeClass("active border-bottom-danger");
		$("#expNav").addClass("active border-bottom-danger");
		$("#host_form").addClass("d-none");
		$("#host_formEx").removeClass("d-none");
	}
	
	function houseSearch(){
		$("#houseNav").addClass("active border-bottom-danger");
		$("#expNav").removeClass("active border-bottom-danger");
		$("#host_form").removeClass("d-none");
		$("#host_formEx").addClass("d-none");
	}
</script>
	

