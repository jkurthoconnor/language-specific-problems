function reverse(array) {
  var i;
  var swap;
  var lastIdx = array.length - 1;
  var terminus = Math.floor(array.length / 2);

  for (i = 0; i < terminus; i++) {
    swap = array[lastIdx - i];
    array[lastIdx - i] = array[i];
    array[i] = swap;
  }

  return array;
}

var arr1 = [1, 2, 3];
var arr2 = [arr1, 6, 7];
var arr3 = ['a', 'b', 'c'];
var arr4 = ['a', 'b', 'c', arr1, arr3, 97];

console.log(reverse(arr1));
console.log(reverse(arr2));
console.log(reverse(arr3));
console.log(reverse(arr4));
