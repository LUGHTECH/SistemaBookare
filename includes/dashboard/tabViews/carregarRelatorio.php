<?php
$host = "localhost";
$dbname = "bd_bookare";
$user = "root";
$pass = "";

$pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$tipo = $_GET['tipo'] ?? '';


?>



<?php if ($tipo == "top-user-livros"): ?>
    <?php
    $sql = "SELECT u.nome_usuario, COUNT(l.id_livro) AS total, MAX(l.data_add_livro) AS ultima 
            FROM tb_usuario u
            LEFT JOIN tb_livro l ON l.id_usuario = u.id_usuario 
            GROUP BY u.id_usuario
            ORDER BY total DESC LIMIT 15";
    $dados = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC); //listagem de usuarios com mais livros, ordem desc
    ?>

    <thead>
        <tr>
            <th>Usuário</th>
            <th>Quantidade de Livros</th>
            <th class="export"><p>Data de Cadastro do Último Livro</p> <img src="/SistemaBookare/assets/img/exportarIcon.png" alt="" title="Ver relatório completo e exportar"></th>
        </tr>
    </thead>
    <tbody style="text-align: center;">
        <?php foreach ($dados as $linha): ?>
            <tr>
                <td><?= $linha['nome_usuario'] ?></td>
                <td><?= $linha['total'] ?></td>
                <td><?= date("d/m/Y - H:i", strtotime($linha['ultima'])) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>

<?php elseif ($tipo == "livros"): ?>
    <?php
    $sql = "SELECT nome_livro, data_add_livro as ultimo_livro_data, COUNT(nome_livro) as total_livros
            FROM tb_livro
            GROUP BY nome_livro
            ORDER BY total_livros DESC LIMIT 15";
    $dados = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC); //listagem de livros cadastrados, contados e agrupados
    ?>

    <thead>
        <tr>
            <th>Livro</th>
            <th>Quantidade de Livros</th>
            <th class="export"><p>Data de Cadastro do Último Livro</p> <img src="/SistemaBookare/assets/img/exportarIcon.png" alt="" title="Ver relatório completo e exportar"></th>
        </tr>
    </thead>
    <tbody style="text-align: center;">
        <?php foreach ($dados as $linha): ?>
            <tr>
                <td><?= $linha['nome_livro'] ?></td>
                <td><?= $linha['total_livros'] ?></td>
                <td><?= date("d/m/Y - H:i", strtotime($linha['ultimo_livro_data'])) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>

<?php elseif ($tipo == "usuarios"): ?>
    <?php
    $sql = "SELECT nome_usuario, email_usuario, criado_em as criacao_conta FROM tb_usuario ORDER BY nome_usuario LIMIT 15";
    $dados = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC); //listagem de usuaários cadastrados
    ?>

    <thead>
        <tr>
            <th>Usuário</th>
            <th>Quantidade de Usuários</th>
            <th class="export"><p>Data de Criação de Conta</p> <img src="/SistemaBookare/assets/img/exportarIcon.png" alt="" title="Ver relatório completo e exportar"></th>
        </tr>
    </thead>
    <tbody style="text-align: center;">
        <?php foreach ($dados as $linha): ?>
            <tr>
                <td><?= $linha['nome_usuario'] ?></td>
                <td><?= $linha['email_usuario'] ?></td>
                <td><?= date("d/m/Y - H:i", strtotime($linha['criacao_conta'])) ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>

<?php elseif ($tipo == "top-estado-livros"): ?>
    <?php
    $sql = "SELECT 
    es.estado AS nome_estado, 
    COUNT(l.id_livro) AS total_livros
        FROM tb_estado AS es
        LEFT JOIN tb_endereco AS e ON es.id_estado = e.id_estado
        LEFT JOIN tb_usuario AS u ON u.id_usuario = e.id_usuario
        LEFT JOIN tb_livro AS l ON l.id_usuario = u.id_usuario
        GROUP BY es.id_estado, es.estado
        ORDER BY total_livros DESC LIMIT 15;
        ";
    $dados = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC); //listagem de livros cadastrados por estado
    ?>

    <thead>
        <tr>
            <th>Estado</th>
            <th class="export"><p>Quantidade de Livros</p> <img src="/SistemaBookare/assets/img/exportarIcon.png" alt="" title="Ver relatório completo e exportar"></th>
        </tr>
    </thead>
    <tbody style="text-align: center;">
        <?php foreach ($dados as $linha): ?>
            <tr>
                <td><?= $linha['nome_estado'] ?></td>
                <td><?= $linha['total_livros'] ?></td>
            </tr>
        <?php endforeach; ?>
    </tbody>




<?php endif; ?>






