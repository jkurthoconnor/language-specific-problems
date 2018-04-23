function validLuhn(num) {
  var luhnDoubled;
  var luhnChecksum;
  var preppedDigits = num.replace(/\D/g, '').split('').reverse();

  if (preppedDigits.length === 0) {
    return false;
  }

  luhnDoubled = preppedDigits.map(function (num, idx) {
    return (idx % 2 === 1 ? parseInt(num * 2) : parseInt(num));
  }).map(function (num) {
    return (num > 9 ? num - 9 : num);
  });

  luhnChecksum = luhnDoubled.reduce(function (sum, currValue) {
    return sum + currValue;
  });

  return luhnChecksum % 10 === 0;
}


console.log(validLuhn('')); // false
console.log(validLuhn('abcd')); // false
console.log(validLuhn('-1111')); // false
console.log(validLuhn('1111')); // false
console.log(validLuhn('.1 111')); // false
console.log(validLuhn('3333')); // false
console.log(validLuhn('33   33')); // false
console.log(validLuhn('8763')); // true
console.log(validLuhn('-8763')); // true even if the original is signed
                                  // the doubling (-1 * 2) and addition shouldn't
                                  // change the sign; but it couldn't be signed
                                  // given the specs to ignore non digit chars
console.log(validLuhn('8.763')); // true given the specs to ignore non digits
                                 // this would be treated as 8763
console.log(validLuhn('2323 2005 7766 3554')); // true
console.log(validLuhn('2323-2005-7766-3554')); // true
console.log(validLuhn('2323.2005.7766.3554')); // true dots treated as separators
