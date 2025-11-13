function inicializarGerenciadorFotos() {
    const inputCapa = document.getElementById("inputCapa");
    const capaPreview = document.getElementById("capaPreview");
    const inputFotos = document.getElementById("inputFotos");
    const fotosContainer = document.getElementById("fotosContainer");
    const formLivro = document.getElementById("formLivro");
    const alertSuccess = document.getElementById("alertSuccess");
    const alertError = document.getElementById("alertError");

    // --- PREVIEW DA CAPA ---
    inputCapa?.addEventListener("change", (e) => {
        const file = e.target.files[0];
        capaPreview.innerHTML = "";
        if (file) {
            const img = document.createElement("img");
            img.src = URL.createObjectURL(file);          // parte das UNICA capa do livro (MANUAL)
            img.alt = "Capa do Livro";
            img.classList.add("preview-img");
            img.style.maxWidth = "180px";
            img.style.borderRadius = "8px";
            img.style.boxShadow = "0 2px 6px rgba(0,0,0,0.2)";
            capaPreview.appendChild(img);
        } else {
            capaPreview.innerHTML = `<span style="color: #6c757d;">Nenhuma capa selecionada</span>`;
        }
    });

    // --- LISTA TEMPORÁRIA DAS FOTOS SELECIONADAS ---
    let fotosSelecionadas = [];

    // --- PREVIEW DAS FOTOS MÚLTIPLAS ---
    inputFotos?.addEventListener("change", (e) => {
        const novosArquivos = Array.from(e.target.files);

        if (fotosSelecionadas.length + novosArquivos.length > 6) {
            alert("⚠️ Você só pode selecionar até 6 fotos do livro.");
            return;
        }

        // Adiciona os novos arquivos à lista
        fotosSelecionadas.push(...novosArquivos);
        atualizarPreviewFotos();
    });

    function atualizarPreviewFotos() {
        fotosContainer.innerHTML = "";

        if (fotosSelecionadas.length === 0) {
            fotosContainer.innerHTML = `<span style="color: #6c757d;">Nenhuma foto selecionada</span>`;
            return;
        }

        fotosSelecionadas.forEach((file, index) => {
            const reader = new FileReader();
            reader.onload = (event) => {
                const imgWrapper = document.createElement("div");
                imgWrapper.classList.add("foto-preview");
                imgWrapper.style.position = "relative";
                imgWrapper.style.display = "inline-block";
                imgWrapper.style.margin = "6px";

                const img = document.createElement("img");
                img.src = event.target.result;
                img.alt = "Foto do livro";
                img.style.width = "100px";
                img.style.height = "100px";
                img.style.objectFit = "cover";
                img.style.borderRadius = "6px";
                img.style.boxShadow = "0 2px 4px rgba(0,0,0,0.2)";

                // Botão de remover
                const btnRemove = document.createElement("button");
                btnRemove.innerHTML = "×";
                btnRemove.style.position = "absolute";
                btnRemove.style.top = "2px";
                btnRemove.style.right = "4px";
                btnRemove.style.border = "none";
                btnRemove.style.background = "rgba(0,0,0,0.5)";
                btnRemove.style.color = "white";
                btnRemove.style.borderRadius = "50%";
                btnRemove.style.cursor = "pointer";
                btnRemove.style.width = "20px";
                btnRemove.style.height = "20px";
                btnRemove.style.fontSize = "14px";
                btnRemove.addEventListener("click", () => {
                    fotosSelecionadas.splice(index, 1);
                    atualizarPreviewFotos();
                });

                imgWrapper.appendChild(img);
                imgWrapper.appendChild(btnRemove);
                fotosContainer.appendChild(imgWrapper);
            };
            reader.readAsDataURL(file);
        });
    }

    // --- ENVIO DO FORMULÁRIO ---
    formLivro?.addEventListener("submit", async (e) => {
        e.preventDefault();

        const formData = new FormData(formLivro);
        alertSuccess.style.display = "none";
        alertError.style.display = "none";

        // Adiciona manualmente as fotos da lista ao FormData
        fotosSelecionadas.forEach((file) => formData.append("fotos[]", file));

        try {
            const response = await fetch(formLivro.action, {
                method: "POST",
                body: formData,
            });

            const result = await response.text();

            if (response.ok) {
                alertSuccess.textContent = "📚 Livro cadastrado com sucesso!";
                alertSuccess.style.display = "block";
                formLivro.reset();
                capaPreview.innerHTML = `<span style="color: #6c757d;">Nenhuma capa selecionada</span>`;
                fotosSelecionadas = [];
                fotosContainer.innerHTML = "";
            } else {
                throw new Error(result || "Erro ao cadastrar o livro.");
            }
        } catch (err) {
            alertError.textContent = "❌ " + err.message;
            alertError.style.display = "block";
        }
    });
}
