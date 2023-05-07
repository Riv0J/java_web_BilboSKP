-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bilboskpdb
CREATE DATABASE IF NOT EXISTS `bilboskpdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `bilboskpdb`;

-- Dumping structure for table bilboskpdb.cupon
CREATE TABLE IF NOT EXISTS `cupon` (
  `idCupon` int(11) NOT NULL AUTO_INCREMENT,
  `idSuscriptor` int(11) NOT NULL,
  `fechaCaducidad` datetime NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Disponible',
  `reembolsable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCupon`) USING BTREE,
  KEY `fk_cupon_suscriptor` (`idSuscriptor`),
  CONSTRAINT `fk_cupon_suscriptor` FOREIGN KEY (`idSuscriptor`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.cupon: ~22 rows (approximately)
INSERT INTO `cupon` (`idCupon`, `idSuscriptor`, `fechaCaducidad`, `estado`, `reembolsable`) VALUES
	(1, 2, '2023-04-30 00:00:00', 'Disponible', 1),
	(2, 1, '2023-02-03 00:00:00', 'Disponible', 1),
	(3, 3, '2023-04-30 00:00:00', 'Disponible', 1),
	(5, 8, '2023-06-08 00:00:00', 'Disponible', 1),
	(6, 8, '2023-06-09 00:00:00', 'Disponible', 1),
	(7, 12, '2023-06-06 00:00:00', 'Disponible', 0),
	(8, 12, '2023-06-09 00:00:00', 'Disponible', 1),
	(9, 12, '2023-02-09 00:00:00', 'Disponible', 1),
	(11, 4, '2077-12-31 00:00:00', 'Disponible', 0),
	(12, 4, '2077-12-31 00:00:00', 'Disponible', 0),
	(13, 4, '2023-05-18 00:00:00', 'Disponible', 0),
	(14, 4, '2024-05-18 00:00:00', 'Disponible\r\n', 0),
	(15, 1, '2023-06-04 00:00:00', 'Disponible', 1),
	(16, 1, '2026-06-04 00:00:00', 'Disponible', 1),
	(17, 1, '2027-06-04 00:00:00', 'Disponible', 1),
	(18, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(19, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(20, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(21, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(22, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(23, 1, '2025-06-04 00:00:00', 'Disponible', 1),
	(24, 1, '2025-06-04 00:00:00', 'Disponible', 1);

-- Dumping structure for table bilboskpdb.escenario
CREATE TABLE IF NOT EXISTS `escenario` (
  `nombreEscenario` varchar(50) NOT NULL,
  `idSala` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`nombreEscenario`) USING BTREE,
  KEY `idSala` (`idSala`),
  CONSTRAINT `escenario_ibfk_1` FOREIGN KEY (`idSala`) REFERENCES `salaonline` (`idSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.escenario: ~6 rows (approximately)
INSERT INTO `escenario` (`nombreEscenario`, `idSala`, `descripcion`, `imagen`) VALUES
	('CampanarioAbajo', 1, 'Esta es una sala bien espaciosa, hay un campanario ahí arriba.', 'campanarioAbajo.png'),
	('CampanarioArriba', 1, '¿Podré ver el exterior desde aquí?', 'campanarioArriba.png'),
	('ConfesionarioCerrado', 1, 'Parece ser el antiguo confesionario de la iglesia', 'confesionarioCerrado.png'),
	('Dormitorio', 1, 'Qué hacía yo en un dormitorio?', 'dormitorio.png'),
	('Entrada', 1, 'Esta sala tiene unas rocas que bloquean la puerta. Talvez pueda moverlas con algo.', 'entrada.png'),
	('Nave', 1, 'Increible pensar que este era un lugar de culto, antes...', 'nave.png');

