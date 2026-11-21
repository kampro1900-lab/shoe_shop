-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: madagaskar
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Женская обувь'),(2,'Мужская обувь');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturers`
--

LOCK TABLES `manufacturers` WRITE;
/*!40000 ALTER TABLE `manufacturers` DISABLE KEYS */;
INSERT INTO `manufacturers` VALUES (1,'Kari'),(2,'Marco Tozzi'),(3,'Рос'),(4,'Rieker'),(5,'Alessio Nesca'),(6,'CROSBY');
/*!40000 ALTER TABLE `manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `pvz_id` int NOT NULL,
  `user_id` int NOT NULL,
  `receive_code` varchar(10) NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_pvz_idx` (`pvz_id`),
  KEY `fk_orders_user_idx` (`user_id`),
  KEY `fk_orders_status_idx` (`status_id`),
  CONSTRAINT `fk_orders_pvz` FOREIGN KEY (`pvz_id`) REFERENCES `pvz` (`id`),
  CONSTRAINT `fk_orders_status` FOREIGN KEY (`status_id`) REFERENCES `orderstatus` (`id`),
  CONSTRAINT `fk_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-02-27','2025-04-20',1,4,'901',1),(2,'2022-09-28','2025-04-21',11,1,'902',1),(3,'2025-03-21','2025-04-22',2,2,'903',1),(4,'2025-02-20','2025-04-23',11,3,'904',1),(5,'2025-03-17','2025-04-24',2,4,'905',1),(6,'2025-03-01','2025-04-25',15,1,'906',1),(7,'2025-03-30','2025-04-26',3,2,'907',1),(8,'2025-03-31','2025-04-27',19,3,'908',2),(9,'2025-04-02','2025-04-28',5,4,'909',2),(10,'2025-04-03','2025-04-29',20,4,'910',2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatus`
--

LOCK TABLES `orderstatus` WRITE;
/*!40000 ALTER TABLE `orderstatus` DISABLE KEYS */;
INSERT INTO `orderstatus` VALUES (1,'Завершен'),(2,'Новый');
/*!40000 ALTER TABLE `orderstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodorders`
--

DROP TABLE IF EXISTS `prodorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodorders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prodorders_product_idx` (`product_id`),
  KEY `fk_prodorders_order_idx` (`order_id`),
  CONSTRAINT `fk_prodorders_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prodorders_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodorders`
--

LOCK TABLES `prodorders` WRITE;
/*!40000 ALTER TABLE `prodorders` DISABLE KEYS */;
INSERT INTO `prodorders` VALUES (1,1,1,2),(2,1,2,2),(3,2,3,1),(4,2,4,1),(5,3,5,10),(6,3,6,10),(7,4,7,5),(8,4,8,4),(9,5,1,2),(10,5,2,2),(11,6,3,1),(12,6,4,1),(13,7,5,10),(14,7,6,10),(15,8,7,5),(16,8,8,4),(17,9,9,5),(18,9,10,1),(19,10,11,5),(20,10,12,5);
/*!40000 ALTER TABLE `prodorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int NOT NULL,
  `stock_qty` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `category_id` int NOT NULL,
  `manufacturer_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_category_idx` (`category_id`),
  KEY `fk_products_manufacturer_idx` (`manufacturer_id`),
  KEY `fk_products_supplier_idx` (`supplier_id`),
  CONSTRAINT `fk_products_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_manufacturer` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`),
  CONSTRAINT `fk_products_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'А112Т4','Ботинки','шт.',4990.00,3,6,'Женские Ботинки демисезонные kari','1.jpg',1,1,1),(2,'F635R4','Ботинки','шт.',3244.00,2,13,'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый','2.jpg',1,2,2),(3,'H782T5','Туфли','шт.',4499.00,4,5,'Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный','3.jpg',2,1,1),(4,'G783F5','Ботинки','шт.',5900.00,2,8,'Мужские ботинки Рос-Обувь кожаные с натуральным мехом','4.jpg',2,3,1),(5,'J384T6','Ботинки','шт.',3800.00,2,16,'B3430/14 Полуботинки мужские Rieker','5.jpg',2,4,2),(6,'D572U8','Кроссовки','шт.',4100.00,3,6,'129615-4 Кроссовки мужские','6.jpg',2,3,2),(7,'F572H7','Туфли','шт.',2700.00,2,14,'Туфли Marco Tozzi женские летние, размер 39, цвет черный','7.jpg',1,2,1),(8,'D329H3','Полуботинки','шт.',1890.00,4,4,'Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый','8.jpg',1,5,2),(9,'B320R5','Туфли','шт.',4300.00,2,6,'Туфли Rieker женские демисезонные, размер 41, цвет коричневый','9.jpg',1,4,1),(10,'G432E4','Туфли','шт.',2800.00,3,15,'Туфли kari женские TR-YR-413017, размер 37, цвет: черный','10.jpg',1,1,1),(11,'S213E3','Полуботинки','шт.',2156.00,3,6,'407700/01-01 Полуботинки мужские CROSBY','',2,6,2),(12,'E482R4','Полуботинки','шт.',1800.00,2,14,'Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный','',1,1,1),(13,'S634B5','Кеды','шт.',5500.00,3,0,'Кеды Caprice мужские демисезонные, размер 42, цвет черный','',2,6,2),(14,'K345R4','Полуботинки','шт.',2100.00,2,3,'407700/01-02 Полуботинки мужские CROSBY','',2,6,2),(15,'O754F4','Туфли','шт.',5400.00,4,18,'Туфли женские демисезонные Rieker артикул 55073-68/37','',1,4,2),(16,'G531F4','Ботинки','шт.',6600.00,12,9,'Ботинки женские зимние ROMER арт. 893167-01 Черный','',1,1,1),(17,'J542F5','Тапочки','шт.',500.00,13,0,'Тапочки мужские Арт.70701-55-67син р.41','',2,1,1),(18,'B431R5','Ботинки','шт.',2700.00,2,5,'Мужские кожаные ботинки/мужские ботинки','',2,4,2),(19,'P764G4','Туфли','шт.',6800.00,15,15,'Туфли женские, ARGO, размер 38','',1,6,1),(20,'C436G5','Ботинки','шт.',10200.00,15,9,'Ботинки женские, ARGO, размер 40','',1,5,1),(21,'F427R5','Ботинки','шт.',11800.00,15,11,'Ботинки на молнии с декоративной пряжкой FRAU','',1,4,2),(22,'N457T5','Полуботинки','шт.',4600.00,3,13,'Полуботинки Ботинки черные зимние, мех','',1,6,1),(23,'D364R4','Туфли','шт.',12400.00,16,5,'Туфли Luiza Belly женские Kate-lazo черные из натуральной замши','',1,1,1),(24,'S326R5','Тапочки','шт.',9900.00,17,15,'Мужские кожаные тапочки \"Профиль С.Дали\"\"\"','',2,6,2),(25,'L754R4','Полуботинки','шт.',1700.00,2,7,'Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный','',1,1,1),(26,'M542T5','Кроссовки','шт.',2800.00,18,3,'Кроссовки мужские TOFA','',2,4,2),(27,'D268G5','Туфли','шт.',4399.00,3,12,'Туфли Rieker женские демисезонные, размер 36, цвет коричневый','',1,4,2),(28,'T324F5','Сапоги','шт.',4699.00,2,5,'Сапоги замша Цвет: синий','',1,6,1),(29,'K358H6','Тапочки','шт.',599.00,20,2,'Тапочки мужские син р.41','',2,4,1),(30,'H535R5','Ботинки','шт.',2300.00,2,7,'Женские Ботинки демисезонные','',1,4,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pvz`
--

DROP TABLE IF EXISTS `pvz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pvz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `postcode` char(6) NOT NULL,
  `city` varchar(30) NOT NULL,
  `street` varchar(30) NOT NULL,
  `house` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pvz`
--

LOCK TABLES `pvz` WRITE;
/*!40000 ALTER TABLE `pvz` DISABLE KEYS */;
INSERT INTO `pvz` VALUES (1,'420151','г. Лесной','ул. Вишневая','32'),(2,'125061','г. Лесной','ул. Подгорная','8'),(3,'630370','г. Лесной','ул. Шоссейная','24'),(4,'400562','г. Лесной','ул. Зеленая','32'),(5,'614510','г. Лесной','ул. Маяковского','47'),(6,'410542','г. Лесной','ул. Светлая','46'),(7,'620839','г. Лесной','ул. Цветочная','8'),(8,'443890','г. Лесной','ул. Коммунистическая','1'),(9,'603379','г. Лесной','ул. Спортивная','46'),(10,'603721','г. Лесной','ул. Гоголя','41'),(11,'410172','г. Лесной','ул. Северная','13'),(12,'614611','г. Лесной','ул. Молодежная','50'),(13,'454311','г. Лесной','ул. Новая','19'),(14,'660007','г. Лесной','ул. Октябрьская','19'),(15,'603036','г. Лесной','ул. Садовая','4'),(16,'394060','г. Лесной','ул. Фрунзе','43'),(17,'410661','г. Лесной','ул. Школьная','50'),(18,'625590','г. Лесной','ул. Коммунистическая','20'),(20,'450983','г. Лесной','ул. Комсомольская','26'),(21,'394782','г. Лесной','ул. Чехова','3'),(22,'603002','г. Лесной','ул. Дзержинского','28'),(23,'450558','г. Лесной','ул. Набережная','30'),(24,'344288','г. Лесной','ул. Чехова','1'),(25,'614164','г. Лесной','ул. Степная','30'),(26,'394242','г. Лесной','ул. Коммунистическая','43'),(27,'660540','г. Лесной','ул. Солнечная','25'),(28,'125837','г. Лесной','ул. Шоссейная','40'),(29,'125703','г. Лесной','ул. Партизанская','49'),(30,'625283','г. Лесной','ул. Победы','46'),(31,'614753','г. Лесной','ул. Полевая','35'),(32,'426030','г. Лесной','ул. Маяковского','44'),(33,'450375','г. Лесной','ул. Клубная','44'),(34,'625560','г. Лесной','ул. Некрасова','12'),(35,'630201','г. Лесной','ул. Комсомольская','17'),(36,'190949','г. Лесной','ул. Мичурина','26');
/*!40000 ALTER TABLE `pvz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Администратор'),(2,'Менеджер'),(3,'Авторизированный клиент');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Kari'),(2,'Обувь для вас');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(60) NOT NULL,
  `login` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_role_idx` (`role_id`),
  CONSTRAINT `fk_users_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Никифорова Весения Николаевна','94d5ous@gmail.com','uzWC67',1),(2,'Сазонов Руслан Германович','uth4iz@mail.com','2L6KZG',1),(3,'Одинцов Серафим Артёмович','yzls62@outlook.com','JlFRCZ',1),(4,'Степанов Михаил Артёмович','1diph5e@tutanota.com','8ntwUp',2),(5,'Ворсин Петр Евгеньевич','tjde7c@yahoo.com','YOyhfR',2),(6,'Старикова Елена Павловна','wpmrc3do@tutanota.com','RSbvHv',2),(7,'Михайлюк Анна Вячеславовна','5d4zbu@tutanota.com','rwVDh9',3),(8,'Ситдикова Елена Анатольевна','ptec8ym@yahoo.com','LdNyos',3),(9,'Ворсин Петр Евгеньевич','1qz4kw@mail.com','gynQMT',3),(10,'Старикова Елена Павловна','4np6se@mail.com','AtnDjr',3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-21 10:44:28
