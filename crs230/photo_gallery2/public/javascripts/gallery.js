$(document).ready(function() {

  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/photos',
  })
  .done(function(json) {
    var photosTemplate = $('#photos').html();
    var photoInfoTemplate = $('#photo_information').html();
    var photosTemplateScript = Handlebars.compile(photosTemplate);
    var photoInfoTemplateScript = Handlebars.compile(photoInfoTemplate);

    $('#slides').append(photosTemplateScript( {photos: json} ));
    $('section > header').append(photoInfoTemplateScript(json[0]));

    console.log(json[0]);
  });

});
