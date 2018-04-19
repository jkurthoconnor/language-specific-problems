function compareVersions(ver1, ver2) {
  if (ver1.match(/[^\d.]/) || ver2.match(/[^\d.]/)) {
    return null;
  }

  var ver1Values = ver1.split('.').map(function (str) {
    return parseInt(str, 10);
  });
  var ver2Values = ver2.split('.').map(function (str) {
    return parseInt(str, 10);
  });

  removeTrailing0s(ver1Values);
  removeTrailing0s(ver2Values);

  for (var i = 0; i < ver1Values.length; i += 1) {
    if (!ver2Values[i]) {
       break;
    }

    if (ver1Values[i] < ver2Values[i]) {
      return -1;
    } else if (ver1Values[i] > ver2Values[i]) {
      return 1;
    }
  }

  if (ver1Values.length > ver2Values.length) {
    return 1;
  } else if (ver1Values.length < ver2Values.length) {
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
console.log(compareVersions('0.a1', '1.*.0')); // null
console.log(compareVersions('0.a1', '1')); // null
console.log(compareVersions('0.1', '1')); // -1
console.log(compareVersions('1.0', '1')); // 0
console.log(compareVersions('1.1', '1')); // 1
console.log(compareVersions('1.2', '1.3')); // -1
console.log(compareVersions('1.2', '1.2.0.0')); // 0
console.log(compareVersions('1.18.2', '13.37')); // -1
