$(function() {
  $('#team a').on('click', function(e) {
    e.preventDefault();

    var $targetParent = $(e.target).closest('li');
    var $modal = $targetParent.find('.modal');
    var $screen = $targetParent.find('.modal_screen');
    var $close = $targetParent.find('.close');

    if ($close.get(0) === e.target) {
      $modal.css('display', 'none');
      $screen.css('display', 'none');
    } else {
      $modal.css('display', 'block');
      $modal.css('top', $(window).scrollTop() + 150);
      $screen.css('display', 'block');
    }
  });

  $('.modal_screen').on('click', function(e) {
    var $screen = $(e.currentTarget);
    var $modal = $screen.prev();

    $screen.css('display', 'none');
    $modal.css('display', 'none');
  });
});
