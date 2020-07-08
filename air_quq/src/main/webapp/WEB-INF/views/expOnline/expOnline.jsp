<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
</style>
</head>
<body>
	<div>
		<video id="localVideo" autoplay width="480px"></video>
		<video id="remoteVideo" width="480px" autoplay></video>
	</div>
	<script src="http://192.168.0.2:3000/socket.io/socket.io.js"></script>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
	<script src="/resources/js/expOnline/rtc.js"></script>
</body>
</html>