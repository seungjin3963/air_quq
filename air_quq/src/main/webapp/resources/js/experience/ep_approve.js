/**
 * 
 */

/* ajax */
$(".epgetinfo").click(function(e) {
	var index = $(".epgetinfo").index(this);
	var hinum = document.getElementsByClassName("epapphinum")[index].value;
	$.ajax({
		url : "/admin/ep_getinfo",
		dataType : "json",
		data : {
			hinum : hinum
		},
		success : function(data) {
			$('.epappinfo').empty();
			for (var i = 0; i < 9; i++) {
				if(i==0){
					if(data.div_type==32 || data.div_type==39){
						$(".epappinfo").eq(0).append("<p>  - 온라인 체험</p>");
						
					}else{
						$(".epappinfo").eq(0).append("<p>  - 대면 체험</p>");
					}
				}else if(i==1){
					$(".epappinfo").eq(1).append("<p>  > "+data.subname+"</p>");
				}else if(i==2){
					$(".epappinfo").eq(2).append("<p>  > "+data.title+"</p>");
				}else if(i==3){
					$(".epappinfo").eq(3).append("<p> >  "+data.loc+"</p>");
				}else if(i==4){
					$(".epappinfo").eq(4).append("<p>   > "+data.program+"</p>");
				}else if(i==5){
					$(".epappinfo").eq(5).append("<p>  > "+data.intr+"</p>");
				}else if(i==6){
					$(".epappinfo").eq(6).append("<p>  > "+data.price+" 원</p>");
				}else if(i==7){
					$(".epappinfo").eq(7).append("<p>  > "+data.mater+"</p>");
				}else if(i==8){
					if(data.times==6){
						$(".epappinfo").eq(8).append("<p> > 5 시간 이상</p>");
					}else{
					$(".epappinfo").eq(8).append("<p>  > "+data.times+" 시간</p>");
					}
				}
			}
			$('#epappmainimg').empty();
			$('#epappModalimg').empty();
			for (var i = 0; i < data.list.length; i++) {
				if(data.list[i].ordernum==1){
					$('#epappmainimg').append("<img src='/resources/img/house_img/"+data.list[i].img+"'/>")
				}else{	
					$('#epappModalimg').append("<img src='/resources/img/house_img/"+data.list[i].img+"' />");
				}	
			}	
			$('#epappModal').modal('show');
		}
	});
});


$(".epapproveOk").click(function(e){
	
	var index = $(e.target).index(this);	
	
	var eplisttable=$(this).parent().parent();
	var hinum = document.getElementsByClassName("epapphinum")[index].value;
	var epappdivtype = document.getElementsByClassName("epappdivtype")[index].value;	
	$.ajax({
		url : '/admin/epapproveOk',
		dataType : 'json',
		data : {hinum : hinum ,epappdivtype:epappdivtype},
		success : function(data){	
			alert(epappdivtype);
			alert(data.value);
			eplisttable.remove()
		},
		error: function(err){
			alert(err);
		}
	});
});
$(".epapproveNo").click(function(){
	var index = $(".epapproveNo").index(this);	
	var hinum = document.getElementsByClassName("epapphinum")[index].value;
	var epappdivtype = document.getElementsByClassName("epappdivtype")[index].value;
	$('#reasonModalB').empty();
	$('#reasonModalB').append("<input type='hidden' value="+hinum+" id='apphinumvalue'>");
	$('#reasonModalB').append("<input type='hidden' value="+epappdivtype+" id='epappdivtylevalue'>");
	$('#reasonModalB').append("<input type='hidden' value="+index+" id='epappindex'>");
	$('#reasonModal').modal('show');
});
$("#reasonModalC").click(function(){	
	$('#reasonModal').modal('hide');
});
/*$(".reasonModalO").click(function(){
	var index = $(".epapproveNo").index(this);	
	var eplisttable=$(this).parent().parent();
	var hinum = document.getElementsByClassName("epapphinum")[index].value;
	var epappdivtype = document.getElementsByClassName("epappdivtype")[index].value;	
	$.ajax({
		url : '/admin/epapproveNo',
		dataType : 'json',
		data : {hinum : hinum, epappdivtype : epappdivtype},
		success : function(data){	
			alert(data.value);
			eplisttable.remove()
		},
		error: function(err){
			alert(err);
		}
	});
});*/
$("#reasonModalO").click(function(){
	
	
	var hinum = document.getElementById("apphinumvalue").value;
	var epappdivtype = document.getElementById("epappdivtylevalue").value;	
	var textAreavalue = document.getElementById("message-text").value;
	var epappindex = document.getElementById("epappindex").value;
	var eplisttable=$(".epapproveNo").eq(epappindex).parent().parent();
	
	$.ajax({
		url : '/admin/epapproveNo',
		dataType : 'json',
		data : {hinum : hinum, epappdivtype : epappdivtype , textAreavalue:textAreavalue},
		success : function(data){	
			eplisttable.remove();
			$('#reasonModal').modal('hide');
		},
		error: function(err){
			alert(err);
		}
	});
});
