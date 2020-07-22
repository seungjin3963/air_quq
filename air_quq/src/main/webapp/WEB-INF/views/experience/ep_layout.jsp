<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="ep" uri="http://java.sun.com/jsp/jstl/core"%>
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
						class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion"
						id="accordionSidebar">

						<!-- Sidebar - Brand -->
						<a
							class="sidebar-brand d-flex align-items-center justify-content-center"
							href="index.html">
							<div class="sidebar-brand-icon rotate-n-15"></div>
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
							<ep:when test="${7<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/ep"> <span>체험 유형</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;" href="/experience/ep_insert/ep">
										<span>체험 유형</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${9<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/type"> <span>주제</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;" href="/experience/ep_insert/type">
										<span>주제</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${11<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/subject"> <span>위치</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/subject"> <span>위치</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${13<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/location"> <span>자기소개</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/location"> <span>자기소개</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${15<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/introduce"> <span>프로그램
											설명</span><i class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/introduce"> <span>프로그램
											설명</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${17<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/program"> <span>게스트 준비물</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/program"> <span>게스트 준비물</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${19<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/materials"> <span>제목</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/materials"> <span>제목</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${21<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/title"> <span>가격 및 체험시간</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
									href="/experience/ep_insert/title"> <span>가격 및 체험시간</span>
								</a></li>
							</ep:otherwise>
						</ep:choose>
						<ep:choose>
							<ep:when test="${23<sessionVo.sessionnum }">
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: auto; color: white; font-weight: bold;"
									href="/experience/ep_insert/price_time"> <span>사진</span><i
										class="fas fa-check" style="float: right;"></i>
								</a></li>
							</ep:when>
							<ep:otherwise>
								<li class="nav-item"><a class="nav-link collapsed a_click"
									style="pointer-events: none;"
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

	<div class="modal fade" id="ep_colse_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">저장</h3>
				</div>
				<div class="modal-body"
					style="height: 150px; margin: auto; font-size: 20px;">
					<h5 style="color: black;">저장 하시겠습니까?</h5>
					<br>
					<p style="color: black;">
						저장 후 마이페이지>체험 관리에서<br> 수정 , 확인 하실 수 있습니다
					</p>
					<br>
				</div>
				<div class="modal-footer">
					<input type="button"
						class="btn btn-danger btn-icon-split eq_GoHome1" value="저장 후 나가기"
						style="width: 120px;"> <input type="button"
						class="btn btn-danger btn-icon-split eq_GoHome2" value="나가기"
						style="width: 120px;">
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="ep_insert_total_modal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" style="color: black;">제출하기</h3>
				</div>
				<div class="modal-body fileimg_modalBody" style="height: 700px; overflow: scroll;">
					<ep:choose>
						<ep:when test="${sessionVo.div_type==31 || sessionVo.div_type==39}">
							<h6>체험 유형</h6>
							<ul>
								<li>온라인 체험</li>
							</ul>
						</ep:when>
						<ep:otherwise>
							<h6>체험 유형</h6>
							<ul>
								<li>대면으로 진행되는 체험</li>
							</ul>
						</ep:otherwise>
					</ep:choose>
					<h6>체험 주제</h6>
					<ul>
						<li>${sessionVo.subname}</li>
					</ul>
					<h6>제목</h6>
					<ul>
						<li style="margin: auto;">${sessionVo.title }</li>
					</ul>
					<h6>상세 주소</h6>
					<ul>
						<li>${sessionVo.loc }</li>
					</ul>
					<h6>자기 소개</h6>
					<ul>
						<li>${sessionVo.intr }</li>
					</ul>
					<h6>프로그램 설명</h6>
					<ul>
						<li>${sessionVo.program }</li>
					</ul>
					<div>
						<div>
							<h6>가격</h6>
							<ul>
								<li>${sessionVo.price }</li>
							</ul>
						</div>
						<div>
							<h6>프로그램 준비물</h6>
							<ul>
								<ep:forEach var="i" items="${sessionVo.mater }">
									<li>${i }</li>
								</ep:forEach>
							</ul>
						</div>
					</div>
					<div>
						<h6>진행 시간</h6>
						<ul>
							<li>${sessionVo.times }시간</li>
						</ul>
					</div>
					<h3>이미지 사진</h3>
					<br>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[0].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[1].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[2].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[3].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[4].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[5].img}"></ep:if></div>
					<div class="fileimg_modal"><ep:if test="${!empty epimglist }"><img src="/resources/img/house_img/${epimglist[6].img}"></ep:if></div>
				
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-danger btn-icon-split eq_GoHome3"
						value="최종 제출" style="width: 120px;"> <input type="button"
						class="btn btn-danger btn-icon-split eq_modal_close" value="취소"
						style="width: 120px;">
				</div>
			</div>
		</div>
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
	
	<script type="text/javascript" src="/resources/js/experience/ep_insert.js"></script>
</body>

</html>