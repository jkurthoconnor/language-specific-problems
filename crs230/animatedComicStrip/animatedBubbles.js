$(function () {
  var speed = 250;
  var defaultDelay = 1500;
  var $blinds = $('[id^=blind]');

  $blinds.each(function(idx) {
    var props = {
      height: 0,
      top: parseInt($(this).css('top'), 10) + parseInt($(this).css('height'), 10),
    }

    $(this).delay(idx * defaultDelay).animate(props, speed);
  });
});

