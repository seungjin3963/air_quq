var checkGender = null;

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


//회원가입 아이디중복방지및 폼값 널값 방지
$(".user").submit( (event) => {
	event.preventDefault();
	var id = $("input[name='id']").val();
	var id_tf = true;
	var addr = $("input[name='addr']").val();
	var addr_tf = true;
	var phone = $("input[name='phone']").val();
	var phone = true;
	var pwd = $("input[name='pwd']").val();
	var pwdChk = $("input[name='pwdChk']").val();
	var pwd_tf = true;
	var pwd_chk = true;
	var checkGender_value = null;

	//공백 방지
	if(id == null || id == ''){
		alert('아이디를 입력해주세요.');
		id_tf = false;
	} else {
		id_tf =true;
	}

	if(addr == null || addr == ''){
		alert('주소를 입력해주세요.');
		addr_tf = false;
	} else {
		addr_tf = true;
	}

	if(phone == null || phone == ''){
		alert('전화번호를 입력해주세요.');
		phone_tf = false;
	} else {
		phone_tf = true;
	}

	if(pwd == null || pwd == ''){
		alert('비밀번호를 입력해주세요.');
		pwd_tf = false;
	} else {
		pwd_tf = true;
	}

	if(checkGender == null){
		alert('성별을 선택해 주세요.');
	} else {
		checkGender_value = $.trim( $("#dropdownMenuButton").text() );
	}

	//비밀번호 체크
	if(pwd != pwdChk){
		alert('비밀번호가 일치하지 않습니다.');
		pwd_chk = false;
	} else {
		pwd_chk = true;
	}

	if(id_tf && addr_tf && phone_tf && pwd_tf && checkGender != null && pwd_chk){
		$(this).submit();
	}
});