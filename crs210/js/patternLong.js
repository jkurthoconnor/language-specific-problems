function generatePattern(n) {
  var line;
  var i;
  var j;
  var k;

  for (i = 1; i <= n; i++) {
    line = '';

    for (j = 1; j <= i; j++) {
      line += String(j);
    }

    if (n >=10 && i < 10) {
      line += singleStars(9 - i);
      line += doubleStars(n - 9);
    } else if (n >= 10 && i >=10) {
      line += doubleStars(n - i);
    } else { 
      line += singleStars(n - i);
    }

    console.log(line);
  }
}

function singleStars(limit) {
  var stars = '';
  var i;

  for (i = 1; i <= limit; i++) {
    stars += '*';
  }

  return stars;
}


function doubleStars(limit) {
  var stars = '';
  var i;

  for (i = 1; i <= limit; i++) {
    stars += '**';
  }

  return stars;
}

generatePattern(10);
generatePattern(20);
generatePattern(6);
generatePattern(8); 
