<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">
	<!-- Main Content -->
	<div id="content">
		<nav class="navbar navbar-expand-lg navbar-light bg-white mb-4 static-top shadow">
			<a href="/">
				<img src="/resources/img/logo.png" id="logo">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a href="/host/epOnlineList" class="align-self-center">
							<button type="button" class="btn btn-light align-self-center">온라인 체험(테스트)</button>
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
						<a href="/host/home" class="btn btn-light align-self-center">
							<span class="text">숙소 호스트 되기</span>
						</a>
					</li>
					<li class="nav-item">
						<a href="/ep_management/ep_list" class="btn btn-light align-self-center">
							<span class="text">등록 중인 체험(테스트)</span>
						</a>
					</li>
				</ul>
				<ul class="navbar-nav">
					<div class="divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<c:choose>
						<c:when test="${ logind == false || logind == null }">
							<a href="/login" class="align-self-center">
								<button type="button" class="btn btn-danger">Login</button>
							</a>
						</c:when>
						<c:otherwise>
							<a href="/logout" class="align-self-center">
								<button type="button" class="btn btn-danger">Logout</button>
							</a>
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