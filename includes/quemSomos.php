<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quem Somos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
     <?php include(__DIR__ . "/topo.php"); ?>
    <!--<header>
        <div class="nav-detalhes">
            <div class="imglogo">
                <a href="#" target="_blank"><img src="img/logo-bookare-nav.png" alt=""></a>
            </div>
            <div class="atalhos-detalhes">
                <ul>
                    <li><a href="#">QUEM SOMOS</a></li>
                    <li><a href="#">COMO FUNCIONA?</a></li>
                    <li><a href="#">SEGURANÇA</a></li>
                    <li><a href="#">CONTATOS</a></li>
                </ul>
            </div>
            <div class="botao-detalhes">
                <button type="button">Entrar</button>
            </div>
        </div>
    </header> -->
    
    <section1 style="width: 100%;">
        <div class="quemsomos-detalhes" style="width: 100%;">
            <div class="titulo-detalhes">
                <h1>QUEM SOMOS</h1>
            </div>
            <div class="texto-detalhes">
                <p>A bookare é uma plataforma gratuita <br>sem fins lucrativos que tem como <br> objetivo democratizar a leitura, atuando <br>apenas como uma ponte, deixando que <br>as pessoas construam essa iniciativa.</p>
            </div>
            <div class="imgsec1">
                <img src="/SistemaBookare/assets/img/logo.png" alt="">
            </div>
        </div>
    </section1>

    <section2 id="comoFunciona">
        <div class="container-deatalhes">
            <div class="texto">
                <p>COMO FUNCIONA?</p>
            </div>
            <div class="comofunciona">
                <div class="biblioteca">
                    <img src="/SistemaBookare/assets/img/livraria-comofunciona.png" alt="">
                    <p>O Bookare é um site feito para <br>facilitar a troca de livros usados — <br> sabe aquele livro que está pegando <br> poeira na estante?</p>
                </div>
                 <div class="livro-detalhes">
                    <img src="/SistemaBookare/assets/img/livro-aberto-comofunciona.png" alt="">
                    <p>E claro, se você encontrar <br> um livro que te interesse, <br> também pode pedir a troca. <br> Simples assim!</p>
                </div>
                <div class="maos-detalhes">
                    <img src="/SistemaBookare/assets/img/maos-comofunciona.png" alt="">
                    <p>Cadastre-se, adicione os livros que <br> você já leu (ou não quer mais) e <br> deixe que outras pessoas os <br> encontrem e solicitem a troca.</p>
                </div>
            </div>
        </div>
    </section2>

    <section3 style="width: 100%;" id="seguranca">
        <div class="container2-detalhes">
              <div class="titulo-detalhes">
                    <p>SEGURANÇA</p>
                </div>
            <div class="seguranca">
                <div class="imagens">
                    <img src="/SistemaBookare/assets/img/cadeado-seguranca.png" class="img1" alt="">
                    <img src="/SistemaBookare/assets/img/verificacao-seguranca.png" class="img2" alt="">
                    <img src="/SistemaBookare/assets/img/livro-seguranca.png" class="img3" alt="">
                </div>
                <div class="texto-detalhes">
                    <p>Na nossa plataforma, sua segurança é prioridade. Todas as informações fornecidas são utilizadas exclusivamente para facilitar a comunicação entre os usuários interessados em trocar livros. Caso o proprietário opte por não exibir seus dados de contato, o sistema permite o envio de mensagens através de um formulário seguro, que encaminha o e-mail automaticamente sem expor informações pessoais. Assim, você mantém controle total sobre suas interações e pode decidir com quem deseja conversar, garantindo uma experiência segura e confiável.</p>
                </div>
            </div>
        </div>
    </section3>

    <section4>
        <div class="container3-detalhes">
            <div class="titulo-detalhes">
                <h1>CONTATO</h1>
            </div>
            <div class="texto-detalhes">
                <h2>Mande sua sugestão, diga-nos no que podemos melhorar!</h2>
            </div>
        <div class="container4-detalhes">
            <div class="formulario-detalhes">
                    <label for="Nome">Nome:</label>
                    <input placeholder="Digite seu Nome:" type="text" name="nome" id="">
                    <label for="E-mail">E-mail:</label>
                    <input placeholder="Digite seu E-mail:" type="text" name="E-mail" id="">
                    <label for="Assunto">Assunto:</label>
                    <input placeholder="Digite o Assunto:" type="text" name="Assunto" id="">
                </div>
                <div class="mensagem-detalhes">
                        <label for="Mensagem:">Mensagem:</label>
                        <textarea  type="text" name="Mensagem" id="" > </textarea> <br>
                        <button type="submit">Enviar</button>
                </div>
            </div>
        </div>
    </section4>

         <footer>
        <div class="container">
            <div class="icons">
                <div class="logoFooter">
                    <img src="/SistemaBookare/assets/img/BookareLogo.png" alt="">
                </div>
                <div class="redes">
                    <a href=""><img src="/SistemaBookare/assets/img/instagram.png" alt=""></a>
                    <a href=""><img src="/SistemaBookare/assets/img/whatsapp.png" alt=""></a>
                    <a href=""><img src="/SistemaBookare/assets/img/github.png" alt=""></a>
                </div>
            </div>
            <div class="listas">
                <ul class="contato">
                    <h3>Contato</h3>
                    <li><a href="">Entre em contato</a></li>
                    <li><a href="">Redes socias</a></li>
                    <li><a href="">Descubra a Lughtech</a></li>
                </ul>
                <ul class="informacoes">
                    <h3>Informações</h3>
                    <li><a href="">Como trocar livros</a></li>
                    <li><a href="">Quem somos</a></li>
                    <li><a href="">Segurança</a></li>
                </ul>
            </div>
        </div>
        <div class="moreInfo">
            <p>Mande sugestões para nosso e-mail: lugh tech.contato@gmail.com</p>
            <p>2025, Lughtech Inc. Todos os direitos reservados.</p>
        </div>
    </footer>
</body>
</html>