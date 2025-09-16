const startBtn = document.getElementById("start-btn");
const quizContainer = document.getElementById("quiz-container");
const startScreen = document.getElementById("start-screen");
const endScreen = document.getElementById("end-screen");
const questionContainer = document.getElementById("question-container");
const answerButtons = document.getElementById("answer-buttons");
const nextBtn = document.getElementById("next-btn");
const restartBtn = document.getElementById("restart-btn");
const welcome = document.getElementById("welcome");
const playerNameInput = document.getElementById("player-name");

let currentQuestionIndex = 0;
let shuffledQuestions = [];

const questions = [
  {
    question: "¿En qué país nació Ana Frank?",
    answers: [
      { text: "Alemania", correct: true },
      { text: "Países Bajos", correct: false },
      { text: "Polonia", correct: false }
    ]
  },
  {
    question: "¿Cómo se llama el diario de Ana Frank?",
    answers: [
      { text: "Mi diario secreto", correct: false },
      { text: "El diario de Ana Frank", correct: true },
      { text: "Memorias de una niña", correct: false }
    ]
  },
  {
    question: "¿En qué ciudad se escondió Ana Frank?",
    answers: [
      { text: "Ámsterdam", correct: true },
      { text: "Berlín", correct: false },
      { text: "Varsovia", correct: false }
    ]
  }
];

// Iniciar el juego
startBtn.addEventListener("click", () => {
  const playerName = playerNameInput.value.trim();
  if (playerName === "") {
    alert("Por favor ingresa tu nombre");
    return;
  }
  startScreen.style.display = "none";
  quizContainer.style.display = "block";
  welcome.innerText = `Bienvenido/a, ${playerName}`;
  shuffledQuestions = [...questions];
  currentQuestionIndex = 0;
  setNextQuestion();
});

// Reiniciar juego
restartBtn.addEventListener("click", () => {
  endScreen.style.display = "none";
  startScreen.style.display = "block";
  playerNameInput.value = "";
});

// Mostrar pregunta
function setNextQuestion() {
  resetState();
  showQuestion(shuffledQuestions[currentQuestionIndex]);
}

function showQuestion(question) {
  questionContainer.innerText = question.question;
  question.answers.forEach(answer => {
    const button = document.createElement("button");
    button.innerText = answer.text;
    button.classList.add("btn");
    if (answer.correct) {
      button.dataset.correct = answer.correct;
    }
    button.addEventListener("click", selectAnswer);
    answerButtons.appendChild(button);
  });
}

function resetState() {
  nextBtn.style.display = "none";
  while (answerButtons.firstChild) {
    answerButtons.removeChild(answerButtons.firstChild);
  }
}

function selectAnswer(e) {
  const selectedButton = e.target;
  const correct = selectedButton.dataset.correct === "true";
  
  if (correct) {
    selectedButton.classList.add("correct");
  } else {
    selectedButton.classList.add("incorrect");
    // Mostrar la respuesta correcta
    Array.from(answerButtons.children).forEach(button => {
      if (button.dataset.correct === "true") {
        button.classList.add("correct");
      }
    });
  }

  // Desactivar botones
  Array.from(answerButtons.children).forEach(button => {
    button.disabled = true;
  });

  if (shuffledQuestions.length > currentQuestionIndex + 1) {
    nextBtn.style.display = "block";
  } else {
    nextBtn.innerText = "Terminar";
    nextBtn.style.display = "block";
  }
}

nextBtn.addEventListener("click", () => {
  currentQuestionIndex++;
  if (currentQuestionIndex < shuffledQuestions.length) {
    setNextQuestion();
  } else {
    quizContainer.style.display = "none";
    endScreen.style.display = "block";
    nextBtn.innerText = "Siguiente";
  }
});
