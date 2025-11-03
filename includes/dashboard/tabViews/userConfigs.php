<?php
require('../../connect.php');
@session_start();
$id_usuario = $_SESSION['id_usuario'];
$viewEmail = isset($_POST['viewEmail']) ? 1 : 0;
$viewContato = isset($_POST['viewContato']) ? 1 : 0;

$sql = "UPDATE tb_usuario SET view_email = ?, view_contato = ? WHERE id_usuario = ?";
$stmt = mysqli_prepare($con2, $sql);
mysqli_stmt_bind_param($stmt, "iii", $viewEmail, $viewContato, $id_usuario);
mysqli_stmt_execute($stmt);

header("Location: /SistemaBookare/includes/dashboard.php?salvo=1");
exit;