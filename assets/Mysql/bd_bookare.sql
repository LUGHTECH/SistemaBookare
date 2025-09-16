-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16/09/2025 às 20:15
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
  `autor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livro`
--

CREATE TABLE `tb_livro` (
  `id_livro` int(11) NOT NULL,
  `nome_livro` varchar(50) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_editora` int(11) NOT NULL,
  `usbn` varchar(30) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `foto_livro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `senha_usuario` varchar(20) NOT NULL,
  `status_usuario` tinyint(1) NOT NULL,
  `foto` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Índices de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livro_usuario` (`id_usuario`),
  ADD KEY `fk_livro_editora` (`id_editora`),
  ADD KEY `fk_livro_autor` (`id_autor`);

--
-- Índices de tabela `tb_livrogenero`
--
ALTER TABLE `tb_livrogenero`
  ADD KEY `id_livro` (`id_livro`,`id_genero`),
  ADD KEY `fk_livrogenero_genero` (`id_genero`);

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
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_editora` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_troca`
--
ALTER TABLE `tb_troca`
  MODIFY `id_troca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `fk_livro_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tb_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_livrogenero`
--
ALTER TABLE `tb_livrogenero`
  ADD CONSTRAINT `fk_livrogenero_genero` FOREIGN KEY (`id_genero`) REFERENCES `tb_genero` (`id_genero`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livrogenero_livro` FOREIGN KEY (`id_livro`) REFERENCES `tb_livro` (`id_livro`) ON DELETE CASCADE ON UPDATE CASCADE;

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
