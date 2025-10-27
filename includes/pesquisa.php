
 <?php 

   $host = "localhost";
   $dbname = "bd_bookare"; //parametros do banco
   $user = "root";
   $pass = "";

   try{
      $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $pass); //cria o obj pdo para a conexão
      $pdo ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      
      $pesquisa = $_GET['search'];
      $limite = 6;
      $pagina = isset($_GET['pagina']) ? (int)$_GET['pagina'] : 1;
      $offset = ($pagina - 1) * $limite;

      //select

      $sqlBusca = "SELECT 
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
                     WHERE nome_livro LIKE :livro
                     ORDER BY l.nome_livro ASC
                     LIMIT :limite OFFSET :offset ";

      $stmt = $pdo->prepare($sqlBusca);
      $stmt->bindValue(":livro", "%{$pesquisa}%"); //função que troca o valor :livro pra varivel $pesquisa
      $stmt->bindValue(":limite", $limite, PDO::PARAM_INT);
      $stmt->bindValue(":offset", $offset, PDO::PARAM_INT);
      $stmt->execute();

      $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC); 
      
      @session_start();
      $_SESSION['usuarios'] = $usuarios;
      $_SESSION['pesquisa'] = $pesquisa;
      $_SESSION['pagina'] = $pagina;

      header("location:catalogo.php?busca=" . urlencode($pesquisa));
      exit;

      
     // echo "oi";


   }catch(PDOException $e){
      //tratar erros
      echo "Erro de Conexao: " . $e->getMessage();
   }



 


