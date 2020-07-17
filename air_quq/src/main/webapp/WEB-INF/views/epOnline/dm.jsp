<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="UTF-8">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>            
<div class="container">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-pencil"></span>
				&nbsp;&nbsp;&nbsp;<span class="material-icons">mail_outline</span>디엠
			</h3>
		</div>
		<div class="panel-body">
			<div class="media">
				<div class="media-left">
					<a href="#"></a>
				</div>
			</div>
		</div>
	</div>
	<input type="text" id="message"/>
	<input type="button" id="sendBtn" value="submit"/>
	<div id="recallMessage">
		<c:forEach var="chat" items="${chat }">
			<c:choose>
				<c:when test="${chat.step==1 }">
					<span class="material-icons">mood</span> : ${chat.content }<br>
				</c:when>
				<c:otherwise>
					<span class="material-icons">face</span> : ${chat.content }<br>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
	<div id="messageArea"></div>
</div>
</body>
<script type="text/javascript">
	$("#sendBtn").click(function(){
		var text=$("#message").val();
		sendMessage();
		$('#message').val('')//메세지보내도 빈칸유지
		$.ajax({
			url:"/echo/addcontent",
			data: {"content":text},
			success:function(data){}
		});
	})
	let sock = new SockJS("http://localhost:8090/echo");
	sock.onmessage=onMessage;
	sock.onclose=onClose;
	//메시지 전송
	function sendMessage(){
			
			sock.send("<span class='material-icons'>mood</span> : "+$("#message").val()); //send가 Handler(컨트롤러,서버)에 데이터 전송 
	}
	//서버로부터 메세지를 받았을 때
	function onMessage(msg){
		var data=msg.data;
		$("#messageArea").append(data+"<br/>");
	}
	//서버와 연결을 끊었을 때
	function onClose(evt){
		$("#messageArea").append("연결끊김");
	}
</script>
</html>
