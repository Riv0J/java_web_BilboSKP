-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bilboskpdb
CREATE DATABASE IF NOT EXISTS `bilboskpdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bilboskpdb`;

-- Volcando estructura para tabla bilboskpdb.cupon
CREATE TABLE IF NOT EXISTS `cupon` (
  `idCupon` int(11) NOT NULL AUTO_INCREMENT,
  `idSuscriptor` int(11) NOT NULL,
  `fechaCaducidad` datetime NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Disponible',
  `reembolsable` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCupon`) USING BTREE,
  KEY `fk_cupon_suscriptor` (`idSuscriptor`),
  CONSTRAINT `fk_cupon_suscriptor` FOREIGN KEY (`idSuscriptor`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.cupon: ~11 rows (aproximadamente)
DELETE FROM `cupon`;
INSERT INTO `cupon` (`idCupon`, `idSuscriptor`, `fechaCaducidad`, `estado`, `reembolsable`) VALUES
	(1, 2, '2023-04-30 00:00:00', 'Disponible', 1),
	(2, 1, '2023-02-03 00:00:00', 'Caducado', 1),
	(3, 3, '2023-04-30 00:00:00', 'Gastado', 1),
	(5, 8, '2023-06-08 00:00:00', 'Disponible', 1),
	(6, 8, '2023-06-09 00:00:00', 'Disponible', 1),
	(7, 8, '2023-06-06 00:00:00', 'Disponible', 1),
	(8, 8, '2023-06-09 00:00:00', 'Disponible', 1),
	(9, 8, '2023-02-09 00:00:00', 'Caducado', 1),
	(11, 4, '2077-12-31 00:00:00', 'Disponible', 0),
	(12, 4, '2077-12-31 00:00:00', 'Disponible', 0),
	(13, 4, '2023-05-18 00:00:00', 'Disponible', 0);

-- Volcando estructura para tabla bilboskpdb.escenario
CREATE TABLE IF NOT EXISTS `escenario` (
  `nombreEscenario` varchar(50) NOT NULL,
  `idSala` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`nombreEscenario`) USING BTREE,
  KEY `idSala` (`idSala`),
  CONSTRAINT `escenario_ibfk_1` FOREIGN KEY (`idSala`) REFERENCES `salaonline` (`idSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.escenario: ~18 rows (aproximadamente)
DELETE FROM `escenario`;
INSERT INTO `escenario` (`nombreEscenario`, `idSala`, `descripcion`, `imagen`) VALUES
	('AlmacenCajaAbierta', 1, '¿Qué puede haber en esa caja fuerte?', 'almacenCajaAbierta.png'),
	('AlmacenCajaCerrada', 1, '¿Qué puede haber en esa caja fuerte?', 'almacenCajaCerrada.png'),
	('CajaFuerte', 1, '¿Eso es una caja fuerte? ¿Se puede abrir con esos botones?', 'cajaFuerte.png'),
	('CampanarioAbajo', 1, 'Esta es una sala bien espaciosa, hay un campanario ahí arriba.', 'campanarioAbajo.png'),
	('CampanarioArriba', 1, '¿Podré ver el exterior desde aquí?', 'campanarioArriba.png'),
	('ConfesionarioAbierto', 1, 'Parece ser el antiguo confesionario de la iglesia', 'confesionarioAbierto.png'),
	('ConfesionarioCerrado', 1, 'Parece ser el antiguo confesionario de la iglesia', 'confesionarioCerrado.png'),
	('Cripta', 1, 'Parece ser que los sectarios se reunirán aquí', 'cripta.png'),
	('CriptaPeriodico', 1, 'Este periódico depicta personas desaparecidas', 'criptaPeriodico.png'),
	('Cuarto Oscuro', 1, 'Está muy oscuro. Hay una rendija casi al nivel del suelo.', 'cuartoOscuro.png'),
	('Despacho', 1, '¿¿Cómo?? ¿Como es posible que haya una oficina en estas ruinas? Alguien debe habitar este lugar.', 'Despacho.png'),
	('Dormitorio', 1, 'Qué hacía yo en un dormitorio?', 'dormitorio.png'),
	('Entrada', 1, 'Esta sala tiene unas rocas que bloquean la puerta. Talvez pueda moverlas con algo.', 'entrada.png'),
	('FinBueno', 1, 'Has destruido el lugar sectario y salido ileso del lugar. Aún no sabes que te dejó inconsciente, pero te dispones a llamar a las autoridades.', 'finBueno.png'),
	('FinMalo', 1, 'Has activado el explosivo y la estructura ha colapsado sobre ti, parece que no has podido salir de esta.', 'finMalo.png'),
	('Nave', 1, 'Increible pensar que este era un lugar de culto, antes...', 'nave.png'),
	('Nota', 1, 'Creo que esta nota indica que hoy había una reunión sectaria en este lugar.', 'nota.png'),
	('Pasillo', 1, 'Alto pasillo bro', 'pasillo.png');

-- Volcando estructura para tabla bilboskpdb.escenario_flecha
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.escenario_flecha: ~19 rows (aproximadamente)
DELETE FROM `escenario_flecha`;
INSERT INTO `escenario_flecha` (`idObjeto`, `nombreEscenario`, `nombreEscenarioDestino`, `imagen`, `posicionX`, `posicionY`, `dimensionX`, `dimensionY`, `comentario`, `mensajeError`) VALUES
	(0, 'Dormitorio', 'ConfesionarioCerrado', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'ConfesionarioCerrado', 'Dormitorio', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'ConfesionarioCerrado', 'Entrada', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Nave', 'Entrada', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'Nave', 'Entrada', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Entrada', 'Nave', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Nave', 'Pasillo', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Pasillo', 'Nave', 'abajo', 30, 30, 10, 5, NULL, NULL),
	(0, 'Entrada', 'ConfesionarioCerrado', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'Pasillo', 'CampanarioAbajo', 'arriba', 40, 45, 10, 5, NULL, NULL),
	(0, 'Pasillo', 'Cuarto Oscuro', 'derecha', 55, 45, 5, 10, NULL, NULL),
	(0, 'Pasillo', 'AlmacenCajaCerrada', 'derecha', 70, 45, 5, 10, NULL, NULL),
	(0, 'Pasillo', 'Despacho', 'derecha', 85, 45, 5, 10, NULL, NULL),
	(0, 'Despacho', 'Pasillo', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'AlmacenCajaCerrada', 'Pasillo', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'Cuarto Oscuro', 'Pasillo', 'izquierda', 5, 50, 5, 10, NULL, NULL),
	(0, 'CampanarioAbajo', 'Pasillo', 'derecha', 85, 50, 5, 10, NULL, NULL),
	(0, 'CampanarioAbajo', 'CampanarioArriba', 'arriba', 50, 60, 10, 5, NULL, NULL),
	(0, 'CampanarioArriba', 'CampanarioAbajo', 'abajo', 35, 30, 10, 5, NULL, NULL);

-- Volcando estructura para tabla bilboskpdb.escenario_intercambio
CREATE TABLE IF NOT EXISTS `escenario_intercambio` (
  `idObjeto` int(11) DEFAULT NULL,
  KEY `FK_escenario_intercambio_objeto` (`idObjeto`),
  CONSTRAINT `FK_escenario_intercambio_objeto` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.escenario_intercambio: ~2 rows (aproximadamente)
DELETE FROM `escenario_intercambio`;
INSERT INTO `escenario_intercambio` (`idObjeto`) VALUES
	(1),
	(1);

-- Volcando estructura para tabla bilboskpdb.horario
CREATE TABLE IF NOT EXISTS `horario` (
  `idSalaFisica` int(6) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `disponible` tinyint(4) NOT NULL DEFAULT 1,
  KEY `idSalaFisica` (`idSalaFisica`),
  CONSTRAINT `FK__salafisica` FOREIGN KEY (`idSalaFisica`) REFERENCES `salafisica` (`idSala`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.horario: ~15 rows (aproximadamente)
DELETE FROM `horario`;
INSERT INTO `horario` (`idSalaFisica`, `fechaHora`, `disponible`) VALUES
	(1, '2023-04-10 09:00:00', 1),
	(1, '2023-04-10 10:30:00', 1),
	(1, '2023-04-10 12:00:00', 1),
	(1, '2023-04-11 14:00:00', 1),
	(1, '2023-04-11 16:00:00', 1),
	(1, '2023-04-11 18:00:00', 1),
	(1, '2023-04-12 10:00:00', 1),
	(1, '2023-04-12 12:00:00', 1),
	(1, '2023-04-12 14:00:00', 1),
	(1, '2023-04-13 09:30:00', 1),
	(1, '2023-04-13 11:00:00', 1),
	(1, '2023-04-13 13:00:00', 1),
	(1, '2023-04-14 15:00:00', 1),
	(1, '2023-04-14 17:00:00', 1),
	(1, '2023-04-14 19:00:00', 1);

-- Volcando estructura para tabla bilboskpdb.objeto
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.objeto: ~14 rows (aproximadamente)
DELETE FROM `objeto`;
INSERT INTO `objeto` (`idObjeto`, `nombreEscenario`, `nombre`, `idObjetoADesbloquear`, `descripcion`, `imagen`, `visibleInicio`, `visibleInventario`, `desapareceAlUsar`, `dimensionX`, `dimenxionY`, `posicionX`, `posicionY`) VALUES
	(1, 'CampanarioAbajo', 'Llave dorada', NULL, 'Esta llave parece vieja, deberían poder abrir una de las antiguas puertas de este lugar', 'llaveDorada.png', 0, 1, 1, 0, 0, 0, 0),
	(2, 'Dormitorio', 'Rosa roja', NULL, 'Una bonita rosa, es como si hubiera estado aquí mucho tiempo, pero no parece haberse marchitado', 'rosa.png', 1, 1, 1, 0, 0, 0, 0),
	(3, 'Despacho', 'Aguja minutero', NULL, 'Un Minutero, esto sin duda debe servir para desbloquear algo…', 'minutero.png', 1, 1, 1, 10, 25, 30, 40),
	(4, 'Nave', 'Aguja segundero', NULL, 'El Segundero, todo reloj debe tener siempre dos manijas', 'segundero.png', 1, 1, 1, 0, 0, 0, 0),
	(5, 'Cripta', 'Explosivo', NULL, '¿Esto es una bomba? Estaré loco pero si uso esto, fijo salgo de aquí, vivo o muerto...', 'explosivo.png', 1, 1, 1, 0, 0, 0, 0),
	(6, 'Despacho', 'Maquina de humo', NULL, 'Una maquina de humo.', 'maquinaHumo.png', 1, 1, 1, 0, 0, 0, 0),
	(7, 'AlmacenCajaAbierta', 'Llave plateada', NULL, 'Llave plateada casi intacta. Tiene un estilo antiguo particular pero parece moderna.', 'llavePlateada.png', 1, 1, 1, 0, 0, 0, 0),
	(8, 'ConfesionarioCerrado', 'PuertaConfesionario', NULL, 'Está cerrada.', '\r\n', 1, 0, 0, 0, 0, 0, 0),
	(9, 'Dormitorio', 'JudasCama', 9, 'Qué extraño muñeco, ¿qué podría hacer aquí?', 'judasCama.png', 1, 0, 1, 0, 0, 15, 20),
	(10, 'CampanarioAbajo', 'Nota', NULL, 'Una nota vieja. Creo que es sobre una reunión de la secta a esta hora, no dice una fecha específica, pero estoy seguro que debe ser en este lugar.', 'nota.png', 1, 1, 0, 0, 0, 0, 0),
	(11, 'Cripta', 'Periodico', NULL, 'Vaya, un periodico ¿Que dira?', 'periodico.png', 1, 1, 0, 0, 0, 0, 0),
	(12, 'CampanarioAbajo', 'CuerdaAbajo', NULL, 'Creo que deberia mirar a donde lleva esta cuerda.', 'cuerdaAbajo.png', 1, 0, 1, 0, 0, 0, 0),
	(13, 'CampanarioArriba', 'CuerdaArriba', 1, 'Creo que deberia mirar a donde lleva esta cuerda.', 'cuerdaArriba.png', 1, 0, 1, 0, 0, 0, 0),
	(14, 'CampanarioAbajo', 'CuerdaSuelo', NULL, 'Creo que no me servirá de nada', 'cuerdaSuelo.png', 0, 0, 1, 0, 0, 0, 0);

-- Volcando estructura para tabla bilboskpdb.partidafisica
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.partidafisica: ~3 rows (aproximadamente)
DELETE FROM `partidafisica`;
INSERT INTO `partidafisica` (`idPartida`, `idReserva`, `idSalaFisica`, `puntaje`, `numeroJugadores`, `nombreGrupo`, `fechaInicio`, `fechaFin`) VALUES
	(1, 1, 1, 2000, '6', 'Los exploradores', '2023-04-09 10:00:00', '2023-04-09 09:25:00'),
	(2, 2, 1, 1000, '8', 'Los Mosqueteros', '2023-04-10 14:59:00', '2023-04-09 13:37:00'),
	(3, 3, 1, 1500, '4', 'La banda', '2023-04-14 15:00:00', '2023-04-09 14:25:00');

-- Volcando estructura para tabla bilboskpdb.partidaonline
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.partidaonline: ~20 rows (aproximadamente)
DELETE FROM `partidaonline`;
INSERT INTO `partidaonline` (`idPartida`, `idSalaOnline`, `idAnfitrion`, `puntaje`, `numeroJugadores`, `nombreGrupo`, `fechaInicio`, `fechaFin`, `visibleRanking`) VALUES
	(1, 2, 1, 2000, '6', 'Los mosqueteros', '2023-04-09 22:51:02', '2023-04-09 23:51:04', 1),
	(2, 1, 1, 1800, '3', 'Los mosqueteros', '2023-04-09 22:51:02', '2023-04-09 23:51:04', 1),
	(3, 3, 5, 1700, '2', 'Los solitarios', '2023-04-13 12:00:00', '2023-04-13 13:45:00', 1),
	(6, 2, 3, 1400, '5', 'Los aventureros', '2023-04-09 15:30:00', '2023-04-09 17:45:00', 1),
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
	(23, 1, 12, 0, '4', 'PRESTOS', '2023-04-18 00:00:00', '2023-04-18 00:00:00', 1);

-- Volcando estructura para tabla bilboskpdb.pista
CREATE TABLE IF NOT EXISTS `pista` (
  `idPista` int(11) NOT NULL AUTO_INCREMENT,
  `idPuzzle` int(11) NOT NULL DEFAULT 0,
  `descripcion` varchar(255) NOT NULL,
  `penalizacion` int(4) DEFAULT NULL,
  PRIMARY KEY (`idPista`),
  KEY `Índice 2` (`idPuzzle`),
  CONSTRAINT `FK_pista_puzzle` FOREIGN KEY (`idPuzzle`) REFERENCES `puzzle` (`idPuzzle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.pista: ~5 rows (aproximadamente)
DELETE FROM `pista`;
INSERT INTO `pista` (`idPista`, `idPuzzle`, `descripcion`, `penalizacion`) VALUES
	(1, 1, 'Tal vez debas hacer la misma combinacion que muestra en la pantalla', 200),
	(2, 1, 'El reloj ese le faltan manecillas. Igual tiene que ver con la nota', 200),
	(3, 1, 'Que pasaria si le das a la campana', 200),
	(4, 1, 'Se dicen que este tipo de rosas se utilizan como un ingrediente de la anestesia', 200),
	(5, 1, 'La bomba nos puede servir para abrir aquella puerta de la entrada', 300);

-- Volcando estructura para tabla bilboskpdb.puzzle
CREATE TABLE IF NOT EXISTS `puzzle` (
  `idPuzzle` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `puntuacion` int(4) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`idPuzzle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.puzzle: ~1 rows (aproximadamente)
DELETE FROM `puzzle`;
INSERT INTO `puzzle` (`idPuzzle`, `descripcion`, `puntuacion`, `tipo`) VALUES
	(1, '', 0, 'Combinar');

-- Volcando estructura para tabla bilboskpdb.puzzle_objeto
CREATE TABLE IF NOT EXISTS `puzzle_objeto` (
  `idPuzzle` int(11) NOT NULL DEFAULT 0,
  `idObjeto` int(11) NOT NULL DEFAULT 0,
  KEY `FK_requerimiento_objeto` (`idObjeto`),
  KEY `FK_requerimiento_puzzle` (`idPuzzle`),
  CONSTRAINT `FK_requerimiento_objeto` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_requerimiento_puzzle` FOREIGN KEY (`idPuzzle`) REFERENCES `puzzle` (`idPuzzle`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.puzzle_objeto: ~0 rows (aproximadamente)
DELETE FROM `puzzle_objeto`;

-- Volcando estructura para vista bilboskpdb.rankingfisico
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `rankingfisico` (
	`idSala` INT(11) NOT NULL,
	`‘sala’` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`puntaje` INT(11) NOT NULL,
	`‘fecha’` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista bilboskpdb.rankingonline
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `rankingonline` (
	`idSala` INT(11) NOT NULL,
	`sala jugada` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`puntaje` INT(11) NOT NULL,
	`fecha` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla bilboskpdb.reserva
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.reserva: ~3 rows (aproximadamente)
DELETE FROM `reserva`;
INSERT INTO `reserva` (`idReserva`, `idSuscriptor`, `idSalaFisica`, `numJugadores`, `fechaHora`, `estado`) VALUES
	(1, 11, 1, 6, '2023-05-30 10:00:00', 1),
	(2, 8, 1, 8, '2023-05-30 12:00:00', 1),
	(3, 1, 1, 6, '2023-06-03 15:00:00', 1);

-- Volcando estructura para tabla bilboskpdb.salafisica
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.salafisica: ~2 rows (aproximadamente)
DELETE FROM `salafisica`;
INSERT INTO `salafisica` (`idSala`, `nombre`, `dificultad`, `tematica`, `descripcion`, `tiempoMax`, `jugadoresMin`, `jugadoresMax`, `edad_recomendada`, `direccion`, `telefono`) VALUES
	(1, 'Misterio en la mansión', 'Media', 'Misterio', 'Investiga una mansión abandonada y resuelve los enigmas que esconde su oscuro pasado.', 60, 6, 8, 18, 'Calle Mayor 25', 987654321),
	(2, 'Escape de ciudad 17', 'Difícil', 'Suspenso\r\n', 'Te has despertado encerrado en una prisión de máxima seguridad sin recordar cómo llegaste allí. Deberás trabajar en equipo para encontrar la forma de escapar antes de que los guardias descubran tu plan.', 90, 6, 8, 18, 'Avenida de la Libertad 10', 123456789);

-- Volcando estructura para tabla bilboskpdb.salaonline
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
  PRIMARY KEY (`idSala`) USING BTREE,
  CONSTRAINT `jugadoresMax` CHECK (`jugadoresMax` >= 1),
  CONSTRAINT `jugadoresMin` CHECK (`jugadoresMin` <= `jugadoresMax` and `jugadoresMin` >= 1)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.salaonline: ~6 rows (aproximadamente)
DELETE FROM `salaonline`;
INSERT INTO `salaonline` (`idSala`, `nombre`, `dificultad`, `tematica`, `descripcion`, `tiempoMax`, `jugadoresMin`, `jugadoresMax`, `edad_recomendada`) VALUES
	(1, 'Perdidos de la mano de Dios', 'Media', 'Terror', 'Vas de camino en medio del bosque, donde eres abducido por un loco perteneciente a una secta. Te das cuenta que ahora estás en un bosque, perdido de la mano de Dios…', 90, 1, 8, 16),
	(2, 'El Gimnasio Infernal', 'Difícil', 'Fitness', 'En un gimnasio de élite, un grupo de crossfiteros debe luchar contra una conspiración interna, encontrar al impostor entre ellos y superar pruebas físicas y mentales para escapar antes de que sea muy tarde.', 60, 3, 8, 18),
	(3, 'Hasta la luz del alba', 'Fácil', 'Misterio', 'Un grupo de amigos se encuentran la escena de una cabaña abandonada en el medio del bosque, curiosamente encuentran pistas sobre los que solían habitarla, y la tragedia que les precedió. Terminan siendo víctima de algo más allá de la comprensión humana.', 30, 2, 8, 18),
	(5, 'El museo maldito', 'Difícil', 'Terror', 'Un grupo de investigadores debe resolver el misterio detrás de una serie de extraños sucesos en un museo abandonado. Descubrirán que el lugar está maldito y tendrán que enfrentarse a las fuerzas sobrenaturales para sobrevivir.', 90, 3, 8, 18),
	(9, 'El asesino del ajedrez', 'Fácil', 'Misterio', 'En un torneo de ajedrez de élite, uno de los jugadores es encontrado muerto en su habitación de hotel. El resto de los participantes deberán resolver el crimen antes de que el asesino ataque de nuevo.', 45, 4, 8, 16),
	(10, 'Traición en el espacio', 'Difícil', 'Sci-fi', 'Eres un tripulante de una nave espacial y tienes la misión de descubrir al impostor que se encuentra entre la tripulación. Resuelve acertijos y tareas mientras tratas de encontrar pistas para descubrir al impostor antes de que sea demasiado tarde.', 90, 4, 8, 16);

-- Volcando estructura para tabla bilboskpdb.suscriptor
CREATE TABLE IF NOT EXISTS `suscriptor` (
  `idSuscriptor` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(64) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `fech_nac` date NOT NULL,
  `telefono` int(9) unsigned DEFAULT NULL,
  `imagen` varchar(255) NOT NULL DEFAULT 'avatardefault1.png',
  `activo` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`idSuscriptor`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.suscriptor: ~10 rows (aproximadamente)
DELETE FROM `suscriptor`;
INSERT INTO `suscriptor` (`idSuscriptor`, `email`, `pass`, `alias`, `nombre`, `apellidos`, `fech_nac`, `telefono`, `imagen`, `activo`) VALUES
	(1, 'JuanjoElCamioneroExtremo@gmail.co.uk', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'JuanjoExtremo', 'Juanjo', 'Perez Agujeros', '1987-10-10', 177565252, 'avatardefault1.png', 1),
	(2, 'aceitunocantero@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Aceitunito', 'Eneko', 'Figeroa Cantero', '1979-04-17', 125265112, 'avatardefault1.png', 1),
	(3, 'rosamargarita@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'RosaMarg', 'Rosa', 'Margarita', '1995-02-28', 987654321, 'avatardefault1.png', 1),
	(4, 'aventurasconpepe@yahoo.es', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'PepeAventuras', 'José', 'González', '1985-07-12', 741258963, 'avatardefault1.png', 1),
	(5, 'exploradoraindigo@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'IndigoExplorer', 'Lucía', 'Gómez', '1998-11-05', 365874123, 'avatardefault1.png', 1),
	(6, 'travesiasalvaje@hotmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'AventureroSalvaje', 'Pedro', 'Ramírez', '1972-09-20', 987654789, 'avatardefault1.png', 1),
	(7, 'aventurasenelamazonas@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'AmazonAdventurer', 'María', 'López', '1988-03-15', 741236985, 'avatardefault1.png', 1),
	(8, 'admin@bilboskp.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'admin', 'admin', 'admin', '1999-10-09', 0, 'avatardefault1.png', 1),
	(11, 'mlinares@gmail.com', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'mlinares', 'Mikel', 'Linares', '1983-10-10', NULL, 'avatardefault1.png', 1),
	(12, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'administrador', 'Bilbo', 'SKP', '2023-10-10', 7, 'avatardefault1.png', 1);

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `suscriptoresenpartida` (
	`alias` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida2
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `suscriptoresenpartida2` (
	`alias` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida3
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `suscriptoresenpartida3` (
	`alias` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombreGrupo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`nombre` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`fechaInicio` DATETIME NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida4
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `suscriptoresenpartida4` (
	`alias` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para tabla bilboskpdb.suscriptor_partidaonline
CREATE TABLE IF NOT EXISTS `suscriptor_partidaonline` (
  `idSuscriptor` int(11) NOT NULL,
  `idPartidaonline` int(11) NOT NULL,
  KEY `idPartida` (`idPartidaonline`) USING BTREE,
  KEY `idSuscriptor` (`idSuscriptor`),
  CONSTRAINT `FK_suscriptor_partidaonline_partidaonline` FOREIGN KEY (`idPartidaonline`) REFERENCES `partidaonline` (`idPartida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_suscriptor_partidaonline_suscriptor` FOREIGN KEY (`idSuscriptor`) REFERENCES `suscriptor` (`idSuscriptor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.suscriptor_partidaonline: ~12 rows (aproximadamente)
DELETE FROM `suscriptor_partidaonline`;
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

-- Volcando estructura para tabla bilboskpdb.tipos_puzzle
CREATE TABLE IF NOT EXISTS `tipos_puzzle` (
  `idTipo` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT 'Item',
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla bilboskpdb.tipos_puzzle: ~3 rows (aproximadamente)
DELETE FROM `tipos_puzzle`;
INSERT INTO `tipos_puzzle` (`idTipo`, `nombre`) VALUES
	(1, 'Usar Objeto'),
	(2, 'Abrir puerta'),
	(3, 'Click objeto');

-- Volcando estructura para vista bilboskpdb.rankingfisico
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `rankingfisico`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `rankingfisico` AS (
	select idSala, sf.nombre as ‘sala’, nombreGrupo, puntaje, fechaInicio as  ‘fecha’ 
from partidafisica pf, salafisica sf
where pf.idSalaFisica=sf.idSala) ;

-- Volcando estructura para vista bilboskpdb.rankingonline
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `rankingonline`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `rankingonline` AS (
    SELECT idSala, so.nombre as 'sala jugada', nombreGrupo, puntaje , fechaInicio AS 'fecha'
    from partidaonline pao, salaonline so
    where  pao.idSalaOnline=so.idSala AND pao.visibleRanking=1 ORDER BY puntaje desc
	 ) ;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `suscriptoresenpartida`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `suscriptoresenpartida` AS (
	select alias, nombreGrupo, so.nombre, fechaInicio
	from suscriptor_partidaonline supao, suscriptor su, salaonline so, partidaonline po
    where supao.idSuscriptor=su.idSuscriptor and supao.idPartidaonline=po.idPartida and po.idSalaOnline=so.idSala) ;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida2
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `suscriptoresenpartida2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `suscriptoresenpartida2` AS (
    select alias, nombreGrupo, so.nombre, fechaInicio
    from suscriptor_partidaonline supao, suscriptor su, salaonline so, partidaonline po
	where supao.idSuscriptor=su.idSuscriptor and supao.idPartidaonline=po.idPartida and su.idSuscriptor=po.idAnfitrion and po.idSalaOnline=so.idSala) ;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida3
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `suscriptoresenpartida3`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `suscriptoresenpartida3` AS (
    select alias, nombreGrupo, so.nombre, fechaInicio
    from suscriptor_partidaonline supao, suscriptor su, salaonline so, partidaonline po
	where supao.idPartidaonline=po.idPartida and po.idSalaOnline=so.idSala) ;

-- Volcando estructura para vista bilboskpdb.suscriptoresenpartida4
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `suscriptoresenpartida4`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `suscriptoresenpartida4` AS (
    select alias
    from suscriptor_partidaonline supao, suscriptor su
    where supao.idSuscriptor=su.idSuscriptor) ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
