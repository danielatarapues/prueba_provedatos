-- 1. CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS provedatos_db;
USE provedatos_db;

-- 2. CONFIGURACIONES INICIALES DE SEGURIDAD
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- ------------------------------------------------------
-- 3. ESTRUCTURA DE LA TABLA `provincia`
-- (Se crea primero porque 'empleados' depende de ella)
-- ------------------------------------------------------

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre_provincia` varchar(100) DEFAULT NULL,
  `capital_provincia` varchar(100) DEFAULT NULL,
  `descripcion_provincia` text,
  `poblacion_provincia` varchar(50) DEFAULT NULL,
  `superficie_provincia` varchar(50) DEFAULT NULL,
  `latitud_provincia` varchar(50) DEFAULT NULL,
  `longitud_provincia` varchar(50) DEFAULT NULL,
  `id_region` int DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- DATOS DE `provincia`
LOCK TABLES `provincia` WRITE;
INSERT INTO `provincia` VALUES 
(1,'Azuay','Cuenca','Cuna de artes...','569.42','122.00','-2.902222','-79.005261',1),
(2,'Bolivar','Guaranda','Provincia del centro...','183 641','3254.00','-1.6','-79',1),
(3,'Cañar','Azoguez','Sitios turísticos...','33848.00','3908.00','-2.733333','-78.833333',1),
(4,'Carchi','Tulcán','Frontera norte...','82734.00','3783.00','0.811667','-77.718611',1),
(5,'Chimborazo','Riobamba','Cumbres elevadas...','223586.00','6487.00','-1.666667','-78.65',1),
(6,'Cotopaxi','Latacunga','Volcán Cotopaxi...','409 205','6569.00','-0.933333','-78.616667',1),
(7,'El Oro','Machala','Capital bananera...','260528.00','6188.00','-3.266669','-79.9667',2),
(8,'Esmeraldas','Esmeraldas','Provincia verde...','189504.00','15 954','-0.966667','-79.65',2),
(9,'Galápagos','P. Baquerizo Moreno','Reserva ecológica...','5600.00','8010.00','-0.666667','-90.55',3),
(10,'Guayas','Guayaquil','Centro comercial...','2526927.00','17139.00','-2.2','-79.9667',2),
(11,'Imbabura','Ibarra','Artesanías y cultura...','181722.00','4599.00','0.35','-78.133333',1),
(12,'Loja','Loja','Capital musical...','206.83','57.00','-3.833','-80.067',1),
(13,'Los Ríos','Babahoyo','Centro agrícola...','778115.00','6254.00','-1.766669','-79.45',2),
(14,'Manabí','Portoviejo','Costa centro-noroeste...','1369780.00','18400.00','-1.052219','-80.4506',2),
(15,'Morona Santiago','Macas','Amazonía...','147940.00','25690.00','-2.366667','-78.133333',4),
(16,'Napo','Tena','Amazonía y Andes...','103697.00','13271.00','0.989','-77.8159',4),
(17,'Orellana','F. de Orellana','Provincia nueva...','136396.00','20773.00','-0.933333','-75.666667',4),
(18,'Pastaza','Puyo','Selva amazónica...','83933.00','29520.00','-1.066667','-78.001111',4),
(19,'Pichincha','Quito','Capital del país...','2576287.00','9612.00','-0.25','-78.583333',1),
(20,'Santa Elena','Santa Elena','Provincia costera...','308693.00','3763.00','-2.2267','-80.8583',2),
(21,'Sto. Domingo Tsáchilas','Sto. Domingo','Trópico húmedo...','410937.00','4180.00','-0.333333','-79.25',2),
(22,'Sucumbios','Nueva Loja','Petróleo y paisajes...','176472.00','18612.00','-0.083333','-76.883333',4),
(23,'Tungurahua','Ambato','Sierra central...','504583.00','3334.00','-1.233333','-78.616667',1),
(24,'Zamora Chinchipe','Zamora','Amazonía sur...','91376.00','10556.00','-2.883333','-79',4);
UNLOCK TABLES;

-- ------------------------------------------------------
-- 4. ESTRUCTURA DE LA TABLA `empleados`
-- ------------------------------------------------------

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_provincia_nacimiento` int DEFAULT NULL,
  `id_provincia_laboral` int DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `sueldo` decimal(10,2) DEFAULT NULL,
  `jornada_parcial` enum('S','N') DEFAULT 'N',
  `observaciones` text,
  `foto` varchar(255) DEFAULT NULL,
  `estado` enum('1 VIGENTE','9 RETIRADO') NOT NULL DEFAULT '1 VIGENTE',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cedula` (`cedula`),
  KEY `fk_provincia_nacimiento` (`id_provincia_nacimiento`),
  KEY `fk_provincia_laboral` (`id_provincia_laboral`),
  CONSTRAINT `fk_provincia_laboral` FOREIGN KEY (`id_provincia_laboral`) REFERENCES `provincia` (`id_provincia`),
  CONSTRAINT `fk_provincia_nacimiento` FOREIGN KEY (`id_provincia_nacimiento`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4;


INSERT INTO empleados (
    nombres, apellidos, cedula, email, fecha_nacimiento, 
    id_provincia_nacimiento, id_provincia_laboral, fecha_ingreso, 
    cargo, departamento, sueldo, jornada_parcial, observaciones, foto, estado
) VALUES 
('Luis Alberto', 'Mendoza Vera', '0912345678', 'l.mendoza@empresa.ec', '1988-03-12', 10, 10, '2020-01-15', 'Gerente IT', 'Sistemas', 2500.00, 'N', 'Sin observaciones', 'foto1.jpg', '1 VIGENTE'),
('Ana Maria', 'Castro Solis', '1723456789', 'a.castro@empresa.ec', '1992-07-22', 19, 19, '2021-05-10', 'Analista Contable', 'Finanzas', 1100.00, 'N', 'Excelente desempeño', 'foto2.jpg', '1 VIGENTE'),
('Carlos Jose', 'Batallas Loor', '1314567890', 'c.batallas@empresa.ec', '1985-11-30', 14, 10, '2019-02-01', 'Vendedor', 'Ventas', 600.00, 'S', 'Retiro voluntario', 'foto3.jpg', '9 RETIRADO'),
('Diana Belen', 'Perez Ortiz', '0105678901', 'd.perez@empresa.ec', '1995-01-14', 1, 1, '2022-08-16', 'Asistente RRHH', 'Recursos Humanos', 850.00, 'N', 'Proceso de inducción', 'foto4.jpg', '1 VIGENTE'),
('Franklin Geovanny', 'Morocho Latas', '1106789012', 'f.morocho@empresa.ec', '1990-09-05', 12, 19, '2023-03-20', 'Desarrollador Fullstack', 'Sistemas', 1800.00, 'N', 'Trabajo remoto', 'foto5.jpg', '1 VIGENTE'),
('Gabriela Fernanda', 'Rivas Meza', '0707890123', 'g.rivas@empresa.ec', '1987-12-12', 7, 7, '2018-10-05', 'Jefe de Planta', 'Producción', 1950.00, 'N', 'Liquidado por reestructuración', 'foto6.jpg', '9 RETIRADO'),
('Hugo Marcelo', 'Espinoza Paz', '1808901234', 'h.espinoza@empresa.ec', '1993-04-25', 23, 19, '2024-01-08', 'Diseñador Gráfico', 'Marketing', 950.00, 'S', 'Medio tiempo', 'foto7.jpg', '1 VIGENTE'),
('Irene Valeria', 'Gomez Tello', '0809012345', 'i.gomez@empresa.ec', '1996-06-18', 8, 10, '2022-11-12', 'Recepcionista', 'Administración', 550.00, 'N', 'Atención al cliente', 'foto8.jpg', '1 VIGENTE'),
('Jorge Luis', 'Uvidia Leon', '0600123456', 'j.uvidia@empresa.ec', '1982-02-28', 6, 6, '2015-05-20', 'Supervisor Ventas', 'Ventas', 1400.00, 'N', 'Ascenso reciente', 'foto9.jpg', '1 VIGENTE'),
('Karla Janneth', 'Zambrano Cedeño', '1301234567', 'k.zambrano@empresa.ec', '1994-10-10', 14, 14, '2021-09-01', 'Cajera', 'Tesorería', 500.00, 'S', 'Renuncia por estudios', 'foto10.jpg', '9 RETIRADO'),
('Leonardo Andres', 'Mendoza Giler', '1702345678', 'l.mendoza2@empresa.ec', '1989-12-01', 19, 19, '2020-04-15', 'Arquitecto Cloud', 'Sistemas', 3200.00, 'N', 'Especialista AWS', 'foto11.jpg', '1 VIGENTE'),
('Monica Patricia', 'Salinas Ruiz', '1103456789', 'm.salinas@empresa.ec', '1991-03-30', 12, 1, '2019-11-25', 'Auditor Interno', 'Auditoría', 1650.00, 'N', 'Sin observaciones', 'foto12.jpg', '1 VIGENTE'),
('Nestor Fabian', 'Calle Saca', '0104567890', 'n.calle@empresa.ec', '1984-08-14', 1, 1, '2017-06-10', 'Operario', 'Producción', 460.00, 'N', 'Jubilación anticipada', 'foto13.jpg', '9 RETIRADO'),
('Olga Marina', 'Viteri Noboa', '1705678902', 'o.viteri@empresa.ec', '1997-05-05', 19, 19, '2023-10-01', 'Pasante', 'Legal', 400.00, 'S', 'Convenio universidad', 'foto14.jpg', '1 VIGENTE'),
('Pedro Pablo', 'Duarte Luna', '0906789012', 'p.duarte@empresa.ec', '1986-07-20', 10, 10, '2021-02-15', 'Chofer', 'Logística', 700.00, 'N', 'Licencia profesional', 'foto15.jpg', '1 VIGENTE'),
('Quintin Roberto', 'Torres Jara', '0307890123', 'q.torres@empresa.ec', '1990-01-25', 3, 10, '2022-04-04', 'Bodeguero', 'Logística', 650.00, 'N', 'Control de inventario', 'foto16.jpg', '1 VIGENTE'),
('Rosa Elena', 'Vargas Pino', '0208901234', 'r.vargas@empresa.ec', '1988-11-11', 2, 19, '2016-09-18', 'Secretaria Ejecutiva', 'Gerencia', 900.00, 'N', 'Falta disciplinaria', 'foto17.jpg', '9 RETIRADO'),
('Santiago David', 'Pinos Real', '1809012315', 's.pinos@empresa.ec', '1992-05-15', 23, 23, '2023-06-01', 'Ingeniero Civil', 'Proyectos', 2100.00, 'N', 'Proyecto Ambato', 'foto18.jpg', '1 VIGENTE'),
('Teresa de Jesus', 'Mora Loja', '1100123456', 't.mora@empresa.ec', '1995-09-09', 12, 12, '2024-02-10', 'Asistente Ventas', 'Ventas', 580.00, 'S', 'Sin observaciones', 'foto19.jpg', '1 VIGENTE'),
('Ursula Maria', 'Nieto Pozo', '0401234567', 'u.nieto@empresa.ec', '1983-12-25', 4, 4, '2014-08-20', 'Jefe RRHH', 'Recursos Humanos', 2300.00, 'N', 'Cambio de residencia', 'foto20.jpg', '9 RETIRADO'),
('Victor Hugo', 'Pazmiño Saa', '0502345678', 'v.pazmino@empresa.ec', '1991-01-01', 5, 5, '2020-03-01', 'Electricista', 'Mantenimiento', 750.00, 'N', 'Técnico certificado', 'foto21.jpg', '1 VIGENTE'),
('Wendy Johanna', 'Ramos Soliz', '0903456789', 'w.ramos@empresa.ec', '1994-06-14', 10, 10, '2022-07-20', 'Analista de Riesgos', 'Crédito', 1350.00, 'N', 'Sin observaciones', 'foto22.jpg', '1 VIGENTE'),
('Xavier Andres', 'Toledo Masa', '1104567890', 'x.toledo@empresa.ec', '1987-04-18', 12, 19, '2023-01-15', 'DBA', 'Sistemas', 2800.00, 'N', 'Especialista Oracle/MySQL', 'foto23.jpg', '1 VIGENTE'),
('Yolanda Beatriz', 'Vinueza G.', '1705678901', 'y.vinueza@empresa.ec', '1980-08-22', 19, 19, '2010-02-10', 'Directora Financiera', 'Finanzas', 4500.00, 'N', 'Socio fundador', 'foto24.jpg', '1 VIGENTE'),
('Zulay Estefania', 'Aguilar Q.', '0706789012', 'z.aguilar@empresa.ec', '1996-03-03', 7, 7, '2021-12-01', 'Vendedora Junior', 'Ventas', 450.00, 'S', 'Bajo rendimiento', 'foto25.jpg', '9 RETIRADO'),
('Angel Miguel', 'Rojas Torres', '1907890123', 'a.rojas@empresa.ec', '1993-11-20', 19, 19, '2022-05-15', 'Soporte Técnico', 'Sistemas', 800.00, 'N', 'Sin observaciones', 'foto26.jpg', '1 VIGENTE'),
('Beatriz Helena', 'Luna Solis', '2008901234', 'b.luna@empresa.ec', '1992-02-14', 20, 10, '2023-09-10', 'Analista Químico', 'Calidad', 1200.00, 'N', 'Sede Santa Elena', 'foto27.jpg', '1 VIGENTE'),
('Cesar Augusto', 'Moya Ruiz', '1809012345', 'c.moya@empresa.ec', '1985-05-05', 23, 23, '2019-01-20', 'Mecánico', 'Mantenimiento', 850.00, 'N', 'Terminación de contrato', 'foto28.jpg', '9 RETIRADO'),
('Doris Amanda', 'Vega Leon', '0100123456', 'd.vega@empresa.ec', '1998-10-30', 1, 1, '2024-03-01', 'Asistente Social', 'Bienestar', 950.00, 'N', 'Nueva contratación', 'foto29.jpg', '1 VIGENTE'),
('Esteban Raul', 'Guevara P.', '1701234567', 'e.guevara@empresa.ec', '1989-07-07', 19, 19, '2018-06-15', 'Abogado', 'Legal', 2000.00, 'N', 'Sin observaciones', 'foto30.jpg', '1 VIGENTE');

-- 5. RESTAURAR CONFIGURACIONES
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;