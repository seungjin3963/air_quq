<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/epOnline/epOnline.css">
<div class="container">
	<div class="row justify-content-center">
		<div class="localContainer">
			<video id="localVideo" autoplay muted playsinline></video>
		</div>
	</div>
	<div class="row">
		<div class="remoteContainer justify-content-center">
			
		</div>
	</div>
	<br />
	<div id="connections"></div>

	<script src="https://192.168.0.2:3000/socket.io/socket.io.js"></script>
	<!-- <script src="https://https://192.168.0.2:3000/socket.io/socket.io.js"></script> -->
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="/resources/js/epOnline/rtc.js"></script>
	<script type="text/javascript">
		pageReady();
	</script>
</div>
