<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/adminPage.css" rel="stylesheet"
	type="text/css">
<br>
<br>
<div id="tabs">
	<h2>가입 승인 리스트</h2>
	<br>
	<ul>
		<li><a href="#tabs-1">장기 단기 숙소</a></li>
		<li><a href="#tabs-2">온라인 ,대면 체험</a></li>
		<!-- 영노 -->

	</ul>
	<div id="tabs-1">
		<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a,
			risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam
			elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris
			dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus
			sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
			tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et
			mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt
			interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
	</div>
	<div id="tabs-2">
		<br>

		<div class="container">
			<h4>승인 목록</h4>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>회원 번호</th>
						<th>체험 유형</th>
						<th>체험 주제</th>
						<th>체험 제목</th>
						<th>상세 정보 보기</th>
						<th>승인</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${eplist }">
						<tr>
							<td>${i.memnum }</td>
							<c:choose>
								<c:when test="${i.div_type==31 }">
									<td>온라인 체험</td>
								</c:when>
								<c:otherwise>
									<td>대면 체험</td>
								</c:otherwise>
							</c:choose>
							<td>${i.subname }</td>
							<td>${i.title }</td>
							<td><input type="button" value="상세 보기"
								class="btn btn-danger btn-icon-split ep_botton epgetinfo"><input
								type="hidden" value="${i.hinum }" class="epapphinum"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
	<!-- 상세보기 modal  영노-->
	<div class="container">
  <h2>Modal Example</h2>
  <!-- Trigger the modal with a button -->
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>


	<script type="text/javascript"
		src="/resources/js/experience/ep_approve.js"></script>
	<!-- 영노 -->