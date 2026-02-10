// kitty.js — Quiz de Ana Frank (sin dependencias externas)

// ----- Banco de preguntas -----
const QUESTIONS = [
  {
    q: "¿En qué ciudad nació Ana Frank?",
    options: ["Fráncfort del Meno", "Ámsterdam", "Berlín", "Viena"],
    answer: 0
  },
  {
    q: "¿Cómo llamaba Ana a su diario?",
    options: ["Luna", "Kitty", "Miep", "Estrella"],
    answer: 1
  },
  {
    q: "¿En qué país se ocultó Ana Frank con su familia?",
    options: ["Austria", "Alemania", "Países Bajos", "Bélgica"],
    answer: 2
  },
  {
    q: "¿Qué símbolo obligaron a portar a los judíos durante la ocupación nazi?",
    options: ["Estrella amarilla", "Cruz roja", "Círculo blanco", "Triángulo azul"],
    answer: 0
  },
  {
    q: "¿Cuál era el sueño de Ana sobre su futuro?",
    options: [
      "Ser actriz",
      "Ser científica",
      "Ser escritora y publicar su libro",
      "Ser maestra"
    ],
    answer: 2
  },
  {
    q: "¿Cómo se conocía el lugar donde se ocultaron los Frank?",
    options: ["El Ático Verde", "El Anexo Secreto", "El Refugio Rojo", "La Casa Silenciosa"],
    answer: 1
  },
  {
    q: "¿Quién fue el único miembro de la familia Frank que sobrevivió al Holocausto?",
    options: ["Ana", "Margot", "Edith", "Otto"],
    answer: 3
  },
  {
    q: "¿Qué hacía Ana para sobrellevar el encierro?",
    options: ["Escribir en su diario", "Salir a escondidas", "Tocar en la calle", "Viajar de noche"],
    answer: 0
  },
  {
    q: "¿Qué suceso provocó que la familia decidiera ocultarse en 1942?",
    options: [
      "La escasez de alimentos",
      "Una citación para un campo de trabajo",
      "Un bombardeo en Ámsterdam",
      "La pérdida del negocio"
    ],
    answer: 1
  },
  {
    q: "¿Qué valor representa mejor el legado de Ana Frank?",
    options: ["Indiferencia", "Silencio", "Esperanza y dignidad", "Venganza"],
    answer: 2
  }
];

// ----- Utilidades -----
const $ = (sel) => document.querySelector(sel);
const $$ = (sel) => document.querySelectorAll(sel);

function shuffle(arr) {
  return arr
    .map(v => ({ v, r: Math.random() }))
    .sort((a, b) => a.r - b.r)
    .map(({ v }) => v);
}

// ----- Estado del juego -----
let order = [];
let current = 0;
let score = 0;
let selectedIndex = null;
let locked = false;

// ----- Elementos UI -----
const questionEl = $("#question");
const optionsEl = $("#options");
const checkBtn = $("#check-btn");
const nextBtn = $("#next-btn");
const progressBar = $("#quizProgress");
const counterEl = $("#quizCounter");
const resultBox = $("#result-container");
const scoreEl = $("#score");
const restartBtn = $("#restart-btn");

// ----- Inicialización -----
function init() {
  order = shuffle([...Array(QUESTIONS.length).keys()]);
  current = 0;
  score = 0;
  selectedIndex = null;
  locked = false;
  resultBox.classList.add("d-none");
  checkBtn.disabled = true;
  nextBtn.disabled = true;
  render();
}

function render() {
  const total = QUESTIONS.length;
  const idx = order[current];
  const item = QUESTIONS[idx];

  // Contador y progreso
  counterEl.textContent = `${current + 1}/${total}`;
  progressBar.style.width = `${((current) / total) * 100}%`;

  // Pregunta
  questionEl.textContent = item.q;

  // Opciones
  optionsEl.innerHTML = "";
  item.options.forEach((text, i) => {
    const div = document.createElement("div");
    div.className = "quiz-option";
    div.setAttribute("role", "button");
    div.setAttribute("tabindex", "0");
    div.textContent = text;

    div.addEventListener("click", () => onSelect(i, div));
    div.addEventListener("keypress", (e) => {
      if (e.key === "Enter" || e.key === " ") onSelect(i, div);
    });

    optionsEl.appendChild(div);
  });

  // Botones
  checkBtn.disabled = true;
  nextBtn.disabled = true;
  selectedIndex = null;
  locked = false;
}

function onSelect(i, node) {
  if (locked) return;
  selectedIndex = i;
  // limpiar selección previa
  $$(".quiz-option").forEach(el => el.classList.remove("selected"));
  node.classList.add("selected");
  checkBtn.disabled = false;
}

checkBtn.addEventListener("click", () => {
  if (selectedIndex == null || locked) return;
  locked = true;

  const idx = order[current];
  const item = QUESTIONS[idx];

  // Marcar correcto/incorrecto
  $$(".quiz-option").forEach((el, i) => {
    if (i === item.answer) el.classList.add("correct");
    if (i === selectedIndex && i !== item.answer) el.classList.add("incorrect");
    el.classList.remove("selected");
  });

  if (selectedIndex === item.answer) score++;
  nextBtn.disabled = false;
  checkBtn.disabled = true;

  // Avanzar barra al responder
  const total = QUESTIONS.length;
  progressBar.style.width = `${((current + 1) / total) * 100}%`;
});

nextBtn.addEventListener("click", () => {
  if (!locked) return;
  current++;
  if (current >= QUESTIONS.length) return finish();
  render();
});

function finish() {
  // Mostrar resultado
  const total = QUESTIONS.length;
  questionEl.textContent = "¡Gracias por jugar!";
  optionsEl.innerHTML = "";
  checkBtn.disabled = true;
  nextBtn.disabled = true;

  resultBox.classList.remove("d-none");
  scoreEl.textContent = `Puntaje: ${score} de ${total}`;
}

restartBtn?.addEventListener("click", init);

// GO!
document.addEventListener("DOMContentLoaded", init);
