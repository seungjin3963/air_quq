<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ hostStep == 1 }">
	<div class="progress">
	  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 2 }">
	<div class="progress">
	  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 3 }">
	<div class="progress">
	  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
	</div>
</c:if>
<c:if test="${ hostStep == 4 }">
	<div class="progress">
	  <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
	</div>
</c:if>
<br>
<div class="container">
	<div class="jumbotron">
	<c:if test="${ hostStep == 1 }">
		<h1 class="display-4">에어비앤비 호스트가 되어 수입을 올려보세요</h1>
		<p class="lead"></p>
		<hr class="my-4">
		<p>숙소에 대해 간략하게 알려주세요.</p>
		<form action="/host/regist/1" method="post" id="host_regist">
		<p>
			<input class="form-control form-control-lg" type="text" placeholder="주소 검색하기" id="searchPassport" name="addr">
		</p>

		<div class="row">
			<div class="col">
				<p>
					<select class="form-control form-control-lg"  name="roomStatus">
						<option value="all">집 전체</option>
						<option value="privateRoom">개인실</option>
						<option value="publicRoom">다인실</option>
					</select>
				</p>
			</div>
			<div class="col">
				<p>
					<select class="form-control form-control-lg" name="clientCount">
						<option value="1">숙박인원 1명</option>
						<option value="2">숙박인원 2명</option>
						<option value="3">숙박인원 3명</option>
						<option value="4">숙박인원 4명</option>
						<option value="5">숙박인원 5명</option>
						<option value="6">숙박인원 6명</option>
						<option value="7">숙박인원 7명</option>
						<option value="8">숙박인원 8명</option>
						<option value="9">숙박인원 9명</option>
						<option value="10">숙박인원 10명</option>
					</select>
				</p>
			</div>
		</div>
		<input type="hidden" value="2" name="next">
		<input type="submit" class="btn btn-outline-primary" role="button" value="시작하기">
	</form>
	</c:if>
	<c:if test="${ hostStep == 2 }">
		<h1 class="display-4">집의 상세 설명을 입력해주세요.</h1>
		<p class="lead"></p>
		<hr class="my-4">
		<p>숙소에 대해 자세히 알려주세요. 숙소Home에 보여지게 됩니다.</p>
		<form action="/host/regist/2" method="post" id="host_regist2">
			<p>
				<input class="form-control form-control-lg" type="text" placeholder="제목" name="hostTitle">
			</p>
	
			<div class="input-group">
			  <div class="input-group-prepend">
			    <span class="input-group-text">상세내용</span>
			  </div>
			  <textarea class="form-control" aria-label="With textarea" name="hostContent" rows="16"></textarea>
			</div>
			<br>
			<input type="hidden" value="3" name="next">
			<input type="submit" class="btn btn-outline-primary" role="button" value="다음 단계로 진행">
		</form>
	</c:if>
	<c:if test="${ hostStep == 3 }">
		<h1 class="display-4">숙소의 위치와 서비스될 가격을 알려주세요.</h1>
		<p class="lead"></p>
		<hr class="my-4">
		<p>가격 및 상세주소를 입력해 주세요.</p>
		<form action="/host/regist/2" method="post" id="host_regist3">
			<div class="input-group">
				<input type="text" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
				<div class="input-group-append">
				<span class="input-group-text"><i class="fa fa-money" aria-hidden="true"></i></span>
				<span class="input-group-text">0.00</span>
				</div>
			</div>
			<br>
			<input type="hidden" value="3" name="next">
			<input type="submit" class="btn btn-outline-primary" role="button" value="다음 단계로 진행">
		</form>
	</c:if>
	</div>
</div>