$(document).ready(function() {

  $('form').on('submit', function(e) {
    e.preventDefault();

    var item = $('#name').val();
    var quantity = $('#quantity').val() || '1';
    var newLi = document.createElement('LI');

    newLi.textContent = `${quantity} ${item}`;
    $('ul').get(0).appendChild(newLi);
    $('form').get(0).reset();
  });

});
