<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Page Heading -->
<h1 class="h3 mb-4 text-gray-800">주제</h1>
<div class="ep_type">
	<div id="ep_type_div">

		<h2>어떤 유형의 체험을 호스팅하셨나요?</h2>
		<br>
		<p>
			체험에서 게스트가 주로 하게 될 활동을 가장 잘 나타내는 주제를 선택하시면,<br> 게스트가 체험을 찾아 예약하는
			데 도움이 됩니다.
		</p>
		<br> <br>
		<div 
			class="border-left-danger" ><h3>&nbsp;&nbsp;${subdetail}</h3></div>
		
		<br><a
			href="/experience/ep_insert/subject?value=${expernum}"
			class="btn btn-danger btn-icon-split" id="ep_type_subdetail"><div>선택하기</div></a>
	</div>

</div>
