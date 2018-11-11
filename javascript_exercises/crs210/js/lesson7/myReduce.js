
function myReduce(array, func, initial) {
  var idx;
  var accumulator;

  if (initial === undefined) {
    accumulator = array[0];
    idx = 1;
  } else {
    accumulator = initial;
    idx = 0;
  }

  for (; idx < array.length; idx += 1)  {
    accumulator = func(accumulator, array[idx]);
  }

  return accumulator;
}

var smallest = function (result, value) {
  return result <= value ? result : value;
};

var sum = function (result, value) {
  return result + value;
};


function longestWord(words) {
  return myReduce(words, longest);
}


var longest = function (result, currentWord) {
  return currentWord.length >= result.length ? currentWord : result;
};

console.log(longestWord(['abc', 'launch', 'targets', '']));      // "targets"
console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49
