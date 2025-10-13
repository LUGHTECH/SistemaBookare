<?php include(__DIR__ . "/header.php"); ?>
<?php if (session_status() === PHP_SESSION_NONE) {
    session_start();
};
$username = $_SESSION['username'] ?? null; ?>

<header>
    <div class="container">
        <nav>
            <div class="logo">
                <a href="../index.php"><img src="/SistemaBookare/assets/img/BookareLogo.png" alt=""></a>
            </div>
            <div class="menu">
                <ul>
                    <li><a href="#">Contato</a></li>
                    <li><a href="#">Como Funciona?</a></li>
                    <li><a href="">Segurança</a></li>
                    <li><a href="">Contatos</a></li>
                </ul>
            </div>
            <div class="login">
                <div class="entrar">
                    <?php

                    if (!isset($_SESSION['id_usuario'])) {
                        echo "<a href='includes/createUser.php'>Entrar</a>";
                    } else {
                        echo '<div class="drop">Olá, ' . htmlspecialchars($username) . '
                                        <div class="forms">
                                        <p>Opcões</p>
                                        <a href="/SistemaBookare/includes/dashboard.php">Sua Dashboard</a>
                                        <a href="SistemaBookare/includes/dashboard.php">Alterar Cadastro</a>
                                         <form method="post" action="/SistemaBookare/includes/logout.php" style="display:inline">
                                             <input type="hidden" name="csrf_token" value="' . htmlspecialchars($_SESSION['csrf_token'] ?? '') . '">
                                             <button type="submit">Sair</button>
                                          </form>
                                          </div>
                                       </div>';
                    }
                    ?>
                </div>
                <div class="perfil">
                    <?php

                    if (!isset($_SESSION['id_usuario'])) {
                        echo "<a href='includes/createUser.php'><img src='/SistemaBookare/assets/img/loginIcon.png'></a>";
                    } else {
                        $fotoUser = $_SESSION['fotoUser'] ?? '';

                        if (!empty($fotoUser)) {
                            // Se tiver foto na sessão, usa ela
                            $caminhoFoto = "/SistemaBookare/includes/dashboard/tabViews/{$fotoUser}";
                        } else {
                            // Caso contrário, usa a padrão
                            $caminhoFoto = "/SistemaBookare/assets/img/loginIcon.png";
                        }

                        echo "<img src='{$caminhoFoto}' alt='Foto do usuário'>";
                    }

                    ?>

                </div>
            </div>
        </nav>
    </div>
</header>