Hospedado em BYEHOST15 (INCOMPLETO - 16/12/2025)
https://sistemabookare.byethost15.com/index.php

Concepts de design:
https://www.figma.com/design/IWFgm3Mbu2ofxshN6ykHhI/BookareWebsite?node-id=0-1&t=58noxwwaIjFnjRtP-1

## BOOKARE

O Bookare é um sistema desenvolvido como parte do TCC para o curso de Desenvolvimento de Sistemas da Etec de Itaquera.
Composto por 6 integrantes, o grupo criou a empresa fictícia Lughtech, que tem como propósito aproximar pessoas por meio da tecnologia.

A plataforma tem foco na troca de livros e funciona como uma ponte entre dois usuários. Nela, os usuários se encontram, solicitam livros que estão em posse de outros usuários e entram em contato para que a troca seja realizada de forma externa ao sistema.



![telabookareGif](https://github.com/user-attachments/assets/754e7e04-6a76-4358-a20f-d5225e0c5078)

## NOSSO SISTEMA CONTA COM

### Catálogo de livros:

Existe uma variedade de usuários com livros cadastrados. Ao realizar uma pesquisa, o livro desejado é exibido juntamente com as informações de seu respectivo dono.


<img width="1919" height="872" alt="image" src="https://github.com/user-attachments/assets/55f90a8b-d42a-4704-a254-57dc60c17dca" />


*Imagem do catálogo de livros*

### Filtragem de usuários e livros:

Os livros e seus donos são filtrados com base em autor, localização, estado de conservação e ano de publicação.


<img width="1901" height="869" alt="image" src="https://github.com/user-attachments/assets/b8019ae8-2fda-4c52-8968-eabb26c85b5a" />


*Exemplo da filtragem de livros aplicada no sistema*

### Sistema de login:

O usuário pode cadastrar seu perfil com suas respectivas informações de contato na plataforma. Um livro só será publicado caso as informações de endereço estejam devidamente preenchidas.


<img width="1919" height="871" alt="image" src="https://github.com/user-attachments/assets/374acbf4-f662-4204-b65e-c6a85ee682e5" />


*Tela de cadastro de usuário*

### Cadastro de endereço:

O sistema realiza integração com a API ViaCEP, que busca automaticamente o CEP do usuário.


<img width="1919" height="878" alt="image" src="https://github.com/user-attachments/assets/44760c6d-a846-48f6-b912-35717452e141" />


*Pop-up de atualização de informações*


### Dashboard interativa

#### Guia de Informações:

Cada usuário tem acesso a uma dashboard onde pode gerenciar suas informações. É possível atualizar a foto de perfil, nome, informações de contato, além de cadastrar e editar livros. A dashboard é dividida em guias, onde essas funcionalidades são organizadas.


<img width="1919" height="873" alt="image" src="https://github.com/user-attachments/assets/caf0df92-d867-4740-8b6d-41715e934b4b" />


*Dashboard com as informações do usuário*


#### Cadastro de livros:

O cadastro utiliza o ISBN do livro e, por meio da API do Google Books, obtém automaticamente suas informações, como autor, data de publicação, título, idioma e capa. Dessa forma, o usuário precisa apenas informar o estado de conservação do livro e adicionar fotos para a verificação real dessa condição.


<img width="1919" height="869" alt="image" src="https://github.com/user-attachments/assets/27340e3a-982e-4260-bd66-ef7d9b10f6d0" />


*Dashboard - guia de cadastro de livros*


#### Listagem de livros:

Todos livros cadastrados são automaticamente disponibilizados na guia de listagem (Meus Livros), onde é possivel excluir o livro ou alterar suas informações.


<img width="1919" height="863" alt="image" src="https://github.com/user-attachments/assets/aca67132-53b5-4b42-b0f2-8b7e1df1f8af" />


*Dashboard- guia de listagem de livros*


#### Administrador:

Existe uma guia especial localizada na dashboard, desenvolvida exclusivamente para contas de administrador. Essa guia apresenta informações gerais do sistema, como o total de livros cadastrados, total de usuários, usuários com mais livros cadastrados, livros por região, entre outros dados. Essas informações são exibidas em tabelas que se atualizam em tempo real. Além disso, é possível visualizar um gráfico geral com os dados do sistema, desenvolvido com Chart.js.


<img width="1919" height="867" alt="image" src="https://github.com/user-attachments/assets/8a824723-91ca-4fda-8f8c-719064d383c9" />


*Dashboard - guia de administrador*


## TROCA DE LIVROS

Assim que a conta do usuário é cadastrada, ele tem a opção de tornar suas informações de contato visíveis ou não.

### Informações visíveis:

O sistema utiliza o número de telefone do usuário para iniciar um contato direto via WhatsApp, permitindo que o usuário interessado entre em contato rapidamente. Também é possível realizar o contato por e-mail.


<img width="1919" height="866" alt="image" src="https://github.com/user-attachments/assets/63be5a00-dde4-43ed-8e13-ac32e2816669" />

*Detalhes da troca - Usuário opta por deixar suas informações visiveis*


### Informações não visíveis:

O usuário interessado preenche um formulário localizado na página de detalhes do livro. Com base nessas informações, o sistema envia uma mensagem automática por e-mail ao dono do livro, utilizando o Gmail, informando os meios de contato do usuário interessado na troca.


<img width="1919" height="866" alt="image" src="https://github.com/user-attachments/assets/c6f1fc32-7a13-48be-a3d2-844b21213003" />

*Detalhes da troca - Usuário opta por não deixar suas informações visiveis - pequeno formlário em destaque*



## FERRAMENTAS E LINGUAGENS

### Backend

MySQL  
PHP  
PHPMailer  

### Frontend

HTML  
CSS  
JavaScript  
Chart.js  

### APIs

Google Books API  
ViaCEP

### Design e Prototipagem

Figma  
Canva  




