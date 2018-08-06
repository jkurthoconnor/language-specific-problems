$(function() {
  $('#team a').on('click', function(e) {
    e.preventDefault();

    var $memberLi = $(e.target).parent();
    var $memberModal = $memberLi.find('.modal');
    var $memberScreen = $memberLi.find('.modal_layer');

    $memberModal.css('display', 'block');
    $memberScreen.css('display', 'block');
  });


});
