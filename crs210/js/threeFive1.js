var start;
var stop;

function multiplesOfThreeAndFive(begin, end) {
  var i;
  for (i = begin; i <= end; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(String(i) + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(String(i));
    }
  }
}

start = Number(prompt('Enter the starting point.'));
stop = Number(prompt('Enter the stopping point.'));

multiplesOfThreeAndFive(start, stop);
