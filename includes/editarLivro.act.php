<?php
$host = 'localhost';
$dbname = 'bd_bookare';
$username = 'root';
$password = '';

$mensagem = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro de conexão: ' . $e->getMessage()]);
    exit;
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Recebe e limpa os valores
    $id_livro          = (int) $_POST['id_livro'];
    $nome_livro        = trim($_POST['nome_livro']);
    $livro_autor       = trim($_POST['livro_autor']);
    $livro_idioma      = trim($_POST['livro_idioma']);
    $livro_conservacao = trim($_POST['livro_conservacao']);
    $livro_edicao      = trim($_POST['livro_edicao']);
    $livro_sinopse     = trim($_POST['livro_sinopse']);    //FAZER DE NOVO COM BASE NO EDITARLIVRO.PHP----NAO FUNCIONA SE O WENZIO QUEISER ELE FAZ

    try{

        $sql = "UPDATE tb_livro 
                SET 
                    nome_livro = :nome_livro,
                    livro_autor = :livro_autor,
                    livro_idioma = :livro_idioma,
                    livro_conservacao = :livro_conservacao,
                    livro_edicao = :livro_edicao,
                    livro_sinopse = :livro_sinopse
                WHERE id_livro = :id_livro";

        $stmt = $pdo->prepare($sql);

        $stmt ->execute([
            'nome_livro' => $nome_livro,
            'livro_autor' => $livro_autor,
            'livro_idioma' => $livro_conservacao,
            'livro_edicao' => $livro_edicao,
            'livro_sinopse' =>$livro_sinopse,
            ':id_livro' => $id_livro
        ]);

        
        $mensagem = "Alterado com Sucesso!!";
        @session_start();

        $_SESSION['mensagem'] = $mensagem;

        header("location: editarLivro.php?cod=$id_livro");

    }catch (PDOException $e){
        echo "Erro ao atualizar: " . $e->getMessage();
    }
}
