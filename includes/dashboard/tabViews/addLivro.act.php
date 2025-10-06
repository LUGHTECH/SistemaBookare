<?php
session_start();
header('Content-Type: application/json');

// Configurações de conexão com o banco - SUBSTITUA COM SUAS CONFIGURAÇÕES
$host = 'localhost';
$dbname = 'bd_bookare';
$username = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erro de conexão: ' . $e->getMessage()]);
    exit;
}

// Função para inserir ou buscar ID de entidade (autor, editora, etc.)
function getOrCreateEntity($pdo, $tabela, $campo, $valor, $idField = null) {
    if (empty($valor)) {
        return null;
    }
    
    if (!$idField) {
        $tabelaSemPrefixo = preg_replace('/^tb_/', '', $tabela);
        $idField = 'id_' . $tabelaSemPrefixo;
    }
    
    // Buscar existente
    $stmt = $pdo->prepare("SELECT $idField FROM $tabela WHERE $campo = ?");
    $stmt->execute([$valor]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($result) {
        return $result[$idField];
    }
    
    // Inserir novo
    $stmt = $pdo->prepare("INSERT INTO $tabela ($campo) VALUES (?)");
    if ($stmt->execute([$valor])) {
        return $pdo->lastInsertId();
    }
    
    return null;
}

// Função para processar upload de imagem
function processarImagem($file, $idLivro, $tipo) {
    $diretorio = "uploads/livros/$idLivro/";
    if (!is_dir($diretorio)) {
        mkdir($diretorio, 0777, true);
    }
    
    $extensao = pathinfo($file['name'], PATHINFO_EXTENSION);
    $nomeArquivo = $tipo . '_' . time() . '_' . uniqid() . '.' . $extensao;
    $caminhoCompleto = $diretorio . $nomeArquivo;
    
    if (!move_uploaded_file($file['tmp_name'], $caminhoCompleto)) {
        throw new Exception('Erro ao fazer upload da imagem');
    }
    
    return ['caminho' => $caminhoCompleto];
}

// Função para download de imagem da URL
function downloadImagemDaUrl($url, $idLivro, $tipo) {
    $diretorio = "uploads/livros/$idLivro/";
    if (!is_dir($diretorio)) {
        mkdir($diretorio, 0777, true);
    }
    
    // Determinar extensão a partir da URL
    $urlInfo = parse_url($url);
    $path = $urlInfo['path'] ?? '';
    $extensao = pathinfo($path, PATHINFO_EXTENSION);
    if (empty($extensao)) {
        $extensao = 'jpg'; // Padrão
    }
    
    $nomeArquivo = $tipo . '_' . time() . '_' . uniqid() . '.' . $extensao;
    $caminhoCompleto = $diretorio . $nomeArquivo;
    
    $context = stream_context_create([
        'http' => [
            'header' => "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36"
        ]
    ]);
    
    $imageData = file_get_contents($url, false, $context);
    if ($imageData === false) {
        throw new Exception('Erro ao baixar imagem da URL');
    }
    
    if (file_put_contents($caminhoCompleto, $imageData) === false) {
        throw new Exception('Erro ao salvar imagem baixada');
    }
    
    return $caminhoCompleto;
}

// Processar dados do formulário
try {
    // Verificar se é uma requisição POST
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception('Método não permitido');
    }

    // Dados básicos
    $nomeLivro = $_POST['nomeLivro'] ?? '';
    $anoPublicacao = $_POST['anoPublicacao'] ?? null;
    $autor = $_POST['autor'] ?? '';
    $genero = $_POST['genero'] ?? '';
    $editora = $_POST['editora'] ?? '';
    $idioma = $_POST['idioma'] ?? '';
    $sinopse = $_POST['sinopse'] ?? '';
    $estadoConservacao = $_POST['estadoConservacao'] ?? '';
    $isbn = $_POST['isbn'] ?? '';
    $idUsuario = $_SESSION['id_usuario'] ?? null;


    // Validar usuário
    if (!$idUsuario) {
        throw new Exception('Usuário não autenticado');
    }

    // Validar campos obrigatórios
    if (empty($nomeLivro) || empty($autor) || empty($genero) || empty($idioma) || empty($estadoConservacao)) {
        throw new Exception('Por favor, preencha todos os campos obrigatórios.');
    }
    
    // Iniciar transação
    $pdo->beginTransaction();
    
    // Inserir/obter IDs das entidades relacionadas
    $idAutor = getOrCreateEntity($pdo, 'tb_autor', 'autor', $autor);
    $idEditora = getOrCreateEntity($pdo, 'tb_editora', 'editora', $editora);
    $idGenero = getOrCreateEntity($pdo, 'tb_genero', 'genero', $genero);
    $idIdioma = getOrCreateEntity($pdo, 'tb_idioma', 'codigo_idioma', $idioma, 'id_idioma');
    
    if (!$idAutor) {
        throw new Exception('Erro ao processar autor');
    }
    if (!$idGenero) {
        throw new Exception('Erro ao processar gênero');
    }
    if (!$idIdioma) {
        throw new Exception('Erro ao processar idioma');
    }

    
    
    // Inserir livro
    $stmtLivro = $pdo->prepare("
        INSERT INTO tb_livro (
            id_usuario, isbn, nome_livro, id_genero, id_autor, 
            id_editora, id_idioma, ano_pub_livro, sinopse_livro, estado_conservacao_livro
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ");
    
    $stmtLivro->execute([
        $idUsuario, $isbn, $nomeLivro, $idGenero, $idAutor,
        $idEditora, $idIdioma, $anoPublicacao, $sinopse, $estadoConservacao
    ]);
    
    $idLivro = $pdo->lastInsertId();
    
    // Processar capa
    $idLivroImagemCapa = null;
    
    // Verificar se há capa da API
    if (isset($_POST['capaUrl']) && !empty($_POST['capaUrl'])) {
        try {
            $capaPath = downloadImagemDaUrl($_POST['capaUrl'], $idLivro, 'capa');
            $stmtImagem = $pdo->prepare("
                INSERT INTO tb_livro_imagem (id_livro, tipo_imagem, caminho_imagem, ordem_imagem)
                VALUES (?, 'capa', ?, 0)
            ");
            $stmtImagem->execute([$idLivro, $capaPath]);
            $idLivroImagemCapa = $pdo->lastInsertId();
        } catch (Exception $e) {
            // Se falhar o download da capa da API, continuar sem capa
            error_log("Erro ao baixar capa da API: " . $e->getMessage());
        }
    }
    // Verificar se há upload de capa
    elseif (isset($_FILES['capa']) && $_FILES['capa']['error'] === UPLOAD_ERR_OK) {
        $capaInfo = processarImagem($_FILES['capa'], $idLivro, 'capa');
        $stmtImagem = $pdo->prepare("
            INSERT INTO tb_livro_imagem (id_livro, tipo_imagem, caminho_imagem, ordem_imagem)
            VALUES (?, 'capa', ?, 0)
        ");
        $stmtImagem->execute([$idLivro, $capaInfo['caminho']]);
        $idLivroImagemCapa = $pdo->lastInsertId();
    }
    
    // Atualizar livro com ID da imagem da capa
    if ($idLivroImagemCapa) {
        $stmtUpdate = $pdo->prepare("UPDATE tb_livro SET id_livro_imagem = ? WHERE id_livro = ?");
        $stmtUpdate->execute([$idLivroImagemCapa, $idLivro]);
    }
    
    // Processar fotos
    $ordem = 1;
    
    // Processar fotos individuais
    foreach ($_FILES as $key => $file) {
        if (strpos($key, 'fotos') === 0 && is_array($file['name'])) {
            // Fotos enviadas como array (fotos[0], fotos[1], etc.)
            for ($i = 0; $i < count($file['name']); $i++) {
                if ($file['error'][$i] === UPLOAD_ERR_OK) {
                    $foto = [
                        'name' => $file['name'][$i],
                        'type' => $file['type'][$i],
                        'tmp_name' => $file['tmp_name'][$i],
                        'error' => $file['error'][$i],
                        'size' => $file['size'][$i]
                    ];
                    $fotoInfo = processarImagem($foto, $idLivro, 'foto');
                    $stmtImagem = $pdo->prepare("
                        INSERT INTO tb_livro_imagem (id_livro, tipo_imagem, caminho_imagem, ordem_imagem)
                        VALUES (?, 'foto', ?, ?)
                    ");
                    $stmtImagem->execute([$idLivro, $fotoInfo['caminho'], $ordem++]);
                }
            }
        }
    }
    
    // Commit da transação
    $pdo->commit();
    
    echo json_encode([
        'success' => true, 
        'message' => 'Livro cadastrado com sucesso! ID: ' . $idLivro, 
        'id_livro' => $idLivro
    ]);
    
} catch (Exception $e) {
    // Rollback em caso de erro
    if (isset($pdo) && $pdo->inTransaction()) {
        $pdo->rollBack();
    }
    
    error_log("Erro no cadastro de livro: " . $e->getMessage());
    
    echo json_encode([
        'success' => false, 
        'message' => $e->getMessage()
    ]);
}
?>