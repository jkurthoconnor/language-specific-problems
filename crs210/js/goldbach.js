function isPrime(number) {
  var i;

  if (number < 2) {
    return false;
  }

  for (i = 2; i <= number / 2; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

function checkGoldbach(n) {
  var x;

  if (n % 2 !== 0 || n < 4) {
    console.log(null);
    return;
  }

  for (i = 2; i <= n / 2; i++) {
    x = n - i;
    if (isPrime(x) && isPrime(i)) {
      console.log(i + ', ' + x);
    }
  }
}

checkGoldbach(1);
checkGoldbach(2);
checkGoldbach(3);
checkGoldbach(4);
checkGoldbach(12);
checkGoldbach(100);
