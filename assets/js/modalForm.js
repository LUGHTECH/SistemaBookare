let dadosAtuais = {}; // usado para armazenar o que está sendo editado (opcional)

function abrirFormModal(dados = null) {
  // se vierem dados (edição), preencher os campos
  if (dados) {
    document.getElementById("logradouro").value = dados.logradouro || "";
    document.getElementById("numero").value = dados.numero || "";
    document.getElementById("complemento").value = dados.complemento || "";
    document.getElementById("cidade").value = dados.cidade || "";
    document.getElementById("bairro").value = dados.bairro || "";
    document.getElementById("id_estado").value = dados.nome_estado || "";
    document.getElementById("cep").value = dados.cep || "";
    document.getElementById("id_ddd").value = dados.ddd || "";
    document.getElementById("celular").value = dados.celular || "";
    
    dadosAtuais = dados; 
  }


  const modal = document.getElementById("formModalContainer");
  modal.style.opacity = "1";
  modal.style.visibility = "visible";
}

function fecharModal() {
  
  document.querySelectorAll(".modal, .modal2").forEach(modal => {
    modal.style.opacity = "0";
    modal.style.visibility = "hidden";
  });
}

function enviarFormulario(event) {
  event.preventDefault(); 


  const form = document.getElementById("formModal");
  const formData = {
    logradouro: form.querySelector("#logradouro").value,
    numero: form.querySelector("#numero").value,
    complemento: form.querySelector("#complemento").value,
    cidade: form.querySelector("#cidade").value,
    bairro: form.querySelector("#bairro").value,
    nome_estado: form.querySelector("#id_estado").value,
    cep: form.querySelector("#cep").value,
    ddd: form.querySelector("#id_ddd").value,
    celular: form.querySelector("#celular").value,
  };

  // se quiser, pode incluir um ID (ex: do usuário logado)
  // formData.id_usuario = dadosAtuais.id_usuario;

  // envia via AJAX
  $.ajax({
    type: "post",
    url: "../includes/dashboard/tabViews/atualizarCadastro.php", // <- seu endpoint PHP
    data: formData,
    success: function (response) {
      console.log("Resposta:", response);



      alert("Cadastro atualizado com sucesso!");
      fecharModal();
    },
    error: function (xhr, status, error) {
      console.log("Erro AJAX:", error);
      console.log("Resposta do servidor:", xhr.responseText);
      alert("Erro ao atualizar cadastro: " + error);
    }
  });
}
