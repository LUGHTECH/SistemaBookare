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
                $id_usuario = $_SESSION['user_id'];
                require('../../connect.php');
                $livro = mysqli_query($con2, "SELECT 
                                                    l.id_livro,
                                                    l.nome_livro,
                                                    a.autor AS nome_autor,
                                                    g.genero AS nome_genero,
                                                    e.editora AS nome_editora,
                                                    i.codigo_idioma AS idioma,
                                                    l.ano_pub_livro,
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
                                                ORDER BY l.nome_livro ASC"); //mudar esse con2 mais tarde
                                                
                while($livros = mysqli_fetch_assoc($livro)) {
                        echo "<div class='conteudo'>";
                            
                            echo "<p>{$livros['nome_livro']}</p>";
                            echo "<p>{$livros['nome_autor']}</p>";
                            echo "<p class= 'genero'>{$livros['nome_genero']}</p>";
                            echo "<p class='ano'>{$livros['ano_pub_livro']}</p>";
                            /*echo "<div class='bookImg'>";
                                echo "<img src='../bd/imgBd/{$livros['foto']}' alt='Capa do livro'>";
                            echo "</div>";*/ // ATÉ O WENZIO ARRUMAR O INSERT DE CAPA
                            echo "<div class='botao'><a href='alterarLivro.php'><img src='../assets/img/editIcon.png'></img></a></div>";
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
    </main>
<script src="../assets/js/app.js"></script>
<script src="../assets/js/jquery-3.7.1.min.js"></script>
</body>
</html>