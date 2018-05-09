function validLuhn(num) {
  var luhnDoubled;
  var luhnChecksum;
  var preppedDigits = num.replace(/\D/g, '').split('').reverse();

  if (preppedDigits.length === 0) {
    return false;
  }

  luhnDoubled = preppedDigits.map(function (num, idx) {
    return (idx % 2 === 1 ? parseInt(num, 10) * 2 : parseInt(num, 10));
  }).map(function (num) {
    return (num > 9 ? num - 9 : num);
  });

  luhnChecksum = luhnDoubled.reduce(function (sum, currValue) {
    return sum + currValue;
  });

  return luhnChecksum % 10 === 0;
}


function makeValidLuhn(num) {
  var evenDoubled;
  var base;
  var preppedDigits = num.replace(/\D/g, '').split('').reverse();
  var differential;

  if (validLuhn(num)) {
    return num;
  }

  evenDoubled = preppedDigits.map(function (num, idx) {
    return (idx % 2 === 0 ? parseInt(num, 10) * 2 : parseInt(num, 10));
  }).map(function (num) {
    return (num > 9 ? num - 9 : num);
  });

  base = evenDoubled.reduce(function (sum, currValue) {
    return sum + currValue;
  });

  differential = (base % 10 === 0) ? 0 : 10 - (base % 10);

  return num.concat(String(differential));
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
console.log(validLuhn('33332')); // true
console.log(validLuhn('11114')); // true
console.log(validLuhn('12120')); // true

console.log(makeValidLuhn('2323 2005 7766 355')); // '2323 2005 7766 3554'
console.log(makeValidLuhn('3333')); // '33332'
console.log(makeValidLuhn('1111')); // '11114' 
console.log(makeValidLuhn('1212')); // '12120' a test for input that will
                                    // return 0 for base % 10
console.log(makeValidLuhn('2323 2005 7766 3554')); // returns input number
