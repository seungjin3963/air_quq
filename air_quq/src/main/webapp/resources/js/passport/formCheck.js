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


function checkFromHost2(){
	//공백 체크
	var hostTitle = $("input[name='hostTitle']").val();
	var hostContent = $("#hostContent").val();
	console.log(hostTitle);
	console.log(hostContent);
	
	if(hostTitle != '' && hostTitle != null && hostContent != '' && hostContent != null){
		return true;
	} else {
		alert("내용을 입력해주세요.");
		return false;
	}
}

$("#host_regist2").submit(function(){
	return checkFromHost2();
});


function checkFromHost4(){
	//공백 체크
	var searchDetail = $("#searchDetail").val();
	var addressDetail = $("#addressDetail").val();
	
	if(searchDetail != '' && searchDetail != null && addressDetail != '' && addressDetail != null){
		return true;
	} else {
		alert("내용을 빠짐없이 입력해주세요.");
		return false;
	}
}

$("#host_regist4").submit(function(){
	return checkFromHost4();
});