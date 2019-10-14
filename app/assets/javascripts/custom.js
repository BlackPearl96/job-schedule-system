$(document).ready(function() {
  $('.js-example-basic-single').select2({
    placeholder: "Select a channel",
    tags: true
  });

  $('#search').autocomplete({
      source: '/auto_fill_text/autocomplete',
      select: function(event, ui){
        $('#search').val(ui.item.value);
        $(this).closest('form').trigger('submit');
      }
  });

  $("#search_user").autocomplete({
        source: '/auto_fill_text/getusers',
        focus: function(event, ui) {
          event.preventDefault();
          $(this).val(ui.item.label);
        },
        select: function(event, ui) {
          event.preventDefault();
          $(this).val(ui.item.label);
          $("#user_id").val(ui.item.value);
        }
      });
});
