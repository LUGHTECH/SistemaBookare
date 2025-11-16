
function abrirModalLivro(livro) {

    document.getElementById("tituloLivro").textContent = livro.nome_livro || "Sem título";
    document.getElementById("autorLivro").textContent = livro.nome_autor || "Desconhecido";
    document.getElementById("generoLivro").textContent = livro.nome_genero || "—";
    document.getElementById("idiomaLivro").textContent = livro.idioma || "—";
    document.getElementById("anoLivro").textContent = livro.ano_pub_livro || "—";
    document.getElementById("editoraLivro").textContent = livro.nome_editora || "—";
    document.getElementById("sinopseLivro").textContent = livro.sinopse_livro || "Sem sinopse disponível";
    document.getElementById("condicaoLivro").textContent = livro.condicao_livro || "Desconhecido";



    

    const fotos_livro = livro.capa ? livro.capa.split(",") : [];

    const capa = document.getElementById("capaLivro");
    capa.src = fotos_livro[0] ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[0]}` : "../assets/img/defaultBook.png";

    const img1 = document.getElementById("img1");
    img1.src = fotos_livro[1]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[1]}`
        : "../assets/img/defaultBook.png";

    const img2 = document.getElementById("img2");
    img2.src = fotos_livro[2]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[2]}`
        : "../assets/img/defaultBook.png";

        const img3 = document.getElementById("img3");
    img3.src = fotos_livro[3]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[3]}`
        : "../assets/img/defaultBook.png";

          const img4 = document.getElementById("img4");
    img4.src = fotos_livro[4]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[4]}`
        : "../assets/img/defaultBook.png";

         const img5 = document.getElementById("img5");
    img5.src = fotos_livro[5]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[5]}`
        : "../assets/img/defaultBook.png";

            const img6 = document.getElementById("img6");
    img6.src = fotos_livro[6]
        ? `/SistemaBookare/includes/dashboard/tabViews/${fotos_livro[6]}`
        : "../assets/img/defaultBook.png";



    const modal = document.getElementById('modalLivro')
    modal.style.opacity = "1";
    modal.style.visibility = "visible";

    const overlay = document.getElementById('fundoModal');
    overlay.classList.add('show');
}

function fecharModal() {

    document.querySelectorAll(".modal, .modal2, .modal3").forEach(modal => {
        modal.style.opacity = "0";
        modal.style.visibility = "hidden";
    });

    document.getElementById('fundoModal').classList.remove('show');
}