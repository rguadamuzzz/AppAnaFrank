const reveals = document.querySelectorAll(".reveal");

function mostrarElementos() {
  const triggerBottom = window.innerHeight * 0.9;

  reveals.forEach((el) => {
    const boxTop = el.getBoundingClientRect().top;
    if (boxTop < triggerBottom) {
      el.classList.add("visible");
    }
  });
}

window.addEventListener("scroll", mostrarElementos);
window.addEventListener("load", mostrarElementos);
