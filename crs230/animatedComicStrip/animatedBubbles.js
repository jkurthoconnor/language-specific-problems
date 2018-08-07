$(function () {

  var $blinds = $('[id^=blind]');

  function showText() {
    var speed = 250;
    var defaultDelay = 1500;

    $blinds.each(function(idx) {
      var props = {
        height: 0,
        top: parseInt($(this).css('top'), 10) + parseInt($(this).css('height'), 10),
      }

      $(this).delay(idx * defaultDelay).animate(props, speed);
    });
  }

  showText();

  $('p a').on('click', function(e) {
    e.preventDefault();

    $blinds.each(function() {
      $(this).attr('style', '');
    });

    showText();
  });
});

