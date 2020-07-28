//공백입력 못하게 막기
function blockBlinkInput(documentTypes){
	let text = documentTypes.val();
	//console.log(text);
	if( text != '' && text != null ){
		return true;
	}
	
	return false;
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


$("#host_formEx").submit(function(){
	var search_passport = blockBlinkInput( $("#addr") );
	var start_day = blockBlinkInput( $("#day") );
	var people_count = blockBlinkInput( $("#cnt") );
	var personChk = personCheck( $("#cnt") );
	//공백없으면 submit
	if( search_passport && start_day &&  people_count &&  personChk ){
		//console.log('submit!');
		return true;
	}
	alert('조건에 맞게 입력해주세요.');
	
	return false;
});