<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet">

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">
		<nav class="navbar navbar-expand-lg navbar-light bg-white mb-4 static-top shadow">
			<a href="/" class="ml-5 mr-5">
				<img src="/resources/img/logo.png" id="logo">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<c:choose>
							<c:when test="${sessionScope.memberVo.identi_user == 1 }">
								<a href="/admin" class="align-self-center">
									<button type="button" class="btn btn-light align-self-center bg-gradient-warning">관리자 페이지</button>
								</a>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>
					</li>
					<c:if test="${ logind == false || logind == null }">
						<li class="nav-item">
							<a href="/member/join" class="btn btn-light align-self-center">
								<span class="text">회원가입</span>
							</a>
						</li>
					</c:if>
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
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in user-menu-size" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/member/profile?menum=${ menum }">
										<div class="row">
											<div class="col-md-3">
												<i class="fas fa-user menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">내 정보</h6>
											</div>
										</div>
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/user/apply/list">
										<div class="row">
											<div class="col-md-3">
												<i class="fas fa-list menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">예약 현황</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/experience/myexperience">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-handshake-o menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">체험 호스팅하기</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/ep_management/ep_listg">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-reply-all menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">등록 중인 체험</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/host/regist/1?next=1">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-fort-awesome menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">숙소 호스트 되기</h6>
											</div>
										</div>
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/host/house/list">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-home menu-icon-size mr-2"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">내가 등록한 숙소</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/host/epOnline/list">
										<div class="row">
											<div class="col-md-3">
												<i class="fas fa-photo-video menu-icon-size mr-2"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">내가 등록한 체험</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/host/dm/list">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-commenting menu-icon-size mr-2"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">내가 받은 DM</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/host/ResCheck">
										<div class="row">
											<div class="col-md-3">
												<i class="fa fa-users menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">내 집에 온다는 사람들</h6>
											</div>
										</div>
									</a>
									<a class="dropdown-item" href="/online/myPick">
										<div class="row">
											<div class="col-md-3">
												<i class="far fa-heart fa-2x"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">체험 찜 목록</h6>
											</div>
										</div>
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/logout">
										<div class="row">
											<div class="col-md-3">
												<i class="fas fa-sign-out-alt menu-icon-size mr-3"></i>
											</div>
											<div class="col-md-9">
												<h6 class="d-inline-block">로그아웃</h6>
											</div>
										</div>
									</a>
								</div>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>

		<!-- Topbar -->
		<%-- <div class="collapse navbar-collapse" id="sidebar">
				<!-- Topbar Navbar -->
				
			</div> --%>
		<!-- End of Topbar -->
	</div>
	<!-- End of Content Wrapper -->
</div>
<!-- End of Page Wrapper -->