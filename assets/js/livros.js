let generoAtual = 1;

async function carregarLivros(idGenero) {
  generoAtual = idGenero;
  const container = document.getElementById('livros');
  container.innerHTML = "<p>Carregando...</p>";

  try {
    const res = await fetch(`./includes/livros.php?genero=${idGenero}`, { cache: "no-store" });
    const livros = await res.json();

    container.innerHTML = "";
    if (!Array.isArray(livros) || livros.length === 0) {
      container.innerHTML = "<p>Nenhum livro encontrado para este gênero.</p>";
      return;
    }

    livros.forEach(l => {
      const div = document.createElement("div");
      div.className = "info";
      div.innerHTML = `
        <div><img src="bd/imgBd/${l.foto}" alt="${l.titulo}"></div>
        <p>${l.autor}, ${l.ano}</p>
        <h4>${l.titulo}</h4>
      `;
      container.appendChild(div);
    });

    // Agora sim, depois de renderizar, atualiza as capas
    atualizarCapas(livros);
  } catch (err) {
    console.error("Erro ao carregar livros:", err);
    container.innerHTML = "<p>Erro ao carregar livros.</p>";
  }
}

// carrega um gênero padrão ao abrir a página
window.addEventListener("DOMContentLoaded", () => carregarLivros(generoAtual));
