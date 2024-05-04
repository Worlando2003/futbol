-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-05-2024 a las 22:05:31
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
-- Base de datos: `bd_campeonato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonatos`
--

CREATE TABLE `campeonatos` (
  `id_campeonato` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `campeonatos`
--

INSERT INTO `campeonatos` (`id_campeonato`, `fecha_inicio`, `fecha_fin`, `estado`) VALUES
(1, '2024-01-01', '2024-12-31', 'En curso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipo` int(11) NOT NULL,
  `nombre_equipo` varchar(100) NOT NULL,
  `sede` varchar(100) DEFAULT NULL,
  `directiva` varchar(255) DEFAULT NULL,
  `anio_fundacion` int(11) DEFAULT NULL,
  `colores` varchar(100) DEFAULT NULL,
  `escudo` blob DEFAULT NULL,
  `representante_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipo`, `nombre_equipo`, `sede`, `directiva`, `anio_fundacion`, `colores`, `escudo`, `representante_id`) VALUES
(1, 'Equipo A', 'Ciudad A', 'Directiva A', 2000, 'Azul y Blanco', NULL, 2),
(2, 'Equipo B', 'Ciudad B', 'Directiva B', 2005, 'Rojo y Blanco', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goleadores`
--

CREATE TABLE `goleadores` (
  `id_gol` int(11) NOT NULL,
  `partido_id` int(11) DEFAULT NULL,
  `jugador_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `numero_goles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `goleadores`
--

INSERT INTO `goleadores` (`id_gol`, `partido_id`, `jugador_id`, `equipo_id`, `numero_goles`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugador` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `numero_cedula` varchar(20) DEFAULT NULL,
  `numero_camiseta` int(11) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `fotografia` blob DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugador`, `nombre_completo`, `fecha_nacimiento`, `numero_cedula`, `numero_camiseta`, `direccion`, `fotografia`, `equipo_id`) VALUES
(1, 'Jugador 1', '1995-01-01', '123456789', 10, 'Dirección Jugador 1', NULL, 1),
(2, 'Jugador 2', '1990-05-15', '987654321', 7, 'Dirección Jugador 2', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partido` int(11) NOT NULL,
  `campeonato_id` int(11) DEFAULT NULL,
  `equipo_local_id` int(11) DEFAULT NULL,
  `equipo_visitante_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `resultado_local` int(11) DEFAULT NULL,
  `resultado_visitante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partido`, `campeonato_id`, `equipo_local_id`, `equipo_visitante_id`, `fecha`, `hora`, `resultado_local`, `resultado_visitante`) VALUES
(1, 1, 1, 2, '2024-05-01', '20:00:00', 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Representante del equipo'),
(3, 'Digitador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas`
--

CREATE TABLE `tarjetas` (
  `id_tarjeta` int(11) NOT NULL,
  `partido_id` int(11) DEFAULT NULL,
  `jugador_id` int(11) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `amarilla` int(11) DEFAULT 0,
  `roja` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tarjetas`
--

INSERT INTO `tarjetas` (`id_tarjeta`, `partido_id`, `jugador_id`, `equipo_id`, `amarilla`, `roja`) VALUES
(1, 1, 1, 1, 1, 0),
(2, 1, 2, 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `contrasenia`, `rol_id`) VALUES
(1, 'admin', 'contraseña_admin', 1),
(2, 'representante1', 'contraseña_rep1', 2),
(3, 'digitador1', 'contraseña_dig1', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD PRIMARY KEY (`id_campeonato`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `representante_id` (`representante_id`);

--
-- Indices de la tabla `goleadores`
--
ALTER TABLE `goleadores`
  ADD PRIMARY KEY (`id_gol`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `campeonato_id` (`campeonato_id`),
  ADD KEY `equipo_local_id` (`equipo_local_id`),
  ADD KEY `equipo_visitante_id` (`equipo_visitante_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD PRIMARY KEY (`id_tarjeta`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `jugador_id` (`jugador_id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  MODIFY `id_campeonato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `goleadores`
--
ALTER TABLE `goleadores`
  MODIFY `id_gol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  MODIFY `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD CONSTRAINT `equipos_ibfk_1` FOREIGN KEY (`representante_id`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `goleadores`
--
ALTER TABLE `goleadores`
  ADD CONSTRAINT `goleadores_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id_partido`),
  ADD CONSTRAINT `goleadores_ibfk_2` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id_jugador`),
  ADD CONSTRAINT `goleadores_ibfk_3` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id_equipo`);

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id_equipo`);

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`campeonato_id`) REFERENCES `campeonatos` (`id_campeonato`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_local_id`) REFERENCES `equipos` (`id_equipo`),
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `equipos` (`id_equipo`);

--
-- Filtros para la tabla `tarjetas`
--
ALTER TABLE `tarjetas`
  ADD CONSTRAINT `tarjetas_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id_partido`),
  ADD CONSTRAINT `tarjetas_ibfk_2` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id_jugador`),
  ADD CONSTRAINT `tarjetas_ibfk_3` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id_equipo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
