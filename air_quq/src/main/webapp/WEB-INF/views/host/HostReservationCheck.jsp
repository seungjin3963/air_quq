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
			<div id="tabs-1">
			
				<br>
				<h1 class="text-dark"></h1>
				<br>
				<div class="row ResappendLIstHouse">
					<c:forEach var="i" items="${ResListH }">
						<c:if test="${i.count>0 }">
						<div class="col-md-2 HostCheckdivHouse">
							<input type="hidden" value="${i.hinum }" class="ResRentHinumHouse">
							<c:if test="${i.checkNum!=0 }">	
								<span class="badge badge-danger badge-counter spanbadge">예약<br>확인</span>	
							</c:if>
							<img src="/resources/img/house_img/${i.img }"
								class="HostResCheckImg"><br>
							<h5>${i.title }</h5>
							1인당 ￦${i.price }원 <br> 별점

						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
				
			
			
			<div id="tabs-2">
				<br>
				<h1 class="text-dark"></h1>
				<br>
				<div class="row ResappendLIst">
					<c:forEach var="i" items="${ResListE }">
						<c:if test="${i.count>0 }">
						<div class="col-md-2 HostCheckdiv">
							<input type="hidden" value="${i.hinum }" class="ResRentHinum">
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
<!-- 리스트 보는 모달  체험-->
<div class="modal fade" id="ResListModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">예약 현황</h3>
				</div>
			
				<div class="modal-body">
					<table  id="resTable">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>인원 수</th>
							<th>결제 금액</th>
							<th>결제 여부</th>
							<th>날짜</th>
							<th>에약 확인</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					
					</table>	
				</div>
				<div class="modal-footer">
					<input type="button" value="확 인" class="btn btn-danger btn-icon-split" id="ResTableBtn">
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="ResListModalHouse" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">예약 현황</h3>
				</div>
			
				<div class="modal-body">
					<table  id="resTableHouse">
					<thead>
						<tr>
							<th>회원 번호</th>
							<th>인원 수</th>
							<th>결제 금액</th>
							<th>결제 여부</th>
							<th>날짜</th>
							<th>에약 확인</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					
					</table>	
				</div>
				<div class="modal-footer">
					<input type="button" value="확 인" class="btn btn-danger btn-icon-split" id="ResTableBtnHouse">
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript" src="/resources/js/host/HostResCheck.js"></script>
