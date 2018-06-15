/*
binary key to the secret handshake:
1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.
 
  2**4  2**3 2**2 2**1 2**0
   16     8   4     2    1
*/

function handshake(code) {
  var handshake = [];
  var secretKeys = ['wink', 'double blink', 'close your eyes', 'jump'];
  var bits = code.toString(2);
  var flipBit = false;


  if (/[^01]/.test(bits)) {
    return handshake;
  } else {
    bits = bits.split('').reverse();
  }

  if (bits.length >= 5) {
    bits = bits.slice(0, 4);
    flipBit = true;
  }

  bits.forEach(function (bit, idx) {
    if (bit === '1') {
      handshake.push(secretKeys[idx]);
    }
  });

  return flipBit ? handshake.reverse() : handshake;
}


console.log(handshake(9));  // ['wink', 'jump']
console.log(handshake('11001')); // ['jump', 'wink']
console.log(handshake('1')); // [ 'wink']
console.log(handshake(1)); // [ 'wink']
console.log(handshake(2)); // ['double blink']
console.log(handshake(4)); // [close your eyes]
console.log(handshake(8)); // [jump]
console.log(handshake(3)); // [wink, double blink]
console.log(handshake(19)); // [ double blink, wink]
console.log(handshake(31)); // [ jump, close your eyes, double blink, wink]
console.log(handshake('piggies')); // []
console.log(handshake('1i0gies')); // []
console.log(handshake('12001')); // []
