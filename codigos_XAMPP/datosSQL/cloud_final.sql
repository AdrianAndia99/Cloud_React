-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2025 a las 00:29:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cloud_final`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_email` (IN `p_email` VARCHAR(100))   BEGIN
  SELECT id, username, email, password, created_at
  FROM users
  WHERE email = p_email;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser` (IN `username` VARCHAR(50), IN `email` VARCHAR(100), IN `password` VARCHAR(255))   BEGIN
INSERT INTO users (username, email, password) VALUES (username, email,
password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_user` (IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255))   BEGIN
  SELECT id, username, email, created_at
  FROM users
  WHERE email = p_email AND password = p_password;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'Test2', 'b2@email.com', '66789', '2025-05-19 20:12:57'),
(2, 'Test1', 'test1@gmail.com', '123456789', '2025-05-19 21:09:29'),
(3, 'Test1', 'test1@gmail.com', '123456789', '2025-05-19 21:10:27'),
(4, 'aaaa', 'da@gmail.com', 'pinga', '2025-05-19 21:14:56');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
