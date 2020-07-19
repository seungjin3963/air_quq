$("#searchDetail").click(function () {
   new daum.Postcode({
      oncomplete: function (data) {
         // console.log(data);
    	  var roadAddr = data.roadAddress;
    	  var zipcode = data.zonecode;
    	  console.log(zipcode);
    	  $("#roadAddr").val(roadAddr);
    	  $("#zipcode").val(zipcode);
      },

      onsearch: function (data) {
//          console.log(data);
         $("#searchDetail").val(data.q);
      }
   }).open();
});


