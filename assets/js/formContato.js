const botao = document.getElementById('abrirForm');
const form = document.getElementById('formContato');
const usuario = document.getElementById('usuario');

// Inicialmente escondido
form.style.maxHeight = '0px';
form.style.opacity = 0;
form.style.overflow = 'hidden';
form.style.transition = 'max-height 0.4s ease, opacity 0.4s ease';

botao.addEventListener('click', () => {
  const isClosed = form.style.maxHeight === '0px';

  if (isClosed) {
    // Abre o formulário
    form.style.maxHeight = form.scrollHeight + 'px';
    form.style.opacity = 1;
    botao.innerHTML = "Cancelar";
    usuario.style.backgroundSize = "250%";
  } else {
    // Fecha o formulário
    form.style.maxHeight = '0px';
    form.style.opacity = 0;
    botao.innerHTML = "Entrar em contato";
    usuario.style.backgroundSize = "200%";
  }
});
