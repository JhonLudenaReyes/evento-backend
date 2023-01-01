-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_evento
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_evento` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `numero_entradas` int NOT NULL,
  `pagar` double NOT NULL,
  `numero_compras` int NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `fecha_evento` date DEFAULT NULL,
  PRIMARY KEY (`id_compra`,`id_persona`,`id_evento`),
  KEY `fk_compras_personas_idx` (`id_persona`),
  KEY `fk_compras_eventos_idx` (`id_evento`),
  CONSTRAINT `fk_compras_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`),
  CONSTRAINT `fk_compras_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2022-12-02',5,180,1,'A',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `id_promocion` int NOT NULL,
  `evento` varchar(45) NOT NULL,
  `fecha_evento` date NOT NULL,
  `id_usuario` int NOT NULL,
  `cantidad_entradas` int NOT NULL,
  `precio` double NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `usuario_creacion` varchar(45) NOT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_evento`,`id_promocion`,`id_usuario`),
  KEY `fk_eventos_usuarios_idx` (`id_usuario`),
  KEY `fk_eventos_promociones_idx` (`id_promocion`),
  CONSTRAINT `fk_eventos_promociones` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`),
  CONSTRAINT `fk_eventos_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,1,'FESTIVAL ANDINO','2022-12-02',1,95,40,'A','jludena',NULL,'2022-12-02',NULL),(2,1,'FESTIVAL HOMBRE EN LLAMAS','2022-12-30',1,100,40,'A','jludena','jludena','2022-12-26','2022-12-27'),(3,2,'DPRATY PARTYS','2022-12-31',1,58,80,'A','jludena',NULL,'2022-12-30',NULL);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `cedula` varchar(10) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'JHON JEFFERSON','LUDENA REYES','2496358498','0964859786','A');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premios` (
  `id_premio` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `codigo_premio` int NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id_premio`,`id_compra`),
  KEY `fk_premios_compras_idx` (`id_compra`),
  CONSTRAINT `fk_premios_compras` FOREIGN KEY (`id_compra`) REFERENCES `compras` (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premios`
--

LOCK TABLES `premios` WRITE;
/*!40000 ALTER TABLE `premios` DISABLE KEYS */;
/*!40000 ALTER TABLE `premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `id_promocion` int NOT NULL AUTO_INCREMENT,
  `promocion` varchar(45) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `descuento` int NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `usuario_creacion` varchar(45) NOT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_promocion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'NAVIDAD','2022-12-01','2022-12-25',10,'A','jludena',NULL,'2022-12-03',NULL),(2,'BLACK FRIDAY','2022-12-02','2022-12-09',20,'A','jludena',NULL,'2022-12-02',NULL),(3,'FESTIVAL ANDINO','2022-12-02','2022-12-09',5,'A','jludena',NULL,'2022-12-02',NULL),(4,'FESTIVAL MEDIEVAL','2022-12-02','2022-12-09',6,'A','jludena',NULL,'2022-12-02',NULL);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `usuario_creacion` varchar(45) NOT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `usuario_creacion` varchar(45) NOT NULL,
  `usuario_modificacion` varchar(45) DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_persona`),
  KEY `fk_usuarios_personas_idx` (`id_persona`),
  CONSTRAINT `fk_usuarios_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1,'jludena','admin','A','jludena',NULL,'2022-12-03',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_roles`
--

DROP TABLE IF EXISTS `usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_roles` (
  `id_usuario` int NOT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_rol`),
  KEY `fk_usuarios_roles_roles_idx` (`id_rol`),
  CONSTRAINT `fk_usuarios_roles_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `fk_usuarios_roles_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_roles`
--

LOCK TABLES `usuarios_roles` WRITE;
/*!40000 ALTER TABLE `usuarios_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-01 18:54:20
