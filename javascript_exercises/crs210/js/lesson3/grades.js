var grade1;
var grade2;
var grade3;
var finalGrade;
var message = 'Based on the average of your three scores, your grade is ';

function getGrades() {
  grade1 = Number(prompt('Enter score 1:'));
  grade2 = Number(prompt('Enter score 2:'));
  grade3 = Number(prompt('Enter score 3:'));
}

function average(s1, s2, s3) {
  return (s1 + s2 + s3) / 3;
}

function letterGrade() {
  var letter;
  var avg = average(grade1, grade2, grade3); 

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
