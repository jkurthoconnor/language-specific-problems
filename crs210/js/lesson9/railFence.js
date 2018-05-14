function encode(message, railCount) {
  var i;
  var bottomRail = railCount - 1;
  var currentRail = 0;
  var rails = [];
  var moveDown = true;
  var cleanMessage = message.replace(/[^a-z]/gi, '');

  for (i = 0; i <= bottomRail; i += 1) {
    rails.push([]);
  }

  cleanMessage.split('').forEach(function (char) {
    rails[currentRail].push(char);

    if (moveDown) {
      if (currentRail === bottomRail) {
        moveDown = !moveDown;
        currentRail -= 1;
      } else {
        currentRail += 1;
      }
    } else {
      if (currentRail === 0) {
        moveDown = !moveDown;
        currentRail += 1;
      } else {
        currentRail -= 1;
      }
    }
  });

  return rails.map(function (rail) { return rail.join('')}).join('');
}

console.log(encode('Hi Everyone!', 2));
console.log(encode('WE ARE DISCOVERED, FLEE AT ONCE', 3));
