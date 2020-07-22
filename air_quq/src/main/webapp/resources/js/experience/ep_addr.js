/**
 * 
 */
$("#ep_searchPassport").click(function() {
	new daum.Postcode({
		oncomplete : function(data) {
			var ep_addr = data.address + " " + data.buildingName
			$("#ep_info_loc").val(ep_addr);
		}
	}).open();
});
$("#ep_info_loc").click(function() {
	new daum.Postcode({
		oncomplete : function(data) {
			var ep_addr = data.address + " " + data.buildingName
			$("#ep_info_loc").val(ep_addr);
		}
	}).open();
});