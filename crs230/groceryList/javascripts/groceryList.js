$(document).ready(function() {
  var $ul = $('ul');

  $('form').on('submit', function(e) {
    e.preventDefault();

    var item = $('#name').val();
    var quantity = $('#quantity').val() || '1';

    $ul.append(`<li>${quantity} ${item}</li>`);
    $('form').get(0).reset();
  });
});
