<?php
require('connect.php');

$idGenero = isset($_GET['genero']) ? (int)$_GET['genero'] : 1;

$sql = "SELECT * FROM tb_livro WHERE id_genero = $idGenero LIMIT 10";
$result = mysqli_query($con, $sql);

// Renderiza os livros
while($l = mysqli_fetch_assoc($result)) {
    echo "<div class='info'>";
        echo "<div>";
            echo "<img src='bd/imgBd/{$l['foto']}' alt='{$l['titulo']}'>";
        echo "</div>";
        echo "<p>{$l['autor']}, {$l['ano']}</p>";
        echo "<h4>{$l['titulo']}</h4>";
    echo "</div>";
}

// Cria array JS
$sql2 = "SELECT * FROM tb_livro WHERE id_genero = $idGenero LIMIT 10";
$result2 = mysqli_query($con, $sql2);

$livros = [];
while($linhas = mysqli_fetch_assoc($result2)) {
    $livros[] = $linhas;
}
?>

<script>
  const livros = <?php echo json_encode($livros); ?>;
</script>
<script src="../assets/js/mostraCapa.js"></script>
