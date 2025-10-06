    <?php
    @session_start();
    require('connect.php');
    extract($_POST);


    if ($tabela == "livro"){
        if(mysqli_query($con2, "Delete from `tb_livro` where `id_livro` = '$codigo'")){
            echo "<p class=sucesso>Registro excluido com sucesso</p>";
        }else{
            echo "<p class=erro>Falha ao excluir o resgistro</p>";
        }
    }