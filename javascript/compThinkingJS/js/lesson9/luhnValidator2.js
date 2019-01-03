/* in:  string number
 * out: boolean: true for valid Luhn, false if not
 *
 *  valid Luhn:
 *      starting at the rightmost, double every 2nd digit
 *        if the digit becomes 10+, subtract 9 from result
 *          e.g.: 1111 >>> 2121
 *                8763 >>> 7733
 *      add all the digits together to generate the checksum
 *        valid Luhn checksum x % 10 === 0
 *
 * data structure: array of numbers: cleaned input string split reversed and mapped 
 *
 * algorithm: 
 *  declare and init numbers array to hold string cleaned of all non digits,split at the char, reversed and mapped to numbers
 *
 *  declare and init checksum = mapped array so every 2nd number is doubled; subtract 9 if result >= 10; reduce array to the sum of its elements
 *
 *  return checksum % 10 === 0
 *
 *
 *
 *
 * function 2:
 * in: number
 * out: original number plus a digit to make it valid per Luhn
   *
   * e.g: in: '2323 2005 7766 355'
 *      out: '2323 2005 7766 3554'
 *          note: digit added to end; 
 *  algorithm:
 *    process input as before to yeild array of numbers
 *    calculate the Luhn checksum with 0 added to first place in 
 *        array ( representing the reversed string)
 *    determine how much must be added to the checksum to be divisible by 10
      return the input string the diff to string appended
 * 
 * e.g. 1111
 *      01111
 *      02121 6  10 - 6 = 4
 *
 *      876
 *      0678
 *      0377 17 20 - 17 = 3
 *      
 *      diff = 10 - (checksum % 10)
 *
 */

function validLuhn(str) {
  var numbers = str.replace(/\D/g, '').split('').reverse().map(Number);
  var checksum = calculateLuhnChecksum(numbers);

  return checksum % 10 === 0;
}

function makeLuhn(str) {
  var diff;
  var checksum;
  var numbers;

  if (validLuhn(str)) {
    return str;
  }

  numbers = str.replace(/\D/g, '').split('').reverse().map(Number);
  numbers.unshift(0);
  checksum = calculateLuhnChecksum(numbers);
  diff = (checksum % 10 === 0) ? 0 : 10 - (checksum % 10);

  return str + diff.toString(10);
}

function calculateLuhnChecksum(numbers) {
  return numbers.map(doubleSeconds).reduce(function (sum, value) {
    return sum + value;
  });
}

function doubleSeconds(number, idx) {
  var product;

  if (idx % 2 !== 0) {
    product = number * 2;
    if (product >= 10) {
      return product- 9;
    } else {
      return product;
    }
  } else {
    return number;
  }
}

console.log(makeLuhn('2323 2005 7766 355'));
console.log(makeLuhn('87-6 3')); // '8763'
console.log(makeLuhn('2323 2005 7766 3554')); // given number
// console.log(validLuhn('')); // false excluded as possible input
console.log(makeLuhn('1111')); // 11114
console.log(validLuhn('1111')); // false
// 2121 summed = 6
console.log(validLuhn('1.1.11')); // false
console.log(validLuhn('8763')); // true
// 3678 doubled 3377 summed 20 
console.log(validLuhn('87-63')); // true
console.log(validLuhn('87-6 3')); // true
console.log(validLuhn('2323 2005 7766 3554')); // true
// console.log(validLuhn('')); // false excluded as possible input

