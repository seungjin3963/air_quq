<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">
	<div class="jumbotron">
		<h1 class="display-4">에어비앤비 호스트가 되어 수입을 올려보세요</h1>
		<p class="lead"></p>
		<hr class="my-4">
		<p>숙소에 대해 간략하게 알려주세요.</p>
		<form action="/host/regist/step/1" method="post" id="host_regist">
		<p>
			<input class="form-control form-control-lg" type="text" placeholder="주소 검색하기" id="searchPassport">
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
		<input type="submit" class="btn btn-outline-primary" role="button" value="시작하기">
	</form>
	</div>
</div>
