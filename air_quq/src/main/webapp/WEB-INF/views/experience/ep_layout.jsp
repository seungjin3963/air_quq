<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
${clicknum }
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
						
						<ep:choose>
							<ep:when test="${7<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/ep"> <span>체험 유형</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/ep"> <span>체험 유형</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${9<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/type"> <span>주제</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/type"> <span>주제</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${11<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/subject"> <span>위치</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/subject"> <span>위치</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${13<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/location"> <span>자기소개</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/location"> <span>자기소개</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${15<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/introduce"> <span>프로그램 설명</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/introduce"> <span>프로그램 설명</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${17<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/program"> <span>게스트 준비물</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/program"> <span>게스트 준비물</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${19<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/materials"> <span>제목</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/materials"> <span>제목</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${21<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/title"> <span>가격 및 체험시간</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/title"> <span>가격 및 체험시간</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${23<ep_num }">
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: auto;"
									href="/experience/ep_insert/price_time"> <span>사진</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click" style="pointer-events: none;"
									href="/experience/ep_insert/price_time"> <span>사진</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>

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
<script type="text/javascript">
	$("#materials_div")
			.click(
					function() {
						var input="<input type='text' class='form-control bg-light border-0 small' name='value' placeholder='여기에 항목을 입력하세요'><br>";
						$("#materials_div1").append(input);
					});
	function doOpenCheck(chk) {
		var obj = document.getElementsByName("ep_fiedset");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != chk) {
				obj[i].checked = false;
			}
		}
	}
	/* 타입 설정 */
	$("#ep_info_type").click(function() {
		$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=31");
	});
	$("#ep_info_type1").click(function() {
		$("#ep_type_btn").attr("href", "/experience/ep_insert/type?type=41");
	});
	/* 가격 시간 이벤트*/
	function check_price_time() {
		var price_timeFrom = document.price_timeFrom;
		var obj = document.getElementsByName("ep_fiedset");
		var price = price_timeFrom.price.value;
		if (!price) {
			alert("가격을 입력해주세요");
			return;
		} else {
			for (var i = 0; i < obj.length; i++) {
				if (obj[i].checked == true) {
					price_timeFrom.submit();
					return;
				}
			}
			alert("시간을 선택해주세요");
		}
	}
	/*주소 이벤트*/
	function check_loc(){
		var locFrom = document.locFrom;
		var value = locFrom.value.value;
		if(!value){
			alert("주소를 입력해주세요");
		}else{
			locFrom.submit();
		}
	}
	/*자기소개 이벤트*/
	function check_intr(){
		var intrFrom = document.intrFrom;
		var value = intrFrom.value.value;
		if(!value){
			alert("자기소개를 입력해주세요");
		}else{
			intrFrom.submit();
		}
	}
	/*제목*/
	function check_title(){
		var titleFrom = document.titleFrom;
		var value = titleFrom.value.value;
		if(!value){
			alert("제목를 입력해주세요");
		}else{
			titleFrom.submit();
		}
	}
	/*프로그램*/
	function check_program(){
		var programFrom = document.programFrom;
		var value = programFrom.value.value;
		if(!value){
			alert("프로그램에 대한 설명을 입력해주세요");
		}else{
			programFrom.submit();
		}
	}
	/*타입 이벤트*/
	$("#ep_type_btn").click(function() {
		var href = $('#ep_type_btn').attr('href');
		if (href == '#') {
			alert("체험 유형의 입력해주세요");
			return;
		}
	});
	
	
</script>
</html>