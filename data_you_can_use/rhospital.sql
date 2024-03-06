-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_group`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:13
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_group_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:13
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_permission`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add doctor',7,'add_doctor'),(26,'Can change doctor',7,'change_doctor'),(27,'Can delete doctor',7,'delete_doctor'),(28,'Can view doctor',7,'view_doctor'),(29,'Can add exam',8,'add_exam'),(30,'Can change exam',8,'change_exam'),(31,'Can delete exam',8,'delete_exam'),(32,'Can view exam',8,'view_exam'),(33,'Can add patient',9,'add_patient'),(34,'Can change patient',9,'change_patient'),(35,'Can delete patient',9,'delete_patient'),(36,'Can view patient',9,'view_patient'),(37,'Can add result',10,'add_result'),(38,'Can change result',10,'change_result'),(39,'Can delete result',10,'delete_result'),(40,'Can view result',10,'view_result'),(41,'Can add auth group',11,'add_authgroup'),(42,'Can change auth group',11,'change_authgroup'),(43,'Can delete auth group',11,'delete_authgroup'),(44,'Can view auth group',11,'view_authgroup'),(45,'Can add auth group permissions',12,'add_authgrouppermissions'),(46,'Can change auth group permissions',12,'change_authgrouppermissions'),(47,'Can delete auth group permissions',12,'delete_authgrouppermissions'),(48,'Can view auth group permissions',12,'view_authgrouppermissions'),(49,'Can add auth permission',13,'add_authpermission'),(50,'Can change auth permission',13,'change_authpermission'),(51,'Can delete auth permission',13,'delete_authpermission'),(52,'Can view auth permission',13,'view_authpermission'),(53,'Can add auth user',14,'add_authuser'),(54,'Can change auth user',14,'change_authuser'),(55,'Can delete auth user',14,'delete_authuser'),(56,'Can view auth user',14,'view_authuser'),(57,'Can add auth user groups',15,'add_authusergroups'),(58,'Can change auth user groups',15,'change_authusergroups'),(59,'Can delete auth user groups',15,'delete_authusergroups'),(60,'Can view auth user groups',15,'view_authusergroups'),(61,'Can add auth user user permissions',16,'add_authuseruserpermissions'),(62,'Can change auth user user permissions',16,'change_authuseruserpermissions'),(63,'Can delete auth user user permissions',16,'delete_authuseruserpermissions'),(64,'Can view auth user user permissions',16,'view_authuseruserpermissions'),(65,'Can add django admin log',17,'add_djangoadminlog'),(66,'Can change django admin log',17,'change_djangoadminlog'),(67,'Can delete django admin log',17,'delete_djangoadminlog'),(68,'Can view django admin log',17,'view_djangoadminlog'),(69,'Can add django content type',18,'add_djangocontenttype'),(70,'Can change django content type',18,'change_djangocontenttype'),(71,'Can delete django content type',18,'delete_djangocontenttype'),(72,'Can view django content type',18,'view_djangocontenttype'),(73,'Can add django migrations',19,'add_djangomigrations'),(74,'Can change django migrations',19,'change_djangomigrations'),(75,'Can delete django migrations',19,'delete_djangomigrations'),(76,'Can view django migrations',19,'view_djangomigrations'),(77,'Can add django session',20,'add_djangosession'),(78,'Can change django session',20,'change_djangosession'),(79,'Can delete django session',20,'delete_djangosession'),(80,'Can view django session',20,'view_djangosession'),(81,'Can add login',21,'add_login'),(82,'Can change login',21,'change_login'),(83,'Can delete login',21,'delete_login'),(84,'Can view login',21,'view_login');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:14
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_user`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:14
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_user_groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:15
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `auth_user_user_permissions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:15
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `django_admin_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:16
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `django_content_type`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'myapp','authgroup'),(12,'myapp','authgrouppermissions'),(13,'myapp','authpermission'),(14,'myapp','authuser'),(15,'myapp','authusergroups'),(16,'myapp','authuseruserpermissions'),(17,'myapp','djangoadminlog'),(18,'myapp','djangocontenttype'),(19,'myapp','djangomigrations'),(20,'myapp','djangosession'),(7,'myapp','doctor'),(8,'myapp','exam'),(21,'myapp','login'),(9,'myapp','patient'),(10,'myapp','result'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:16
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `django_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-02-28 12:00:37.857199'),(2,'auth','0001_initial','2023-02-28 12:00:39.448221'),(3,'admin','0001_initial','2023-02-28 12:00:40.933213'),(4,'admin','0002_logentry_remove_auto_add','2023-02-28 12:00:41.145376'),(5,'admin','0003_logentry_add_action_flag_choices','2023-02-28 12:00:41.256887'),(6,'contenttypes','0002_remove_content_type_name','2023-02-28 12:00:41.615667'),(7,'auth','0002_alter_permission_name_max_length','2023-02-28 12:00:41.760751'),(8,'auth','0003_alter_user_email_max_length','2023-02-28 12:00:41.928762'),(9,'auth','0004_alter_user_username_opts','2023-02-28 12:00:42.025504'),(10,'auth','0005_alter_user_last_login_null','2023-02-28 12:00:42.188100'),(11,'auth','0006_require_contenttypes_0002','2023-02-28 12:00:42.260905'),(12,'auth','0007_alter_validators_add_error_messages','2023-02-28 12:00:42.344318'),(13,'auth','0008_alter_user_username_max_length','2023-02-28 12:00:42.496644'),(14,'auth','0009_alter_user_last_name_max_length','2023-02-28 12:00:42.699749'),(15,'auth','0010_alter_group_name_max_length','2023-02-28 12:00:43.324801'),(16,'auth','0011_update_proxy_permissions','2023-02-28 12:00:43.519927'),(17,'auth','0012_alter_user_first_name_max_length','2023-02-28 12:00:43.656923'),(18,'myapp','0001_initial','2023-02-28 12:00:43.802987'),(19,'sessions','0001_initial','2023-02-28 12:00:44.065114');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:17
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `django_session`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:18
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `doctor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `name` varchar(10) NOT NULL,
  `project` varchar(20) NOT NULL,
  `croom` int(11) NOT NULL,
  `dnum` int(11) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  PRIMARY KEY (`dnum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('邰韵','外科',4001,1000,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('莫晶青','耳鼻喉',2001,1001,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('车馨菲','电子计算机断层扫描CT',1001,1002,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('危安朋','耳鼻喉',2002,1003,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('胡贵','甲状腺功能3项',2017,1004,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('双思','幽门螺旋杆菌检测',6007,1005,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('党菊','外科',4002,1006,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('宿玉桂','血糖',5001,1007,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('何香嘉','肾功能',3012,1008,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('涂炎','口腔科',2010,1009,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('笪玲希','外科',4003,1010,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('尹固','甲状腺功能3项',2018,1011,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('舄龙和','甲状腺功能3项',2019,1012,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('余纨','静态心电图ECG',1015,1013,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('长孙希娜','口腔科',2011,1014,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('冀时朋','甲状腺功能3项',2020,1015,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('何东民','耳鼻喉',2003,1016,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('殴莎冰','肿瘤标志物C12',6014,1017,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('阚慧','口腔科',2012,1018,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('符亚珠','外科',4004,1019,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('袁琦','耳鼻喉',2004,1020,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('昝鹏','妇科尿常规12项',3001,1021,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('杭平','口腔科',2013,1022,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('傅坚','高清彩色多普勒B超',1007,1023,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('路有','外科',4005,1024,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('严震宁','血糖',5002,1025,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('查娥','口腔科',2014,1026,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('祖仁','甲状腺功能3项',2021,1027,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('酆义军','一般项目',6001,1028,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('狄韵','血常规18项',4008,1029,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('章纨','内科',4012,1030,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('陆信','静态心电图ECG',1016,1031,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('甘青芬','幽门螺旋杆菌检测',6008,1032,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('裘琳君','血糖',5003,1033,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('樊克','幽门螺旋杆菌检测',6009,1034,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('浦山进','口腔科',2015,1035,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('敖辰','血糖',5004,1036,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('帅旭','幽门螺旋杆菌检测',6010,1037,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('须有','高清彩色多普勒B超',1008,1038,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('劳浩','肝功能',3008,1039,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('孔茂以','电子计算机断层扫描CT',1003,1040,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('轩辕环','静态心电图ECG',1017,1041,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('何丽','血常规18项',4009,1042,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('郑苑','肾功能',3013,1043,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('裘言','高清彩色多普勒B超',1009,1044,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('孙亮','外科',4006,1045,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('满彬奇','一般项目',6002,1046,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('王融','耳鼻喉',2005,1047,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('巩翔','肿瘤标志物C12',6015,1048,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('计姬冰','血糖',5005,1049,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('滕江','内科',4013,1050,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('海壮','幽门螺旋杆菌检测',6011,1051,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('贾彪','内科',4014,1052,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('暨香','耳鼻喉',2006,1053,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('郁珠琬','外科',4007,1054,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('劳伯','高清彩色多普勒B超',1010,1055,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('乌爽姬','高清彩色多普勒B超',1011,1056,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('裘松','幽门螺旋杆菌检测',6012,1057,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('糜伟','高清彩色多普勒B超',1012,1058,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('羿梅洁','口腔科',2016,1059,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('燕学致','妇科尿常规12项',3002,1060,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('伊俊','妇科尿常规12项',3003,1061,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('龙露云','电子计算机断层扫描CT',1004,1062,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('羊震','一般项目',6003,1063,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('袁秀苑','电子计算机断层扫描CT',1005,1064,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('裘康','肝功能',3009,1065,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('巫爱娟','内科',4015,1066,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('隗庆','肿瘤标志物C12',6016,1067,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('邹秋妹','耳鼻喉',2007,1068,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('花固山','甲状腺功能3项',2022,1069,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('能筠','电子计算机断层扫描CT',1006,1070,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('沈霞','血脂',5008,1071,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('沙洁毓','肿瘤标志物C12',6017,1072,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('傅岩','静态心电图ECG',1018,1073,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('钦芬姣','内科',4016,1074,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('梅行','眼科',3015,1075,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('须鸣维','肾功能',3014,1076,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('隗安','血脂',5009,1077,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('惠宏','血糖',5006,1078,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('辛黛枫','一般项目',6004,1079,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('别丹','眼科',3016,1080,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('胡平伯','肝功能',3010,1081,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('羊飘秀','一般项目',6005,1082,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('邰黛','幽门螺旋杆菌检测',6013,1083,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('相志','高清彩色多普勒B超',1013,1084,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('于诚','肝功能',3011,1085,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('双建鸣','妇科尿常规12项',3004,1086,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('巩荷妍','耳鼻喉',2008,1087,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('宓固保','静态心电图ECG',1019,1088,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('麴永','耳鼻喉',2009,1089,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('怀蓓','血糖',5007,1090,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('郑义','妇科尿常规12项',3005,1091,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('暨芝','血常规18项',4010,1092,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('班羽枝','妇科尿常规12项',3006,1093,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('桂真欣','妇科尿常规12项',3007,1094,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('郁倩琦','血常规18项',4011,1095,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('融露翠','高清彩色多普勒B超',1014,1096,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('郝妍青','甲状腺功能3项',2023,1097,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('乌会','一般项目',6006,1098,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ='),('谭朋','血脂',5010,1099,'FRQW4VoiqRp92w+IURLlURDGWKodPKmFcqqYa1L/Y8ktTMPzLfelLDoXBkuZX4C2EYowjvOYwmw6lhEgMIZ140APmCdMWq3DlXRoHJrhvpGsLrcqzbrhUm20MFRB248M/ye18JeL01+4kn10kPQ0YJNc3Z2G5y0zCz3i7u+mVFQ=');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:18
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `exam`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `checkin` enum('是','否') NOT NULL,
  `一般项目` enum('0','1') NOT NULL,
  `内科` enum('0','1') NOT NULL,
  `外科` enum('0','1') NOT NULL,
  `眼科` enum('0','1') NOT NULL,
  `耳鼻喉` enum('0','1') NOT NULL,
  `口腔科` enum('0','1') NOT NULL,
  `静态心电图ECG` enum('0','1') NOT NULL,
  `妇科` enum('0','1') NOT NULL,
  `尿常规12项` enum('0','1') NOT NULL,
  `血常规18项` enum('0','1') NOT NULL,
  `肝功能` enum('0','1') NOT NULL,
  `血脂` enum('0','1') NOT NULL,
  `肾功能` enum('0','1') NOT NULL,
  `血糖` enum('0','1') NOT NULL,
  `肿瘤标志物C12` enum('0','1') NOT NULL,
  `幽门螺旋杆菌检测` enum('0','1') NOT NULL,
  `高清彩色多普勒B超` enum('0','1') NOT NULL,
  `电子计算机断层扫描CT` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('1111111111111111','2023-03-03','是','0','1','0','1','1','1','1','1','1','1','0','0','0','0','0','0','1','0'),('123412341234123412','2023-03-02','是','1','0','1','0','1','0','0','0','0','1','0','0','1','1','1','0','0','1'),('123451234512345123','2023-03-03','是','0','1','0','0','1','1','1','0','1','1','0','0','1','1','0','1','1','0'),('123456123456123456','2023-03-04','是','1','0','1','0','1','0','0','0','1','1','0','0','1','1','1','0','1','1'),('1234567890123456','2023-03-03','是','0','0','0','0','0','0','0','0','0','1','1','1','1','1','1','0','0','1'),('1234567890123456789','2023-03-03','是','1','0','1','0','1','1','1','1','1','0','0','0','0','0','0','0','0','0'),('1234567890987654321','2023-03-02','是','0','1','1','1','0','1','1','1','1','0','0','0','0','0','0','0','0','0'),('234234234234234234','2023-03-01','否','1','0','1','0','0','1','0','0','1','0','1','1','0','0','0','0','0','0'),('789789789789','2023-03-17','是','0','0','1','0','1','0','1','0','1','0','0','1','0','0','0','0','1','1');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:19
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `login`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `name` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('周均','123123'),('张三','123456'),('李八','123456'),('李四','12345678'),('王二','456789'),('赵六','666'),('邱一','123456'),('陈如','123456');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:19
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `patient`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `name` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `sex` enum('男','女') NOT NULL,
  `marriage` enum('已婚','未婚') NOT NULL,
  `id` varchar(20) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('邱一',20,'女','已婚','1111111111111111','13965484864'),('张三',38,'男','未婚','123412341234123412','13333333333'),('王五',69,'女','未婚','123451234512345123','14444444444'),('赵六',96,'男','已婚','123456123456123456','15555555555'),('周均',21,'男','已婚','1234567890123456','321654987'),('李八',21,'男','未婚','1234567890123456789','181312546351'),('陈如',21,'女','已婚','1234567890987654321','123456'),('李四',28,'女','未婚','234234234234234234','12222222222\r'),('王二',22,'男','未婚','789789789789','456456456456');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:20
-- ************************************************************
--
-- close fk
--
-- skip


-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: 9.112.40.50    Database: rhospital
-- ------------------------------------------------------
-- Server version	5.7.18-cynos-log

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
-- Table structure for table `result`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` varchar(20) NOT NULL,
  `一般项目` varchar(100) DEFAULT NULL,
  `内科` varchar(100) DEFAULT NULL,
  `外科` varchar(100) DEFAULT NULL,
  `眼科` varchar(100) DEFAULT NULL,
  `耳鼻喉` varchar(100) DEFAULT NULL,
  `口腔科` varchar(100) DEFAULT NULL,
  `静态心电图ECG` varchar(100) DEFAULT NULL,
  `妇科` varchar(100) DEFAULT NULL,
  `尿常规12项` varchar(100) DEFAULT NULL,
  `血常规18项` varchar(100) DEFAULT NULL,
  `肝功能` varchar(100) DEFAULT NULL,
  `血脂` varchar(100) DEFAULT NULL,
  `肾功能` varchar(100) DEFAULT NULL,
  `血糖` varchar(100) DEFAULT NULL,
  `肿瘤标志物C12` varchar(100) DEFAULT NULL,
  `幽门螺旋杆菌检测` varchar(100) DEFAULT NULL,
  `高清彩色多普勒B超` varchar(100) DEFAULT NULL,
  `电子计算机断层扫描CT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES ('1111111111111111','羊震-身高： 180cm  体重：  45kg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('123456123456123456','乌会-正常',NULL,'符亚珠-正常',NULL,'何东民-正常',NULL,NULL,NULL,'郑义-正常','何丽-正常',NULL,NULL,'郑苑-正常','严震宁-正常','巩翔-正常',NULL,'相志-正常','袁秀苑-正常'),('1234567890123456',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'双思-正常','乌爽姬-不正常',NULL),('1234567890123456789',NULL,'滕江-各项均正常',NULL,'别丹-不正常',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1234567890987654321','酆义军-身高：180cm 体重：60kg',NULL,NULL,NULL,'莫晶青-正常',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('789789789789','酆义军-正常',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'郑苑-正常',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 10:08:20
