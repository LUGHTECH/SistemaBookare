<?php session_start();
// Token CSRF simples
if (empty($_SESSION['csrf_token'])) {
$_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}

// recuperar valores (para o Design (Porque não?))
$old = $_SESSION['old_input'] ?? [];
$errors = $_SESSION['errors'] ?? [];
$success = $_SESSION['success'] ?? null;

//algo que eu talvez vou implementar
//

// limpar mensagens flash
unset($_SESSION['old_input'], $_SESSION['errors'], $_SESSION['success']);
?> <!--  -->

<?php include("../includes/headerMain.php");?>
<link rel="stylesheet" href="../assets/style/createUser.css">
<body>
    <main>

        <section class="banner"></section>

        <section class="window">
            <article class="create">
                <div><!-- login para criar usuario -->
                    <img src="" alt="">
                    <h3>Crie sua conta</h3>
                    <p>ou <em><a href="loginUser.php">entrar</a>.</em></p>
                    
                    <div class="errors">
                        <?php foreach ($errors as $e) echo "• " . htmlspecialchars($e) . "<br>"; ?>
                    </div>

                    <?php if ($success): ?>
                    <div class="success">Cadastro realizado com sucesso. Você pode <a href="loginUser.php">entrar</a>.</div>
                    <?php endif; ?>
                    
                    <form action="createUser.act.php" method="post" autocomplete="off" novalidate>
                        <input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars($_SESSION['csrf_token']); ?>">
                        
                        <!-- Nome de Usuario -->
                        <div class="field">
                            <label for="username">Nome de usuário</label>
                            <input id="username" name="username" type="text" required maxlength="50" value="<?php echo htmlspecialchars($old['username'] ?? ''); ?>">
                        </div>

                        <!-- E-mail do Usuario -->
                        <div class="field">
                            <label for="email">E‑mail</label>
                            <input id="email" name="email" type="email" required maxlength="255" value="<?php echo htmlspecialchars($old['email'] ?? ''); ?>">
                        </div>

                        <!-- Senha do Usuario -->
                        <div class="field">
                            <label for="password">Senha</label>
                            <input id="password" name="password" type="password" required minlength="8" autocomplete="new-password">
                            <small class="hint">Mínimo 8 caracteres.</small>
                        </div>

                        <!-- Verificação de Senha do Usuario -->
                        <div class="field">
                            <label for="password_confirm">Confirmar senha</label>
                            <input id="password_confirm" name="password_confirm" type="password" required minlength="8" autocomplete="new-password">
                        </div>

                        <!-- Botao "Seguinte" para seguir para proxima etapa do cadastro -->
                        <button class="btn" type="submit">Criar conta</button>
                    </form>

                </div>

                <div><!-- banner do login( etapas do cadastro) -->

                </div>
            </article>
        </section>

    </main>
</body>
</html>