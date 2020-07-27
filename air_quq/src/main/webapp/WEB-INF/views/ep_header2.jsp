<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet">

<style>
	#host_form {
		display: inline-block;
		height: 50px;
		margin: auto;
	}
</style>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">
		<nav class="navbar navbar-expand-lg navbar-light bg-white mb-4 static-top shadow">
			<a href="/" class="ml-5 mr-5">
				<img src="/resources/img/logo.png" id="logo">
			</a>
			
			
			
			<!-- form search -->
			<div class="center_div">
			<form class="border-left-danger rounded" method="post" action="/search/host?pageNum=1" id="host_form">
				<div class="form-group input-group">
					<div class="col-md-4">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">위치</div>
						<input type="text" class="form-control bg-light border-0 small" placeholder="어디로 여행가세요?" id="searchPassport2" name="locationAdress" value="${ addr }">
					</div>
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">체크인</div>
						<input type="date" class="form-control bg-light border-0 small" placeholder="날짜 추가" id="start_day" name="start_day" value="${ start_day }">
					</div>
					<div class="col-md-3">
						<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">인원</div>
						<input type="number" class="form-control bg-light border-0 small" placeholder="게스트 추가" id="people_count" name="people_count" value="${ people_count }">
					</div>
					<div class="input-group-append">
						<button class="btn btn-danger" type="submit">
							<i class="fas fa-search fa-sm"> 검색</i>
						</button>
					</div>
				</div>
			</form>
			</div>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="navbar-collapse collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">				
				</ul>
				<ul class="navbar-nav">
					<div class="divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<c:choose>
						<c:when test="${ logind == false || logind == null }">
							<a href="/login" class="align-self-center">
								<button type="button" class="btn btn-danger">로그인</button>
							</a>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown no-arrow ml-3 mr-3">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="far fa-grin-beam fa-fw fa-2x text-danger"></i>
								</a>
								<!-- Dropdown - User Information -->
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/host/epOnline/list">
										<i class="fas fa-photo-video menu-icon-size mr-2"></i>
										<h6 class="d-inline-block">호스트-등록한 체험</h6>
									</a>
									<a class="dropdown-item" href="/host/ResCheck">
										<i class="fas fa-list menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">호스트-내 집에 온다는 사람들</h6>
									</a>
									<a class="dropdown-item" href="/user/apply/list">
										<i class="fas fa-list menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">유저-예약 현황</h6>
									</a>
									<a class="dropdown-item" href="/experience/myexperience">
										<i class="fas fa-list menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">유저-체험 호스팅하기</h6>
									</a>
									<a class="dropdown-item" href="/ep_management/ep_listg">
										<i class="fas fa-list menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">유저-등록 중인 체험(테스트)</h6>
									</a>
									<a class="dropdown-item" href="/host/regist/1?next=1">
										<i class="fas fa-list menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">유저-숙소 호스트 되기</h6>
									</a>
									<a class="dropdown-item" href="#">
										<i class="fas fa-user menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">Profile</h6>
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/logout">
										<i class="fas fa-sign-out-alt menu-icon-size mr-3"></i>
										<h6 class="d-inline-block">로그아웃</h6>
									</a>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
		<script type="text/javascript" src="/resources/js/hostFormValidation.js"></script>
		<!-- Topbar -->
		<%-- <div class="collapse navbar-collapse" id="sidebar">
				<!-- Topbar Navbar -->
				
			</div> --%>
		<!-- End of Topbar -->
	</div>
	<!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->