-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: lojadopintor_development
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (14,'Tintas',NULL,'2013-10-31 17:30:05','2013-10-31 17:30:05'),(15,'Linha Imobiliária',14,'2013-10-31 17:30:18','2013-10-31 22:00:10'),(16,'Linha Automotiva',14,'2013-10-31 17:30:36','2013-10-31 22:00:19'),(17,'Esmalte sintético imobiliário',15,'2013-10-31 17:30:51','2013-10-31 17:45:08'),(18,'Tintas óleo',15,'2013-10-31 17:31:06','2013-11-06 16:14:51'),(19,'Poliéster',16,'2013-10-31 17:31:25','2013-10-31 17:31:25'),(20,'Linha econômica',15,'2013-10-31 17:41:31','2013-11-06 16:15:23'),(21,'P.U.',16,'2013-10-31 17:42:01','2013-10-31 17:42:01'),(22,'Esmalte sintético',16,'2013-10-31 17:42:13','2013-10-31 17:45:32'),(23,'Primeira linha',15,'2013-10-31 17:42:35','2013-10-31 17:45:25'),(25,'Acetinada',15,'2013-10-31 17:43:04','2013-10-31 17:43:04'),(26,'Laca nitro',16,'2013-10-31 17:43:17','2013-10-31 17:57:15'),(27,'Semi-brilho',15,'2013-10-31 17:43:35','2013-10-31 17:45:38'),(28,'Tinta para piso',15,'2013-10-31 17:46:33','2013-10-31 17:46:33'),(30,'Acessórios',NULL,'2013-10-31 17:47:21','2013-10-31 17:49:08'),(31,'Pincel',37,'2013-10-31 17:47:39','2013-11-06 16:16:45'),(33,'Rolo',37,'2013-10-31 17:47:59','2013-11-06 16:16:50'),(34,'Bandeja',37,'2013-10-31 17:48:33','2013-11-06 16:16:55'),(35,'Espatula',69,'2013-10-31 17:49:00','2013-11-06 16:17:29'),(36,'Selador',15,'2013-10-31 17:49:51','2013-11-06 16:15:28'),(37,'Acessórios para pintura',30,'2013-10-31 17:55:03','2013-10-31 17:55:21'),(39,'Verniz',15,'2013-10-31 18:16:45','2013-11-06 16:15:32'),(40,'Tinta para telha',15,'2013-10-31 18:16:53','2013-10-31 18:16:53'),(41,'Texturas e massas',30,'2013-10-31 18:19:21','2013-10-31 18:55:38'),(42,'Verniz',16,'2013-10-31 18:23:36','2013-11-06 16:15:47'),(43,'Massa automotiva',16,'2013-10-31 18:23:55','2013-11-06 16:15:55'),(44,'Primer',16,'2013-10-31 18:24:59','2013-11-06 16:16:03'),(47,'Textura rugosa',41,'2013-10-31 18:26:52','2013-10-31 18:26:52'),(48,'Textura lisa',41,'2013-10-31 18:27:01','2013-10-31 18:27:01'),(49,'Massa corrida acrílica',41,'2013-10-31 18:27:25','2013-10-31 18:27:25'),(50,'Massa corrida P.V.A.',41,'2013-10-31 18:27:36','2013-10-31 18:27:43'),(51,'Grafiato',41,'2013-10-31 18:28:08','2013-10-31 18:28:08'),(52,'Sela Água',36,'2013-10-31 18:51:46','2013-10-31 18:51:46'),(53,'Selador pigmentado',36,'2013-10-31 18:52:00','2013-10-31 18:52:00'),(54,'Disco e lixa',69,'2013-10-31 18:52:43','2013-11-06 16:17:38'),(55,'Fita',69,'2013-10-31 18:52:57','2013-11-06 16:17:46'),(56,'Cera',69,'2013-10-31 18:53:11','2013-11-06 16:17:50'),(57,'Estopa',37,'2013-10-31 18:53:30','2013-11-06 16:16:59'),(58,'Thinner e solvente',16,'2013-10-31 18:53:41','2013-11-06 16:16:17'),(59,'Sela água',41,'2013-10-31 18:56:31','2013-10-31 18:56:31'),(60,'Aplicador',69,'2013-10-31 18:56:54','2013-10-31 19:05:02'),(61,'Catalizador',16,'2013-10-31 18:57:02','2013-11-06 16:16:26'),(62,'Solda',69,'2013-10-31 18:57:36','2013-10-31 19:04:37'),(63,'Tinta reciclada',15,'2013-10-31 18:59:39','2013-10-31 18:59:39'),(64,'Cola',69,'2013-10-31 19:00:02','2013-11-06 16:17:56'),(65,'Ferramentas',NULL,'2013-10-31 19:00:19','2013-10-31 19:00:19'),(66,'Taco',37,'2013-10-31 19:01:26','2013-11-06 16:17:04'),(67,'Peça para pistola',65,'2013-10-31 19:02:22','2013-11-06 16:18:02'),(68,'Suporte',65,'2013-10-31 19:02:40','2013-11-06 16:18:08'),(69,'Outros',30,'2013-10-31 19:04:13','2013-10-31 19:05:37'),(70,'Desempenadeira',37,'2013-10-31 19:09:12','2013-11-06 16:17:09'),(71,'Luva',37,'2013-10-31 19:09:39','2013-11-06 16:17:15'),(72,'Máscara',37,'2013-10-31 19:09:53','2013-11-06 16:17:20'),(74,'Broxa',37,'2013-10-31 19:12:57','2013-10-31 19:12:57'),(76,'Escova',69,'2013-11-06 16:34:07','2013-11-06 16:34:34'),(77,'Cabo',69,'2013-11-06 16:34:55','2013-11-06 16:34:55'),(78,'Resicolor',17,'2013-11-06 16:58:09','2013-11-06 16:58:09'),(79,'Ciacollor',17,'2013-11-06 16:58:19','2013-11-06 16:58:19'),(80,'Golden',17,'2013-11-06 16:58:28','2013-11-06 16:58:28'),(81,'Resicolor',18,'2013-11-06 16:58:37','2013-11-06 16:58:37'),(82,'Ciacollor',18,'2013-11-06 16:58:45','2013-11-06 16:58:45'),(83,'Golden',18,'2013-11-06 16:58:56','2013-11-06 16:58:56');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-11 16:22:34
