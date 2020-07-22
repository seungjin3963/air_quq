<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="button" onclick="ep_model()"
			class="btn btn-danger btn-icon-split" style="float:right; width: 8%; height:30px;margin-right: 10px;" value="나가기">
<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">제목</h1>
<div class="ep_type">
	<div id="ep_type_div">
		<h1>체험 제목 작성하기</h1>
		<br>
		<p>간결하면서도 체험을 잘 표현하며, 흥미를 유발하는 제목을 작성하세요.</p>
		<br>
		<form action="/experience/ep_insert/title" name="titleFrom">
			<input type="text" class="form-control bg-light border-3 small"
				placeholder="체험 제목을 입력하세요" id="ep_info_title" name="value" value="${sessionVo.title }"> <br>
			<p>체험의 제목을 입력하세요.</p>
			<div>
				<input type="button" value="선택하기" onclick="check_title()"
					class="btn btn-danger btn-icon-split ep_botton">
			</div>
		</form>
	</div>
</div>