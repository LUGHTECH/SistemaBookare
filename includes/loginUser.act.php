<?php
session_start();

// Debug helpers se a gente precisar caso algum erro
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método não permitido');
}

if (empty($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'] ?? '', $_POST['csrf_token'])) {
    $_SESSION['errors'] = ['Requisição inválida.'];
    header('Location: loginUser.php');
    exit;
}

$identifier = trim((string)($_POST['identifier'] ?? ''));
$password = (string)($_POST['senha_usuario'] ?? '');

$errors = [];
$old_input = ['identifier' => $identifier];

// validação básica: aceita e‑mail ou username
if ($identifier === '') {
    $errors[] = 'E‑mail ou nome de usuário inválido.';
} elseif (strpos($identifier, '@') !== false) {
    // parece e‑mail
    if (!filter_var($identifier, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'E‑mail inválido.';
    }
} else {
    // username
    if (strlen($identifier) < 3) {
        $errors[] = 'Nome de usuário inválido.';
    }
}

if ($password === '' || strlen($password) < 8) {
    $errors[] = 'Senha inválida.';
}

if ($errors) {
    $_SESSION['errors'] = $errors;
    $_SESSION['old_input'] = $old_input;
    header('Location: loginUser.php');
    exit;
}

// Conexão ao DB (XAMPP padrão). Ajuste se necessário.
$host = 'localhost';
$db   = 'bd_bookare';
$user = 'root';
$pass = '';
$charset = 'utf8mb4';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    $_SESSION['errors'] = ['Erro de conexão com o banco de dados.'];
    header('Location: loginUser.php');
    exit;
}

// busca pelo e-mail ou nome de usuário (corrigido)
$stmt = $pdo->prepare(
    'SELECT id_usuario, nome_usuario, foto_usuario, senha_usuario, role FROM tb_usuario 
     WHERE email_usuario = :identifier OR nome_usuario = :identifier2 
     LIMIT 1'
);
$stmt->execute([
    'identifier'  => $identifier,
    'identifier2' => $identifier
]);
$userRow = $stmt->fetch();


if (!$userRow || !password_verify($password, $userRow['senha_usuario'])) {
    // mensagem genérica (não expõe se o email/usuário existe)
    $_SESSION['errors'] = ['E-mail/nome de usuário ou senha inválidos.'];
    $_SESSION['old_input'] = $old_input;
    header('Location: loginUser.php');
    exit;
}

// Login bem-sucedido: configura sessão segura
session_regenerate_id(true);
$_SESSION['id_usuario'] = $userRow['id_usuario'];
$_SESSION['username'] = $userRow['nome_usuario'];
$_SESSION['fotoUser'] = $userRow['foto_usuario'];
$_SESSION['role'] = $userRow['role'];

// Redireciona para área restrita (crie dashboard.php ou altere conforme necessário)
header('Location: pesquisa.php'); // vai direto para o catalogo
exit;
?>