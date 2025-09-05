  let generoAtual = 1; // padrão

        function carregarLivros(idGenero) {
            generoAtual = idGenero;
            fetch(`./includes/livros.php?genero=${idGenero}`)
                .then(res => res.text())
                .then(html => {
                    document.getElementById('livros').innerHTML = html;
                });
        }

       /* function verMais() {
            // aqui você pode implementar paginação via fetch
            alert("Implementar paginação aqui 😅");
        } */ 

        // carrega o gênero padrão ao abrir
        window.onload = () => carregarLivros(generoAtual);