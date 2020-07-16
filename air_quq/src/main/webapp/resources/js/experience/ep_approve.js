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
		data : {hinum:hinum},
		success:function(data){
			
			 $('#epappmodal').modal('show');
		}
	});
});
$("#aa").click(func)