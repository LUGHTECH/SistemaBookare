

function abrirModal(codigo, titulo, tabela){
  codigoAtual = codigo;
  tabelaAtual = tabela;
  tituloAtual = titulo;

  document.getElementById("mensagemModal").innerText =
    "Deseja excluir este livro: " + titulo + "?";

  document.getElementById("confirmarModal").style.opacity = "1";
  document.getElementById("confirmarModal").style.visibility = "visible";
}

function fecharModal(){
  document.getElementById("confirmarModal").style.opacity = "0";
  document.getElementById("confirmarModal").style.visibility = "hidden";
}

function confirmarExclusao(){
  document.getElementById("mensagemModal").innerText = "Excluido com sucesso!";
  
  setTimeout(fecharModal, 2000);


  $.ajax({
    type: "post",
    url: "../includes/excluir.php",
    data: { codigo: codigoAtual, titulo: tituloAtual, tabela: tabelaAtual }, // <- corrigido
    success: function (response) {
     $(".seusLivros").load("../includes/dashboard/tabViews/listarLivro.php .seusLivros > *");
    },
    error: function (xhr, status, error) {
      console.log("Erro AJAX:", error);
      console.log("Resposta do servidor (erro):", xhr.responseText);
      alert("Erro AJAX: " + error);
    }
  });
}
