var value;

function logMultiples(number) {
  var i;
  var maxOdd;

  for (i = 100; i >= number ; i--) {
    if (i % number === 0 && i % 2 === 1) {
      maxOdd = i;
      break;
    }
  }

  for (i = maxOdd; i >= number; i -= number) {
    if (i % 2 === 1) {
      console.log(String(i));
    }
  }
}

value = Number(prompt('Please enter an integer between 0 and 100.'));

logMultiples(value);
