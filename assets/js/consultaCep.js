
document.getElementById("cep").addEventListener("blur", function () {
    let cep = this.value.replace(/\D/g, "");

    if (cep.length !== 8) return;

    fetch(`https://viacep.com.br/ws/${cep}/json/`)
        .then(response => response.json())
        .then(data => {
            if (data.erro) {
                alert("CEP não encontrado!");
                return;
            }

            document.getElementById("logradouro").value = data.logradouro;
            document.getElementById("bairro").value = data.bairro;
            document.getElementById("cidade").value = data.localidade;
            document.getElementById("uf").value = data.uf;
        })
        .catch(err => console.log("Erro: ", err));
});


document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("formModal");
    if (form) {
        form.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault(); // bloqueia o Enter
                return false;
            }
        });
    }
});

