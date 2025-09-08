<?php 
if (isset($_POST['pesquisa'])){
    $termo = $_POST['pesquisa'];
    echo "<p>Voce pesquisou por: " . $termo . "</p>";

    
}