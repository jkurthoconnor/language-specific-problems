$(function () {
  var defaultDelay = 1000;
  var $blinds = $('[id^=blind]');

  $blinds.each(function(idx) {
    var self = this;

    setTimeout(function() {
      $(self).fadeOut('slow');
    }, idx * defaultDelay);
  });
});
