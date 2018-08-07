$(function() {

  function validNumber(n) {
    var oddTotal = 0;
    var evenTotal = 0;
    var validPattern = /^\d{16}$/;
    var ccNumber = n.split('').reverse();


    if (!validPattern.test(ccNumber.join(''))) { return false }

    for (var i = 0, len = ccNumber.length; i < len; i++) {
      if (i % 2 == 1) {
        ccNumber[i] = (+ccNumber[i] * 2) + '';
        if (ccNumber[i].length > 1) {
          ccNumber[i] = +ccNumber[i][0] + +ccNumber[i][1];
        }
        else {
          ccNumber[i] = +ccNumber[i];
        }
        oddTotal += ccNumber[i];
      }
      else {
        evenTotal += +ccNumber[i];
      }
    }

    return oddTotal + evenTotal % 10 == 0;
  };

  $('nav a').on('mouseenter', function() {
    $(this).next('ul').addClass('opened');
  });

  $('nav').on('mouseleave', function() {
    $(this).find('ul ul').removeClass('opened');
  });

  $('button, .button').on('click', function(e) {
    e.preventDefault();
    $(e.target).addClass('clicked');
  });

  $('.toggle').on('click', function(e) {
    e.preventDefault();

    $(this).next('.accordion').toggleClass('opened');
  });

  $('form').on('submit', function(e) {
    e.preventDefault();

    var $success = $(this).find('.success');
    var $error = $(this).find('.error')
    var ccNumber = $(this).find('[type=text]').val();

    $success.removeClass('opened');
    $error.removeClass('opened');

    $('form').get(0).reset();

    if (validNumber(ccNumber)) {
      $success.toggleClass('opened');
    }
    else {
      $error.toggleClass('opened');
    }
  });

  $('ul a').on('click', function(e) {
    e.preventDefault();

    var month = $(this).text();
    var birthstones = {
      'January': 'garnet',
      'February': 'amethyst',
      'March': 'aquamarine or bloodstone',
      'April': 'diamond',
      'May': 'emerald',
      'June': 'pearl, moonstone, or alexandrite',
      'July': 'ruby',
      'August': 'peridot',
      'September': 'sapphire',
      'October': 'opal or tourmaline',
      'November': 'topaz or citrine',
      'December': 'turquoise, zircon, or tanzanite',
    };

    $('#birthstone').text('Your birthstone is ' + birthstones[month]);
  });
});
