<?php
require_once __DIR__ . "/../../connect.php";
@session_start();

$id_usuario = $_SESSION['id_usuario'] ?? null;
if (!$id_usuario) {
    echo "Erro: usuário não autenticado.";
    exit;
}

// Recebe os dados do formulário (aceita diferentes names)
$logradouro  = trim($_POST['logradouro'] ?? '');
$numero      = trim($_POST['numero'] ?? '');
$complemento = trim($_POST['complemento'] ?? '');
$bairro      = trim($_POST['bairro'] ?? '');
$cidade      = trim($_POST['cidade'] ?? '');
$cep         = trim($_POST['cep'] ?? '');

// DDD / celular (aceita 'ddd' ou 'id_ddd' vindo do form)
$ddd         = trim($_POST['ddd'] ?? $_POST['id_ddd'] ?? '');
$celular     = trim($_POST['celular'] ?? '');
$fixo        = trim($_POST['fixo'] ?? '');

// id_estado pode vir como 'id_estado' (select) ou 'estado'/'nome_estado' (texto)
$id_estado_raw = $_POST['id_estado'] ?? $_POST['estado'] ?? $_POST['nome_estado'] ?? $_POST['uf'] ?? null;
$id_estado = null;

if ($id_estado_raw !== null && $id_estado_raw !== '') {
    // se vier numérico, usa direto
    if (is_numeric($id_estado_raw)) {
        $id_estado = (int)$id_estado_raw;
    } else {
        // se veio o nome do estado como texto, tenta converter para id
        $nome = trim($id_estado_raw);
        $stmt = $con2->prepare("SELECT id_estado FROM tb_estado WHERE estado = ? LIMIT 1");
        $stmt->bind_param("s", $nome);
        $stmt->execute();
        $res = $stmt->get_result();
        if ($row = $res->fetch_assoc()) {
            $id_estado = (int)$row['id_estado'];
        } else {
            // Tenta busca case-insensitive aproximada (opcional)
            $nomeLike = $nome;
            $stmt = $con2->prepare("SELECT id_estado FROM tb_estado WHERE LOWER(estado) = LOWER(?) LIMIT 1");
            $stmt->bind_param("s", $nomeLike);
            $stmt->execute();
            $res = $stmt->get_result();
            if ($row = $res->fetch_assoc()) {
                $id_estado = (int)$row['id_estado'];
            } else {
                // não encontrou → deixa NULL (usuário não selecionou/forneceu corretamente)
                $id_estado = null;
            }
        }
    }

    // Se chegou um id numérico, verifica se existe realmente na tabela
    if ($id_estado !== null) {
        $chk = $con2->prepare("SELECT 1 FROM tb_estado WHERE id_estado = ? LIMIT 1");
        $chk->bind_param("i", $id_estado);
        $chk->execute();
        $resChk = $chk->get_result();
        if ($resChk->num_rows === 0) {
            // id inválido → define NULL
            $id_estado = null;
        }
    }
}

// ================================
// Atualiza endereço
// ================================
if ($id_estado === null) {
    // atualiza deixando id_estado NULL (evita violação de FK)
    $sqlEndereco = "UPDATE tb_endereco 
                    SET logradouro = ?, numero = ?, complemento = ?, bairro = ?, cidade = ?, id_estado = NULL, cep = ?
                    WHERE id_usuario = ?";
    $stmtEndereco = $con2->prepare($sqlEndereco);
    if (!$stmtEndereco) {
        echo "Erro prepare endereço: " . $con2->error;
        exit;
    }
    $stmtEndereco->bind_param(
        "ssssssi",
        $logradouro,
        $numero,
        $complemento,
        $bairro,
        $cidade,
        $cep,
        $id_usuario
    );
} else {
    // atualiza usando o id_estado válido
    $sqlEndereco = "UPDATE tb_endereco 
                    SET logradouro = ?, numero = ?, complemento = ?, bairro = ?, cidade = ?, id_estado = ?, cep = ?
                    WHERE id_usuario = ?";
    $stmtEndereco = $con2->prepare($sqlEndereco);
    if (!$stmtEndereco) {
        echo "Erro prepare endereço: " . $con2->error;
        exit;
    }
    $stmtEndereco->bind_param(
        "sssssssi",
        $logradouro,
        $numero,
        $complemento,
        $bairro,
        $cidade,
        $id_estado,
        $cep,
        $id_usuario
    );
}

if (!$stmtEndereco->execute()) {
    echo "Erro ao atualizar endereço: " . $stmtEndereco->error;
    exit;
}

// ================================
// Atualiza contato
// ================================
$sqlContato = "UPDATE tb_contato 
               SET ddd = ?, celular = ?, fixo = ?
               WHERE id_usuario = ?";

$stmtContato = $con2->prepare($sqlContato);
if (!$stmtContato) {
    echo "Erro prepare contato: " . $con2->error;
    exit;
}
$stmtContato->bind_param("sssi", $ddd, $celular, $fixo, $id_usuario);

if (!$stmtContato->execute()) {
    echo "Erro ao atualizar contato: " . $stmtContato->error;
    exit;
}

echo "sucesso";

