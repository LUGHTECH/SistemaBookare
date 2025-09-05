const API_KEY = "AIzaSyD6VorJvqdvj6QJOMjqkQfisWV5vxeO1tY";

async function buscarCapa(titulo, autor) {
    const query = `${titulo} ${autor}`;
    const url = `https://www.googleapis.com/books/v1/volumes?q=${encodeURIComponent(query)}&key=${API_KEY}`;
    
    try {
        const res = await fetch(url);
        const dados = await res.json();

        if (dados.items && dados.items[0].volumeInfo.imageLinks) {
            return dados.items[0].volumeInfo.imageLinks.thumbnail;
        }else {
            // retorna mensagem de debug se não encontrar capa
            return "NAO_ENCONTROU_CAPA";
        }

    } catch (err) {
        console.error("Erro ao buscar capa:", err);
    }

    return null; // fallback se não encontrar
}

livros.forEach(async (livro, index) => {
    const capa = await buscarCapa(livro.titulo, livro.autor);
    if (capa) {
        document.querySelectorAll(".info img")[index].src = capa;
    }
});
