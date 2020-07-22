<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="button" onclick="ep_model()"
	class="btn btn-danger btn-icon-split"
	style="float: right; width: 8%; height: 30px; margin-right: 10px;"
	value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">제목</h1>
<div class="ep_type">
	<div id="ep_type_div">
		<form action="/experience/ep_insert/title" name="titleFrom">
			<h1>체험 제목 작성하기</h1>
			<p>간결하면서도 체험을 잘 표현하며, 흥미를 유발하는 제목을 작성하세요.</p>
			<br> <input type="text"
				class="form-control bg-light border-3 small"
				placeholder="체험 제목을 입력하세요" id="ep_info_title" name="value"
				value="${sessionVo.title }"> <br>

			<div>
				<input type="button" value="선택하기" onclick="check_title()"
					class="btn btn-danger btn-icon-split ep_botton">
			</div>
			<br>
			<h1>최대 인원 수</h1>
			<p>체험 클래스를 이용 할 수 있는 회원의 최대 인원 수를 입력해주세요.</p>
			<br>
			<div id="ep_maxpeople">
				<input type="button" value="+" 
					class="btn btn-danger epPeoeleP" style="float: right;">
				<input type="button" value="-" 
					class="btn btn-danger epPeoeleM" style="float:left;">
				<div>
					<span id="epPeoeleS">1</span>
				</div>
				<input type="hidden" value="1" name="ep_people" id="ep_peopleV">
			</div>
			<br>
		</form>
	</div>
</div>