document.addEventListener('DOMContentLoaded', function() {
    // Obter todas as instâncias da classe selected-image
    const selectedImages = document.querySelectorAll('.selected-image');
  
    // Iterar sobre cada instância
    selectedImages.forEach(selectedImage => {
      // Obter os valores dos atributos da tag <img>
      const birthDate = new Date(selectedImage.getAttribute('data-birth-date'));
      const booleanValue = selectedImage.getAttribute('data-boolean-value') === 'true'; // Converte para booleano
      const monthsToAdd = parseInt(selectedImage.getAttribute('data-months-to-add'), 10);
  
      let selectedImageSrc = '';
  
      // Se booleanValue for true, exiba ok.png, caso contrário, aplique a lógica de datas
      if (booleanValue) {
        selectedImageSrc = '../images/ok.png';
      } else {
        // Lógica para escolher entre imagem2 e imagem3 com base na data de nascimento
        const currentDate = new Date();
        const cutOffDate = new Date(birthDate);
        cutOffDate.setMonth(birthDate.getMonth() + monthsToAdd);
  
        // Se a data atual for maior que a cutOffDate, exiba wrong.png, caso contrário, exiba waiting.png
        selectedImageSrc = currentDate > cutOffDate ? '../images/wrong.png' : '../images/waiting.png';
      }
  
      // Adicione logs de console para verificar se o caminho da imagem está correto
      console.log('Caminho da imagem selecionada:', selectedImageSrc);
  
      // Atualiza a imagem no HTML
      selectedImage.src = selectedImageSrc;
    });
  });
  