-- Dumping structure for table bilboskpdb.escenarios_inicio
CREATE TABLE IF NOT EXISTS `escenarios_inicio` (
  `nombreEscenario` varchar(50) NOT NULL DEFAULT '',
  `idSala` int(11) DEFAULT NULL,
  PRIMARY KEY (`nombreEscenario`),
  KEY `idSala` (`idSala`),
  CONSTRAINT `FK_escenarios_inicio_escenario` FOREIGN KEY (`nombreEscenario`) REFERENCES `escenario` (`nombreEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_escenarios_inicio_salaonline` FOREIGN KEY (`idSala`) REFERENCES `salaonline` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.escenarios_inicio: ~1 rows (approximately)
INSERT INTO `escenarios_inicio` (`nombreEscenario`, `idSala`) VALUES
	('Dormitorio', 1);

-- Dumping structure for table bilboskpdb.escenario_flecha
CREATE TABLE IF NOT EXISTS `escenario_flecha` (
  `idObjeto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEscenario` varchar(50) DEFAULT NULL,
  `nombreEscenarioDestino` varchar(50) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `posicionX` int(3) unsigned NOT NULL COMMENT '%',
  `posicionY` int(3) unsigned NOT NULL COMMENT '%',
  `dimensionX` int(3) unsigned NOT NULL COMMENT '%',
  `dimensionY` int(3) unsigned NOT NULL COMMENT '%',
  `comentario` varchar(50) DEFAULT NULL,
  `mensajeError` varchar(50) DEFAULT NULL,
  KEY `idObjeto` (`idObjeto`),
  KEY `escenario` (`nombreEscenario`) USING BTREE,
  KEY `escenarioDestino` (`nombreEscenarioDestino`) USING BTREE,
  CONSTRAINT `FK_escenario_flecha_escenario` FOREIGN KEY (`nombreEscenario`) REFERENCES `escenario` (`nombreEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_escenario_flecha_escenario_2` FOREIGN KEY (`nombreEscenarioDestino`) REFERENCES `escenario` (`nombreEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_escenario_flecha_objeto` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.escenario_flecha: ~5 rows (approximately)
INSERT INTO `escenario_flecha` (`idObjeto`, `nombreEscenario`, `nombreEscenarioDestino`, `imagen`, `posicionX`, `posicionY`, `dimensionX`, `dimensionY`, `comentario`, `mensajeError`) VALUES
	(0, 'Dormitorio', 'ConfesionarioCerrado', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'ConfesionarioCerrado', 'Dormitorio', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'ConfesionarioCerrado', 'Entrada', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Nave', 'Entrada', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'Entrada', 'Nave', 'izquierda', 5, 50, 5, 10, NULL, NULL);

-- Dumping structure for table bilboskpdb.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `idSalaFisica` int(6) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `disponible` tinyint(4) NOT NULL DEFAULT 1,
  KEY `idSalaFisica` (`idSalaFisica`),
  CONSTRAINT `FK__salafisica` FOREIGN KEY (`idSalaFisica`) REFERENCES `salafisica` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.horario: ~18 rows (approximately)
INSERT INTO `horario` (`idSalaFisica`, `fechaHora`, `disponible`) VALUES
	(1, '2023-05-14 10:00:00', 1),
	(1, '2023-05-14 12:00:00', 1),
	(1, '2023-05-14 14:00:00', 1),
	(1, '2023-05-15 10:00:00', 1),
	(1, '2023-05-15 12:00:00', 1),
	(1, '2023-05-15 14:00:00', 1),
	(1, '2023-05-16 10:00:00', 1),
	(1, '2023-05-16 12:00:00', 1),
	(1, '2023-05-16 14:00:00', 1),
	(1, '2023-05-17 10:00:00', 1),
	(1, '2023-05-17 12:00:00', 1),
	(1, '2023-05-17 14:00:00', 1),
	(1, '2023-05-18 10:00:00', 1),
	(1, '2023-05-18 12:00:00', 1),
	(1, '2023-05-18 14:00:00', 1),
	(1, '2023-05-19 10:00:00', 1),
	(1, '2023-05-19 12:00:00', 1),
	(1, '2023-05-19 14:00:00', 1);

-- Dumping structure for table bilboskpdb.objeto
CREATE TABLE IF NOT EXISTS `objeto` (
  `idObjeto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreEscenario` varchar(50) DEFAULT NULL,
  `nombre` varchar(30) NOT NULL,
  `idObjetoADesbloquear` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `visibleInicio` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'boolean 1-0',
  `visibleInventario` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'booleano si se agrega al inventario el objeto',
  `desapareceAlUsar` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'boolean 1-0',
  `dimensionX` int(3) NOT NULL COMMENT '%',
  `dimenxionY` int(3) NOT NULL COMMENT '%',
  `posicionX` int(3) NOT NULL COMMENT '%',
  `posicionY` int(3) NOT NULL COMMENT '%',
  PRIMARY KEY (`idObjeto`) USING BTREE,
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idObjetoDesbloquea` (`idObjetoADesbloquear`) USING BTREE,
  KEY `nombreEscenario` (`nombreEscenario`),
  CONSTRAINT `FK_objeto_escenario` FOREIGN KEY (`nombreEscenario`) REFERENCES `escenario` (`nombreEscenario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `objeto_ibfk_2` FOREIGN KEY (`idObjetoADesbloquear`) REFERENCES `objeto` (`idObjeto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.objeto: ~14 rows (approximately)
INSERT INTO `objeto` (`idObjeto`, `nombreEscenario`, `nombre`, `idObjetoADesbloquear`, `descripcion`, `imagen`, `visibleInicio`, `visibleInventario`, `desapareceAlUsar`, `dimensionX`, `dimenxionY`, `posicionX`, `posicionY`) VALUES
	(1, 'Dormitorio', 'Llave dorada', NULL, 'Esta llave parece vieja, deberían poder abrir una de las antiguas puertas de este lugar', 'llaveDorada.png', 0, 1, 1, 0, 0, 0, 0),
	(2, 'Dormitorio', 'Rosa roja', NULL, 'Una bonita rosa, es como si hubiera estado aquí mucho tiempo, pero no parece haberse marchitado', 'rosa.png', 1, 1, 1, 0, 0, 0, 0),
	(3, 'Dormitorio', 'Aguja minutero', NULL, 'Un Minutero, esto sin duda debe servir para desbloquear algo…', 'minutero.png', 1, 1, 1, 10, 25, 30, 40),
	(4, 'Dormitorio', 'Aguja segundero', NULL, 'El Segundero, todo reloj debe tener siempre dos manijas', 'segundero.png', 1, 1, 1, 0, 0, 0, 0),
	(5, 'Dormitorio', 'Explosivo', NULL, '¿Esto es una bomba? Estaré loco pero si uso esto, fijo salgo de aquí, vivo o muerto...', 'explosivo.png', 1, 1, 1, 0, 0, 0, 0),
	(6, 'Dormitorio', 'Maquina de humo', NULL, 'Una maquina de humo.', 'maquinaHumo.png', 1, 1, 1, 0, 0, 0, 0),
	(7, 'Dormitorio', 'Llave plateada', NULL, 'Llave plateada casi intacta. Tiene un estilo antiguo particular pero parece moderna.', 'llavePlateada.png', 1, 1, 1, 0, 0, 0, 0),
	(8, 'Dormitorio', 'PuertaConfesionario', NULL, 'Está cerrada.', '\r\n', 1, 0, 0, 0, 0, 0, 0),
	(9, 'Dormitorio', 'JudasCama', 9, 'Qué extraño muñeco, ¿qué podría hacer aquí?', 'judasCama.png', 1, 0, 1, 0, 0, 15, 20),
	(10, 'Dormitorio', 'Nota', NULL, 'Una nota vieja. Creo que es sobre una reunión de la secta a esta hora, no dice una fecha específica, pero estoy seguro que debe ser en este lugar.', 'nota.png', 1, 1, 0, 0, 0, 0, 0),
	(11, 'Dormitorio', 'Periodico', NULL, 'Vaya, un periodico ¿Que dira?', 'periodico.png', 1, 1, 0, 0, 0, 0, 0),
	(12, 'Dormitorio', 'CuerdaAbajo', NULL, 'Creo que deberia mirar a donde lleva esta cuerda.', 'cuerdaAbajo.png', 1, 0, 1, 0, 0, 0, 0),
	(13, 'Dormitorio', 'CuerdaArriba', 1, 'Creo que deberia mirar a donde lleva esta cuerda.', 'cuerdaArriba.png', 1, 0, 1, 0, 0, 0, 0),
	(14, 'Dormitorio', 'CuerdaSuelo', NULL, 'Creo que no me servirá de nada', 'cuerdaSuelo.png', 0, 0, 1, 0, 0, 0, 0);

-- Dumping structure for table bilboskpdb.partidafisica
CREATE TABLE IF NOT EXISTS `partidafisica` (
  `idPartida` int(11) NOT NULL AUTO_INCREMENT,
  `idReserva` int(11) DEFAULT NULL,
  `idSalaFisica` int(11) NOT NULL DEFAULT 0,
  `puntaje` int(11) NOT NULL,
  `numeroJugadores` varchar(3) NOT NULL,
  `nombreGrupo` varchar(255) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  PRIMARY KEY (`idPartida`) USING BTREE,
  KEY `idSalaFisica` (`idSalaFisica`),
  KEY `idReserva` (`idReserva`),
  CONSTRAINT `FK_partidafisica_reserva` FOREIGN KEY (`idReserva`) REFERENCES `reserva` (`idReserva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_partidafisica_salafisica` FOREIGN KEY (`idSalaFisica`) REFERENCES `salafisica` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.partidafisica: ~3 rows (approximately)
INSERT INTO `partidafisica` (`idPartida`, `idReserva`, `idSalaFisica`, `puntaje`, `numeroJugadores`, `nombreGrupo`, `fechaInicio`, `fechaFin`) VALUES
	(1, 1, 1, 2000, '6', 'Los exploradores', '2023-04-09 10:00:00', '2023-04-09 09:25:00'),
	(2, 2, 1, 1000, '8', 'Los Mosqueteros', '2023-04-10 14:59:00', '2023-04-09 13:37:00'),
	(3, 3, 1, 1500, '4', 'La banda', '2023-04-14 15:00:00', '2023-04-09 14:25:00');

-- Dumping structure for table bilboskpdb.partidaonline
CREATE TABLE IF NOT EXISTS `partidaonline` (
  `idPartida` int(11) NOT NULL AUTO_INCREMENT,
  `idSalaOnline` int(11) NOT NULL DEFAULT 0,
  `idAnfitrion` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL,
  `numeroJugadores` varchar(3) NOT NULL,
  `nombreGrupo` varchar(255) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `visibleRanking` tinyint(4) DEFAULT 1 COMMENT '1 visible 0 invisible',
  PRIMARY KEY (`idPartida`) USING BTREE,
  KEY `idSalaOnline` (`idSalaOnline`),
  KEY `idAnfitrion` (`idAnfitrion`),
  CONSTRAINT `FK_partidaonline_salaonline` FOREIGN KEY (`idSalaOnline`) REFERENCES `salaonline` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_partidaonline_suscriptor` FOREIGN KEY (`idAnfitrion`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.partidaonline: ~34 rows (approximately)
INSERT INTO `partidaonline` (`idPartida`, `idSalaOnline`, `idAnfitrion`, `puntaje`, `numeroJugadores`, `nombreGrupo`, `fechaInicio`, `fechaFin`, `visibleRanking`) VALUES
	(1, 2, 1, 2000, '6', 'Los mosqueteros', '2023-04-09 22:51:02', '2023-04-09 23:51:04', 1),
	(2, 1, 1, 1800, '3', 'Los mosqueteros', '2023-04-09 22:51:02', '2023-04-09 23:51:04', 1),
	(3, 3, 5, 1700, '2', 'Los solitarios', '2023-04-13 12:00:00', '2023-04-13 13:45:00', 1),
	(6, 3, 3, 1400, '5', 'Los aventureros', '2023-04-09 15:30:00', '2023-04-09 17:45:00', 1),
	(7, 1, 2, 1400, '4', 'Los exploradores', '2023-04-10 10:00:00', '2023-04-10 12:30:00', 1),
	(8, 3, 4, 800, '3', 'Los valientes', '2023-04-11 18:00:00', '2023-04-11 19:45:00', 1),
	(9, 2, 1, 1200, '6', 'Los caballeros', '2023-04-12 21:00:00', '2023-04-13 00:15:00', 1),
	(11, 1, 4, 600, '2', 'Los cazadores', '2023-04-13 12:00:00', '2023-04-13 14:30:00', 1),
	(12, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(13, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(14, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(15, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(16, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(17, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(18, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(19, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(20, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(21, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(22, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(23, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1),
	(200, 10, 12, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
	(201, 10, 12, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
	(202, 10, 12, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
	(203, 10, 12, 0, '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
	(204, 3, 12, 2700, '8', 'SO3', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(205, 3, 12, 2700, '8', 'SO3', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(206, 1, 12, 2700, '8', 'SO1', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(207, 1, 12, 2700, '8', 'SO1', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(208, 1, 12, 2700, '8', 'SO1', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(209, 1, 12, 2700, '8', 'SO1', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(210, 10, 12, 5400, '8', 'SO10', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(211, 10, 12, 5400, '8', 'SO10', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(212, 2, 12, 3600, '8', 'SO2', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(213, 2, 12, 3600, '8', 'SO2', '2023-05-06 00:00:00', '2023-05-06 00:00:00', 1),
	(214, 3, 12, 2700, '8', 'SO3', '2023-05-07 00:00:00', '2023-05-07 00:00:00', 1),
	(215, 3, 12, 2700, '8', 'SO3', '2023-05-07 00:00:00', '2023-05-07 00:00:00', 1),
	(216, 1, 12, 2700, '8', 'SO1', '2023-05-07 00:00:00', '2023-05-07 00:00:00', 1);

-- Dumping structure for table bilboskpdb.pista
CREATE TABLE IF NOT EXISTS `pista` (
  `idPista` int(11) NOT NULL AUTO_INCREMENT,
  `idPuzzle` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(255) NOT NULL,
  `penalizacion` int(4) DEFAULT NULL,
  PRIMARY KEY (`idPista`),
  KEY `Índice 2` (`idPuzzle`),
  CONSTRAINT `FK_pista_puzzle` FOREIGN KEY (`idPuzzle`) REFERENCES `puzzle` (`idPuzzle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.pista: ~5 rows (approximately)
INSERT INTO `pista` (`idPista`, `idPuzzle`, `descripcion`, `penalizacion`) VALUES
	(1, 1, 'Tal vez debas hacer la misma combinacion que muestra en la pantalla', 200),
	(2, 1, 'El reloj ese le faltan manecillas. Igual tiene que ver con la nota', 200),
	(3, 1, 'Que pasaria si le das a la campana', 200),
	(4, 1, 'Se dicen que este tipo de rosas se utilizan como un ingrediente de la anestesia', 200),
	(5, 1, 'La bomba nos puede servir para abrir aquella puerta de la entrada', 300);

-- Dumping structure for table bilboskpdb.puzzle
CREATE TABLE IF NOT EXISTS `puzzle` (
  `idPuzzle` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `puntuacion` int(4) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idPuzzle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.puzzle: ~1 rows (approximately)
INSERT INTO `puzzle` (`idPuzzle`, `descripcion`, `puntuacion`, `tipo`) VALUES
	(1, '', 0, 'Combinar');

-- Dumping structure for table bilboskpdb.puzzle_objeto
CREATE TABLE IF NOT EXISTS `puzzle_objeto` (
  `idPuzzle` int(11) NOT NULL DEFAULT 0,
  `idObjeto` int(11) NOT NULL DEFAULT 0,
  KEY `FK_requerimiento_objeto` (`idObjeto`),
  KEY `FK_requerimiento_puzzle` (`idPuzzle`),
  CONSTRAINT `FK_requerimiento_objeto` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_requerimiento_puzzle` FOREIGN KEY (`idPuzzle`) REFERENCES `puzzle` (`idPuzzle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.puzzle_objeto: ~0 rows (approximately)

-- Dumping structure for view bilboskpdb.rankingfisico
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `rankingfisico` (
	`idSala` INT(11) NOT NULL,
	`‘sala’` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`puntaje` INT(11) NOT NULL,
	`‘fecha’` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view bilboskpdb.rankingonline
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `rankingonline` (
	`idSala` INT(11) NOT NULL,
	`sala jugada` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`puntaje` INT(11) NOT NULL,
	`fecha` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table bilboskpdb.reserva
CREATE TABLE IF NOT EXISTS `reserva` (
  `idReserva` int(11) NOT NULL AUTO_INCREMENT,
  `idSuscriptor` int(11) DEFAULT NULL,
  `idSalaFisica` int(11) DEFAULT NULL,
  `numJugadores` int(1) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `estado` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`idReserva`),
  KEY `idSuscriptor` (`idSuscriptor`),
  KEY `idSalaFisica` (`idSalaFisica`),
  CONSTRAINT `FK_reserva_salafisica` FOREIGN KEY (`idSalaFisica`) REFERENCES `salafisica` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_reserva_suscriptor` FOREIGN KEY (`idSuscriptor`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.reserva: ~3 rows (approximately)
INSERT INTO `reserva` (`idReserva`, `idSuscriptor`, `idSalaFisica`, `numJugadores`, `fechaHora`, `estado`) VALUES
	(1, 11, 1, 6, '2023-05-30 10:00:00', 1),
	(2, 8, 1, 8, '2023-05-30 12:00:00', 1),
	(3, 1, 1, 6, '2023-06-03 15:00:00', 1);

-- Dumping structure for table bilboskpdb.salafisica
CREATE TABLE IF NOT EXISTS `salafisica` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dificultad` varchar(255) NOT NULL,
  `tematica` varchar(30) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tiempoMax` int(3) unsigned NOT NULL COMMENT 'Minutos',
  `jugadoresMin` int(2) unsigned NOT NULL DEFAULT 1,
  `jugadoresMax` int(2) unsigned NOT NULL DEFAULT 8,
  `edad_recomendada` int(2) unsigned NOT NULL DEFAULT 18,
  `direccion` varchar(255) NOT NULL,
  `telefono` int(9) unsigned NOT NULL,
  PRIMARY KEY (`idSala`) USING BTREE,
  CONSTRAINT `jugadoresMax` CHECK (`jugadoresMax` >= 1),
  CONSTRAINT `jugadoresMin` CHECK (`jugadoresMin` <= `jugadoresMax` and `jugadoresMin` >= 1)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.salafisica: ~2 rows (approximately)
INSERT INTO `salafisica` (`idSala`, `nombre`, `dificultad`, `tematica`, `descripcion`, `tiempoMax`, `jugadoresMin`, `jugadoresMax`, `edad_recomendada`, `direccion`, `telefono`) VALUES
	(1, 'Misterio en la mansión', 'Media', 'Misterio', 'Investiga una mansión abandonada y resuelve los enigmas que esconde su oscuro pasado.', 60, 6, 8, 18, 'Calle Mayor 25', 987654321),
	(2, 'Escape de ciudad 17', 'Difícil', 'Suspenso', 'Te has despertado encerrado en una prisión de máxima seguridad sin recordar cómo llegaste allí. Deberás trabajar en equipo para encontrar la forma de escapar antes de que los guardias descubran tu plan.', 90, 6, 8, 18, 'Avenida de la Libertad 10', 123456789);

-- Dumping structure for table bilboskpdb.salaonline
CREATE TABLE IF NOT EXISTS `salaonline` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dificultad` varchar(255) NOT NULL,
  `tematica` varchar(30) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `tiempoMax` int(3) unsigned NOT NULL COMMENT 'Minutos',
  `jugadoresMin` int(2) unsigned NOT NULL DEFAULT 1,
  `jugadoresMax` int(2) unsigned NOT NULL DEFAULT 8,
  `edad_recomendada` int(2) unsigned NOT NULL DEFAULT 18,
  `disponible` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idSala`) USING BTREE,
  CONSTRAINT `jugadoresMax` CHECK (`jugadoresMax` >= 1),
  CONSTRAINT `jugadoresMin` CHECK (`jugadoresMin` <= `jugadoresMax` and `jugadoresMin` >= 1)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.salaonline: ~7 rows (approximately)
INSERT INTO `salaonline` (`idSala`, `nombre`, `dificultad`, `tematica`, `descripcion`, `tiempoMax`, `jugadoresMin`, `jugadoresMax`, `edad_recomendada`, `disponible`) VALUES
	(1, 'Perdidos de la mano de Dios', 'Fácil', 'Terror', 'Vas de camino en medio del bosque, donde eres abducido por un loco perteneciente a una secta. Te das cuenta que ahora estás en un bosque, perdido de la mano de Dios…', 45, 1, 8, 16, 1),
	(2, 'El Gimnasio Infernal', 'Difícil', 'Suspenso', 'En un gimnasio de élite, un grupo de crossfiteros debe luchar contra una conspiración interna, encontrar al impostor entre ellos y superar pruebas físicas y mentales para escapar antes de que sea muy tarde.', 60, 2, 8, 18, 1),
	(3, 'Hasta la luz del Alba', 'Media', 'Misterio', 'Un grupo de amigos se encuentran la escena de una cabaña abandonada en el medio del bosque, curiosamente encuentran pistas sobre los que solían habitarla, y la tragedia que les precedió. Terminan siendo víctima de algo más allá de la comprensión humana.', 45, 1, 8, 18, 1),
	(5, 'El Museo Maldito', 'Difícil', 'Terror', 'Un grupo de investigadores debe resolver el misterio detrás de una serie de extraños sucesos en un museo abandonado. Descubrirán que el lugar está maldito y tendrán que enfrentarse a las fuerzas sobrenaturales para sobrevivir.', 90, 3, 8, 18, 1),
	(9, 'El Asesino del Ajedrez', 'Media', 'Misterio', 'En un torneo de ajedrez de élite, uno de los jugadores es encontrado muerto en su habitación de hotel. El resto de los participantes deberán resolver el crimen antes de que el asesino ataque de nuevo.', 60, 4, 8, 16, 1),
	(10, 'Traición en el Espacio', 'Difícil', 'Sci-fi', 'Como tripulante de una nave espacial, tienes la misión de descubrir al impostor que se encuentra entre la tripulación. Resuelve acertijos y tareas mientras tratas de encontrar pistas para descubrir al impostor antes de que sea demasiado tarde.', 90, 4, 8, 16, 1),
	(11, 'La sala del terror', 'Facil', 'terrrior', 'Sala de pruebas', 45, 1, 8, 18, 1);

-- Dumping structure for view bilboskpdb.salas_mas_jugadas
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `salas_mas_jugadas` (
	`idSala` INT(11) NOT NULL,
	`nombre` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`dificultad` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tematica` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`descripcion` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tiempoMax` INT(3) UNSIGNED NOT NULL COMMENT 'Minutos',
	`jugadoresMin` INT(2) UNSIGNED NOT NULL,
	`jugadoresMax` INT(2) UNSIGNED NOT NULL,
	`edad_recomendada` INT(2) UNSIGNED NOT NULL,
	`disponible` TINYINT(1) NOT NULL,
	`cantidad_partidas_jugadas` BIGINT(21) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table bilboskpdb.suscriptor
CREATE TABLE IF NOT EXISTS `suscriptor` (
  `idSuscriptor` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `fech_nac` date NOT NULL,
  `telefono` int(9) unsigned DEFAULT NULL,
  `imagen` varchar(255) NOT NULL DEFAULT 'defaults/1.png',
  `activo` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`idSuscriptor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.suscriptor: ~11 rows (approximately)
INSERT INTO `suscriptor` (`idSuscriptor`, `email`, `pass`, `alias`, `nombre`, `apellidos`, `fech_nac`, `telefono`, `imagen`, `activo`) VALUES
	(1, 'JuanjoElCamioneroExtremo@gmail.co.uk', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'JuanjoExtremo', 'Juanjo', 'Perez Agujeros', '1987-10-10', 177565252, 'defaults/1.png', 1),
	(2, 'aceitunocantero@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Aceitunito', 'Eneko', 'Figeroa Cantero', '1979-04-17', 125265112, 'defaults/1.png', 1),
	(3, 'rosamargarita@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'RosaMarg', 'Rosa', 'Margarita', '1995-02-28', 987654321, 'defaults/1.png', 1),
	(4, 'aventurasconpepe@yahoo.es', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'PepeAventuras', 'José', 'González', '1985-07-12', 741258963, 'defaults/1.png', 1),
	(5, 'exploradoraindigo@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'IndigoExplorer', 'Lucía', 'Gómez', '1998-11-05', 365874123, 'defaults/1.png', 1),
	(6, 'travesiasalvaje@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'AventureroSalva', 'Pedro', 'Ramírez', '1972-09-20', 987654789, 'defaults/1.png', 1),
	(7, 'aventurasenelamazonas@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'AmazonAdventure', 'María', 'López', '1988-03-15', 741236985, 'defaults/1.png', 1),
	(8, 'admin@bilboskp.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', 'admin', 'admin', '1999-10-09', 0, 'defaults/1.png', 1),
	(11, 'mlinares@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'mlinares', 'Mikel', 'Linares', '1983-10-10', NULL, 'defaults/1.png', 1),
	(12, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'administrador', 'Bilbo', 'SKP', '2023-10-10', 7, 'defaults/1.png', 1),
	(24, 'admin@google.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admina', 'admin', 'admine', '2023-05-02', 123, 'defaults/1.png', 1);

-- Dumping structure for view bilboskpdb.suscriptoresenpartida
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `suscriptoresenpartida` (
	`alias` VARCHAR(20) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table bilboskpdb.suscriptor_partidaonline
CREATE TABLE IF NOT EXISTS `suscriptor_partidaonline` (
  `idSuscriptor` int(11) NOT NULL,
  `idPartidaonline` int(11) NOT NULL,
  KEY `idPartida` (`idPartidaonline`) USING BTREE,
  KEY `idSuscriptor` (`idSuscriptor`),
  CONSTRAINT `FK_suscriptor_partidaonline_partidaonline` FOREIGN KEY (`idPartidaonline`) REFERENCES `partidaonline` (`idPartida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_suscriptor_partidaonline_suscriptor` FOREIGN KEY (`idSuscriptor`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.suscriptor_partidaonline: ~12 rows (approximately)
INSERT INTO `suscriptor_partidaonline` (`idSuscriptor`, `idPartidaonline`) VALUES
	(2, 1),
	(4, 13),
	(8, 1),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13),
	(4, 13);

-- Dumping structure for table bilboskpdb.tipos_puzzle
CREATE TABLE IF NOT EXISTS `tipos_puzzle` (
  `idTipo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT 'Item',
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table bilboskpdb.tipos_puzzle: ~3 rows (approximately)
INSERT INTO `tipos_puzzle` (`idTipo`, `nombre`) VALUES
	(1, 'Usar Objeto'),
	(2, 'Abrir puerta'),
	(3, 'Click objeto');

-- Dumping structure for view bilboskpdb.rankingfisico
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `rankingfisico`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `rankingfisico` AS (
	select idSala, sf.nombre as ‘sala’, nombreGrupo, puntaje, fechaInicio as  ‘fecha’ 
from partidafisica pf, salafisica sf
where pf.idSalaFisica=sf.idSala) ;

-- Dumping structure for view bilboskpdb.rankingonline
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `rankingonline`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `rankingonline` AS (
    SELECT idSala, so.nombre as 'sala jugada', nombreGrupo, puntaje , fechaInicio AS 'fecha'
    from partidaonline pao, salaonline so
    where  pao.idSalaOnline=so.idSala AND pao.visibleRanking=1 ORDER BY puntaje desc
	 ) ;

-- Dumping structure for view bilboskpdb.salas_mas_jugadas
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `salas_mas_jugadas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `salas_mas_jugadas` AS SELECT s.*, COUNT(p.idPartida) AS cantidad_partidas_jugadas FROM salaonline s LEFT JOIN partidaonline p ON s.idSala = p.idSalaOnline GROUP BY s.idSala ORDER BY cantidad_partidas_jugadas DESC ;

-- Dumping structure for view bilboskpdb.suscriptoresenpartida
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `suscriptoresenpartida`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `suscriptoresenpartida` AS (
	select alias, nombreGrupo, so.nombre, fechaInicio
	from suscriptor_partidaonline supao, suscriptor su, salaonline so, partidaonline po
    where supao.idSuscriptor=su.idSuscriptor and supao.idPartidaonline=po.idPartida and po.idSalaOnline=so.idSala) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
