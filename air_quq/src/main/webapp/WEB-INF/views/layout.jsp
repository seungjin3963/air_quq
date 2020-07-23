<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="utf-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>AIR_qUq</title>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link href="/resources/css/home.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- jquery -->
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
<!-- <script src="/resources/js/jquery/jquery-3.5.1.js"></script> -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/js/jquery/jquery-ui.js"></script>

<!-- Font Awesome! -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Host CSS load -->
<link href="/resources/css/host/main.css" rel="stylesheet">

<script type="text/javascript" src="https://unpkg.com/@popperjs/core@2"></script>

<!-- vue.js Datepicker CDN -->
<script src="https://unpkg.com/vue"></script>
<script src="https://unpkg.com/vuejs-datepicker"></script>
<script src="https://unpkg.com/vuejs-datepicker/dist/locale/translations/ko.js"></script>

<!-- 숙소 신고 모달 css -->
<link href="/resources/css/modal/report.css" rel="stylesheet">

</head>

<body id="page-top">
	<div id="wrapper">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content" class="main-content">
				<tiles:insertAttribute name="main" />
			</div>
			<div id="footer" class="sticky-footer bg-white">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
			<i class="fas fa-angle-up"></i>
		</a>
	</div>

	<!-- 숙소 신고 모달 -->
	<div class="modal fade" id="houseReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div class="container">
						<div class="row">
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="row">
							<div class="col-md-12 text-center">
								<h3 class="modal-title font-weight-bold">숙소 신고</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 text-center">
								<h6 class="modal-title">※ 내용은 호스트에게 공개되지 않습니다.</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="container">
						<div id="houseReportModalBody"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					<button class="btn btn-danger" id="btnHouseReport" disabled="disabled">신고</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 숙소 신고 모달 -->

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/datatables-demo.js"></script>

	<!-- 회원가입 관련 js -->
	<script type="text/javascript" src="/resources/js/main/join.js"></script>

	<!-- textchange plugin -->
	<script type="text/javascript" src="/resources/js/main/jquery.textchange.min.js"></script>
	<!-- 우편번호 서비스 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 우편번호 passport.js 로딩 -->
	<script type="text/javascript" src="/resources/js/passport/passport.js"></script>
	<!-- 우편번호 Form Check -->
	<script type="text/javascript" src="/resources/js/passport/formCheck.js"></script>

	<!-- Vue.js 로딩 -->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

	<!-- 숙소 신고 js -->
	<script src="/resources/js/modal/houseReport.js"></script>
</body>
</html>