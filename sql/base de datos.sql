--
-- Estructura de tabla para la tabla `dbusuarios`
--

CREATE TABLE IF NOT EXISTS `dbusuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `refroles` int(11) NOT NULL,
  `refgrupos` int(11) NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apodo` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_dbusuarios_tbroles1_idx` (`refroles`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `idfoto` int(11) NOT NULL AUTO_INCREMENT,
  `refproyecto` int(11) NOT NULL,
  `reftabla` int(11) NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `principal` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idfoto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `predio_menu`
--

CREATE TABLE IF NOT EXISTS `predio_menu` (
  `idmenu` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(65) CHARACTER SET utf8 NOT NULL,
  `icono` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Orden` smallint(6) DEFAULT NULL,
  `hover` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `permiso` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `administracion` bit(1) DEFAULT NULL,
  `torneo` bit(1) DEFAULT NULL,
  `reportes` bit(1) DEFAULT NULL,
  PRIMARY KEY (`idmenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `tbgrupos`
--

CREATE TABLE IF NOT EXISTS `tbgrupos` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(130) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idgrupo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `tbgrupousuarios`
--

CREATE TABLE IF NOT EXISTS `tbgrupousuarios` (
  `idgrupousuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(130) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idgrupousuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `tbestadospartidos`
--

CREATE TABLE IF NOT EXISTS `tbestadospartidos` (
  `idestadopartido` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(120) NOT NULL,
  `defautomatica` bit(1) NOT NULL,
  `goleslocalauto` int(11) NOT NULL,
  `goleslocalborra` bit(1) NOT NULL,
  `golesvisitanteauto` int(11) NOT NULL,
  `golesvisitanteborra` bit(1) NOT NULL,
  `puntoslocal` int(11) NOT NULL,
  `puntosvisitante` int(11) NOT NULL,
  `finalizado` bit(1) NOT NULL,
  `ocultardetallepublico` bit(1) NOT NULL,
  PRIMARY KEY (`idestadopartido`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `dbequipos`
--

CREATE TABLE IF NOT EXISTS `dbequipos` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `abreviacion` varchar(3) NOT NULL,
  PRIMARY KEY (`idequipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `dbequipos`
--

CREATE TABLE IF NOT EXISTS `dbequipos` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `abreviacion` varchar(3) NOT NULL,
  PRIMARY KEY (`idequipo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


CREATE TABLE IF NOT EXISTS `tbetapas` (
  `idetapa` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(11) NOT NULL,
  PRIMARY KEY (`idetapa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `tbetapas`
--

INSERT INTO `tbetapas` (`idetapa`, `descripcion`, `valor`) VALUES
(1, 'Pre-PlayOff', 32),
(2, 'PlayOff', 32),
(3, 'Octavos', 16),
(4, 'Cuartos', 8),
(5, 'SemiFinal', 4),
(6, 'Tercer', 2),
(7, 'Final', 2);




--
-- Estructura de tabla para la tabla `dbpartidos`
--

CREATE TABLE IF NOT EXISTS `dbfixture` (
  `idfixture` int(11) NOT NULL AUTO_INCREMENT,
  `estadio` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(5) NOT NULL,
  `equipolocal` int NOT NULL,
  `equipovisitante` int NOT NULL,
  `goleslocal` int NOT NULL,
  `golesvisitante` int NOT NULL,
  `penaleslocal` int NOT NULL,
  `penalesvisitante` int NOT NULL,
  `marcadorfinallocal` int NOT NULL,
  `marcadorfinalvisitante` int NOT NULL,
  `refestadospartidos` int NOT NULL,
  `refetapa` int NOT NULL,
  `refgrupo` int NOT NULL,
  PRIMARY KEY (`idfixture`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


--
-- Estructura de tabla para la tabla `dbapuestas`
--

CREATE TABLE IF NOT EXISTS `dbapuestas` (
  `idapuesta` int(11) NOT NULL AUTO_INCREMENT,
  `reffixture` int NOT NULL,
  `refgrupousuarios` int NOT NULL,
  `refusuarios` int NOT NULL,
  `marcadorfinallocal` int NOT NULL DEFAULT 0,
  `marcadorfinalvisitante` int NOT NULL DEFAULT 0,
  `refestadospartidos` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`idapuesta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;



--
-- Estructura de tabla para la tabla `dbsistemaapuestas`
--

CREATE TABLE IF NOT EXISTS `dbsistemaapuestas` (
  `idsistemaapuesta` int(11) NOT NULL AUTO_INCREMENT,
  `congoleslocal` bit(1) NOT NULL,
  `congolesvisitante` bit(1) NOT NULL,
  `conestadopartidos` bit(1) NOT NULL,
  `refetapas` int NOT NULL DEFAULT 0,
  `puntos` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`idsistemaapuesta`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;
