var value;

function logMultiples(number) {
  var i;
  var total;

  for (i = 1; ; i += 2) {
    total = i * number;
    if (total > 100) {
      break;
    } else if (total % 2 == 1) {
    console.log(String(total));
    }
  }
}

value = Number(prompt('Please enter an integer between 0 and 100.'));

logMultiples(value);
