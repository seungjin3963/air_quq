$("#btnApply").click(()=>{
	 var IMP = window.IMP; // 생략가능
	 IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				
	 IMP.request_pay({
	 pg : 'inicis', // version 1.1.0부터 지원.
	 pay_method : 'card',
	 merchant_uid : 'merchant_' + new Date().getTime(),
	 name : 'Airquq',
	 amount : $("#totmoney").val(),
	 buyer_email : ${sessionScope.memberVo.email},
	 buyer_name : ${sessionScope.memberVo.nickname},
	 buyer_tel : ${sessionScope.memberVo.phone},
	 buyer_addr : ${sessionScope.memberVo.addr},
	 buyer_postcode : '',
	 m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	 }, function(rsp) {
	 if ( rsp.success ) {
		 var msg = '결제가 완료되었습니다.';
		 msg += '고유ID : ' + rsp.imp_uid + '<br>';
		 msg += '상점 거래ID : ' + rsp.merchant_uid + '<br>';
		 msg += '결제 금액 : ' + rsp.paid_amount + '<br>';
		 msg += '카드 승인번호 : ' + rsp.apply_num;
	 } else {
		 var msg = '결제에 실패하였습니다.';
		 msg += '에러내용 : ' + rsp.error_msg;
	 }
	 alert(msg);
	 });
});

$("#btnBack").click(()=>{
	location.href = "/user/apply";
});