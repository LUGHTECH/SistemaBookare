<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['username'] ?? null;
?>

<!-- header  -->
<?php include("../includes/header.php");?>
<body>
    <main>
        <!-- abre o if -->
        <?php if ($username): ?>

            <!-- Exibição de usuario -->
            <p>Olá, <?= htmlspecialchars($username, ENT_QUOTES, 'UTF-8') ?></p>




            <!-- botao de logout, vai por min cleb e necessario -->
            <form method="post" action="logout.php" style="display:inline">
                <input type="hidden" name="csrf_token" value="<?= htmlspecialchars($_SESSION['csrf_token'] ?? '') ?>">
                <button type="submit">Sair</button>
            </form>
        
        <!-- fecha o if com else -->
        <?php else: ?>
            <p>Não tem uma conta ainda?, entre agora para a <span>Bookare</span> e faça parte dessa comunidade.</p>
            <a href="loginUser.php">Entrar</a> | <a href="createUser.php">Criar conta</a>
        <?php endif; ?>
    </main>
</body>
</html>