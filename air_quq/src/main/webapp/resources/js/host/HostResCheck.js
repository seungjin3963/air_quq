/**
 * 
 */

$(function() {
		$("#tabs").tabs();
	});

$('.HostCheckdiv').on('mouseover',function(event){
	$(this).css('backgroundColor' , '#858796');
	
});
$('.HostCheckdiv').on('mouseout',function(event){
	$(this).css('backgroundColor' , '#f8f9fc');
	$(this).css('border' , '0px');
})

$('.HostCheckdiv').click(function(){
	var index=$('.HostCheckdiv').index(this);
	var hinum=$('.ResRentHinum').eq(index).val();
	$.ajax({
		url:'/host/ResPeople',
		dataType: 'json',
		data:{hinum:hinum},
		success:function(data){
			$('#resTable tbody').empty();
			$(data.ResVo).each(function(i,list){
				var html = '';
				html += '<tr>';
				html += '<td>'+list.menum+'</td>';
				html += '<td>'+list.person+'</td>';
				html += '<td>'+list.pay_price+' 원</td>';
				if(list.status==1){
					list.status='결제';
				}else{
					list.status='미 결제';
				}
				html += '<td>'+list.status+'</td>';
				html += '<td>'+list.startrent+'~'+list.endrent+'</td>';
				
				if(list.check==1){
					html += "<td style='color:red'>신규 예약</td>";
				}
				html += '</tr>';
				html += "<input type='hidden' value="+list.hinum+" id='reshinumTr'";
				//$('.ResListModalTable').append("<tr><td>"+list.menum+"</td><td>"+list.person+"</td><td>"+list.pay_price+"</td><td>"+list.status+"</td><td>"+list.startrent+"~"+list.endrent+"</td></tr>")
				$('#resTable tbody').append(html);
			});
			
			
			$('#ResListModal').modal('show');
			
		},
		error:function(err){
			alert(err);
		}
		
	});
});


$('#ResTableBtn').click(function(){
	var hinum= $('#reshinumTr').val();
	$.ajax({
		url : '/host/ResCheckUpate',
		dataType: 'json',
		data : {hinum:hinum},
		success : function(data){
			$('#ResListModal').modal('hide');
			$('.ResappendLIst').empty();
			$(data.ResListE).each(function(i,list){
				if(list.count>0){
					var html="";
					html += "<div class='col-md-2 HostCheckdiv'>";
					html += "<input type='hidden' value="+list.hinum+" class='ResRentHinum'>";
					 if(list.checkNum!=0){
						 html +="<span class='badge badge-danger badge-counter spanbadge'>예약<br>확인</span>";
					 }
					 html +="<img src='/resources/img/house_img/"+list.img+"' class='HostResCheckImg'><br> "+list.subname+" <br> <br>";
					 html +="<h5>"+list.title+"</h5> 1인당 ￦"+list.price+"원 부터_"+list.times+" 시간<br> 별점";
					html += "</div>"
				}
			
				$('.ResappendLIst').append(html);
			});
			$('.HostCheckdiv').on('mouseover',function(event){
				$(this).css('backgroundColor' , '#858796');
				
			});
			$('.HostCheckdiv').on('mouseout',function(event){
				$(this).css('backgroundColor' , '#f8f9fc');
				$(this).css('border' , '0px');
			});
			$('.HostCheckdiv').click(function(){
				var index=$('.HostCheckdiv').index(this);
				var hinum=$('.ResRentHinum').eq(index).val();
				$.ajax({
					url:'/host/ResPeople',
					dataType: 'json',
					data:{hinum:hinum},
					success:function(data){
						$('#resTable tbody').empty();
						$(data.ResVo).each(function(i,list){
							var html = '';
							html += '<tr>';
							html += '<td>'+list.menum+'</td>';
							html += '<td>'+list.person+'</td>';
							html += '<td>'+list.pay_price+' 원</td>';
							if(list.status==1){
								list.status='결제';
							}else{
								list.status='미 결제';
							}
							html += '<td>'+list.status+'</td>';
							html += '<td>'+list.startrent+'~'+list.endrent+'</td>';
							
							if(list.check==1){
								html += "<td style='color:red'>신규 예약</td>";
							}
							html += '</tr>';
							html += "<input type='hidden' value="+list.hinum+" id='reshinumTr'";
							//$('.ResListModalTable').append("<tr><td>"+list.menum+"</td><td>"+list.person+"</td><td>"+list.pay_price+"</td><td>"+list.status+"</td><td>"+list.startrent+"~"+list.endrent+"</td></tr>")
							$('#resTable tbody').append(html);
						});
						
						
						$('#ResListModal').modal('show');
						
					},
					error:function(err){
						alert(err);
					}
					
				});
			});
		},
		error : function(err){
			alert(err);
		}
	});
});








