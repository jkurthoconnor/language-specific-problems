var value;

function logMultiples(number) {
  var i;
  var max;

  max = Math.floor(100 / number) * number;

  for (i = max; i >= number ; i -= number) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
}

value = Number(prompt('Please enter an integer between 0 and 100.'));

logMultiples(value);
