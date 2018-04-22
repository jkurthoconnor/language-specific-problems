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

  removeTrailing0s(values1);
  removeTrailing0s(values2);

  for (var i = 0; i < values1.length; i += 1) {
    if (!values2[i]) {
       break;
    }

    if (values1[i] < values2[i]) {
      return -1;
    } else if (values1[i] > values2[i]) {
      return 1;
    }
  }

  if (values1.length > values2.length) {
    return 1;
  } else if (values1.length < values2.length) {
    return -1;
  } else {
    return 0;
  }
}


function removeTrailing0s(arr) {
  var i;

  for (i = arr.length - 1; i >= 0; i -= 1) {
    if (arr[i] === 0) {
      arr.pop();
    } else {
      break;
    }
  }
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
