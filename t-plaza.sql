-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2018 a las 20:41:39
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `t-plaza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajadepago`
--

CREATE TABLE `cajadepago` (
  `cod_sucursal` int(11) NOT NULL,
  `num_de_caja` int(11) NOT NULL,
  `monto_recaudado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cajadepago`
--

INSERT INTO `cajadepago` (`cod_sucursal`, `num_de_caja`, `monto_recaudado`) VALUES
(210, 0, 70),
(230, 0, 70),
(200, 1, 500),
(210, 1, 500),
(220, 1, 150),
(230, 1, 100),
(240, 1, 500),
(250, 1, 820),
(260, 1, 150),
(270, 1, 10),
(210, 2, 980),
(220, 2, 500),
(230, 2, 980),
(250, 2, 180),
(260, 2, 500),
(270, 2, 60),
(280, 2, 650),
(290, 2, 60),
(300, 2, 60),
(220, 3, 980),
(260, 3, 980),
(200, 4, 50),
(220, 4, 170),
(240, 4, 50),
(250, 4, 50),
(260, 4, 170),
(200, 6, 150),
(240, 6, 150),
(250, 6, 350),
(200, 7, 180),
(210, 7, 150),
(220, 7, 801),
(230, 7, 850),
(240, 7, 80),
(250, 7, 80),
(260, 7, 801),
(290, 7, 70),
(200, 8, 80),
(210, 8, 801),
(230, 8, 801),
(240, 9, 180),
(280, 9, 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `dni` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_a_pagar` float NOT NULL,
  `cod_sucursal` int(11) NOT NULL,
  `num_de_caja` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `dni`, `monto_a_pagar`, `cod_sucursal`, `num_de_caja`) VALUES
(8, '78454985', 50, 200, 6),
(9, '16529843', 78, 200, 1),
(10, '86142594', 510, 200, 8),
(11, '31524625', 70, 200, 1),
(12, '54565456', 40, 200, 4),
(13, '71154985', 789, 200, 6),
(14, '16888843', 12, 200, 1),
(15, '86142444', 840, 200, 7),
(16, '44724625', 12, 200, 1),
(17, '54565256', 89, 200, 4),
(18, '84785984', 45, 210, 7),
(19, '78454974', 90, 210, 1),
(20, '95123485', 40, 210, 8),
(21, '76254985', 510, 210, 2),
(22, '95624187', 55.5, 210, 0),
(23, '95124987', 50, 220, 1),
(24, '95548177', 50.5, 220, 2),
(25, '25467987', 74, 220, 7),
(26, '95222871', 95, 220, 3),
(27, '55556421', 70, 220, 4),
(28, '65459877', 15.6, 230, 7),
(29, '11124987', 50, 230, 1),
(30, '33324987', 554, 230, 8),
(31, '88124987', 50, 230, 2),
(32, '96664987', 50, 230, 0),
(33, '95999987', 50, 240, 6),
(34, '95124333', 50, 240, 1),
(35, '15999998', 82, 240, 7),
(36, '95122136', 50, 240, 1),
(37, '95155547', 57, 240, 4),
(38, '78999987', 47, 240, 9),
(39, '78784333', 52, 240, 9),
(40, '15599998', 96, 240, 9),
(41, '95144456', 522, 240, 9),
(42, '95155587', 575, 240, 9),
(43, '95128885', 80, 250, 6),
(44, '95256487', 10, 250, 1),
(45, '97799887', 36, 250, 7),
(46, '25254987', 50, 250, 1),
(47, '63656892', 80, 250, 4),
(48, '40128885', 82, 250, 2),
(49, '95122322', 50, 260, 1),
(50, '88824987', 50, 260, 2),
(51, '95133381', 50, 260, 7),
(52, '12344987', 82, 260, 3),
(53, '95122555', 15, 260, 4),
(54, '44124987', 504, 270, 1),
(55, '14124557', 510, 270, 2),
(56, '66524987', 50, 280, 9),
(57, '95125369', 51.2, 280, 2),
(58, '45666987', 50, 290, 7),
(59, '12332498', 152, 290, 2),
(60, '95131188', 50, 300, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `cod_sucursal` int(11) NOT NULL,
  `distrito` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`cod_sucursal`, `distrito`) VALUES
(200, 'Barranco'),
(210, 'Carabayllo'),
(220, 'Chaclacayo'),
(230, 'Cieneguilla'),
(240, 'Ate'),
(250, 'La MOlina'),
(260, 'La victoria'),
(270, 'Lima'),
(280, 'Los Olivos'),
(290, 'San Borja'),
(300, 'San Isidro');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajadepago`
--
ALTER TABLE `cajadepago`
  ADD PRIMARY KEY (`num_de_caja`,`cod_sucursal`),
  ADD KEY `FK_Caja_Tienda` (`cod_sucursal`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Caja_Cliente` (`cod_sucursal`,`num_de_caja`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`cod_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajadepago`
--
ALTER TABLE `cajadepago`
  ADD CONSTRAINT `FK_Caja_Tienda` FOREIGN KEY (`cod_sucursal`) REFERENCES `tienda` (`cod_sucursal`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_Caja_Cliente` FOREIGN KEY (`cod_sucursal`,`num_de_caja`) REFERENCES `cajadepago` (`cod_sucursal`, `num_de_caja`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
