/**
 * 
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
				$('#sportlist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
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
				$('#sportlist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
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
				$('#regdatelist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum3').text(pagenum);
		//	alert(data.regdatelist);
		//	alert(data.regdatePageUtil);
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
				$('#regdatelist').append("<div class='onlinecooklist'> <div class='onlinecooklist_div'><input type='hidden' value='"+list.hinum+"'><img src='/resources/img/house_img/"+list.img+"'>"+list.subname+"<br><br><h5>"+list.title+" </h5>1인당 ￦"+list.price+"원 부터  。"+list.times+" 시간<br>별점</div></div>");
				
			});
			$('#onlinePagenum3').text(pagenum);
		//	alert(data.regdatelist);
		//	alert(data.regdatePageUtil);
		},
		error: function(err){
			alert(err);
		}
	});
});





