<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Livro</title>
</head>

<body style="margin-top: 100px;">

    <?php
    include("topo.php");
    require('connect.php');
    @session_start();

    @$mensagem = $_SESSION['mensagem'];
    @$id_livro = (int) $_GET['id_livro'];

    $sql = "SELECT 
                l.id_livro,
                l.nome_livro,
                a.autor AS nome_autor,
                g.genero AS nome_genero,
                e.editora AS nome_editora,
                i.codigo_idioma AS idioma,
                l.ano_pub_livro,
                l.sinopse_livro,
                l.estado_conservacao_livro AS condicao_livro,
                GROUP_CONCAT(DISTINCT img.caminho_imagem) AS capa
            FROM tb_livro l
            LEFT JOIN tb_autor a          ON l.id_autor = a.id_autor
            LEFT JOIN tb_genero g         ON l.id_genero = g.id_genero
            LEFT JOIN tb_editora e        ON l.id_editora = e.id_editora
            LEFT JOIN tb_idioma i         ON l.id_idioma = i.id_idioma
            LEFT JOIN tb_livro_imagem img ON l.id_livro = img.id_livro
            WHERE l.id_livro = $id_livro
            GROUP BY l.id_livro";

    $resultado = mysqli_query($con2, $sql);
    $livros = mysqli_fetch_assoc($resultado);

    $fotos_livro = explode(',', $livros['capa']); 
    ?>

    <form action="editarLivro.act.php" method="post" id="formLivro" enctype="multipart/form-data">

        <input type="hidden" name="id_usuario" value="<?php echo $idUsuario; ?>">

        <div class="container-cadastro-livro">

            <div id="alertSuccess" class="alert alert-success" style="display:none;"></div>
            <div id="alertError" class="alert alert-error" style="display:none;"></div>

            <!-- LADO ESQUERDO -->
            <div class="lado-esquerdo">

                <h3 class="section-title">📷 Imagens do Livro</h3>

                <!-- CAPA -->
                <div class="mb-4">
                    <h4 style="text-align:center; margin:5px;">Capa do Livro</h4>

                    <div class="capa-preview editar-img" id="capaPreview">
                        <img id="previewCapa" src="/SistemaBookare/includes/dashboard/tabViews/<?= $fotos_livro[0] ?>" alt="">
                    </div>

                    <input type="file" id="inputCapa" name="capa" accept="image/*" class="hidden">

                    <div class="cont-button">
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('inputCapa').click()">
                            📸 Selecionar Capa
                        </button>
                    </div>
                </div>

                <!-- FOTOS -->
                <div style="margin-top:20px;">
                    <h4>Fotos do Livro (Máx. 6)</h4>

                    <div class="fotos-container" id="fotosContainer">

                        <?php foreach ($fotos_livro as $index => $img): ?>
                            <div class="foto-preview" id="foto<?= $index ?>">
                                <img src="/SistemaBookare/includes/dashboard/tabViews/<?= $img ?>" alt="">
                            </div>
                        <?php endforeach; ?>

                    </div>

                    <input type="file" id="inputFotos" name="fotos[]" accept="image/*" multiple class="hidden">

                    <div class="cont-button">
                        <button type="button" class="btn btn-primary" onclick="document.getElementById('inputFotos').click()">
                            📷 Adicionar Fotos
                        </button>
                    </div>
                </div>

            </div>

            <!-- LADO DIREITO -->
            <div class="lado-direito">

                <h3 class="section-title">📖 Informações do Livro</h3>

                <div class="infos-isbn">
                    <div class="busca-isbn">
                        <input type="text" id="inputISBN" placeholder="Digite o ISBN do livro (10 ou 13 dígitos)" style="flex:1;">
                    </div>
                </div>

                <div class="container-inputs">

                    <div class="form-group">
                        <label>Nome do Livro *</label>
                        <input type="text" id="nomeLivro" name="nome_livro" value="<?= $livros['nome_livro'] ?>" required>
                    </div>

                    <div class="form-group">
                        <label>Ano de Publicação</label>
                        <input type="number" id="anoPublicacao" name="ano_publicacao" min="1000" max="<?= date('Y') ?>"
                               value="<?= $livros['ano_pub_livro'] ?>">
                    </div>

                    <div class="form-group">
                        <label>Autor *</label>
                        <input type="text" id="autor" name="livro_autor" value="<?= $livros['nome_autor'] ?>" required>
                    </div>

                    <div class="form-group">
                        <label>Gênero *</label>
                        <input type="text" id="genero" name="livro_genero" value="<?= $livros['nome_genero'] ?>" required>
                    </div>

                    <div class="form-group">
                        <label>Editora</label>
                        <input type="text" id="editora" name="livro_edicao" value="<?= $livros['nome_editora'] ?>">
                    </div>

                    <div class="form-group">
                        <label>Idioma *</label>
                        <select id="idioma" name="livro_idioma" required>
                            <option value="">Selecione o idioma</option>
                            <option value="pt" <?= $livros['idioma'] == 'pt' ? 'selected' : '' ?>>Português</option>
                            <option value="en" <?= $livros['idioma'] == 'en' ? 'selected' : '' ?>>Inglês</option>
                            <option value="es" <?= $livros['idioma'] == 'es' ? 'selected' : '' ?>>Espanhol</option>
                            <option value="fr" <?= $livros['idioma'] == 'fr' ? 'selected' : '' ?>>Francês</option>
                            <option value="de" <?= $livros['idioma'] == 'de' ? 'selected' : '' ?>>Alemão</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Estado de Conservação *</label>
                        <select id="estadoConservacao" name="livro_conservacao" required>
                            <option value="">Selecione o estado</option>
                            <?php
                            $estados = ["Novo", "Seminovo", "Com Marcas de Uso", "Danos Leves", "Danos Severos"];
                            foreach ($estados as $estado) {
                                $sel = $livros['condicao_livro'] == $estado ? "selected" : "";
                                echo "<option value='$estado' $sel>$estado</option>";
                            }
                            ?>
                        </select>
                    </div>

                </div>

                <div class="form-group" id="cont-sinopse">
                    <label>Sinopse</label>
                    <textarea id="sinopse" name="livro_sinopse" rows="5"><?= trim($livros['sinopse_livro']) ?></textarea>
                </div>

                <button type="submit" class="btn btn-success" style="width:100%; padding:12px;">
                    Salvar Alterações
                </button>

            </div>

        </div>

    </form>

</body>

</html>
