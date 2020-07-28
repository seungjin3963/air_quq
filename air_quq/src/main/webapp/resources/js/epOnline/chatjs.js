$(function(){
	let sock = new SockJS("http://localhost:8090/echo");
	//드롭다운, 종료
    $('.fa-minus').click(function(){    $(this).closest('.chatbox').toggleClass('chatbox-min');
    });
    $('.fa-close').click(function(){
    	$("#dmdm").css('visibility','hidden')
    });
    //호스트 호출
    $("#dmcall").click(function(){
    	location.href = "/online/dm";
        $( "#dmdm" ).css('visibility','visible')
    });
    $("#dmclose").click(function(){
    	$("#dmdm").css('visibility','hidden')
    })
    //send 버튼
	$("#sendText").click(function(){
		var text=$("#message").val();
		sendMessage();
		$('#message').val('')//메세지보내도 빈칸유지
		$.ajax({
			url:"/echo/addcontent",
			data: {"content":text},
			success:function(data){}
		});
	})
	sock.onmessage=onMessage;
	sock.onclose=onClose;
	//메시지 전송
	function sendMessage(){
			sock.send($("#message").val()); //send가 Handler(컨트롤러,서버)에 데이터 전송 
	}
	//서버로부터 메세지를 받았을 때
	function onMessage(msg){
		var data=msg.data;
//		<div class="message-box-holder">
//		<!-- 메세지보내기 -->
//		<div class="message-box">How are you doing?</div>
//	</div>
		$("#messageArea").append(
				"<div class='message-box-holder'>"+
				"<div class='message-box'>"+
				data+"</div>");
	}
	//서버와 연결을 끊었을 때
	function onClose(evt){
		$("#messageArea").append("연결끊김");
	}
});
  


