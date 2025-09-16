
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

let index = 0;

const input = document.getElementById('search');
const placeholders = ["Harry Potter", "Senhor dos Aneis", "O idiota", "A culpa é das estrelas", "Os irmãos Karamazov", "Território Lovecraft"]

function mudarPlaceholder(){
    input.placeholder = placeholders[index];
    index = (index + 1) % placeholders.length
}

setInterval(mudarPlaceholder, 2000);


 const botao = document.getElementById('meuBotao');

  botao.addEventListener('click', () => {
    botao.classList.toggle('clicado'); // adiciona ou remove a classe 'clicado'
  });

