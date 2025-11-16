<?php
include(__DIR__ . "/topo.php");
@session_start();
$mensagemSucesso = $_GET['mensagem_enviada'] ?? null; // pega o redirect que vem do enviarMensagem.php


$host = "localhost";
$dbname = "bd_bookare";
$user = "root";
$pass = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // --- Pegando os IDs da URL por get---
    $id_usuario = $_GET['id_usuario'] ?? null;
    $id_livro = $_GET['id_livro'] ?? null;

    if (!$id_usuario || !$id_livro) {
        die("Parâmetros inválidos.");
    }

    $sql = "SELECT 
                u.nome_usuario,
                u.id_usuario,
                u.email_usuario,
                u.foto_usuario,
                u.view_email,
                u.view_contato,
                c.ddd,
                c.celular,
                e.logradouro,
                e.cidade,
                es.estado AS nome_estado,
                es.uf,
                l.nome_livro,
                l.id_livro,
                l.ano_pub_livro,
                l.estado_conservacao_livro,
                l.sinopse_livro,
                ed.editora AS nome_editora,
                fl.caminho_imagem AS foto_livro,
                a.autor
            FROM tb_usuario u
            INNER JOIN tb_contato c ON c.id_usuario = u.id_usuario
            INNER JOIN tb_endereco e ON e.id_usuario = u.id_usuario
            INNER JOIN tb_estado es ON es.id_estado = e.id_estado
            INNER JOIN tb_livro l ON l.id_usuario = u.id_usuario
            LEFT JOIN tb_autor a ON a.id_autor = l.id_autor
            LEFT JOIN tb_editora ed ON l.id_editora = ed.id_editora
            LEFT JOIN tb_livro_imagem fl ON fl.id_livro_imagem = l.id_livro_imagem
            WHERE u.id_usuario = ? AND l.id_livro = ?";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([$id_usuario, $id_livro]);
    $dados = $stmt->fetch(PDO::FETCH_ASSOC);

    $sqlFotos = "SELECT caminho_imagem from tb_livro_imagem where id_livro = ?";
    $stmt2 = $pdo->prepare($sqlFotos);
    $stmt2->execute([$id_livro]);
    $fotosLivro = $stmt2->fetchAll(PDO::FETCH_ASSOC);

    if (!$dados) {
        die("Livro não encontrado.");
    }
} catch (PDOException $e) {
    die("Erro: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Detalhes - <?= htmlspecialchars($dados['nome_livro']) ?></title>

</head>

<body style="font-family: Arial, sans-serif; margin: 50px;">


    <div class="container3" style="margin-top: 80px;">
        <div class="livro">
            <div class="img-ilustrativa">
                <img src="./dashboard/tabViews/<?= htmlspecialchars($dados['foto_livro']) ?>" alt="Capa do Livro">
                <p>Imagem Ilustrativa</p>

            </div>
            <div class="infoD-livros">
                <h1 class="h1"><?= htmlspecialchars($dados['nome_livro']) ?></h1>
                <div class="text-main-info">
                    <p><strong>Autor(a):</strong> <?= htmlspecialchars($dados['autor']) ?></p>
                    <p><strong>Ano de publicação:</strong> <?= htmlspecialchars($dados['ano_pub_livro']) ?></p>
                    <p><strong>Editora:</strong> <?= htmlspecialchars($dados['nome_editora']) ?></p>
                    <p><strong>Conservação:</strong> <?= htmlspecialchars($dados['estado_conservacao_livro']) ?></p>
                </div>
                <div class="texto-sinopse">
                    <p class="text-sinopse"><strong>Descrição:</strong> <?= htmlspecialchars($dados['sinopse_livro']) ?>
                        <span class="overflow" data-state="visible" aria-hidden="true"> </span>
                    </p>
                    <button class="toggle" data-state="more"> Leia mais </button>
                </div>
                <div class="livro-state">
                    <?php foreach ($fotosLivro as $index => $img): ?>
                        <?php if ($index === 0) continue; ?> <!-- pula a primeira imagem -->
                        <div class="imgs-flow">
                            <img src="./dashboard/tabViews/<?= htmlspecialchars($img['caminho_imagem']) ?>" alt="Imagem do livro">
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>


        <div class="contUser">
        <div class="usuario" id="usuario">
            <img src="./dashboard/tabViews/<?= htmlspecialchars($dados['foto_usuario']) ?>" alt="Foto do usuário">
            <div class="infoD-usuario">
                <p class="subInfo"><strong>Dono:</strong> <?= htmlspecialchars($dados['nome_usuario']) ?></p>
                <p class="subInfo"><strong>Cidade:</strong> <?= htmlspecialchars($dados['cidade']) ?> - <?= htmlspecialchars($dados['uf']) ?></p>
                <div class="contato-area">
                    <?php if (isset($_SESSION["id_usuario"])): ?>
                        <?php if ($dados['view_email'] == 1 || $dados['view_contato'] == 1): ?> <!--ABRE SE O USUÁRIO QUISER MOSTRAR ALGUMA FORMA DE CONTATO-->
                            <p class="warning-user">Entre em contato com este usuário utilizando:</p>
                            <?php if ($dados['view_email'] == 1): ?> <!--ver a tabela view email: mostra se for 1, esconde com 0 -->
                                <p class="view"><strong>Email:</strong> <?= htmlspecialchars($dados['email_usuario']) ?></p>
                            <?php endif; ?>
                            <?php if ($dados['view_contato'] == 1): ?>
                                <p class="view"><strong>Telefone:</strong> (<?= htmlspecialchars($dados['ddd']) ?>) <?= htmlspecialchars($dados['celular']) ?></p>
                            <?php endif; ?>

                        <?php else: ?> <!--CASO NENHUMA FORMA DE CONTATO SEJA MOSTRADA-->
                            <p class="warning-user">O usuário optou por não compartilhar informações de contato.</p>
                            <button id="abrirForm">Entrar em contato</button>
                            <form id="formContato" action="enviarMensagem.php" method="POST">
                                <input type="hidden" name="id_dono" value="<?= $dados['id_usuario'] ?>">
                                <input type="hidden" name="id_livro" value="<?= $dados['id_livro'] ?>">
                                <label>Seu nome:</label>
                                <input type="text" name="nome" required>

                                <label>Seu e-mail:</label>
                                <input type="email" name="email" required>

                                <label>Mensagem:</label>
                                <textarea name="mensagem" value="" rows="4" cols="50" required>
                                Olá, estou interessado no seu livro!
                            </textarea>
                                <div class="email-submit">
                                    <button type="submit">Enviar</button>
                                </div>
                            </form>
                        <?php endif; ?>
                    <?php else: ?>
                        <p class="warning-user">Você precisa estar logado para
                            ver as informações de contato deste usuário!
                        </p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
        </div>
    </div>

    <a href="catalogo.php" class="back">← Voltar</a>

    <script src="../assets/js/readMore.js"></script>
    <script src="../assets/js/formContato.js"></script>
    <script>
        <?php if ($mensagemSucesso == 1): ?>
            alert("Mensagem enviada com sucesso!");
        <?php endif; ?>
    </script>
</body>

</html>