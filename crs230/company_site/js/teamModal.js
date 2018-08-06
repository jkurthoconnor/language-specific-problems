$(function() {
  $('#team li > a').on('click', function(e) {
    e.preventDefault();

    var $targetParent = $(e.target).parent();
    var $modal = $targetParent.find('.modal');
    var $screen = $targetParent.find('.modal_screen');

    $modal.css('top', $(window).scrollTop() + 150);
    $modal.fadeIn();
    $screen.fadeIn();
  });

  $('.close').on('click', function(e) {
    e.preventDefault();

    var $modal = $(e.currentTarget).parent();
    var $screen = $modal.next();

    $screen.fadeOut();
    $modal.fadeOut();
  });

  $('.modal_screen').on('click', function(e) {
    var $screen = $(e.currentTarget);
    var $modal = $screen.prev();

    $screen.fadeOut();
    $modal.fadeOut();
  });
});
