<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<a href="#"
			class="btn btn-primary btn-icon-split" style="float:right; width: 8%; height:30px;"><div>저장 </div></a>
<a href="#"
			class="btn btn-primary btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;"><div>나가기</div></a>
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">위치</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h1>위치</h1>
		<br>
		<p>체험을 호스팅할 도시를 입력하세요.</p>
		<br>
		<form action="/experience/ep_insert/location" name="locFrom">
			<input type="text" class="form-control bg-light border-0 small"
				id="ep_info_loc" placeholder="서울특별시, 서울특별시, 대한민국" name="value" value="${ep_loc }">

			<br>
			<p>회원님의 지역에서 호스팅하실 수 있어요!</p>


			<div>
				<input type="button" value="선택하기" onclick="check_loc()"
					class="btn btn-primary btn-icon-split" id="ep_type_materials">
			</div>
		</form>

	</div>

</div>