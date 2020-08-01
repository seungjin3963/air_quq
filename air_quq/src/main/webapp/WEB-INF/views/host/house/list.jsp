<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="/resources/css/host/epOnline/list.css" rel="stylesheet">
<div class="container">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">숙소 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th class="d-none">번호</th>
							<th>제목</th>
							<th>주소</th>
							<th>가격</th>
							<th>체크인 시간</th>
							<th>시작 날짜</th>
							<th>종료 날짜</th>
							<th>수정</th>
							<th>삭제</th>
							<th>채팅</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td class="d-none">${list.hinum }</td>
								<td>${list.title }</td>
								<td>${list.addr }${list.addr_detail }</td>
								<td>${list.price }</td>
								<td>${list.checkin_time }</td>
								<td>${list.startdate }</td>
								<td>${list.enddate }</td>
								<td>
									<a href="/host/house/modify?hinum=${list.hinum }"
										class="modiIcon">
										<i class="fa fa-folder-open fa-2x"></i>
									</a>
								</td>
								<td>
									<a href="/host/huose/delete?hinum=${list.hinum }"
										class="delIcon">
										<i class="far fa-trash-alt fa-2x"></i>
									</a>
								</td>
								<td>
									<a href="" class="">
										<i class="fa fa-comments fa-2x"></i>
									</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="chatbox-holder" id="dmdm">
	<div class="chatbox" id="dmdm2">
		<!-- 헤더 -->
		<div class="chatbox-top">
			<!-- 이미지 -->
			<div class="chatbox-avatar">
				<a target="_blank">
					<img src="/resources/img/pic/pro.png" />
				</a>
			</div>
			<!-- 이름 -->
			<div class="chat-partner-name">
				<span class="status online"></span>
				<a target="_blank" href="https://www.facebook.com/mfreak">JHTA</a>
			</div>
			<!-- 아이콘 -->
			<div class="chatbox-icons">
				<i class="fa fa-minus">
					<span class="material-icons">arrow_drop_down_circle</span>
				</i>
				<i class="fa fa-close">
					<span class="material-icons">cancel</span>
				</i>
			</div>
		</div>
		<!-- 메시지 -->
		<div class="chat-messages" id="messageArea">
		</div>
		<div class="chat-input-holder">
			<textarea class="chat-input" id="message"></textarea>
			<input type="submit" value="Send" class="message-send" id="sendText" />
		</div>
	</div>
</div>