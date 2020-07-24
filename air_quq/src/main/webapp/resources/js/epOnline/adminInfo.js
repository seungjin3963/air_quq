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
	$("#nav-tab").on('show.bs.tab',(event)=>{
		console.log("변경");
		console.log("사용자 "
				+$("#nav-tab a:nth-child(1)").attr('aria-selected')+",,"+$("#nav-tab a:nth-child(1)").attr('href')+","+$("#nav-tab a:nth-child(1)").attr('aria-controls')
				+"호스트,"+$("#nav-tab a:nth-child(2)").attr('aria-selected')+",,"+$("#nav-tab a:nth-child(2)").attr('href')+","+$("#nav-tab a:nth-child(2)").attr('aria-controls'));
		var user=$("#nav-tab a:nth-child(1)").attr('href');
		var host=$("#nav-tab a:nth-child(2)").attr('href');
		if(host=='#nav-profile'){//호스트
			$.ajax({
				url:"/admin/nav",
				dataType: "json",
				data:{"div":1},
				success: function(data){
					console.log(data.div+": div, change :"+data.change+"이건  ajax호스트")
				}
			})
		}else if(user=='#nav-home'){//사용자
			$.ajax({
				url:"/admin/nav",
				data:{"div":2},
				success: function(data){
					console.log(data.div+": div, change :"+data.change +"이건  ajax사용자")
					$("nav-tab a:nth-child(2)").click();
					console.log(data.pu.startPageNum+"start, end: "+data.pu.endPageNum);
				}
			})
		}
	})
//	$("#paging ,#nav-tab").children('a').on("click",function(){
//		console.log('들어왔습니다.')
//		var user=$("#nav-tab a:nth-child(1)").attr('href');
//		var host=$("#nav-tab a:nth-child(2)").attr('href');
//		var href=$("#nav-tab").children().attr('href');
//		console.log("사용자 "
//				+$("#nav-tab a:nth-child(1)").attr('aria-selected')+",,"+$("#nav-tab a:nth-child(1)").attr('href')+","+$("#nav-tab a:nth-child(1)").attr('aria-controls')
//				+"호스트,"+$("#nav-tab a:nth-child(2)").attr('aria-selected')+",,"+$("#nav-tab a:nth-child(2)").attr('href')+","+$("#nav-tab a:nth-child(2)").attr('aria-controls'));
//		if(host=='#nav-profile'){//호스트
//			$.ajax({
//				url:"/admin/nav",
//				dataType: "json",
//				data:{"div":1},
//				success: function(data){
//					console.log(data.div+": div, change :"+data.change+"이건  ajax호스트")
//				}
//			})
//		}else if(user=='#nav-home'){//사용자
//			$.ajax({
//				url:"/admin/nav",
//				data:{"div":2},
//				success: function(data){
//					console.log(data.div+": div, change :"+data.change +"이건  ajax사용자")
//					$("nav-tab a:nth-child(2)").click();
//					console.log(data.pu.startPageNum+"start, end: "+data.pu.endPageNum);
//				}
//			})
//		}
//	})
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
