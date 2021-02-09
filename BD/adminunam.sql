-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2021 a las 05:31:09
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adminunam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ct_empleados`
--

CREATE TABLE `ct_empleados` (
  `id_empleado` int(11) NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish_ci NOT NULL,
  `curp` varchar(18) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_1` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido_2` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_registro` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `usuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `fechaMovimiento` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `horaMovimiento` varchar(24) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `observaciones`
--

CREATE TABLE `observaciones` (
  `id_observaciones` int(11) NOT NULL,
  `observacion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `id_fomope` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `observaciones`
--

INSERT INTO `observaciones` (`id_observaciones`, `observacion`, `id_fomope`) VALUES
(1, 'Faltan datos personales.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rechazos`
--

CREATE TABLE `rechazos` (
  `id_movimiento` int(11) DEFAULT NULL,
  `id_rechazo` int(11) NOT NULL,
  `justificacionRechazo` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaRechazo` varchar(11) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rechazos`
--

INSERT INTO `rechazos` (`id_movimiento`, `id_rechazo`, `justificacionRechazo`, `usuario`, `fechaRechazo`) VALUES
(28, 60, 'SE DEVOLVIO A LA UNIDAD CON VOLANTE DE DEVOLUCIÓN', 'IreneDSPO', '2020-03-05'),
(111, 61, 'DEVUELVE A LA UNIDAD POR ERRORES EN EL FOMOPE', 'IreneDSPO', '2020-03-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `colorAsignado` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `nombrePersonal` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `unidadCorrespondiente` varchar(4) COLLATE utf8_spanish_ci NOT NULL,
  `id_numUser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `contrasena`, `id_rol`, `colorAsignado`, `nombrePersonal`, `unidadCorrespondiente`, `id_numUser`) VALUES
('Lulu', '123', 1, '', '', '', 29);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ct_empleados`
--
ALTER TABLE `ct_empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_movimiento` (`id_movimiento`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  ADD PRIMARY KEY (`id_observaciones`);

--
-- Indices de la tabla `rechazos`
--
ALTER TABLE `rechazos`
  ADD PRIMARY KEY (`id_rechazo`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `id_movimiento` (`id_movimiento`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_numUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3264;

--
-- AUTO_INCREMENT de la tabla `observaciones`
--
ALTER TABLE `observaciones`
  MODIFY `id_observaciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `rechazos`
--
ALTER TABLE `rechazos`
  MODIFY `id_rechazo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_numUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
