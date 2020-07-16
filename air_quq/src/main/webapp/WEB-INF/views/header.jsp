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
						<a href="/admin" class="align-self-center">
							<button type="button" class="btn btn-light align-self-center">관리자 페이지</button>
						</a>
					</li>
					<li class="nav-item">
						<a href="/experience/myexperience" class="btn btn-light align-self-center">
							<span class="text">체험 호스팅하기</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/user/apply" class="btn btn-light align-self-center">
							<span class="text">예약 신청하기(테스트)</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/host/regist/1?next=1" class="btn btn-light align-self-center">
							<span class="text">숙소 호스트 되기</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/ep_management/ep_listg" class="btn btn-light align-self-center">
							<span class="text">등록 중인 체험(테스트)</span>
						</a>
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
								<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/host/epOnline/list">
										<i class="fas fa-photo-video fa-fw mr-2"></i>
										내가 등록한 온라인 체험
									</a>
									<a class="dropdown-item" href="#">
										<i class="fas fa-user fa-fw mr-2"></i>
										Profile
									</a>
									<a class="dropdown-item" href="#">
										<i class="fas fa-cogs fa-fw mr-2"></i>
										Settings
									</a>
									<a class="dropdown-item" href="#">
										<i class="fas fa-list fa-fw mr-2"></i>
										Activity Log
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="/logout">
										<i class="fas fa-sign-out-alt fa-fw mr-2"></i>
										로그아웃
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