<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Dashboard</title>

  <!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link href="/resources/css/home.css" rel="stylesheet">
<link href="/resources/css/experience.css" rel="stylesheet"><!--  영노 -->

<!-- jquery -->
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
<script src="/resources/js/jquery/jquery-3.5.1.js"></script>
<script src="/resources/js/jquery/jquery-ui.js"></script>
</head>

<body id="page-top">
	<div id="wrapper">
		
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content" class="main-content">
				<tiles:insertAttribute name="nav" />
			</div>
			<div id="content" class="main-content">
				<tiles:insertAttribute name="slider" />
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
  

  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="/resources/js/sb-admin-2.min.js"></script>
  <script src="/resources/vendor/chart.js/Chart.min.js"></script>
  <script src="/resources/js/demo/chart-area-demo.js"></script>
  <script src="/resources/js/demo/chart-pie-demo.js"></script>
  <script type="text/javascript" src="/resources/js/main/join.js"></script>
</body>

</html>
