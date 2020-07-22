/**
 * 메인페이지 호스트 폼 입력 유효성 검사하기
 */

//공백입력 못하게 막기
function blockBlinkInput(documentTypes){
	let text = documentTypes.val();
	//console.log(text);
	if( text != '' && text != null ){
		return true;
	}
	
	return false;
}

//체크아웃 날짜가 시작날보다 무조건 1일이상 되게 선택
function dateCalculator(startDay, endDay){
	let s_day = startDay.val();
	let e_day = endDay.val();
	
	console.log(s_day);
	console.log(e_day);
	
	if( s_day > e_day ){
		alert('종료날짜가 시작날짜보다 작을수 없습니다.');
		return false;
	}
	return true;
}

//인원수 1명이상만 가능하게 하기
function personCheck(personDocument){
	let count = personDocument.val();
	
	if(count < 1){
		alert('인원수는 1명이상만 가능합니다.');
		personDocument.val(1);
		return false;
	}
	return true;
}


$("#host_form").submit(function(){
	var search_passport = blockBlinkInput( $("#searchPassport2") );
	var start_day = blockBlinkInput( $("#start_day") );
	var end_day = blockBlinkInput( $("#end_day") );
	var people_count = blockBlinkInput( $("#people_count") );
	var calculatorDate = dateCalculator( $("#start_day"), $("#end_day") );
	var personChk = personCheck( $("#people_count") );
	//공백없으면 submit
	if( search_passport && start_day && end_day && people_count && calculatorDate && personChk ){
		//console.log('submit!');
		return true;
	}
	alert('조건에 맞게 입력해주세요.');
	
	return false;
});