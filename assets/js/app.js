function excluir(codigo,tabela){
   var resp = confirm("Deseja excluir registro: " + codigo + "?");

    if(resp == true){
               console.log("Usuário confirmou, enviando AJAX...");

        $.ajax({
            type: "post",
            url: "../includes/excluir.php",
            data: {codigo:codigo, tabela:tabela},
            success: function (response) {
                window.location.reload();
            },
             error: function (xhr, status, error) {
                console.log("Erro AJAX:", error);
                console.log("Resposta do servidor (erro):", xhr.responseText);
                alert("Erro AJAX: " + error);
            }
        });
    } else{
        alert ("erro");
    }
}
