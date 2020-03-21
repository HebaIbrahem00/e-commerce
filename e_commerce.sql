-- MySQL dump 10.14  Distrib 5.5.64-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: e_commerce
-- ------------------------------------------------------
-- Server version	5.5.64-MariaDB

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `birthDate` date NOT NULL,
  `address1` longtext NOT NULL,
  `address2` longtext NOT NULL,
  `slug` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `creditNumber` varchar(19) NOT NULL,
  `signup_confirmation` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_profile_slug_8a7a322e` (`slug`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'','','','','F','2020-03-21','','',NULL,'','',0,1);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add profile',1,'add_profile'),(2,'Can change profile',1,'change_profile'),(3,'Can delete profile',1,'delete_profile'),(4,'Can view profile',1,'view_profile'),(5,'Can add reviews',2,'add_reviews'),(6,'Can change reviews',2,'change_reviews'),(7,'Can delete reviews',2,'delete_reviews'),(8,'Can view reviews',2,'view_reviews'),(9,'Can add favourite',3,'add_favourite'),(10,'Can change favourite',3,'change_favourite'),(11,'Can delete favourite',3,'delete_favourite'),(12,'Can view favourite',3,'view_favourite'),(13,'Can add comments',4,'add_comments'),(14,'Can change comments',4,'change_comments'),(15,'Can delete comments',4,'delete_comments'),(16,'Can view comments',4,'view_comments'),(17,'Can add brand',5,'add_brand'),(18,'Can change brand',5,'change_brand'),(19,'Can delete brand',5,'delete_brand'),(20,'Can view brand',5,'view_brand'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add product',7,'add_product'),(26,'Can change product',7,'change_product'),(27,'Can delete product',7,'delete_product'),(28,'Can view product',7,'view_product'),(29,'Can add sub_ category',8,'add_sub_category'),(30,'Can change sub_ category',8,'change_sub_category'),(31,'Can delete sub_ category',8,'delete_sub_category'),(32,'Can view sub_ category',8,'view_sub_category'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add favorite',10,'add_favorite'),(38,'Can change favorite',10,'change_favorite'),(39,'Can delete favorite',10,'delete_favorite'),(40,'Can view favorite',10,'view_favorite'),(41,'Can add visa',11,'add_visa'),(42,'Can change visa',11,'change_visa'),(43,'Can delete visa',11,'delete_visa'),(44,'Can view visa',11,'view_visa'),(45,'Can add purchase',12,'add_purchase'),(46,'Can change purchase',12,'change_purchase'),(47,'Can delete purchase',12,'delete_purchase'),(48,'Can view purchase',12,'view_purchase'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add permission',14,'add_permission'),(54,'Can change permission',14,'change_permission'),(55,'Can delete permission',14,'delete_permission'),(56,'Can view permission',14,'view_permission'),(57,'Can add group',15,'add_group'),(58,'Can change group',15,'change_group'),(59,'Can delete group',15,'delete_group'),(60,'Can view group',15,'view_group'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add content type',17,'add_contenttype'),(66,'Can change content type',17,'change_contenttype'),(67,'Can delete content type',17,'delete_contenttype'),(68,'Can view content type',17,'view_contenttype'),(69,'Can add session',18,'add_session'),(70,'Can change session',18,'change_session'),(71,'Can delete session',18,'delete_session'),(72,'Can view session',18,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$nfslS2UazrTP$vxdc4ajc5pgFtbgU9W4vgEH37cYtebmjZAqDv4ghLb4=','2020-03-21 01:29:28.643938',1,'admin','','','',1,1,'2020-03-21 01:29:02.480276');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` varchar(255) NOT NULL,
  `cartProduct_id` int(11) NOT NULL,
  `cartUser_id` int(11) NOT NULL,
  `addingDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_cartProduct_id_b926776a_fk_products_product_id` (`cartProduct_id`),
  KEY `cart_cart_cartUser_id_02c9cac7_fk_auth_user_id` (`cartUser_id`),
  CONSTRAINT `cart_cart_cartUser_id_02c9cac7_fk_auth_user_id` FOREIGN KEY (`cartUser_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cart_cart_cartProduct_id_b926776a_fk_products_product_id` FOREIGN KEY (`cartProduct_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_favorite`
--

DROP TABLE IF EXISTS `cart_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_favorite_product_id_7bc91286_fk_products_product_id` (`product_id`),
  KEY `cart_favorite_user_id_12833bdd_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cart_favorite_user_id_12833bdd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `cart_favorite_product_id_7bc91286_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_favorite`
--

LOCK TABLES `cart_favorite` WRITE;
/*!40000 ALTER TABLE `cart_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-21 01:29:43.565317','1','Elctronics',1,'[{\"added\": {}}]',6,1),(2,'2020-03-21 01:30:02.342874','1','Laptop',1,'[{\"added\": {}}]',8,1),(3,'2020-03-21 01:30:22.412511','2','Mobile Phones',1,'[{\"added\": {}}]',8,1),(4,'2020-03-21 01:30:43.950581','1','DELL Laptop',1,'[{\"added\": {}}]',5,1),(5,'2020-03-21 01:30:50.091452','2','HP Laptop',1,'[{\"added\": {}}]',5,1),(6,'2020-03-21 01:31:09.909362','3','Xiaomi Mobile Phones',1,'[{\"added\": {}}]',5,1),(7,'2020-03-21 01:31:18.126048','4','OPPO Mobile Phones',1,'[{\"added\": {}}]',5,1),(8,'2020-03-21 01:34:53.942629','1','Inspiron n 4050',1,'[{\"added\": {}}]',7,1),(9,'2020-03-21 01:39:15.016140','2','DELL Inspiron 15-3581',1,'[{\"added\": {}}]',7,1),(10,'2020-03-21 01:41:56.743650','3','DELL Latitude 5500 Laptop',1,'[{\"added\": {}}]',7,1),(11,'2020-03-21 01:44:24.992079','4','DELL Latitude 7280',1,'[{\"added\": {}}]',7,1),(12,'2020-03-21 01:47:25.061509','5','HP ProBook 450 G6',1,'[{\"added\": {}}]',7,1),(13,'2020-03-21 01:49:13.736107','6','HP Omen 15-dc0045nr',1,'[{\"added\": {}}]',7,1),(14,'2020-03-21 01:54:04.393660','7','HP Envy 17 Laptop',1,'[{\"added\": {}}]',7,1),(15,'2020-03-21 01:55:38.142232','7','HP Envy 17 Laptop',2,'[{\"changed\": {\"fields\": [\"Product rate\", \"Image1\", \"Image2\", \"Image3\"]}}]',7,1),(16,'2020-03-21 01:58:09.208827','8','HP ProBook 11 EE G2 Laptop',1,'[{\"added\": {}}]',7,1),(17,'2020-03-21 02:01:46.850566','9','Xiaomi Redmi Note 8',1,'[{\"added\": {}}]',7,1),(18,'2020-03-21 02:03:57.268878','10','Xiaomi Mi A3',1,'[{\"added\": {}}]',7,1),(19,'2020-03-21 02:06:04.860138','11','OPPO Reno 2F Dual SIM',1,'[{\"added\": {}}]',7,1),(20,'2020-03-21 02:08:28.406994','12','OPPO Realme 5 Dual Sim',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'accounts','profile'),(13,'admin','logentry'),(15,'auth','group'),(14,'auth','permission'),(16,'auth','user'),(9,'cart','cart'),(10,'cart','favorite'),(17,'contenttypes','contenttype'),(5,'products','brand'),(6,'products','category'),(7,'products','product'),(8,'products','sub_category'),(12,'purchase','purchase'),(11,'purchase','visa'),(18,'sessions','session'),(4,'user','comments'),(3,'user','favourite'),(2,'user','reviews');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-21 01:27:11.805246'),(2,'auth','0001_initial','2020-03-21 01:27:12.391043'),(3,'accounts','0001_initial','2020-03-21 01:27:13.665482'),(4,'admin','0001_initial','2020-03-21 01:27:13.955824'),(5,'admin','0002_logentry_remove_auto_add','2020-03-21 01:27:14.182338'),(6,'admin','0003_logentry_add_action_flag_choices','2020-03-21 01:27:14.214525'),(7,'contenttypes','0002_remove_content_type_name','2020-03-21 01:27:14.481687'),(8,'auth','0002_alter_permission_name_max_length','2020-03-21 01:27:14.615195'),(9,'auth','0003_alter_user_email_max_length','2020-03-21 01:27:14.760132'),(10,'auth','0004_alter_user_username_opts','2020-03-21 01:27:14.810279'),(11,'auth','0005_alter_user_last_login_null','2020-03-21 01:27:14.949243'),(12,'auth','0006_require_contenttypes_0002','2020-03-21 01:27:14.960555'),(13,'auth','0007_alter_validators_add_error_messages','2020-03-21 01:27:15.013767'),(14,'auth','0008_alter_user_username_max_length','2020-03-21 01:27:15.169979'),(15,'auth','0009_alter_user_last_name_max_length','2020-03-21 01:27:15.292520'),(16,'auth','0010_alter_group_name_max_length','2020-03-21 01:27:15.403547'),(17,'auth','0011_update_proxy_permissions','2020-03-21 01:27:15.432077'),(18,'user','0001_initial','2020-03-21 01:27:15.509055'),(19,'products','0001_initial','2020-03-21 01:27:16.144320'),(20,'products','0002_auto_20200306_2133','2020-03-21 01:27:18.067700'),(21,'products','0003_auto_20200307_1002','2020-03-21 01:27:19.627597'),(22,'user','0002_comments_favourite_reviews','2020-03-21 01:27:19.917080'),(23,'user','0003_auto_20200317_1805','2020-03-21 01:27:20.957219'),(24,'products','0004_category_cat_img','2020-03-21 01:27:21.129396'),(25,'products','0005_auto_20200308_1516','2020-03-21 01:27:22.617020'),(26,'products','0006_remove_product_product_ratedby','2020-03-21 01:27:22.765600'),(27,'products','0007_auto_20200309_1016','2020-03-21 01:27:22.827683'),(28,'products','0008_auto_20200317_1805','2020-03-21 01:27:22.899777'),(29,'products','0009_remove_sub_category_sub_cat_img','2020-03-21 01:27:23.008768'),(30,'cart','0001_initial','2020-03-21 01:27:23.123545'),(31,'cart','0002_remove_cart_addingdate','2020-03-21 01:27:23.478247'),(32,'cart','0003_cart_addingdate','2020-03-21 01:27:23.645194'),(33,'cart','0004_favorite','2020-03-21 01:27:23.756618'),(34,'cart','0005_auto_20200319_0000','2020-03-21 01:27:24.657039'),(35,'cart','0006_auto_20200320_0409','2020-03-21 01:27:25.255003'),(36,'cart','0007_auto_20200321_0127','2020-03-21 01:27:25.691503'),(37,'products','0010_product_product_desc','2020-03-21 01:27:25.815600'),(38,'products','0011_auto_20200319_0316','2020-03-21 01:27:25.851663'),(39,'products','0012_product_product_model','2020-03-21 01:27:25.969368'),(40,'products','0013_auto_20200320_0159','2020-03-21 01:27:26.130544'),(41,'products','0014_auto_20200321_0127','2020-03-21 01:27:26.343274'),(42,'purchase','0001_initial','2020-03-21 01:27:26.544751'),(43,'purchase','0002_auto_20200320_0409','2020-03-21 01:27:29.127939'),(44,'purchase','0003_auto_20200321_0127','2020-03-21 01:27:29.437033'),(45,'sessions','0001_initial','2020-03-21 01:27:29.532772'),(46,'user','0004_auto_20200321_0127','2020-03-21 01:27:30.529823');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('78y1xwnr59na4rffs58k708j738ga1mz','YTlhMTczYzJiNjUzN2E3MGM3ZGRiNmZlMTUzZjA5MzVjZmEyOTZkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NjNkMmU1MmJkY2M4MzE2YmRkNmM0MDgyOTBmMzM5MDQ3Yzc0NmFjIn0=','2020-04-04 01:29:28.677526');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_brand_sub_cat_id_a36a69f9_fk_products_sub_category_id` (`sub_cat_id`),
  CONSTRAINT `products_brand_sub_cat_id_a36a69f9_fk_products_sub_category_id` FOREIGN KEY (`sub_cat_id`) REFERENCES `products_sub_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (1,'DELL',1),(2,'HP',1),(3,'Xiaomi',2),(4,'OPPO',2);
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (1,'Elctronics');
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `product_color` varchar(50) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_amount` int(11) NOT NULL,
  `product_rate` int(11)  NULL,
  `brand_id` int(11) NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `product_desc` longtext,
  `product_model` varchar(50) DEFAULT NULL,
  `product_details` longtext,
  PRIMARY KEY (`id`),
  KEY `products_product_brand_id_3e2e8fd1_fk_products_brand_id` (`brand_id`),
  CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'Inspiron n 4050','black',3000,3,0,1,'product_imgs/LargePNG.png','product_imgs/download_1_AjCQVZZ.jpeg','product_imgs/download.jpeg','Dell Inspiron n 4050 14 inch laptop','Inspiron','Corei5 - 8GB RAM -500GB HDD ...'),(2,'DELL Inspiron 15-3581','red',4500,5,1,1,'product_imgs/1.jpg','product_imgs/2.jpg','product_imgs/3.jpg','DELL Inspiron 15-3581 Laptop 15.6-inch FHD','Inspiron','Processor\r\n\r\nIntel® Core™ i3-7020U Processor, 2.30 GHz (3M Cache, # of Cores: 2)\r\nMemory\r\n\r\nInstalled Memory: 4GB DDR4 at 2666MHz (1x4GB)\r\nDisplay\r\n\r\nScreen Size: 15.6-inch\r\nResolution: FHD (1920 x 1080)\r\nTechnology: Anti-Glare LED-Backlit Non-touch Display'),(3,'DELL Latitude 5500 Laptop','gray',5000,8,1,1,'product_imgs/1_1.jpg','product_imgs/3_Yl7T2Bx.jpg','product_imgs/2_sdOvQvX.jpg','DELL Latitude 5500 Laptop - Intel Core I5 - 4GB RAM - 1TB HDD - 15.6-inch HD - Intel GPU - Ubuntu - Black','Latitude','Processor\r\n\r\nIntel® Core™ i5-8265U Processor, 1.60 GHz (6M Cache, up to 3.90 GHz, # of Cores: 4)\r\nMemory\r\n\r\nInstalled Memory: 4GB DDR4 at 2666MHz (1x4GB)\r\nDisplay\r\n\r\nScreen Size: 15.6-inch\r\nResolution: 15.6\" HD (1366 x 768)\r\nTechnology: Anti-Glare LED-Backlit Non-touch Display'),(4,'DELL Latitude 7280','silver',6000,3,1,1,'product_imgs/1_T4rSiqx.jpg','product_imgs/2_gUp4rQh.jpg','product_imgs/3_PetA0aY.jpg','DELL Latitude 7280 - Intel Core I7 - 7600U - 8GB RAM - 256GB SSD - 12.5-inch HD - Black','Latitude','Actual Weight 2.60 lb(s)\r\nAudio Audio Output Type: Integrated\r\nConnectivity Dock Port: No\r\nContents Notebook, battery pack, AC adapter, fingerprint reader, webcam, software, documentation\r\nEnvironmental Standards ENERGY STAR Qualified: Yes ENERGY STAR Version: 6.1 EPEAT Compliant: Yes EPEAT Level: EPEAT Gold\r\nGeneral Chassis Form Factor: Portable Color: Black Input Device Type: Fingerprint sensor, Keyboard, Touchpad, Webcam Weight: 2.600 lb(s)\r\nMemory Cache Memory (installed): 4 MB RAM (installed): 8.0 GB RAM (max): 16 GB RAM Technology: DDR4 SDRAM\r\nMemory Notes 8GB (1x8GB) 2133MHz DDR4 SDRAM, expandable to 16GB.\r\nThere is one SO-DIMM slot that holds a removable 8GB chip.'),(5,'HP ProBook 450 G6','white',4000,4,0,2,'product_imgs/1_ogmKgDD.jpg','product_imgs/2_xj8BYJX.jpg','product_imgs/3_wERt68l.jpg','HP ProBook 450 G6 Laptop - Intel Core I5 - 8GB RAM - 1TB HDD','ProBook','Processor\r\n\r\nIntel® Core™ i5-8265U with Intel® UHD Graphics 620 (1.6 GHz base frequency, up to 3.9 GHz with Intel® Turbo Boost Technology, 6 MB cache, 4 cores)\r\nMemory\r\n\r\n8 GB DDR4-2400 SDRAM (1 x 8 GB)\r\nDisplay\r\n\r\n39.6 cm (15.6-inch) diagonal HD SVA eDP anti-glare LED-backlit, 220 cd/m², 67% sRGB (1366 x 768)\r\nGraphics\r\n\r\nIntegrated: Intel® UHD Graphics 620\r\nDiscrete: NVIDIA® GeForce® MX130 (2 GB DDR5 dedicated)'),(6,'HP Omen 15-dc0045nr','black-red',10000,2,1,2,'product_imgs/1_1_uFs0Gh8.jpg','product_imgs/2_1.jpg','product_imgs/3_1.jpg','HP Omen 15-dc0045nr Gaming Laptop - Intel Core I7-8750H','Omen','Processor\r\n\r\n8th generation Intel® Core™ i7-8750H Processor (2.2GHz with Turbo Boost up to 4.1GHz, 9M cache, 4 cores)\r\nMemory\r\n\r\n32 GB DDR4-2666 SDRAM (2 x 16 GB)\r\nMemory slot not user accessible\r\nDisplay\r\n\r\n15.6\" diagonal FHD 144 Hz IPS anti-glare micro-edge WLED-backlit (1920 x 1080)\r\nGraphics\r\n\r\nNVIDIA® GeForce® GTX1070 Graphics with 8 GB GDDR5 of dedicated video memory'),(7,'HP Envy 17 Laptop','bronze',6000,4,0,2,'product_imgs/1_IabNYit.jpg','product_imgs/2_Tv8Ex5W.jpg','product_imgs/3_lvnS6kD.jpg','HP Envy 17 Laptop - Intel Core I7 - 8GB RAM - 1TB HDD + 16GB Intel Optane','Envy','Intel® Core™ i7-8550U 1.8 GHz , up to 4.0 GHz Intel® Turbo Boost Tech, 8 MB cache, Quad Core \r\n8 GB DDR4-2400 SDRAM (1 x 8 GB)\r\n1 TB HDD+ 16 GB Intel Optane\r\n17.3\" diagonal FHD IPS WLED-backlit (1920 x 1080)\r\nNVIDIA® GeForce® MX150 - 2 GB GDDR5 Ded.\r\nFull-size island-style backlit keyboard with numeric keypad , Touchpad with multi-touch gesture support , Intel® 802.11b/g/n/ac  Wi-Fi® and Bluetooth® 4.2 Combo , Integrated 10/100/1000 GbE LAN , 1 multi-format SD media card reader 1 HDMI 2.0; 1 headphone/microphone combo; 1 RJ-45;\r\n1 USB 3.1 Type-C™ Gen 1 (Data Transfer up to 5 Gb/s, DP1.2, HP Sleep and Charge); 3 USB 3.1'),(8,'HP ProBook 11 EE G2 Laptop','blue',7999,5,1,2,'product_imgs/1_jeXjMnJ.jpg','product_imgs/2_zNcijND.jpg','product_imgs/3_GgK6wBJ.jpg','HP ProBook 11 EE G2 Laptop - Intel Core I3 - 8GB RAM - 128GB SSD - 11.6\" HD Touch - Intel GPU','ProBook','Processor\r\n\r\nIntel® Core™ i3-6100U with Intel HD Graphics 520 (2.3 GHz, 3 MB cache, 2 cores)\r\nMemory\r\n\r\nInstalled Memory: 8 GB\r\nDisplay\r\n\r\nScreen Size: 11.6\"\r\nResolution: HD LED (3.6mm) SVA, 220 nits, (1366 x 768) Touch with Corning® Gorilla® Glass'),(9,'Xiaomi Redmi Note 8','blue',3000,9,0,3,'product_imgs/item_XL_78505913_8933cfd5f0ea7.jpg','product_imgs/item_XL_78505913_ba5d8e3bc80e1.jpg','product_imgs/item_XL_78505913_f059b6afd77f2.jpg','Xiaomi Redmi Note 8 Dual SIM - 64GB, 4GB RAM, 4G LTE, Neptune Blue','Redmi','The Xiaomi Dual SIM Redmi Note 8 Smartphone simplifies your digital life with its top-notch performance and efficiency. It sports a glossy, sleek design that gives it an eye-catching look. The Xiaomi Redmi Note 8 smartphone has a 6.3inch TÜV Rheinland certified display that doesn\'t strain your eyes and allows effective use for hours at a stretch. It has a super wide-angle camera'),(10,'Xiaomi Mi A3','red',3450,4,1,3,'product_imgs/item_XL_68294872_07e29dfb19c78_1.jpg','product_imgs/item_XL_68294872_716fa1a1216e4.jpg','product_imgs/item_XL_68294872_f7e4280b213c4.jpg','Xiaomi Mi A3 Dual Sim - 64GB, 4GB RAM, 4G LTE, Grey','Mi','Features:\r\n\r\n48MP AI Triple Camera, Ultra Wide-angle.\r\n4030mAh High-capacity Battery.\r\nIn-screen Fingerprint Sensor.\r\nQualcomm Snapdragon 665 Processor.\r\nAndroid One Empowered.\r\nBack-front Corning Gorilla Glass 5.\r\nColor: Grey'),(11,'OPPO Reno 2F Dual SIM','gray',5400,8,0,4,'product_imgs/item_XL_95995395_01b7fcbdf3d4d.jpg','product_imgs/item_XL_95995395_70fb9d8d53f1c.jpg','product_imgs/item_XL_95995395_3461f4778cb3b.jpg','OPPO Reno 2F Dual SIM - 128GB, 8GB RAM, 4G LTE, Nebula Green','Reno','BrandOPPO\r\nOperating System TypeAndroid\r\nPackage thickness23 centimeters\r\nStorage Capacity128 GB\r\nPackage weight in KGs580 grams\r\nNumber Of SIMDual SIM\r\nMobile Phone TypeSmartphone\r\nCellular Network Technology4G LTE'),(12,'OPPO Realme 5 Dual Sim','white',2575,9,0,4,'product_imgs/item_XL_79985159_420766d43e1e7.jpg','product_imgs/item_XL_79985159_a656710459c61.jpg','product_imgs/item_XXL_83806219_6b3ffda16474d.jpg','Realme 5 Dual Sim, 64GB, 3GB RaM, 4G LTE - crystal blue','Realme','Fast Charge : 1\r\nExternal Product ID : 6971914085978\r\nMobile Phone Type : Smartphone\r\nExternal Product ID Type : EAN-13\r\nBrand : OPPO');
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_sub_category`
--

DROP TABLE IF EXISTS `products_sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_sub_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_cat_name` varchar(50) NOT NULL,
  `cat_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_sub_category_cat_id_70f1aae4_fk_products_category_id` (`cat_id`),
  CONSTRAINT `products_sub_category_cat_id_70f1aae4_fk_products_category_id` FOREIGN KEY (`cat_id`) REFERENCES `products_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_sub_category`
--

LOCK TABLES `products_sub_category` WRITE;
/*!40000 ALTER TABLE `products_sub_category` DISABLE KEYS */;
INSERT INTO `products_sub_category` VALUES (1,'Laptop',1),(2,'Mobile Phones',1);
/*!40000 ALTER TABLE `products_sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_purchase`
--

DROP TABLE IF EXISTS `purchase_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cash` tinyint(1) NOT NULL,
  `cartUser_id` int(11) NOT NULL,
  `visaInfo_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `address_details` varchar(100) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_purchase_visaInfo_id_a158f0ea_fk_purchase_visa_id` (`visaInfo_id`),
  KEY `purchase_purchase_cart_id_e07ff6a6_fk_cart_cart_id` (`cart_id`),
  KEY `purchase_purchase_cartUser_id_11ecef40_fk_auth_user_id` (`cartUser_id`),
  CONSTRAINT `purchase_purchase_cartUser_id_11ecef40_fk_auth_user_id` FOREIGN KEY (`cartUser_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `purchase_purchase_cart_id_e07ff6a6_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `purchase_purchase_visaInfo_id_a158f0ea_fk_purchase_visa_id` FOREIGN KEY (`visaInfo_id`) REFERENCES `purchase_visa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_purchase`
--

LOCK TABLES `purchase_purchase` WRITE;
/*!40000 ALTER TABLE `purchase_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_visa`
--

DROP TABLE IF EXISTS `purchase_visa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_visa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_expiry` date DEFAULT NULL,
  `card_number` varchar(25),
  `card_owner` varchar(100) NOT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_visa`
--

LOCK TABLES `purchase_visa` WRITE;
/*!40000 ALTER TABLE `purchase_visa` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_visa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_comments`
--

DROP TABLE IF EXISTS `user_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Comment` varchar(250) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_comments_user_id_product_id_Comment_bfe89b58_uniq` (`user_id`,`product_id`,`Comment`),
  KEY `user_comments_product_id_ed3145fa_fk_products_product_id` (`product_id`),
  CONSTRAINT `user_comments_user_id_2271165b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_comments_product_id_ed3145fa_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_comments`
--

LOCK TABLES `user_comments` WRITE;
/*!40000 ALTER TABLE `user_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favourite`
--

DROP TABLE IF EXISTS `user_favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_favourite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_favourite_user_id_product_id_b003543c_uniq` (`user_id`,`product_id`),
  KEY `user_favourite_product_id_87c785be_fk_products_product_id` (`product_id`),
  CONSTRAINT `user_favourite_user_id_cf0135d8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_favourite_product_id_87c785be_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favourite`
--

LOCK TABLES `user_favourite` WRITE;
/*!40000 ALTER TABLE `user_favourite` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favourite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Review` int(11) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_reviews_user_id_product_id_87b21055_uniq` (`user_id`,`product_id`),
  KEY `user_reviews_product_id_2e6972bd_fk_products_product_id` (`product_id`),
  CONSTRAINT `user_reviews_user_id_0753da5e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `user_reviews_product_id_2e6972bd_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reviews`
--

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-21  4:34:10
