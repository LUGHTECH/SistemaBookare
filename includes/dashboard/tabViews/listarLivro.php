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
    try {
        // Tenta incluir o arquivo de conexão
        require('../../connect.php');
        
        // Verifica se a conexão foi estabelecida
        if (!$con2) {
            throw new Exception("Não foi possível conectar com o banco de dados");
        }
        
        // Se a conexão foi bem sucedida, executa o código
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
                                        ORDER BY l.titulo ASC");
                                        
        while($livros = mysqli_fetch_assoc($livro)) {
            echo "<div class='conteudo'>";
                echo "<p>{$livros['titulo']}</p>";
                echo "<p>{$livros['autor']}</p>";
                echo "<p class= 'genero'>{$livros['genero']}</p>";
                echo "<p class='ano'>{$livros['ano_publicacao']}</p>";
                echo "<div class='bookImg'>";
                    echo "<img src='../../../bd/imgBd/{$livros['foto']}' alt='Capa do livro'>";
                echo "</div>";
                echo "<div class='botao'><a href='alterarLivro.php'><img src='../../../assets/img/editIcon.png'></img></a></div>";
                echo "<div class='botao'><a href=javascript:excluir($livros[id_livro],\"livro\")><img src='../../../assets/img/lixeiraIcon.png'></img></a></div>";
            echo "</div>";
        }
        
    } catch (Exception $e) {
        // Exibe apenas a mensagem de erro se a conexão falhar
        echo "<div style='color: red; text-align: center; padding: 20px;'>";
        echo "Erro: " . $e->getMessage();
        echo "</div>";
    }
    ?>
    </div>
</div>
