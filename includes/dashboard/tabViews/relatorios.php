    <?php
    $host = "localhost";
    $dbname = "bd_bookare";
    $user = "root";
    $pass = "";

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $stmt = $pdo->query("SELECT COUNT(*) AS total FROM tb_usuario");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        $totalUsuarios = $result['total']; //contagem de todos os usuários do sistema

        $stmt2 = $pdo->query("SELECT COUNT(*) AS total_livros FROM tb_livro;");
        $result2 = $stmt2->fetch(PDO::FETCH_ASSOC);

        $totalLivros = $result2['total_livros']; //contagem de todos os livros cadastrados


        $sql = "SELECT u.nome_usuario, u.email_usuario, MAX(l.data_add_livro) as ultima_data, COUNT(l.id_livro) AS total
        FROM tb_usuario u
        LEFT JOIN tb_livro l ON l.id_usuario = u.id_usuario 
        GROUP BY u.id_usuario
        ORDER BY total DESC";

        $stmt3 = $pdo->query($sql);
        $result3 = $stmt3->fetch(PDO::FETCH_ASSOC); //uma linha apenas

        $stmt3b = $pdo->query($sql);
        $contUser = $stmt3b->fetchAll(PDO::FETCH_ASSOC); //transforma em varias linhas

        $qtdeUserLivro = $result3['nome_usuario']; //contagem de usuario com mais livros, por ordem desc
        $qtdeLivroUser = $result3['total'];

        $stmt4 = $pdo->query("SELECT es.estado AS nome_estado, COUNT(l.id_livro) AS total_livros
                                FROM tb_endereco AS e
                                INNER JOIN tb_estado AS es ON es.id_estado = e.id_estado
                                INNER JOIN tb_usuario AS u ON u.id_usuario = e.id_usuario
                                INNER JOIN tb_livro AS l ON l.id_usuario = u.id_usuario
                                GROUP BY e.id_estado, es.estado
                                ORDER BY es.estado DESC");
        $result4 = $stmt4->fetch(PDO::FETCH_ASSOC);

        $nome_estado = $result4['nome_estado'];
        $qtdeLivroEstado = $result4['total_livros'];
    } catch (PDOException $e) {
        echo "Erro de Conexão: " . $e->getMessage();
    }


    ?>







    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>

    <body>
        <main class="main-adm">


            <div class="relatorios-container">

                <h2>Painel de Relatórios</h2>

                <!-- CARDS -->
                <div class="cards">

                    <div class="card" id="firstCard" data-relatorio="usuarios" style="cursor: pointer;">
                        <h3>Total de Usuários Cadastrados</h3>
                        <p><?= $totalUsuarios ?></p>
                    </div>

                    <div class="card" data-relatorio="livros">
                        <h3>Total de Livros Cadastrados</h3>
                        <p><?= $totalLivros ?></p>
                    </div>

                    <div class="card" data-relatorio="top-user-livros">
                        <h3>Usuario com mais Livros</h3>
                        <p id="qtde"><?= $qtdeUserLivro ?><span class="badge"><?= $qtdeLivroUser ?></span></p>
                    </div>

                    <div class="card" data-relatorio="top-estado-livros">
                        <h3>Estado com mais Livros</h3>
                        <p id="qtde"><?= $nome_estado ?><span class="badge"><?= $qtdeLivroEstado ?></span></p>
                    </div>

                </div>



                <!-- TABELA -->
                <div class="tabela">
                    <table id="relatorios-em-tabela">

                    </table>
                </div>

            </div>

            <div class="graficos-area">
                <!-- GRÁFICO (área reservada) -->
                <div class="grafico">
                    <h3>Gráfico Mensal</h3>
                    <div class="grafico-placeholder">
                        <canvas id="meuGrafico"></canvas>
                    </div>
                </div>
            </div>
            
        </main>
        <script src="../assets/js/carregarRelatorio.js"></script>
    </body>

    </html>