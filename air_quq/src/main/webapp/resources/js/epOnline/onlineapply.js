/**
 * 
 */
$('.PeopleBtnP').click(function(){
	var count=$('#PeopleSpan').text();
	var val=parseInt(count)+1;
	var price=$('#experiecePrice').text();
	var people=$('#MaxPeople').text();
	if(people<val){
		alert("최대 인원수 입니다");
		return;
	}
	
	$('#PeopleSpan').text(val);
	$('#PriceSpan').text(parseInt(price)*val);
});
$('.PeopleBtnM').click(function(){
	var count=$('#PeopleSpan').text();
	var val=count-1;
	var price=$('#experiecePrice').text();
	if(val==0){
		val=1;
	}
	
	$('#PeopleSpan').text(val);
	$('#PriceSpan').text(parseInt(price)*val);
});