$(function() {
  $('#team a').on('click', function(e) {
    e.preventDefault();

    var $targetParent = $(e.target).closest('li');
    var $modal = $targetParent.find('.modal');
    var $screen = $targetParent.find('.modal_screen');
    var $close = $targetParent.find('.close');

    if ($close.get(0) === e.target) {
      $screen.fadeOut();
      $modal.fadeOut();
    } else {
      $modal.fadeIn();
      $modal.css('top', $(window).scrollTop() + 150);
      $screen.fadeIn();
    }
  });

  $('.modal_screen').on('click', function(e) {
    var $screen = $(e.currentTarget);
    var $modal = $screen.prev();

    $screen.fadeOut();
    $modal.fadeOut();
  });
});
