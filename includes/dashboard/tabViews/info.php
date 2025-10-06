<!DOCTYPE html>

<main>
    <?php require_once __DIR__ . "/../../connect.php";
        @session_start();
        $id_usuario = $_SESSION['id_usuario'];
        $info = mysqli_query($con2, "SELECT nome_usuario, email_usuario, DATE_FORMAT(criado_em, '%d/%m/%Y %H:%i:%s') AS criado_em FROM tb_usuario WHERE id_usuario = $id_usuario;
");
        $infos = mysqli_fetch_assoc($info);
    ?> 
    <div class="infoUser">
        <h2>Informações Pessoais</h2>
        <?php echo "<p>Nome de usuário: {$infos['nome_usuario']}";
              echo "<p>Email cadastrado: {$infos['email_usuario']}";
              echo "<p>Conta criada em: {$infos['criado_em']}";

        ?> 
        <div class="imgUser">
            <h2>Foto</h2>
            <img src="" alt="">
        </div>
    </div>

</main>