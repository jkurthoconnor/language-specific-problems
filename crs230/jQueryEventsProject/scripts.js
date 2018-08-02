$(function() {
  $('form').on('submit', function(event) {
    event.preventDefault();
    var charCode = $('#key').val().charCodeAt(0);

    $(document).off('keypress').on('keypress', function(event) {
      if (event.which !== charCode) {
        return;
      }

      $('a').trigger('click');
    });
  });

  $('a').on('click', function(event) {
    event.preventDefault();
    $('#accordion').slideToggle();
  });
});
