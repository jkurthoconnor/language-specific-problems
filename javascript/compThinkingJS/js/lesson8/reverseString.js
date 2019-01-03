
/* iterative building
 
function reverse(string) {
  var i = string.length - 1;
  var reversed = '';

  for (; i >= 0; i -= 1) {
    reversed += string[i];
  }

  return reversed;
}
*/

function reverse(string) {
  return string.split('').map(function (ltr, idx, array) {
    var end = array.length - 1;
    return array[end - idx];
  }).join('');
}

/* obvious one-liner
function reverse(string) {
  return string.split('').reverse().join('');
} 
*/

console.log(reverse('hello'));                  // returns "olleh"
console.log(reverse('The quick brown fox'));    // returns "xof nworb kciuq ehT"

