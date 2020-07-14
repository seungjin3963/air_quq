function checkFromHost(){
	//공백 체크
	var sp = $("#searchPassport").val();
	if(sp != null && sp != ''){
		return true;
	} else {
		alert("주소에 공백을 입력할수없습니다.");
		return false;
	}
}

$("#host_regist").submit(function(){
	return checkFromHost();
});