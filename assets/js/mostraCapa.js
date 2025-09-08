// Carregue este arquivo ANTES de livros.js no index.php

const API_KEY = "AIzaSyD6VorJvqdvj6QJOMjqkQfisWV5vxeO1tY";

async function buscarCapa(titulo, autor) {
  const query = `${titulo} ${autor}`;
  const url = `https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(query)}&maxResults=1&key=${API_KEY}`;
  const res = await fetch(url);
  const dados = await res.json();

  const item = dados.items && dados.items[0];
  const links = item && item.volumeInfo && item.volumeInfo.imageLinks;
  return links ? (links.thumbnail || links.smallThumbnail) : null;
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
    } catch (e) {
      console.error("Erro ao buscar capa:", livros[i].titulo, e);
    }
  }
}
AIzaSyD6VorJvqdvj6QJOMjqkQfisWV5vxeO1tY