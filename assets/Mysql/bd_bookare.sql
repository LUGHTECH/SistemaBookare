-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/10/2025 às 03:36
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
(2, 'Agatha Christie');

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
(2, 'Globo Livros');

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
  `id_estado` int(11) NOT NULL,
  `cep` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_estado`
--

CREATE TABLE `tb_estado` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(1, 'Fiction');

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
(1, 'pt', '');

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
(2, 1, '', 'E não sobrou nenhum', 1, 1, 2, 2, 1, 2014, 'Uma ilha misteriosa, um poema infantil, dez soldadinhos de porcelana e muito suspense são os ingredientes com que Agatha Christie constrói seu romance mais importante. Na ilha do Soldado, antiga propriedade de um milionário norte-americano, dez pessoas sem nenhuma ligação aparente são confrontadas por uma voz misteriosa com fatos marcantes de seus passados. Convidados pelo misterioso mr. Owen, nenhum dos presentes tem muita certeza de por que estão ali, a despeito de conjecturas pouco convincentes que os leva a crer que passariam um agradável período de descanso em mordomia. Entretanto, já na primeira noite, o mistério e o suspense se abatem sobre eles e, num instante, todos são suspeitos, todos são vítimas e todos são culpados. É neste clima de tensão e desconforto que as mortes inexplicáveis começam e, sem comunicação com o continente devido a uma forte tempestade, a estadia transforma-se em um pesadelo. Todos se perguntam: quem é o misterioso anfitrião, mr. Owen? Existe mais alguém na ilha? O assassino pode ser um dos convidados? Que mente ardilosa teria preparado um crime tão complexo? E, sobretudo, por quê? São essas e outras perguntas que o leitor será desafiado a resolver neste fabuloso romance de Agatha Christie, que envolve os espíritos mais perspicazes num complexo emaranhado de situações, lembranças e acusações na busca deste sagaz assassino. Medo, confinamento e angústia: que o leitor descubra por si mesmo porque E não sobrou nenhum foi eleito o melhor romance policial de todos os tempos.', '2025-10-10 23:09:00', 'Novo');

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
(1, 2, 'capa', 'uploads/livros/2/capa_1760137740_68e9920cda072.jpg', 0, '2025-10-10 23:09:00');

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
(1, 'Cleberson', 'cleber4557@gmail.com', '$2y$10$YXMBc1extbO2Flh3iZ5MxOpP/o2Kk8UZ9oUWeSTgoOn2IXN.R5/Om', 0, 'uploads/usuarios/1/d16c3a6197db66722a8ef27a768cec26.jpg', '2025-10-06 21:57:30');

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
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_avaliacao`
--
ALTER TABLE `tb_avaliacao`
  MODIFY `id_avaliacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_contato`
--
ALTER TABLE `tb_contato`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_editora`
--
ALTER TABLE `tb_editora`
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_endereco`
--
ALTER TABLE `tb_endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_estado`
--
ALTER TABLE `tb_estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_genero`
--
ALTER TABLE `tb_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_idioma`
--
ALTER TABLE `tb_idioma`
  MODIFY `id_idioma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tb_livro_imagem`
--
ALTER TABLE `tb_livro_imagem`
  MODIFY `id_livro_imagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_troca`
--
ALTER TABLE `tb_troca`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
