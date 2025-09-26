<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['username'] ?? null;
?>

<!-- header  -->
<?php include("header.php");?>
<?php include("topo.php");?>

<body>
    <main>
        <!-- abre o if -->
        <?php if ($username): ?>

            <section class="perfil">
                <!-- Aqui ficara o perfil.php -->
            </section>

            <section class="abas"> 
                <div class="abas-menu">
                    <button class="aba-link ativo" data-aba="info">Info</button>
                    <button class="aba-link" data-aba="addLivro">Adicionar livros</button>
                    <button class="aba-link" data-aba="listarLivro">Meus Livros</button>
                </div>

                <div class="tabGroup" id="conteudo-aba">
                    <!-- As Abas ficarao aqui dentro, sendo introduzidas com php include -->

                    <?php include("../includes/dashboard/tabViews/info.php");?>
                </div>
            
            </section>

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

<!-- Script -->
<script src="../assets/js/jquery-3.7.1.min.js"></script>
<script src="../assets/js/tab.js"></script>
<script src="../assets/js/app.js"></script>

</body>
</html>