
function myOwnEvery(array, func) {
  var i;
  var value; 

  for (i = 0; i < array.length; i += 1) {
    value = array[i];

    if (!func(value)) {
      return false
    }
  }

  return true;
}

var isAString = function (value) {
  return typeof value === 'string';
};


function areAllNumbers(array) {
  return myOwnEvery(array, isANumber);
}

var isANumber = function (value) {
  return typeof value === 'number';
};

console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));      // "true"
console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true
