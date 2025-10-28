document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".form-filter");
    const containerFiltros = document.getElementById("filtrosAtivos");

    function atualizarFiltros() {
        containerFiltros.innerHTML = ""; // limpa antes de redesenhar

        // pega todos os checkboxes marcados
        const marcados = form.querySelectorAll("input[type='checkbox']:checked");

        if (marcados.length === 0) {
            containerFiltros.innerHTML = "<p>Nenhum filtro ativo</p>";
            return;
        }

        marcados.forEach((input) => {
            const label = input.parentElement.textContent.trim();

            const tag = document.createElement("span");
            tag.className = "filtro-tag";
            tag.textContent = label;

            // botão para remover o filtro
            const x = document.createElement("button");
            x.textContent = "X";
            x.className = "remove-filtro";
            x.onclick = function (e) {
                e.preventDefault();
                input.checked = false;
                atualizarFiltros();
                form.submit(); // reenvia form com o filtro removido
            };

            tag.appendChild(x);
            containerFiltros.appendChild(tag);
        });

        // botão para limpar tudo
        const limparTudo = document.createElement("button");
        limparTudo.textContent = "Limpar tudo";
        limparTudo.className = "limpar-filtros";
        limparTudo.onclick = function (e) {
            e.preventDefault();
            marcados.forEach((input) => (input.checked = false));
            atualizarFiltros();
            form.submit();
        };
        containerFiltros.appendChild(limparTudo);
    }

    atualizarFiltros();

    // atualiza automaticamente quando marcar/desmarcar
    form.addEventListener("change", atualizarFiltros);
});