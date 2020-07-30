/**
 * 
 */

$('#Ep_cookBtnP').click(function(){
	var onlinePagenum1=$('#onlinePagenum1').text();
	var pagenum=parseInt(onlinePagenum1)+1;//다음 페이지 num
	
	var onlineTotalPage1=$('#onlineTotalPage1').text();
	
	if(pagenum>parseInt(onlineTotalPage1)){
		pagenum=parseInt(onlineTotalPage1)
	}
	var cooktotalR=$('#cooktotalR').val();//총 갯수
	
	$.ajax({
		url : '/ep_cook',
		dataType:'json',
		data:{pagenum:pagenum ,cooktotalR:cooktotalR },
		success:function(data){
			$('#CookList').empty();
			$(data.cooklist).each(function(i,list){
				$('#CookList').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum1').text(pagenum);
		}
	})
})

$('#Ep_cookBtnM').click(function(){
	var onlinePagenum1=$('#onlinePagenum1').text();
	var pagenum=parseInt(onlinePagenum1)-1;//다음 페이지 num
	
	var onlineTotalPage1=$('#onlineTotalPage1').text();
	
	if(pagenum==0){
		pagenum=1;
	}
	var cooktotalR=$('#cooktotalR').val();//총 갯수
	
	$.ajax({
		url : '/ep_cook',
		dataType:'json',
		data:{pagenum:pagenum ,cooktotalR:cooktotalR },
		success:function(data){
			$('#CookList').empty();
			$(data.cooklist).each(function(i,list){
				$('#CookList').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum1').text(pagenum);
		}
	})
})

/*$('#Ep_cookBtnP').click(function(){
	var onlinePagenum1=$('#onlinePagenum1').text();
	var pagenum=parseInt(onlinePagenum1)+1;//다음 페이지 num
	
	var onlineTotalPage1=$('#onlineTotalPage1').text();
	
	if(pagenum>parseInt(onlineTotalPage1)){
		pagenum=parseInt(onlineTotalPage1)
	}
	var cooktotalR=$('#cooktotalR').val();//총 갯수
	alert(pagenum + " 페이지 넘" + " " + cooktotalR + " 총 갯수1");
	$.ajax({
		
		url : '/ep_cook', //
		
		success : function(data){	
			alert("1");
			$('#CookList').empty();
			$(data.cooklist).each(function(i,list){
				$('#CookList').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum1').text(pagenum);
		
		},
		error: function(err){
			
			alert(err);
		}
	});
});
*/


$('#Ep_AllListBtnP').click(function(){
	var AllListpageNum=$('#AllListpageNum').val();
	var pagenum=parseInt(AllListpageNum)+1;
	
	var AllListtotalPageC=$('#AllListtotalPageC').val();
	if(pagenum>AllListtotalPageC){
		pagenum=AllListtotalPageC;
	}
	var AllListtotal=$('#AllListtotal').val();
	$.ajax({
		url : '/ep_AllList', //
		dataType : 'json',
		data : {pagenum:pagenum , AllListtotal:AllListtotal},
		success : function(data){	
			$('#Alllist').empty();
			$(data.alllist).each(function(i,list){
				$('#Alllist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#AllListpageNum').val(pagenum);
			if(pagenum==AllListtotalPageC){
				$('#Ep_AllListBtnP').css('display' , 'none');
			}else{
				$('#Ep_AllListBtnP').css('display' ,  'inline-block');
			}
			
			if(pagenum!=1){
				$('#Ep_AllListBtnM').css('display' , 'inline-block');				
			}else{
				$('#Ep_AllListBtnM').css('display' , 'none');
			}
		
		},
		error: function(err){
			alert(err);
		}
	});
});

$('#Ep_AllListBtnM').click(function(){
	var AllListpageNum=$('#AllListpageNum').val();
	var pagenum=parseInt(AllListpageNum)-1;
	
	var AllListtotalPageC=$('#AllListtotalPageC').val();
	if(pagenum==0){
		pagenum=1;
	}
	var AllListtotal=$('#AllListtotal').val();
	$.ajax({
		url : '/ep_AllList', //
		dataType : 'json',
		data : {pagenum:pagenum , AllListtotal:AllListtotal},
		success : function(data){	
			$('#Alllist').empty();
			$(data.alllist).each(function(i,list){
				$('#Alllist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#AllListpageNum').val(pagenum);
			
			if(pagenum!=1){
				$('#Ep_AllListBtnM').css('display' , 'inline-block');				
			}else{
				$('#Ep_AllListBtnM').css('display' , 'none');
			}
			
			if(pagenum==AllListtotalPageC){
				$('#Ep_AllListBtnP').css('display' , 'none');
			}else{
				$('#Ep_AllListBtnP').css('display' ,  'inline-block');
			}
		
		},
		error: function(err){
			alert(err);
		}
	});
});











/*$('#Ep_cookBtnM').click(function(){
	var onlinePagenum1=$('#onlinePagenum1').text();
	var pagenum=parseInt(onlinePagenum1)-1;//다음 페이지 num
	
	var onlineTotalPage1=$('#onlineTotalPage1').text();
	
	if(pagenum==0){
		pagenum=1;
	}
	var cooktotalR=$('#cooktotalR').val();//총 갯수
	$.ajax({
		url : '/ep_cook', //
		
		data : {pagenum:pagenum , cooktotalR:cooktotalR},
		success : function(data){	
			$('#CookList').empty();
			$(data.cooklist).each(function(i,list){
				$('#CookList').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum1').text(pagenum);
		
		},
		error: function(err){
			alert(err);
		}
	});
});

*/
















$('#Ep_sportBtnP').click(function(){
	var onlinePagenum2=$('#onlinePagenum2').text();
	var pagenum=parseInt(onlinePagenum2)+1;//다음 페이지 num
	
	var onlineTotalPage2=$('#onlineTotalPage2').text();
	
	if(pagenum>parseInt(onlineTotalPage2)){
		pagenum=parseInt(onlineTotalPage2)
	}
	var sporttotalR=$('#sporttotalR').val();//총 갯수
	$.ajax({
		url : '/ep_sport',
		dataType : 'json',
		data : {pagenum:pagenum , sporttotalR:sporttotalR},
		success : function(data){	
			$('#sportlist').empty();
			$(data.sportlist).each(function(i,list){
				$('#sportlist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum2').text(pagenum);
		
		},
		error: function(err){
			alert(err);
		}
	});
});
$('#Ep_sportBtnM').click(function(){
	var onlinePagenum2=$('#onlinePagenum2').text();
	var pagenum=parseInt(onlinePagenum2)-1;//다음 페이지 num
	
	var onlineTotalPage2=$('#onlineTotalPage2').text();
	
	if(pagenum==0){
		pagenum=1;
	}
	var sporttotalR=$('#sporttotalR').val();//총 갯수
	$.ajax({
		url : '/ep_sport',
		dataType : 'json',
		data : {pagenum:pagenum , sporttotalR:sporttotalR},
		success : function(data){	
			$('#sportlist').empty();
			$(data.sportlist).each(function(i,list){
				$('#sportlist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum2').text(pagenum);
		
		},
		error: function(err){
			alert(err);
		}
	});
});




$('#Ep_regdateBtnP').click(function(){
	var onlinePagenum3=$('#onlinePagenum3').text();
	var pagenum=parseInt(onlinePagenum3)+1;//다음 페이지 num
	
	var onlineTotalPage3=$('#onlineTotalPage3').text();
	
	if(pagenum>parseInt(onlineTotalPage3)){
		pagenum=parseInt(onlineTotalPage3)
	}
	var regdatetotalR=$('#regdatetotalR').val();//총 갯수
	$.ajax({
		url : '/ep_regdate',
		dataType : 'json',
		data : {pagenum:pagenum , regdatetotalR:regdatetotalR},
		success : function(data){	
			$('#regdatelist').empty();
			$(data.regdatelist).each(function(i,list){
				$('#regdatelist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum3').text(pagenum);
		
		},
		error: function(err){
			alert(err);
		}
	});
});

$('#Ep_regdateBtnM').click(function(){
	var onlinePagenum3=$('#onlinePagenum3').text();
	var pagenum=parseInt(onlinePagenum3)-1;//다음 페이지 num
	
	var onlineTotalPage3=$('#onlineTotalPage3').text();
	
	if(pagenum==0){
		pagenum=1;
	}
	var regdatetotalR=$('#regdatetotalR').val();//총 갯수
	$.ajax({
		url : '/ep_regdate',
		dataType : 'json',
		data : {pagenum:pagenum , regdatetotalR:regdatetotalR},
		success : function(data){	
			$('#regdatelist').empty();
			$(data.regdatelist).each(function(i,list){
				$('#regdatelist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><a href='/online/details?hinum="+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'></a>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum3').text(pagenum);
		
		},
		error: function(err){
			alert(err);
		}
	});
});





