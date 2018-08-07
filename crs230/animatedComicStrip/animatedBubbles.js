$(function () {
  var speed = 250;
  var defaultDelay = 1500;
  var $blinds = $('[id^=blind]');

  $blinds.each(function(idx) {
    $(this).delay(idx * defaultDelay).slideUp(speed);
  });
});

