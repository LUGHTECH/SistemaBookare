Hospedado em BYEHOST15 (INCOMPLETO - 16/12/2025)
https://sistemabookare.byethost15.com/index.php

Concepts de design:
https://www.figma.com/design/IWFgm3Mbu2ofxshN6ykHhI/BookareWebsite?node-id=0-1&t=58noxwwaIjFnjRtP-1

O Bookare é um sistema desenvolvido como parte do TCC para o curso de Desenvolvimento de Sistemas da Etec de Itaquera.
Composto por 6 integrantes, o grupo criou a empresa fictícia Lughtech, que tem como propósito aproximar pessoas por meio da tecnologia.

A plataforma tem foco na troca de livros e funciona como uma ponte entre dois usuários. Nela, os usuários se encontram, solicitam livros que estão em posse de outros usuários e entram em contato para que a troca seja realizada de forma externa ao sistema.

##NOSSO SISTEMA CONTA COM

###Catálogo de livros: Existe uma variedade de usuários com livros cadastrados. Ao realizar uma pesquisa, o livro desejado é exibido juntamente com as informações de seu respectivo dono.


<img width="1919" height="872" alt="image" src="https://github.com/user-attachments/assets/55f90a8b-d42a-4704-a254-57dc60c17dca" />


Catalogo de livros

-Filtragem de usuários e livros: Os livros e seus donos são filtrados com base em autor, localização, estado de conservação e ano de publicação.

-Sistema de login: O usuário pode cadastrar seu perfil com suas respectivas informações de contato na plataforma. Um livro só será publicado caso as informações de endereço estejam devidamente preenchidas.

-Cadastro de endereço: O sistema realiza integração com a API ViaCEP, que busca automaticamente o CEP do usuário.

-Dashboard interativa: Cada usuário tem acesso a uma dashboard onde pode gerenciar suas informações. É possível atualizar a foto de perfil, nome, informações de contato, além de cadastrar e editar livros. A dashboard é dividida em guias, onde essas funcionalidades são organizadas.

-Cadastro de livros: O cadastro utiliza o ISBN do livro e, por meio da API do Google, obtém automaticamente suas informações, como autor, data de publicação, título, idioma e capa. Dessa forma, o usuário precisa apenas informar o estado de conservação do livro e adicionar fotos para a verificação real dessa condição.

-Administrador: Existe uma guia especial localizada na dashboard, desenvolvida exclusivamente para contas de administrador. Essa guia apresenta informações gerais do sistema, como o total de livros cadastrados, total de usuários, usuários com mais livros cadastrados, livros por região, entre outros dados. Essas informações são exibidas em tabelas que se atualizam em tempo real. Além disso, é possível visualizar um gráfico geral com os dados do sistema, desenvolvido com Chart.js.

\\TROCA DE LIVROS//

Assim que a conta do usuário é cadastrada, ele tem a opção de tornar suas informações de contato visíveis ou não.

Informações visíveis:
O sistema utiliza o número de telefone do usuário para iniciar um contato direto via WhatsApp, permitindo que o usuário interessado entre em contato rapidamente. Também é possível realizar o contato por e-mail.

Informações não visíveis:
O usuário interessado preenche um formulário localizado na página de detalhes do livro. Com base nessas informações, o sistema envia uma mensagem automática por e-mail ao dono do livro, utilizando o Gmail, informando os meios de contato do usuário interessado na troca.

\\FERRAMENTAS E LINGUAGENS//

// Backend

MySQL  
PHP  
PHPMailer  

// Frontend

HTML  
CSS  
JavaScript  
Chart.js  

// APIs

Google Books API  
ViaCEP

// Design e Prototipagem

Figma  
Canva  
CANVA




