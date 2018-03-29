
function myForEach(array, func) {
  var i;

  for (i = 0; i < array.length; i += 1) {
    func(array[i]);
  }
}

var min = Infinity;
var max = -Infinity;

var getMinMax = function (value) {
  if (value >= max) {
    max = value;
  }

  if (value <= min) {
    min = value;
  }
};


console.log(min, max);
myForEach([1,2,3,4], getMinMax);
console.log(min, max);
