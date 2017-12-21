function logOddNumbers(limit) {
  for (var i = 1; i <= limit; i++) {
    if (i % 2 == 0) {
      continue;
    } 
    console.log(i);
  }
}

logOddNumbers(10);
