 <?php @session_start();
    $usuarios = $_SESSION['usuarios'];
    $pesquisa = $_SESSION['pesquisa'];
    $pagina = $_SESSION['pagina'] ?? 1;    ?>

 <!DOCTYPE html>
 <html lang="pt-br">

 <head>
     <meta charset="UTF-8">
     <title>Bookare-catalogo</title>
 </head>

 <body style="padding: 0; margin:0">
     <?php include(__DIR__ . "/topo.php"); ?>

     <div class="userCatalogo">
         <h2>Você pesquisou por: "<?= htmlspecialchars($pesquisa) ?>"</h2>
         <div class="container">
             <?php if (empty($usuarios)): ?>
                 <p>Nenhum livro encontrado emoji emoji</p>
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
                             <p>E-mail: <?= htmlspecialchars($usuario['email_usuario']) ?></p>
                             <p>Telefone:(<?= htmlspecialchars($usuario['ddd']) ?>)<?= htmlspecialchars($usuario['celular']) ?></p>
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

     <div class="paginacao">
         <?php if ($pagina > 1): ?>
             <a href="pesquisa.php?search=<?php echo urlencode($pesquisa); ?>&pagina=<?php echo $pagina - 1; ?>">Anterior</a>
         <?php endif; ?>
         <a href="pesquisa.php?search=<?php echo urlencode($pesquisa); ?>&pagina=<?php echo $pagina + 1; ?>">Próximo</a>
     </div>


 </body>

 </html>