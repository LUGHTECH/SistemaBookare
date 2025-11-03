 <?php @session_start();
    $usuarios = $_SESSION['usuarios'];
    $pesquisa = $_SESSION['pesquisa'];
    $pagina = $_SESSION['pagina'] ?? 1;
    $anos = $_SESSION['anos'];
    $autores = $_SESSION['autores'];
    $estados = $_SESSION['estados'];
    $conservacao = $_SESSION['conservacao'];

    $autorSelecionados = isset($_GET['autor']) ? (array)$_GET['autor'] : [];
    $anoSelecionados = isset($_GET['ano_publicacao']) ? (array)$_GET['ano_publicacao'] : [];
    $estadoSelecionados = isset($_GET['estado']) ? (array)$_GET['estado'] : [];
    $conservacaoSelecionados = isset($_GET['conservacao']) ? (array)$_GET['conservacao'] : [];
    ?>

 <!DOCTYPE html>
 <html lang="pt-br">

 <head>
     <meta charset="UTF-8">
     <title>Bookare-catalogo</title>
 </head>

 <body style="padding: 0; margin:0">
     <?php include(__DIR__ . "/topo.php"); ?>

     <main class="main-catalog">

         <aside class="filter">
             <div id="filtrosAtivos" class="filtrosAtivos"></div>
             <form action="pesquisa.php" method="get" class="form-filter">

                 <fieldset class="condicoes">
                     <legend>Condições do Livro</legend>
                     <?php foreach ($conservacao as $eConservacao): ?>
                         <label>
                             <input type="checkbox" name="conservacao[]" value="<?= $eConservacao['livro_conservacao'] ?>"
                                 <?= (is_array($conservacaoSelecionados) && in_array($eConservacao['livro_conservacao'], $conservacaoSelecionados)) ? 'checked' : '' ?>
                                 onchange="this.form.submit()">
                             <?= htmlspecialchars($eConservacao['livro_conservacao']) ?> (<?= $eConservacao['total'] ?>)
                         </label>
                     <?php endforeach; ?>
                 </fieldset>

                 <fieldset class="ano-pub">
                     <legend>Ano de Publicação</legend>
                     <?php foreach ($anos as $anoPub): ?>
                         <label>
                             <input type="checkbox" name="ano_publicacao[]" value="<?= $anoPub['livro_ano'] ?>"
                                 <?= (is_array($anoSelecionados) && in_array($anoPub['livro_ano'], $anoSelecionados)) ? 'checked' : '' ?>
                                 onchange="this.form.submit()">
                             <?= htmlspecialchars($anoPub['livro_ano']) ?> (<?= $anoPub['total'] ?>)
                         </label>
                     <?php endforeach; ?>
                 </fieldset>

                 <fieldset class="autor-filter">
                     <legend>Autor</legend>
                     <?php foreach ($autores as $autor): ?>
                         <label>
                             <input type="checkbox" name="autor[]" value="<?= htmlspecialchars($autor['id_autor']) ?>"
                                 <?= (is_array($autorSelecionados) && in_array($autor['id_autor'], $autorSelecionados)) ? 'checked' : '' ?>
                                 onchange="this.form.submit()">
                             <?= htmlspecialchars($autor['autor']) ?> (<?= htmlspecialchars($autor['total_livros']) ?>)
                         </label>
                     <?php endforeach; ?>
                 </fieldset>

                 <fieldset class="uf-filter">
                     <legend>Localização</legend>
                     <?php foreach ($estados as $estado): ?>
                         <label>
                             <input type="checkbox" name="estado[]" value="<?= htmlspecialchars($estado['id_estado']) ?>"
                                 <?= (is_array($estadoSelecionados) && in_array($estado['id_estado'], $estadoSelecionados)) ? 'checked' : '' ?>
                                 onchange="this.form.submit()">
                             <?= htmlspecialchars($estado['nome_estado']) ?> (<?= htmlspecialchars($estado['total_livros']) ?>)
                         </label>
                     <?php endforeach; ?>
                 </fieldset>
             </form>
         </aside> <!--fim do filtro-->

         <section class="catalog">
             <div class="userCatalogo">
                 <div class="text-pesquisa">
                     <h2>Você pesquisou por: "<?= htmlspecialchars($pesquisa) ?>"</h2>
                     <p>Apresentando.... (0) resultados</p>
                 </div>
                 <div class="container">
                     <?php if (empty($usuarios)): ?>
                         <p>Nenhum livro encontrado 😢😢</p>
                     <?php else: ?>
                         <?php foreach ($usuarios as $usuario): ?>
                             <div class="usuariosCard">

                                 <div class="container-img">
                                     <div class="nome-img">
                                         <div class="cardUser" style="width: 100px; height:100px">
                                             <img style="width: 100%; height:100%" src="./dashboard/tabViews/<?= $usuario['foto_usuario'] ?>" alt="">
                                         </div>
                                         <div class="cardInfos">
                                             <h3><?= htmlspecialchars($usuario['nome_usuario']) ?></h3>
                                             <p><?= htmlspecialchars($usuario['nome_estado']) ?>, <?= htmlspecialchars($usuario['uf']) ?></p>
                                         </div>
                                     </div>
                                     <div class="cardContato">

                                     </div>
                                     <div class="buttonFoto">
                                         <a href="detalhesTroca.php?id_usuario=<?= $usuario['id_usuario'] ?>&id_livro=<?= $usuario['id_livro'] ?>">
                                             <button type="button">DETALHES</button>
                                         </a>
                                     </div>
                                 </div>

                                 <div class="titulo-capa">
                                     <div class="cardLivroCapa">
                                         <img src="./dashboard/tabViews/<?= $usuario['foto_livro'] ?>" alt="">
                                     </div>
                                     <p><?= htmlspecialchars($usuario['nome_livro']) ?></p>
                                 </div>
                             </div>
                         <?php endforeach; ?>
                     <?php endif; ?>
                 </div>
             </div>
         </section>
     </main>
     <div class="paginacao">
         <?php if ($pagina > 1): ?>
             <a href="pesquisa.php?search=<?php echo urlencode($pesquisa); ?>&pagina=<?php echo $pagina - 1; ?>">Anterior</a>
         <?php endif; ?>
         <a href="pesquisa.php?search=<?php echo urlencode($pesquisa); ?>&pagina=<?php echo $pagina + 1; ?>">Próximo</a>
     </div>

     <script src="../assets/js/filtroCatalogo.js"></script>
 </body>

 </html>