
// Récupérer l'élément de dégradé
const degrade = document.getElementById('actualite');
const art = document.querySelector('.art');
 const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');
  const carouselWidth = document.querySelector('.caroussel').offsetWidth;
  const itemWidth = document.querySelector('.article').offsetWidth;
  let currentPosition = 0;

  function slideTo(position) {
    gsap.to(art, {
      x: -position * itemWidth,
      duration: 0.3,
      ease: 'power1.inOut'
    });
  }

  function slideNext() {
    currentPosition++;
    if (currentPosition > (art.children.length - 1) / 3) {
      currentPosition = 0;
    }
    slideTo(currentPosition);
  }

  function slidePrev() {
    currentPosition--;
    if (currentPosition < 0) {
      currentPosition = (art.children.length - 1) / 3;
    }
    slideTo(currentPosition);
  }

  prevBtn.addEventListener('click', slidePrev);
  nextBtn.addEventListener('click', slideNext);

  // Slide automatique toutes les 5 secondes
  setInterval(slideNext, 5000);


 

 // Créer un objet de configuration pour l'animation
 const config = {
   duration: 2,
   colors: [
   

  
   '#8b2dfd',
   '#22b7c3',
   '#2dfd4c',
   '#2722c3',
   '#8b2dfd',
   '#22b7c3',
   '#2dfd4c',
   '#2722c3',
   '#8b2dfd',
   '#22b7c3',
   '#2dfd4c',
   '#2722c3',
   '#8b2dfd',
   '#22b7c3',
   '#2dfd4c',
   '#2722c3',
   '#8b2dfd',
   '#22b7c3',
   '#2dfd4c',
   '#2722c3',

     
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
