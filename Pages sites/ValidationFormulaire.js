function validerInscription() {
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
  
    // Vérifier l'adresse e-mail
    if (!/\S+@[\w.]+\.ucac-icam\.com$/.test(email)) {
      alert("Veuillez saisir une adresse e-mail valide.");
      return false;
    }
  
    // Vérifier que le mot de passe contient une lettre majuscule et un chiffre
    if (!/(?=.*[A-Z])(?=.*[0-9])/.test(password)) {
      alert("Le mot de passe doit contenir au moins une lettre majuscule et un chiffre.");
      return false;
    }
  
    // Vérifier que le mot de passe correspond à la confirmation de mot de passe
    if (password != confirmPassword) {
      alert("Les mots de passe ne correspondent pas.");
      return false;
    }
  
    // Si toutes les validations sont passées, retourner true pour soumettre le formulaire
    return true;
  }



  function updateLikes() {
    const button = document.querySelector('.like-button');
    
  
    
    // Update the button text and color
    button.classList.add('clicked');
  }

const myButton = document.getElementById('.myButton');

myButton.addEventListener('click', function() {
  myButton.classList.toggle('clicked');
});

  