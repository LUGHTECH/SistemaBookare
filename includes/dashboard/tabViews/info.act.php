<?php
require('../../connect.php');
@session_start();
extract($_POST);
extract($_FILES);

$id_usuario = $_SESSION['id_usuario'];
$msg = "";
$destino = "";

if ($fotoUser['size'] > 0) {

    $dir = "uploads/usuarios/$id_usuario/";

    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }

    $nomeArquivo = md5(time() . $fotoUser['size']) . ".jpg";
    $destino = $dir . $nomeArquivo;

    if (move_uploaded_file($fotoUser['tmp_name'], $destino)) {

        if (mysqli_query($con2, "UPDATE `tb_usuario` SET `foto_usuario` = '$destino' WHERE `id_usuario` = $id_usuario")) {
            $_SESSION['fotoUser'] = $destino; // ✅ Atualiza a variável de sessão
            $msg = "<p class='foto-sucesso'>Foto de perfil adicionada!</p>";
        } else {
            $msg = "<p class='foto-erro'>Erro ao adicionar foto de perfil!</p>";
        }

    } else {
        $msg = "<p class='foto-erro'>Erro ao mover o arquivo para o destino!</p>";
    }
}

$_SESSION['msg'] = $msg;

// Redireciona de volta para a dashboard
header("Location: ../../dashboard.php");
exit;
?>
