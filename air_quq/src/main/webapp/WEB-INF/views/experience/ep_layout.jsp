<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>AIR_qUq</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link href="/resources/css/home.css" rel="stylesheet">
<link href="/resources/css/experience.css" rel="stylesheet">
<!-- 영노 -->



</head>
<body id="page-top">
	<div id="wrapper">

		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content" class="main-content">
				<div id="wrapper">

					<!-- Sidebar -->
					<ul
						class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
						id="accordionSidebar">

						<!-- Sidebar - Brand -->
						<a
							class="sidebar-brand d-flex align-items-center justify-content-center"
							href="index.html">
							<div class="sidebar-brand-icon rotate-n-15">
								<i class="fas fa-laugh-wink"></i>
							</div>
							<div class="sidebar-brand-text mx-3">체험 등록</div>
						</a>

						<!-- Divider -->
						<hr class="sidebar-divider my-0">

						<!-- Nav Item - Dashboard -->
						<li class="nav-item">
							<div class="nav-link" href="index.html">
								<span>목록</span>
							</div>
						</li>

						<!-- Divider -->
						<hr class="sidebar-divider">

						<!-- Heading -->
						<div class="sidebar-heading"></div>

						<!-- Nav Item - Pages Collapse Menu -->

						<!-- Nav Item - Utilities Collapse Menu -->
						<li class="nav-item"><a class="nav-link collapsed"
							href="/experience/ep_insert/ep_type"> <span>체험 유형</span>
						</a></li>

						<li class="nav-item"><a class="nav-link collapsed"
							href="/experience/ep_insert/ep_location"> <span>위치</span>
						</a></li>

						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>주제</span>
						</a></li>

						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>자기소개</span>
						</a></li>

						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>프로그램 설명</span>
						</a></li>
						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>게스트 준비물</span>
						</a></li>
						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>제목</span>
						</a></li>
						<li class="nav-item"><a class="nav-link collapsed" href="/">
								<span>사진</span>
						</a></li>

						<!-- Divider -->
						<hr class="sidebar-divider d-none d-md-block">

						<!-- Sidebar Toggler (Sidebar) -->
						<div class="text-center d-none d-md-inline">
							<button class="rounded-circle border-0" id="sidebarToggle"></button>
						</div>

					</ul>
					<!-- End of Sidebar -->

					<!-- Content Wrapper -->
					<div id="content-wrapper" class="d-flex flex-column">

						<!-- Main Content -->
						<div id="content">

							<!-- Topbar -->

							<!-- Topbar Navbar -->
							<ul class="navbar-nav ml-auto">

								<!-- Nav Item - Search Dropdown (Visible Only XS) -->
								<li class="nav-item dropdown no-arrow d-sm-none"><a
									class="nav-link dropdown-toggle" href="#" id="searchDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
								</a> <!-- Dropdown - Messages -->
									<div
										class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
										aria-labelledby="searchDropdown">
										<form class="form-inline mr-auto w-100 navbar-search">
											<div class="input-group">
												<input type="text"
													class="form-control bg-light border-0 small"
													placeholder="Search for..." aria-label="Search"
													aria-describedby="basic-addon2">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</form>
									</div></li>

								<!-- Begin Page Content -->
								<div class="container-fluid">
									<!-- ////////////////////////////////////////////////////////////////////main -->

									<tiles:insertAttribute name="type" />

								</div>
								<!-- /.container-fluid -->
						</div>
						<!-- End of Main Content -->

					</div>
					<!-- End of Content Wrapper -->

				</div>
			</div>
			<div id="footer" class="sticky-footer bg-white">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- 회원가입 관련 js -->
	<script type="text/javascript" src="/resources/js/main/main.js"></script>
</body>
</html>