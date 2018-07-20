const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(callback) {
  let firstAnswer, secondAnswer;

  reader.question("Would you like some tea?", function (answer1) {
    firstAnswer = answer1;
    console.log(`Tea: ${firstAnswer}`);

    reader.question("Would you like some biscuits?", function (answer2) {
      secondAnswer = answer2;
      console.log(`Biscuit: ${secondAnswer}`);

      callback(firstAnswer, secondAnswer);
    });
  });
}

function answer(first, second) {
  console.log(`Tea?: ${first}, Biscuit?: ${second}`);
  reader.close();
}

teaAndBiscuits(answer);
