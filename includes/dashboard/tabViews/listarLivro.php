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
                                                    l.titulo,
                                                    l.autor,
                                                    l.ano_publicacao,
                                                    l.genero,
                                                    l.foto, 
                                                    u.username,
                                                    u.email
                                                FROM livros l
                                                INNER JOIN user u
                                                    ON l.id_usuario = u.id
                                                WHERE l.id_usuario = $id_usuario
                                                ORDER BY l.titulo ASC"); //mudar esse con2 mais tarde
                                                
                while($livros = mysqli_fetch_assoc($livro)) {
                        echo "<div class='conteudo'>";
                            
                            echo "<p>{$livros['titulo']}</p>";
                            echo "<p>{$livros['autor']}</p>";
                            echo "<p class= 'genero'>{$livros['genero']}</p>";
                            echo "<p class='ano'>{$livros['ano_publicacao']}</p>";
                            echo "<div class='bookImg'>";
                                echo "<img src='../bd/imgBd/{$livros['foto']}' alt='Capa do livro'>";
                            echo "</div>";
                            echo "<div class='botao'><a href='alterarLivro.php'><img src='../assets/img/editIcon.png'></img></a></div>";
                            echo "<div class='botao'><a href=javascript:excluir($livros[id_livro],\"livro\")><img src='../assets/img/lixeiraIcon.png'></img></a></div>";
                            
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