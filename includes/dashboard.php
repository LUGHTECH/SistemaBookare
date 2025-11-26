<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['nome_usuario'] ?? null;

?>




<head>
    <title>Bookare-Dashboard</title>
</head>
<!-- header  -->
<?php include("header.php"); ?>
<?php include("topo.php"); ?>
<?php
// conexão com o banco (ajuste conforme seu arquivo)
require_once __DIR__ . "/connect.php";

?>

<body>
    <main style="margin-top: 120px; margin-bottom: 120px">
        <!-- abre o if -->
        <?php if ($username): ?>

            <section class="perfil">
                <!-- Aqui ficara o perfil.php -->
            </section>

            <section class="abas">
                <div class="container2">
                    <div class="abas-menu">
                        <!-- "ativo" é a principal padrao, e toda aba-link é uma opção, para adicionar mais paginas é so adicionar 
                 mais botao quele ele busca pela data-aba, so quero deixar meu depoimento que foi dor de cabeça 
                 tentar a arrumar o listar pra depois decobrir que o problema era o connnect.php, slk -->
                        <?php if (isset($_SESSION['id_usuario']) && ($_SESSION['role'] ?? '') === 'admin'): ?>
                            <button class="aba-link" data-aba="relatorios">Relatórios - Administração<img src="../assets/img/credit-card.png" alt=""></button>
                        <?php endif; ?>
                        <button class="aba-link ativo" data-aba="info">Minhas Informações <img src="../assets/img/infoUser.png" alt=""></button>
                        <button class="aba-link" data-aba="addLivro">Adicionar livros <img src="../assets/img/addLivros.png" alt=""></button>
                        <button class="aba-link" data-aba="listarLivro">Meus Livros <img src="../assets/img/meusLivros.png" alt=""></button>
                        <button class="aba-link" data-aba="planos">Planos <img src="../assets/img/credit-card.png" alt=""></button>
                    </div>

                    <div class="tabGroup" id="conteudo-aba">
                        <!-- As Abas ficarao aqui dentro, sendo introduzidas com php include -->

                        <?php include("../includes/dashboard/tabViews/info.php"); ?>
                    </div>
                </div>
            </section>


            <!-- fecha o if com else -->
        <?php else: ?>
            <p>Não tem uma conta ainda?, entre agora para a <span>Bookare</span> e faça parte dessa comunidade.</p>
            <a href="loginUser.php">Entrar</a> | <a href="createUser.php">Criar conta</a>
        <?php endif; ?>
    </main>

    <div class="modal" id="confirmarModal">
        <div class="modal-content">
            <div class="close">
                <h3>Excluir</h3><img onclick="fecharModal()" src="../assets/img/close.png" alt="">
            </div>
            <p id="mensagemModal"></p>
            <div class="modal-botoes">
                <button class="yes" onclick="confirmarExclusao()">Sim</button>
                <button class="no" onclick="fecharModal()">Cancelar</button>
            </div>
        </div>
    </div>

    <?php include(__DIR__ . "/footer.php"); ?> <!--footer-->

    <!-- Script -->
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/tab.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/buscaLivro.js"></script>
    <script src="../assets/js/modalForm.js"></script>
    <script src="../assets/js/refresh.js"></script>
    <script src="../assets/js/modalLivro.js"></script>
    <script src="../assets/js/fotoCadastro.js"></script>
    <script src="../assets/js/carregarRelatorio.js"></script>
    <script src="../assets/js/consultaCep.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</body>

</html>