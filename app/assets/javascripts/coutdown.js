var countdown = function() {
  $('#clock').countdown({
    until: $('#remaining_time').val(),
    format: 'HMS',
    onExpiry: function() {
      alert("Time out. Please press the stop working button");
      $('#clock').hide();
    }
  });
}
$(document).ready(function(){
  countdown();
});

$(document).on('page:update', countdown);
