<?php include(__DIR__ . "/header.php"); ?>
<?php @session_start(); 
$username = $_SESSION['username'] ?? null;?>

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
                            @session_start();
                            if(!isset($_SESSION['user_id'])){
                                echo "<a href='includes/createUser.php'>Entrar</a>";

                            } else{
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
                        <a href=""><img src="/SistemaBookare/assets/img/loginIcon.png" alt=""></a>
                    </div>
                </div>
            </nav>
        </div>
    </header>