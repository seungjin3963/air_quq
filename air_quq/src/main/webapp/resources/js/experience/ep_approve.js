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

///////////////////////////////////
$('.hovertr').click(function(){
	var hinum=$(this).find("td:first").text();
	$.ajax({
		url : "/host/ep_getinfo",
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
	
})

// 체험 페이징 
$('#ep_approveP').click(function(){
	var ep_pageNum=$('#ep_pageNum').text();
	var pageNum=parseInt(ep_pageNum)+1;
	
	var totalPageCount=$('#ep_totalPageCount').text();
	if(pageNum>totalPageCount){
		pageNum=totalPageCount
	}
	$.ajax({
		url:'/admin/epapprovePage',
		dataType:'json',
		data : {pageNum , pageNum},
		success: function(data){
			$('#Tableeplist').empty();
			$(data.eplist).each(function(i,list){
				var html="";
				html+="<tr class='epappTr'>";
				html+="<td>"+list.memnum+"</td>";
				if(list.div_type==32){
					html+="<td>온라인 체험</td>";
				}else{
					html+="<td>대면 체험</td>";
				}
				html+="<td>"+list.subname+"</td>";
				html+="<td>"+list.title+"</td>";
				html+="	<input type='hidden' value="+list.hinum+" class='epapphinum'><input type='hidden' value="+list.div_type+" class='epappdivtype'><td><input type='button' value='상세 보기'class='btn btn-danger btn-icon-split epgetinfo'></td><td><input type='button' value='승인 완료'class='btn btn-danger btn-icon-split epapproveOk'></td><td><input type='button' value='반려 하기'class='btn btn-danger btn-icon-split epapproveNo'></td>";
				html+="</tr>";
				
				$('#Tableeplist').append(html);
				$('#ep_pageNum').text(pageNum);
			});
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
		}
	});
});

$('#ep_approveM').click(function(){
	var ep_pageNum=$('#ep_pageNum').text();
	var pageNum=parseInt(ep_pageNum)-1;
	var totalPageCount=$('#ep_totalPageCount').text();
	if(pageNum==0){
		pageNum=1;
	}
	$.ajax({
		url:'/admin/epapprovePage',
		dataType:'json',
		data : {pageNum , pageNum},
		success: function(data){
			$('#Tableeplist').empty();
			$(data.eplist).each(function(i,list){
				var html="";
				html+="<tr class='epappTr'>";
				html+="<td>"+list.memnum+"</td>";
				if(list.div_type==32){
					html+="<td>온라인 체험</td>";
				}else{
					html+="<td>대면 체험</td>";
				}
				html+="<td>"+list.subname+"</td>";
				html+="<td>"+list.title+"</td>";
				html+="	<input type='hidden' value="+list.hinum+" class='epapphinum'><input type='hidden' value="+list.div_type+" class='epappdivtype'><td><input type='button' value='상세 보기'class='btn btn-danger btn-icon-split epgetinfo'></td><td><input type='button' value='승인 완료'class='btn btn-danger btn-icon-split epapproveOk'></td><td><input type='button' value='반려 하기'class='btn btn-danger btn-icon-split epapproveNo'></td>";
				html+="</tr>";
				
				$('#Tableeplist').append(html);
				$('#ep_pageNum').text(pageNum);
			});
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
		}
	});
});


$('#hm_approveM').click(function(){
	var hm_pageNum=$('#hm_pageNum').text();
	
	
	var pageNum=parseInt(hm_pageNum)-1;
	
	
	if(pageNum==0){
		pageNum=1;
	}
	
	$.ajax({
		url:'/admin/hmapprovePage',
		dataType : 'json',
		data:{pageNum:pageNum},
		success:function(data){
			$('#Tablehmlist').empty();
			$(data.hmlist).each(function(i,list){
				var html="";
				html+="<tr>";
				html+="<td>"+list.hinum+"</td>";
				html+="<td>"+list.title+"</td>";
				html+="<td>"+list.addr+"</td>";
				html+="<td>"+list.price+"</td>";
				html+="<td><a href='/admin/approve/rnjOk?hinum="+list.hinum+"'><button type='button' class='btn btn-success'>승인</button></a></td>";
				html+="<td><a href='/admin/approve/rnjFail?hinum="+list.hinum+"'><button type='button' class='btn btn-danger'>거절</button></a></td>";
				
				html+="</tr>";
				$('#Tablehmlist').append(html);
			});
			$('#hm_pageNum').text(pageNum);
		}
	});
});


/* 숙소 페이징 */

$('#hm_approveP').click(function(){
	var hm_pageNum=$('#hm_pageNum').text();
	var pageNum=parseInt(hm_pageNum)+1;
	
	var hm_totalPageCount=$('#hm_totalPageCount').text();
	if(pageNum>hm_totalPageCount){
		pageNum=hm_totalPageCount
	}
	$.ajax({
		url:'/admin/hmapprovePage',
		dataType : 'json',
		data:{pageNum:pageNum},
		success:function(data){
			$('#Tablehmlist').empty();
			$(data.hmlist).each(function(i,list){
				var html="";
				html+="<tr>";
				html+="<td>"+list.hinum+"</td>";
				html+="<td>"+list.title+"</td>";
				html+="<td>"+list.addr+"</td>";
				html+="<td>"+list.price+"</td>";
				html+="<td><a href='/admin/approve/rnjOk?hinum="+list.hinum+"'><button type='button' class='btn btn-success'>승인</button></a></td>";
				html+="<td><a href='/admin/approve/rnjFail?hinum="+list.hinum+"'><button type='button' class='btn btn-danger'>거절</button></a></td>";
				
				html+="</tr>";
				$('#Tablehmlist').append(html);
			});
			$('#hm_pageNum').text(pageNum);
		}
	});
});







