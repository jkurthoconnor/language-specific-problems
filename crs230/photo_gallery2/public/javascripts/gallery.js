$(document).ready(function() {
  var templateFuncs = {};

  $('script[type$="handlebars"]').each(function() {
    var $script = $(this);

    templateFuncs[$script.attr('id')] = Handlebars.compile($script.html());
  });

  Handlebars.registerPartial('comment', templateFuncs.comment);

  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/photos',
  })
  .done(function(json) {

    $('#slides').append(templateFuncs.photos( {photos: json} ));
    $('section > header').append(templateFuncs.photo_information(json[0]));
  });
});
