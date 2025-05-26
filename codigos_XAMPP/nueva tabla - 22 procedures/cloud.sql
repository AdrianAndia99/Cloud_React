-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2025 a las 00:27:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cloud`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarUsuario` (IN `p_user_id` INT)   BEGIN
    UPDATE User
    SET state = 1
    WHERE id = p_user_id AND state = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame` (IN `p_game_name` VARCHAR(100), IN `p_created_by` INT)   BEGIN
    INSERT INTO Games (game_name, created_by, modified_by, state)
    VALUES (p_game_name, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGameScore` (IN `p_gameid` INT, IN `p_userID` INT, IN `p_score` INT, IN `p_created_by` INT)   BEGIN
    INSERT INTO GameScores (gameid, userID, score, created_by, modified_by, state)
    VALUES (p_gameid, p_userID, p_score, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLogin` (IN `p_user_id` INT, IN `p_attempt_count` INT, IN `p_created_by` INT)   BEGIN
    INSERT INTO Login (user_id, attempt_count, created_by, modified_by, state)
    VALUES (p_user_id, p_attempt_count, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUser` (IN `p_username` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_created_by` INT)   BEGIN
    INSERT INTO User (username, email, password, created_by, modified_by, state)
    VALUES (p_username, p_email, p_password, p_created_by, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUserToken` (IN `p_userid` INT, IN `p_token` VARCHAR(255), IN `p_created_by` INT)   BEGIN
    INSERT INTO UserTokens (userid, token, created_by, modified_by, state)
    VALUES (p_userid, p_token, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame` (IN `p_id` INT)   BEGIN
    UPDATE Games
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGameScore` (IN `p_id` INT)   BEGIN
    UPDATE GameScores
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLogin` (IN `p_id` INT)   BEGIN
    UPDATE Login
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser` (IN `p_id` INT)   BEGIN
    UPDATE User
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUserToken` (IN `p_id` INT)   BEGIN
    UPDATE UserTokens
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginProcedure` (IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255))   BEGIN
    SELECT * FROM User
    WHERE email = p_email AND password = p_password AND state = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGames` ()   BEGIN
    SELECT * FROM Games;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGameScores` ()   BEGIN
    SELECT * FROM GameScores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadLogins` ()   BEGIN
    SELECT * FROM Login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadUsers` ()   BEGIN
    SELECT * FROM User;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadUserTokens` ()   BEGIN
    SELECT * FROM UserTokens;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame` (IN `p_id` INT, IN `p_game_name` VARCHAR(100), IN `p_modified_by` INT)   BEGIN
    UPDATE Games
    SET game_name = p_game_name,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGameScore` (IN `p_id` INT, IN `p_score` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE GameScores
    SET score = p_score,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLogin` (IN `p_id` INT, IN `p_attempt_count` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE Login
    SET attempt_count = p_attempt_count,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser` (IN `p_id` INT, IN `p_username` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_modified_by` INT)   BEGIN
    UPDATE User
    SET username = p_username,
        email = p_email,
        password = p_password,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserToken` (IN `p_id` INT, IN `p_token` VARCHAR(255), IN `p_login_attempts` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE UserTokens
    SET token = p_token,
        login_attempts = p_login_attempts,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `game_name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gamescores`
--

CREATE TABLE `gamescores` (
  `id` int(11) NOT NULL,
  `gameid` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `score_time` datetime DEFAULT current_timestamp(),
  `score` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `state`
--

INSERT INTO `state` (`id`, `description`) VALUES
(0, 'Inactivo'),
(1, 'Activo'),
(2, 'Suspensión Temporal'),
(3, 'Baneo Temporal'),
(4, 'Baneo Permanente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertokens`
--

CREATE TABLE `usertokens` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `login_attempts` int(11) DEFAULT 0,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `gamescores`
--
ALTER TABLE `gamescores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gameid` (`gameid`),
  ADD KEY `state` (`state`),
  ADD KEY `userID` (`userID`);

--
-- Indices de la tabla `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `usertokens`
--
ALTER TABLE `usertokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `userid` (`userid`),
  ADD KEY `state` (`state`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gamescores`
--
ALTER TABLE `gamescores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usertokens`
--
ALTER TABLE `usertokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `games`
--
ALTER TABLE `games`
  ADD CONSTRAINT `games_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state` (`id`);

--
-- Filtros para la tabla `gamescores`
--
ALTER TABLE `gamescores`
  ADD CONSTRAINT `gamescores_ibfk_1` FOREIGN KEY (`gameid`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `gamescores_ibfk_2` FOREIGN KEY (`state`) REFERENCES `state` (`id`),
  ADD CONSTRAINT `gamescores_ibfk_3` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state` (`id`);

--
-- Filtros para la tabla `usertokens`
--
ALTER TABLE `usertokens`
  ADD CONSTRAINT `usertokens_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `usertokens_ibfk_2` FOREIGN KEY (`state`) REFERENCES `state` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
