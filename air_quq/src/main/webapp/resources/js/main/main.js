$("a[name=man]").click( ()=> {
	//alert('남자');
	$("#dropdownMenuButton").html("남자");
});

$("a[name=woman]").click( ()=> {
	//alert('여자');
	$("#dropdownMenuButton").html("여자");
});


//회원가입 아이디중복방지및 폼값 널값 방지
