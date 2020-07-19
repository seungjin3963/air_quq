<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 결제 API(아임포트)  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<div class="container text-center">
	<h1>예약 확인</h1>
	<hr>
	<form>
		<div class="row">
			<div class="col-md-4">
				<h4>체크인</h4>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" value="${sessionScope.applyVo.checkIn }" id="checkIn" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<h4>체크아웃</h4>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="text" class="form-control form-control-user" value="${sessionScope.applyVo.checkOut }" id="checkOut" readonly="readonly">
				</div>
			</div>
			<div class="col-md-4">
				<input type="button" class="btn btn-danger btn-user btn-lg mx-auto" value="예약하기" id="btnApply">
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<h4>인원수</h4>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" value="${sessionScope.applyVo.max_n }" id="max_n" readonly="readonly">
				</div>
			</div>
			<div class="col-md-4">
				<input type="button" class="btn btn-secondary btn-user btn-lg mx-auto" value="돌아가기" id="btnBack">
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<h4>총 금액</h4>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<input type="number" class="form-control form-control-user" value="${sessionScope.applyVo.totmoney }" id="totmoney" readonly="readonly">
				</div>
			</div>
		</div>
	</form>
	<hr>
</div>
<script src="/resources/js/userapply/applyCheck.js"></script>