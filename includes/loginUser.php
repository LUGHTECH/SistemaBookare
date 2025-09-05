<?php session_start();
// Token CSRF simples
if (empty($_SESSION['csrf_token'])) {
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// recuperar valores (para o Design (Porque não?))
$old = $_SESSION['old_input'] ?? [];
$errors = $_SESSION['errors'] ?? [];

// limpar mensagens flash
unset($_SESSION['old_input'], $_SESSION['errors'], $_SESSION['success']);
?> <!--  -->

<?php include("../includes/headerMain.php");?>
<link rel="stylesheet" href="../assets/style/loginUser.css">
<body>
    <main>

        <section class="banner"></section>

        <section class="window">
            <article class="Login">
                <div><!-- login usuario -->
                    <img src="" alt="">
                    <h3>Entre na sua conta</h3>
                    <p>ou <em><a href="createUser.php">criar</a>.</em></p>
                    
                    <div class="errors">
                        <?php foreach ($errors as $e) echo "• " . htmlspecialchars($e) . "<br>"; ?>
                    </div>

                    <form action="loginUser.act.php" method="post" autocomplete="off" novalidate>
                        <input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars($_SESSION['csrf_token']); ?>">
                        
                        <div class="field">
                            <label for="identifier">E‑mail ou nome de usuário</label>
                            <input id="identifier" name="identifier" type="text" required maxlength="255" value="<?php echo htmlspecialchars($old['identifier'] ?? ''); ?>" autofocus>
                        </div>

                        <!-- Senha do Usuario -->
                        <div class="field">
                            <label for="password">Senha</label>
                            <input id="password" name="password" type="password" required minlength="8">
                        </div>

                        <!-- Botao "Seguinte" para seguir para proxima etapa do cadastro -->
                        <button class="btn" type="submit">Entrar</button>
                    </form>

                </div>

                <div><!-- banner do login( etapas do cadastro) -->

                </div>
            </article>
        </section>

    </main>
</body>
</html>