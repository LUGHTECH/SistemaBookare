-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/10/2025 às 01:32
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_bookare`
--
CREATE DATABASE IF NOT EXISTS `bd_bookare` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bd_bookare`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_autor`
--

CREATE TABLE `tb_autor` (
  `id_autor` int(11) NOT NULL,
  `autor` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_autor`
--

INSERT INTO `tb_autor` (`id_autor`, `autor`) VALUES
(1, 'Arthur Conan Doyle'),
(2, 'Agatha Christie'),
(3, 'Edgar Allan Poe'),
(4, 'Mary Shelley, Luis Reyes Gil'),
(5, 'Matt Ruff'),
(6, 'J.K. Rowling'),
(7, 'Roald Dahl'),
(8, 'Rick Riordan'),
(9, 'Mary Shelley'),
(10, 'Franz Kafka'),
(11, 'Scott Cawthon, Elley Cooper'),
(12, 'Scott Cawthon, Kira Breed-Wrisley'),
(13, 'H. P. Lovecraft'),
(14, 'Dan Brown'),
(15, 'Matt Haig'),
(16, 'Emily Brontë');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_avaliacao`
--

CREATE TABLE `tb_avaliacao` (
  `id_avaliacao` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_troca` int(11) NOT NULL,
  `texto` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_contato`
--

CREATE TABLE `tb_contato` (
  `id_contato` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `ddd` char(2) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `fixo` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_contato`
--

