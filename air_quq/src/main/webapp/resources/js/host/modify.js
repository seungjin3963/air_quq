Date.prototype.toDateInputValue = (function() {
    var local = new Date(this);
    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
    return local.toJSON().slice(0,10);
});

let today = new Date().toDateInputValue();
$("input[type='date']").val(today);
$("input[type='date']").prop("min", today);

