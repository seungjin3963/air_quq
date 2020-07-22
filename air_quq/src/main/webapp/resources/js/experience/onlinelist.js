/**
 * 
 */
$('#Ep_regdateBtnP').click(function(){
	$.ajax({
		url : '/ep_regdate',
		dataType : 'json',
		success : function(data){	
			
			alert(data.mater);
		},
		error: function(err){
			alert(err);
		}
	});
})