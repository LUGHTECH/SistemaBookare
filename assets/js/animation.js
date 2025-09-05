
let contagem = 1;             
const totalSlides = 3;

// Define o primeiro slide como ativo
document.getElementById('radio1').checked = true;

// Troca automática a cada 5 segundos
setInterval(() => {
    contagem++;
    if (contagem > totalSlides) {
        contagem = 1;
    }
    document.getElementById('radio' + contagem).checked = true;
}, 10000);


document.querySelectorAll('.autor').forEach(card => {
    const bg = card.dataset.bg;
    card.style.backgroundImage = `url(${bg})`;
    card.style.backgroundSize = 'cover';
    card.style.backgroundPosition = 'center';
    card.style.backgroundRepeat =  'no-repeat'
});



