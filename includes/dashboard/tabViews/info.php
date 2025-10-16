<!DOCTYPE html>

<main>
    <?php require_once __DIR__ . "/../../connect.php";
    @session_start();
    $id_usuario = $_SESSION['id_usuario'];
    $info = mysqli_query($con2, "SELECT 
                                    u.nome_usuario,
                                    u.email_usuario,
                                    u.foto_usuario,
                                    DATE_FORMAT(u.criado_em, '%d/%m/%Y %H:%i:%s') AS criado_em,
                                    c.ddd,
                                    c.celular,
                                    c.fixo,
                                    e.logradouro,
                                    e.numero,
                                    e.complemento,
                                    e.bairro,
                                    e.cidade,
                                    es.estado AS nome_estado,
                                    e.cep
                                FROM tb_usuario AS u
                                LEFT JOIN tb_contato AS c ON c.id_usuario = u.id_usuario
                                LEFT JOIN tb_endereco AS e ON e.id_usuario = u.id_usuario
                                LEFT JOIN tb_estado AS es ON es.id_estado = e.id_estado
                                WHERE u.id_usuario = $id_usuario
                        ");
    $infos = mysqli_fetch_assoc($info);
    $_SESSION['infoUser'] = $infos;
    ?>
    <div class="infoUser">
        <div class="imgUser">
            <form action="dashboard/tabViews/info.act.php" method="post" id="formFotoUser" enctype="multipart/form-data">
                <fieldset>
                    <p style="color: #153b15;">Alterar Foto de Usuário</p>
                    <input type="file" name="fotoUser" id="fileFotoUser" style="color: #153b15;">
                </fieldset>
                <button type="submit" value="Confirmar">Confirmar</button>
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
            echo "<div class='fotoUser'>";
            echo "<img src='/SistemaBookare/includes/dashboard/tabViews/{$infos['foto_usuario']}'/>";
            echo "</div>";
            ?>
        </div>
        <div class="textInfo">
            <div class="infoP">
                <h2>Informações Pessoais</h2>
                <p>Nome de usuário: <?=$infos['nome_usuario']?></p> <p>E-mail: <?=$infos['email_usuario']?></p>
                <p>Conta criada em: <?=$infos['criado_em']?></p>
                <hr/>
                <h2>Endereço</h2>
                <p>Logradouro: <?= $infos['logradouro']?></p> <p>Numero: <?= $infos['numero']?></p>
                <p>Complemento: <?= $infos['complemento']?></p> <p>Bairro: <?=$infos['bairro']?></p>
                <p>Cidade: <?= $infos['cidade']?></p> <p>Estado: <?= $infos['nome_estado']?></p>
                <hr/>
                <h2>Contato</h2>
                <p>Celular: (<?=$infos['ddd']?>) <?=$infos['celular']?></p> 
                <p>Fixo: <?= $infos['fixo']?></p>
                <hr/>
            </div>
            <div class="mostrarContato">
                <div><input type="checkbox" name="viewEmail" id="mostraEmail"> Mostrar E-mail</div>
                <div><input type="checkbox" name="viewContato" id="mostraContato"> Mostrar Telefone</div>
            </div>
            <div class="alterar">
                <button onclick ="abrirFormModal()" class="altInfo">Atualizar Cadastro</button>
            </div>
            
        </div>
    </div>

</main>