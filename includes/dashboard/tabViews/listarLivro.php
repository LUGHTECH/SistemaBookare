<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['username'] ?? null;
?>

<!-- header  -->
<?php include(__DIR__ . "/../../header.php"); ?>

<body>
    <main>
        <!-- abre o if -->
        <?php if ($username): ?>

            <!-- Exibição de usuario -->
            <!-- <p>Olá, <//?= htmlspecialchars($username, ENT_QUOTES, 'UTF-8') ?></p>-->
            <div class="dash">
                <h1 class="seus">Seus Livros</h1>
                <div class="categories">
                    <h3 class="Ti" style="width: 30%;">Titulo</h3>
                    <h3 class="Ti" style="width: 30%;">Autor</h3>
                    <h3 class="Ti" style="width: 15%;">Gênero</h3>
                    <h3 class="Ti" style="width: 15%;">Ano Publi</h3>
                    <h3 class="Ti" style="width: 5%;">Capa</h3>
                    <h3 class="Ti" style="width: 10%;">Ação</h3>
                </div>
                <div class="seusLivros">

                    <?php
                    $id_usuario = $_SESSION['id_usuario'];
                    require('../../connect.php');
                    $sql = "SELECT 
                                                    l.id_livro,
                                                    l.nome_livro,
                                                    a.autor AS nome_autor,
                                                    g.genero AS nome_genero,
                                                    e.editora AS nome_editora,
                                                    i.codigo_idioma AS idioma,
                                                    l.ano_pub_livro,
                                                    l.sinopse_livro,
                                                    l.estado_conservacao_livro,
                                                    img.caminho_imagem AS capa,
                                                    u.nome_usuario,
                                                    u.email_usuario
                                                FROM tb_livro l
                                                INNER JOIN tb_usuario u      ON l.id_usuario = u.id_usuario
                                                LEFT JOIN tb_autor a         ON l.id_autor = a.id_autor
                                                LEFT JOIN tb_genero g        ON l.id_genero = g.id_genero
                                                LEFT JOIN tb_editora e       ON l.id_editora = e.id_editora
                                                LEFT JOIN tb_idioma i        ON l.id_idioma = i.id_idioma
                                                LEFT JOIN tb_livro_imagem img ON l.id_livro_imagem = img.id_livro_imagem
                                                WHERE l.id_usuario = $id_usuario
                                                ORDER BY l.nome_livro ASC"; //mudar esse con2 mais tarde
                    $result = mysqli_query($con2, $sql);

                    $infoLivro = mysqli_fetch_assoc(mysqli_query($con2, $sql)); // pega o primeiro 
                    // Usando no Modal 3

                    while ($livros = mysqli_fetch_assoc($result)) {
                        echo "<div class='conteudo'>";

                        echo "<p>{$livros['nome_livro']}</p>";
                        echo "<p>{$livros['nome_autor']}</p>";
                        echo "<p class= 'genero'>{$livros['nome_genero']}</p>";
                        echo "<p class='ano'>{$livros['ano_pub_livro']}</p>";
                        echo "<div class='bookImg'>";
                        echo "<img src='/SistemaBookare/includes/dashboard/tabViews/{$livros['capa']}' alt='Capa do livro'>";
                        echo "</div>";
                        echo "<div class='botao'>
                                <a href='#' 
                                    onclick='abrirModalLivro(" . json_encode($livros) . "); return false'>
                                    <img src='../assets/img/livroIcon.png'>
                                </a>
                                </div>";
                        echo "<div class='botao'><a href='#' onclick='abrirModal($livros[id_livro]," . json_encode($livros['nome_livro']) . ", \"livro\"); return false'><img src='../assets/img/lixeiraIcon.png'></img></a></div>";

                        echo "</div>";
                    }
                    ?>


                </div>
            </div>
            <!-- fecha o if com else -->
        <?php else: ?>
            <p>Não tem uma conta ainda?, entre agora para a <span>Bookare</span> e faça parte dessa comunidade.</p>
            <a href="loginUser.php">Entrar</a> | <a href="createUser.php">Criar conta</a>
        <?php endif; ?>

        <div class="modal3" id="modalLivro">
            <div class="content-livros">
                <section class="infoBook">
                    <div class="bookInfoImg">
                        <img id="capaLivro" src="" alt="Capa do Livro">
                    </div>
                    <div class="idiomaLivro">
                        <p>Ano de Publicação:</p>
                        <p id="anoLivro"></p>
                        <p>Idioma:</p>
                        <p id="idiomaLivro"></p>
                        <p>Gênero:</p>
                        <p id="generoLivro"></p>
                    </div>
                </section>

                <article class="detailsBook">
                    <div class="fecharLivro">
                        <h2>Informações do Livro</h2>
                        <img onclick="fecharModal()" src="../assets/img/closeGreen.png" alt="">
                    </div>
                    <div class="textLivro">
                        <div class="titleLivro">
                            <h3 id="tituloLivro"></h3>
                            <h4>Editora: <span id="editoraLivro"></span></h4>
                            <p style="font-style: italic;">Escrito Por: <span id="autorLivro"></span> </p>
                        </div>
                        <div class="sinopse">
                            <p id="sinopseLivro">

                            </p>

                        </div>

                    </div>

                    <div class="estadoLivros">
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt="">
                        </div>
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt="">
                        </div>
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt=""> <!--talvez meter um display block caso imagem vazia-->
                        </div> <!--Se vira Wenzio-->
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt="">
                        </div>
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt="">
                        </div>
                        <div class="conservFotos">
                            <img src="../assets/img/livroManchado.jpeg" alt="">
                        </div>
                    </div>

                    <div class="modal3-botoes">
                        <button id="alt" style="width: 70%;">Alterar Livro</button>
                        <button id="exc" style="width: 30%;">Excluir</button>
                    </div>
                </article>

            </div><!--content-->
        </div><!--modal3-->


    </main>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/modalLivro.js"></script>




</body>

</html>