-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: todo_vigo1
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$FMsreKJDxXETrAaiSL6CPL$PIX3B+A7Gq1pCVJqq+gh3gVYwgVdnLslnGRi2DrXQqA=','2023-06-08 06:17:47.635291',1,'admin','','','admin@gmail.com',1,1,'2023-06-07 05:29:04.408880');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Personal'),(2,'Work'),(3,'Shopping'),(4,'Health'),(5,'Education');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `comment_text` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comments_ibfk_2_idx` (`user_id`),
  KEY `comments_ibfk_1_idx` (`task_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,4,6,'asdsad',NULL),(2,4,6,'sadsa',NULL),(3,5,6,'sadsadsa',NULL),(4,5,6,'asdsa',NULL),(6,8,11,'sadsadsad',NULL),(15,NULL,15,'sadsa',NULL),(16,NULL,15,'as',NULL),(17,NULL,15,'s',NULL),(18,NULL,15,'s',NULL),(19,NULL,15,'s',NULL),(20,NULL,15,'sss',NULL),(21,NULL,15,'s',NULL),(22,NULL,15,'asd',NULL),(23,NULL,15,'sd',NULL),(24,NULL,15,'asd',NULL),(25,22,15,'sda',NULL),(26,22,15,'hellow',NULL),(27,22,15,'hi\r\n',NULL),(30,24,15,'sad',NULL),(32,52,25,'UwU',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-06-07 06:42:00.738656','19','PersonalInformation object (19)',2,'[{\"changed\": {\"fields\": [\"Profile picture\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'todo_list','categories'),(7,'todo_list','personalinformation');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-06-07 05:24:01.800404'),(2,'auth','0001_initial','2023-06-07 05:24:02.490714'),(3,'admin','0001_initial','2023-06-07 05:24:02.638627'),(4,'admin','0002_logentry_remove_auto_add','2023-06-07 05:24:02.663164'),(5,'admin','0003_logentry_add_action_flag_choices','2023-06-07 05:24:02.675904'),(6,'contenttypes','0002_remove_content_type_name','2023-06-07 05:24:02.786588'),(7,'auth','0002_alter_permission_name_max_length','2023-06-07 05:24:02.948475'),(8,'auth','0003_alter_user_email_max_length','2023-06-07 05:24:03.038593'),(9,'auth','0004_alter_user_username_opts','2023-06-07 05:24:03.054268'),(10,'auth','0005_alter_user_last_login_null','2023-06-07 05:24:03.210995'),(11,'auth','0006_require_contenttypes_0002','2023-06-07 05:24:03.218832'),(12,'auth','0007_alter_validators_add_error_messages','2023-06-07 05:24:03.235487'),(13,'auth','0008_alter_user_username_max_length','2023-06-07 05:24:03.308958'),(14,'auth','0009_alter_user_last_name_max_length','2023-06-07 05:24:03.384722'),(15,'auth','0010_alter_group_name_max_length','2023-06-07 05:24:03.415086'),(16,'auth','0011_update_proxy_permissions','2023-06-07 05:24:03.425862'),(17,'auth','0012_alter_user_first_name_max_length','2023-06-07 05:24:03.490609'),(18,'sessions','0001_initial','2023-06-07 05:24:03.534686');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1khpu9gxr6ffweqb2n4r2lte3wqp6qrj','.eJxVjMEKgzAQRP9lzyJGk6CeSu_9BtnNbtVWE4h6KKX_3lik4HHem5k3bIvEbmRoS5P9gsdZoAWKL8hAZhynlIJ3kgh6U176neUuzMlPoe-Fu9FDu8ZNMuhwW4fufwoKTozQPcXvgh_o-5Bu_BpHyvdKftglvwWW6Xp0TwcDLkNaV4YVS6PIWtWYgtE1yFyjrrhIkZRzDvmuG6pJW9GVJUIsbKXEWCk1fL7Q_1Mm:1q79XR:WGkVFI-ZGhHPUTtqMB2xHH7oUPyl2QOtMD7zSfgYuBI','2023-06-22 06:54:29.650831'),('887g6hds1m0c4icdi7wdwt949nq9aj03','.eJxVjksOwjAMRO-SNYqaJo3arhB7FpwgsmPTBkoi-hELxN1JRYVg-TwzT34KB8vcu2Xi0QUSrVBi93tD8FeOa0AXiF2SPsV5DCjXitzSSR4T8XDYun-CHqY-r3VFirhRaK1qqoLAN0BUg9FUZETlvQc6mwZrNJaNtogAhdWKK8ulydLvj6X-QIQbZ_X9wTnlG4Rhpf0p05C6jsmFKNp5XPj1BsotTEc:1q6n3E:VPLrs2aBeSfjMMh5HTnZNExdzjjEJU-uMl6bzcHV-jk','2023-06-21 06:53:48.556425'),('x9g0vy4zf3jzo5skpmgun0v4k0qfifvn','eyJ1c2VyX2lkIjoyNSwiZW1haWwiOiJvbmNlYnJ5YW41MkBnbWFpbC5jb20ifQ:1q7qSN:YPePcq9h0TaUgFJoPf1AFIk8ZtbFEHdsUqCTuu0pdUI','2023-06-24 04:44:07.473781');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_information`
--

DROP TABLE IF EXISTS `personal_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_information` (
  `personal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profile_picture` blob,
  `social_media_links` text,
  `quotes` varchar(2255) DEFAULT NULL,
  PRIMARY KEY (`personal_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `personal_information_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_information`
--

LOCK TABLES `personal_information` WRITE;
/*!40000 ALTER TABLE `personal_information` DISABLE KEYS */;
INSERT INTO `personal_information` VALUES (7,8,'asdsa','dsad','sadsa','dsadsa','2023-05-15','','sadsadsa',NULL),(8,10,'sadsadsa','dsad','adsa','asds','2023-05-16','','asdsa,dsad,sadsad,sadsa,dsadas,',NULL),(9,10,'asds','adsadsa','dsa','dsadsa','2023-05-26',_binary '1683692492238.jpg','dsadsa,sad,sad,sa','asdsadsadsa'),(10,11,'Bryan','Once','BM. Road','0981222247','2023-05-19',_binary 'Untitled_design__2_-removebg-preview.png','facebook, instagram, youtube',' tang inang buhay to'),(11,12,'bryan','qwe','sadsa','sadsadas','2023-05-03',_binary '1684841857551.jpg','sadsa,dsa,d,as,dsad,sadsa,sadsad,sasad,sad',' sadsa'),(12,13,'bryan','tanga','asdsa','dsadsa','2023-05-11',_binary '1684893267653.jpg','bryanpaul.once.1',' whut?'),(13,14,'sadsa','dsadsa','sad','sadasdas','2023-05-10',_binary '1684815238229.png','https://www.facebook.com/bryanpaul.once.1/',' sadsa'),(14,12,'bryan','qwe','sadsa','sadsadas','2023-05-03',_binary '1684841857551.jpg','sadsa,dsa,d,as,dsad,sadsa,sadsad,sasad,sad',' sadsa'),(15,12,'bryan','qwe','sadsa','sadsadas','2023-05-03',_binary '1684841857551.jpg','sadsa,dsa,d,as,dsad,sadsa,sadsad,sasad,sad',' sadsa'),(16,12,'bryan','qwe','sadsa','sadsadas','2023-05-03',_binary '1684841857551.jpg','sadsa,dsa,d,as,dsad,sadsa,sadsad,sasad,sad',' sadsa'),(17,12,'bryan','qwe','sadsa','sadsadas','2023-05-03',_binary '1684841857551.jpg','sadsa,dsa,d,as,dsad,sadsa,sadsad,sasad,sad',' sadsa'),(20,21,'asd','sadsad','asdsadsa','dsadsadsa','2023-06-28',_binary 'images/B-connect.png','asdsa,dsa,dsa','sadsada'),(21,22,'das','dsadsa','dsad','sadas','2023-06-21',_binary 'images/Gray_and_White_Clean_Office_Assistant_Resume.png','dsa,asd,sad,sad,a,dsa,asd,','sadsa'),(22,23,'adsa','dsad','sads','dsadsa','2023-06-14',_binary 'images/staff.png','asdasdsa,sad,sa,d,sa,dsa,d,sasad,','asd'),(23,24,'asdsadas','a','dsad','sadsa','2023-06-07',_binary 'images/CaptureE4.PNG','asdsa','sd'),(24,25,'Bryan Pauls','Onces','Bm. Road, Brgy. San Manuel, P.P.C.s','09217942891s','2023-05-30',_binary 'images/1684893267597.jpg','UwUs','Fuck Djangos');
/*!40000 ALTER TABLE `personal_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_category`
--

DROP TABLE IF EXISTS `task_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_category` (
  `task_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`task_id`,`category_id`),
  KEY `task_category_ibfk_2` (`category_id`),
  CONSTRAINT `task_category_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`task_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `task_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_category`
--

LOCK TABLES `task_category` WRITE;
/*!40000 ALTER TABLE `task_category` DISABLE KEYS */;
INSERT INTO `task_category` VALUES (1,1),(4,1),(5,1),(11,1),(25,1),(44,1),(45,1),(47,1),(49,1),(51,1),(52,1),(2,2),(9,2),(10,2),(14,2),(15,2),(16,2),(29,2),(48,2),(50,2),(8,3),(12,3),(13,3),(20,3),(24,3),(26,3),(39,3),(22,4),(40,4);
/*!40000 ALTER TABLE `task_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`task_id`),
  KEY `tasks_ibfk_1_idx` (`user_id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'asdsad','sadsa','Pending',NULL,'2023-06-10 05:05:13'),(2,2,'sads','adsa','Pending',NULL,'2023-06-10 05:05:13'),(4,6,'asad','sadsada','Pending','2023-05-19 16:22:08','2023-05-19 16:22:08'),(5,6,'asdsa','dsadsa','In Progress','2023-05-19 16:22:52','2023-05-19 16:22:52'),(8,11,'sadsad','sadsa','Pending','2023-05-21 18:00:38','2023-05-21 18:00:49'),(9,11,'asd','sadsa','Pending','2023-05-21 18:01:43','2023-05-21 18:01:43'),(10,12,'sda','sadsadsa','In Progress','2023-05-23 17:20:56','2023-05-23 17:21:00'),(11,12,'asd','sadsa','In Progress','2023-05-24 02:52:02','2023-05-24 02:52:02'),(12,12,'adsadsa','asds','Completed','2023-05-24 02:52:12','2023-05-24 02:52:12'),(13,3,'sad','sadsadsa','In Progress','2023-05-27 19:19:58','2023-06-10 05:05:13'),(14,5,'asdsa','dsa','In Progress','2023-05-27 19:21:02','2023-05-27 19:21:02'),(15,4,'dsasad','sadsa','In Progress','2023-05-27 19:21:41','2023-06-10 05:05:13'),(16,6,'sad','sadsa','Completed','2023-05-29 19:33:34','2023-06-10 05:05:13'),(17,24,'test1','asdsadsa','In Progress',NULL,NULL),(18,24,'test1','asdsadsa','In Progress',NULL,NULL),(19,24,'test1','asdsadsa','In Progress',NULL,NULL),(20,24,'test1','asdsadsa','In Progress',NULL,NULL),(22,15,'test3456s','dsadsah','Completed',NULL,NULL),(24,15,'asdsa','sad','Completed',NULL,NULL),(25,15,'test123','qwe','Pending',NULL,NULL),(26,15,'bry','asdsa','In Progress',NULL,NULL),(29,9,'bnm','asdsa','In Progress',NULL,NULL),(39,9,'s','k','Pending',NULL,NULL),(40,9,'asdsa','sad','In Progress',NULL,NULL),(41,9,'dsa','sadsa','In Progress',NULL,NULL),(42,9,'dsa','sadsa','In Progress',NULL,NULL),(43,9,'dsa','sadsa','In Progress',NULL,NULL),(44,9,'dsa','sadsa','In Progress',NULL,NULL),(45,9,'dsa','asdsa','In Progress',NULL,NULL),(46,9,'asdsa','dsa','In Progress',NULL,NULL),(47,9,'sadsa','asdsad','Completed',NULL,NULL),(48,9,'sadsa','asdsa','In Progress',NULL,NULL),(49,9,'asdsa','asd','In Progress',NULL,NULL),(50,9,'asdsa','sadsa','In Progress',NULL,NULL),(51,9,'asd','sadsa','In Progress',NULL,NULL),(52,25,'Django is shit','why use html if have php??','Pending',NULL,NULL);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'qwe','$2y$10$WbhbIs.iwT8kMDCL1SvyK.Gh0Hvmjbm9WJZVm6WcQPW5QJjICEMbi','qwe@qwe'),(2,'qwe','$2y$10$t2ynN5q..BjFq7Z8wrz1WO54EkxjEFoD82tQYRmDhpPRGA3FvVQg2','adsa@qeqw'),(3,'asd','$2y$10$yT5RVIxQMWBAjdShIR5zQejRh3/vhGO9SJAO.vDBwb113JZBG9Czy','asd@asd'),(4,'qwe',NULL,'qwe@q'),(5,'sad','sad','qwe@qwe'),(6,'bry','bry','sad@sad'),(7,'sad','sadsad','wqe@ewq'),(8,'sad','ty','sad@sad'),(9,'dsad','sadsa','dsa@sad'),(10,'bry','qwe','bry@bry'),(11,'bry','sad','qwe@ewq'),(12,'bry','qwe','rty@rty'),(13,'zxc','qwe','zxc@zxc'),(14,'asdsa','sadsa','sda@asd'),(15,'bry','bry123','bry@gmail.com'),(21,'uwu','qwe','u@u'),(22,'asds','qwe','a@a'),(23,'qwe','qwe','q@Q'),(24,'sdsa','qwezx','asd@asd'),(25,'bry','dotawtf12345','oncebryan52@gmail.com');
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

-- Dump completed on 2023-06-10 13:13:42
