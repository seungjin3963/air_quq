<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/hostResCheck.css" rel="stylesheet" type="text/css">

<br>
<br>

<div class="row">
	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div id="tabs">
			<h2>찜 목록 보기</h2>
			<br>
			<ul>
				<li>
					<a href="#tabs-1">숙소</a>
				</li>
				<li>
					<a href="#tabs-2">체험</a>
				</li>


			</ul>
			<div id="tabs-1"></div>



			<div id="tabs-2">


				<br>
				<h1 class="text-dark"></h1>
				<br>
				<div class="row ResappendLIst">
					<c:forEach var="vo" items="${vo }">

						<div class="col-md-3 HostCheckdiv">
							<i class="fas fa-heart-broken fa-2x onlineMypick1" style="display: none; position: absolute; color: red;"></i>
							<i class="fas fa-heart fa-2x onlineMypick2" style="display: block; position: absolute; color: red;"></i>
							<input type="hidden" value="${vo.hinum }" class="ResRentHinum">
							<a href="/online/details?hinum=${vo.hinum }">
								<img src="/resources/img/house_img/${vo.img }" class="HostResCheckImg">
								<br>
								${vo.subname}
							</a>
							<br>
							<br>
							<h5>${vo.title }</h5>
							1인당 ￦${vo.price }원 부터_${vo.times } 시간
							<br>
							별점

						</div>


					</c:forEach>


				</div>


			</div>

		</div>
	</div>
	<div class="col-md-1"></div>
</div>

<script type="text/javascript" src="/resources/js/epOnline/picklist.js"></script>