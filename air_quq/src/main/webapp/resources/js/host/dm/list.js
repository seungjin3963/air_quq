function chatStart(chat_no){
	$.getJSON("/host/dm/getChatting",{chat_no},function(data){
		$("#messageArea").empty();
		
		$(".fa-minus").addClass(".chatbox");
		
	    $("#dmdm").css('visibility','visible');
		$("#menumvalue").val(data.menum);
		$("#chat_no").val(chat_no);
		
		let menum = data.menum;
		$(data.list).each(function(i, val){
			if(menum == val.mnum){
				$("#messageArea").append(
						"<div class='message-box-holder'>"+
						"<div class='message-box'>"+
						val.content+"</div>");
			}else{
				$("#messageArea").append(
						`<div class='message-box-holder'><div class='message-box message-partner'>${val.content}</div></div>`);
			}
		});
		
		msgAreaScrollUpdate();
	});
}

$('.fa-minus').click(function(){    
	$(this).closest('.chatbox').toggleClass('chatbox-min');
});
$('.fa-close').click(function(){
	$("#dmdm").css('visibility','hidden')
});

/*let sock = new SockJS("http://localhost:8090/echo");*/
let sock = new SockJS("http://192.168.0.2:8090/echo");
sock.onmessage=onMessage;
sock.onclose=onClose;

$("#dmclose").click(function(){
	$("#dmdm").css('visibility','hidden')
})
// send 버튼
$("#sendText").on('click',function(){
	sendMessage();
})
// 메시지 전송
function sendMessage(){
	var text=$("#message").val();
	var mnum=$("#menumvalue").val();
	var chat_no=$("#chat_no").val();
// sock.send($("#message").val()+","+mnum+","+chat_no); //send가
// Handler(컨트롤러,서버)에 데이터 전송
	sock.send(text);
	$.ajax({
		url:"/echo/addcontent",
		data:{"content":text,"mnum":
			mnum,"chat_no":chat_no},
		success:function(data){
			console.log(data);
			if(data == "success"){
				$("#message").val("");
				msgAreaScrollUpdate();
			}else{
				location.href = "/error";
			}
		}
	});
	
	$("#messageArea").append(
			"<div class='message-box-holder'>"+
			"<div class='message-box'>"+
			text+"</div>");
}
// 서버로부터 메세지를 받았을 때
function onMessage(msg){
	var data=msg.data;
	$("#messageArea").append(
			"<div class='message-box-holder'>"+
			"<div class='message-box message-partner'>"+
			data+"</div>");
	msgAreaScrollUpdate();
}
// 서버와 연결을 끊었을 때
function onClose(evt){
	console.log("연결끊기기 전");
	$("#messageArea").append("연결끊김");
}
// 에러났을때
function onError(evt) {
	console.log("에러")
	$("#messageArea").append('<span style = "color: red;">ERROR:</span> ' + evt.data);
 } 

function msgAreaScrollUpdate(){
	$("#messageArea").prop("scrollTop", 9999);
}