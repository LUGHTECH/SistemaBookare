<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['username'] ?? null;
?>

<head><title>Bookare-Dashboard</title></head>
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
                <div class="container2">
                <div class="abas-menu">
                <!-- "ativo" é a principal padrao, e toda aba-link é uma opção, para adicionar mais paginas é so adicionar 
                 mais botao quele ele busca pela data-aba, so quero deixar meu depoimento que foi dor de cabeça 
                 tentar a arrumar o listar pra depois decobrir que o problema era o connnect.php, slk -->

                    <button class="aba-link ativo" data-aba="info">Info</button>
                    <button class="aba-link" data-aba="addLivro">Adicionar livros</button>
                    <button class="aba-link" data-aba="listarLivro">Meus Livros</button>
                </div>

                <div class="tabGroup" id="conteudo-aba">
                    <!-- As Abas ficarao aqui dentro, sendo introduzidas com php include -->

                    <?php include("../includes/dashboard/tabViews/info.php");?>
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
                <div class="close"><h3>Excluir</h3><img onclick="fecharModal()" src="../assets/img/close.png" alt=""></div>
                <p id="mensagemModal"></p>
                <div class="modal-botoes">
                    <button class="yes" onclick="confirmarExclusao()">Sim</button>
                    <button class="no" onclick="fecharModal()">Cancelar</button>
                </div>
            </div>
    </div>

<!-- Script -->
<script src="../assets/js/jquery-3.7.1.min.js"></script>
<script src="../assets/js/tab.js"></script>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/buscaLivro.js"></script>



</body>
</html>