let generoAtual = 1;
let carregando = false; // evita chamadas repetidas

async function carregarLivros(idGenero) {
  if (carregando) return; // evita execução duplicada
  carregando = true;

  generoAtual = idGenero;
  const container = document.getElementById('livros');
  container.innerHTML = "<p>Carregando...</p>";

  try {
    const res = await fetch(`./includes/livros.php?genero=${idGenero}`, { cache: "no-store" });

    if (!res.ok) throw new Error(`Erro HTTP ${res.status}`);
    const livros = await res.json();

    container.innerHTML = "";
    if (!Array.isArray(livros) || livros.length === 0) {
      container.innerHTML = "<p>Nenhum livro encontrado para este gênero.</p>";
      carregando = false;
      return;
    }

    // Renderiza os livros
    livros.forEach(l => {
      const div = document.createElement("div");
      div.className = "info";
      div.innerHTML = `
        <div class="img-wrapper">
          <img src="bd/imgBd/${l.foto}" alt="${l.titulo}" loading="lazy">
        </div>
        <p>${l.autor}, ${l.ano}</p>
        <h4>${l.titulo}</h4>
      `;
      container.appendChild(div);
    });

    // Atualiza capas externas (Google Books)
    atualizarCapas(livros);
  } catch (err) {
    console.error("Erro ao carregar livros:", err);
    container.innerHTML = "<p>Erro ao carregar livros.</p>";
  } finally {
    carregando = false;
  }
}

// carrega gênero padrão ao abrir a página
window.addEventListener("DOMContentLoaded", () => carregarLivros(generoAtual));
