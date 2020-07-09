<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row justify-content-center">
	<video id="localVideo" autoplay width="50%" height="400px"></video>
	<video id="remoteVideo" autoplay width="50%" height="400px"></video>
</div>
<script src="https://192.168.0.2:3000/socket.io/socket.io.js"></script>
<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<script src="/resources/js/epOnline/rtc.js"></script>
