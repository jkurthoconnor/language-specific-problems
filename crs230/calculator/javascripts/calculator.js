$(function () {

  $('form').on('submit', function (event) {
    event.preventDefault();

    var result = 0;
    var numerator = parseInt($('#numerator').val(), 10);
    var operator = $('#operator').val();
    var denominator = parseInt($('#denominator').val(), 10);

    switch (operator) {
      case '+':
        result = numerator + denominator;
        break;
      case '-':
        result = numerator - denominator;
        break;
      case '*':
        result = numerator * denominator;
        break;
      case '/':
        result = numerator / denominator;
        break;
    }

    $('h1').text(result.toString(10));
  });
});
