<?php
header('Content-Type: application/json');

// Conexão com o banco (adapte conforme seu connect.php)
$host = "localhost";
$dbname = "bd_bookare";
$user = "root";
$pass = "";

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $pdo->exec("SET lc_time_names = 'pt_BR'");

    $sql = "SELECT MONTHNAME(data_add_livro) AS mes, COUNT(id_livro) AS total
            FROM tb_livro
            GROUP BY mes
            ORDER BY MONTH(data_add_livro)";
    
    $stmt = $pdo->query($sql);
    $dados = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Retorna os dados como JSON
    echo json_encode($dados);

} catch (PDOException $e) {
    // Retorna um erro amigável em formato JSON
    echo json_encode(['error' => 'Erro de Conexão: ' . $e->getMessage()]);
}
?>