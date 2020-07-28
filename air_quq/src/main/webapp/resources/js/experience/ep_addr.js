/**
 * 
 */
$('#ep_searchPassport').click(function() {
	
	
	new daum.Postcode({
		oncomplete : function(data) {
			var ep_addr = data.roadAddress;
			$("#ep_info_loc").val(ep_addr);
			searchKeyword(ep_addr);
		}
	}).open();
});
$('#ep_info_loc').click(function() {
	new daum.Postcode({
		oncomplete : function(data) {
			var ep_addr = data.roadAddress;
			$("#ep_info_loc").val(ep_addr);
			searchKeyword(ep_addr);
		}
	}).open();
});

var geocoder = new kakao.maps.services.Geocoder();

function searchKeyword(ep_addr){
	//주소로 좌표를 검색합니다
		geocoder.addressSearch(ep_addr, function(result, status) {
			
			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				console.log("위도 : " + result[0].y);
				console.log("경도 : " + result[0].x);
				
				$('#ep_loc_up').val(result[0].y);
				$('#ep_loc_down').val(result[0].x);
				
			} 
		});   
		
	}