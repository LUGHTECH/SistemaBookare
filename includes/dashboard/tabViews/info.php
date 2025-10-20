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
                                    e.id_estado,  
                                    es.estado AS nome_estado,
                                    es.uf,
                                    e.cep
                                FROM tb_usuario AS u
                                LEFT JOIN tb_contato AS c ON c.id_usuario = u.id_usuario
                                LEFT JOIN tb_endereco AS e ON e.id_usuario = u.id_usuario
                                LEFT JOIN tb_estado AS es ON es.id_estado = e.id_estado
                                WHERE u.id_usuario = $id_usuario
                        ");
    $infos = mysqli_fetch_assoc($info);
    // $_SESSION['infoUser'] = $infos;

    // busca todos os estados
    $estados = [];
    $query = "SELECT id_estado, estado, uf FROM tb_estado ORDER BY uf ASC";
    $result = mysqli_query($con2, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            $estados[] = $row;
        }
    }
    ?>
    <div class="infoUser">
        <div class="imgUser">
            <form action="dashboard/tabViews/info.act.php" method="post" id="formFotoUser" enctype="multipart/form-data">
                <fieldset>
                    <p style="color: #ffffffff;">Alterar Foto de Usuário</p>
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
                <div class="cont" style="width: 45%;">
                    <h2>Informações Pessoais</h2>
                    <div>
                        <p>Nome de usuário:</p>
                        <p><?= $infos['nome_usuario'] ?></p>
                        <p>E-mail:</p>
                        <p style="text-transform: lowercase;"><?= $infos['email_usuario'] ?></p>
                        <p>Conta criada em:</p>
                        <p><?= $infos['criado_em'] ?></p>
                    </div>
                </div>

                <div class="cont" style="width: 45%;">
                    <h2>Contato</h2>
                    <div>
                        <p>Celular:</p>
                        <p>(<?= $infos['ddd'] ?>) <?= $infos['celular'] ?></p>
                        <p>Fixo:</p>
                        <p><?= $infos['fixo'] ?></p>
                    </div>
                </div>

                <div class="cont" style="width: 100%;">
                    <h2>Endereço</h2>
                    <div>
                        <p>Logradouro:</p>
                        <p><?= $infos['logradouro'] ?></p>
                        <p>Numero:</p>
                        <p><?= $infos['numero'] ?></p>
                        <p>CEP:</p>
                        <p><?= $infos['cep'] ?></p>
                        <p>Complemento:</p>
                        <p><?= $infos['complemento'] ?></p>
                        <p>Bairro:</p>
                        <p><?= $infos['bairro'] ?></p>
                        <p>Cidade:</p>
                        <p><?= $infos['cidade'] ?></p>
                        <p>Estado:</p>
                        <p><?= $infos['uf'] ?></p>
                    </div>
                </div>
            </div>
            <div class="actionInfo">
                <div class="mostrarContato">
                   <img class="refresh" src="/SistemaBookare/assets/img/refresh.png" alt="" onclick="refresh()" title="Atualizar Página">
                    <div><input type="checkbox" name="viewEmail" id="mostraEmail"> Mostrar E-mail</div>
                    <div><input type="checkbox" name="viewContato" id="mostraContato"> Mostrar Telefone</div>
                    <div class="disclaimer">
                        <img src="/SistemaBookare/assets/img/information.png" alt="">
                        <p>Selecione se desejar que essas informações
                            apareçam para outros usuários. (Telefone/E-mail)
                        </p>
                    </div>
                </div>
                <div class="alterar">
                    <button onclick="abrirFormModal()" class="altInfo">Atualizar Cadastro</button>
                </div>
            </div>

        </div>
    </div>

    <div class="modal2" id="formModalContainer">
        <div class="modal-content2">
            <div class="fechar">
                <h3>Atualizar Cadastro</h3>
                <img onclick="fecharModal()" src="../assets/img/close.png" alt="">
            </div>
            <form action="" id="formModal" onsubmit="enviarFormulario(event)">
                <fieldset class="endereco">
                    <legend>Endereço 🏠</legend>
                    <div class="form-group">
                        <label for="logradrouro">Logradouro</label>
                        <input type="text" name="logradouro" id="logradouro" value="<?= $infos['logradouro'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="numero">Número</label>
                        <input type="number" name="numero" id="numero" value="<?= $infos['numero'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="complemento">Complemento</label>
                        <input type="text" name="complemento" id="complemento" value="<?= $infos['complemento'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="bairro">Bairro</label>
                        <input type="text" name="bairro" id="bairro" value="<?= $infos['bairro'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="cidade">Cidade</label>
                        <input type="text" name="cidade" id="cidade" value="<?= $infos['cidade'] ?>">
                    </div>
                    <div class="form-group">
                        <label for="id_estado">Estado</label>
                        <select name="id_estado" id="id_estado" onfocus='this.size=10;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
                            <option value="">Selecione...</option>
                            <?php foreach ($estados as $uf): ?>
                                <option
                                    value="<?= (int)$uf['id_estado'] ?>"
                                    <?= (isset($infos['id_estado']) && (int)$infos['id_estado'] === (int)$uf['id_estado']) ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($uf['uf'], ENT_QUOTES, 'UTF-8') ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cep">Cep</label>
                        <input type="number" name="cep" id="cep" value="<?= $infos['cep'] ?>">
                    </div>
                </fieldset>
                <fieldset>
                    <legend>Contato 📞</legend>
                    <div class="form-group duo">
                        <div>
                            <label for="id_ddd">DDD</label>
                            <input type="number" name="ddd" id="id_ddd" value="<?= $infos['ddd'] ?>">
                        </div>
                        <div>
                            <label for="id_celular">Celular</label>
                            <input type="number" name="celular" id="celular" value="<?= $infos['celular'] ?>">
                        </div>
                    </div>
                </fieldset>

                <div class="modal2-botoes">
                    <button type="submit" class="yes" style="background-color: #008080;">Salvar</button>
                    <button type="button" class="no" onclick="fecharModal()">Cancelar</button>
                </div>

            </form>
        </div>
    </div>

</main>