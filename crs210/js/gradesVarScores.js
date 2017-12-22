var finalGrade;
var grades = [];
var message = 'Based on the average of your scores, your grade is ';

function getGrades() {
  var value;

  while (true) {
    value = prompt('Enter score:');
    if (value === '') {
      break;
    }
    grades.push(Number(value));
  }
}

function average(scores) {
  var i;
  var sum = 0;

  for (i = 0; i < scores.length; i++) {
    sum += scores[i];
  }

  return sum / scores.length;
}

function letterGrade() {
  var letter;
  var avg = average(grades); 

  if (avg >= 90) {
    letter = 'A';
    } else if (avg >= 70) {
    letter = 'B';
    } else if (avg >= 50) {
    letter = 'C';
    } else {
    letter = 'F';
    }

    return letter;
}

getGrades();
finalGrade = String(letterGrade());
console.log(message + finalGrade);
