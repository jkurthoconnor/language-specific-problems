var studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(records) {
  var exams;
  var studentGrades;
  var finalGrades = [];
  var examGrades = [ [], [], [], [] ];

  Object.keys(records).forEach(function (student) {
    var studentScores = records[student].scores;

    finalGrades.push(calculateGradeNumber(studentScores));

    studentScores.exams.forEach(function(grade, idx) {
      examGrades[idx].push(grade);
    });
  });

  exams = calculateStats(examGrades);
  studentGrades = formatGrades(finalGrades);

  return { studentGrades, exams };
}

function calculateStats(numberGroups) {
  return numberGroups.map(function (group) {
    var range = calculateRange(group);
    return {
      average: calculateAvg(group),
      minimum: range[0],
      maximum: range[1],
    };
  });
}

function calculateAvg(numbers) {
  var total = numbers.reduce(function (sum, value) {
    return sum + value;
  });

  return total / numbers.length;
}

function calculateRange(numbers) {
  numbers.sort(function (n1, n2) { return n1 - n2; });
  
  return [ numbers[0], numbers[numbers.length -1] ];
}

function formatGrades(grades) {
  return grades.map(function (grade) {
    if (grade >= 93) {
      return `${String(grade)} (A)`;
    } else if (grade >= 85) {
      return `${String(grade)} (B)`;
    } else if (grade >= 77) {
      return `${String(grade)} (C)`;
    } else if (grade >= 69) {
      return `${String(grade)} (D)`;
    } else if (grade >= 60) {
      return `${String(grade)} (E)`;
    } else {
      return `${String(grade)} (F)`;
    }
  });
}

function calculateGradeNumber(grades) {
  var examAvg = calculateAvg(grades.exams);
  var exerciseTotal;

  exerciseTotal = grades.exercises.reduce(function (sum, value) { return sum + value; });

  return Math.round((examAvg * .65) + (exerciseTotal * .35));
}

console.log(generateClassRecordSummary(studentScores));

// returns:
/*
 * {
  studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
  exams: [
    { average: 75.6, minimum: 50, maximum: 100 },
    { average: 86.4, minimum: 70, maximum: 100 },
    { average: 87.6, minimum: 60, maximum: 100 },
    { average: 91.8, minimum: 80, maximum: 100 },
  ],
}
*/
