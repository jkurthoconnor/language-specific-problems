// refactor: there's no need to build count objects; that's a waste of
// time; focus instead on comparing sorted lists of letters --after
// need to compare the count objects too.
function anagram(word, list) {
  var sourceCount = counter(word);

  var wordCount = list.map(function (listWord) {
    return counter(listWord);
  });

  var matches = wordCount.filter(function (letterCount) {
    return contentMatches(sourceCount, letterCount);
  });

  return matches.map(function (count) {
    return Object.keys(count).join('');
  });
}

function contentMatches(source, target) {
  var sourceKeys = Object.keys(source);
  var targetKeys = Object.keys(target);

  if (sourceKeys.length !== targetKeys.length) {
    return false; // not necessary given sample args, but helpful in other cases
  }

  return sourceKeys.every(function (key) {
    return source[key] === target[key];
  });
}

function counter(str) {
  var count = {};

  str.split('').forEach( function (ltr) {
    if (count[ltr]) {
      count[ltr] += 1;
    } else {
      count[ltr] = 1;
    }
  });

  return count;
}

console.log(anagram('listen', ['enlists', 'google', 'inlets', 'banana']));  // [ "inlets" ]
console.log(anagram('listen', ['enlist', 'google', 'inlets', 'banana']));   // [ "enlist", "inlets" ]

