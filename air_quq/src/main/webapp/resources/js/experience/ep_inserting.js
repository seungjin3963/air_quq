/**
 * 
 */

/*$('.actionA').click(function() {
	document.ManagementFrom.action = "/ep_list.do";
	var index = $('.actionA').index(this);
	document.ManagementFrom[index].submit();
});*/

/*$('.actionB').click(function() {
	document.ManagementFrom.action = "/ep_management/ep_delete";
	var index = $('.actionB').index(this);
	document.ManagementFrom[index].submit();
});
*/
$('.actionA').click(function(event) {

	var index = $('.actionA').index(this);
	console.log(index);
	console.log("Aaaaa");
	var Management = document.getElementsByName("ManagementFrom")[index];         
	Management.action="/ep_management/ep_list";
	Management.submit();
});

$('.actionB').click(function(event) {

	var index =$('.actionB').index(this);
	console.log(index);
	var Management = document.getElementsByName("ManagementFrom")[index];
	Management.action="/ep_management/ep_delete";
	Management.submit();
});