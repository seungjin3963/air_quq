var totmoney=$("#totmoney").val();

$("#btnApply").click(()=>{
	function getMemberInfo(){
		return new Promise(function(resolve, reject) { 
			$.getJSON("/user/applyCheck/getMemberInfo",(data)=>{
				console.log(data);
				let memberInfo = {email:data.email
								,id:data.id
								,phone:data.phone
								,addr:data.addr
								,money:totmoney};
				resolve(memberInfo);
			});
		});
	}
	getMemberInfo().then((data)=>{
	 var IMP = window.IMP; // 생략가능
	 IMP.init('imp59151892'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
				
	 IMP.request_pay({
	 pg : 'inicis', // version 1.1.0부터 지원.
	 pay_method : 'card',
	 merchant_uid : 'merchant_' + new Date().getTime(),
	 name : 'Airquq',
//	 amount : $("#totmoney").val(),
	 amount : data.money,
	 buyer_email : data.email,
	 buyer_name : data.id,
	 buyer_tel : data.phone,
	 buyer_addr : data.addr,
	 buyer_postcode : '',
	 m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	 }, function(rsp) {
	 if ( rsp.success ) {
		/* var msg = '결제가 완료되었습니다.';
		 msg += '고유ID : ' + rsp.imp_uid;
		 msg += '상점 거래ID : ' + rsp.merchant_uid;
		 msg += '결제 금액 : ' + rsp.paid_amount;
		 msg += '카드 승인번호 : ' + rsp.apply_num;*/
	
		 
		 var form =document.createElement("form");
		 form.setAttribute("charset", "UTF-8");
		 form.setAttribute("method", "POST");
		 form.setAttribute("action", "/user/apply/rent/insert");
		 
		 var imp_uid=document.createElement("input");
		 imp_uid.setAttribute("type", "hidden");
		 imp_uid.setAttribute("name", "imp_uid");
		 imp_uid.setAttribute("value", rsp.imp_uid);

		 var merchant_uid=document.createElement("input");
		 merchant_uid.setAttribute("type", "hidden");
		 merchant_uid.setAttribute("name", "merchant_uid");
		 merchant_uid.setAttribute("value", rsp.merchant_uid);
		 
		 var paid_amount=document.createElement("input");
		 paid_amount.setAttribute("type", "hidden");
		 paid_amount.setAttribute("name", "paid_amount");
		 paid_amount.setAttribute("value", rsp.paid_amount);
		 
		 form.appendChild(imp_uid);
		 form.appendChild(merchant_uid);
		 form.appendChild(paid_amount);
		 
		 document.body.appendChild(form);
		 form.submit();

	 } else {
		 var msg = '결제에 실패하였습니다.';
		 msg += '에러내용 : ' + rsp.error_msg;
		 alert(msg);
	 }
	 });
	}).catch(()=>{
		alert("결제 오류 발생");
	});
});

$("#btnBack").click(()=>{
	/*location.href = "/user/apply";*/
	
	let start_day = $("#start_day").val();
	let end_day = $("#end_day").val();
	let hinum = $("#hinum").val();
	let people_count = $("#people_count").val();
	location.href = `/user/apply?start_day=${start_day}&end_day=${end_day}&hinum=${hinum}&people_count=${people_count}`;
});