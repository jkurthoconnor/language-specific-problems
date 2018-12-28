function phoneCleaner(str) {
  var cleanDigits = str.replace(/\D/g, '');
  var length = cleanDigits.length;
  var badNumReturn = '0'.repeat(10);

  if (length === 10) return cleanDigits;
  if (length === 11 && cleanDigits[0] === '1') return cleanDigits.slice(1);

  return badNumReturn;
}

console.log(phoneCleaner('1234567890')); // '123456890'
console.log(phoneCleaner('(234) 567-8901')); // '234568901'
console.log(phoneCleaner('(234) 567.8901')); // '234568901'
// too short: 9 digits
console.log(phoneCleaner('34 567-8901')); // '0000000000'
// empty string: too short
console.log(phoneCleaner('')); // '0000000000'
// noisey string: too short after cleaning
console.log(phoneCleaner('fLefdjka12*')); // '0000000000'
// too long: 12 digits
console.log(phoneCleaner('97234 567-8901')); // '0000000000'
// 11 digits, wrong initial digit
console.log(phoneCleaner('97234 567-891')); // '0000000000'
// 11 digits, starts with proper 1
console.log(phoneCleaner('1 (234) 567-8901')); // '234568901'
// 11 digits, starts with proper 1 but atypical formatting
console.log(phoneCleaner('1 234 567.8901')); // '234568901'
