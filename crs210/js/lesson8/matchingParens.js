/* a more straight-forward approach:
 *
function isBalanced(str) {
  var i = 0;
  var count = 0;

  for (; i < str.length; i += 1) {
    if (str[i] === '(') {
      count += 1;
    } else if (str[i] === ')') {
      count -= 1;
    }

    if (count < 0) {
      return false;
    }
  }

  return count === 0;
}

*/

function isBalanced(str) {
  var i;
  var parens = str.replace(/[^\(\)]/g, '');
  var count = {
        open: 0,
        close: 0,
      };

  for (i = 0; i < parens.length; i += 1) {
    /\(/.test(parens[i]) ? count.open += 1 : count.close += 1;

    if (count.open < count.close) {
      return false;
    }
  }

  return count.open === count.close;
}


console.log(isBalanced('What (is) this?'));        // true
console.log(isBalanced('What is) this?'));         // false
console.log(isBalanced('What (is this?'));         // false
console.log(isBalanced('((What) (is this))?'));    // true
console.log(isBalanced('((What)) (is this))?'));   // false
console.log(isBalanced('Hey!'));                   // true
console.log(isBalanced(')Hey!('));                 // false
console.log(isBalanced('What ((is))) up('));       // false
console.log(isBalanced(''));                       // true
