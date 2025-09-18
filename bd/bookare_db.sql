-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2025 às 21:25
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
-- Banco de dados: `bookare_db`
--
CREATE DATABASE IF NOT EXISTS `bookare_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `bookare_db`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id_livro` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `ano_publicacao` year(4) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `foto` varchar(150) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `livros`
--

INSERT INTO `livros` (`id_livro`, `titulo`, `autor`, `ano_publicacao`, `genero`, `foto`, `id_usuario`, `criado_em`) VALUES
(1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', '1954', 'Fantasia', 'senhor_dos_aneis.jpg', 6, '2025-09-18 16:05:44'),
(2, '1984', 'George Orwell', '1949', 'Distopia', '1984.jpg', 6, '2025-09-18 16:05:44'),
(3, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', '1997', 'Fantasia', 'harry_potter1.jpg', 6, '2025-09-18 16:05:44'),
(4, 'Dom Casmurro', 'Machado de Assis', '0000', 'Romance', 'dom_casmurro.jpg', 6, '2025-09-18 16:05:44'),
(5, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '1943', 'Infantil', 'pequeno_principe.jpg', 6, '2025-09-18 16:05:44'),
(6, 'A Revolução dos Bichos', 'George Orwell', '1945', 'Fábula', 'revolucao_dos_bichos.jpg', 6, '2025-09-18 16:05:44'),
(7, 'Cem Anos de Solidão', 'Gabriel García Márquez', '1967', 'Realismo Mágico', 'cem_anos_solidão.jpg', 6, '2025-09-18 16:05:44'),
(8, 'O Alquimista', 'Paulo Coelho', '1988', 'Aventura', 'o_alquimista.jpg', 6, '2025-09-18 16:05:44'),
(9, 'A Menina que Roubava Livros', 'Markus Zusak', '2005', 'Ficção', 'menina_que_roubava.jpg', 6, '2025-09-18 16:05:44'),
(10, 'Moby Dick', 'Herman Melville', '0000', 'Aventura', 'moby_dick.jpg', 6, '2025-09-18 16:05:44');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'Trancador de cursos123', 'tccvaipegarfogo@etec.com', '$2y$10$HzFXcgXuPFqtVtlc.2KbCeiDPZyDTyASDxJn8LZYsp4BJvF8js8o2', '2025-08-28 21:15:40'),
(2, 'Rodolfo', 'rodolfo2015oliveira@gmail.com', '$2y$10$nbtSOdww703WACzEslWk2.D/UgkyBVmLeSiuf8K7Q6qmESHRLJNam', '2025-08-28 21:22:46'),
(3, 'Orkut', 'Orkut@gmail.com', '$2y$10$8TplI8xm2mux9OLHer8VgeBmUqXlXjeQ7oAfgcIZ2CPky47mJ/gAC', '2025-08-28 21:36:07'),
(4, 'maria', 'maria123@gmail.com', '$2y$10$iUbeIIQufcb9czrEh9cDUeChU.WvvCvw5G4sS9K40Zxm91KFxjtU6', '2025-08-28 21:37:33'),
(5, '23345', '23224@ggg.com', '$2y$10$axueZ5/DDxV8WJ20TGYdYeTi7jrn.AGAFXB.4agCjhpo6UtTcp.fu', '2025-08-28 21:41:46'),
(6, 'cleber', 'cleber@gmail.com', '$2y$10$yqrrbhdBZ/hMSgU68oim7.hhNyA7sSoHtnGE19Dw75zj6WboPYQt2', '2025-09-18 14:35:04');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id_livro`),
  ADD KEY `fk_livros_usuarios` (`id_usuario`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id_livro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `fk_livros_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
