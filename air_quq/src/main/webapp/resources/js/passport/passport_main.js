$("#searchPassport2").click(function () {
   new daum.Postcode({
      oncomplete: function (data) {
         // console.log(data);
      },

      onsearch: function (data) {
         // console.log(data);
         $("#searchPassport2").val(data.q);
      }
   }).open();
});


