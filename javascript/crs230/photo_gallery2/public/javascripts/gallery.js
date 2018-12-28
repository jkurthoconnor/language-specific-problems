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

  function fetchComments() {
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/comments',
      data: {
        photo_id: currentPhoto.id,
      },
      success: function(json) { 
        renderComments(json);
      },
    })
  }

  function renderComments(commentJSON) {
    $('#comments ul').html(templateFuncs.comments( {comments: commentJSON } ));
  }

  function registerEvents() {
    $('#slideshow a').on('click', function(e) {
      e.preventDefault();
      var $candidate;
      var $displayNext;
      var $slides = $('#slides figure');
      var $currentDisplay = $slides.find('img:visible').parent();

      if ($(this).hasClass('next')) {
        $candidate = $currentDisplay.next();
        $displayNext = $candidate.length ? $candidate : $slides.first();
      } else {
        $candidate = $currentDisplay.prev();
        $displayNext = $candidate.length ? $candidate : $slides.last();
      }

      $currentDisplay.fadeOut(500);
      $displayNext.fadeIn(500);

      currentPhoto = photosJSON.filter(function(photo) {
        return photo.id === Number($displayNext.attr('data-id'));
      })[0];

      renderInfo(currentPhoto);
      fetchComments();
      console.table(currentPhoto);
      $('input[type="hidden"]').attr('value', String(currentPhoto.id));
    });

    $('section > header').on('click', 'a', function(e) {
      e.preventDefault();
      var id = $(this).attr('data-id'); 
      var $currentLink = $(this);
      var $currentLinkText = $(this).text();
      var currentPhotoId = $('#slideshow figure:visible').attr('data-id');

      currentPhoto = photosJSON.filter(function(photo) {
        return photo.id === Number(currentPhotoId);
      })[0];

      $.ajax({
        type: 'post',
        url: $(this).attr('href'),
        data: {
          photo_id: id,
        },
        dataType: 'json',
        success: function(json) {
          $currentLink.text($currentLinkText.replace(/\d+/g, json.total));
          currentPhoto[$currentLink.attr('data-property')] = json.total;
        },
      });
    });

    $('#comments form').on('submit', function(e) {
      e.preventDefault();
      var $form = $(this);

      $.ajax({
        type: $form.attr('method'),
        url:  $form.attr('action'),
        data: $form.serialize(),
        dataType: 'json',
        success: function(json) {
          var commentHTML = templateFuncs.comment(json);
          $('#comments ul').append(commentHTML);
          $('form')[0].reset();
        },
      });
    });
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
      fetchComments();

      registerEvents();
    });
  }

  renderPage();
});
