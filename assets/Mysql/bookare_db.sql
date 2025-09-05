-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/08/2025 às 23:54
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
(5, '23345', '23224@ggg.com', '$2y$10$axueZ5/DDxV8WJ20TGYdYeTi7jrn.AGAFXB.4agCjhpo6UtTcp.fu', '2025-08-28 21:41:46');

--
-- Índices para tabelas despejadas
--

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
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
