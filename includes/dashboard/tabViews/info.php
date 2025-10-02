<!DOCTYPE html>

<main>
    <?php require_once __DIR__ . "/../../connect.php";
        @session_start();
        $id_usuario = $_SESSION['user_id'];
        $info = mysqli_query($con2, "SELECT username, email, fotoUser, DATE_FORMAT(created_at, '%d/%m/%Y %H:%i:%s') AS criado_em FROM user WHERE id = $id_usuario;
");
        $infos = mysqli_fetch_assoc($info);
    ?> 
    <div class="infoUser">
        <h2>Informações Pessoais</h2>
        <?php echo "<p>Nome de usuário: {$infos['username']}";
              echo "<p>Email cadastrado: {$infos['email']}";
              echo "<p>Conta criada em: {$infos['criado_em']}";

        ?> 
        <div class="imgUser">
            <h2>Foto</h2>
            <img src="" alt="">
        </div>
    </div>

</main>