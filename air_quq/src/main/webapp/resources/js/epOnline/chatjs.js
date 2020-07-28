console.log("chatjs.js입장");
$(function(){
	//드롭다운, 종료
	$('.fa-minus').click(function(){    $(this).closest('.chatbox').toggleClass('chatbox-min');
	});
	$('.fa-close').click(function(){
		$("#dmdm").css('visibility','hidden')
	});
    //호스트 호출
    $("#dmcall2").on('click',function(){
    	var hinum=$("#hinumvalue").val();
    	//console.log(hinum);
    	console.log("123");
    	$.get("/online/dm",{hinum},function(data){
    		    $("#dmdm").css('visibility','visible')
    			$("#mnum").val(data);
    	});
//    	$.ajax({
//    		url:'/online/dm',
//    		data:{"hinum":hinum},
//    		method:"get",
//    		success:function(data){
//    			$( "#dmdm" ).css('visibility','visible')
//    		}
//    	})
    });
    let sock = new SockJS("http://localhost:8090/echo");
    sock.onmessage=onMessage;
    sock.onclose=onClose;
    $("#dmclose").click(function(){
    	$("#dmdm").css('visibility','hidden')
    })
    //send 버튼
	$("#sendText").on('click',function(){
		sendMessage();
/*		var text=$("#message").val();
		var mnum=$("#mnum").val();
		var chat_no=$("#chat_no").val();
		sendMessage();
		$('#message').val('')//메세지보내도 빈칸유지
		$.ajax({
			url:"/echo/addcontent",
			data: {"content":text,"mnum":mnum,"chat_no":chat_no},
			success:function(data){}
		});*/
	})
	//메시지 전송
	function sendMessage(){
    	var text=$("#message").val();
    	var mnum=$("#mnum").val();
    	var chat_no=$("#chat_no").val();
    	
//		sock.send($("#message").val()+","+mnum+","+chat_no); //send가 Handler(컨트롤러,서버)에 데이터 전송
		sock.send(text);
		sock.send(mnum);
		console.log("text :"+text+", mnum :"+mnum+", chat_no :"+chat_no+", messageval :"+$("#message").val())
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
		console.log("연결끊기기 전");
		$("#messageArea").append("연결끊김");
	}
	//에러났을때
	function onError(evt) {
		console.log("에러")
		$("#messageArea").append('<span style = "color: red;">ERROR:</span> ' + evt.data);
     } 
});
  


