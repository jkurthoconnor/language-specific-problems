var start;
var stop;

function multiplesOfThreeAndFive(begin, end) {
  for (i = begin; i <= end; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
      console.log(i + '!');
    } else if (i % 3 === 0 || i % 5 === 0) {
      console.log(i);
    }
  }
}

start = prompt('Enter the starting point.');
stop = prompt('Enter the stopping point.');

multiplesOfThreeAndFive(start, stop);
