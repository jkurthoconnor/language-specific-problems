$(function() {

  function makeShape(data) {
    var $shape = $('<div class=' + data.shape_type + '></div>');

    Object.keys(data).forEach(function(key) {
      if (key !== 'shape_type') {
        $shape.attr('data-' + key, data[key] + 'px');
      }
    });

    return $shape;
  }

  function positionToStart($element) {
    $element.css('top', $element.attr('data-start_x'));
    $element.css('left', $element.attr('data-start_y'));
  }

  $('form').on('submit', function(e) {
    e.preventDefault();

    var $shape;
    var dataObj = {};

    $(this).serializeArray().forEach(function(inputField) {
      dataObj[inputField.name] = inputField.value;
    });

    $shape = makeShape(dataObj);
    positionToStart($shape);
    $('#canvas').append($shape)
  });

  $('#animate').on('click', function(e) {
    e.preventDefault();

    var $shapes = $('#canvas > div');

    $shapes.each(function() {
      var duration = parseInt($(this).attr('data-duration')) || 400;
      var endPoints = {
        top: $(this).attr('data-end_x'),
        left: $(this).attr('data-end_y'),
      }

      $(this).stop;
      positionToStart($(this));
      $(this).animate(endPoints, duration);
    });
  });

  $('#stop').on('click', function(e) {
    e.preventDefault();

    $('#canvas > div').finish();
  });
});
