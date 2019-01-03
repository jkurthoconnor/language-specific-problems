var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

function totalArea(rectArray) {
  var areaEach = rectArray.map(function (rect) {
    return rect[0] * rect[1];
  });

  return areaEach.reduce(function (totalArea, currArea) {
    return totalArea + currArea;
  });
}

function totalSqArea(rectArray) { // find total area of only squares
  var sqArray = rectArray.filter(function (rect) {
    return rect[0] === rect[1];
  });

  return totalArea(sqArray);
}

console.log(totalArea(rectangles));    // 141
console.log(totalSqArea(rectangles));    // 121
