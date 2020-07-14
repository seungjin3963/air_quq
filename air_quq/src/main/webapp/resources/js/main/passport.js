//아래 코드처럼 테마 객체를 생성합니다.(color값은 #F00, #FF0000 형식으로 입력하세요.)
//변경되지 않는 색상의 경우 주석 또는 제거하시거나 값을 공백으로 하시면 됩니다.
var themeObj = {
   //bgColor: "", //바탕 배경색
   searchBgColor: "#0B65C8", //검색창 배경색
   //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
   //pageBgColor: "", //페이지 배경색
   //textColor: "", //기본 글자색
   queryTextColor: "#FFFFFF" //검색창 글자색
   //postcodeTextColor: "", //우편번호 글자색
   //emphTextColor: "", //강조 글자색
   //outlineColor: "", //테두리
};

//위에서 생성한 themeObj객체를 우편번호 서비스 생성자에 넣습니다.
//생성자의 자세한 설정은 예제 및 속성탭을 확인해 주세요.
/*
new daum.Postcode({
   theme: themeObj
}).open();

new daum.Postcode({
   theme: themeObj
}).embed(target);
*/

new daum.Postcode({
	oncomplete: function (data) {
		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		// 예제를 참고하여 다양한 활용법을 확인해 보세요.
		console.log(data);
	}
});
