/**
 * 메인페이지 호스트 폼 입력 유효성 검사하기
 */

//공백입력 못하게 막기
function blockBlinkInput(documentTypes){
	let text = documentTypes.val();
	alert(text);
	return false;
}



$("#host_form").submit(function(){
	return blockBlinkInput( $("#searchPassport2") );
});