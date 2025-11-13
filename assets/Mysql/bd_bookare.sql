-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/11/2025 às 20:06
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
(16, 'Emily Brontë'),
(17, 'Dante Alighieri, José Pedro Xavier Pinheiro'),
(18, 'Fiodor Dostoievski'),
(19, 'Dostoiévski, Fiódor'),
(20, 'Stephen King'),
(21, 'Daniel Hartmann'),
(22, 'Jennifer Niven'),
(23, 'John Green'),
(24, 'Andrzej Sapkowski'),
(25, 'CELSO UNZELTE '),
(26, 'Rob Stevens'),
(27, 'C.S. Lewis'),
(28, 'George R. R. Martin'),
(29, 'Machado de Assis'),
(30, 'Aluísio de Azevedo'),
(31, 'Machado de Assis, Edições Câmara'),
(32, 'Clarice Lispector'),
(33, 'L. Frank Baum'),
(34, 'Cellbit');

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
(11, 14, '23', '978585557', ''),
(12, 15, '11', '969295557', ''),
(13, 16, '11', '96748885', ''),
(14, 17, '11', '99999997', ''),
(15, 18, '11', '969298875', ''),
(16, 19, '92', '85888569', ''),
(17, 20, '', '', ''),
(18, 21, '', '', '');

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
(14, 'Editora Schwarcz - Companhia das Letras'),
(15, 'Penguin-Companhia'),
(16, 'Nova Fronteira'),
(17, 'NoBooks Editorial'),
(18, 'Editora 34'),
(19, 'Book One Editora Ltda'),
(20, 'Suma'),
(21, 'Editora Companhia das Letras'),
(22, 'Jambô'),
(23, 'Editora Seguinte'),
(24, 'WWF Martins Fontes'),
(25, 'Saida de Emergência'),
(26, 'Universo dos Livros Editora'),
(27, 'L&PM Pocket'),
(28, 'HARLEQUIN'),
(29, 'Moderna'),
(30, 'Editora Unesp'),
(31, 'Edições Câmara'),
(32, 'Editora Rocco'),
(33, 'Antofágica');

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
(11, 14, 'Rua casa do car', '22', 'fundos', 'Itaquera', 'salvador', 20, '9699100'),
(12, 15, 'Rua Gonçalves De Lima', '22', 'Fundos', 'Recanto Verde do Sol', 'São Paulo', 25, '08382100'),
(13, 16, 'Rua Virginia Ferni', '185', 'Escada', 'Itaquera', 'São Paulo', 25, '08382100'),
(14, 17, 'Rua Bentinho', '99', 'Fundos', 'Escondido', 'Suzano', 25, '08382100'),
(15, 18, 'Rua de Suzano', '225', 'fundo de Suzano', 'Suzano', 'Suzano', 25, '08282100'),
(16, 19, 'Rua G De Lima', '36', 'fundo de Suzano', 'Recanto Verde do Sol', 'amazonas', 4, '08382100'),
(17, 20, '', '', '', '', '', NULL, ''),
(18, 21, '', '', '', '', '', NULL, '');

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
(4, 'Literary Collections'),
(5, 'Romance'),
(6, 'Terror'),
(7, 'Biography & Autobiography');

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
(26, 14, '', 'O morro dos ventos uivantes: edição comentada', 24, 1, 16, 14, 1, 2016, 'Obra-prima da literatura inglesa, uma narrativa poderosa e tragicamente bela de um amor proibido Caro leitor, você está prestes a adentrar o inferno. Mas não hesite: a viagem valerá cada segundo. Essa é uma história de amor e obsessão. E de purgação, crueza, devastação. No centro dos acontecimentos estão a voluntariosa e irascível Catherine Earnshaw e seu irmão adotivo Heathcliff. Rude nos modos e afetos, humilhado e rejeitado, ele aprende a odiar; mas com Catherine desenvolve uma relação de simbiose, paixão e também perversidade. Nada destruirá a essência desse laço – mas quando ela se casa com outro homem, por convenções sociais, as consequências são irreparáveis para todos em volta. Acompanhando a excelente tradução de Adriana Lisboa, essa bela edição de O morro dos ventos uivantes traz 90 notas, apresentação de Rodrigo Lacerda, cronologia de vida e obra de Emily Brontë e ainda dois textos de Charlotte Brontë para a reedição do livro que ela organizou após a morte da irmã. A versão impressa apresenta ainda capa dura e acabamento de luxo.', '2025-10-27 21:39:53', 'Novo'),
(28, 15, '', 'A Divina Comédia - Inferno', 26, 1, 17, 1, 1, 2020, 'A Divina Comédia é um poema clássico da literatura italiana e mundial com características épica e teológica, escrito por Dante Alighieri no século XIV período renascentista e dividido em três partes: o Inferno, o Purgatório e o Paraíso. São cem cantos protagonizados pelo próprio Dante em companhia do poeta romano Virgílio , que percorreu uma jornada espiritual pelos três reinos além-túmulo. O Inferno é descrito em 34 cantos com cerca de 140 versos cada um. Virgílio, o grande poeta romano, autor de Eneida, surge para guiar Dante pelo inferno e o purgatório em direção ao paraíso. Antes de encontrar Virgílio, ele estava numa selva escura.', '2025-11-03 16:21:34', 'Novo'),
(31, 16, '', 'Os irmãos Karamázov', 27, 1, 18, 16, 1, 2021, 'Os irmãos Karamázov, o último romance criado por Fiódor Dostoiévski, foi concluído pouco antes de sua morte e é considerado sua obra-prima. A história se desenvolve em torno do assassinato de um homem pelo próprio filho. O enredo policial, no entanto, é apenas o ponto de partida de um dos livros que mais avançam na compreensão do ser humano. Concentrando em cada um dos quatro filhos do velho Karamázov uma qualidade humana, Dostoiévski reflete os problemas da Rússia do século XIX e apresenta um painel dos dramas universais. A tradução deste clássico ficou por conta de Natália Nunes e Oscar Mendes.', '2025-11-06 18:37:29', 'Novo'),
(32, 16, '', 'O idiota', 28, 1, 18, 15, 1, 2022, 'Uma das obras mais cultuadas de Fiódor Dostoiévski por veicular ideias pessoais e detalhes autobiográficos — e, também, uma das preferidas do autor —, O idiota mostra o conflito entre um jovem quixotesco, repleto de boas intenções e sinceridade, e a sociedade russa moderna, desencantada e movida à ganância. Escrito originalmente em formato de folhetim, O idiota narra as desventuras do jovem epilético príncipe Míchkin. Dotado de uma pureza ímpar e expressando-se com sinceridade, este personagem choca-se com uma Rússia secular e desencantada, distante dos ideais cristãos de generosidade e movida por uma busca incessante por dinheiro e status. Ao retornar a São Petersburgo após um tratamento médico, Míchkin envolve-se em triângulos amorosos da alta sociedade, centrados na disputa pela atenção de Nastássia Filíppovna, uma beldade multifacetada, muitas vezes interpretada como louca pelos homens que a cortejam. Apesar das boas intenções, a presença do príncipe provoca uma série de conflitos que dinamitam aquele círculo social dependente de aparências. Em parte romance de ideias, em parte romance de costumes, que trata do nacionalismo russo e de um contexto sócio-histórico específico, a prosa de Dostoiévski reluz, em especial, ao contrapor o idealismo de Míchkin com o niilismo individualista de Ippolit, um rapaz tuberculoso despreocupado com a ética de suas ações. Este livro oferece a análise severa e complexa que o mestre russo faz de uma sociedade moderna que perdeu seu norte moral — crítica que se mostra relevante até hoje, no capitalismo tardio. Afinal, que espaço há para as boas ações, a compaixão e a caridade em um mundo onde o dinheiro é a força motriz? As agruras do protagonista representam com agudeza a visão desoladora que Dostoiévski tinha de seu entorno, o que levou o escritor a defender as ideias contidas no romance até o fim de sua vida. \"Nada fica fora do terreno de Dostoiévski (...) Tirando Shakespeare, não existe leitura mais interessante.\" — Virginia Woolf', '2025-11-06 18:38:23', 'Novo'),
(33, 16, '', 'Crime e Castigo', 29, 1, 18, 17, 1, 2015, 'Datado de 1866, este é o primeiro dos grandes romances que Dostoiévski escreveu já em plena maturidade literária, sendo provavelmente a mais bem conhecida de todas as suas obras. Recriando um estranho e doloroso mundo em torno da figura do estudante Raskólnikov, perturbado pelas privações e duras condições de vida, é uma das obras por excelência fundadoras da modernidade. Pelo inexcedível alcance e profundidade psicológica, sobretudo no que implica a exploração das motivações não conscientes e a aparente irracionalidade nos comportamentos das personagens, este autor russo tornou-se uma referência universal na literatura, sem perda de continuidade até aos nossos dias.', '2025-11-06 18:39:29', 'Novo'),
(34, 16, '', 'Noites brancas', 30, 5, 19, 18, 1, 2004, 'Livro mais romântico da obra de Dostoiévski, Noites brancas traz como tema central o encontro entre uma jovem desiludida e um sonhador, aquele que narra os eventos ocorridos ao longo de poucas noites, durante um período muito especial do ano em São Petersburgo. Esta edição da Antofágica conta com ensaio da autora Natalia Timerman e apresentação da compositora e cantora Letrux.\r\nO cenário é São Petersburgo, capital do Império Russo no século 19 e um dos temas preferidos de Dostoiévski. Cenário de suas grandes obras, a misteriosa cidade é palco de um fenômeno natural conhecido como \"noites brancas\", que ocorre quando, durante quatro dias no verão, a noite não escurece.\r\n\r\nE é justamente neste período do ano que um homem sonhador e solitário perambula pela capital. Entre devaneios, reflexões e até um diálogo ou outro com os prédios da cidade, conhece Nástienka, uma melancólica jovem de coração partido. A partir deste encontro, os personagens desenvolvem uma conexão arrebatadora, e o Sonhador tem uma sensação de que finalmente coisas incríveis podem acontecer em sua vida.\r\nA edição da Antofágica conta com tradução inédita de Lucas Simone, ilustrações de Mateus Acioli e apresentação de Letrux. O livro traz ainda posfácios do tradutor e da professora doutora em Literatura e Cultura Russa pela USP, Priscila Nascimento Marques, e conta também com um ensaio da autora Natalia Timerman.', '2025-11-06 18:43:21', 'Novo'),
(35, 16, '', 'MEMÓRIAS DO SUBSOLO', 31, 1, 18, 19, 1, 2021, 'Nesta obra-prima da literatura mundial, o genial Dostoiévski, um dos maiores autores de todos os tempos, traz uma narrativa intensa que nos convida a embarcar em uma viagem pelas memórias de um ex-funcionário público que, no auge de seus quarenta anos, vive no subsolo da repartição em que trabalhava. Dividida em duas partes, Memórias do subsolo, traz as confissões mentais do personagem, revelando seus pensamentos mais íntimos e sua visão sobre si mesmo e de alguns episódios de sua juventude, em muitos dos quais se sentiu humilhado, revelando-se decisivos para a formação de sua personalidade mordaz. Por vezes definido com anti-herói, o narrador desta obra articula monólogos sobre sua vida sombria, solitária, sem amizades, amarga e repleta de problemas de autoimagem – reflexos de seu profundo rancor e de perturbações das mais variadas naturezas. Tais características o tornam incapaz de tomar decisões ou agir com confiança, imerso em dúvidas e questões mal resolvidas sobre si mesmo e sobre o ambiente ao seu redor.', '2025-11-06 18:47:50', 'Novo'),
(36, 17, '', 'It: A coisa', 32, 1, 20, 20, 1, 2014, 'Nesse clássico que inspirou os filmes da Warner, um grupo de amigos conhecido como Clube dos Otários aprende o real sentido da amizade, do amor, da confiança... e do medo. O mais profundo e tenebroso medo. Durante as férias de 1958, em uma pacata cidadezinha chamada Derry, um grupo de sete amigos começa a ver coisas estranhas. Um conta que viu um palhaço, outro que viu uma múmia. Finalmente, acabam descobrindo que estavam todos vendo a mesma coisa: um ser sobrenatural e maligno que pode assumir várias formas. É assim que Bill, Beverly, Eddie, Ben, Richie, Mike e Stan enfrentam a Coisa pela primeira vez. Quase trinta anos depois, o grupo volta a se encontrar. Mike, o único que permaneceu em Derry, dá o sinal — uma nova onda de terror tomou a pequena cidade. É preciso unir forças novamente. Só eles têm a chave do enigma. Só eles sabem o que se esconde nas entranhas de Derry. Só eles podem vencer a Coisa. \"Mesmo depois de tantos anos, o público continua obcecado por IT. Ficamos obcecados porque todos temos medos. Todos temos algo que nos assusta, sejam palhaços e aranhas ou coisas que se escondem em um lugar muito mais profundo de nossa mente. Este livro fala com todo mundo. É o romance mais assustador de King, e duvido que isso vá mudar\" — The Guardian', '2025-11-06 18:55:06', 'Novo'),
(37, 17, '', 'O iluminado', 33, 1, 20, 21, 1, 2017, 'Um clássico de Stephen King. Edição especial, com tradução revisada e prólogo e epílogo inéditos. \"O lugar perfeito para recomeçar\", é o que pensa Jack Torrance ao ser contratado como zelador para o inverno. Hora de deixar para trás o alcoolismo, os acessos de fúria, os repetidos fracassos. Isolado pela neve com a esposa e o filho, tudo o que Jack deseja é um pouco de paz para se dedicar à escrita. Mas, conforme o inverno se aprofunda, o local paradisíaco começa a parecer cada vez mais remoto... e mais sinistro. Forças malignas habitam o Overlook, e tentam se apoderar de Danny Torrance, um garotinho com grandes poderes sobrenaturais. Possuir o menino, no entanto, se mostra mais difícil do que esperado. Então os espíritos resolvem se aproveitar das fraquezas do pai... Um dos livros mais assustadores de todos os tempos, O iluminado é um clássico de Stephen King. Edição especial com tradução revisada e prólogo e epílogo inéditos.', '2025-11-06 18:58:33', 'Novo'),
(38, 17, '', 'O Espreitador', 34, 6, 21, 22, 1, 2024, 'Daniel Hartmann foi um dos principais escritores do sobrenatural no Brasil e no resto do mundo. Com mais de dez livros publicados, incluindo os premiados O Espreitador e A Mulher Afogada, e milhões de exemplares vendidos, Hartmann redefiniu a forma como a literatura de terror é vista pelo público e pela crítica. Hartmann também foi um renomado pesquisador do oculto. Reconhecido mundialmente por suas análises de fenômenos inexplicáveis com fundo religioso, ministrou diversas palestras internacionais sobre o tema, nas quais também debateu grandes questões filosóficas, incluindo a que mais assombra a humanidade: para onde vamos após a morte? Apesar do próprio Hartmann ter expressado o desejo de que suas histórias deixassem de ser vendidas, acreditamos que todos merecem conhecer a sua obra, e temos o prazer em apresentar esta publicação. Leia sem medo. Afinal, por mais assustadores que seja, não pe como se essas histórias pudessem machucá-lo de verdade. *Daniel Hartmann é um personagem fictício do universo Ordem Paranormal.\r\n\r\nCellbit é criador de conteúdo desde 2012. Presente nas plataformas YouTube e Twitch, conquistou mais de seis milhões de inscritos e o prêmio de Melhor Conteúdo de Games do Brasil no iBest! 2023. É criador do universo de Ordem Paranormal, atuando como roteirista e mestre no RPG de mesa, e diretor criativo do jogo Enigma do Medo, ambientado no mesmo universo.\r\n\r\nFelipe Castilho escreve livros, séries, HQs e games. Entre suas várias publicações, destacam-se a duologia Ordem Vermelha, e os finalistas do Prêmio Jabuti: Serpentário e Savana de Pedra. Além disso, participou da antologia especial Coringa: O Mundo, da DC Comics, escrevendo histórias do maior vilão do Batman em terras brasileiras.\r\n\r\nKaren Soarele é a romancista dos principais universos de fantasia do Brasil: Tormenta, Ordem Paranormal e o Nerdcast RPG. Possui nove livros publicados, com destaque para A Deusa no Labirinto (agora em sua 2ª edição), As Máscaras do Metamorfo e O Enigma do Sol Oculto. Foi finalista dos prêmios AGES, Le Blanc, Minuano e Jabuti e, por sua contribuição cultural ao país, recebeu o Troféu Cecília Meireles.\r\n\r\nLeonel Caldela é um dos criadores de Tormenta, o maior universo de fantasia do Brasil. Para esse cenário escreveu: A Trilogia da Tormenta (composta por O Inimigo do Mundo, O Crânio e o Corvo e O Terceiro Deus) e A Flecha de Fogo. Também é autor dos livros O Caçador de Apóstolos e Deus Máquina. Em parceria com o Jovem Nerd, escreveu a série A Lenda de Ruff Ghanor e Ozob ― Protocolo Molotov. Fanático por RPG há décadas, é mestre dos podcasts NerdcastRPG, que deram origem a seus romances A Roda de Deus e O Criador da Morte, e da campanha online Fim dos Tempos.', '2025-11-06 19:05:56', 'Novo'),
(39, 17, '', 'O cemitério', 35, 1, 20, 20, 1, 2006, 'Nesse clássico do gênero terror, os mortos podem até voltar... mas não voltam iguais. Um dos mais aclamados de Stephen King, O cemitério é o livro que inspirou os filmes Cemitério Maldito (1989 e 2019) e Cemitério Maldito: A Origem, da Paramount+. Às vezes, a morte é melhor. Esse é o conselho que chega aos ouvidos de Louis Creed, um jovem médico que se muda para uma pequena cidade do Maine. Com sua nova casa, seu trabalho na universidade e sua família feliz, Louis acredita que finalmente encontrou seu lugar, e a finitude da vida é a última coisa a passar pela sua cabeça. Até que, caminhando pelo bosque da vizinhança, ele encontra um terreno onde gerações de crianças enterraram seus animais de estimação. Para além desses pequenos túmulos, há outro cemitério. Um que acabará se tornando irresistível, com suas forças sedutoras, capazes de tornar real o que sempre pareceu impossível. Uma premissa assustadora, uma narrativa tensa e um toque de drama e reflexão — essa é a mistura que fez de O cemitério um dos maiores clássicos do gênero. Ao mesmo tempo em que constrói uma narrativa aterrorizante, Stephen King levanta questões sobre a vida, a morte, o luto, o sobrenatural e os limites da intervenção humana. Em busca dessas respostas, o leitor é levado por uma trama impossível de largar, e quando descobre a verdade, percebe que ela é pior que a própria morte — e infinitamente mais poderosa. \"Outros livros podem até ser assustadores, mas O cemitério é terror de verdade.\" — The Guardian', '2025-11-06 19:10:34', 'Novo'),
(40, 17, '', 'Por lugares incríveis', 36, 3, 22, 23, 1, 2015, 'Agora um filme Netflix, estrelado por Elle Fanning e Justice Smith. Violet Markey tinha uma vida perfeita, mas todos os seus planos deixam de fazer sentido quando ela e a irmã sofrem um acidente de carro e apenas Violet sobrevive. Sentindo-se culpada pelo que aconteceu, a garota se afasta de todos e tenta descobrir como seguir em frente. Theodore Finch é o esquisito da escola, perseguido pelos valentões e chamado de \"aberração\" por onde passa. Para piorar, é obrigado a lidar com longos períodos de depressão, o pai violento e a apatia do resto da família. Enquanto Violet conta os dias para o fim das aulas, quando poderá ir embora da cidadezinha onde mora, Finch pesquisa diferentes métodos de suicídio e imagina se conseguiria levar algum deles adiante. Em uma dessas tentativas, ele vai parar no alto da torre da escola e, para sua surpresa, encontra Violet, também prestes a pular. Um ajuda o outro a sair dali, e essa dupla improvável se une para fazer um trabalho de geografia: conhecer lugares incríveis do estado onde moram. Ao lado de Finch, Violet para de contar os dias e finalmente passa a vivê-los. O garoto, por sua vez, encontra alguém com quem pode ser ele mesmo, e torce para que consiga se manter desperto. \"Me apaixonei por Violet e Finch antes mesmo de se apaixonarem um pelo outro. A jornada deles é adorável e inteligente e corajosa. Vai partir seu coração e relembrar o que significa estar vivo.\" — Jennifer E. Smith, autora de A probabilidade estatística do amor à primeira vista', '2025-11-06 19:14:22', 'Com Marcas de Uso'),
(41, 18, '', 'A culpa é das estrelas', 37, 3, 23, 8, 1, 2012, 'Hazel é uma paciente terminal. Ainda que, por um milagre da medicina, seu tumor tenha encolhido bastante — o que lhe dá a promessa de viver mais alguns anos —, o último capítulo de sua história foi escrito no momento do diagnóstico. Mas em todo bom enredo há uma reviravolta, e a de Hazel se chama Augustus Waters, um garoto bonito que certo dia aparece no Grupo de Apoio a Crianças com Câncer. Juntos, os dois vão preencher o pequeno infinito das páginas em branco de suas vidas. Inspirador, corajoso, irreverente e brutal, A culpa é das estrelas é a obra mais ambiciosa e emocionante de John Green, sobre a alegria e a tragédia que é viver e amar. Best-seller da Veja', '2025-11-06 19:18:35', 'Danos Leves'),
(42, 18, '', 'Harry Potter e o Cálice de Fogo', 38, 2, 6, 6, 1, 2015, 'Harry Potter nem quer acreditar na sua sorte! Afinal não vai ter de aturar os Dursleys até ao início do seu quarto ano em Hogwarts. Graças à taça Mundial de Quidditch vai passar os últimos 15 dias de férias na companhia dos Weasleys e do seu amigo Ron. Mas a verdade é que nem tudo vai correr pelo melhor para o nosso herói. Quando Harry começa a sentir a sua cicatriz a doer terrivelmente, sabe que Lord Voldemort está de novo a rondá-lo e a ganhar poder. A marca da morte, que apareceu no céu, não pode significar outra coisa...Entretanto, este é um ano muito especial para Hogwarts, pois é lá que se irá realizar o célebre Torneio dos Três Feiticeiros, no qual Harry vai desempenhar um papel decisivo e que quase lhe irá custar a vida!!', '2025-11-06 19:40:21', 'Danos Severos'),
(44, 18, '', 'A Espada do Destino', 40, 1, 24, 24, 1, 2015, 'No caminho para Brokilon, Geralt tropeça no corpo de um garoto, que provavelmente não tinha mais de quinze anos. O garoto foi morto por uma flecha, obviamente atirada com destreza, que ainda se vê cravada no seu crânio. Por experiência, o bruxo logo percebe o que aconteceu: certamente o garoto tinha se extraviado e entrado no território das dríades. Como para os outros que padeceram antes de igual sorte, provavelmente tinha acontecido o mesmo. Uma história triste, repetida com muita frequência. \'A espada do destino\' é o segundo livro da saga do bruxo Geralt de Rívia, seguido por \'O sangue dos elfos\', também publicado pela Editora WMF Martins Fontes. Fenômeno literário que inspirou a criação do game The Witcher. Mais de 2 milhões de exemplares vendidos. Andrzej Sapkowski é um grande renovador da literatura fantástica de nossos tempos, um gênio da linguagem. Sua prosa enfeitiçou leitores no mundo todo – mais de dois milhões de exemplares foram vendidos na Europa e nos Estados Unidos. Os livros contam a saga do bruxo Geralt de Rívia, um feiticeiro cheio de astúcia. Um matador impiedoso. Um assassino de sangue-frio, treinado desde a infância para caçar e eliminar monstros. Seu único objetivo: destruir as criaturas do mal que assolam o mundo. Um mundo fantástico criado por Sapkowski com claras influências da mitologia eslava. Um mundo em que nem todos os que parecem monstros são maus e nem todos os que parecem anjos são bons... \"Um livro de Sapkowski é como uma sofisticada fórmula mágica que mistura fantasia, rigor intelectual, humor inteligente e princípios de teoria econômica.\" - Revista Time', '2025-11-06 19:41:58', 'Novo'),
(45, 18, '', 'O Tempo do Desprezo', 41, 1, 24, 25, 1, 2020, 'Geralt, o bruxo, lutou contra monstros e demónios por toda a terra, mas até ele pode não estar preparado para o que está a acontecer com o seu mundo. Há intrigas, divergências e rebeliões por todo lado. Reis e exércitos estão a posicionar-se, ansiando por guerra e sangue. Os elfos ainda sofrem depois de décadas de repressão e o número de refugiados nas florestas aumenta a cada dia. Os Magos lutam entre si, alguns a soldo dos reis, outros na defesa dos elfos. E, neste caos, Geralt e Yennefer precisam de proteger Ciri, a criança da profecia que todos procuram. Pois quer viva quer morra, Ciri tem o poder de salvar o mundo... ou de o destruir.', '2025-11-06 19:42:34', 'Seminovo'),
(46, 18, '', 'A Torre da Andorinha', 42, 1, 24, 25, 1, 2020, 'O mundo está coberto pela neblina sufocante e cruel da guerra. Ciri, a criança da profecia, desapareceu. Procurada tanto por amigos como por adversários, assumiu a identidade de um bandido e vive em liberdade pela primeira vez na vida. Mas o cerco à sua volta está a apertar e os assassinos impiedosos de Nilfgaard seguem o seu rasto. Geralt, o bruxo, não desistiu da sua missão. Apesar das feridas, reuniu um grupo de aliados determinados a resgatar Ciri. Mas os crimes que cometeu tornaram-na famosa, e os mercenários que a procuram são implacáveis. Conseguirá Geralt salvar a jovem? E será a lendária Torre da Andorinha um porto seguro?', '2025-11-06 19:46:59', 'Novo'),
(47, 18, '', 'O Sangue dos Elfos', 43, 1, 24, 25, 1, 2020, 'Durante mais de um século, humanos, anões e elfos conviveram em harmonia. Mas os tempos mudaram: a frágil paz que reinava foi quebrada e agora as raças lutam de novo entre si, conduzindo a mortes e chacinas. Geralt de Rivia, temido pela sua reputação de bruxo e assassino sem misericórdia, tem estado a aguardar o nascimento de uma criança profetizada, cujos poderes poderão mudar o mundo, para o bem ou para o mal. Com a ameaça de uma guerra sem fim a pairar sobre todas as nações, é posta em marcha uma perseguição à criança e aos seus poderes extraordinários. Caberá a Geralt, apenas com a ajuda de velhos amigos, protegê-la, pois o peso do fracasso será demasiado para todos.', '2025-11-06 19:50:37', 'Novo'),
(48, 18, '', 'Cássio – a trajetória do maior goleiro da história do Corinthians', 44, 7, 25, 26, 1, 2019, 'Vindo do futebol holandês, Cássio chegou ao Corinthians no final de 2011 como uma opção para o banco de reservas. Mas isso só durou até abril do ano seguinte, quando ele assumiu de vez a titularidade do gol do Timão. De lá pra cá, seus mais de 400 jogos o consolidaram como o segundo goleiro que mais vestiu a camisa alvinegra e seus 9 títulos coroaram o jogador como ídolo indiscutível. São quatro Paulistas, dois Brasileiros, uma Recopa, uma Libertadores da América e um Mundial de Clubes da Fifa – no qual foi eleito o melhor jogador em campo na final e de todo o campeonato. Com esse currículo invejável, fica difícil negar que Cássio é o maior goleiro da história do Corinthians, e até mesmo Ronaldo Giovanelli, outro ídolo do gol do Timão, já concordou! Neste livro, você conhecerá toda a trajetória do gigante: como ele despontou no futebol, sua chegada ao Corinthians, os altos e baixos de sua carreira e, claro, tudo sobre os bastidores da defesa que mudou sua vida!', '2025-11-06 19:53:58', 'Novo'),
(49, 10, '', 'O ataque da vampantera - Os monstros do cartógrafo - vol. 2', 45, 2, 26, 13, 1, 2020, 'A segunda de uma série de aventuras pelos quatro cantos do mundo Piloto de uma companhia aérea, Rob Stevens concluiu seu primeiro livro, o premiado best seller Os monstros do cartógrafo: Cuidado com os bufalogros!, ao longo de várias viagens. Escrevendo novamente durante suas jornadas pelo mundo, o autor apresenta agora o segundo volume da série: O ataque da vampantera!. Uma história de aventura e fantasia que se passa em pleno século XV, a série Os monstros do cartógrafo, com ilustrações de Adam Stower, traz tramas emocionantes de superação e de demonstração do amadurecimento de um menino que agradarão leitores de todas as idades. Foi o que aconteceu na Inglaterra, quando se tornou leitura obrigatória entre alunos de colégios e de universidades. Hugo está viajando outra vez. Ele vai para as montanhas sombrias da Transilvânia, um lugar que, literalmente, não está no mapa. Lá, nada é o que parece. Para resgatar o amigo de seu tio e localizar o castelo oculto da terrível vampantera, Hugo contará com a ajuda de criaturas fantásticas e inacreditáveis: uma gata falante que prevê o futuro, um lobisomem bem agitado e um Abominável Orangofango. Além, é claro, de seu grande amigo Feroz, um rato falante e divertido.', '2025-11-06 20:24:47', 'Com Marcas de Uso'),
(50, 10, '', 'Assassinato no Expresso Oriente', 46, 1, 2, 27, 1, 2014, 'É perto da meia-noite quando a neve acumulada sobre os trilhos interrompe a jornada do Expresso Oriente, o mais famoso e luxuoso trem de passageiros do mundo, que liga a Ásia à Europa. A bordo, milionários, aristocratas, empregados – e um assassino. Porém, no mesmo vagão encontra-se ninguém menos que Hercule Poirot. Caberá ao meticuloso detetive investigar todos os passageiros e descobrir a identidade do ousado criminoso. Christie propõe um fascinante enredo nos moldes do clássico subgênero do \"locked room\" (\"mistério do quarto fechado\"), em que o crime ocorre num local isolado, e a suspeita recai sobre todos os presentes. Publicado em 1934, o romance foi levado com estrondoso sucesso ao cinema pelo diretor Sidney Lumet em 1974, com Albert Finney, Lauren Bacall, Sean Connery, Jacqueline Bisset e Ingrid Bergman no elenco – até hoje uma das mais aclamadas adaptações jamais feitas de um clássico da literatura de mistério.', '2025-11-06 20:26:50', 'Novo'),
(51, 10, '', 'O assassinato de Roger Ackroyd', 47, 1, 2, 2, 1, 2014, 'Em uma noite de setembro, o milionário Roger Ackroyd é encontrado morto, esfaqueado com uma adaga tunisiana – objeto raro de sua coleção particular – no quarto da mansão Fernly Park na pacata vila de King’s Abbott. A morte do fidalgo industrial é a terceira de uma misteriosa sequência de crimes, iniciada com a de Ashley Ferrars, que pode ter sido causada ou por uma ingestão acidental de soníferos ou envenenamento articulado por sua esposa – esta, aliás, completa a sequência de mortes, num provável suicídio. Os três crimes em série chamam a atenção da velha Caroline Sheppard, irmã do dr. Sheppard, médico da cidade e narrador da história. Suspeitando de que haja uma relação entre as mortes, dada a proximidade de miss Ferrars com o também viúvo Roger Ackroyd, Caroline pede a ajuda do então aposentado detetive belga Hercule Poirot, que passava suas merecidas férias na vila. Ameaças, chantagens, vícios, heranças, obsessões amorosas e uma carta reveladora deixada por miss Ferrars compõem o cenário desta surpreendente trama, cujo transcorrer elenca novos suspeitos a todo instante, exigindo a habitual perspicácia do detetive Poirot em seu retorno ao mundo das investigações. O assassinato de Roger Ackroyd é um dos mais famosos romances policiais da rainha do crime.', '2025-11-06 20:31:24', 'Novo');
INSERT INTO `tb_livro` (`id_livro`, `id_usuario`, `isbn`, `nome_livro`, `id_livro_imagem`, `id_genero`, `id_autor`, `id_editora`, `id_idioma`, `ano_pub_livro`, `sinopse_livro`, `data_add_livro`, `estado_conservacao_livro`) VALUES
(52, 19, '', 'As Crônicas de Nárnia - Coleção de Luxo: A Cadeira de Prata', 48, 2, 27, 28, 1, 2023, 'Grande sucesso de C. S. Lewis, esta é a edição de luxo definitiva de um dos maiores clássicos da literatura infantojuvenil. Reinos mágicos, criaturas inesquecíveis e batalhas épicas entre o bem o mal: essas histórias são narradas em As Crônicas de Nárnia ― uma série de sete livros que acompanha crianças curiosas e suas aventuras entre o nosso mundo e outros universos mágicos. Em A Cadeira de Prata, anos se passaram em Nárnia. O Rei Caspian X já está bem velho, e o Príncipe Rilian, seu único filho e herdeiro, está desaparecido. Para desvendar esse mistério, Aslan convoca Eustáquio, o primo dos irmãos Pevensie, e Giu, a amiga de escola que já o escutou falar muito a respeito desse mundo mágico. Guiados por Poçaflito, um narniano extremamente pessimista e preocupado, eles vão embarcar em uma jornada muito perigosa que os levará até o fundo do mundo. Há muito aguardada pelos fãs e com nova tradução de Ronald Kyrmse, esta edição possui capa dura com acabamento soft touch e pintura trilateral, além de ter ilustrações coloridas de Pauline Baynes, a artista favorita de C.S. Lewis e de seu melhor amigo, J.R.R. Tolkien, autor de O Hobbit e O Senhor dos Anéis.', '2025-11-06 20:35:46', 'Com Marcas de Uso'),
(53, 19, '', 'As Crônicas de Nárnia - Coleção de Luxo: A Viagem do Peregrino da Alvorada', 49, 1, 27, 28, 1, 2023, 'Com nova tradução de Ronald Kyrmse, esta edição de luxo possui capa dura, soft touch e pintura trilateral, além de ter ilustrações coloridas de Pauline Baynes, a artista favorita de C.S. Lewis e de seu melhor amigo, J.R.R. Tolkien, autor de \"O Hobbit\" e \"O Senhor dos Anéis\". Reinos mágicos, criaturas inesquecíveis e batalhas épicas entre o bem e o mal: essas histórias são narradas em As Crônicas de Nárnia — uma série de sete livros que acompanha crianças curiosas e suas aventuras entre o nosso mundo e outros universos mágicos e que, por décadas, encanta leitores de todas as idades. Em A Viagem do Peregrino da Alvorada, os corajosos Edmundo e Lúcia — e seu rabugento primo Eustáquio — juntam-se aoRei Caspian X, a fim de encontrar sete lordes que foram exilados após o malvado Miraz usurpar o trono de Nárnia. Conforme navegam por mares desconhecidos e se deparam com criaturas fantásticas e ilhas encantadas, as crianças descobrem que sua jornada é maior e mais perigosa do que imaginavam — e que o fim do mundo é apenas o começo. Este é o terceiro livro da série de C.S. Lewis, um dos maiores clássico da literatura infantojuvenil. Promovendo valores como a lealdade, honestidade, justiça e bondade, as histórias envolventes de As Crônicas de Nárnia marcaram gerações de leitores no mundo todo.', '2025-11-06 20:38:34', 'Danos Severos'),
(55, 19, '', 'A guerra dos tronos', 51, 1, 28, 20, 1, 2019, 'A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones . O verão pode durar décadas. O inverno, toda uma vida. E a guerra dos tronos começou. Como Guardião do Norte, lorde Eddard Stark não fica feliz quando o rei Robert o proclama a nova Mão do Rei. Sua honra o obriga a aceitar o cargo e deixar seu posto em Winterfell para rumar para a corte, onde os homens fazem o que lhes convém, não o que devem... e onde um inimigo morto é algo a ser admirado. Longe de casa e com a família dividida, Eddard se vê cada vez mais enredado nas intrigas mortais de Porto Real, sem saber que perigos ainda maiores espreitam a distância. Nas florestas ao norte de Winterfell, forças sobrenaturais se espalham por trás da Muralha que protege a região. E, nas Cidades Livres, o jovem Rei Dragão exilado na Rebelião de Robert planeja sua vingança e deseja recuperar sua herança de família: o Trono de Ferro de Westeros. \" A guerra dos tronos é a maior obra de fantasia desde que Bilbo encontrou o Anel.\" — SF Reviews', '2025-11-06 20:40:01', 'Novo'),
(56, 19, '', 'Dom Casmurro', 52, 3, 29, 29, 1, 2025, 'O romance Dom Casmurro é narrado em primeira pessoa por José Bento, o Bentinho (apelidado, na velhice, de Dom Casmurro, por viver recluso e solitário). Em retrospectiva, ele conta fatos de sua infância na casa da mãe viúva, D. Glória, ao lado do tio Cosme, da prima Justina, do agregado José Dias. Como vizinhos de fundo, Pádua e D. Fortunata, pais de Capitolina (apelidada Capitu), de condição social inferior. O objetivo do narrador-personagem é tentar reviver as emoções afetivas através da reconstituição do passado.', '2025-11-06 20:40:53', 'Novo'),
(57, 19, '', 'O cortiço', 53, 1, 30, 30, 1, 2022, 'Romance de caracteres múltiplos, mas de destino coletivo, esta obra aborda temáticas pouco comuns para sua época – sexualidade, adultério, racismo, prostituição –, para expor os males da promiscuidade da vida de trabalhadores pobres, amontoados em habitações coletivas e submetidos à exploração inescrupulosa. Alegorizando o Brasil do século XIX, Aluísio Azevedo exprime a visão pessimista de sua época, marcada pela concepção determinista do meio físico.', '2025-11-06 20:41:29', 'Novo'),
(58, 14, '', 'Memórias Póstumas de Brás Cubas', 54, 1, 31, 31, 1, 2019, 'Memórias Póstumas de Brás Cubas (1881), um dos principais romances da literatura brasileira, inaugura a fase madura de Machado de Assis e concretiza o ideal estético que consagrou o autor e marca sua obra. Revolucionário e provocativo, o romance rompe com tradições literárias e sintetiza a crítica machadiana à elite brasileira da época. Um dos personagens mais populares da nossa literatura, Brás Cubas é um defunto-autor que dedica sua obra ao verme que primeiro roeu as frias carnes de seu cadáver. O protagonista narra suas memórias, intercalando episódios, delírios, reflexões e teorias, não poupando ninguém do seu olhar crítico e expondo as atitudes mesquinhas que teve em vida. É definitivamente uma obra imperdível que, com linguagem fluente e coesa, conduz sedutoramente o leitor por uma narrativa que deixa nas entrelinhas muito material para reflexões mais profundas.', '2025-11-06 20:45:16', 'Novo'),
(59, 14, '', 'A hora da estrela', 55, 1, 32, 32, 1, 2020, 'Pouco antes de morrer, em 1977, Clarice Lispector decide se afastar da inflexão intimista que caracteriza sua escrita para desafiar a realidade. O resultado desse salto na extroversão é A hora da estrela, o livro mais surpreendente que escreveu. Se desde Perto do coração selvagem, seu romance de estreia, Clarice estava de corpo inteiro, todo o tempo, no centro de seus relatos, agora a cena é ocupada por personagens que em nada se parecem com ela. A nordestina Macabéa, a protagonista de A hora da estrela, é uma mulher miserável, que mal tem consciência de existir. Depois de perder seu único elo com o mundo, uma velha tia, ela viaja para o Rio, onde aluga um quarto, se emprega como datilógrafa e gasta suas horas ouvindo a Rádio Relógio. Apaixona-se, então, por Olímpico de Jesus, um metalúrgico nordestino, que logo a trai com uma colega de trabalho. Desesperada, Macabéa consulta uma cartomante, que lhe prevê um futuro luminoso, bem diferente do que a espera. Clarice cria até um falso autor para seu livro, o narrador Rodrigo S.M., mas nem assim consegue se esconder. O desejo de desaparecimento, que a morte real logo depois consolidaria, se frustra. Entre a realidade e o delírio, buscando social enquanto sua alma a engolfava, Clarice escreveu um livro singular. A hora da estrela é um romance sobre o desamparo a que, apesar do consolo da linguagem, todos estamos entregues. — JOSÉ CASTELLO, Jornalista, escritor e Mestre em Comunicação pela UFRJ \"Esfinge, feiticeira, monstro sagrado. O renascimento da fascinante Clarice Lispector tem sido um dos verdadeiros eventos literários do século 21. Ninguém soa como Clarice. Ninguém pensa como ela. Ela não apenas parece dotada de mais sentidos do que os cinco conhecidos, mas também curva a sintaxe e a pontuação de acordo com sua vontade. Ela vira o dicionário de cabeça para baixo, soltando todas as palavras de suas definições, espalhando-as de volta como quer e não é que a língua parece melhor?\" — THE NEW YORK TIMES', '2025-11-06 20:46:34', 'Novo'),
(60, 14, '', 'O mágico de Oz', 56, 1, 33, 33, 1, 2023, 'Ao imaginar um conto de fadas para o mundo moderno, O mágico de Oz revoluciona as histórias para crianças Um mundo de cores, magia e aventura espera pela garotinha Dorothy, que chega em Oz por acidente quando um grande furacão carrega sua casa até essa terra longínqua. Os habitantes deste lugar tão especial logo recebem a menina como uma heroína capaz de combater bruxas malvadas, mas tudo o que Dorothy mais deseja é voltar à sua terra para reencontrar os tios. Na esperança de conseguir retornar para casa, ela parte em uma aventura para pedir ajuda ao Grande Mágico de Oz, e, no caminho, novos amigos se juntam a Dorothy: o Espantalho, que tem esperança de que Oz lhe dê um cérebro, o Homem de Lata, que deseja um coração, e o Leão Covarde, que sonha em ser corajoso. Ilustrada e apresentada por Arnaldo Baptista, a nova edição da Antofágica traz tradução de Davi Boaventura e posfácios de Carol Chiovatto, pesquisadora com mestrado sobre a representação do feminino nas obras do mundo de Oz e da escritora, ilustradora e roteirista Janaina Tokitaka. O QR Code na cinta direciona a duas videoaulas sobre o livro disponíveis no YouTube com Cláudia Fusco, mestre em Ficção Científica pela Universidade de Liverpool.', '2025-11-06 20:48:35', 'Novo'),
(61, 10, '', 'Laços de família', 57, 1, 32, 32, 1, 2020, 'O texto de Clarice Lispector costuma apresentar ilusória facilidade. Seu vocabulário é simples, as imagens voltam-se para animais e plantas, quando não para objetos domésticos e situações da vida diária, com frequência numa voltagem de intenso lirismo. Mas que não se engane o leitor. Em poucas linhas, será posto em contato com um mundo em que o insólito acontece e invade o cotidiano mais costumeiro, minando e corroendo a repetição monótona do universo de homens e mulheres de classe média ou mesmo o de seres marginais. Desse modo, o leitor defronta-se com a experiência de Laura com as rosas e o impacto de Ana ao ver o cego no Jardim Botânico. Pequenos detalhes do cotidiano deflagram o entrechoque de mundos e fronteiras que se tornam fluidos e erradios, como o que é dado ao leitor a compreender acerca da relação de Ana, seu fogão e seus filhos, ou das peregrinações de uma galinha no domingo de uma família com fome, ou do assalto noturno de misteriosos mascarados num jardim de São Cristóvão. E, como se pouco a pouco se desnudasse uma estratégia, o cotidiano dos personagens de Laços de família, cuja primeira edição data de 1960, vai-se desnudando como um ambiente falsamente estável, em que vidas aparentemente sólidas se desestabilizam de súbito, justo quando o dia a dia parecia estar sendo marcado pela ameaça de nada acontecer. Nesta coletânea de contos, os personagens – sejam adultos ou adolescentes – debatem-se nas cadeias de violência latente que podem emanar do círculo doméstico. Homens ou mulheres, os laços que os unem são, em sua maioria, elos familiares ao mesmo tempo de afeto e de aprisionamento. — LUCIA HELENA, Pós-Doutorada em Literatura Comparada pela Brown University, EUA, e autora do livro Nem musa, nem medusa: Itinerários da escrita em Clarice Lispector', '2025-11-06 20:51:00', 'Seminovo'),
(62, 10, '', 'O idiota', 58, 1, 18, 15, 1, 2022, 'Uma das obras mais cultuadas de Fiódor Dostoiévski por veicular ideias pessoais e detalhes autobiográficos — e, também, uma das preferidas do autor —, O idiota mostra o conflito entre um jovem quixotesco, repleto de boas intenções e sinceridade, e a sociedade russa moderna, desencantada e movida à ganância. Escrito originalmente em formato de folhetim, O idiota narra as desventuras do jovem epilético príncipe Míchkin. Dotado de uma pureza ímpar e expressando-se com sinceridade, este personagem choca-se com uma Rússia secular e desencantada, distante dos ideais cristãos de generosidade e movida por uma busca incessante por dinheiro e status. Ao retornar a São Petersburgo após um tratamento médico, Míchkin envolve-se em triângulos amorosos da alta sociedade, centrados na disputa pela atenção de Nastássia Filíppovna, uma beldade multifacetada, muitas vezes interpretada como louca pelos homens que a cortejam. Apesar das boas intenções, a presença do príncipe provoca uma série de conflitos que dinamitam aquele círculo social dependente de aparências. Em parte romance de ideias, em parte romance de costumes, que trata do nacionalismo russo e de um contexto sócio-histórico específico, a prosa de Dostoiévski reluz, em especial, ao contrapor o idealismo de Míchkin com o niilismo individualista de Ippolit, um rapaz tuberculoso despreocupado com a ética de suas ações. Este livro oferece a análise severa e complexa que o mestre russo faz de uma sociedade moderna que perdeu seu norte moral — crítica que se mostra relevante até hoje, no capitalismo tardio. Afinal, que espaço há para as boas ações, a compaixão e a caridade em um mundo onde o dinheiro é a força motriz? As agruras do protagonista representam com agudeza a visão desoladora que Dostoiévski tinha de seu entorno, o que levou o escritor a defender as ideias contidas no romance até o fim de sua vida. \"Nada fica fora do terreno de Dostoiévski (...) Tirando Shakespeare, não existe leitura mais interessante.\" — Virginia Woolf', '2025-11-13 01:26:55', 'Seminovo'),
(63, 20, '', 'Território Lovecraft', 60, 1, 5, 5, 1, 2020, 'Uma jornada fantástica e assustadora, adaptada para virar série na HBO com produção do diretor de Corra!, Jordan Peele, e J.J. Abrams Nos Estados Unidos segregados da década de 1950, Atticus é um rapaz negro, veterano da Guerra da Coreia, fã de H. P. Lovecraft e outros escritores de pulp fiction. Ao descobrir que o pai desapareceu, ele volta à cidade natal para, com o tio e a amiga, partir em uma missão de resgate. Na viagem até a mansão do herdeiro da propriedade que mantinha um dos ancestrais de Atticus escravizado, o grupo enfrentará sociedades secretas, rituais sanguinolentos e o preconceito de todos os dias. Ao chegar, Atticus encontra seu pai acorrentado, mantido prisioneiro por uma confraria secreta, que orquestra um ritual cujo personagem principal é o próprio Atticus. A única esperança de salvação do jovem, no entanto, pode ser a semente de sua destruição — e de toda a sua família. E esta é apenas a primeira parada de uma jornada impressionante. Estruturado ao mesmo tempo como uma coletânea de contos e um romance, Território Lovecraft apresenta, além de personagens memoráveis, elementos sobrenaturais, como casas assombradas e portais para outras realidades, objetos enfeitiçados e livros mágicos. Um retrato caleidoscópico do racismo — o fantasma que até hoje assombra o mundo —, a obra de Matt Ruff une ficção histórica e pulp noir ao horror e à fantasia de Lovecraft para explorar os terrores da época de segregação racial nos Estados Unidos.', '2025-11-13 14:19:32', 'Novo'),
(64, 20, '', 'O Espreitador e Outras Histórias', 66, 6, 34, 22, 1, 2024, 'Daniel Hartmann foi um dos principais escritores do sobrenatural no Brasil e no resto do mundo. Com mais de dez livros publicados, incluindo os premiados O Espreitador e A Mulher Afogada, e milhões de exemplares vendidos, Hartmann redefiniu a forma como a literatura de terror é vista pelo público e pela crítica. Hartmann também foi um renomado pesquisador do oculto. Reconhecido mundialmente por suas análises de fenômenos inexplicáveis com fundo religioso, ministrou diversas palestras internacionais sobre o tema, nas quais também debateu grandes questões filosóficas, incluindo a que mais assombra a humanidade: para onde vamos após a morte? Apesar do próprio Hartmann ter expressado o desejo de que suas histórias deixassem de ser vendidas, acreditamos que todos merecem conhecer a sua obra, e temos o prazer em apresentar esta publicação. Leia sem medo. Afinal, por mais assustadores que seja, não pe como se essas histórias pudessem machucá-lo de verdade. *Daniel Hartmann é um personagem fictício do universo Ordem Paranormal.\r\n\r\nCellbit é criador de conteúdo desde 2012. Presente nas plataformas YouTube e Twitch, conquistou mais de seis milhões de inscritos e o prêmio de Melhor Conteúdo de Games do Brasil no iBest! 2023. É criador do universo de Ordem Paranormal, atuando como roteirista e mestre no RPG de mesa, e diretor criativo do jogo Enigma do Medo, ambientado no mesmo universo.\r\n\r\nFelipe Castilho escreve livros, séries, HQs e games. Entre suas várias publicações, destacam-se a duologia Ordem Vermelha, e os finalistas do Prêmio Jabuti: Serpentário e Savana de Pedra. Além disso, participou da antologia especial Coringa: O Mundo, da DC Comics, escrevendo histórias do maior vilão do Batman em terras brasileiras.\r\n\r\nKaren Soarele é a romancista dos principais universos de fantasia do Brasil: Tormenta, Ordem Paranormal e o Nerdcast RPG. Possui nove livros publicados, com destaque para A Deusa no Labirinto (agora em sua 2ª edição), As Máscaras do Metamorfo e O Enigma do Sol Oculto. Foi finalista dos prêmios AGES, Le Blanc, Minuano e Jabuti e, por sua contribuição cultural ao país, recebeu o Troféu Cecília Meireles.\r\n\r\nLeonel Caldela é um dos criadores de Tormenta, o maior universo de fantasia do Brasil. Para esse cenário escreveu: A Trilogia da Tormenta (composta por O Inimigo do Mundo, O Crânio e o Corvo e O Terceiro Deus) e A Flecha de Fogo. Também é autor dos livros O Caçador de Apóstolos e Deus Máquina. Em parceria com o Jovem Nerd, escreveu a série A Lenda de Ruff Ghanor e Ozob ― Protocolo Molotov. Fanático por RPG há décadas, é mestre dos podcasts NerdcastRPG, que deram origem a seus romances A Roda de Deus e O Criador da Morte, e da campanha online Fim dos Tempos.', '2025-11-13 16:38:03', 'Novo'),
(65, 20, '', 'Sherlock Holmes - O cão dos Baskerville', 72, 1, 1, 4, 1, 2021, 'Uma terrível maldição pesa sobre os Baskerville na velha mansão de seus ancestrais, no meio de um pântano selvagem no interior da Inglaterra: quando um cão enorme e demoníaco, uma fera gigantesca e faiscante aparece, é morte certa para um membro da família. As circunstâncias dramáticas da morte repentina de Sir Charles Baskerville e os uivos aterrorizantes que vêm do pântano parecem confirmar essa maldição. Seria essa morte causada por um ser sobrenatural? Ou seria ela um macabro homicídio?\r\n\r\nHenry Baskerville, o herdeiro de Sir Charles, volta do Canadá para tomar posse de seu título e de seus domínios. Ainda em Londres, recebe um bilhete anônimo: “Se você dá valor à sua vida ou à sua sanidade mental, deve se manter longe do pântano.” Apesar da ameaça e sem noção do terror que os espera, Sir Henry decide ir para a Mansão Baskerville, acompanhado por Watson, amigo e assistente de Sherlock Holmes encarregado pelo detetive de proteger o rapaz. Enquanto isso, Sherlock se empenha em resolver o enigma sem o conhecimento dos outros…', '2025-11-13 17:24:33', 'Novo'),
(68, 21, '', 'Sherlock Holmes - O cão dos Baskerville', 90, 1, 1, 3, 1, 2019, 'Holmes investiga a morte do milionário Sir Charles Baskerville que foi encontrado em um pântano próximo a sua casa. Uma lenda local dizia que ele foi assassinado por um cão que assombrava a região. Será isso mesmo?', '2025-11-13 18:06:35', 'Danos Leves');

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
(24, 26, 'capa', 'uploads/livros/26/capa_1761601193_68ffe6a9d1b7d.jpg', 0, '2025-10-27 21:39:55'),
(26, 28, 'capa', 'uploads/livros/28/capa_1762186894_6908d68ebea7e.jpg', 0, '2025-11-03 16:21:36'),
(27, 31, 'capa', 'uploads/livros/31/capa_1762454249_690ceae9c50ad.jpg', 0, '2025-11-06 18:37:31'),
(28, 32, 'capa', 'uploads/livros/32/capa_1762454303_690ceb1f5a641.jpg', 0, '2025-11-06 18:38:24'),
(29, 33, 'capa', 'uploads/livros/33/capa_1762454369_690ceb617b631.jpg', 0, '2025-11-06 18:39:31'),
(30, 34, 'capa', 'uploads/livros/34/capa_1762454601_690cec4994fc4.jpg', 0, '2025-11-06 18:43:23'),
(31, 35, 'capa', 'uploads/livros/35/capa_1762454870_690ced56d0081.jpg', 0, '2025-11-06 18:47:54'),
(32, 36, 'capa', 'uploads/livros/36/capa_1762455306_690cef0a5c32d.jpg', 0, '2025-11-06 18:55:08'),
(33, 37, 'capa', 'uploads/livros/37/capa_1762455513_690cefd9a05b8.jpg', 0, '2025-11-06 18:58:36'),
(34, 38, 'capa', 'uploads/livros/38/capa_1762455956_690cf194827ed.jpg', 0, '2025-11-06 19:05:56'),
(35, 39, 'capa', 'uploads/livros/39/capa_1762456234_690cf2aa5b8be.jpg', 0, '2025-11-06 19:10:37'),
(36, 40, 'capa', 'uploads/livros/40/capa_1762456462_690cf38e32f0b.jpg', 0, '2025-11-06 19:14:26'),
(37, 41, 'capa', 'uploads/livros/41/capa_1762456715_690cf48b2a323.jpg', 0, '2025-11-06 19:18:37'),
(38, 42, 'capa', 'uploads/livros/42/capa_1762458021_690cf9a5c1f3f.jpg', 0, '2025-11-06 19:40:25'),
(40, 44, 'capa', 'uploads/livros/44/capa_1762458118_690cfa0617420.jpg', 0, '2025-11-06 19:42:01'),
(41, 45, 'capa', 'uploads/livros/45/capa_1762458154_690cfa2add125.jpg', 0, '2025-11-06 19:42:38'),
(42, 46, 'capa', 'uploads/livros/46/capa_1762458419_690cfb335667a.jpg', 0, '2025-11-06 19:47:02'),
(43, 47, 'capa', 'uploads/livros/47/capa_1762458637_690cfc0dee904.jpg', 0, '2025-11-06 19:50:40'),
(44, 48, 'capa', 'uploads/livros/48/capa_1762458838_690cfcd6e2a32.jpg', 0, '2025-11-06 19:54:01'),
(45, 49, 'capa', 'uploads/livros/49/capa_1762460687_690d040f1c3ac.jpg', 0, '2025-11-06 20:24:50'),
(46, 50, 'capa', 'uploads/livros/50/capa_1762460810_690d048a94d5f.jpg', 0, '2025-11-06 20:26:53'),
(47, 51, 'capa', 'uploads/livros/51/capa_1762461084_690d059c9a775.jpg', 0, '2025-11-06 20:31:24'),
(48, 52, 'capa', 'uploads/livros/52/capa_1762461346_690d06a275756.jpg', 0, '2025-11-06 20:35:51'),
(49, 53, 'capa', 'uploads/livros/53/capa_1762461514_690d074ac36ca.jpg', 0, '2025-11-06 20:38:39'),
(51, 55, 'capa', 'uploads/livros/55/capa_1762461601_690d07a1a1880.jpg', 0, '2025-11-06 20:40:03'),
(52, 56, 'capa', 'uploads/livros/56/capa_1762461653_690d07d5d3ffd.jpg', 0, '2025-11-06 20:40:56'),
(53, 57, 'capa', 'uploads/livros/57/capa_1762461689_690d07f9c2c6f.jpg', 0, '2025-11-06 20:41:32'),
(54, 58, 'capa', 'uploads/livros/58/capa_1762461916_690d08dc51edd.jpg', 0, '2025-11-06 20:45:18'),
(55, 59, 'capa', 'uploads/livros/59/capa_1762461994_690d092ad37b1.jpg', 0, '2025-11-06 20:46:37'),
(56, 60, 'capa', 'uploads/livros/60/capa_1762462115_690d09a35fa8c.jpg', 0, '2025-11-06 20:48:37'),
(57, 61, 'capa', 'uploads/livros/61/capa_1762462260_690d0a34259a4.jpg', 0, '2025-11-06 20:51:03'),
(58, 62, 'capa', 'uploads/livros/62/capa_1762997215_691533df7aead.jpg', 0, '2025-11-13 01:26:56'),
(59, 62, 'foto', 'uploads/livros/62/foto_1762997216_691533e0c2acc.png', 1, '2025-11-13 01:26:56'),
(60, 63, 'capa', 'uploads/livros/63/capa_1763043572_6915e8f45a807.jpg', 0, '2025-11-13 14:19:32'),
(61, 63, 'foto', 'uploads/livros/63/foto_1763043572_6915e8f45ada6.jpg', 1, '2025-11-13 14:19:32'),
(62, 63, 'foto', 'uploads/livros/63/foto_1763043572_6915e8f45b078.jpg', 2, '2025-11-13 14:19:32'),
(63, 63, 'foto', 'uploads/livros/63/foto_1763043572_6915e8f45b476.jpg', 3, '2025-11-13 14:19:32'),
(64, 63, 'foto', 'uploads/livros/63/foto_1763043572_6915e8f45b709.jpg', 4, '2025-11-13 14:19:32'),
(65, 63, 'foto', 'uploads/livros/63/foto_1763043572_6915e8f45b9ac.jpg', 5, '2025-11-13 14:19:32'),
(66, 64, 'capa', 'uploads/livros/64/capa_1763051883_6916096bbc3b6.jpg', 0, '2025-11-13 16:38:03'),
(67, 64, 'foto', 'uploads/livros/64/foto_1763051883_6916096bbc9f4.jpg', 1, '2025-11-13 16:38:03'),
(68, 64, 'foto', 'uploads/livros/64/foto_1763051883_6916096bbcc9f.jpg', 2, '2025-11-13 16:38:03'),
(69, 64, 'foto', 'uploads/livros/64/foto_1763051883_6916096bbcfff.jpg', 3, '2025-11-13 16:38:03'),
(70, 64, 'foto', 'uploads/livros/64/foto_1763051883_6916096bbd2b1.jpg', 4, '2025-11-13 16:38:03'),
(71, 64, 'foto', 'uploads/livros/64/foto_1763051883_6916096bbd54f.jpg', 5, '2025-11-13 16:38:03'),
(72, 65, 'capa', 'uploads/livros/65/capa_1763054673_6916145188500.jpg', 0, '2025-11-13 17:24:33'),
(73, 65, 'foto', 'uploads/livros/65/foto_1763054673_691614518947d.jpg', 1, '2025-11-13 17:24:33'),
(74, 65, 'foto', 'uploads/livros/65/foto_1763054673_691614518976d.jpg', 2, '2025-11-13 17:24:33'),
(75, 65, 'foto', 'uploads/livros/65/foto_1763054673_6916145189e43.jpg', 3, '2025-11-13 17:24:33'),
(76, 65, 'foto', 'uploads/livros/65/foto_1763054673_691614518a0b9.jpg', 4, '2025-11-13 17:24:33'),
(77, 65, 'foto', 'uploads/livros/65/foto_1763054673_691614518a325.jpg', 5, '2025-11-13 17:24:33'),
(90, 68, 'capa', 'uploads/livros/68/capa_1763057195_69161e2b2176d.jpg', 0, '2025-11-13 18:06:35'),
(91, 68, 'foto', 'uploads/livros/68/foto_1763057195_69161e2b21ff6.jpg', 1, '2025-11-13 18:06:35'),
(92, 68, 'foto', 'uploads/livros/68/foto_1763057195_69161e2b22306.jpg', 2, '2025-11-13 18:06:35'),
(93, 68, 'foto', 'uploads/livros/68/foto_1763057195_69161e2b225e3.jpg', 3, '2025-11-13 18:06:35'),
(94, 68, 'foto', 'uploads/livros/68/foto_1763057195_69161e2b22c45.jpg', 4, '2025-11-13 18:06:35'),
(95, 68, 'foto', 'uploads/livros/68/foto_1763057195_69161e2b22eb5.jpg', 5, '2025-11-13 18:06:35');

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
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_email` tinyint(1) DEFAULT 0,
  `view_contato` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`id_usuario`, `nome_usuario`, `email_usuario`, `senha_usuario`, `status_usuario`, `foto_usuario`, `criado_em`, `view_email`, `view_contato`) VALUES
(3, 'jordan', 'jo@gmail.com', '$2y$10$u/NaTL/xQLEik83S4cpEG.AR289Aef2Vx3.Ls2l5k04.I1hWs7Q5W', 0, '', '2025-10-13 13:46:49', 0, 0),
(9, 'pedro', 'per@gmail.com', '$2y$10$Nwf2YiyXH4QJTXovunn7C.mSRFmcjqWkVf7KiZze4fYArPFfd6sVO', 0, 'uploads/usuarios/9/1496c4afdb5d923168794a7c201ec20b.jpg', '2025-10-13 18:24:24', 0, 0),
(10, 'Cleiton', 'cleiton@gmail.com', '$2y$10$eCQ8WSzie399Cyc/ChRk3eqXQzXQfx2DaCIpvJy/Uf9KtPePpD2UK', 0, 'uploads/usuarios/10/c219237665969ca9519dada4c907708c.jpg', '2025-10-15 21:14:16', 0, 0),
(11, 'Jorgina', 'jor@gmail.com', '$2y$10$fBdhGv7wbd04LxEeKByuyOQOtITXWs6Q.lFAJu7pc.FQiBQDmsq4a', 0, 'uploads/usuarios/11/9a291a52d3427d4064b2456b3545eb0c.jpg', '2025-10-26 23:02:08', 0, 0),
(12, 'Negot', 'negot@gmail.com', '$2y$10$jrGSmDTMvtWiBztdyqoOMeaRgxD7kPNbIAv7c/OBCV7hv/lnol806', 0, 'uploads/usuarios/12/db57067df81d50fbe1646a4f22796f7c.jpg', '2025-10-26 23:23:06', 0, 0),
(13, 'wenzio', 'wentape@gmail.com', '$2y$10$clgXlKvznwZI3B5aP8SiYuExltFrPzGixLhu/j8.reDv9paMU5u8W', 0, 'uploads/usuarios/13/87d025611609e80c35412e6d79e78bce.jpg', '2025-10-27 21:18:11', 0, 0),
(14, 'Rhyan', 'r@gmail.com', '$2y$10$YZ2k8BS7ZgNJOBRiK73hOuknZxx5pcxdU/lUl.SS5a0i9iPZ3V1Ma', 0, 'uploads/usuarios/14/df56f09a787d2b0a89659b62165a64f8.jpg', '2025-10-27 21:35:03', 0, 0),
(15, 'Clebinho', 'cleber4557@gmail.com', '$2y$10$cSbGV7oH7z9wi8nBZWMXr.Kky.IzPK6jflYVcAJSnNp5rce0X0p.i', 0, 'uploads/usuarios/15/4ca3e89b4cd6753ab26ce7c01aabe598.jpg', '2025-11-03 16:19:43', 1, 1),
(16, 'Pedro Henrique', 'pedro@gmail.com', '$2y$10$0pgp2klWBKqTouEupBCuLOgA/Q8xHz5oYD6Fp4lipw.NcsfEiHBFe', 0, 'uploads/usuarios/16/a34b40b198268ff056ebdb1c4e517c83.jpg', '2025-11-06 18:27:26', 0, 0),
(17, 'Milena Ormund', 'milena@gmail.com', '$2y$10$PTHxZxO/82pxkUKcUV1hhufizhbCnY7kHrMFYfBv2kJpFR1cb9zYG', 0, 'uploads/usuarios/17/1bfc8864cccfc2dcf032a24347f456d0.jpg', '2025-11-06 18:52:46', 0, 0),
(18, 'Marcos Vinícius', 'marcos@gmail.com', '$2y$10$Cuk1Vpx05qh4ilMJa.JWBu7shtyHWumRYls.b3wOdM5.v05fo.AmO', 0, 'uploads/usuarios/18/2f87a68c045d92cf7b239439098acd83.jpg', '2025-11-06 19:16:10', 0, 0),
(19, 'Robinson', 'ro@gmail.com', '$2y$10$j93LpsPtQeJShDrwpEVqGOb0Bas0nyt6P.ndbb7x.OtzfbooE3HJa', 0, 'uploads/usuarios/19/e78da5878d4290dbd7389ebe48f670b8.jpg', '2025-11-06 20:32:24', 0, 0),
(20, 'Padro', 'pa@gmail.com', '$2y$10$OE1ZOC4J8dTLwV3/LLw30ekPnP/L.u2MbzmJpAd9pCceTOcV3oVHi', 0, 'uploads/usuarios/20/5e81712c6521542132220ccc667ba3f5.jpg', '2025-11-13 14:05:01', 0, 0),
(21, 'teste', 'c@gmail.com', '$2y$10$qthjjxYL9hCrPvYv7WGUOesELpszymlEfdin.OxEmX69OYjDACsCy', 0, '', '2025-11-13 17:54:31', 0, 0);

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
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tb_editora`
--
ALTER TABLE `tb_editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_idioma`
--
ALTER TABLE `tb_idioma`
  MODIFY `id_idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de tabela `tb_livro_imagem`
--
ALTER TABLE `tb_livro_imagem`
  MODIFY `id_livro_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de tabela `tb_troca`
--
ALTER TABLE `tb_troca`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
