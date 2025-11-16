<?php
// enviar_mensagem.php
// Ajuste o caminho para o connect.php conforme sua estrutura.
// Exemplo comum quando este arquivo está em includes/: require __DIR__ . '/connect.php';
require_once __DIR__ . '/connect.php'; // <<< ajuste se necessário

// localizar PHPMailer (suporta duas estruturas: src/ ou arquivos direto)
$base = __DIR__ . '/phpmailer';
if (file_exists($base . '/src/PHPMailer.php')) {
    require_once $base . '/src/Exception.php';
    require_once $base . '/src/PHPMailer.php';
    require_once $base . '/src/SMTP.php';
} elseif (file_exists($base . '/PHPMailer.php')) {
    require_once $base . '/Exception.php';
    require_once $base . '/PHPMailer.php';
    require_once $base . '/SMTP.php';
} else {
    die('PHPMailer não encontrado. Coloque a pasta phpmailer dentro de includes e verifique.');
}

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    die('Acesso inválido.');
}

// --- pegar POST com validação básica ---
$id_dono = isset($_POST['id_dono']) ? intval($_POST['id_dono']) : 0;
$id_livro = isset($_POST['id_livro']) ? intval($_POST['id_livro']) : 0;
$nome = trim($_POST['nome'] ?? '');
$email = trim($_POST['email'] ?? '');
$mensagem = trim($_POST['mensagem'] ?? '');

// validações simples
if ($id_dono <= 0 || empty($nome) || empty($email) || empty($mensagem)) {
    die('Preencha todos os campos corretamente.');
}
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die('E-mail inválido.');
}

// --- buscar dados do dono no banco (usa seu $con2 do connect.php) ---
$dono = null;
$sql = "SELECT id_usuario, nome_usuario, email_usuario FROM tb_usuario WHERE id_usuario = ?"; //busca de usuarios
if ($stmt = mysqli_prepare($con2, $sql)) {
    mysqli_stmt_bind_param($stmt, "i", $id_dono);
    mysqli_stmt_execute($stmt);
    $res = mysqli_stmt_get_result($stmt);
    $dono = mysqli_fetch_assoc($res);
    mysqli_stmt_close($stmt);
}
if (!$dono) {
    die('Dono do livro não encontrado.');
}

$livro = null;
$sql2 = "SELECT nome_livro FROM tb_livro WHERE id_livro = ?"; //busca de livros, usado no titulo do e-mail
if ($stmt2 = mysqli_prepare($con2, $sql2)) {
    mysqli_stmt_bind_param($stmt2, "i", $id_livro);
    mysqli_stmt_execute($stmt2);
    $res2 = mysqli_stmt_get_result($stmt2);
    $livro = mysqli_fetch_assoc($res2);
    mysqli_stmt_close($stmt2);
}

if (!$livro) {
    die('Livro não encontrado.');
}

// --- configurar PHPMailer ---
$mail = new PHPMailer(true);

try {
    // DEBUG (temporário). 0 = off. Para desenvolvimento coloque 2 para ver detalhes.
    $mail->SMTPDebug = 0;

    $mail->isSMTP();

    // --- CONFIGURE AQUI com seus dados SMTP ---
    // Exemplo Gmail:
    $mail->Host       = 'smtp.gmail.com';
    $mail->SMTPAuth   = true;
    $mail->Username   = 'cleberson.gomes2004@gmail.com';       // coloque seu e-mail
    $mail->Password   = 'nlwfkjpqnwsdvnxc';          // coloque a senha de app do Gmail
    $mail->SMTPSecure = 'tls';                       // ou 'ssl' se usar porta 465
    $mail->Port       = 587;

    // Quem envia (remetente)
    $mail->setFrom('no-reply@seusite.com', 'Bookare - Notificação');

    // Para quem será enviado (o dono do livro)
    $mail->addAddress($dono['email_usuario'], $dono['nome_usuario']);

    // Opcional: reply-to para permitir que o dono responda diretamente ao interessado
    $mail->addReplyTo($email, $nome);

    // Conteúdo
    $mail->isHTML(true);
    $mail->CharSet = 'UTF-8';
    $mail->Subject = "Alguém demonstrou interesse no seu livro: \"{$livro['nome_livro']}\" - Bookare";
    $mailBody = "
        <p>Olá <strong>" . htmlspecialchars($dono['nome_usuario']) . "</strong>,</p>
        <p>Você recebeu uma mensagem de <strong>" . htmlspecialchars($nome) . "</strong> através do Bookare:</p>
        <p><strong>E-mail do interessado:</strong> " . htmlspecialchars($email) . "</p>
        <p><strong>Mensagem:</strong><br>" . nl2br(htmlspecialchars($mensagem)) . "</p>
        <hr>
        <p>Se desejar, responda diretamente para o e-mail do interessado.</p>
    ";
    $mail->Body = $mailBody;
    $mail->AltBody = "Olá {$dono['nome_usuario']}\n\nVocê recebeu uma mensagem de {$nome} ({$email}):\n\n{$mensagem}\n\nResponda diretamente para o e-mail do interessado.";

    // Envia
    $mail->send();

    // redireciona com sucesso (ajuste o caminho se necessário)

    header("Location: detalhesTroca.php?id_usuario={$id_dono}&id_livro={$id_livro}&mensagem_enviada=1");
    exit;
} catch (Exception $e) {
    // mostrar erro informativo em desenvolvimento
    // em produção registre o erro em arquivo e mostre mensagem amigável
    error_log('PHPMailer error: ' . $mail->ErrorInfo);
    //echo "Erro ao enviar a mensagem: " . htmlspecialchars($mail->ErrorInfo);
    // ou redirecione com erro:
     header("Location: " . ($_SERVER['HTTP_REFERER'] ?? 'index.php') . "?mensagem_enviada=0");
    // exit;
}
