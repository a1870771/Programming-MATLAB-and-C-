// define constant variables
const contents = document.getElementById("contents");
const card = document.getElementById("card");
const next = document.getElementById("next");
const previous = document.getElementById("previous");


//define questions
var questions = ["dog", "cat", "cow", "rabbit"];
var answers = ["puppy", "kitten", "calf", "bunny"];
var indexes = []
var cardNumber = 0;

//choose initial question
var index = Math.floor(Math.random()*questions.length);
var question = questions[index];
var answer = answers[index];
indexes.push(index);
//display question
contents.textContent = question;

// toggle between question and answer
card.addEventListener("click", function() {
  if (contents.textContent == question){
    contents.textContent = answer;
  } 
  else if (contents.textContent == answer){
    contents.textContent = question;
  }
});

//choose next question
next.addEventListener("click", function(){
  cardNumber ++;
  //if card num > length of array cardnum
  if (cardNumber >= indexes.length){
    while ( indexes[cardNumber - 1] == index){
      index = Math.floor(Math.random()*questions.length);
    }
    indexes.push(index);
  }
  else if (cardNumber < indexes.length){
    index = indexes[cardNumber];
  }
  question = questions[index];
  answer = answers[index];
  contents.textContent = question;
})

//choose previous question
previous.addEventListener("click", function(){
  if (cardNumber > 0){
    cardNumber --;
  }
  index = indexes[cardNumber];
  question = questions[index];
  answer = answers[index];
  contents.textContent = question;
})