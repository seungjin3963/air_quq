$(function(){
	$("input[name='keyword']").keyup(function() {
		var field=$("select[name='field']").val();
		var keyword=$("input[name='keyword']").val();
		var div=nav($("#nav-home-tab").attr('class'),$("#nav-profile-tab").attr('class'));
//		console.log("div : "+div +" field : "+field +" keyword :"+keyword);
		$.ajax({
			url: "/admin/search",
			data:{"keyword":keyword,"field":field,"div":div},
			success: function(data){
				$.each(data, function(i) {
					console.log(data.key +" : key ," +data.value +" : value");
				})
			}
		})
	})
//	$("#nav-tab").children('a').on("click",function(){
//		console.log('눌렀습니다');
//	})
	$("#paging ,#nav-tab").children('a').on("click",function(){
		console.log('들어왔습니다.')
		var active=$("#nav-tab").children('a').attr('class')=='nav-item nav-link active';
		console.log(active);
//		var text=active.text();
		if(active==false){//호스트
			$.ajax({
				url:"/admin/nav",
				dataType: "json",
				data:{"div":1},
				success: function(data){
					console.log(data.div+": div, change :"+data.change)
				}
			})
		}else if(active==true){//사용자
			$.ajax({
				url:"/admin/nav",
				data:{"div":2},
				success: function(data){
					console.log(data.div+": div, change :"+data.change)
					$("nav-tab a:nth-child(2)").click();
					console.log(data.pu.startPageNum+"start, end: "+data.pu.endPageNum);
				}
			})
		}
	})
})

//nav tab구분		
function nav(first,second){
	var div=0;
	if(first=='nav-item nav-link active'){
		div=1;
	}else if(second=='nav-item nav-link active'){
		div=2;
	}
	return div;
}	
