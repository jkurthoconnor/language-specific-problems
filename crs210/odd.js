function isOdd(num) {
  return num % 2 == 1;
}

function logOddNumbers(limit) {
  for (i = 1; i <= limit; i++) {
    if (isOdd(i)) {
      console.log(i);
    }
  }
}

logOddNumbers(10);
