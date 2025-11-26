<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.10.2/lottie.min.js"></script>
    <title>Bookare-Início</title>
</head>

<body>
    <?php include("includes/topo.php"); ?>
    <main class="mainBanner-index">
        <div class="container">
            <div class="chamada">
                <h1>Troque de livros onde e quando quiser com o Bookare!</h1>
            </div>
            <div class="btnCadastrar">
                <form action="includes/pesquisa.php" method="get">
                    <input type="search" id="search" name="search" placeholder="Memorias do Subsolo">
                    <input type="submit" value="Pesquisar">
                </form>
            </div>
            <div class="animation" id="animation1">
                <dotlottie-wc src="https://lottie.host/84fa2b1d-18e9-4ef9-955c-485017984853/lEFbCQWgdN.lottie" autoplay loop style="width: 100%; height: 300px;"></dotlottie-wc>
            </div>

        </div>
    </main>

    <section class="catalogo">
        <div class="container">
            <div class="semIdeias">
                <h2>Sem ideias? Sem Problemas!</h2>
                <p>Gêneros Famosos</p>
            </div>

            <!-- Botões de gêneros -->
            <div class="generos">
                <?php
                require('./includes/connect.php');
                $generos = mysqli_query($con, "SELECT * FROM genero");
                while ($g = mysqli_fetch_assoc($generos)) {
                    echo "<button id='meuBotao' onclick='carregarLivros({$g['id']})'>{$g['nome']}</button>";
                }
                ?>
            </div>

            <!-- Lista de livros (carregada via JS) -->
            <div class="livros" id="livros"></div>

            <!-- Botão Ver Mais -->
            <div class="verMais">
                <button onclick="window.location.href='includes/pesquisa.php'">Ver Mais</button>
            </div>
        </div>
    </section>

    <section class="sessaoDois">
        <div class="container">
            <div class="qualidades">
                <img src="./assets/img/bookIcon.png" alt="">
                <p>Troque o seu livro de forma<br>rápida e segura</p>
            </div>
            <div class="qualidades">
                <img src="./assets/img/teamIcon.png" alt="">
                <p>Filtre outros usuários e<br>otimize buscas</p>
            </div>
            <div class="qualidades">
                <img src="./assets/img/bookShelvesIcon.png" alt="">
                <p>Cadastre-se e descubra uma<br>variedade de livros</p>
            </div>
        </div>
    </section>

    <section class="sessaoTres">
        <div class="container">
            <div class="textAutor">
                <h2>Autores Que Deixaram Sua Marca Registrada!</h2>
                <p>Pesquise por autores</p>
            </div>
            <div class="cardAutor">

                <input type="radio" name="btn-radio" id="radio1">
                <input type="radio" name="btn-radio" id="radio2">
                <input type="radio" name="btn-radio" id="radio3">

                <div class="nav-auto">
                    <div class="botao-auto1"></div>
                    <div class="botao-auto2"></div> <!--um botao que se preenche toda vez que o input radio for marcado-->
                    <div class="botao-auto3"></div>
                </div>
                <div class="nav-manual">
                    <label for="radio1" class="botao-manual"></label>
                    <label for="radio2" class="botao-manual"></label> <!--recebe o valor do input radio-->
                    <label for="radio3" class="botao-manual"></label>
                </div>

                <div class="slide">


                    <div class="autores primeiro"> <!--o slide é divido por divs-->
                        <div class="autor" data-bg="./assets/img/autor1.jpg">
                            <h3>Stephen King</h3>
                            <p>Horror, Suspense, Fantasia</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=20&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor2.jpg">
                            <h3>Agatha Christie</h3>
                            <p>Horror, Suspense, Fantasia</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=2&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor" data-bg="./assets/img/autor3.jpg">
                            <h3>Machado de Assis</h3>
                            <p>Fantasia</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=29&autor[]=31&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor4.jpg">
                            <h3>Franz Kafka</h3>
                            <p>Horror, Suspense, Fantasia</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=2&pagina=10"><button>Descubra</button></a>
                        </div>
                    </div>
                    <div class="autores segundo"> <!--o slide é divido por divs-->
                        <div class="autor" data-bg="./assets/img/autor5.jpg">
                            <h3>George R. R. Martin</h3>
                            <p>Fantasia, Ficção histórica, Drama</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=28&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor6.jpg">
                            <h3>Clarice Lispector</h3>
                            <p>Romance, Conto, Introspecção psicológica</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=32&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor" data-bg="./assets/img/autor7.jpg">
                            <h3>J. R. R. Tolkien</h3>
                            <p>Fantasia, Aventura, Mitologia</p>
                            <a href=""><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor8.jpg">
                            <h3>Edgar Allan Poe</h3>
                            <p>Terror, Mistério, Gótico</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=3&pagina=1"><button>Descubra</button></a>
                        </div>
                    </div>
                    <div class="autores terceiro"> <!--o slide é divido por divs-->
                        <div class="autor" data-bg="./assets/img/autor9.jpg">
                            <h3>Rick Riordan</h3>
                            <p>Fantasia, Mitologia, Aventura</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=8&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor10.jpg">
                            <h3>John Green</h3>
                            <p>Romance, Drama, Jovem adulto</p>
                            <a href="/SistemaBookare/includes/pesquisa.php?search=&autor[0]=23&pagina=1"><button>Descubra</button></a>
                        </div>
                        <div class="autor" data-bg="./assets/img/autor11.jpg">
                            <h3>George Orwell</h3>
                            <p>Horror, Suspense, Fantasia</p>
                            <a href=""><button>Descubra</button></a>
                        </div>
                        <div class="autor persW" data-bg="./assets/img/autor12.jpg">
                            <h3>Suzanne Collins</h3>
                            <p>Distopia, Aventura, Romance</p>
                            <a href=""><button>Descubra</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section class="sessaoQuatro mySwiper">
        <div class="tittle">
            <h2>Avaliação dos Usuários</h2>
        </div>
        <div class="container swiper-wrapper">
            <div class="avaliacao swiper-slide">
                <div class="fotoNome">
                    <img src="./assets/img/wenzio.jpeg" alt="">
                    <h3>Wenzio Oliveira</h3>
                    <p>Usuário</p>
                </div>
                <div class="textAvaliacao">
                    <p>Achei a proposta genial! A troca de livros ficou descomplicada e divertida. Consigo conversar com outros leitores, combinar
                        as trocas e descobrir obras que nunca teria conhecido. A experiência
                        tem sido excelente e pretendo continuar usando sempre.
                    </p>
                </div>
            </div>

            <div class="avaliacao swiper-slide">
                <div class="fotoNome">
                    <img src="./assets/img/clebinho.jpg" alt="">
                    <h3>Cleberson Pereira</h3>
                    <p>Usuário</p>
                </div>
                <div class="textAvaliacao">
                    <p>Adorei a plataforma! Finalmente um lugar onde posso trocar meus livros de forma fácil e segura. O site é intuitivo, os filtros ajudam muito
                        a encontrar o que procuro e a comunidade é bem engajada. Já realizei várias trocas e todas foram tranquilas — recomendo demais!
                    </p>
                </div>
            </div>

            <div class="avaliacao swiper-slide">
                <div class="fotoNome">
                    <img src="./assets/img/marcos.jpg" alt="">
                    <h3>Marcos Vinícius</h3>
                    <p>Usuário</p>
                </div>
                <div class="textAvaliacao">
                    <p>A plataforma de troca de livros é incrível e super prática! Desde que comecei a usar,
                        encontrei diversos leitores com os mesmos interesses que eu e consegui renovar minha
                        estante com títulos que queria há tempos. O sistema é simples, rápido e eficiente,
                        tornando cada troca uma experiência agradável e segura.
                    </p>
                </div>
            </div>
        </div>
        <div class="swiper-button-next" style="color: #00796b;"></div>
        <div class="swiper-button-prev" style="color: #00796b;"></div>
    </section>

    <?php include("includes/footer.php"); ?> <!--footer-->

    <?php
    require('./includes/connect.php');

    $idGenero = 1; // ou o gênero que quiser carregar por padrão
    $sql = "SELECT * FROM tb_livro WHERE id_genero = $idGenero LIMIT 10";
    $result = mysqli_query($con, $sql);

    $livros = [];
    while ($linhas = mysqli_fetch_assoc($result)) {
        $livros[] = $linhas;
    }
    ?>


    <script src="./assets/js/animation.js"></script>
    <script src="./assets/js/mostraCapa.js"></script> <!-- primeiro -->
    <script src="./assets/js/livros.js"></script> <!-- depois -->
    <script src="./assets/js/swiper-bundle.min.js"></script>
    <script src="./assets/js/slideAv.js"></script>


</body>

</html>