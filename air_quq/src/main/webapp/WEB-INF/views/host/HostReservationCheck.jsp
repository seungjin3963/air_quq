<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="/resources/css/hostResCheck.css" rel="stylesheet"
	type="text/css">
<br>
<br>

<div class="row">

	<div class="col-md-1"></div>
	<div class="col-md-10">
		<div id="tabs">
			<h2>내 집에 온다는 사람들</h2>
			<br>
			<ul>
				<li><a href="#tabs-1">숙소</a></li>
				<li><a href="#tabs-2">체험</a></li>


			</ul>
			<div id="tabs-1"></div>
			<div id="tabs-2">
				<br>
				<h1 class="text-dark"></h1>
				<br>
				<div class="row">
					<c:forEach var="i" items="${ResListE }">
						<c:if test="${i.count>0 }">
						<div class="col-md-2 HostCheckdiv">
							<c:if test="${i.checkNum!=0 }">	
								<span class="badge badge-danger badge-counter spanbadge">예약<br>확인</span>	
							</c:if>
							<img src="/resources/img/house_img/${i.img }"
								class="HostResCheckImg"><br> ${i.subname} <br> <br>
							<h5>${i.title }</h5>
							1인당 ￦${i.price }원 부터_${i.times } 시간<br> 별점

						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>

		</div>
	</div>
	<div class="col-md-1"></div>
</div>



<script type="text/javascript">
	$(function() {
		$("#tabs").tabs();
	});
</script>