var checkGender = null;
var idchk = false;
var emailchk = false;

$("a[name=man]").click( ()=> {
	//alert('남자');
	$("#dropdownMenuButton").html("남자");
	checkGender = 1;
});

$("a[name=woman]").click( ()=> {
	//alert('여자');
	$("#dropdownMenuButton").html("여자");
	checkGender = 2;
});

//아이디 중복체크
$("input[name='id']").change( ()=> {
	var id = $("input[name='id']").val();

	$.getJSON( "/idchk",{id: id}, ( data ) => {
		console.log(data);
		
		if(data == false && id != ""){
			idchk = true;
			console.log("사용가능한 아이디");
		} else if(data == true){
			idchk = false;
			console.log("중복");
			alert('아이디가 이미 존재합니다.');
		}
	});
});

//이메일 중복체크
$("input[name='email']").change( ()=> {
	var email = $("input[name='email']").val();

	$.getJSON( "/emailchk",{email: email}, ( data ) => {
		console.log(data);
		
		if(data == false && email != ""){
			emailchk = true;
			console.log("사용가능한 이메일 주소");
		} else if(data == true){
			emailchk = false;
			console.log("중복");
			alert('사용할수없는 이메일입니다.');
		}
	});
});

//페스워드 입력 체크
function passwordCheckForm(){
	var pwd = $("#InputPassword").val();
	var pwd_repeat = $("#RepeatPassword").val();
	
	if(pwd == pwd_repeat && pwd != "" && pwd_repeat != ""){
		return true;
	} else {
		return false;
	}
}


function checkedForm(){
	var chk = passwordCheckForm();
	if(emailchk == true && idchk == true && chk == true && checkGender != null){
		return true;
	}
	return false;
}


$("#jid").submit(function(){
	alert(checkedForm());
	return checkedForm();
});