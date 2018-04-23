function compareVersions(ver1, ver2) {
  if (ver1.match(/[^\d.]|\.$/) || ver2.match(/[^\d.]|\.$/)) {
    return null;
  }

  var values1 = ver1.split('.').map(function (str) {
    return parseInt(str, 10);
  });

  var values2 = ver2.split('.').map(function (str) {
    return parseInt(str, 10);
  });

  var length = Math.max(values1.length, values2.length);

  for (var i = 0; i < length; i += 1) {
    var val1 = values1[i] || 0;
    var val2 = values2[i] || 0;

    if (val1 < val2) {
      return -1;
    } else if (val1 > val2) {
      return 1;
    }
  }

  return 0;
}



console.log(compareVersions('1.2', '1.2.0.0')); // 0
console.log(compareVersions('1.0.0.0.0', '1')); // 0
console.log(compareVersions('1.0', '1')); // 0
console.log(compareVersions('1.1', '1')); // 1
console.log(compareVersions('4.1', '2.34')); // 1
console.log(compareVersions('1.0.0', '1.3')); // -1
console.log(compareVersions('1.2', '1.3')); // -1
console.log(compareVersions('1.0', '1.0.3')); // -1
console.log(compareVersions('0.1', '1')); // -1
console.log(compareVersions('1.18.2', '13.37')); // -1
// invalid inputs
console.log(compareVersions('0.1', '1.')); // null
console.log(compareVersions('0.a1', '1.*.0')); // null
console.log(compareVersions('0.a1', '1')); // null
console.log(compareVersions('.a1', '1..0')); // null
