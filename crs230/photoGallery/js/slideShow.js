$(document).ready(function(e) {
  var $mainImg = $('figure > img');
  var $thumbnails = $('li > img');
  var $current = $thumbnails.filter('.active');

  $thumbnails.on('click', function(e) {

    $current.removeClass('active');
    $(e.target).addClass('active'); 
    $current = $thumbnails.filter('.active');

    $mainImg.fadeOut(300);
    setTimeout(function() {
      $mainImg.attr('src', $current.attr('src'));
    }, 300);
    $mainImg.fadeIn(900);
  });
});
