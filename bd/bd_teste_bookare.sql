-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25/08/2025 às 22:12
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
-- Banco de dados: `testegenero`
--
CREATE DATABASE IF NOT EXISTS `testegenero` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `testegenero`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `genero`
--

INSERT INTO `genero` (`id`, `nome`) VALUES
(1, 'Terror'),
(2, 'Culinária'),
(4, 'Romance'),
(6, 'Aventura'),
(7, 'Suspense\r\n');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_livro`
--

CREATE TABLE `tb_livro` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `ano` varchar(100) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `foto` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `tb_livro`
--

INSERT INTO `tb_livro` (`id_livro`, `titulo`, `autor`, `ano`, `id_genero`, `foto`) VALUES
(1, 'Frankenstein', 'Mary Shelley', '1818', 1, 'frankenstein.jpg'),
(2, 'Drácula', 'Bram Stoker', '1897', 1, 'dracula.jpg'),
(3, 'Cemitério Maldito', 'Stephen King', '1983', 1, 'cemiterio_maldito.jpg'),
(4, 'It: A Coisa', 'Stephen King', '1986', 1, 'it_a_coisa.jpg'),
(5, 'O Vilarejo', 'Rafael Montes', '2015', 1, 'o_vilarejo.jpg'),
(6, 'Horror em Amityville', 'Jay Anson', '1977', 1, 'amityville.jpg'),
(7, 'Nas Montanhas da Loucura', 'H. P. Lovecraft', '1936', 1, 'nas_montanhas_da_loucura.jpg'),
(8, 'O Chamado de Cthulhu', 'H. P. Lovecraft', '1928', 1, 'o_chamado_de_cthulhu.jpg'),
(9, 'As Bruxas', 'Roald Dahl', '1983', 1, 'as_bruxas.jpg'),
(10, 'Coraline', 'Neil Gaiman', '2002', 1, 'coraline.jpg'),
(11, 'A Arte da Cozinha Francesa', 'Julia Child', '1961', 2, 'arte_cozinha_francesa.jpg'),
(12, 'Panelinha: Receitas que Funcionam', 'Rita Lobo', '2014', 2, 'panelinha.jpg'),
(13, 'Comida de Verdade', 'Yotam Ottolenghi', '2011', 2, 'comida_de_verdade.jpg'),
(14, 'A Ilha do Tesouro', 'Robert Louis Stevenson', '1883', 6, 'A_Ilha_do_Tesouro.jpg'),
(15, 'As Aventuras de Tom Sawyer', 'Mark Twain', '1876', 6, 'As_Aventuras_de_Tom_Sawyer.jpg'),
(16, 'Vinte Mil Léguas Submarinas', 'Júlio Verne', '1870', 6, 'Vinte_Mil_Leguas_Submarinas.jpg'),
(17, 'O Hobbit', 'J.R.R. Tolkien', '1937', 6, 'O_Hobbit.jpg'),
(18, 'A Volta ao Mundo em Oitenta Dias', 'Júlio Verne', '1873', 6, 'A_Volta_ao_Mundo_em_Oitenta_Dias.jpg'),
(19, 'Robinson Crusoé', 'Daniel Defoe', '1719', 6, 'Robinson_Crusoe.jpg'),
(20, 'O Mágico de Oz', 'L. Frank Baum', '1900', 6, 'O_Magico_de_Oz.jpg'),
(21, 'As Crônicas de Nárnia', 'C.S. Lewis', '1950', 6, 'As_Cronicas_de_Narnia.jpg'),
(22, 'A Odisseia', 'Homero', '-800', 6, 'A_Odisseia.jpg'),
(23, 'O Leão, a Feiticeira e o Guarda-Roupa', 'C.S. Lewis', '1950', 6, 'O_Leao_a_Feiticeira_e_o_Guarda-Roupa.jpg');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livros_generos` (`id_genero`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `tb_livro`
--
ALTER TABLE `tb_livro`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_livro`
--
ALTER TABLE `tb_livro`
  ADD CONSTRAINT `fk_livros_generos` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
