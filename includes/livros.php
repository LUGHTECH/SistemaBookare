<?php
require('connect.php');

$idGenero = isset($_GET['genero']) ? (int)$_GET['genero'] : 1;

$sql = "SELECT * FROM tb_livro WHERE id_genero = $idGenero LIMIT 10";
$result = mysqli_query($con, $sql);

$livros = [];
while ($row = mysqli_fetch_assoc($result)) {
    $livros[] = $row;
}

header('Content-Type: application/json; charset=utf-8');
echo json_encode($livros, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
