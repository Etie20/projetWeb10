const inputs = document.querySelectorAll(".input-field");

inputs.forEach((inp) => {
  inp.addEventListener("focus", () => {
    inp.classList.add("active");
  });
  inp.addEventListener("blur", () => {
    if (inp.value != "") return;
    inp.classList.remove("active");
  });
});

// script pour leffet degrader

// Récupérer l'élément de dégradé
const degrade = document.getElementById('left');

// Créer un objet de configuration pour l'animation
const config = {
  duration: 1.5,
  colors: [
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    '#1dc1ec',
    '#FF487A',
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    '#1dc1ec',
    '#FF487A',
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    '#1dc1ec',
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    '#1dc1ec',
    '#FF487A',
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    '#1dc1ec',
    '#FF487A',
    '#FFB82A',
    '#FF482A',
    '#FF6D00',
    
    
  ]
}

// Créer une timeline de GSAP pour l'animation
const timeline = gsap.timeline({repeat: -1});

// Ajouter une animation de changement de couleur sur la timeline
for (let i = 1; i < config.colors.length - 1; i++) {
  timeline.to(degrade, {
    background: `linear-gradient(to right, ${config.colors[i]}, ${config.colors[i-1]})`,
    duration: config.duration,
    ease: "none"
  });
}



