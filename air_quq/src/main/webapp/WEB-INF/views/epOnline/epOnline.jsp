<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/epOnline/epOnline.css">
<div class="container">
	<input type="hidden" id="einum" value="${einum }">
	<div class="localContainer">
		<video id="localVideo" autoplay width="480px"></video>
	</div>
	<div class="remoteContainer"></div>
	<script src="https://192.168.0.2:3000/socket.io/socket.io.js"></script>
	<!-- <script src="https://localhost:3000/socket.io/socket.io.js"></script> -->
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="/resources/js/epOnline/rtc.js"></script>
</div>