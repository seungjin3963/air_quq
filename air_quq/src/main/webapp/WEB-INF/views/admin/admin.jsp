<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>airquq/admin</title>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<link href="/resources/css/home.css" rel="stylesheet">
<link href="/resources/css/header.css" rel="stylesheet">


<!-- jquery --> 
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css">
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/js/jquery/jquery-ui.js"></script>

<style>
.bg-gradient-primary {
	background-color: #e74a3b;
	background-image: none;
}

</style>
</head>
<body>
<div id="header">
	<tiles:insertAttribute name="header" />
</div>
<div class="row" style="margin-top: 70px;">
	<div class="col-md-2">
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		<li class="nav-item">
			<a class="nav-link" href="/admin/member/list"> 
				<i class="fas fa-users"></i> 
				<span>회원 정보</span>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/admin/house_info/list"> 
				<i class="fas fa-home"></i> 
				<span>호스트하우스목록</span>
			</a>
		</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/ep_info/list"> 
					<i class="fas fa-fw fa-tachometer-alt"></i> 
					<span>체험목록</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/admin/approve"> <!-- 영노 -->
					<i class="far fa-check-circle"></i>
					<span>승인/취소</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/admin/adminQ">
					<i class="fas fa-question"></i> 
					<span>QnA</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="#"> 
					<i class="far fa-angry"></i> 
					<span>신고목록</span>
				</a>
			</li>

			<li class="nav-item">
				<a class="nav-link" href="/admin/hoststatistics"> 
					<i class="fas fa-chart-pie"></i> 
					<span>통계</span>
				</a>
			</li>
		</ul>
		</div>
		<div class="col-md-10" id="detail">
			<tiles:insertAttribute name="detail"/>
		</div>
    </div>
<div id="footer">
	<tiles:insertAttribute name="footer" />
</div>
	
</body>

<!-- Bootstrap core JavaScript-->

<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
<script>
	$( function() {
    $( "#tabs" ).tabs();
 	 } );
	$(window).resize(function(){
		if($(this).width() < 1350){
			$("#detail").css('display','none');
		}else{
			$("#detail").css('display','block');
		}
	});
</script>
</html>