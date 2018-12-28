function expandRange(shortRange) {
  if (!shortRange.match(/\d/) || shortRange.match(/[^\d\-,\.:]/)) {
    return NaN;
  }

  var previousNum;
  var start;
  var stop;
  var numbers = [];
  var range = [];
  var shortValues;

  shortValues = shortRange.split(',').map(function (value) {
    return (value.length > 1 ? value.split(/[\-.:]+/) : value);

  // TODO: revise to expand compound range expressions, e.g. '1:5:2'
  //      in this mapping
  });

  shortValues.forEach(function (value) {
    previousNum = numbers[numbers.length -1];

    if (Array.isArray(value)) {
      start = expandValue(value[0], previousNum);
      stop = expandValue(value[1], start);
      range = extractRange(start, stop);
      numbers = numbers.concat(range);
    } else {
      stop = expandValue(value, previousNum);
      numbers.push(stop);
    }
  });

  return numbers;
}

function expandValue(shortValue, previousValue) {
    // TODO revise to allow for multiple digit
    // significant values (e.g. leading zeros, '545,64:11') 
  shortValue = Number(shortValue);
  var i = previousValue + 1 || shortValue;

  while ((i % 10) != shortValue) {
    i += 1;
  }

  return i;
}

function extractRange(begin, end) {
  var extracted = [];
  var i;

  for (i = begin; i <= end; i += 1) {
    extracted.push(i);
  }

  return extracted;
}

console.log(expandRange('1,3,7,2,4,1')); // [ 1, 3, 7, 12, 14, 21 ]
console.log(expandRange('1-3,1-2')); // [ 1, 2, 3, 11, 12]
console.log(expandRange('1:3,1:2')); // [ 1, 2, 3, 11, 12]
console.log(expandRange('1..3,1..2')); // [ 1, 2, 3, 11, 12]
console.log(expandRange('1..3,1..2,4,5')); // [ 1, 2, 3, 11, 12, 14, 15]

// assumption: same digit to be treated as of subsequent unit of 10
console.log(expandRange('1..1')); // [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
console.log(expandRange('0,0,0')); // [ 0, 10, 20]

// assumption inverted range expression is possible
console.log(expandRange('8:1')); // [ 8, 9, 10, 11]

// assumption: invalid input returns NaN
console.log(expandRange('blarh')); // NaN
console.log(expandRange('9,3,l,0')); // NaN

// additional tests given on screen
 console.log(expandRange('1:5:2')); //
// console.log(expandRange('545,64:11')); // my solution assumes that 1s are 
//                                          the only significant digit; not so
// console.log(expandRange('104-2')); //
// console.log(expandRange('104..02')); //
