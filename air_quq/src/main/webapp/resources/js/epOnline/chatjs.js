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
    	$.getJSON("/online/dm",{hinum},function(data){
    		if(data.result == "login"){
    			location.href = "/login";
    		}else if(data.result == "success"){
    		    $("#dmdm").css('visibility','visible');
    		    $("#chat_no").val(data.chat_no);
    			$("#menumvalue").val(data.menum);
    			
    			console.log(data.chat);
    			$(data.chat).each(function(i, val){
    				if(data.menum == val.mnum){
    					$("#messageArea").append(
    							"<div class='message-box-holder'>"+
    							"<div class='message-box'>"+
    							val.content+"</div>");
    				}else{
    					$("#messageArea").append(
    							"<div class='message-box message-partner'>"+
    							"<div class='message-box'>"+
    							val.content+"</div>");
    				}
    			});
    			
    			msgAreaScrollUpdate();
    		}
    	});
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
	})
	//메시지 전송
	function sendMessage(){
    	var hinum=$("#hinumvalue").val();
    	var text=$("#message").val();
    	var mnum=$("#menumvalue").val();
    	var chat_no=$("#chat_no").val();
//		sock.send($("#message").val()+","+mnum+","+chat_no); //send가 Handler(컨트롤러,서버)에 데이터 전송
		sock.send(text);
		$.ajax({
			url:"/echo/addcontent",
			data:{"content":text,"mnum":
				mnum,"hinum":hinum,"chat_no":chat_no},
			success:function(data){
				console.log(data);
				if(data == "success"){
					$("#message").val("");
					msgAreaScrollUpdate();
				}else{
					location.href = "/error";
				}
			}
		})
	}
	//서버로부터 메세지를 받았을 때
	function onMessage(msg){
		var data=msg.data;
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
	
	function msgAreaScrollUpdate(){
		$("#messageArea").prop("scrollTop", 9999);
	}
});
  


