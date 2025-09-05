<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] !== 'POST' ||
    empty($_POST['csrf_token']) ||
    !hash_equals($_SESSION['csrf_token'] ?? '', $_POST['csrf_token'])) {
    // requisição inválida — redireciona ao dashboard ou login
    header('Location: dashboard.php');
    exit;
}

// limpa sessão + cookie (mesma rotina do exemplo GET)
$_SESSION = [];
if (ini_get('session.use_cookies')) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params['path'], $params['domain'],
        $params['secure'], $params['httponly']
    );
}
session_destroy();

header('Location: loginUser.php');
exit;
