<!DOCTYPE html>

<main>
    <?php require_once __DIR__ . "/../../connect.php";
    @session_start();
    $id_usuario = $_SESSION['id_usuario'];
    $info = mysqli_query($con2, "SELECT nome_usuario, email_usuario, foto_usuario, DATE_FORMAT(criado_em, '%d/%m/%Y %H:%i:%s') AS criado_em FROM tb_usuario WHERE id_usuario = $id_usuario;
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

            <form action="dashboard/tabViews/info.act.php" method="post" id="formFotoUser" enctype="multipart/form-data">
                <fieldset>
                    <legend>Inserir Foto de Usuario</legend>
                    <input type="file" name="fotoUser" id="fileFotoUser">
                </fieldset>
                <input type="submit" value="Confirmar">
            </form>
            <?php
            @session_start();
            if (isset($_SESSION['msg'])) {
                echo "<div class=msg>";
                echo "<p>{$_SESSION['msg']}</p>";
                echo "</div>";
                unset($_SESSION['msg']);
                echo "<script>
                        setTimeout(function() {
                        location.reload();
                        }, 2000);
                      </script>";
            }

            echo "<img src='/SistemaBookare/includes/dashboard/tabViews/{$infos['foto_usuario']}'";
            $_SESSION['fotoUser'] = $infos['foto_usuario'];
            ?>

            

        </div>
    </div>

</main>