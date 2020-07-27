<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="button" onclick="ep_model()"
			class="btn btn-danger btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;" value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">위치</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h1>위치</h1>
		<br>
		<p>체험을 호스팅할 주소를 입력하세요.</p>
		<br>
		<form action="/experience/ep_insert/location" name="locFrom">
			<input type="text" class="form-control bg-light border-3 small"
				id="ep_info_loc" placeholder="서울특별시, 서울특별시, 대한민국" name="value" value="${sessionVo.loc }">
				<br>
			<input type="button" value="검 색" class="form-control bg-light border-3 small" id="ep_searchPassport"> 
			
			<br>
			<p>회원님의 지역에서 호스팅하실 수 있어요!</p>

			<br>
			<br>
			<br>
			<br>
			<div>
				<input type="button" value="선택하기" onclick="check_loc()"
					class="btn btn-danger btn-icon-split ep_botton">
			</div>
		</form>

	</div>

</div>

