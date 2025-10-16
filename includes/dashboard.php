<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['nome_usuario'] ?? null;
$infoUser = $_SESSION['infoUser'];
if (!$infoUser) {
    // Aqui você pode fazer um fallback (por exemplo, redirecionar ou carregar de novo do banco)
    header("Location: /SistemaBookare/includes/dashboard.php");
    // exit;
}
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

// busca todos os estados
$estados = [];
$query = "SELECT id_estado, estado FROM tb_estado ORDER BY estado ASC";
$result = mysqli_query($con2, $query);

if ($result && mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_assoc($result)) {
        $estados[] = $row;
    }
}


?>

<body>
    <main style="margin-top: 1%;">
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

    <div class="modal2" id="formModalContainer">
        <div class="modal-content2">
            <div class="fechar">
                <h3>Atualizar Cadastro</h3>
                <img onclick="fecharModal()" src="../assets/img/close.png" alt="">
            </div>
            <form action="" id="formModal" onsubmit="enviarFormulario(event)" >
                <fieldset class="endereco">
                    <legend>Endereço 🏠</legend>
                    <div class="form-group">
                        <label for="logradrouro">Logradouro</label>
                        <input type="text" name="logradouro" id="logradouro" value="<?= $infoUser['logradouro'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="numero">Número</label>
                        <input type="number" name="numero" id="numero" value="<?= $infoUser['numero'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="complemento">Complemento</label>
                        <input type="text" name="complemento" id="complemento" value="<?= $infoUser['complemento'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="bairro">Bairro</label>
                        <input type="text" name="bairro" id="bairro" value="<?= $infoUser['bairro'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="id_estado">Estado</label>
                        <select name="id_estado" id="id_estado" onfocus='this.size=10;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
                            <option value="">Selecione...</option>
                            <?php foreach ($estados as $uf): ?>
                                <option
                                    value="<?= (int)$uf['id_estado'] ?>"
                                    <?= (isset($infoUser['id_estado']) && (int)$infoUser['id_estado'] === (int)$uf['id_estado']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($uf['estado'], ENT_QUOTES, 'UTF-8') ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cep">Cep</label>
                        <input type="number" name="cep" id="cep">
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Contato 📞</legend>
                <div class="form-group duo">
                    <div>
                        <label for="id_ddd">DDD</label>
                        <input type="number" name="ddd" id="id_ddd">
                    </div>
                    <div>
                        <label for="id_celular">Celular</label>
                        <input type="number" name="celular" id="celular">
                    </div>
                </div>
                </fieldset>

                <div class="modal2-botoes">
                    <button type="submit" class="yes" style="background-color: #008080;">Salvar</button>
                    <button type="button" class="no" onclick="fecharModal()" >Cancelar</button>
                </div>

            </form>
        </div>
    </div>

    <!-- Script -->
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/tab.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/buscaLivro.js"></script>
    <script src="../assets/js/modalForm.js"></script>




</body>

</html>