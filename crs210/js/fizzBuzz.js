function fizzBuzz() {
  var i;
  var report

  for (i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      report = 'FizzBuzz';
    } else if (i % 3 === 0) {
      report = 'Fizz';
    } else if (i % 5 === 0) {
      report = 'Buzz';
    } else {
      report = String(i);
    }
    console.log(report);
  }
}

fizzBuzz();
