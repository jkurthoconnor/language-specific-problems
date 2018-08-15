$(document).ready(function() {

  $.ajax({
    dataType: 'json',
    type: 'get',
    url: '/photos',
  })
  .done(function(json) {
    console.log(json);
  });

});
