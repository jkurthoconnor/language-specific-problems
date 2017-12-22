function isPrime(number) {
  var i;

  if (number < 2) {
    return false;
  } else if (number === 2) {
    return true;
  }

  for (i = 2; i < number / 2; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(1));
console.log(isPrime(2));
console.log(isPrime(3));
console.log(isPrime(43));
console.log(isPrime(55));
console.log(isPrime(0));
