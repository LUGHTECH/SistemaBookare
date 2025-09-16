<?php
session_start();

// ----- Conectar ao DB (ajuste credenciais) ----- IMPORTANTE cleb
$host = 'localhost';
$db   = 'bd_bookare'; // Nome do Banco
$user = 'root'; // XAMPP: usuário padrão
$pass = '';     // XAMPP: senha padrão vazia
$charset = 'utf8mb4';
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Método não permitido');
}

// CSRF
if (empty($_POST['csrf_token']) || !hash_equals($_SESSION['csrf_token'] ?? '', $_POST['csrf_token'])) {
    $_SESSION['errors'] = ['Requisição inválida.'];
    header('Location: createUser.php');
    exit;
}

// coleta e saneamento básico
$username = trim((string)($_POST['nome_usuario'] ?? ''));
$email = trim((string)($_POST['email_usuario'] ?? ''));$password = (string)($_POST['password'] ?? '');
$password_confirm = (string)($_POST['password_confirm'] ?? '');

$errors = [];
$old_input = ['username' => $username, 'email' => $email];

// validações server-side
if ($username === '' || strlen($username) < 3) {
    $errors[] = 'O nome de usuário deve ter pelo menos 3 caracteres.';
} elseif (strlen($username) > 50) {
    $errors[] = 'Nome de usuário muito longo.';
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = 'E‑mail inválido.';
}

if (strlen($password) < 8) {
    $errors[] = 'A senha deve ter no mínimo 8 caracteres.';
}

if ($password !== $password_confirm) {
    $errors[] = 'As senhas não conferem.';
}

if ($errors) {
    $_SESSION['errors'] = $errors;
    $_SESSION['old_input'] = $old_input;
    header('Location: createUser.php');
    exit;
}

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (PDOException $e) {
    // em produção, registre o erro em vez de mostrar
    $_SESSION['errors'] = ['Erro de conexão com o banco de dados.'];
    header('Location: createUser.php');
    exit;
}

// verificar se já existe usuário ou e-mail
$stmt = $pdo->prepare('SELECT id FROM user WHERE email = :email OR username = :username LIMIT 1');
$stmt->execute(['email' => $email, 'username' => $username]);
$existing = $stmt->fetch();
if ($existing) {
    $_SESSION['errors'] = ['E‑mail ou nome de usuário já cadastrado.'];
    $_SESSION['old_input'] = $old_input;
    header('Location: createUser.php');
    exit;
}

// inserir novo usuário
$hash = password_hash($password, PASSWORD_DEFAULT);
$insert = $pdo->prepare('INSERT INTO user (username, email, password) VALUES (:username, :email, :password)');
try {
    $insert->execute(['username' => $username, 'email' => $email, 'password' => $hash]);
} catch (PDOException $e) {
    // log error internamente e retornar mensagem genérica
    $_SESSION['errors'] = ['Não foi possível criar a conta no momento.'];
    $_SESSION['old_input'] = $old_input;
    header('Location: createUser.php');
    exit;
}

// sucesso
$_SESSION['success'] = true;

// opcional: redirecionar para login
header('Location: createUser.php');
exit;
?>