INSERT INTO `tb_contato` (`id_contato`, `id_usuario`, `ddd`, `celular`, `fixo`) VALUES
(6, 9, '', '969295557', ''),
(7, 10, '36', '969295758', ''),
(8, 11, '11', '96929997', ''),
(9, 12, '12', '859295557', ''),
(10, 13, '96', '858885554', ''),
(11, 14, '23', '978585557', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_editora`
--

CREATE TABLE `tb_editora` (
  `id_editora` int(11) NOT NULL,
  `editora` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_editora`
--

INSERT INTO `tb_editora` (`id_editora`, `editora`) VALUES
(1, 'Principis'),
(2, 'Globo Livros'),
(3, 'Lebooks Editora'),
(4, 'Autêntica Editora'),
(5, 'Intrínseca'),
(6, 'Pottermore Publishing'),
(7, 'Galera Junior'),
(8, 'Editora Intrinseca'),
(9, 'Zahar'),
(10, 'Editora Melhoramentos'),
(11, 'Lindhardt og Ringhof'),
(12, 'Editora Arqueiro'),
(13, 'Editora Bertrand Brasil'),
(14, 'Editora Schwarcz - Companhia das Letras');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_endereco`
--

CREATE TABLE `tb_endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `numero` char(5) NOT NULL,
  `complemento` varchar(20) NOT NULL,
  `bairro` varchar(20) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `cep` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_endereco`
--

INSERT INTO `tb_endereco` (`id_endereco`, `id_usuario`, `logradouro`, `numero`, `complemento`, `bairro`, `cidade`, `id_estado`, `cep`) VALUES
(6, 9, 'Rua Gonçalves de Lima', '22', 'Fundos', 'Recanto Verde do Sol', '', NULL, '08382100'),
(7, 10, 'Rua dos oitos', '22', 'Fundos', 'Itaquera', 'São Paulo', 25, '07292100'),
(8, 11, 'Estrada Fidelis', '900', 'Nenhum', 'Terceira Divisão', 'São Paulo', 25, '08483100'),
(9, 12, 'Rua dos oitos', '22', 'Nenhum', 'Recanto Verde do Sol', 'Rio de janeiro', 19, '8282100'),
(10, 13, 'Rua dos louros', '62', 'sumiu', 'ter', 'salvador', 5, '6385100'),
(11, 14, 'Rua casa do car', '22', 'fundos', 'Itaquera', 'salvador', 20, '9699100');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estado`
--

CREATE TABLE `tb_estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `uf` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_estado`
--

INSERT INTO `tb_estado` (`id_estado`, `estado`, `uf`) VALUES
(1, 'Acre', 'AC'),
(2, 'Alagoas', 'AL'),
(3, 'Amapá', 'AP'),
(4, 'Amazonas', 'AM'),
(5, 'Bahia', 'BA'),
(6, 'Ceará', 'CE'),
(7, 'Distrito Federal', 'DF'),
(8, 'Espírito Santo', 'ES'),
(9, 'Goiás', 'GO'),
(10, 'Maranhão', 'MA'),
(11, 'Mato Grosso', 'MT'),
(12, 'Mato Grosso do Sul', 'MS'),
(13, 'Minas Gerais', 'MG'),
(14, 'Pará', 'PA'),
(15, 'Paraíba', 'PB'),
(16, 'Paraná', 'PR'),
(17, 'Pernambuco', 'PE'),
(18, 'Piauí', 'PI'),
(19, 'Rio de Janeiro', 'RJ'),
(20, 'Rio Grande do Norte', 'RN'),
(21, 'Rio Grande do Sul', 'RS'),
(22, 'Rondônia', 'RO'),
(23, 'Roraima', 'RR'),
(24, 'Santa Catarina', 'SC'),
(25, 'São Paulo', 'SP'),
(26, 'Sergipe', 'SE'),
(27, 'Tocantins', 'TO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_genero`
--

CREATE TABLE `tb_genero` (
  `id_genero` int(11) NOT NULL,
  `genero` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_genero`
--

INSERT INTO `tb_genero` (`id_genero`, `genero`) VALUES
(1, 'Fiction'),
(2, 'Juvenile Fiction'),
(3, 'Young Adult Fiction'),
(4, 'Literary Collections');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_idioma`
--

CREATE TABLE `tb_idioma` (
  `id_idioma` int(11) NOT NULL,
  `codigo_idioma` varchar(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_idioma`
--

INSERT INTO `tb_idioma` (`id_idioma`, `codigo_idioma`, `nome`) VALUES
(1, 'pt', ''),
(2, 'es', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livro`
--

CREATE TABLE `tb_livro` (
  `id_livro` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `nome_livro` varchar(255) NOT NULL,
  `id_livro_imagem` int(11) DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_editora` int(11) NOT NULL,
  `id_idioma` int(11) NOT NULL,
  `ano_pub_livro` smallint(4) DEFAULT NULL,
  `sinopse_livro` text NOT NULL,
  `data_add_livro` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado_conservacao_livro` enum('Novo','Seminovo','Com Marcas de Uso','Danos Leves','Danos Severos') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_livro`
--

INSERT INTO `tb_livro` (`id_livro`, `id_usuario`, `isbn`, `nome_livro`, `id_livro_imagem`, `id_genero`, `id_autor`, `id_editora`, `id_idioma`, `ano_pub_livro`, `sinopse_livro`, `data_add_livro`, `estado_conservacao_livro`) VALUES
(2, 1, '', 'E não sobrou nenhum', 1, 1, 2, 2, 1, 2014, 'Uma ilha misteriosa, um poema infantil, dez soldadinhos de porcelana e muito suspense são os ingredientes com que Agatha Christie constrói seu romance mais importante. Na ilha do Soldado, antiga propriedade de um milionário norte-americano, dez pessoas sem nenhuma ligação aparente são confrontadas por uma voz misteriosa com fatos marcantes de seus passados. Convidados pelo misterioso mr. Owen, nenhum dos presentes tem muita certeza de por que estão ali, a despeito de conjecturas pouco convincentes que os leva a crer que passariam um agradável período de descanso em mordomia. Entretanto, já na primeira noite, o mistério e o suspense se abatem sobre eles e, num instante, todos são suspeitos, todos são vítimas e todos são culpados. É neste clima de tensão e desconforto que as mortes inexplicáveis começam e, sem comunicação com o continente devido a uma forte tempestade, a estadia transforma-se em um pesadelo. Todos se perguntam: quem é o misterioso anfitrião, mr. Owen? Existe mais alguém na ilha? O assassino pode ser um dos convidados? Que mente ardilosa teria preparado um crime tão complexo? E, sobretudo, por quê? São essas e outras perguntas que o leitor será desafiado a resolver neste fabuloso romance de Agatha Christie, que envolve os espíritos mais perspicazes num complexo emaranhado de situações, lembranças e acusações na busca deste sagaz assassino. Medo, confinamento e angústia: que o leitor descubra por si mesmo porque E não sobrou nenhum foi eleito o melhor romance policial de todos os tempos.', '2025-10-10 23:09:00', 'Novo'),
(4, 9, '', 'O POÇO E O PÊNDULO', 3, 1, 3, 3, 1, 2022, 'Edgar Allan Poe (1809-1849) foi um poeta, escritor, crítico literário e editor norte-americano. Poe foi um extraordinário contista e escreveu memoráveis contos de mistério, terror e policiais, sempre com seu estilo único e pioneiro. Nesta edição o leitor terá o privilégio de conhecer três contos que, sem dúvida, figuram entre os melhores e mais conhecidos de Edgar Allan Poe; Prepare-se para mergulhar numa sucessão de três histórias de tirar o fôlego e que por um bom tempo restarão em sua memória. São elas: O Poço e o Pêndulo; Morella e O Coração Delator.', '2025-10-13 18:42:32', 'Novo'),
(7, 10, '', 'Frankenstein', 5, 1, 4, 4, 1, 2021, 'Nascido e criado na Suíça, Victor Frankenstein sempre foi ávido de conhecimento. Na universidade, embarca em uma complexa e profunda pesquisa sobre a definição da vida. Uma noite, como por milagre, chega a um processo que lhe permite fazer reviver a matéria morta. Trabalhando dia e noite, ele descobre como animar um corpo feito de pedaços de cadáveres humanos e consegue criar uma criatura sobre-humana. Quando vê sua criatura, horrorizado com a figura monstruosa, grotesca, horrenda, Frankenstein foge, deixando sozinho o ser a quem dera vida. Começa então uma série de acontecimentos dramáticos, numa narrativa que leva às últimas consequências os sentimentos humanos de amor e ódio, desejo, carência, abandono, vingança. O desfecho é comovente e nos faz refletir sobre a natureza humana, sua ambição desmedida, seu egoísmo. Publicado pela primeira vez em 1818, este é um belíssimo livro, tenso, rico, uma das obras mais admiradas da literatura mundial.', '2025-10-20 13:03:05', 'Novo'),
(8, 10, '', 'Território Lovecraft', 6, 1, 5, 5, 1, 2020, 'Uma jornada fantástica e assustadora, adaptada para virar série na HBO com produção do diretor de Corra!, Jordan Peele, e J.J. Abrams Nos Estados Unidos segregados da década de 1950, Atticus é um rapaz negro, veterano da Guerra da Coreia, fã de H. P. Lovecraft e outros escritores de pulp fiction. Ao descobrir que o pai desapareceu, ele volta à cidade natal para, com o tio e a amiga, partir em uma missão de resgate. Na viagem até a mansão do herdeiro da propriedade que mantinha um dos ancestrais de Atticus escravizado, o grupo enfrentará sociedades secretas, rituais sanguinolentos e o preconceito de todos os dias. Ao chegar, Atticus encontra seu pai acorrentado, mantido prisioneiro por uma confraria secreta, que orquestra um ritual cujo personagem principal é o próprio Atticus. A única esperança de salvação do jovem, no entanto, pode ser a semente de sua destruição — e de toda a sua família. E esta é apenas a primeira parada de uma jornada impressionante. Estruturado ao mesmo tempo como uma coletânea de contos e um romance, Território Lovecraft apresenta, além de personagens memoráveis, elementos sobrenaturais, como casas assombradas e portais para outras realidades, objetos enfeitiçados e livros mágicos. Um retrato caleidoscópico do racismo — o fantasma que até hoje assombra o mundo —, a obra de Matt Ruff une ficção histórica e pulp noir ao horror e à fantasia de Lovecraft para explorar os terrores da época de segregação racial nos Estados Unidos.', '2025-10-20 22:08:31', 'Novo'),
(9, 10, '', 'E não sobrou nenhum', 7, 1, 2, 2, 1, 2014, 'Uma ilha misteriosa, um poema infantil, dez soldadinhos de porcelana e muito suspense são os ingredientes com que Agatha Christie constrói seu romance mais importante. Na ilha do Soldado, antiga propriedade de um milionário norte-americano, dez pessoas sem nenhuma ligação aparente são confrontadas por uma voz misteriosa com fatos marcantes de seus passados. Convidados pelo misterioso mr. Owen, nenhum dos presentes tem muita certeza de por que estão ali, a despeito de conjecturas pouco convincentes que os leva a crer que passariam um agradável período de descanso em mordomia. Entretanto, já na primeira noite, o mistério e o suspense se abatem sobre eles e, num instante, todos são suspeitos, todos são vítimas e todos são culpados. É neste clima de tensão e desconforto que as mortes inexplicáveis começam e, sem comunicação com o continente devido a uma forte tempestade, a estadia transforma-se em um pesadelo. Todos se perguntam: quem é o misterioso anfitrião, mr. Owen? Existe mais alguém na ilha? O assassino pode ser um dos convidados? Que mente ardilosa teria preparado um crime tão complexo? E, sobretudo, por quê? São essas e outras perguntas que o leitor será desafiado a resolver neste fabuloso romance de Agatha Christie, que envolve os espíritos mais perspicazes num complexo emaranhado de situações, lembranças e acusações na busca deste sagaz assassino. Medo, confinamento e angústia: que o leitor descubra por si mesmo porque E não sobrou nenhum foi eleito o melhor romance policial de todos os tempos.', '2025-10-26 18:13:25', 'Novo'),
(10, 11, '', 'O POÇO E O PÊNDULO', 8, 1, 3, 3, 1, 2022, 'Edgar Allan Poe (1809-1849) foi um poeta, escritor, crítico literário e editor norte-americano. Poe foi um extraordinário contista e escreveu memoráveis contos de mistério, terror e policiais, sempre com seu estilo único e pioneiro. Nesta edição o leitor terá o privilégio de conhecer três contos que, sem dúvida, figuram entre os melhores e mais conhecidos de Edgar Allan Poe; Prepare-se para mergulhar numa sucessão de três histórias de tirar o fôlego e que por um bom tempo restarão em sua memória. São elas: O Poço e o Pêndulo; Morella e O Coração Delator.', '2025-10-26 23:05:10', 'Novo'),
(11, 11, '', 'Harry Potter e a Pedra Filosofal', 9, 2, 6, 6, 1, 2015, 'Quando virou o envelope, com a mão trêmula, Harry viu um lacre de cera púrpura com um brasão; um leão, uma águia, um texugo e uma cobra circulando uma grande letra \"H\". Harry Potter nunca havia ouvido falar de Hogwarts quando as cartas começaram a aparecer no capacho da Rua dos Alfeneiros, no 4. Escritos a tinta verde-esmeralda em pergaminho amarelado com um lacre de cera púrpura, as cartas eram rapidamente confiscadas por seus pavorosos tio e tia. Então, no aniversário de onze anos de Harry, um gigante com olhos que luziam como besouros negros chamado Rúbeo Hagrid surge com notícias surpreendentes: Harry Potter é um bruxo e tem uma vaga na Escola de Magia e Bruxaria de Hogwarts. Uma incrível aventura está para começar!', '2025-10-26 23:05:51', 'Seminovo'),
(12, 11, '', 'As bruxas', 10, 2, 7, 7, 1, 2023, 'As bruxas querem trucidar, triturar e sumir com todas as crianças! Será que vão conseguir? Do célebre autor britânico Roald Dhal, As bruxas é um clássico da literatura infantil. Este não é um conto de fadas. É uma história sobre bruxas de verdade. Elas vestem roupas comuns, têm empregos comuns e se parecem bastante com pessoas comuns. Mas estão longe de serem comuns... O mais importante de tudo é que elas odeiam crianças. E a Grã-Bruxa, líder de todas as bruxas, tem um plano para fazer toda e qualquer criança desaparecer do mundo. Isto é, a não ser que um menino e a sua vovó consigam impedi-la.', '2025-10-26 23:11:46', 'Com Marcas de Uso'),
(13, 11, '', 'A casa de Hades', 11, 3, 8, 8, 1, 2013, 'Hazel está diante de uma encruzilhada. As forças de Gaia estão decididas a impedi-los de avançar e alcançar seu objetivo: chegar à Casa de Hades, nas terras antigas, para resgatar Percy e Annabeth e fechar definitivamente as Portas da Morte, impedindo os monstros de retornarem ao mundo mortal. Ela e o que restou da tripulação do Argo II sabem o que precisa ser feito, mas todos os caminhos parecem levar ao fracasso de sua missão. Entretanto, eles precisam se decidir e agir rápido, pois o tempo está passando. A sanguinária Mãe Terra escolheu o dia primeiro de agosto para o seu despertar. No Tártaro, Annabeth e Percy passam por grandes dificuldades. Famintos, com sede e feridos, mal conseguem andar pelo território sombrio e venenoso repleto de inimigos que espreitam na escuridão. Não há como descobrir onde ficam as Portas da morte. E mesmo que soubessem sua localização, uma legião formada pelos monstros mais poderosos e fiéis a Gaia estará lá para guardá-las. Nesse momento, Annabeth e Percy não estão em condições de enfrentá-los em um combate. Apesar da enorme desvantagem, Hazel, Annabeth, Percy e os outros semideuses da profecia sabem que sua única opção é tentar o impossível. Não apenas por si mesmos, mas por todos que amam, ainda que o amor possa ser a escolha mais arriscada de todas. “Riordan se tornou o nome da vez na literatura juvenil.” O Globo “O amor contagiante de Rick Riordan pelo assunto é evidente.” Kirkus Reviews Best-seller da Veja', '2025-10-26 23:13:52', 'Novo'),
(14, 12, '', 'Sherlock Holmes - O cão dos Baskerville', 12, 1, 1, 4, 1, 2019, 'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?', '2025-10-26 23:27:43', 'Novo'),
(15, 12, '', 'O filho de Netuno', 13, 3, 8, 8, 1, 2012, 'A vida de Percy Jackson é assim mesmo: uma grande bagunça de deuses e monstros que, na maioria das vezes, acaba em problemas. Filho de Poseidon, o deus do mar, um belo dia Percy desperta sem memória e acaba em um acampamento de heróis que não reconhece. Agarrado à lembrança de uma garota, só tem uma certeza: os dias de jornadas e batalhas não terminaram. Percy e seus novos colegas semideuses vão enfrentar os misteriosos desígnios da Profecia dos Sete. Se falharem, as consequências, é claro, serão desastrosas. Com início no “outro” acampamento meio-sangue e se estendendo para além das terras dos deuses, esta sequência da série Os heróis do Olimpo apresenta novos semideuses e criaturas incríveis, além de trazer de volta alguns monstros bastante conhecidos. Best-seller da Veja', '2025-10-26 23:28:52', 'Novo'),
(16, 12, '', 'Frankenstein: edição bolso de luxo', 14, 1, 9, 9, 1, 2020, 'A mais famosa história de horror de todos os tempos em edição bolso de luxo Obcecado pela ideia de dar vida à matéria inanimada, o cientista Victor Frankenstein entra em pânico e foge quando finalmente consegue ter sucesso criando um monstro feito de restos humanos. Entregue ao abandono e à rejeição, a criatura vai atrás do seu criador, em busca de respostas e vingança. Mais famosa história de horror de todos os tempos, Frankenstein impressiona pela capacidade de causar arrepios ainda hoje, mais de duzentos anos após a sua publicação. Impressiona também pelo poder de nos fazer refletir de forma profunda sobre temas tão atuais como a solidão, o preconceito e a prepotência humana. Com tradução do escritor Santiago Nazarian, autor de romances que flertam com o suspense e o terror psicológico, essa edição bolso de luxo da coleção Clássicos Zahar, traz o texto integral e uma instigante apresentação. A versão impressa apresenta ainda capa dura e acabamento de luxo.', '2025-10-26 23:31:03', 'Novo'),
(17, 12, '', 'A metamorfose', 15, 4, 10, 10, 1, 2014, 'Neste livro, um dos maiores clássicos do século XX, Kafka conta a história de Gregor Samsa, um caixeiro-viajante frustrado com seu trabalho e que carrega o fardo de sustentar a família. Certa manhã, Gregor se vê transformado em um inseto monstruoso. Uma casa grossa, seis pernas, antenas, um desconforto se ver naquele corpo e não se sentir mais um ser humano. Esse acontecimento fantástico desencadeia uma série de ações que mostram a impotência do homem diante do pragmatismo da sociedade.', '2025-10-26 23:35:32', 'Novo'),
(18, 13, '', 'Sherlock Holmes - O cão dos Baskerville', 16, 1, 1, 3, 1, 2019, 'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?', '2025-10-27 21:23:00', 'Com Marcas de Uso'),
(19, 13, '', 'Mergulho na escuridão', 17, 3, 11, 8, 1, 2024, 'Nova série do fenômeno Five Nights at Freddy’s traz contos inéditos e arrepiantes que extrapolam o universo do videogame que conquistou milhões de fãs no mundo todo Seja nos videogames de sucesso, no filme recorde de bilheteria ou nos livros best-sellers, criaturas perigosas rondam a famosa rede de pizzarias Freddy Fazbear’s e ameaçam a vida de quem cruza seu caminho. Os contos da nova série Pavores de Fazbear trazem personagens nunca antes vistos, além de pistas sobre os maiores mistérios do universo de Five Nights at Freddy’s. Oswald só quer se divertir nas férias de verão. Entediado, o menino decide entrar numa piscina de bolinhas interditada — e acaba indo parar no passado, nos dias de glória da Pizzaria Freddy Fazbear’s. Quando retorna ao presente, um coelho maligno também sai da escuridão da piscina para assombrá-lo... Sarah está disposta a tudo para ser bonita. Certo dia, ela encontra uma linda boneca de metal e a leva para casa. Grata por ter sido resgatada, a misteriosa robô se oferece para realizar o desejo de Sarah. Desde que a menina nunca, nunca lhe desobedeça... Millie não aguenta mais sua vida patética. Ela odeia morar com o avô, odeia os colegas da escola e sente que ninguém a entende. Porém, quando a garota decide se esconder da família, encontra um urso animatrônico com sede de sangue... Unindo mistério, terror, ação e, claro, animatrônicos assassinos, Mergulho na escuridão explora os medos mais profundos de três jovens solitários e vai surpreender até o fã mais corajoso de Five Nights at Freddy’s. O livro conta ainda com a primeira parte da história “Aparição de Sutura”, que acompanha a investigação policial sobre uma criatura perturbadora. No epílogo de cada volume da série, uma nova parte da trama é revelada.', '2025-10-27 21:26:40', 'Danos Severos'),
(20, 13, '', 'Os distorcidos', 18, 3, 12, 8, 1, 2018, 'O jogo de sucesso que resgata em livro o melhor das clássicas histórias de terror Five Nights at Freddy’s é uma das maiores séries de jogos de terror de todos os tempos. Com cinco jogos e milhões de cópias vendidas, conquistou fãs no mundo todo por trazer à tona os medos mais obscuros que só brinquedos sinistros são capazes de provocar. Um universo agora expandido para uma série de livros coescritos pelo próprio criador dos jogos, Scott Cawthon. No primeiro volume, Olhos prateados, Charlie e seus amigos desvendam misteriosos assassinatos que aconteceram na Pizzaria Freddy Fazbear’s, um lugar tomado por perigosos animatrônicos. Agora em Os distorcidos, um ano se passou e Charlie continua assombrada por pesadelos. Para piorar, uma nova onda de assassinatos começa a acontecer e ela se pergunta: mas se todo o terror foi destruído junto com o que sobrou da pizzaria, o que estaria por trás dessas mortes? • Durante a CCXP 2017 no Brasil, o produtor Jason Blum, responsável por sucessos como Atividade Paranormal e Corra!, confirmou a adaptação cinematográfica de Five Nights at Freddy’s. • Em dezembro foi disponibilizado gratuitamente um novo jogo da franquia, Freddy Fazbear’s Pizzeria Simulator. “Five Nights at Freddy’s é um jogo de terror que faz você duvidar da própria noção de realidade. O problema não são os monstros pulando na tela, mas o suspense aterrorizante da porta se abrindo lentamente.” Omri Petitte, PCGamer', '2025-10-27 21:30:52', 'Danos Leves'),
(21, 13, '', 'O chamado de Cthulhu e outros contos', 19, 1, 13, 1, 1, 2020, 'O Chamado de Cthulhu é um conto do norte-americano H.P. Lovecraft que logo se tornou um clássico do terror. Foi escrito em 1926 e publicado pela primeira vez na revista estadunidense Weird Tales em fevereiro de 1928. Cthulhu é um deus que nas primeiras páginas do conto aparece como um ídolo de argila quase indescritível, possuindo um culto multimilenar dedicado a trazê-lo de volta, o seu retorno desencadearia o fim da humanidade. Neste livro, encontramos esse clássico e mais sete contos consagrados do autor na literatura de terror.', '2025-10-27 21:32:15', 'Seminovo'),
(22, 13, '', 'Los gatos de Ulthar', 20, 1, 13, 11, 2, 2019, 'Mientras mira a su gato, un narrador desconocido, recuerda que en el pueblo de Ulthar existe una ley que prohíbe matar a los gatos y nos cuenta el oscuro por qué... Resulta que en Ulthar vivía una pareja de ancianos campesinos que se divertían atrapando y asesinando gatos de maneras extrañas, sin saber que destino que les esperaría. Escrito en 1920 por H.P. Lovecraft, Los gatos de Ulthar es uno de los cuentos más populares del reconocido escritor. Howard Phillips Lovecraft (1890-1937), más conocido como H.P. Lovecraft, fue un escritor estadounidense, autor de novelas y relatos cortos de terror y ciencia ficción. Conocido por enfocarse en el género llamado horror cósmico, su obra mezcla el terror sobrenatural con elementos de ciencia ficción, como otras dimensiones, viajes en el tiempo y extraterrestres. Autor de célebres cuentos como Dagón (1917), La tumba (1917), Celefais (1920) o La decisión de Randolph Carter (1919). Su obra más importante llamada Los mitos de Cthulhu incluye famosos relatos como \"La Ciudad Sin Nombre\" (1921), \"El Ceremonial\" (1923) o \"La Llamada De Cthulhu\" (1926).', '2025-10-27 21:33:16', 'Novo'),
(23, 13, '', 'O Código Da Vinci', 21, 1, 14, 12, 1, 2012, 'Um dos maiores fenômenos editoriais de todos os tempos. “Dan Brown é uma de minhas leituras obrigatórias. O código Da Vinci é fascinante, perfeito para fãs de História, loucos por teorias da conspiração, amantes de enigmas ou qualquer pessoa que aprecie uma narrativa incrível.” – Harlan Coben, autor de Não conte a ninguém e Não fale com estranhos Um assassinato no Museu do Louvre traz à tona uma sinistra conspiração para revelar um segredo que foi protegido por uma sociedade secreta desde os tempos de Jesus Cristo. A vítima é o curador do museu, Jacques Saunière, um dos líderes dessa fraternidade, o Priorado de Sião, que já teve como membros Leonardo da Vinci, Victor Hugo e Isaac Newton. Pouco antes de morrer, ele consegue deixar uma mensagem cifrada na cena do crime. Apenas sua neta, a criptógrafa Sophie Neveu, e Robert Langdon, um famoso simbologista de Harvard, podem desvendá-la. Os dois se transformam em suspeitos e em detetives enquanto percorrem as ruas de Paris e de Londres tentando montar um intricado quebra-cabeça que pode lhes revelar um segredo milenar que envolve a Igreja Católica. Poucos passos à frente das autoridades e do assassino, Sophie e Robert buscam pistas nas obras de Da Vinci e se debruçam sobre alguns dos maiores mistérios da cultura ocidental – da natureza do sorriso da Mona Lisa ao significado do Santo Graal. Mesclando com perfeição suspense, informações sobre obras de arte, documentos e rituais secretos, Dan Brown consagrou-se como um dos autores mais brilhantes da atualidade.', '2025-10-27 21:34:22', 'Novo'),
(24, 14, '', 'Inferno', 22, 1, 14, 12, 1, 2013, '850.000 exemplares vendidos no Brasil. Uma leitura eletrizante e um convite a pensarmos no papel da ciência para o futuro da humanidade. Dan Brown nos leva por uma viagem pela cultura, pela arte e pela literatura italianas – passando por lugares como a Galleria degli Uffizi, o Duomo de Florença e a Basílica de São Marcos. “Dan Brown é o mestre do suspense intelectual.” – The Wall Street Journal No meio da noite, o renomado simbologista Robert Langdon acorda de um pesadelo, num hospital. Desorientado e com um ferimento à bala na cabeça, ele não tem a menor ideia de como foi parar lá. Ao olhar pela janela e reconhecer a silhueta do Palazzo Vecchio, em Florença, Langdon tem um choque. Ele nem se lembra de ter saído dos Estados Unidos. Na verdade, não tem nenhuma recordação das últimas 36 horas. Quando um novo atentado contra a sua vida acontece dentro do hospital, Langdon é obrigado a fugir e, para isso, conta apenas com a ajuda da jovem médica Sienna Brooks. De posse de um macabro objeto que Sienna encontrou no paletó de Langdon, os dois têm que seguir uma série inquietante de códigos criada por uma mente brilhante, obcecada tanto pelo fim do mundo quanto por uma das maiores obras-primas literárias de todos os tempos: A Divina Comédia, de Dante Alighieri.', '2025-10-27 21:37:52', 'Danos Severos'),
(25, 14, '', 'A Biblioteca da Meia-Noite', 23, 1, 15, 13, 1, 2021, 'A Biblioteca da Meia-Noite é um romance incrível que fala dos infinitos rumos que a vida pode tomar e da busca incessante pelo rumo certo. Aos 35 anos, Nora Seed é uma mulher cheia de talentos e poucas conquistas. Arrependida das escolhas que fez no passado, ela vive se perguntando o que poderia ter acontecido caso tivesse vivido de maneira diferente. Após ser demitida e seu gato ser atropelado, Nora vê pouco sentido em sua existência e decide colocar um ponto final em tudo. Porém, quando se vê na Biblioteca da Meia-Noite, Nora ganha uma oportunidade única de viver todas as vidas que poderia ter vivido. Neste lugar entre a vida e a morte, e graças à ajuda de uma velha amiga, Nora pode, finalmente, se mudar para a Austrália, reatar relacionamentos antigos – ou começar outros –, ser uma estrela do rock, uma glaciologista, uma nadadora olímpica... enfim, as opções são infinitas. Mas será que alguma dessas outras vidas é realmente melhor do que a que ela já tem? Em A Biblioteca da Meia-Noite, Nora Seed se vê exatamente na situação pela qual todos gostaríamos de poder passar: voltar no tempo e desfazer algo de que nos arrependemos. Diante dessa possibilidade, Nora faz um mergulho interior viajando pelos livros da Biblioteca da Meia-Noite até entender o que é verdadeiramente importante na vida e o que faz, de fato, com que ela valha a pena ser vivida. \"Uma celebração entusiástica do poder que os livros têm de mudar vidas.\" – Sunday Times \"Um cenário de possibilidades ilimitadas, de novos caminhos trilhados, de novas vidas vividas, de um mundo totalmente diferente disponível para nós de alguma forma, em algum lugar, pode ser exatamente do que precisamos nesses tempos difíceis e turbulentos.\" – The New York Times \"Um romance extremamente original e instigante sobre a importância de valorizar a vida que você tem.\" – Independent \"Instigante e inspirador. Explora a nossa relação com o arrependimento e com o que realmente faz uma vida ser perfeita.\" – Harper\'s Bazaar \"Uma história sobre segundas chances e viver com arrependimentos. Muito envolvente.\" – Stylist \"Eu amei A Biblioteca da Meia-Noite. Ele condensa coisas importantes e tristes – morte, saúde mental, filosofia existencial – em um livro excepcional, prazeroso e de aquecer o coração.\" – Pandora Sykes', '2025-10-27 21:38:51', 'Novo'),
(26, 14, '', 'O morro dos ventos uivantes: edição comentada', 24, 1, 16, 14, 1, 2016, 'Obra-prima da literatura inglesa, uma narrativa poderosa e tragicamente bela de um amor proibido Caro leitor, você está prestes a adentrar o inferno. Mas não hesite: a viagem valerá cada segundo. Essa é uma história de amor e obsessão. E de purgação, crueza, devastação. No centro dos acontecimentos estão a voluntariosa e irascível Catherine Earnshaw e seu irmão adotivo Heathcliff. Rude nos modos e afetos, humilhado e rejeitado, ele aprende a odiar; mas com Catherine desenvolve uma relação de simbiose, paixão e também perversidade. Nada destruirá a essência desse laço – mas quando ela se casa com outro homem, por convenções sociais, as consequências são irreparáveis para todos em volta. Acompanhando a excelente tradução de Adriana Lisboa, essa bela edição de O morro dos ventos uivantes traz 90 notas, apresentação de Rodrigo Lacerda, cronologia de vida e obra de Emily Brontë e ainda dois textos de Charlotte Brontë para a reedição do livro que ela organizou após a morte da irmã. A versão impressa apresenta ainda capa dura e acabamento de luxo.', '2025-10-27 21:39:53', 'Novo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livrogenero`
--

CREATE TABLE `tb_livrogenero` (
  `id_livro` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livro_imagem`
--

CREATE TABLE `tb_livro_imagem` (
  `id_livro_imagem` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `tipo_imagem` enum('capa','foto') NOT NULL,
  `caminho_imagem` varchar(500) NOT NULL,
  `ordem_imagem` smallint(2) DEFAULT 0,
  `dataAdd_imagem` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_livro_imagem`
--

INSERT INTO `tb_livro_imagem` (`id_livro_imagem`, `id_livro`, `tipo_imagem`, `caminho_imagem`, `ordem_imagem`, `dataAdd_imagem`) VALUES
(1, 2, 'capa', 'uploads/livros/2/capa_1760137740_68e9920cda072.jpg', 0, '2025-10-10 23:09:00'),
(3, 4, 'capa', 'uploads/livros/4/capa_1760380952_68ed48183792b.jpg', 0, '2025-10-13 18:42:33'),
(5, 7, 'capa', 'uploads/livros/7/capa_1760965385_68f63309a2a7a.jpg', 0, '2025-10-20 13:03:07'),
(6, 8, 'capa', 'uploads/livros/8/capa_1760998111_68f6b2df92a16.jpg', 0, '2025-10-20 22:08:31'),
(7, 9, 'capa', 'uploads/livros/9/capa_1761502405_68fe64c5e2d28.jpg', 0, '2025-10-26 18:13:27'),
(8, 10, 'capa', 'uploads/livros/10/capa_1761519910_68fea926465f6.jpg', 0, '2025-10-26 23:05:11'),
(9, 11, 'capa', 'uploads/livros/11/capa_1761519951_68fea94fb2a77.jpg', 0, '2025-10-26 23:05:53'),
(10, 12, 'capa', 'uploads/livros/12/capa_1761520306_68feaab2970bf.jpg', 0, '2025-10-26 23:11:48'),
(11, 13, 'capa', 'uploads/livros/13/capa_1761520432_68feab3000616.jpg', 0, '2025-10-26 23:13:53'),
(12, 14, 'capa', 'uploads/livros/14/capa_1761521263_68feae6f9f78b.jpg', 0, '2025-10-26 23:27:43'),
(13, 15, 'capa', 'uploads/livros/15/capa_1761521332_68feaeb486f5a.jpg', 0, '2025-10-26 23:28:54'),
(14, 16, 'capa', 'uploads/livros/16/capa_1761521463_68feaf376958d.jpg', 0, '2025-10-26 23:31:03'),
(15, 17, 'capa', 'uploads/livros/17/capa_1761521732_68feb044df550.jpg', 0, '2025-10-26 23:35:34'),
(16, 18, 'capa', 'uploads/livros/18/capa_1761600180_68ffe2b474320.jpg', 0, '2025-10-27 21:23:00'),
(17, 19, 'capa', 'uploads/livros/19/capa_1761600400_68ffe39062ee4.jpg', 0, '2025-10-27 21:26:44'),
(18, 20, 'capa', 'uploads/livros/20/capa_1761600652_68ffe48c17908.jpg', 0, '2025-10-27 21:30:53'),
(19, 21, 'capa', 'uploads/livros/21/capa_1761600735_68ffe4dfdf622.jpg', 0, '2025-10-27 21:32:17'),
(20, 22, 'capa', 'uploads/livros/22/capa_1761600796_68ffe51cb0629.jpg', 0, '2025-10-27 21:33:18'),
(21, 23, 'capa', 'uploads/livros/23/capa_1761600862_68ffe55e3d4df.jpg', 0, '2025-10-27 21:34:23'),
(22, 24, 'capa', 'uploads/livros/24/capa_1761601072_68ffe630c17d9.jpg', 0, '2025-10-27 21:37:54'),
(23, 25, 'capa', 'uploads/livros/25/capa_1761601131_68ffe66b3d4c9.jpg', 0, '2025-10-27 21:38:52'),
(24, 26, 'capa', 'uploads/livros/26/capa_1761601193_68ffe6a9d1b7d.jpg', 0, '2025-10-27 21:39:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_troca`
--

CREATE TABLE `tb_troca` (
  `id_troca` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_livro` int(11) NOT NULL,
  `id_avaliacao` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `email_usuario` varchar(30) NOT NULL,
  `senha_usuario` varchar(60) NOT NULL,
  `status_usuario` tinyint(1) NOT NULL,
  `foto_usuario` varchar(150) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome_usuario`, `email_usuario`, `senha_usuario`, `status_usuario`, `foto_usuario`, `criado_em`) VALUES
(1, 'Cleberson', 'cleber4557@gmail.com', '$2y$10$YXMBc1extbO2Flh3iZ5MxOpP/o2Kk8UZ9oUWeSTgoOn2IXN.R5/Om', 0, 'uploads/usuarios/1/3a0417695478a52ad15b1bc93d8a0e5d.jpg', '2025-10-06 21:57:30'),
(3, 'jordan', 'jo@gmail.com', '$2y$10$u/NaTL/xQLEik83S4cpEG.AR289Aef2Vx3.Ls2l5k04.I1hWs7Q5W', 0, '', '2025-10-13 13:46:49'),
(9, 'pedro', 'per@gmail.com', '$2y$10$Nwf2YiyXH4QJTXovunn7C.mSRFmcjqWkVf7KiZze4fYArPFfd6sVO', 0, 'uploads/usuarios/9/1496c4afdb5d923168794a7c201ec20b.jpg', '2025-10-13 18:24:24'),
(10, 'Cleiton', 'cleiton@gmail.com', '$2y$10$eCQ8WSzie399Cyc/ChRk3eqXQzXQfx2DaCIpvJy/Uf9KtPePpD2UK', 0, 'uploads/usuarios/10/c219237665969ca9519dada4c907708c.jpg', '2025-10-15 21:14:16'),
(11, 'Jorgina', 'jor@gmail.com', '$2y$10$fBdhGv7wbd04LxEeKByuyOQOtITXWs6Q.lFAJu7pc.FQiBQDmsq4a', 0, 'uploads/usuarios/11/9a291a52d3427d4064b2456b3545eb0c.jpg', '2025-10-26 23:02:08'),
(12, 'Negot', 'negot@gmail.com', '$2y$10$jrGSmDTMvtWiBztdyqoOMeaRgxD7kPNbIAv7c/OBCV7hv/lnol806', 0, 'uploads/usuarios/12/db57067df81d50fbe1646a4f22796f7c.jpg', '2025-10-26 23:23:06'),
(13, 'wenzio', 'wentape@gmail.com', '$2y$10$clgXlKvznwZI3B5aP8SiYuExltFrPzGixLhu/j8.reDv9paMU5u8W', 0, 'uploads/usuarios/13/87d025611609e80c35412e6d79e78bce.jpg', '2025-10-27 21:18:11'),
(14, 'Rhyan', 'r@gmail.com', '$2y$10$YZ2k8BS7ZgNJOBRiK73hOuknZxx5pcxdU/lUl.SS5a0i9iPZ3V1Ma', 0, 'uploads/usuarios/14/df56f09a787d2b0a89659b62165a64f8.jpg', '2025-10-27 21:35:03');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_autor`
--
ALTER TABLE `tb_autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Índices de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  ADD PRIMARY KEY (`id_avaliacao`);

--
-- Índices de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD PRIMARY KEY (`id_contato`),
  ADD KEY `fk_contato_usuario` (`id_usuario`);

--
-- Índices de tabela `tb_editora`
--
ALTER TABLE `tb_editora`
  ADD PRIMARY KEY (`id_editora`);

--
-- Índices de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_endereco_usuario` (`id_usuario`),
  ADD KEY `fk_endereco_estado` (`id_estado`);

--
-- Índices de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Índices de tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Índices de tabela `tb_idioma`
--
ALTER TABLE `tb_idioma`
  ADD PRIMARY KEY (`id_idioma`),
  ADD UNIQUE KEY `uc_codigo` (`codigo_idioma`);

--
-- Índices de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livro_usuario` (`id_usuario`),
  ADD KEY `fk_livro_editora` (`id_editora`),
  ADD KEY `fk_livro_autor` (`id_autor`),
  ADD KEY `fk_livro_genero` (`id_genero`),
  ADD KEY `fk_livro_idioma` (`id_idioma`) USING BTREE,
  ADD KEY `fk_livro_imagem_principal` (`id_livro_imagem`);

--
-- Índices de tabela `tb_livrogenero`
--
ALTER TABLE `tb_livrogenero`
  ADD KEY `id_livro` (`id_livro`,`id_genero`),
  ADD KEY `fk_livrogenero_genero` (`id_genero`);

--
-- Índices de tabela `tb_livro_imagem`
--
ALTER TABLE `tb_livro_imagem`
  ADD PRIMARY KEY (`id_livro_imagem`),
  ADD KEY `id_livro` (`id_livro`);

--
-- Índices de tabela `tb_troca`
--
ALTER TABLE `tb_troca`
  ADD PRIMARY KEY (`id_troca`),
  ADD KEY `id_troca` (`id_troca`,`id_usuario`,`id_livro`,`id_avaliacao`),
  ADD KEY `fk_troca_usuario` (`id_usuario`),
  ADD KEY `fk_troca_livro` (`id_livro`),
  ADD KEY `fk_troca_avaliacao` (`id_avaliacao`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_autor`
--
ALTER TABLE `tb_autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_editora`
--
ALTER TABLE `tb_editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_idioma`
--
ALTER TABLE `tb_idioma`
  MODIFY `id_idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `tb_livro_imagem`
--
ALTER TABLE `tb_livro_imagem`
  MODIFY `id_livro_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tb_troca`
--
ALTER TABLE `tb_troca`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_contato`
--
ALTER TABLE `tb_contato`
  ADD CONSTRAINT `fk_contato_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_endereco`
--
ALTER TABLE `tb_endereco`
  ADD CONSTRAINT `fk_endereco_estado` FOREIGN KEY (`id_estado`) REFERENCES `tb_estado` (`id_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD CONSTRAINT `fk_livro_autor` FOREIGN KEY (`id_autor`) REFERENCES `tb_autor` (`id_autor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livro_editora` FOREIGN KEY (`id_editora`) REFERENCES `tb_editora` (`id_editora`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livro_genero` FOREIGN KEY (`id_genero`) REFERENCES `tb_genero` (`id_genero`),
  ADD CONSTRAINT `fk_livro_imagem_principal` FOREIGN KEY (`id_livro_imagem`) REFERENCES `tb_livro_imagem` (`id_livro_imagem`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_tb_livro_id_idioma` FOREIGN KEY (`id_idioma`) REFERENCES `tb_idioma` (`id_idioma`);

--
-- Restrições para tabelas `tb_livrogenero`
--
ALTER TABLE `tb_livrogenero`
  ADD CONSTRAINT `fk_livrogenero_genero` FOREIGN KEY (`id_genero`) REFERENCES `tb_genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livrogenero_livro` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id_livro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_livro_imagem`
--
ALTER TABLE `tb_livro_imagem`
  ADD CONSTRAINT `fk_livro_imagem` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id_livro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_troca`
--
ALTER TABLE `tb_troca`
  ADD CONSTRAINT `fk_troca_avaliacao` FOREIGN KEY (`id_avaliacao`) REFERENCES `tb_avaliacao` (`id_avaliacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_troca_livro` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id_livro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_troca_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
