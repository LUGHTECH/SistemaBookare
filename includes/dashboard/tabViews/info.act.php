<?php
require('../../connect.php');
@session_start();
extract($_POST);
extract($_FILES);
$id_usuario = $_SESSION['id_usuario'];
//var_dump($id_usuario);
$msg = ""; //vetor que armazena as mensagens
$destino = ""; //variavel que armazena o destino das fotos.

// a propriedade size retorna o tamanho do arquivo, em bytes.

if ($fotoUser['size'] > 0) {

    $dir = "uploads/usuarios/$id_usuario/";

    if (!is_dir($dir)) {
        mkdir($dir, 0777, true); // o true cria pastas automaticamente, caso alguma não exista
    }

    $nomeArquivo = md5(time() . $fotoUser['size']) . ".jpg";
    $destino = $dir . $nomeArquivo;
    move_uploaded_file($fotoUser['tmp_name'], $destino);

    if(mysqli_query($con2, "UPDATE `tb_usuario` SET `foto_usuario` = '$destino' WHERE `id_usuario` = $id_usuario ")){
        $msg = "<p class='foto-sucesso'>Foto de perfil adicionada!</p>";
    } else{
        $msg = "<p class='foto-erro'>Erro ao adicionar foto de perfil!</p>'";
    }
    
}

$_SESSION['msg'] = $msg;

header("location:../../dashboard.php");
