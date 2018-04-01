function octalToDecimal(numString) {
  var digits = numString.split('').map(function (n) { return Number(n); });
  var maxExp = digits.length - 1;
  var octals = digits.map(function (n, i) { return n * Math.pow(8, maxExp - i);});
  return octals.reduce(function (sum, value) { return sum + value; });
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9