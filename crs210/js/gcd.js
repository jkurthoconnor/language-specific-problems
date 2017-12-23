function gcd(int1, int2) {
  var i;
  var factors1 = [];
  var factors2 = [];

  for (i = int1; i >= 1; i--) {
    if (int1 % i === 0) {
      factors1.push(i);
    }
  }

  for (i = int2; i >= 1; i--) {
    if (int2 % i === 0) {
      factors2.push(i);
    }
  }

  return [factors1, factors2];
}

console.log(gcd(12, 4));
console.log(gcd(15, 10));
console.log(gcd(9, 2));
