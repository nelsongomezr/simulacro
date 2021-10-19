-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2021 a las 18:51:16
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simulacro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cent_med`
--

CREATE TABLE `cent_med` (
  `idCent_Med` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Hor_Aper` time NOT NULL,
  `Hor_Cierre` time NOT NULL,
  `Imagen` varchar(200) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cent_med_has_eps`
--

CREATE TABLE `cent_med_has_eps` (
  `Cent_Med_idCent_Med` int(11) NOT NULL,
  `Eps_idEps` int(11) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `idCita` int(11) NOT NULL,
  `Fecha_Hora` datetime NOT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Especialidad_idEspecialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `idEncuesta` int(11) NOT NULL,
  `calif` int(11) NOT NULL,
  `Cita_idCita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `idEps` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(70) NOT NULL,
  `Telefono` bigint(11) NOT NULL,
  `Perfil_idPerfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `idEspecialidad` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_has_cent_med`
--

CREATE TABLE `especialidad_has_cent_med` (
  `Especialidad_idEspecialidad` int(11) NOT NULL,
  `Cent_Med_idCent_Med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE `nivel` (
  `idNivel` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_has_cent_med`
--

CREATE TABLE `nivel_has_cent_med` (
  `Nivel_idNivel` int(11) NOT NULL,
  `Cent_Med_idCent_Med` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` bigint(20) NOT NULL,
  `Email` varchar(60) NOT NULL,
  `Contraseña` varchar(100) NOT NULL,
  `Perfil_idPerfil` int(11) NOT NULL,
  `Eps_idEps` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cent_med`
--
ALTER TABLE `cent_med`
  ADD PRIMARY KEY (`idCent_Med`);

--
-- Indices de la tabla `cent_med_has_eps`
--
ALTER TABLE `cent_med_has_eps`
  ADD PRIMARY KEY (`Cent_Med_idCent_Med`,`Eps_idEps`),
  ADD KEY `fk_Cent_Med_has_Eps_Eps1_idx` (`Eps_idEps`),
  ADD KEY `fk_Cent_Med_has_Eps_Cent_Med_idx` (`Cent_Med_idCent_Med`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`idCita`),
  ADD KEY `fk_Cita_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Cita_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`idEncuesta`),
  ADD KEY `fk_Encuesta_Cita1_idx` (`Cita_idCita`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`idEps`),
  ADD KEY `fk_Eps_Perfil1_idx` (`Perfil_idPerfil`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`idEspecialidad`);

--
-- Indices de la tabla `especialidad_has_cent_med`
--
ALTER TABLE `especialidad_has_cent_med`
  ADD PRIMARY KEY (`Especialidad_idEspecialidad`,`Cent_Med_idCent_Med`),
  ADD KEY `fk_Especialidad_has_Cent_Med_Cent_Med1_idx` (`Cent_Med_idCent_Med`),
  ADD KEY `fk_Especialidad_has_Cent_Med_Especialidad1_idx` (`Especialidad_idEspecialidad`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`idNivel`);

--
-- Indices de la tabla `nivel_has_cent_med`
--
ALTER TABLE `nivel_has_cent_med`
  ADD PRIMARY KEY (`Nivel_idNivel`,`Cent_Med_idCent_Med`),
  ADD KEY `fk_Nivel_has_Cent_Med_Cent_Med1_idx` (`Cent_Med_idCent_Med`),
  ADD KEY `fk_Nivel_has_Cent_Med_Nivel1_idx` (`Nivel_idNivel`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `fk_Usuario_Perfil1_idx` (`Perfil_idPerfil`),
  ADD KEY `fk_Usuario_Eps1_idx` (`Eps_idEps`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `idCita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `idEspecialidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cent_med_has_eps`
--
ALTER TABLE `cent_med_has_eps`
  ADD CONSTRAINT `fk_Cent_Med_has_Eps_Cent_Med` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cent_Med_has_Eps_Eps1` FOREIGN KEY (`Eps_idEps`) REFERENCES `eps` (`idEps`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `fk_Cita_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cita_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD CONSTRAINT `fk_Encuesta_Cita1` FOREIGN KEY (`Cita_idCita`) REFERENCES `cita` (`idCita`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eps`
--
ALTER TABLE `eps`
  ADD CONSTRAINT `fk_Eps_Perfil1` FOREIGN KEY (`Perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `especialidad_has_cent_med`
--
ALTER TABLE `especialidad_has_cent_med`
  ADD CONSTRAINT `fk_Especialidad_has_Cent_Med_Cent_Med1` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Especialidad_has_Cent_Med_Especialidad1` FOREIGN KEY (`Especialidad_idEspecialidad`) REFERENCES `especialidad` (`idEspecialidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nivel_has_cent_med`
--
ALTER TABLE `nivel_has_cent_med`
  ADD CONSTRAINT `fk_Nivel_has_Cent_Med_Cent_Med1` FOREIGN KEY (`Cent_Med_idCent_Med`) REFERENCES `cent_med` (`idCent_Med`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Nivel_has_Cent_Med_Nivel1` FOREIGN KEY (`Nivel_idNivel`) REFERENCES `nivel` (`idNivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_Usuario_Eps1` FOREIGN KEY (`Eps_idEps`) REFERENCES `eps` (`idEps`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Usuario_Perfil1` FOREIGN KEY (`Perfil_idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
