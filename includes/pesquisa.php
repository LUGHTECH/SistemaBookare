<?php
$host = "localhost";
$dbname = "bd_bookare";
$user = "root";
$pass = "";

try {
   $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass);
   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

   // --- Parâmetros recebidos ---
   $pesquisa = $_GET['search'] ?? '';
   $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
   $limite = 6;
   $offset = ($pagina - 1) * $limite;

   $autores = isset($_GET['autor']) ? (array)$_GET['autor'] : [];
   $anos = isset($_GET['ano_publicacao']) ? (array)$_GET['ano_publicacao'] : [];
   $estados = isset($_GET['estado']) ? (array)$_GET['estado'] : [];
   $conservacao = isset($_GET['conservacao']) ? (array)$_GET['conservacao'] : [];

   // --- SELECT principal ---
   $sql = "SELECT 
                u.nome_usuario,
                u.email_usuario,
                u.foto_usuario,
                l.nome_livro,
                c.ddd,
                c.celular,
                fl.caminho_imagem AS foto_livro,
                e.id_estado,
                es.estado AS nome_estado,
                es.uf
            FROM tb_livro AS l
            INNER JOIN tb_usuario AS u ON l.id_usuario = u.id_usuario
            INNER JOIN tb_endereco AS e ON u.id_usuario = e.id_usuario
            INNER JOIN tb_estado AS es ON es.id_estado = e.id_estado
            INNER JOIN tb_contato AS c ON c.id_usuario = u.id_usuario
            LEFT JOIN tb_livro_imagem AS fl ON fl.id_livro_imagem = l.id_livro_imagem
            LEFT JOIN tb_autor AS a ON l.id_autor = a.id_autor
            WHERE l.nome_livro LIKE ?";

   $params = ["%{$pesquisa}%"];

   // --- Filtros múltiplos, que vem do catalogo ---
   if (!empty($autores)) {
      $placeholders = implode(',', array_fill(0, count($autores), '?'));
      $sql .= " AND a.id_autor IN ($placeholders)";
      $params = array_merge($params, $autores);
   }

   if (!empty($anos)) {
      $placeholders = implode(',', array_fill(0, count($anos), '?'));
      $sql .= " AND l.ano_pub_livro IN ($placeholders)";
      $params = array_merge($params, $anos);
   }

   if (!empty($estados)) {
      $placeholders = implode(',', array_fill(0, count($estados), '?'));
      $sql .= " AND e.id_estado IN ($placeholders)";
      $params = array_merge($params, $estados);
   }

   if (!empty($conservacao)) {
      $placeholders = implode(',', array_fill(0, count($conservacao), '?'));
      $sql .= " AND l.estado_conservacao_livro IN ($placeholders)";
      $params = array_merge($params, $conservacao);
   }

   // --- ORDER, LIMIT e OFFSET ---
   $limite = (int)$limite;
   $offset = (int)$offset;
   $sql .= " ORDER BY l.nome_livro ASC LIMIT $limite OFFSET $offset";


   $stmt = $pdo->prepare($sql);
   $stmt->execute($params);
   $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);

   // --- Contagens para filtros ---
   $anosList = $pdo->query("SELECT l.ano_pub_livro AS livro_ano, COUNT(*) AS total
                             FROM tb_livro AS l
                             GROUP BY l.ano_pub_livro
                             ORDER BY l.ano_pub_livro DESC")->fetchAll(PDO::FETCH_ASSOC);

   $autoresList = $pdo->query("SELECT a.id_autor, a.autor, COUNT(l.id_livro) AS total_livros
                                FROM tb_livro AS l
                                INNER JOIN tb_autor AS a ON l.id_autor = a.id_autor
                                GROUP BY a.id_autor, a.autor
                                ORDER BY a.autor ASC")->fetchAll(PDO::FETCH_ASSOC);

   $estadosList = $pdo->query("SELECT e.id_estado, es.estado AS nome_estado, COUNT(l.id_livro) AS total_livros
                                FROM tb_endereco AS e
                                INNER JOIN tb_estado AS es ON es.id_estado = e.id_estado
                                INNER JOIN tb_usuario AS u ON u.id_usuario = e.id_usuario
                                INNER JOIN tb_livro AS l ON l.id_usuario = u.id_usuario
                                GROUP BY e.id_estado, es.estado
                                ORDER BY es.estado ASC")->fetchAll(PDO::FETCH_ASSOC);

   $conservacaoList = $pdo->query("SELECT l.estado_conservacao_livro AS livro_conservacao, COUNT(*) AS total
                             FROM tb_livro AS l
                             GROUP BY l.estado_conservacao_livro
                             ORDER BY l.estado_conservacao_livro DESC")->fetchAll(PDO::FETCH_ASSOC);

   @session_start();
   $_SESSION['usuarios'] = $usuarios;
   $_SESSION['pesquisa'] = $pesquisa;
   $_SESSION['pagina'] = $pagina;
   $_SESSION['anos'] = $anosList;
   $_SESSION['autores'] = $autoresList;
   $_SESSION['estados'] = $estadosList;
   $_SESSION['conservacao'] = $conservacaoList;

   // --- Manter filtros na URL ---
   $query = http_build_query([
      'search' => $pesquisa,
      'conservacao' =>$conservacao,
      'autor' => $autores,
      'ano_publicacao' => $anos,
      'estado' => $estados,
      'pagina' => $pagina
   ]);

   header("Location: catalogo.php?$query");
   exit;
} catch (PDOException $e) {
   echo "Erro de Conexão: " . $e->getMessage();
}
