<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/epOnline/chat.css" rel="stylesheet">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<input type="hidden" id="menumvalue">
<input type="hidden" id="chat_no">
<div class="container">
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">내가 받은 DM</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>menum</th>
							<th>채팅</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${list }">
							<tr>
								<td>${list.chat_no }</td>
								<td>${list.menum }</td>
								<td>
									<a href="javascript:chatStart(${list.chat_no })">
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
				<a target="_blank" href="#">JHTA</a>
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
		<div class="chat-messages" id="messageArea"></div>
		<div class="chat-input-holder">
			<textarea class="chat-input" id="message"></textarea>
			<input type="submit" value="Send" class="message-send" id="sendText" />
		</div>
	</div>
</div>

<script src="/resources/js/host/dm/list.js"></script>