const API_KEY = "AIzaSyD6VorJvqdvj6QJOMjqkQfisWV5vxeO1tY";
const cacheCapas = new Map(); // salva resultados já buscados

async function buscarCapa(titulo, autor) {
  const chave = `${titulo}|${autor}`;
  if (cacheCapas.has(chave)) return cacheCapas.get(chave);

  const query = `${titulo} ${autor}`;
  const url = `https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(query)}&maxResults=1&key=${API_KEY}`;

  try {
    const res = await fetch(url);
    if (!res.ok) throw new Error(`Erro HTTP ${res.status}`);

    const dados = await res.json();
    const item = dados.items && dados.items[0];
    const links = item?.volumeInfo?.imageLinks;
    const capa = links ? (links.thumbnail || links.smallThumbnail) : null;

    cacheCapas.set(chave, capa); // salva no cache
    return capa;
  } catch (err) {
    console.warn("Erro ao buscar capa:", titulo, err);
    cacheCapas.set(chave, null);
    return null;
  }
}

function fixHttps(url) {
  return url ? url.replace(/^http:\/\//, 'https://') : url;
}

async function atualizarCapas(livros) {
  const imgs = document.querySelectorAll("#livros .info img");

  for (let i = 0; i < livros.length; i++) {
    try {
      const capa = await buscarCapa(livros[i].titulo, livros[i].autor);
      if (capa && imgs[i]) imgs[i].src = fixHttps(capa);

      // pequeno atraso para evitar rate limit da API
      await new Promise(r => setTimeout(r, 150));
    } catch (e) {
      console.error("Erro ao atualizar capa:", livros[i].titulo, e);
    }
  }
}
