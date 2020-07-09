<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/epOnline/epOnline.css">
<div class="container">
	<div class="row justify-content-center" id="localContainer">
		<video id="localVideo" autoplay></video>
	</div>
	<div class="row justify-content-center" id="remoteContainer">
		<video class="remoteVideo" id="remoteVideo" autoplay></video>
	</div>
</div>
<!-- <script src="https://192.168.0.2:3000/socket.io/socket.io.js"></script> -->
<script src="http://localhost:3000/socket.io/socket.io.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="/resources/js/epOnline/rtc.js"></script>
