<!-- abre a sessão -->
<?php
session_start();
$username = $_SESSION['username'] ?? null;
?>

<!-- header  -->
<?php include("header.php");?>
<body>
    <main>
        <!-- abre o if -->
        <?php if ($username): ?>

            <!-- Exibição de usuario -->
            <p>Olá, <?= htmlspecialchars($username, ENT_QUOTES, 'UTF-8') ?></p>
            <h1>Seus Livros</h1>
            <div class="seusLivros">

                 <?php
                require('connect.php');
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
                                                WHERE l.id_usuario = id
                                                ORDER BY l.titulo ASC"); //mudar esse con2 mais tarde
                                                
                while($livros = mysqli_fetch_assoc($livro)) {
                        echo "<div class='conteudo'>";
                            echo "<div class='bookImg'>";
                                echo "<img src='../bd/imgBd/{$livros['foto']}' alt='Capa do livro'>";
                            echo "</div>";
                            echo "<p>{$livros['titulo']}</p>";
                            echo "<p>{$livros['autor']}</p>";
                            echo "<div class='contB'>";
                            echo "<div class='botao'><a href='alterarLivro.php'><button>Alterar</button></a></div>";
                            echo "<div class='botao'><a href=javascript:excluir($livros[id_livro])><button>Excluir</button></a></div>";
                            echo "</div>";
                        echo "</div>";
                    }
            ?>

               
            </div>

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