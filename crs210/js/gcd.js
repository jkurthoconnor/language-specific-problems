function factor(integer) {
  var i;
  var factors = [];

  for (i = integer; i >= 1; i--) {
    if (integer % i === 0) {
      factors.push(i);
    }
  }
  return factors;
}

function gcd(int1, int2) {
  var i;
  var j;
  var factors1 = factor(int1);
  var factors2 = factor(int2);

  for (i = 0; i < factors1.length; i++) {
    for (j = 0; j < factors2.length; j++) {
      if (factors1[i] === factors2[j]) {
        return factors1[i];
      }
    }
  }
}

console.log(gcd(12, 4));
console.log(gcd(15, 10));
console.log(gcd(9, 2));
