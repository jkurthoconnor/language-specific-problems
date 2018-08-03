$(function() {
  var $mainHeader = $('body > header');
  var $chinStickImg = $('img[src$="stick.jpg"]');
  var $chinStickParent = $chinStickImg.parent();
  var $babyMopImg = $('img[src$="mop.jpg"]');
  var $babyMopParent = $babyMopImg.parent();

  $mainHeader.prepend( $('main > h1'));
  $('body').prepend($mainHeader);

  $chinStickParent.prepend($babyMopImg);
  $babyMopParent.prepend($chinStickImg);

  $('article').append($babyMopParent, $chinStickParent);
});
