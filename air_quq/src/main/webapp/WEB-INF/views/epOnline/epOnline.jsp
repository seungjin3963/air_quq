<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/epOnline/epOnline.css">
<div class="bg-gradient-dark text-center min-vh-90">
	<input type="hidden" id="hinum" value="${hinum }">
	<div class="videoContainer">
		<video id="localVideo" autoplay></video>
		<video id="remoteVideo" autoplay></video>
	</div>
	
	<!-- <script src="http://192.168.0.2:3000/socket.io/socket.io.js"></script> -->
	<!-- <script src="https://localhost:3000/socket.io/socket.io.js"></script> -->
	<script src="http://192.168.219.100:3000/socket.io/socket.io.js"></script>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="/resources/js/epOnline/rtc.js"></script>
</div>