$('.HostCheckdivHouse').on('mouseover',function(event){
	$(this).css('backgroundColor' , '#858796');
	
});
$('.HostCheckdivHouse').on('mouseout',function(event){
	$(this).css('backgroundColor' , '#f8f9fc');
	$(this).css('border' , '0px');
});

$('.HostCheckdivHouse').click(function(){
	var index=$('.HostCheckdivHouse').index(this);
	var hinum=$('.ResRentHinumHouse').eq(index).val();
	$.ajax({
		url:'/host/ResPeople',
		dataType: 'json',
		data:{hinum:hinum},
		success:function(data){
			
			$('#resTableHouse tbody').empty();
			$(data.ResVo).each(function(i,list){
				var html = '';
				html += '<tr>';
				html += '<td>'+list.menum+'</td>';
				html += '<td>'+list.person+'</td>';
				html += '<td>'+list.pay_price+' 원</td>';
				if(list.status==1){
					list.status='결제';
				}else{
					list.status='미 결제';
				}
				html += '<td>'+list.status+'</td>';
				html += '<td>'+list.startrent+'~'+list.endrent+'</td>';
				
				if(list.check==1){
					html += "<td style='color:red'>신규 예약</td>";
				}
				html += '</tr>';
				html += "<input type='hidden' value="+list.hinum+" id='reshinumTrHouse'";
				$('#resTableHouse tbody').append(html);
			});
			
			
			$('#ResListModalHouse').modal('show');
			
		},
		error:function(err){
			alert(err);
		}
		
	});
});
$('#ResTableBtnHouse').click(function(){
	var hinum= $('#reshinumTrHouse').val();
	$.ajax({
		url :'/host/ResCheckUpateHouse',
		dataType:'json',
		data:{hinum:hinum},
		success:function(data){
			$('#ResListModalHouse').modal('hide');
			$('.ResappendLIstHouse').empty();
			$(data.ResListH).each(function(i,list){
				if(list.count>0){
					var html="";
					html += "<div class='col-md-2 HostCheckdivHouse'>";
					html += "<input type='hidden' value="+list.hinum+" class='ResRentHinumHouse'>";
					 if(list.checkNum!=0){
						 html +="<span class='badge badge-danger badge-counter spanbadge'>예약<br>확인</span>";
					 }
					 html +="<img src='/resources/img/house_img/"+list.img+"' class='HostResCheckImg'><br> ";
					 html +="<h5>"+list.title+"</h5> 1인당 ￦"+list.price+" 원<br> 별점";
					html += "</div>"
				}
			
				$('.ResappendLIstHouse').append(html);
			});
			$('.HostCheckdivHouse').on('mouseover',function(event){
				$(this).css('backgroundColor' , '#858796');
				
			});
			$('.HostCheckdivHouse').on('mouseout',function(event){
				$(this).css('backgroundColor' , '#f8f9fc');
				$(this).css('border' , '0px');
			});

			$('.HostCheckdivHouse').click(function(){
				var index=$('.HostCheckdivHouse').index(this);
				var hinum=$('.ResRentHinumHouse').eq(index).val();
				$.ajax({
					url:'/host/ResPeople',
					dataType: 'json',
					data:{hinum:hinum},
					success:function(data){
						
						$('#resTableHouse tbody').empty();
						$(data.ResVo).each(function(i,list){
							var html = '';
							html += '<tr>';
							html += '<td>'+list.menum+'</td>';
							html += '<td>'+list.person+'</td>';
							html += '<td>'+list.pay_price+' 원</td>';
							if(list.status==1){
								list.status='결제';
							}else{
								list.status='미 결제';
							}
							html += '<td>'+list.status+'</td>';
							html += '<td>'+list.startrent+'~'+list.endrent+'</td>';
							
							if(list.check==1){
								html += "<td style='color:red'>신규 예약</td>";
							}
							html += '</tr>';
							html += "<input type='hidden' value="+list.hinum+" id='reshinumTrHouse'";
							$('#resTableHouse tbody').append(html);
						});
						
						
						$('#ResListModalHouse').modal('show');
						
					},
					error:function(err){
						alert(err);
					}
					
				});
			});
		},
		error:function(err){
			alert(err);
		}
	});
});


