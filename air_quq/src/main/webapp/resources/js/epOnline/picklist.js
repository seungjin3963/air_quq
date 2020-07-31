/**
 * 
 */

$(function() {
		$("#tabs").tabs();
	});


$('.onlineMypick2').click(function(){
	var num=2;
	var index=$('.onlineMypick2').index(this);
	
	$(this).css('display' , 'none');
	
	$('.onlineMypick1').eq(index).css('display' , 'block');
	
	var hinum=$('.ResRentHinum').eq(index).val();
	$.ajax({
		url : '/onlinePick',
		dataType:'json',
		data : {hinum:hinum , num:num},
		success : function(data){
			alert(data.success);
		}
	});
	
});

$('.onlineMypick1').click(function(){
	var num=1;
	var index=$('.onlineMypick1').index(this);
	
	$(this).css('display' , 'none');
	
	$('.onlineMypick2').eq(index).css('display' , 'block');
	
	var hinum=$('.ResRentHinum').eq(index).val();
	
	$.ajax({
		url : '/onlinePick',
		dataType:'json',
		data : {hinum:hinum , num:num},
		success : function(data){
			alert(data.success);
		}
	});
	
});