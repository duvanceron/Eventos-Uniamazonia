CREATE TABLE `actividades` (
`idActividad` int(11) NOT NULL AUTO_INCREMENT,
`fkTipoActividad` int(11) NULL DEFAULT NULL,
`fkCedula` int(11) NULL DEFAULT NULL,
`fkEvento` int(11) NULL DEFAULT NULL,
`horaFecha` datetime NULL DEFAULT NULL,
`horaFechaFin` datetime NULL DEFAULT NULL,
PRIMARY KEY (`idActividad`) ,
INDEX `fkInActividades` (`fkTipoActividad` ASC) USING BTREE,
INDEX `fkCedulaInActividad` (`fkCedula` ASC) USING BTREE,
INDEX `fkEventoActividad` (`fkEvento` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 18
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `asistencia` (
`idAsistencia` int(11) NOT NULL AUTO_INCREMENT,
`fkCedulaPersonaTwo` int(11) NOT NULL,
`fkIdeventoTwo` int(11) NOT NULL,
`fecha` date NULL DEFAULT NULL,
`jornada` enum('MAÑANA','TARDE') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idAsistencia`, `fkCedulaPersonaTwo`, `fkIdeventoTwo`) ,
INDEX `fkCedulaPersonaTwoForeign` (`fkCedulaPersonaTwo` ASC) USING BTREE,
INDEX `fkIdeventoTwoForeign` (`fkIdeventoTwo` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 40
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `evento` (
`idEvento` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`fecha` date NULL DEFAULT NULL,
`fechaFin` date NULL DEFAULT NULL,
`director` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`tema` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`fkTipoEvento` int(11) NULL DEFAULT NULL,
`duracion` int(11) NULL DEFAULT NULL,
`foto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idEvento`) ,
INDEX `fktipoInEvento` (`fkTipoEvento` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 65
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `eventoprecio` (
`idEventoPrecio` int(11) NOT NULL AUTO_INCREMENT,
`fk_idEvento` int(11) NOT NULL,
`fk_idpago` int(11) NOT NULL,
`cargo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idEventoPrecio`, `fk_idEvento`, `fk_idpago`) ,
INDEX `fk_IdEvent` (`fk_idEvento` ASC) USING BTREE,
INDEX `fk_IdPayment` (`fk_idpago` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `infraestructura` (
`idInfraestructura` int(11) NOT NULL,
`tipo` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idInfraestructura`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `inscripcion` (
`fkCedulaPersona` int(11) NOT NULL,
`fkIdEvento` int(11) NOT NULL,
`pago` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`nroAsistencias` int(11) NULL DEFAULT NULL,
`certificado` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`nroRefrigerios` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`fkCedulaPersona`, `fkIdEvento`) ,
INDEX `fk_Asistencia_Persona1_idx` (`fkCedulaPersona` ASC) USING BTREE,
INDEX `fk_Asistencia_Evento1_idx` (`fkIdEvento` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `persona` (
`cedula` int(11) NOT NULL,
`primerNombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`segundoNombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`primerApellido` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`segundoApellido` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`usuario` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`passwordUser` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`tema` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`cedula`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `precio` (
`idpago` int(11) NOT NULL,
`valor` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idpago`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `recurso` (
`idRecurso` int(11) NOT NULL AUTO_INCREMENT,
`nombreRecurso` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`cantidad` int(11) NOT NULL,
PRIMARY KEY (`idRecurso`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `refrigerios` (
`idAsistencia` int(11) NOT NULL AUTO_INCREMENT,
`fkCedulaPersonaTwo` int(11) NOT NULL,
`fkIdeventoTwo` int(11) NOT NULL,
`fecha` date NULL DEFAULT NULL,
`jornada` enum('MAÑANA','TARDE') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idAsistencia`, `fkCedulaPersonaTwo`, `fkIdeventoTwo`) ,
INDEX `fkCedulaPersonaTwoForeignRefrigerio` (`fkCedulaPersonaTwo` ASC) USING BTREE,
INDEX `fkIdeventoTwoForeignRefrigerio` (`fkIdeventoTwo` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 7
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `rol` (
`idRol` int(11) NOT NULL,
`Rol` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idRol`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `rolpersona` (
`fkIdRol` int(11) NOT NULL,
`fkCedulaPersona` int(11) NOT NULL,
`descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`fkIdRol`, `fkCedulaPersona`) ,
INDEX `fk_Rol_has_Persona_Persona1_idx` (`fkCedulaPersona` ASC) USING BTREE,
INDEX `fk_Rol_has_Persona_Rol_idx` (`fkIdRol` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `rolvista` (
`IdRolVista` int(11) NOT NULL,
`FkIdVista` int(11) NOT NULL,
`FkIdMaster` int(11) NOT NULL,
`FkIdRol` int(11) NOT NULL,
PRIMARY KEY (`IdRolVista`, `FkIdVista`, `FkIdMaster`, `FkIdRol`) ,
INDEX `fk_Rol_has_Vista_Vista1_idx` (`FkIdVista` ASC, `FkIdMaster` ASC) USING BTREE,
INDEX `fk_Rol_has_Vista_Rol1_idx` (`FkIdRol` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `siteevent_recurso` (
`idsiteEvent_recurso` int(11) NOT NULL AUTO_INCREMENT,
`fkRecurso` int(11) NOT NULL,
`fkSiteEvent` int(11) NOT NULL,
`descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idsiteEvent_recurso`, `fkRecurso`, `fkSiteEvent`) ,
INDEX `fkRecurso_SiteEventRecurso` (`fkRecurso` ASC) USING BTREE,
INDEX `fkSiteEvent_SiteEventRecurso` (`fkSiteEvent` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `sitio` (
`idSitio` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`capacidad` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`direccion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idSitio`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `sitioevento` (
`idSitioEvento` int(11) NOT NULL AUTO_INCREMENT,
`fkIdSitio` int(11) NOT NULL,
`fkIdEvento` int(11) NOT NULL,
`detalle` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idSitioEvento`, `fkIdSitio`, `fkIdEvento`) ,
INDEX `fk_IdSitio` (`fkIdSitio` ASC) USING BTREE,
INDEX `fkIdEvent` (`fkIdEvento` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `sitioinfraestructura` (
`fkIdSitio` int(11) NOT NULL,
`fkIdInfraestructura` int(11) NOT NULL,
`cantidad` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`fkIdSitio`, `fkIdInfraestructura`) ,
INDEX `fk_sitio_has_infraestructura_infraestructura1_idx` (`fkIdInfraestructura` ASC) USING BTREE,
INDEX `fk_sitio_has_infraestructura_sitio1_idx` (`fkIdSitio` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `solicitudrecurso` (
`idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
`fkIdEvento` int(11) NULL DEFAULT NULL,
`descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idSolicitud`) ,
INDEX `fkSolicitudEvento` (`fkIdEvento` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `tipoactividad` (
`idTipoActividad` int(11) NOT NULL AUTO_INCREMENT,
`nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`duracion` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`idTipoActividad`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 9
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `tipoevento` (
`idTipoEvento` int(11) NOT NULL AUTO_INCREMENT,
`tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`idTipoEvento`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `vista` (
`idVista` int(11) NOT NULL,
`url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`descripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
`IdMaster` int(11) NOT NULL,
`icono` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`idVista`, `IdMaster`) ,
INDEX `fk_Vista_Vista1_idx` (`IdMaster` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 0
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;

ALTER TABLE `actividades` ADD CONSTRAINT `fkCedulaInActividad` FOREIGN KEY (`fkCedula`) REFERENCES `persona` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `actividades` ADD CONSTRAINT `fkEventoActividad` FOREIGN KEY (`fkEvento`) REFERENCES `evento` (`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `actividades` ADD CONSTRAINT `fkInActividades` FOREIGN KEY (`fkTipoActividad`) REFERENCES `tipoactividad` (`idTipoActividad`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `asistencia` ADD CONSTRAINT `fkCedulaPersonaTwoForeign` FOREIGN KEY (`fkCedulaPersonaTwo`) REFERENCES `inscripcion` (`fkCedulaPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `asistencia` ADD CONSTRAINT `fkIdeventoTwoForeign` FOREIGN KEY (`fkIdeventoTwo`) REFERENCES `inscripcion` (`fkIdEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `evento` ADD CONSTRAINT `fktipoInEvento` FOREIGN KEY (`fkTipoEvento`) REFERENCES `tipoevento` (`idTipoEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `eventoprecio` ADD CONSTRAINT `fk_IdEvent` FOREIGN KEY (`fk_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `eventoprecio` ADD CONSTRAINT `fk_IdPayment` FOREIGN KEY (`fk_idpago`) REFERENCES `precio` (`idpago`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `inscripcion` ADD CONSTRAINT `fk_Asistencia_Evento1` FOREIGN KEY (`fkIdEvento`) REFERENCES `evento` (`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `inscripcion` ADD CONSTRAINT `fk_Asistencia_Persona1` FOREIGN KEY (`fkCedulaPersona`) REFERENCES `persona` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `refrigerios` ADD CONSTRAINT `fkCedulaPersonaTwoForeignRefrigerio` FOREIGN KEY (`fkCedulaPersonaTwo`) REFERENCES `inscripcion` (`fkCedulaPersona`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `refrigerios` ADD CONSTRAINT `fkIdeventoTwoForeignRefrigerio` FOREIGN KEY (`fkIdeventoTwo`) REFERENCES `inscripcion` (`fkIdEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `rolpersona` ADD CONSTRAINT `fk_Rol_has_Persona_Persona1` FOREIGN KEY (`fkCedulaPersona`) REFERENCES `persona` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `rolpersona` ADD CONSTRAINT `fk_Rol_has_Persona_Rol` FOREIGN KEY (`fkIdRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `rolvista` ADD CONSTRAINT `fk_Rol_has_Vista_Rol1` FOREIGN KEY (`FkIdRol`) REFERENCES `rol` (`idRol`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `rolvista` ADD CONSTRAINT `fk_Rol_has_Vista_Vista1` FOREIGN KEY (`FkIdVista`, `FkIdMaster`) REFERENCES `vista` (`idVista`, `IdMaster`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `siteevent_recurso` ADD CONSTRAINT `fkRecurso_SiteEventRecurso` FOREIGN KEY (`fkRecurso`) REFERENCES `recurso` (`idRecurso`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `siteevent_recurso` ADD CONSTRAINT `fkSiteEvent_SiteEventRecurso` FOREIGN KEY (`fkSiteEvent`) REFERENCES `sitioevento` (`idSitioEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sitioevento` ADD CONSTRAINT `fkIdEvent` FOREIGN KEY (`fkIdEvento`) REFERENCES `evento` (`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sitioevento` ADD CONSTRAINT `fk_IdSitio` FOREIGN KEY (`fkIdSitio`) REFERENCES `sitio` (`idSitio`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sitioinfraestructura` ADD CONSTRAINT `fk_sitio_has_infraestructura_infraestructura1` FOREIGN KEY (`fkIdInfraestructura`) REFERENCES `infraestructura` (`idInfraestructura`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `sitioinfraestructura` ADD CONSTRAINT `fk_sitio_has_infraestructura_sitio1` FOREIGN KEY (`fkIdSitio`) REFERENCES `sitio` (`idSitio`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `solicitudrecurso` ADD CONSTRAINT `fkSolicitudEvento` FOREIGN KEY (`fkIdEvento`) REFERENCES `evento` (`idEvento`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `vista` ADD CONSTRAINT `fk_Vista_Vista1` FOREIGN KEY (`IdMaster`) REFERENCES `vista` (`idVista`) ON DELETE RESTRICT ON UPDATE RESTRICT;

