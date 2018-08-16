$(document).ready(function() {
  var templateFuncs = {};
  var photosJSON;
  var currentPhoto;

  function renderPhoto() {
    $('#slides').append(templateFuncs.photos( {photos: photosJSON} ));
  }

  function renderInfo(photo) {
    $('section > header').html(templateFuncs.photo_information(photo));
  }

  function renderComments(commentJSON) {
    $('#comments ul').html(templateFuncs.comments( {comments: commentJSON } ));
  }

  $('script[type$="handlebars"]').each(function() {
    var $script = $(this);
    var name = $script.attr('id');

    templateFuncs[name] = Handlebars.compile($script.html());
  });

  $('script[data-type="partial"]').each(function() { 
    var $script = $(this);
    var name = $script.attr('id');

    Handlebars.registerPartial(name, templateFuncs[name]);
  });

  function renderPage() {
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/photos',
    })
    .done(function(json) {
      photosJSON = json;
      currentPhoto = photosJSON[0];

      renderPhoto();
      renderInfo(currentPhoto);

      $.ajax({
        dataType: 'json',
        type: 'get',
        url: '/comments',
        data: {
          photo_id: currentPhoto.id,
        },
      })
      .done(function(json) {
        renderComments(json);


        $('#slideshow a').on('click', function(e) {
          e.preventDefault();
          var $slides = $('#slides figure');

          if ($(e.target).hasClass('next')) {
            $slides.first().fadeOut(500, function () {
              $('#slides').append($slides.first());
              $('#slides figure').first().hide().fadeIn(500);
            });
          } else {
            $slides.first().fadeOut(500, function () {
              $('#slides').prepend($slides.last());
              $('#slides figure').first().fadeIn(500);
            });
          }

          $slides = $('#slides figure');

          currentPhoto = photosJSON.filter(function(photo) {
            return photo.id === Number($slides.first().attr('data-id'));
          })[0];

          renderInfo(currentPhoto);

          $.ajax({
            dataType: 'json',
            type: 'get',
            url: '/comments',
            data: {
              photo_id: currentPhoto.id,
            },
          })
          .done(function(json) {
            renderComments(json);
          });
        });


      });
    });
  }

  renderPage();
});
