function phoneParser(phoneString) {
  var invalidInput = '0000000000';
  var cleanNumber = phoneString.replace(/\D/g, '');
  var length = cleanNumber.length;

  if (length > 11 || length < 10 || (length === 11 && cleanNumber[0] !== '1')) {
    return invalidInput;
  }

  return (length === 10 ? cleanNumber : cleanNumber.slice(1));
}


console.log(phoneParser('1234567890')); // '123456890'
console.log(phoneParser('(234) 567-8901')); // '234568901'
console.log(phoneParser('(234) 567.8901')); // '234568901'
// too short: 9 digits
console.log(phoneParser('34 567-8901')); // '0000000000'
// too long: 12 digits
console.log(phoneParser('97234 567-8901')); // '0000000000'
// 11 digits, wrong initial digit
console.log(phoneParser('97234 567-891')); // '0000000000'
// 11 digits, starts with proper 1
console.log(phoneParser('1 (234) 567-8901')); // '234568901'
// 11 digits, starts with proper 1 but atypical formatting
console.log(phoneParser('1 234 567.8901')); // '234568901'
