<?php include(__DIR__ . "/header.php"); ?>

<header>
        <div class="container">
            <nav>
                <div class="logo">
                    <img src="/SistemaBookare/assets/img/BookareLogo.png" alt="">
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
                                echo "<p>Olá, $username</p>";
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