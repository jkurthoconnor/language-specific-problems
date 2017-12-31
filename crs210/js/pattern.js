function generatePattern(n) {
  var line;
  var i;
  var j;
  var k;

  for (i = 1; i <= n; i++) {
    line = [];

    for (j = 1; j <= i; j++) {
      line.push(String(j));
    }

    for (k = 1; ; k++) {
      if (j + k > n + 1) {
        break;
      }
      line.push('*');
    }

    console.log(String(line));
  }

 // log n rows of n chars
 // where each row begins
 // with 1..n, and the remaining
 // chars are *
}

generatePattern(1);
generatePattern(4);
generatePattern(8);
generatePattern(10);
