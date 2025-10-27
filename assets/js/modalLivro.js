

function abrirModalLivro(livro) {
    
        document.getElementById("tituloLivro").textContent = livro.nome_livro || "Sem título";
        document.getElementById("autorLivro").textContent = livro.nome_autor || "Desconhecido";
        document.getElementById("generoLivro").textContent = livro.nome_genero || "—";
        document.getElementById("idiomaLivro").textContent = livro.idioma || "—";
        document.getElementById("anoLivro").textContent = livro.ano_pub_livro || "—";
        document.getElementById("editoraLivro").textContent = livro.nome_editora || "—";
        document.getElementById("sinopseLivro").textContent = livro.sinopse_livro || "Sem sinopse disponível";
        document.getElementById("condicaoLivro").textContent = livro.condicao_livro || "Desconhecido";



    const capa = document.getElementById("capaLivro");
    capa.src = livro.capa ? `/SistemaBookare/includes/dashboard/tabViews/${livro.capa}` : "../assets/img/defaultBook.png";

    const modal = document.getElementById('modalLivro')
    modal.style.opacity = "1";
    modal.style.visibility = "visible";
}

function fecharModal() {

    document.querySelectorAll(".modal, .modal2, .modal3").forEach(modal => {
        modal.style.opacity = "0";
        modal.style.visibility = "hidden";
    });
}