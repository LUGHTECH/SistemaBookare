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
$email = trim((string)($_POST['email_usuario'] ?? ''));
$password = (string)($_POST['senha_usuario'] ?? '');
$password_confirm = (string)($_POST['password_confirm'] ?? '');

$errors = [];
$old_input = ['nome_usuario' => $username, 'email_usuario' => $email];

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
$stmt = $pdo->prepare('SELECT id_usuario FROM tb_usuario WHERE email_usuario = :email_usuario OR nome_usuario = :nome_usuario LIMIT 1');
$stmt->execute(['email_usuario' => $email, 'nome_usuario' => $username]);
$existing = $stmt->fetch();
if ($existing) {
    $_SESSION['errors'] = ['E‑mail ou nome de usuário já cadastrado.'];
    $_SESSION['old_input'] = $old_input;
    header('Location: createUser.php');
    exit;
}

// inserir novo usuário
$hash = password_hash($password, PASSWORD_DEFAULT);

$role = 'user'; // controle de usuarios e admins

try {
    $pdo->beginTransaction(); // inicia transação

    // 1️⃣ insere o usuário
    $insert = $pdo->prepare('INSERT INTO tb_usuario (nome_usuario, email_usuario, senha_usuario, role)
                              VALUES (:username, :email, :password, :role)');
    $insert->execute([
        ':username' => $username,
        ':email' => $email,
        ':password' => $hash,
        ':role' => $role
    ]);

    // pega o ID do usuário criado
    $id_usuario = $pdo->lastInsertId();

    // 2️⃣ cria as linhas correspondentes em contato e endereço
    $pdo->prepare('INSERT INTO tb_contato (id_usuario) VALUES (:id_usuario)')
        ->execute([':id_usuario' => $id_usuario]);

    $pdo->prepare('INSERT INTO tb_endereco (id_usuario) VALUES (:id_usuario)')
        ->execute([':id_usuario' => $id_usuario]);

    // tudo certo, confirma
    $pdo->commit();

    $_SESSION['success'] = true;
    header('Location: createUser.php');
    exit;
} catch (PDOException $e) {
    // se algo falhar, reverte tudo
    $pdo->rollBack();

    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    die('Erro PDO: ' . $e->getMessage());
}
