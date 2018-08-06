$(function() {
  $('#team a').on('click', function(e) {
    e.preventDefault();

    var $targetParent = $(e.target).closest('li');
    var $memberModal = $targetParent.find('.modal');
    var $memberScreen = $targetParent.find('.modal_layer');
    var $close = $targetParent.find('.close');

    if ($close.get(0) === e.target) {
      $memberModal.css('display', 'none');
      $memberScreen.css('display', 'none');
    } else {
      $memberModal.css('display', 'block');
      $memberScreen.css('display', 'block');
    }
  });

  $('.modal_layer').on('click', function(e) {
    var $screen = $(e.currentTarget);
    var $modal = $screen.prev();

    $screen.css('display', 'none');
    $modal.css('display', 'none');
  });
});
