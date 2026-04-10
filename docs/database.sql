-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: provedatos_db
-- ------------------------------------------------------
-- Server version	9.0.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Juan Carlos','Pérez Armijos','1712345678','juan.perez@empresa.com','1985-05-15',19,19,'2023-01-10','Analista de Sistemas','Tecnología',1250.00,'N','Empleado fundador del área','uploads/1712345678_edit_1775798566.png','1 VIGENTE'),(2,'María Elena','Guerrero Mendoza','0923456781','m.guerrero@empresa.com','1992-08-22',10,10,'2022-03-15','Contadora','Finanzas',1100.50,'N','Reingreso a la compañía','maria_g.png','9 RETIRADO'),(3,'Daniela Paola','Tarapues Rosero','1728184837','daniela.tarapues232@gmail.com','2004-11-23',13,14,'2026-04-18','DESARROLLADORA','MARKETING',800.00,'S','ddffdvff','uploads/1728184837_1775798621.jpg','1 VIGENTE'),(94,'Luis Alberto','Mendoza Vera','0912345678','l.mendoza@empresa.ec','1988-03-12',10,10,'2020-01-15','Gerente IT','Sistemas',2500.00,'N','Sin observaciones','foto1.jpg','1 VIGENTE'),(95,'Ana Maria','Castro Solis','1723456789','a.castro@empresa.ec','1992-07-22',19,19,'2021-05-10','Analista Contable','Finanzas',1100.00,'N','Excelente desempeño','foto2.jpg','1 VIGENTE'),(96,'Carlos Jose','Batallas Loor','1314567890','c.batallas@empresa.ec','1985-11-30',14,10,'2019-02-01','Vendedor','Ventas',600.00,'S','Retiro voluntario','foto3.jpg','9 RETIRADO'),(97,'Diana Belen','Perez Ortiz','0105678901','d.perez@empresa.ec','1995-01-14',1,1,'2022-08-16','Asistente RRHH','Recursos Humanos',850.00,'N','Proceso de inducción','foto4.jpg','1 VIGENTE'),(98,'Franklin Geovanny','Morocho Latas','1106789012','f.morocho@empresa.ec','1990-09-05',12,19,'2023-03-20','Desarrollador Fullstack','Sistemas',1800.00,'N','Trabajo remoto','foto5.jpg','1 VIGENTE'),(99,'Gabriela Fernanda','Rivas Meza','0707890123','g.rivas@empresa.ec','1987-12-12',7,7,'2018-10-05','Jefe de Planta','Producción',1950.00,'N','Liquidado por reestructuración','foto6.jpg','9 RETIRADO'),(100,'Hugo Marcelo','Espinoza Paz','1808901234','h.espinoza@empresa.ec','1993-04-25',23,19,'2024-01-08','Diseñador Gráfico','Marketing',950.00,'S','Medio tiempo','foto7.jpg','1 VIGENTE'),(101,'Irene Valeria','Gomez Tello','0809012345','i.gomez@empresa.ec','1996-06-18',8,10,'2022-11-12','Recepcionista','Administración',550.00,'N','Atención al cliente','foto8.jpg','1 VIGENTE'),(102,'Jorge Luis','Uvidia Leon','0600123456','j.uvidia@empresa.ec','1982-02-28',6,6,'2015-05-20','Supervisor Ventas','Ventas',1400.00,'N','Ascenso reciente','foto9.jpg','1 VIGENTE'),(103,'Karla Janneth','Zambrano Cedeño','1301234567','k.zambrano@empresa.ec','1994-10-10',14,14,'2021-09-01','Cajera','Tesorería',500.00,'S','Renuncia por estudios','foto10.jpg','9 RETIRADO'),(104,'Leonardo Andres','Mendoza Giler','1702345678','l.mendoza2@empresa.ec','1989-12-01',19,19,'2020-04-15','Arquitecto Cloud','Sistemas',3200.00,'N','Especialista AWS','foto11.jpg','1 VIGENTE'),(105,'Monica Patricia','Salinas Ruiz','1103456789','m.salinas@empresa.ec','1991-03-30',12,1,'2019-11-25','Auditor Interno','Auditoría',1650.00,'N','Sin observaciones','foto12.jpg','1 VIGENTE'),(106,'Nestor Fabian','Calle Saca','0104567890','n.calle@empresa.ec','1984-08-14',1,1,'2017-06-10','Operario','Producción',460.00,'N','Jubilación anticipada','foto13.jpg','9 RETIRADO'),(107,'Olga Marina','Viteri Noboa','1705678902','o.viteri@empresa.ec','1997-05-05',19,19,'2023-10-01','Pasante','Legal',400.00,'S','Convenio universidad','foto14.jpg','1 VIGENTE'),(108,'Pedro Pablo','Duarte Luna','0906789012','p.duarte@empresa.ec','1986-07-20',10,10,'2021-02-15','Chofer','Logística',700.00,'N','Licencia profesional','foto15.jpg','1 VIGENTE'),(109,'Quintin Roberto','Torres Jara','0307890123','q.torres@empresa.ec','1990-01-25',3,10,'2022-04-04','Bodeguero','Logística',650.00,'N','Control de inventario','foto16.jpg','1 VIGENTE'),(110,'Rosa Elena','Vargas Pino','0208901234','r.vargas@empresa.ec','1988-11-11',2,19,'2016-09-18','Secretaria Ejecutiva','Gerencia',900.00,'N','Falta disciplinaria','foto17.jpg','9 RETIRADO'),(111,'Santiago David','Pinos Real','1809012315','s.pinos@empresa.ec','1992-05-15',23,23,'2023-06-01','Ingeniero Civil','Proyectos',2100.00,'N','Proyecto Ambato','foto18.jpg','1 VIGENTE'),(112,'Teresa de Jesus','Mora Loja','1100123456','t.mora@empresa.ec','1995-09-09',12,12,'2024-02-10','Asistente Ventas','Ventas',580.00,'S','Sin observaciones','foto19.jpg','1 VIGENTE'),(113,'Ursula Maria','Nieto Pozo','0401234567','u.nieto@empresa.ec','1983-12-25',4,4,'2014-08-20','Jefe RRHH','Recursos Humanos',2300.00,'N','Cambio de residencia','foto20.jpg','9 RETIRADO'),(114,'Victor Hugo','Pazmiño Saa','0502345678','v.pazmino@empresa.ec','1991-01-01',5,5,'2020-03-01','Electricista','Mantenimiento',750.00,'N','Técnico certificado','foto21.jpg','1 VIGENTE'),(115,'Wendy Johanna','Ramos Soliz','0903456789','w.ramos@empresa.ec','1994-06-14',10,10,'2022-07-20','Analista de Riesgos','Crédito',1350.00,'N','Sin observaciones','foto22.jpg','1 VIGENTE'),(116,'Xavier Andres','Toledo Masa','1104567890','x.toledo@empresa.ec','1987-04-18',12,19,'2023-01-15','DBA','Sistemas',2800.00,'N','Especialista Oracle/MySQL','foto23.jpg','1 VIGENTE'),(117,'Yolanda Beatriz','Vinueza G.','1705678901','y.vinueza@empresa.ec','1980-08-22',19,19,'2010-02-10','Directora Financiera','Finanzas',4500.00,'N','Socio fundador','foto24.jpg','1 VIGENTE'),(118,'Zulay Estefania','Aguilar Q.','0706789012','z.aguilar@empresa.ec','1996-03-03',7,7,'2021-12-01','Vendedora Junior','Ventas',450.00,'S','Bajo rendimiento','foto25.jpg','9 RETIRADO'),(119,'Angel Miguel','Rojas Torres','1907890123','a.rojas@empresa.ec','1993-11-20',19,19,'2022-05-15','Soporte Técnico','Sistemas',800.00,'N','Sin observaciones','foto26.jpg','1 VIGENTE'),(120,'Beatriz Helena','Luna Solis','2008901234','b.luna@empresa.ec','1992-02-14',20,10,'2023-09-10','Analista Químico','Calidad',1200.00,'N','Sede Santa Elena','foto27.jpg','1 VIGENTE'),(121,'Cesar Augusto','Moya Ruiz','1809012345','c.moya@empresa.ec','1985-05-05',23,23,'2019-01-20','Mecánico','Mantenimiento',850.00,'N','Terminación de contrato','foto28.jpg','9 RETIRADO'),(122,'Doris Amanda','Vega Leon','0100123456','d.vega@empresa.ec','1998-10-30',1,1,'2024-03-01','Asistente Social','Bienestar',950.00,'N','Nueva contratación','foto29.jpg','1 VIGENTE'),(123,'Esteban Raul','Guevara P.','1701234567','e.guevara@empresa.ec','1989-07-07',19,19,'2018-06-15','Abogado','Legal',2000.00,'N','Sin observaciones','foto30.jpg','1 VIGENTE');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Azuay','Cuenca','Es\nllamada la Atenas del Ecuador por su arquitectura, su diversidad cultural, su aporte a\nlas artes, ciencias y letras ecuatorianas y por ser el lugar de nacimiento de muchos\npersonajes ilustres de la sociedad ecuatoriana','569.42','122.00','-2.902222','-\n79.005261',1),(2,'Bolivar','Guaranda','Bolívar es una provincia del centro de Ecuador, en la cordillera\noccidental de los Andes. Su capital es la ciudad de Guaranda. La Provincia de Bolívar se\nllama así en honor al Libertador Simón Bolívar.','183 641','3254.00','-1.6','-\n79',1),(3,'Cañar','Azoguez','La\nprovincia destaca como uno de los sitios turísticos más importantes del país,\ndestacándose entre otros la Fortaleza de Ingapirca, la Laguna de Culebrillas y la ciudadde Azogues.','33848.00','3908.00','-2.733333','-78.833333',1),(4,'Carchi','Tulcán','Carchi es una provincia ecuatoriana situada al norte del Ecuador en\nla frontera con Colombia. Su capital es la ciudad de Tulcán. Forma parte de la región\n1','82734.00','3783.00','0.811667',' -77.718611',1),(5,'Chimborazo','Riobamba','En esta provincia se encuentran varias de las cumbres más\nelevadas del país, como el Carihuairazo, el Altar, Igualata, Sangay, entre otros, que en\nalgunos casos comparte con otras provincias.','223586.00','6487.00','-1.666667','-\n78.65',1),(6,'Cotopaxi','Latacunga','La provincia toma el nombre del volcán más grande e importante\nde su territorio, el volcán Cotopaxi. Cotopaxi se encuentra dividida políticamente en 7\ncantones. Según el último ordenamiento territorial, la provincia de Cotopaxi pertenece a\nla región centro 3','409 205','6569.00','-0.933333',' -78.616667',1),(7,'El Oro','Machala','La capital de la provincia de El Oro es la ciudad de Machala, quinta\nciudad del país, considerada como la capital bananera del mundo\n.','260528.00','6188.00','-3.266669',' -79.9667',2),(8,'Esmeraldas','Esmeraldas','Provincia del Ecuador situada en su costa noroccidental,\nconocida popularmente como la provincia verde. Sucapital homónima es uno de los puertos\nprincipales del Ecuador y terminal del oleoducto transandino. Posee un aeropuerto para\nvuelos nacionales e internacionales','189504.00','15 954','-0.966667',' -79.65',2),(9,'Galápagos','P.\nBaquerizo Moreno','Es el mayor centro turístico del Ecuador, así como también una de las\nreservas ecológicas más grandes e importantes del planeta. Con sus 26.640 habitantes,\nGalápagos es la provincia menos poblada del país, debido principalmente al afán de\nconservar al máximo la flora y fauna de la región.','5600.00','8010.00','-0.666667',' -\n90.55',3),(10,'Guayas','Guayaquil','Es el mayor centro comercial e industrial del Ecuador. Con sus 3,8 millones de habitantes, Guayas es la provincia más poblada del país, constituyéndose\ncon el 24,5% de la población de la República.','2526927.00','17139.00','-2.2',' -\n79.9667',2),(11,'Imbabura','Ibarra','La provincia también es conocida por sus contrastes poblacionales\nes así que la población está marcada por diferentes factores demográficos, además desde\nsiempre ha sido núcleo de artesanías y cultura.','181722.00','4599.00','0.35','-\n78.133333',1),(12,'Loja','Loja','Loja\nes una ciudad del Ecuador, capital de la provincia y cantón Loja, tiene una rica\ntradición en las artes, y por esta razón es conocida como la capital musical y cultural\ndel Ecuador.','206.83','57.00','-3.833','-80.067',1),(13,'Los Ríos','Babahoyo','Los Ríos, oficialmente Provincia de Los Ríos, es una de las 24\nprovincias de la República del Ecuador, localizada en la Región Costa del país. Su\ncapital es la ciudad de Babahoyo y su localidad más poblada es la ciudad de Quevedo. Es\nuno de los más importantes centros agrícolas del Ecuador. Su territorio está ubicado en\nla parte central del litoral del país y limita con las provincias de Guayas, Santo\nDomingo de los Tsáchilas, Manabí, Cotopaxi y Bolívar. Según el último ordenamiento\nterritorial, la provincia de Los Ríos pertenece a la región comprendida también por las\nprovincias de Bolívar, Guayas y Santa Elena.','778115.00','6254.00','-1.766669','-\n79.45',2),(14,'Manabí','Portoviejo','Manabí es una provincia ecuatoriana localizada en el\nemplazamiento centro-noroeste del Ecuador continental, cuya unidad jurídica se ubica en\nla región geográfica del litoral, que a su vez se encuentra dividida por el cruce de la\nlínea equinoccial. Su capital es Portoviejo. Limita al oeste con el Océano Pacífico, al\nnorte con la provincia de Esmeraldas, al este con la provincia deSanto Domingo de los\nTsáchilas y Los Ríos, al sur con la provincia de Santa Elena y al sur y este con la\nprovincia de Guayas. Con una población de 1,395.249 habitantes, es la tercera provincia\nmás poblada de Ecuador.','1369780.00','18400.00','-1.052219','-80.4506',2),(15,'Morona Santiago','Macas','Morona Santiago (nombre oficial Provincia de Morona Santiago) es una\nde las 24 provincias que conforman la República del Ecuador. Es una provincia de la Amazonía ecuatoriana. Su capital es la ciudad de Macas, la cual además, es su urbe más\npoblada. Su territorio limita al norte con Pastaza, al sur con Zamora Chinchipe, al este\ncon Perú, y al oeste con Tungurahua, Azuay, Chimborazo y Cañar. Ocupa una superficie de\n25.690 km², un área similar a la de Cerdeña.','147940.00','25690.00','-2.366667',' -\n78.133333',4),(16,'Napo','Tena','La\nprovincia de Napo es una de las provincias de la Región Centro Norte (Ecuador), de la\nRepública del Ecuador, situada en la región amazónica ecuatoriana e incluyendo parte de\nlas laderas de los Andes, hasta las llanuras amazónicas. Toma su nombre del río Napo. Su\ncapital es la ciudad de Tena. Limita al norte con Sucumbíos, al sur con Pastaza, al\noeste con Pichincha,Cotopaxi y Tungurahua y al este con la Provincia de\nOrellana.','103697.00','13271.00','0.989','-77.8159',4),(17,'Orellana','Francisco\nde Orellana','Orellana, provincia de la Región Centro Norte (Ecuador), Ecuador, La\ncapital de la provincia es El Coca más conocida como «Coca». Al norte limita con\nSucumbíos, al sur con la provincia de Pastaza, al este con Perú y al oeste con Napo.\nTiene una superficie de 20.733 km², que en términos de extensión es similar a la de El\nSalvador. Es una de las provincias más nuevas del país, provincia 22, pues fue creada en\n1998 al ser separada de Napo. Inicialmente su nombre iba a ser provincia de Amazonaspero\nante un potencial reclamo de Perú se decidió denominarla Orellana. La población es de\n136.396 habitantes; sus habitantes nativos pertenecen principalmente a las\nnacionalidades waorani, schuar y kichwa.','136396.00','20773.00','-0.933333','-\n75.666667',4),(18,'Pastaza','Puyo','Pastaza, oficialmente Provincia de Pastaza, es una de las 24\nprovincias que conforman la República del Ecuador, situada en laRegión Amazónica del\nEcuador. Recibe su nombre del río Pastaza, que la separa al sur de la provincia de\nMorona Santiago. Su capital es la ciudad de Puyo.','83933.00','29520.00','-1.066667','-\n78.001111',4),(19,'Pichincha','Quito','La Provincia de Pichincha es una de las 24 provincias que\nconforman la República del Ecuador. Se encuentra ubicada al norte del país, en la zona\ngeográfica conocida como sierra. Su capital administrativa es la ciudad de Quito, la\ncual además es su urbe más poblada y la capital del país. Es también el principal centro\ncomercial del país.','2576287.00','9612.00','-0.25','-78.583333',1),(20,'Santa Elena','Santa\nElena','Santa Elena es una provincia de la costa de Ecuador creada el 7 de noviembre de\n2007, la más reciente de las 24 actuales, con territorios que anterior a esa fecha\nformaban parte de la provincia del Guayas, al oeste de ésta.','308693.00','3763.00','-\n2.2267',' -80.8583',2),(21,'Santo Domingo de los Tsáchilas','Santo Domingo','La Provincia de Santo Domingo de los Tsáchilas es una de las\nprovincias de la República del Ecuador y forma parte de laRegión Costa, históricamente\nconocida como Provincia de Yumbos. Su territorio está en zona de trópico húmedo. La provincia toma su nombre de los Tsáchilas, etnia ancestral de la\nzona.','410937.00','4180.00','-0.333333','-79.25',2),(22,'Sucumbios','Nueva\nLoja','Sucumbíos es una provincia del nor-oriente del Ecuador. Su capital es Nueva Loja.\nEs una de las principales provincias que proveen al Estado ecuatoriano del petróleo que\nnecesita para las exportaciones. Se caracteriza por sus bellos paisajes amazónicos,\nentre ellos el río Aguarico.','176472.00','18612.00','-0.083333','-\n76.883333',4),(23,'Tungurahua','Ambato','Tungurahua, oficialmente Provincia de Tungurahua, es una de las\n24 provincias que conforman la República del Ecuador. Se encuentra al centro del país,\nen la región geográfica conocida como sierra. La ciudad de Ambato es su capital\nadministrativa; se divide en 9 cantones. Forma parte de la región comprendida también\npor las provincias de Cotopaxi, Chimborazo y Pastaza.','504583.00','3334.00','-\n1.233333','-78.616667',1),(24,'Zamora Chinchipe','Zamora','Zamora Chinchipe es una provincia de Ecuador ubicada en el suroriente de la Amazonía ecuatoriana, que limita con la provincia de Morona Santiago al\nnorte; con la provincia de Loja al oeste; y con Perú al sur y este. Según el último\nordenamiento territorial del Ecuador, Zamora Chinchipe pertenece a la Región Sur\ncomprendida también por las provincias de Loja y El Oro. Tiene una superficie de 10.556\nkm², la cual comprende una orografía montañosa única que la distingue del resto de\nprovincias amazónicas.','91376.00','10556.00','-2.883333','-79',4);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-10  1:31:22
