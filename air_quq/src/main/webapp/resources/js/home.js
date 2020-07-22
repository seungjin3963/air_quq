/**
 * 
 */
$(".adultBtnP").click(function(){
	var value=$('#adultCount').text()
	var inputvalue=$('.eptotalPeople').val();
	if(inputvalue==null || inputvalue==0){
		inputvalue=0;
	}
	$('.eptotalPeople').val("  " + (parseInt(inputvalue)+1)+"  명");
	$('#adultCount').html(parseInt(value)+1);
	
});
$(".adultBtnM").click(function(){
	var value=$('#adultCount').text()
	var inputvalue=$('.eptotalPeople').val();
	if(value==0){
		return;
	}
	$('.eptotalPeople').val("  " + (parseInt(inputvalue)-1)+"  명");
	$('#adultCount').html(value-1);
});

$(".childBtnP").click(function(){
	var value=$('#childCount').text()
	var inputvalue=$('.eptotalPeople').val();
	if(inputvalue==null || inputvalue==0){
		inputvalue=0;
	}
	$('.eptotalPeople').val("  " + (parseInt(inputvalue)+1)+"  명");
	$('#childCount').html(parseInt(value)+1);
});
$(".childBtnM").click(function(){
	var value=$('#childCount').text();
	var inputvalue=$('.eptotalPeople').val();
	if(value==0){
		return;
	}
	$('.eptotalPeople').val("  " + (parseInt(inputvalue)-1)+"  명");
	$('#childCount').html(value-1);
});