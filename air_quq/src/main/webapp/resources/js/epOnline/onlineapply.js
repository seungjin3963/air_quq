/**
 * 
 */


$(".test1").click(()=>{
	if($('#checkin').val()=="" || $('#checkin').val()==null){
		alert("날짜를 입력해 주세요");
		return;
	}
	function getMemberInfo(){
		return new Promise(function(resolve, reject) { 
			$.getJSON("/user/applyCheck/getMemberInfo",(data)=>{
				let memberInfo = {email:data.email
								,id:data.id
								,phone:data.phone
								,addr:data.addr};
				resolve(memberInfo);
			}).fail(function() {
			    location.href = "/login";
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
	 amount : 100,
	 buyer_email : data.email,
	 buyer_name : data.id,
	 buyer_tel : data.phone,
	 buyer_addr : data.addr,
	 buyer_postcode : '',
	 m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	 }, function(rsp) {
		
		 var checkdata=$('#checkin').val(); //날짜
		 	var PriceSpan=$('#PriceSpan').text(); //가격
		 	var PeopleSpan=$('#PeopleSpan').text(); //인원수 
		 	var hinum=$('#hinum').val();//숙소 번호
		 	var div_type=$('#hidden_divType').val();
		 	$.ajax({
		 		url:'/user/apply/rentVo/Epinsert',
		 		dataType:'json',
		 		data:{checkdata:checkdata,PriceSpan:PriceSpan,PeopleSpan:PeopleSpan,hinum:hinum,div_type:div_type},
		 		success:function(data){
		 			 if ( rsp.success ) {
		 				
		 				  var msg = '결제가 완료되었습니다.';
		 				 msg += '고유ID : ' + rsp.imp_uid;
		 				 msg += '상점 거래ID : ' + rsp.merchant_uid;
		 				 msg += '결제 금액 : ' + rsp.paid_amount;
		 				 msg += '카드 승인번호 : ' + rsp.apply_num;
		 			
		 				 
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
		 		},
		 		error:function(err){
		 			alert(err);
		 		}
		 	});

	 });
	}).catch(()=>{
		alert("결제 오류 발생");
	});
});


$('.PeopleBtnP').click(function(){
	var count=$('#PeopleSpan').text();
	var val=parseInt(count)+1;
	var price=$('#experiecePrice').text();
	var people=$('#MaxPeople').text();
	if(people<val){
		alert("최대 인원수 입니다");
		return;
	}
	
	$('#PeopleSpan').text(val);
	$('#PriceSpan').text(parseInt(price)*val);
});
$('.PeopleBtnM').click(function(){
	var count=$('#PeopleSpan').text();
	var val=count-1;
	var price=$('#experiecePrice').text();
	if(val==0){
		val=1;
	}
	
	$('#PeopleSpan').text(val);
	$('#PriceSpan').text(parseInt(price)*val);
});




/*리뷰 버늩*/
$('.ReviewBtn').click(function(){
	$('#detailReview').modal('show');
});