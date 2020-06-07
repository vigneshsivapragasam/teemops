-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: teemops_schema
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `allowed_instance_types`
--

DROP TABLE IF EXISTS `allowed_instance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allowed_instance_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `order` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allowed_instance_types`
--

LOCK TABLES `allowed_instance_types` WRITE;
/*!40000 ALTER TABLE `allowed_instance_types` DISABLE KEYS */;
INSERT INTO `allowed_instance_types` VALUES (1,'t2.micro',NULL),(2,'t2.nano',NULL),(3,'t2.small',NULL),(4,'t2.medium',NULL),(5,'t2.large',NULL),(6,'t2.xlarge',NULL),(7,'t2.2xlarge',NULL),(8,'a1.medium',NULL),(9,'a1.large',NULL),(10,'a1.xlarge',NULL),(11,'a1.2xlarge',NULL),(12,'a1.4xlarge',NULL),(13,'t3.nano',NULL),(14,'t3.micro',NULL),(15,'t3.small',NULL),(16,'t3.medium',NULL),(17,'t3.large',NULL),(18,'t3.xlarge',NULL),(19,'t3.2xlarge',NULL),(20,'m5.large',NULL),(21,'m5.xlarge',NULL),(22,'m5.2xlarge',NULL),(23,'m5.4xlarge',NULL),(24,'m5.12xlarge',NULL),(25,'m5.24xlarge',NULL),(26,'m5.metal',NULL),(27,'m4.large',NULL),(28,'m4.xlarge',NULL),(29,'m4.2xlarge',NULL),(30,'m4.4xlarge',NULL),(31,'m4.10xlarge',NULL),(32,'m4.16xlarge',NULL),(33,'c5.large',NULL),(34,'c5.xlarge',NULL),(35,'c5.2xlarge',NULL),(36,'c5.4xlarge',NULL),(37,'c5.9xlarge',NULL),(38,'c5.18xlarge',NULL),(39,'c4.large',NULL),(40,'c4.xlarge',NULL),(41,'c4.2xlarge',NULL),(42,'c4.4xlarge',NULL),(43,'c4.8xlarge',NULL),(44,'r5.large',NULL),(45,'r5.xlarge',NULL),(46,'r5.2xlarge',NULL),(47,'r5.4xlarge',NULL),(48,'r5.12xlarge',NULL),(49,'r5.24xlarge',NULL),(50,'r4.large',NULL),(51,'r4.xlarge',NULL),(52,'r4.2xlarge',NULL),(53,'r4.4xlarge',NULL),(54,'r4.8xlarge',NULL),(55,'r4.16xlarge',NULL);
/*!40000 ALTER TABLE `allowed_instance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '6',
  `cloud` int(11) DEFAULT NULL,
  `data` blob,
  `appurl` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `app_provider_id` int(11) NOT NULL,
  `user_data_provider_id` int(11) DEFAULT NULL,
  `aws_config_data_id` int(11) DEFAULT NULL,
  `user_cloud_provider_id` int(11) DEFAULT NULL,
  `meta_data` blob,
  `notify` text,
  `archive` tinyint(4) DEFAULT NULL,
  `isasg` tinyint(4) DEFAULT NULL,
  `isalb` tinyint(4) DEFAULT NULL,
  `asg_min` int(1) DEFAULT NULL,
  `asg_max` int(2) DEFAULT NULL,
  `platform` int(11) DEFAULT NULL,
  `environment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_data_provider_id_idx` (`user_data_provider_id`),
  KEY `FK_app_provider_id_idx` (`app_provider_id`),
  KEY `FK_aws_config_data_id_idx` (`aws_config_data_id`),
  KEY `FK_app_user_id_idx` (`userid`),
  KEY `FK_app_environment_idx` (`environment`),
  CONSTRAINT `FK_app_environment` FOREIGN KEY (`environment`) REFERENCES `lookup_environment` (`id`),
  CONSTRAINT `FK_app_provider_id` FOREIGN KEY (`app_provider_id`) REFERENCES `app_provider` (`id`),
  CONSTRAINT `FK_app_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_aws_config_data_id` FOREIGN KEY (`aws_config_data_id`) REFERENCES `user_data_aws_configs` (`id`),
  CONSTRAINT `FK_user_data_provider_id` FOREIGN KEY (`user_data_provider_id`) REFERENCES `user_data_providers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_alb`
--

DROP TABLE IF EXISTS `app_alb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_alb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` int(11) NOT NULL,
  `subnets` varchar(255) DEFAULT NULL,
  `listeners` varchar(45) DEFAULT NULL,
  `sslArn` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_alb`
--

LOCK TABLES `app_alb` WRITE;
/*!40000 ALTER TABLE `app_alb` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_alb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_code`
--

DROP TABLE IF EXISTS `app_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_code` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(45) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `source` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_code`
--

LOCK TABLES `app_code` WRITE;
/*!40000 ALTER TABLE `app_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_integrations`
--

DROP TABLE IF EXISTS `app_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_integrations` (
  `id` int(11) NOT NULL,
  `appid` bigint(11) NOT NULL,
  `integrationid` int(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_integrations`
--

LOCK TABLES `app_integrations` WRITE;
/*!40000 ALTER TABLE `app_integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_provider`
--

DROP TABLE IF EXISTS `app_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `system` varchar(255) DEFAULT NULL,
  `docker` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `enabled` varchar(45) DEFAULT NULL,
  `aws_account_id` varchar(30) DEFAULT NULL,
  `aws_ami_name` text,
  `connect_user` varchar(45) NOT NULL,
  `connect_type` varchar(45) NOT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_provider`
--

LOCK TABLES `app_provider` WRITE;
/*!40000 ALTER TABLE `app_provider` DISABLE KEYS */;
INSERT INTO `app_provider` VALUES (1,'Ubuntu 14.04 LTS',NULL,NULL,NULL,'Default Ubuntu Image','ubuntu-logo.png','blank','0','099720109477','ubuntu/images*hvm-ssd*ubuntu-trusty-14.04-amd64-server*','ubuntu','ssh',NULL),(2,'Windows 2012 R2',NULL,NULL,NULL,'Windows 2012 R2 Base Image','windows-server-2012-logo.png','blank','0','amazon','Windows_Server-2012-R2_RTM-English-64Bit-Base*','Administrator','rdp',NULL),(3,'Redhat 7',NULL,NULL,NULL,'Latest Supported Redhat 7',NULL,'blank','1','309956199498','RHEL-7.*HVM*','ec2-user','ssh',NULL),(4,'PHP','php',NULL,'Latest Ubuntu LTS','PHP/Apache 2','php.logo.png','predefined','1',NULL,'ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13),(5,'Node.JS',NULL,NULL,'Latest Ubuntu LTS','Node/NGINX','node-js-logo.png','predefined','1',NULL,'ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13),(6,'JAVA',NULL,NULL,'Redhat 7','Apache Tomcat/JAVA 8','java-apache-tomcat-logo.png','predefined','0',NULL,NULL,'ec2-user','ssh',13),(7,'ASP.NET',NULL,NULL,'Windows 2019','.NET Framework 5.0/IIS','asp-net-logo.png','predefined','0','amazon','Windows_Server-2019-English-Full-Base*','Administrator','rdp',12),(8,'Ubuntu 16.04 LTS',NULL,NULL,NULL,'The latest Ubuntu Server','ubuntu-logo.png','blank','1','099720109477','ubuntu/images*hvm-ssd*ubuntu-xenial-16.04-amd64-server*','ubuntu','ssh',8),(9,'Windows 2016',NULL,NULL,NULL,'Windows 2016 Base Image','windows-server-2012-logo.png','blank','1','amazon','Windows_Server-2016-English-Full-Base*','Administrator','rdp',9),(10,'Amazon Linux',NULL,NULL,NULL,'AWS Provided Server',NULL,'blank','1','amazon','amzn-ami-hvm*x86_64*','ec2-user','ssh',10),(11,'SAP HANA',NULL,NULL,NULL,'SAP Hana on Redhat','sap-hana-logo.png','blank','0','099720109477','sap-hana-','','',NULL),(12,'Windows 2019',NULL,NULL,NULL,'Windows 2019 Base Image','windows-server-2012-logo.png','blank','1','amazon','Windows_Server-2019-English-Full-Base*','Administrator','rdp',12),(13,'Ubuntu 18.04 LTS',NULL,NULL,NULL,'Ubuntu 18.04 LTS Base Image','ubuntu-logo.png','blank','1','099720109477','ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13),(14,'PHP NGINX',NULL,NULL,'Latest Ubuntu LTS','PHP/NGINX','ubuntu-logo.png','stack','1','099720109477','ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13),(15,'Custom Bash Script',NULL,NULL,'Latest Ubuntu LTS','Custom bash script from your own code (Ubuntu Only)','ubuntu-logo.png','custom','1','099720109477','ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13),(16,'PHP 7.1','php71','teem/php71build','Ubuntu LTS','PHP 7.1 / Apache 2','php.logo.png','predefined','1',NULL,'ubuntu/images*hvm-ssd*ubuntu-bionic-18.04-amd64-server*','ubuntu','ssh',13);
/*!40000 ALTER TABLE `app_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_provider_image_list`
--

DROP TABLE IF EXISTS `app_provider_image_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_provider_image_list` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `image_id` varchar(255) NOT NULL,
  `cloud_provider_id` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `is_custom` tinyint(4) NOT NULL DEFAULT '0',
  `app_provider_id` int(11) NOT NULL,
  `timestamp` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_app_provider_id_idx` (`app_provider_id`),
  CONSTRAINT `FK_app_provider_image_list_id` FOREIGN KEY (`app_provider_id`) REFERENCES `app_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_provider_image_list`
--

LOCK TABLES `app_provider_image_list` WRITE;
/*!40000 ALTER TABLE `app_provider_image_list` DISABLE KEYS */;
INSERT INTO `app_provider_image_list` VALUES (1,'ami-8db945ed',1,'us-west-2',0,2,0),(2,'ami-d732f0b7',1,'us-west-2',0,1,0),(3,'ami-775e4f16',1,'us-west-2',0,3,0),(4,'ami-19f78076',1,'ap-south-1',0,1,1484089447),(5,'ami-b5e790da',1,'ap-south-1',0,2,1484089449),(6,'ami-917205fe',1,'ap-south-1',0,3,1484089449),(7,'ami-45eae021',1,'eu-west-2',0,1,1484089453),(8,'ami-7bd4de1f',1,'eu-west-2',0,2,1484089454),(9,'ami-9c363cf8',1,'eu-west-2',0,3,1484089454),(10,'ami-30b59b43',1,'eu-west-1',0,1,1484089466),(11,'ami-ab381ed8',1,'eu-west-1',0,2,1484089475),(12,'ami-02ace471',1,'eu-west-1',0,3,1484089477),(13,'ami-d99345b7',1,'ap-northeast-2',0,1,1484089485),(14,'ami-b869bed6',1,'ap-northeast-2',0,2,1484089487),(15,'ami-a9e532c7',1,'ap-northeast-2',0,3,1484089488),(16,'ami-1794e470',1,'ap-northeast-1',0,1,1484089499),(17,'ami-3087e957',1,'ap-northeast-1',0,2,1484089508),(18,'ami-5de0433c',1,'ap-northeast-1',0,3,1484089510),(19,'ami-d92ab1b5',1,'sa-east-1',0,1,1484089519),(20,'ami-3aeb7356',1,'sa-east-1',0,2,1484089525),(21,'ami-7de77b11',1,'sa-east-1',0,3,1484089526),(22,'ami-70299b14',1,'ca-central-1',0,1,1484089529),(23,'ami-04259760',1,'ca-central-1',0,2,1484089530),(24,'ami-b764d6d3',1,'ca-central-1',0,3,1484089530),(25,'ami-99b31bfa',1,'ap-southeast-1',0,1,1484089539),(26,'ami-a96cc3ca',1,'ap-southeast-1',0,2,1484089541),(27,'ami-22953841',1,'ap-southeast-1',0,3,1484089542),(28,'ami-940f0af7',1,'ap-southeast-2',0,1,1484089549),(29,'ami-37526954',1,'ap-southeast-2',0,2,1484089550),(30,'ami-39ac915a',1,'ap-southeast-2',0,3,1484089551),(31,'ami-b89a57d7',1,'eu-central-1',0,1,1484089560),(32,'ami-c35495ac',1,'eu-central-1',0,2,1484089565),(33,'ami-e4c63e8b',1,'eu-central-1',0,3,1484089566),(34,'ami-2fee0b39',1,'us-east-1',0,1,1484089576),(35,'ami-21414f36',1,'us-east-1',0,2,1484089596),(36,'ami-b63769a1',1,'us-east-1',0,3,1484089599),(37,'ami-ddd68cb8',1,'us-east-2',0,1,1484089602),(38,'ami-c6cb91a3',1,'us-east-2',0,2,1484089603),(39,'ami-0932686c',1,'us-east-2',0,3,1484089603),(40,'ami-69bcec09',1,'us-west-1',0,1,1484089615),(41,'ami-98b0e6f8',1,'us-west-1',0,2,1484089619),(42,'ami-2cade64c',1,'us-west-1',0,3,1484089621),(43,'ami-cee95aae',1,'us-west-2',0,1,1484089634),(44,'ami-cf9722af',1,'us-west-2',0,2,1484089642),(45,'ami-6f68cf0f',1,'us-west-2',0,3,1484089645),(46,'ami-dd3442b2',1,'ap-south-1',0,8,1484101469),(47,'ami-dbe592b4',1,'ap-south-1',0,9,1484101470),(48,'ami-ede2e889',1,'eu-west-2',0,8,1484101506),(49,'ami-7beae01f',1,'eu-west-2',0,9,1484101508),(50,'ami-ca80a0b9',1,'eu-west-1',0,8,1484101554),(51,'ami-2a0c2a59',1,'eu-west-1',0,9,1484101562),(52,'ami-93d600fd',1,'ap-northeast-2',0,8,1484101573),(53,'ami-499e4827',1,'ap-northeast-2',0,9,1484101575),(54,'ami-18afc47f',1,'ap-northeast-1',0,8,1484101602),(55,'ami-6bee800c',1,'ap-northeast-1',0,9,1484101605),(56,'ami-e075ed8c',1,'sa-east-1',0,8,1484101642),(57,'ami-5adb4336',1,'sa-east-1',0,9,1484101643),(58,'ami-3d299b59',1,'ca-central-1',0,8,1484101655),(59,'ami-1e26947a',1,'ca-central-1',0,9,1484101656),(60,'ami-87b917e4',1,'ap-southeast-1',0,8,1484101672),(61,'ami-f067c893',1,'ap-southeast-1',0,9,1484101673),(62,'ami-e6b58e85',1,'ap-southeast-2',0,8,1484101697),(63,'ami-ee576c8d',1,'ap-southeast-2',0,9,1484101705),(64,'ami-fe408091',1,'eu-central-1',0,8,1484101740),(65,'ami-425d9c2d',1,'eu-central-1',0,9,1484101742),(66,'ami-9dcfdb8a',1,'us-east-1',0,8,1484101798),(67,'ami-45e3ec52',1,'us-east-1',0,9,1484101830),(68,'ami-fcc19b99',1,'us-east-2',0,8,1484101852),(69,'ami-f1cb9194',1,'us-east-2',0,9,1484101854),(70,'ami-b05203d0',1,'us-west-1',0,8,1484101885),(71,'ami-f4b8ee94',1,'us-west-1',0,9,1484101890),(72,'ami-b2d463d2',1,'us-west-2',0,8,1484101932),(73,'ami-e69c2986',1,'us-west-2',0,9,1484101939),(74,'ami-a192bad2',1,'eu-west-1',0,1,1484600690),(75,'ami-d8f4deab',1,'eu-west-1',0,8,1484600701),(76,'ami-6fccbe08',1,'ap-northeast-1',0,1,1484600744),(77,'ami-eb49358c',1,'ap-northeast-1',0,8,1484600766),(78,'ami-ff861c93',1,'sa-east-1',0,1,1484600787),(79,'ami-7379e31f',1,'sa-east-1',0,8,1484600792),(80,'ami-50e64d33',1,'ap-southeast-1',0,1,1484600825),(81,'ami-b1943fd2',1,'ap-southeast-1',0,8,1484600832),(82,'ami-799d981a',1,'ap-southeast-2',0,1,1484600842),(83,'ami-fe71759d',1,'ap-southeast-2',0,8,1484600846),(84,'ami-78559817',1,'eu-central-1',0,1,1484600875),(85,'ami-5aee2235',1,'eu-central-1',0,8,1484600884),(86,'ami-49c9295f',1,'us-east-1',0,1,1484600923),(87,'ami-6edd3078',1,'us-east-1',0,8,1484600954),(88,'ami-3e21725e',1,'us-west-1',0,1,1484600991),(89,'ami-539ac933',1,'us-west-1',0,8,1484601002),(90,'ami-5e63d13e',1,'us-west-2',0,1,1484601020),(91,'ami-7c803d1c',1,'us-west-2',0,8,1484601031),(92,'ami-31a6d05e',1,'ap-south-1',0,2,1487218614),(93,'ami-2c9aec43',1,'ap-south-1',0,9,1487218622),(94,'ami-738a8017',1,'eu-west-2',0,2,1487218645),(95,'ami-64999300',1,'eu-west-2',0,9,1487218656),(96,'ami-67bece08',1,'ap-south-1',0,1,1490109202),(97,'ami-dabbcbb5',1,'ap-south-1',0,8,1490109209),(98,'ami-9b9386ff',1,'eu-west-2',0,1,1490109216),(99,'ami-ed908589',1,'eu-west-2',0,8,1490109218),(100,'ami-ee517b88',1,'eu-west-1',0,1,1490109245),(101,'ami-dd9eb6ae',1,'eu-west-1',0,2,1490109252),(102,'ami-971238f1',1,'eu-west-1',0,8,1490109256),(103,'ami-29f7dd5a',1,'eu-west-1',0,9,1490109263),(104,'ami-8a8350e4',1,'ap-northeast-2',0,1,1490109270),(105,'ami-e979af87',1,'ap-northeast-2',0,2,1490109272),(106,'ami-79815217',1,'ap-northeast-2',0,8,1490109274),(107,'ami-819e4fef',1,'ap-northeast-2',0,9,1490109277),(108,'ami-7fabfa18',1,'ap-northeast-1',0,1,1490109287),(109,'ami-7accbe1d',1,'ap-northeast-1',0,2,1490109293),(110,'ami-76e9b811',1,'ap-northeast-1',0,8,1490109299),(111,'ami-834e32e4',1,'ap-northeast-1',0,9,1490109306),(112,'ami-3a701156',1,'sa-east-1',0,1,1490109314),(113,'ami-f4d84298',1,'sa-east-1',0,2,1490109318),(114,'ami-eb791887',1,'sa-east-1',0,8,1490109322),(115,'ami-9e79e3f2',1,'sa-east-1',0,9,1490109327),(116,'ami-3351ec57',1,'ca-central-1',0,1,1490109332),(117,'ami-7805b71c',1,'ca-central-1',0,2,1490109334),(118,'ami-ed54e989',1,'ca-central-1',0,8,1490109338),(119,'ami-00f84564',1,'ca-central-1',0,9,1490109340),(120,'ami-19c87b7a',1,'ap-southeast-1',0,1,1490109354),(121,'ami-89e74cea',1,'ap-southeast-1',0,2,1490109358),(122,'ami-03a31060',1,'ap-southeast-1',0,8,1490109364),(123,'ami-49963d2a',1,'ap-southeast-1',0,9,1490109369),(124,'ami-35d3d156',1,'ap-southeast-2',0,1,1490109380),(125,'ami-059d9866',1,'ap-southeast-2',0,2,1490109385),(126,'ami-2de5e74e',1,'ap-southeast-2',0,8,1490109397),(127,'ami-b47175d7',1,'ap-southeast-2',0,9,1490109401),(128,'ami-2a3de945',1,'eu-central-1',0,1,1490109413),(129,'ami-6f559800',1,'eu-central-1',0,2,1490109417),(130,'ami-a85480c7',1,'eu-central-1',0,8,1490109422),(131,'ami-88ec20e7',1,'eu-central-1',0,9,1490109426),(132,'ami-7fa00169',1,'us-east-1',0,1,1490109445),(133,'ami-abf616bd',1,'us-east-1',0,2,1490109471),(134,'ami-2757f631',1,'us-east-1',0,8,1490109485),(135,'ami-188d6e0e',1,'us-east-1',0,9,1490109514),(136,'ami-5a75513f',1,'us-east-2',0,1,1490109523),(137,'ami-c06d48a5',1,'us-east-2',0,2,1490109525),(138,'ami-17745072',1,'us-east-2',0,8,1490109526),(139,'ami-057d5860',1,'us-east-2',0,9,1490109527),(140,'ami-a1722bc1',1,'us-west-1',0,1,1490109538),(141,'ami-76227116',1,'us-west-1',0,2,1490109545),(142,'ami-44613824',1,'us-west-1',0,8,1490109552),(143,'ami-179ac977',1,'us-west-1',0,9,1490109560),(144,'ami-b92fa3d9',1,'us-west-2',0,1,1490109577),(145,'ami-1562d075',1,'us-west-2',0,2,1490109585),(146,'ami-7ac6491a',1,'us-west-2',0,8,1490109591),(147,'ami-6e833e0e',1,'us-west-2',0,9,1490109597),(148,'ami-e9e1d686',1,'ap-south-1',0,1,1531277917),(149,'ami-e795bd88',1,'ap-south-1',0,2,1531277918),(150,'ami-5b673c34',1,'ap-south-1',0,3,1531277918),(151,'ami-598ebb36',1,'ap-south-1',0,8,1531277921),(152,'ami-5f95bd30',1,'ap-south-1',0,9,1531277922),(153,'ami-e1de6e9c',1,'eu-west-3',0,1,1531277927),(154,'ami-c911a0b4',1,'eu-west-3',0,2,1531277928),(155,'ami-5026902d',1,'eu-west-3',0,3,1531277928),(156,'ami-b2ee5ecf',1,'eu-west-3',0,8,1531277929),(157,'ami-1511a068',1,'eu-west-3',0,9,1531277931),(158,'ami-e2e30b85',1,'eu-west-2',0,1,1531277963),(159,'ami-629a7405',1,'eu-west-2',0,2,1531277970),(160,'ami-7c1bfd1b',1,'eu-west-2',0,3,1531277971),(161,'ami-143cd573',1,'eu-west-2',0,8,1531277980),(162,'ami-479b7520',1,'eu-west-2',0,9,1531277983),(163,'ami-06e2f6ec',1,'eu-west-1',0,1,1531277992),(164,'ami-3e7a7647',1,'eu-west-1',0,2,1531277993),(165,'ami-7c491f05',1,'eu-west-1',0,3,1531277994),(166,'ami-2a7d75c0',1,'eu-west-1',0,8,1531277997),(167,'ami-987a76e1',1,'eu-west-1',0,9,1531278000),(168,'ami-70cc781e',1,'ap-northeast-2',0,1,1531278007),(169,'ami-2968c247',1,'ap-northeast-2',0,2,1531278015),(170,'ami-3eee4150',1,'ap-northeast-2',0,3,1531278016),(171,'ami-d979ccb7',1,'ap-northeast-2',0,8,1531278019),(172,'ami-7969c317',1,'ap-northeast-2',0,9,1531278020),(173,'ami-98cfaa75',1,'ap-northeast-1',0,1,1531278028),(174,'ami-4e0cc331',1,'ap-northeast-1',0,2,1531278029),(175,'ami-6b0d5f0d',1,'ap-northeast-1',0,3,1531278030),(176,'ami-3d31e142',1,'ap-northeast-1',0,8,1531278033),(177,'ami-120cc36d',1,'ap-northeast-1',0,9,1531278035),(178,'ami-dff5d1b3',1,'sa-east-1',0,1,1531278041),(179,'ami-5c6e3530',1,'sa-east-1',0,2,1531278042),(180,'ami-b0b7e3dc',1,'sa-east-1',0,3,1531278043),(181,'ami-d63c19ba',1,'sa-east-1',0,8,1531278044),(182,'ami-ff6e3593',1,'sa-east-1',0,9,1531278046),(183,'ami-a972f0cd',1,'ca-central-1',0,1,1531278051),(184,'ami-800685e4',1,'ca-central-1',0,2,1531278052),(185,'ami-49f0762d',1,'ca-central-1',0,3,1531278052),(186,'ami-569d1f32',1,'ca-central-1',0,8,1531278054),(187,'ami-140b8870',1,'ca-central-1',0,9,1531278055),(188,'ami-1c106cf6',1,'ap-southeast-1',0,1,1531278061),(189,'ami-de2a2da2',1,'ap-southeast-1',0,2,1531278083),(190,'ami-76144b0a',1,'ap-southeast-1',0,3,1531278084),(191,'ami-62b7ba1e',1,'ap-southeast-1',0,8,1531278087),(192,'ami-053d3a79',1,'ap-southeast-1',0,9,1531278088),(193,'ami-f75a8195',1,'ap-southeast-2',0,1,1531278110),(194,'ami-75f32c17',1,'ap-southeast-2',0,2,1531278111),(195,'ami-67589505',1,'ap-southeast-2',0,3,1531278111),(196,'ami-fcff279e',1,'ap-southeast-2',0,8,1531278112),(197,'ami-42f02f20',1,'ap-southeast-2',0,9,1531278113),(198,'ami-05d9e2ee',1,'eu-central-1',0,1,1531278122),(199,'ami-e8093a03',1,'eu-central-1',0,2,1531278123),(200,'ami-c86c3f23',1,'eu-central-1',0,3,1531278124),(201,'ami-1192acfa',1,'eu-central-1',0,8,1531278127),(202,'ami-63f5c688',1,'eu-central-1',0,9,1531278138),(203,'ami-456b493a',1,'us-east-1',0,1,1531278142),(204,'ami-b8f3b5c7',1,'us-east-1',0,2,1531278182),(205,'ami-6871a115',1,'us-east-1',0,3,1531278183),(206,'ami-b08dd3cf',1,'us-east-1',0,8,1531278184),(207,'ami-0327667c',1,'us-east-1',0,9,1531278186),(208,'ami-33c9f156',1,'us-east-2',0,1,1531278191),(209,'ami-da003ebf',1,'us-east-2',0,2,1531278192),(210,'ami-03291866',1,'us-east-2',0,3,1531278192),(211,'ami-9887befd',1,'us-east-2',0,8,1531278194),(212,'ami-3bfac45e',1,'us-east-2',0,9,1531278195),(213,'ami-d58868b6',1,'us-west-1',0,1,1531278200),(214,'ami-832acee0',1,'us-west-1',0,2,1531278201),(215,'ami-18726478',1,'us-west-1',0,3,1531278202),(216,'ami-bba445d8',1,'us-west-1',0,8,1531278204),(217,'ami-b236d2d1',1,'us-west-1',0,9,1531278205),(218,'ami-a3ebbfdb',1,'us-west-2',0,1,1531278210),(219,'ami-aeffbcd6',1,'us-west-2',0,2,1531278212),(220,'ami-28e07e50',1,'us-west-2',0,3,1531278212),(221,'ami-2d5d1655',1,'us-west-2',0,8,1531278215),(222,'ami-3703414f',1,'us-west-2',0,9,1531278217),(223,'ami-09a4d6a78af9e9a73',1,'ap-south-1',0,3,1546923235),(224,'ami-0c27a6febc513d258',1,'ap-south-1',0,8,1546923239),(225,'ami-07e6b11175e3fa715',1,'ap-south-1',0,9,1546923244),(226,'ami-0da6335c8dff5d55a',1,'eu-west-3',0,3,1546929870),(227,'ami-0b2985229e9f6bbba',1,'eu-west-3',0,8,1546929872),(228,'ami-0a729892011f4185b',1,'eu-west-3',0,9,1546929873),(229,'ami-95b53beb',1,'eu-north-1',0,3,1546929877),(230,'ami-017ff17f',1,'eu-north-1',0,8,1546929878),(231,'ami-07bbe922afb0fabd1',1,'eu-north-1',0,9,1546929882),(232,'ami-0b1eb35fb81061601',1,'eu-west-2',0,3,1546929885),(233,'ami-099ded210fe53249e',1,'eu-west-2',0,8,1546929889),(234,'ami-06a27ce600d784c71',1,'eu-west-2',0,9,1546929890),(235,'ami-0b5171a7b859ff1b4',1,'eu-west-1',0,3,1546929893),(236,'ami-0ba33e76b76926be6',1,'eu-west-1',0,8,1546929894),(237,'ami-0dad95819a9372f76',1,'eu-west-1',0,9,1546929895),(238,'ami-07be38aae5985872f',1,'ap-northeast-2',0,3,1546929898),(239,'ami-0d9905001b7096a02',1,'ap-northeast-2',0,8,1546929902),(240,'ami-05ec63f885e1c6f2a',1,'ap-northeast-2',0,9,1546929903),(241,'ami-08419d23bf91152e4',1,'ap-northeast-1',0,3,1546929906),(242,'ami-003a25094ed50fe08',1,'ap-northeast-1',0,8,1546929909),(243,'ami-0f57a86f53aa1c4ea',1,'ap-northeast-1',0,9,1546929911),(244,'ami-071ceb2e9e4b0ae06',1,'sa-east-1',0,3,1546929914),(245,'ami-03eaf244c7adb8a3e',1,'sa-east-1',0,8,1546929921),(246,'ami-0d44cef69e0b580f4',1,'sa-east-1',0,9,1546929922),(247,'ami-0c896f6be8b26325e',1,'ca-central-1',0,3,1546929925),(248,'ami-03b7e26ba15e33bfd',1,'ca-central-1',0,8,1546929929),(249,'ami-0ee0c966a33759216',1,'ca-central-1',0,9,1546929930),(250,'ami-01b02e6dd3efebd61',1,'ap-southeast-1',0,3,1546929933),(251,'ami-05127fabc4187b31b',1,'ap-southeast-1',0,8,1546929936),(252,'ami-04385f3f533c85af7',1,'ap-southeast-1',0,9,1546929937),(253,'ami-08d099ec55a5c5a16',1,'ap-southeast-2',0,3,1546929939),(254,'ami-00deaf8931a336624',1,'ap-southeast-2',0,8,1546929939),(255,'ami-02e3986f071e14a71',1,'ap-southeast-2',0,9,1546929940),(256,'ami-00e37cffd3bb3ac8d',1,'eu-central-1',0,3,1546929943),(257,'ami-085d4c1f4b32541f0',1,'eu-central-1',0,8,1546929947),(258,'ami-014b173b0f52c004e',1,'eu-central-1',0,9,1546929948),(259,'ami-0e3688b4a755ad736',1,'us-east-1',0,3,1546929950),(260,'ami-06af601d319a5b99b',1,'us-east-1',0,8,1546929953),(261,'ami-041114ddee4a98333',1,'us-east-1',0,9,1546929955),(262,'ami-0302c1ecc74930ba5',1,'us-east-2',0,3,1546929957),(263,'ami-08eb0a65ec0d985be',1,'us-east-2',0,8,1546929960),(264,'ami-0170ffc1abff2ebdc',1,'us-east-2',0,9,1546929961),(265,'ami-0ec1ad91f200c15a8',1,'us-west-1',0,3,1546929963),(266,'ami-0eed9902457687d7d',1,'us-west-1',0,8,1546929966),(267,'ami-01238fbae24a14ace',1,'us-west-1',0,9,1546929968),(268,'ami-0e00026dd0f3688e2',1,'us-west-2',0,3,1546929970),(269,'ami-02d76353d7973b59a',1,'us-west-2',0,8,1546929971),(270,'ami-019e99815e07ceb49',1,'us-west-2',0,9,1546929972),(271,'ami-0c8810f694cbe10ba',1,'ap-south-1',0,8,1546981992),(272,'ami-03c015fc0026bf4fc',1,'eu-west-2',0,8,1546982025),(273,'ami-0233bae36f499afe8',1,'eu-west-1',0,8,1546982033),(274,'ami-0507b772e2c9b8c15',1,'ap-northeast-2',0,8,1546982040),(275,'ami-0d5e82481c5fd4ad5',1,'ap-northeast-1',0,8,1546982045),(276,'ami-08a4ba9038d7e8565',1,'sa-east-1',0,8,1546982053),(277,'ami-0a851426a8a56bf4b',1,'ca-central-1',0,8,1546982063),(278,'ami-09f2be3a5a5867258',1,'ap-southeast-1',0,8,1546982089),(279,'ami-04978aa3dd8b62cc8',1,'ap-southeast-2',0,8,1546982093),(280,'ami-00f3256a9deda4e1b',1,'eu-central-1',0,8,1546982099),(281,'ami-03a935aafa6b52b97',1,'us-east-1',0,8,1546982105),(282,'ami-00c5e3f4a8dd369e8',1,'us-east-2',0,8,1546982112),(283,'ami-0689ca7fe00282a37',1,'us-west-1',0,8,1546982116),(284,'ami-0dbd6cabe4749f197',1,'us-west-2',0,8,1546982121),(285,'ami-66f67f18',1,'eu-north-1',0,3,1556686242),(286,'ami-09d25a77',1,'eu-north-1',0,8,1556686252),(287,'ami-02ea3e2aae23d960c',1,'eu-north-1',0,9,1556686256),(288,'ami-0963937a03c01ecd4',1,'ap-south-1',0,3,1556686267),(289,'ami-0f4ab593bd4e5b352',1,'ap-south-1',0,8,1556686277),(290,'ami-01f602ac7476d9e36',1,'ap-south-1',0,9,1556686279),(291,'ami-0c4224e392ec4e440',1,'eu-west-3',0,3,1556686287),(292,'ami-0acfe51b617393c70',1,'eu-west-3',0,8,1556686292),(293,'ami-0a3421f99d36f7006',1,'eu-west-3',0,9,1556686298),(294,'ami-0188c0c5eddd2d032',1,'eu-west-2',0,3,1556686302),(295,'ami-021202ee82d116ad0',1,'eu-west-2',0,8,1556686308),(296,'ami-002b994906de0b994',1,'eu-west-2',0,9,1556686309),(297,'ami-0202869bdd0fc8c75',1,'eu-west-1',0,3,1556686314),(298,'ami-0e219142c0bee4a6e',1,'eu-west-1',0,8,1556686322),(299,'ami-08a92ed64caa44b84',1,'eu-west-1',0,9,1556686326),(300,'ami-041b16ca28f036753',1,'ap-northeast-2',0,3,1556686332),(301,'ami-04ca5d9535faed24a',1,'ap-northeast-2',0,8,1556686341),(302,'ami-0a244c086008d4efd',1,'ap-northeast-2',0,9,1556686343),(303,'ami-00b95502a4d51a07e',1,'ap-northeast-1',0,3,1556686347),(304,'ami-097beac0bacfefe65',1,'ap-northeast-1',0,8,1556686356),(305,'ami-0db5a89b60f5ef7c6',1,'ap-northeast-1',0,9,1556686359),(306,'ami-05c1c16cac05a7c0b',1,'sa-east-1',0,3,1556686366),(307,'ami-058732e2bf6d7acb4',1,'sa-east-1',0,8,1556686370),(308,'ami-0a926c6ebbb385ddf',1,'sa-east-1',0,9,1556686378),(309,'ami-06ca3c0058d0275b3',1,'ca-central-1',0,3,1556686385),(310,'ami-040bf52a85a5b3f6c',1,'ca-central-1',0,8,1556686389),(311,'ami-06850b219f7f8ec4d',1,'ca-central-1',0,9,1556686390),(312,'ami-055c55112e25b1f1f',1,'ap-southeast-1',0,3,1556686397),(313,'ami-0f9f33c210de47b63',1,'ap-southeast-1',0,8,1556686401),(314,'ami-012799a835ac6a1d0',1,'ap-southeast-1',0,9,1556686403),(315,'ami-036b423b657376f5b',1,'ap-southeast-2',0,3,1556686409),(316,'ami-074a2888bf09cab0a',1,'ap-southeast-2',0,8,1556686413),(317,'ami-0e96a0468179dce58',1,'ap-southeast-2',0,9,1556686415),(318,'ami-09de4a4c670389e4b',1,'eu-central-1',0,3,1556686422),(319,'ami-05710338b6a5013d1',1,'eu-central-1',0,8,1556686428),(320,'ami-06732cfcceb36d206',1,'eu-central-1',0,9,1556686429),(321,'ami-000db10762d0c4c05',1,'us-east-1',0,3,1556686436),(322,'ami-028d6461780695a43',1,'us-east-1',0,8,1556686440),(323,'ami-0a9d418cd78849a6c',1,'us-east-1',0,9,1556686443),(324,'ami-094720ddca649952f',1,'us-east-2',0,3,1556686450),(325,'ami-0dae3d101cd772fae',1,'us-east-2',0,8,1556686454),(326,'ami-0101a92481d57c1bc',1,'us-east-2',0,9,1556686456),(327,'ami-04642fc8fca1e8e67',1,'us-west-1',0,3,1556686465),(328,'ami-069339bea0125f50d',1,'us-west-1',0,8,1556686469),(329,'ami-0d089c9a817ea8b89',1,'us-west-1',0,9,1556686470),(330,'ami-0a7e1ebfee7a4570e',1,'us-west-2',0,3,1556686476),(331,'ami-09b42c38b449cfa59',1,'us-west-2',0,8,1556686482),(332,'ami-0aa8349a37922c345',1,'us-west-2',0,9,1556686484),(333,'ami-0f303095ce00b23a9',1,'eu-north-1',0,12,1556688360),(334,'ami-d2c64eac',1,'eu-north-1',0,13,1556688362),(335,'ami-09dedd42528c4adc9',1,'ap-south-1',0,12,1556688390),(336,'ami-04184c12996409633',1,'ap-south-1',0,13,1556688393),(337,'ami-0b50d4f7c25e0c9b3',1,'eu-west-3',0,12,1556688412),(338,'ami-0855c967600d4a844',1,'eu-west-3',0,13,1556688414),(339,'ami-08890ccc3ea1500c1',1,'eu-west-2',0,12,1556688426),(340,'ami-068f09e337d7da0c4',1,'eu-west-2',0,13,1556688427),(341,'ami-02f0a4701f9b8a91e',1,'eu-west-1',0,12,1556688460),(342,'ami-0727f3c2d4b0226d5',1,'eu-west-1',0,13,1556688464),(343,'ami-0089e125f069399a0',1,'ap-northeast-2',0,12,1556688508),(344,'ami-0695e34e31339c3ff',1,'ap-northeast-2',0,13,1556688510),(345,'ami-0a39119ef6930f843',1,'ap-northeast-1',0,12,1556688556),(346,'ami-003371bfa26192744',1,'ap-northeast-1',0,13,1556688558),(347,'ami-0c7d3ee69860689af',1,'sa-east-1',0,12,1556688597),(348,'ami-0f1678b6f63a0f923',1,'sa-east-1',0,13,1556688600),(349,'ami-0c8a6e1fc9a03a529',1,'ca-central-1',0,12,1556688635),(350,'ami-06ed08059bdc08fc9',1,'ca-central-1',0,13,1556688637),(351,'ami-05b2eec0169084735',1,'ap-southeast-1',0,12,1556688666),(352,'ami-08050c889a630f1bd',1,'ap-southeast-1',0,13,1556688667),(353,'ami-04c715c762e2de351',1,'ap-southeast-2',0,12,1556688705),(354,'ami-0401c9e2f645b5557',1,'ap-southeast-2',0,13,1556688708),(355,'ami-0a79cfa8817a1e572',1,'eu-central-1',0,12,1556688734),(356,'ami-054e21e355db24124',1,'eu-central-1',0,13,1556688745),(357,'ami-0204606704df03e7e',1,'us-east-1',0,12,1556688772),(358,'ami-0fba9b33b5304d8b4',1,'us-east-1',0,13,1556688774),(359,'ami-0338bce19a7cb103e',1,'us-east-2',0,12,1556688799),(360,'ami-0e04554247365d806',1,'us-east-2',0,13,1556688801),(361,'ami-0349ec1b04afc2f46',1,'us-west-1',0,12,1556688822),(362,'ami-07390b6ff5934a238',1,'us-west-1',0,13,1556688824),(363,'ami-08f938baed1592ad4',1,'us-west-2',0,12,1556688845),(364,'ami-03804ed633fe58109',1,'us-west-2',0,13,1556688847),(365,'ami-a4fe74da',1,'eu-north-1',0,3,1570842860),(366,'ami-7dd85203',1,'eu-north-1',0,8,1570842864),(367,'ami-0d4cf9cf8f041f68f',1,'eu-north-1',0,9,1570842865),(368,'ami-6a1f9414',1,'eu-north-1',0,10,1570842867),(369,'ami-09812ee174a6cb377',1,'eu-north-1',0,12,1570842868),(370,'ami-0d0d5ea079e66f69c',1,'eu-north-1',0,13,1570842869),(371,'ami-003b12a9a1ee83922',1,'ap-south-1',0,3,1570842871),(372,'ami-0927ed83617754711',1,'ap-south-1',0,8,1570842872),(373,'ami-01255402b9fbe1a8e',1,'ap-south-1',0,9,1570842873),(374,'ami-02913db388613c3e1',1,'ap-south-1',0,10,1570842874),(375,'ami-0eee945deafa2287b',1,'ap-south-1',0,12,1570842875),(376,'ami-02f8233d95e935e59',1,'ap-south-1',0,13,1570842876),(377,'ami-018c55e9d34f949e9',1,'eu-west-3',0,3,1570842878),(378,'ami-0bb607148d8cf36fb',1,'eu-west-3',0,8,1570842880),(379,'ami-0c41e1b1101146116',1,'eu-west-3',0,9,1570842881),(380,'ami-0652eb0db9b20aeaf',1,'eu-west-3',0,10,1570842883),(381,'ami-098a3826be1ee7dbf',1,'eu-west-3',0,12,1570842884),(382,'ami-06aaed47c3fb20f64',1,'eu-west-3',0,13,1570842885),(383,'ami-0d8f9df7aa93d806e',1,'eu-west-2',0,3,1570842888),(384,'ami-0fab23d0250b9a47e',1,'eu-west-2',0,8,1570842891),(385,'ami-0a283732a8e1b6b91',1,'eu-west-2',0,9,1570842892),(386,'ami-04de2b60dd25fbb2e',1,'eu-west-2',0,10,1570842894),(387,'ami-014b5342eb453afee',1,'eu-west-2',0,12,1570842895),(388,'ami-0c3f128b7298d29b9',1,'eu-west-2',0,13,1570842896),(389,'ami-065ec1e661d619058',1,'eu-west-1',0,3,1570842899),(390,'ami-03ef731cc103c9f09',1,'eu-west-1',0,8,1570842903),(391,'ami-070f33c89986da32b',1,'eu-west-1',0,9,1570842904),(392,'ami-028188d9b49b32a80',1,'eu-west-1',0,10,1570842908),(393,'ami-0907c4d3c93e03daa',1,'eu-north-1',0,9,1571729916),(394,'ami-09b605f903aef31cd',1,'eu-north-1',0,12,1571729919),(395,'ami-0567220a328fe4fee',1,'eu-north-1',0,13,1571729920),(396,'ami-0134ce22bbe953ecc',1,'ap-south-1',0,9,1571729924),(397,'ami-07b1360b71c3716d8',1,'ap-south-1',0,12,1571729926),(398,'ami-0237472cf337d9529',1,'ap-south-1',0,13,1571729927),(399,'ami-032fe10f013f36846',1,'eu-west-3',0,9,1571729933),(400,'ami-0ba894c68b1681e24',1,'eu-west-3',0,12,1571729936),(401,'ami-0df03c7641cf41947',1,'eu-west-3',0,13,1571729937),(402,'ami-0ec497a3604c0dd5f',1,'eu-west-2',0,9,1571729944),(403,'ami-06ea28ca18bb79e3c',1,'eu-west-2',0,12,1571729948),(404,'ami-00f94dc949fea2adf',1,'eu-west-2',0,13,1571729949),(405,'ami-0bd191f9766bc39f7',1,'eu-west-1',0,9,1571729957),(406,'ami-0c143cb48fa7c1ec9',1,'eu-west-1',0,12,1571729962),(407,'ami-0e41581acd7dedd99',1,'eu-west-1',0,13,1571729963),(408,'ami-0708fd0ae9a663e02',1,'ap-northeast-2',0,3,1571729965),(409,'ami-082bdb3b2d54d5a19',1,'ap-northeast-2',0,8,1571729967),(410,'ami-01ddd6b62296d6fca',1,'ap-northeast-2',0,9,1571729968),(411,'ami-0e1e385b0a934254a',1,'ap-northeast-2',0,10,1571729969),(412,'ami-0fd7175b57c51b752',1,'ap-northeast-2',0,12,1571729970),(413,'ami-0f4362c71ffaf7759',1,'ap-northeast-2',0,13,1571729971),(414,'ami-0be4c0b05bbeb2afd',1,'ap-northeast-1',0,3,1571729973),(415,'ami-0f9af249e7fa6f61b',1,'ap-northeast-1',0,8,1571729974),(416,'ami-04ae8b744a2a967ea',1,'ap-northeast-1',0,9,1571729976),(417,'ami-0ab3e16f9c414dee7',1,'ap-northeast-1',0,10,1571729979),(418,'ami-0e48df3801c3e668e',1,'ap-northeast-1',0,12,1571729980),(419,'ami-0d5db3e2a1b98ca94',1,'ap-northeast-1',0,13,1571729981),(420,'ami-0102667d2046392a0',1,'sa-east-1',0,3,1571729985),(421,'ami-02b235ae9b5819d3b',1,'sa-east-1',0,8,1571729988),(422,'ami-064dc18450955d3f3',1,'sa-east-1',0,9,1571729989),(423,'ami-0e2c2c29d8017dd99',1,'sa-east-1',0,10,1571729992),(424,'ami-05b2ce93b518cf8ee',1,'sa-east-1',0,12,1571729994),(425,'ami-0065a65613972a22a',1,'sa-east-1',0,13,1571729995),(426,'ami-05508913d3360e9af',1,'ca-central-1',0,3,1571729997),(427,'ami-06a6f79d24f2b6a21',1,'ca-central-1',0,8,1571729999),(428,'ami-0c7609710809ad56e',1,'ca-central-1',0,9,1571730000),(429,'ami-04070f04f450607dc',1,'ca-central-1',0,10,1571730003),(430,'ami-0054a87febcce8612',1,'ca-central-1',0,12,1571730004),(431,'ami-0dbe45195223e250b',1,'ca-central-1',0,13,1571730004),(432,'ami-a13248d0',1,'ap-east-1',0,3,1571730006),(433,'ami-5cc9b22d',1,'ap-east-1',0,8,1571730007),(434,'ami-0087bd3fa7d375868',1,'ap-east-1',0,9,1571730008),(435,'ami-f8ee9589',1,'ap-east-1',0,10,1571730009),(436,'ami-0503ce760d2caade4',1,'ap-east-1',0,12,1571730010),(437,'ami-d26218a3',1,'ap-east-1',0,13,1571730011),(438,'ami-02079c0159aade6b4',1,'ap-southeast-1',0,3,1571730013),(439,'ami-0ee0b284267ea6cde',1,'ap-southeast-1',0,8,1571730014),(440,'ami-041282eb38a18fb57',1,'ap-southeast-1',0,9,1571730015),(441,'ami-05c859630889c79c8',1,'ap-southeast-1',0,10,1571730017),(442,'ami-00534e787c8349c76',1,'ap-southeast-1',0,12,1571730018),(443,'ami-0c199cae95cea87f0',1,'ap-southeast-1',0,13,1571730019),(444,'ami-01448715c06d2edb5',1,'ap-southeast-2',0,3,1571730021),(445,'ami-0328aad0f6218c429',1,'ap-southeast-2',0,8,1571730022),(446,'ami-0daaf340f2253cd6c',1,'ap-southeast-2',0,9,1571730023),(447,'ami-07cc15c3ba6f8e287',1,'ap-southeast-2',0,10,1571730025),(448,'ami-0f307b7625bd712cd',1,'ap-southeast-2',0,12,1571730026),(449,'ami-0c0483bc96aef8b2f',1,'ap-southeast-2',0,13,1571730026),(450,'ami-06220be3176081cf0',1,'eu-central-1',0,3,1571730029),(451,'ami-050a22b7e0cf85dd0',1,'eu-central-1',0,8,1571730030),(452,'ami-094ce8f9bad208212',1,'eu-central-1',0,9,1571730031),(453,'ami-010fae13a16763bb4',1,'eu-central-1',0,10,1571730033),(454,'ami-034937fd7f621ba85',1,'eu-central-1',0,12,1571730034),(455,'ami-040a1551f9c9d11ad',1,'eu-central-1',0,13,1571730035),(456,'ami-029c0fbe456d58bd1',1,'us-east-1',0,3,1571730037),(457,'ami-04763b3055de4860b',1,'us-east-1',0,8,1571730039),(458,'ami-027a14492d667b8f5',1,'us-east-1',0,9,1571730042),(459,'ami-00eb20669e0990cb4',1,'us-east-1',0,10,1571730047),(460,'ami-0d4df21ffeb914d61',1,'us-east-1',0,12,1571730050),(461,'ami-0d5ae5525eb033d0a',1,'us-east-1',0,13,1571730051),(462,'ami-0cf433f9a817f63d3',1,'us-east-2',0,3,1571730053),(463,'ami-0d03add87774b12c5',1,'us-east-2',0,8,1571730055),(464,'ami-0b8b049f0ac9d6ded',1,'us-east-2',0,9,1571730056),(465,'ami-0c64dd618a49aeee8',1,'us-east-2',0,10,1571730063),(466,'ami-085a6b327e41e6912',1,'us-east-2',0,12,1571730064),(467,'ami-0a7f2b5b6b87eaa1b',1,'us-east-2',0,13,1571730065),(468,'ami-07d8d14365439bc6e',1,'us-west-1',0,3,1571730066),(469,'ami-0dbf5ea29a7fc7e05',1,'us-west-1',0,8,1571730068),(470,'ami-00cb62f0977a10d07',1,'us-west-1',0,9,1571730069),(471,'ami-0bce08e823ed38bdd',1,'us-west-1',0,10,1571730071),(472,'ami-05f5b1fdbdbc92ec7',1,'us-west-1',0,12,1571730072),(473,'ami-00a3e4424e9ab3e56',1,'us-west-1',0,13,1571730073),(474,'ami-078a6a18fb73909b2',1,'us-west-2',0,3,1571730075),(475,'ami-0994c095691a46fb5',1,'us-west-2',0,8,1571730076),(476,'ami-0df99cdd65bce4245',1,'us-west-2',0,9,1571730078),(477,'ami-08d489468314a58df',1,'us-west-2',0,10,1571730080),(478,'ami-0bff712af642c77c9',1,'us-west-2',0,12,1571730081),(479,'ami-09c6723c6c24250c9',1,'us-west-2',0,13,1571730082);
/*!40000 ALTER TABLE `app_provider_image_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_status`
--

DROP TABLE IF EXISTS `app_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_status`
--

LOCK TABLES `app_status` WRITE;
/*!40000 ALTER TABLE `app_status` DISABLE KEYS */;
INSERT INTO `app_status` VALUES (1,'READY','App is ready'),(2,'STARTING','\'Start\' command issued to job queue'),(3,'STARTED','App is running'),(4,'STOPPING','\'Stop\' command issued to job queue'),(5,'STOPPED','App is stopped'),(6,'INITIALISING','App has been created but is not yet ready to run'),(7,'NEW','New App'),(8,'RESTARTING','Restarting apps instance'),(9,'DELETING','Deleting apps instance'),(10,'ARCHIVED','Archived apps instance'),(11,'UPDATING','\'Update\' command issued to job queue');
/*!40000 ALTER TABLE `app_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_type`
--

DROP TABLE IF EXISTS `app_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_type` (
  `id` int(11) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_type`
--

LOCK TABLES `app_type` WRITE;
/*!40000 ALTER TABLE `app_type` DISABLE KEYS */;
INSERT INTO `app_type` VALUES (1,'default'),(2,'asg'),(3,'asg.alb'),(4,'ecs'),(5,'ecs.alb'),(6,'sls'),(7,'sls.alb');
/*!40000 ALTER TABLE `app_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloud_provider`
--

DROP TABLE IF EXISTS `cloud_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloud_provider` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloud_provider`
--

LOCK TABLES `cloud_provider` WRITE;
/*!40000 ALTER TABLE `cloud_provider` DISABLE KEYS */;
INSERT INTO `cloud_provider` VALUES (1,'aws','Launch Apps and Services on AWS',NULL);
/*!40000 ALTER TABLE `cloud_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_task`
--

DROP TABLE IF EXISTS `job_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_task` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `job_type_id` bigint(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `script` text,
  `params` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_task`
--

LOCK TABLES `job_task` WRITE;
/*!40000 ALTER TABLE `job_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_type`
--

DROP TABLE IF EXISTS `job_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_type` (
  `id` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `queue` varchar(45) NOT NULL COMMENT 'e.g. ec2, rds, route53',
  `description` varchar(45) NOT NULL,
  `command` text NOT NULL COMMENT 'The task that is to be run using “ec2” or other queue.',
  `newstatus` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_type`
--

LOCK TABLES `job_type` WRITE;
/*!40000 ALTER TABLE `job_type` DISABLE KEYS */;
INSERT INTO `job_type` VALUES (1,'ec2.launch','ec2','Launch new EC2','runInstances',2),(2,'ec2.stop','ec2','Stop Existing EC2 Instance','stopInstances',4),(3,'ec2.start','ec2','Start Existing EC2 instance','startInstances',2),(4,'ec2.delete','ec2','Delete Existing EC2 Instance','terminateInstances',9),(5,'ec2.reboot','ec2','Reboot Existing EC2 Instance','rebootInstances',8),(6,'rds.create','rds','Launch New RDS Instance','createDBInstance',2),(7,'rds.delete','rds','Delete RDS Instance','deleteDBInstance',9),(8,'cfn.create','cfn','CloudFormation Create Completed','CREATE_COMPLETE',3),(9,'cfn.delete','cfn','CloudFormation Delete Done','DELETE_COMPLETE',1),(10,'cw.stopped','cw','CloudWatch Stopped event notifcation','stopped',5),(11,'cw.pending','cw','CloudWatch Pending event notifcation','pending',2),(12,'cw.running','cw','CloudWatch Running event notifcation','running',3),(13,'cfn.fail','cfn','CloudFormation Launch Failed','CREATE_FAILED',1),(14,'ec2.update','ec2','Update EC2 existing config','runInstances',11);
/*!40000 ALTER TABLE `job_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text NOT NULL,
  `userid` bigint(11) NOT NULL,
  `status` int(11) NOT NULL,
  `appid` bigint(11) NOT NULL,
  `jobtype` int(11) NOT NULL,
  `job_task_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lookup_environment`
--

DROP TABLE IF EXISTS `lookup_environment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lookup_environment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lookup_environment`
--

LOCK TABLES `lookup_environment` WRITE;
/*!40000 ALTER TABLE `lookup_environment` DISABLE KEYS */;
INSERT INTO `lookup_environment` VALUES (1,'php','PHP Latest'),(2,'php71','PHP 7.1'),(3,'node','NODE Latest'),(4,'nodelts','NODE LTS');
/*!40000 ALTER TABLE `lookup_environment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org`
--

DROP TABLE IF EXISTS `org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org` (
  `id` bigint(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `parentid` bigint(11) NOT NULL,
  `owner` bigint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org`
--

LOCK TABLES `org` WRITE;
/*!40000 ALTER TABLE `org` DISABLE KEYS */;
/*!40000 ALTER TABLE `org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cloudid` int(11) NOT NULL,
  `vm_size` varchar(45) DEFAULT NULL,
  `vm_price_per_hour` decimal(18,9) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  `memory` varchar(100) DEFAULT NULL,
  `vcpu` int(4) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `meta` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region_map`
--

DROP TABLE IF EXISTS `region_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_term` varchar(200) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region_map`
--

LOCK TABLES `region_map` WRITE;
/*!40000 ALTER TABLE `region_map` DISABLE KEYS */;
INSERT INTO `region_map` VALUES (1,'US East (N. Virginia)','us-east-1'),(2,'US East (Ohio)','us-east-2'),(3,'US West (N. California)','us-west-1'),(4,'US West (Oregon)','us-west-2'),(5,'Canada (Central)','ca-central-1'),(6,'EU (Frankfurt)','eu-central-1'),(7,'EU (Ireland)','eu-west-1'),(8,'EU (London)','eu-west-2'),(9,'EU (Paris)','eu-west-3'),(10,'EU (Stockholm)','eu-north-1'),(11,'Asia Pacific (Hong Kong)','ap-east-1'),(12,'Asia Pacific (Tokyo)','ap-northeast-1'),(13,'Asia Pacific (Seoul)','ap-northeast-2'),(14,'Asia Pacific (Osaka-Local)','ap-northeast-3'),(15,'Asia Pacific (Singapore)','ap-southeast-1'),(16,'Asia Pacific (Sydney)','ap-southeast-2'),(17,'Asia Pacific (Mumbai)','ap-south-1'),(18,'South America (São Paulo)','sa-east-1');
/*!40000 ALTER TABLE `region_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `confirmcode` varchar(255) DEFAULT NULL,
  `lastloggedin` varchar(45) DEFAULT NULL,
  `first` varchar(45) DEFAULT NULL,
  `last` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `confirmcode_UNIQUE` (`confirmcode`)
) ENGINE=InnoDB AUTO_INCREMENT=17091979 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cloud_provider`
--

DROP TABLE IF EXISTS `user_cloud_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cloud_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `cloud_provider_id` int(11) NOT NULL,
  `aws_account_id` varchar(45) DEFAULT NULL,
  `isDefault` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`userid`),
  KEY `FK_cloud_provider_id_idx` (`cloud_provider_id`),
  CONSTRAINT `FK_cloud_provider_id` FOREIGN KEY (`cloud_provider_id`) REFERENCES `cloud_provider` (`id`),
  CONSTRAINT `FK_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cloud_provider`
--

LOCK TABLES `user_cloud_provider` WRITE;
/*!40000 ALTER TABLE `user_cloud_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cloud_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data_aws_configs`
--

DROP TABLE IF EXISTS `user_data_aws_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data_aws_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `vpc` varchar(45) NOT NULL,
  `app_subnet` varchar(1000) NOT NULL,
  `db_subnet` varchar(1000) DEFAULT NULL,
  `elb_sg` varchar(1000) DEFAULT NULL,
  `app_sg` varchar(1000) NOT NULL,
  `db_sg` varchar(1000) DEFAULT NULL,
  `app_instance_type` varchar(45) DEFAULT NULL,
  `db_instance_type` varchar(45) DEFAULT NULL,
  `cache_instance_type` varchar(45) DEFAULT NULL,
  `custom_data` blob,
  `region` varchar(45) NOT NULL,
  `user_cloud_provider_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_aws_config_user_id_idx` (`userid`),
  CONSTRAINT `FK_user_aws_config_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data_aws_configs`
--

LOCK TABLES `user_data_aws_configs` WRITE;
/*!40000 ALTER TABLE `user_data_aws_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_data_aws_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_data_providers`
--

DROP TABLE IF EXISTS `user_data_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_cloud_provider_id` int(11) NOT NULL,
  `aws_auth_method` varchar(45) DEFAULT NULL,
  `auth_data` text,
  PRIMARY KEY (`id`),
  KEY `FK_user_cloud_provider_id_idx` (`user_cloud_provider_id`),
  CONSTRAINT `FK_user_cloud_provider_id` FOREIGN KEY (`user_cloud_provider_id`) REFERENCES `user_cloud_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_data_providers`
--

LOCK TABLES `user_data_providers` WRITE;
/*!40000 ALTER TABLE `user_data_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_data_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_integrations`
--

DROP TABLE IF EXISTS `user_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_integrations` (
  `id` bigint(11) NOT NULL,
  `userid` bigint(11) NOT NULL,
  `integrationid` int(11) NOT NULL,
  `credentials` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_integrations`
--

LOCK TABLES `user_integrations` WRITE;
/*!40000 ALTER TABLE `user_integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_org`
--

DROP TABLE IF EXISTS `user_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_org` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `userid` bigint(11) NOT NULL,
  `orgid` bigint(11) NOT NULL,
  `permissions` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_org`
--

LOCK TABLES `user_org` WRITE;
/*!40000 ALTER TABLE `user_org` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'teemops_schema'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_addASG` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addASG`(

	IN iAppId INT(11),
	IN iUserId INT(11),
    IN isALB TINYINT,
    IN min tinyint,
    IN max tinyint
)
BEGIN

	UPDATE app SET 
		isasg=1,
        isalb=isALB,
        asg_min=min,
        asg_max=max
	where 
		id = iAppId and userid = iUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_addSourceCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_addSourceCode`(

	IN iAppId INT(11),
    IN sPath VARCHAR(1000),
    IN sSource VARCHAR(255)
)
BEGIN

	INSERT INTO app_code
		(appid, path, source)
    VALUES
		(iAppId, sPath, sSource);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkAWSAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkAWSAccount`(
	IN iUserId INT(11),
    IN sawsAccountId VARCHAR(45)
)
BEGIN

	SELECT id FROM
    user_cloud_provider ucp
    WHERE 
		ucp.userid = iUserId AND
		ucp.aws_account_id=sawsAccountId
	LIMIT 1;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteAWSConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteAWSConfig`(
	IN iId INT(11),
    IN iUserId INT(11)
)
BEGIN

	DELETE FROM user_data_aws_configs
    WHERE
		id = iId AND
        userid = iUserId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_deleteUserCloudProvider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteUserCloudProvider`(
	IN iId INT(11),
    IN iUserId INT(11)
)
BEGIN

	DELETE FROM user_cloud_provider
    WHERE
		id = iId AND
        userid = iUserId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAppByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAppByUserID`(
	IN iUserId BIGINT,
	IN iAppId BIGINT
)
BEGIN

	SELECT 
		a.id as appId,
        a.userid as userID,
		a.name, 
		a.status, 
		CAST(a.data AS char(10000) CHARACTER SET utf8) as configData,
		a.appurl, 
		a.timestamp,
		a.app_provider_id AS appProviderId, 
        a.user_cloud_provider_id AS userCloudProviderId,
        a.meta_data as metaData,
        a.notify,
        isasg as hasASG,
		isalb as hasALB,
        a.asg_min as asgMin,
        a.asg_max as asgMax,
        ucp.aws_account_id AS awsAccountId,
		cp.id AS cloud, 
        cp.name AS cloudProviderName,
		cp.description AS cloudProviderDesc,
        ucp.aws_account_id AS awsAccountId,
		udp.id AS userDataProviderId, 
		udp.aws_auth_method AS awsAuthMethod,
		udp.auth_data AS authData,
		udac.id as awsConfigId, 
        udac.name AS awsConfigName,
		udac.vpc,
        udac.app_subnet AS appSubnet,
        udac.db_subnet AS dbSubnet,
        udac.elb_sg AS elbSecurityGroup,
        udac.app_sg AS appSecurityGroup,
        udac.db_sg AS dbSecurityGroup,
        udac.app_instance_type AS appInstanceType,
        udac.db_instance_type AS dbInstanceType,
        udac.cache_instance_type AS cacheInstanceType,
        udac.custom_data AS customData,
        udac.region,
		apil.image_id as aimageid,
        ap.connect_user as connectUser,
        ap.connect_type as connectType,
        ap.system,
        ap.docker,
        alb.subnets as albSubnets,
        alb.listeners as albListeners,
        alb.sslArn as albSSLArn,
        ap.system as appEnvironment,
        acode.source as codeSource,
        acode.path as codePath
	FROM 
		app AS a INNER join 
        cloud_provider AS cp ON a.cloud = cp.id left join
		user_cloud_provider AS ucp ON ucp.id = a.user_cloud_provider_id left join
		user_data_providers udp ON udp.id = a.user_data_provider_id left join
		user_data_aws_configs udac ON a.aws_config_data_id = udac.id left join 
        app_provider as ap ON a.app_provider_id=ap.id LEFT JOIN
		app_provider_image_list apil ON 
			(ap.parentid=apil.app_provider_id and 
			a.cloud=apil.cloud_provider_id and 
			apil.region=udac.region) left join
        app_alb as alb ON a.id=alb.appid LEFT JOIN
        lookup_environment as lenv ON a.environment=lenv.id LEFT JOIN
        app_code as acode ON a.id=acode.appid
	WHERE 
		a.id=iAppId AND
        a.userid=iUserId AND
        a.status != 7 AND a.status != 8 /*Deleted or Archived*/
	ORDER BY
		apil.timestamp desc
	LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAppIdFromMeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAppIdFromMeta`(
	IN sMetaInstance VARCHAR(255),
	IN sAWSAccountId VARCHAR(45)
)
BEGIN

select 
a.id 
from app a RIGHT JOIN
user_cloud_provider ucp
ON a.user_cloud_provider_id=ucp.id
where 
meta_data 
LIKE CONCAT('%', sMetaInstance, '%')
and aws_account_id=sAWSAccountId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAppList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAppList`(IN iUserId BIGINT)
BEGIN
SELECT 
	a.*, 
    CAST(a.data AS char(10000) CHARACTER SET utf8) as configData, 
	a.user_data_provider_id AS userDataProviderId,
	ap.name as appProviderName, 
	ap.os, 
    ap.description as appProviderDesc, 
    cp.name as cloudProviderName 
FROM app as a 
INNER JOIN app_provider as ap 
	ON a.app_provider_id = ap.id 
LEFT JOIN cloud_provider cp 
	ON a.cloud=cp.id 
WHERE a.userid =iUserId
ORDER BY timestamp desc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAppListByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAppListByUserID`(
	IN iUserId INT
)
BEGIN

	SELECT 
		a.id as appId,
		a.name, 
        a.appurl,
		a.status, 
		CAST(a.data AS char(10000) CHARACTER SET utf8) as configData,
		a.appurl, 
		a.timestamp, 
		a.app_provider_id AS appProviderId, 
        a.user_cloud_provider_id AS userCloudProviderId,
        a.notify,
        ucp.aws_account_id AS awsAccountId,
        ucp.name as accountName,
        a.user_data_provider_id AS userDataProviderId,
        a.aws_config_data_id AS awsConfigId,
		cp.id AS cloud, 
		ap.os, 
        ap.name AS appProviderName,
        ap.description as appProviderDesc, 
        cp.description as cloudProviderDesc,
        udp.auth_data AS authData,
        udac.name AS awsConfigName,
        udac.region
	FROM 
		app as a INNER JOIN 
        app_provider as ap ON a.app_provider_id = ap.id LEFT JOIN 
        cloud_provider cp ON a.cloud=cp.id LEFT JOIN
        user_cloud_provider AS ucp ON a.user_cloud_provider_id = ucp.id left join
        user_data_providers udp ON udp.id = a.user_data_provider_id left join
		user_data_aws_configs udac ON a.aws_config_data_id = udac.id
	WHERE 
		a.userid = iUserId AND
        a.status != 7 AND a.status != 8; /*Deleted or Archived*/

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAWSConfigRegionARN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAWSConfigRegionARN`(
	IN iAWSConfigId BIGINT
)
BEGIN

	SELECT 
	udac.id, region, auth_data, ucp.aws_account_id as awsAccountId, ucp.id as userCloudProviderId
	FROM
		user_data_aws_configs AS udac 
		LEFT JOIN
		user_cloud_provider AS ucp on udac.user_cloud_provider_id = ucp.id
		RIGHT JOIN
		user_data_providers as udp on ucp.id=udp.user_cloud_provider_id
	WHERE 
		udac.id=iAWSConfigId;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getAWSConfigsByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getAWSConfigsByUserId`(
	IN iUserId INT(11)
)
BEGIN

	SELECT 
		udac.id,
        udac.name,
        udac.userid AS userId,
        user_cloud_provider_id AS userCloudProviderId,
        ucp.aws_account_id AS awsAccountId,
        vpc,
        app_subnet AS appSubnet,
        db_subnet AS dbSubnet,
        elb_sg AS elbSecurityGroup,
        app_sg AS appSecurityGroup,
        db_sg AS dbSecurityGroup,
        app_instance_type AS appInstanceType,
        db_instance_type AS dbInstanceType,
        cache_instance_type AS cacheInstanceType,
        custom_data AS customData,
        region
	FROM 
		user_data_aws_configs AS udac LEFT JOIN
        user_cloud_provider AS ucp on udac.user_cloud_provider_id = ucp.id
	WHERE 
		udac.userid = iUserId;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDataProvidersByAccountId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDataProvidersByAccountId`(
	IN iUserId INT(11),
    IN sAccountId VARCHAR(45)
)
BEGIN

	SELECT 
		udp.*, 
		ucp.id AS user_cloud_provider_id, 
        ucp.aws_account_id
	FROM 
		user_data_providers AS udp INNER JOIN
		user_cloud_provider AS ucp ON ucp.id = udp.user_cloud_provider_id
	WHERE 
		ucp.userid = iUserId AND 
        ucp.aws_account_id = sAccountId;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDataProvidersByUserId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDataProvidersByUserId`(
	IN iUserId INT(11)
)
BEGIN

	SELECT 
		udp.*, 
		ucp.id AS user_cloud_provider_id, 
        ucp.aws_account_id 
	FROM 
		user_data_providers AS udp INNER JOIN
		user_cloud_provider AS ucp ON ucp.id = udp.user_cloud_provider_id
	WHERE 
		ucp.userid = iUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getInstanceTypes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getInstanceTypes`(
	IN sRegion VARCHAR(100)
)
BEGIN
SELECT distinct vm_size, memory, vcpu, region, m.value FROM pricing p
LEFT JOIN region_map m ON p.region=m.pricing_term
RIGHT JOIN allowed_instance_types a ON p.vm_size=a.name
where m.value=sRegion
order by a.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getMetaData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getMetaData`(
	IN iAppId BIGINT
)
BEGIN

select 
meta_data metaData 
from app
where 
id = iAppId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSTSCreds` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSTSCreds`(
	IN iAppId BIGINT
)
BEGIN

	SELECT 
		a.id as appId,
        a.userid as userID,
		udp.auth_data AS authData,
        udac.region
	FROM 
		app AS a INNER JOIN 
		user_data_providers udp ON udp.id = a.user_data_provider_id LEFT JOIN
        user_data_aws_configs udac ON a.aws_config_data_id = udac.id
	WHERE 
		a.id=iAppId AND
        a.status != 7 AND a.status != 8 /*Deleted or Archived*/
	LIMIT 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getSTSCredsUserAccount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getSTSCredsUserAccount`(
	IN iUserId BIGINT,
    IN iUserCloudProviderId VARCHAR(45)
)
BEGIN

	SELECT 
		udp.auth_data AS authData,
        ucp.*
	FROM 
		user AS u INNER JOIN 
        user_cloud_provider ucp ON u.userid=ucp.userid LEFT JOIN
		user_data_providers udp ON udp.user_cloud_provider_id = ucp.id
	WHERE 
		ucp.id=iUserCloudProviderId
        AND u.userid=iUserId
	LIMIT 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserById`(
	IN userId INT(11)
)
BEGIN

	SET SESSION group_concat_max_len = 1000000;

	SELECT 
		u.userid,
        u.email,
        u.username,
        u.timestamp,
        u.first,
        u.last,
		CONCAT('[', 
			GROUP_CONCAT(CONCAT('{ "id" :', ucp.id, ', "cloudProviderId" :', ucp.cloud_provider_id, ', "awsAccountId" :"', ucp.aws_account_id, '", "name" :"', ucp.name, '", "isDefault" :', COALESCE(ucp.isDefault, 0), '}') ORDER BY ucp.isDefault DESC), 
		']') AS cloudProviders
	FROM 
		user as u LEFT JOIN 
		user_cloud_provider AS ucp ON u.userid = ucp.userid
	GROUP BY 
		u.userid
	HAVING 
		u.userid = userId;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserIdFromApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getUserIdFromApp`(
	IN iAppId BIGINT
)
BEGIN

	SELECT 
        a.userid as userID
	FROM 
		app a
	WHERE 
		a.id=iAppId
	LIMIT 1;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertApp`(

	IN iUserId INT(11),
    IN strName VARCHAR(255),
    IN iStatus INT(11),
	IN iCloudProviderId INT(11),
    IN appData BLOB,
    IN strAppUrl VARCHAR(255),
    IN iAppProviderId INT(11),
	IN iUserCloudProviderId INT(11)
)
BEGIN

	INSERT INTO app
		(userid, name, status, cloud, data, appurl, timestamp, 
        app_provider_id, user_cloud_provider_id)
	VALUES
		(iUserId, strName, 6, iCloudProviderId, appData, strAppUrl, NOW(),
        iAppProviderId, iUserCloudProviderId);

        
	SELECT LAST_INSERT_ID() AS insertId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertAWSConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertAWSConfig`(
	IN name VARCHAR(255),
    IN userId INT(11),
    IN userCloudProviderId INT(11),
    IN vpc VARCHAR(45),
    IN appSubnet VARCHAR(1000),
    IN appSecurityGroup VARCHAR(1000),
    IN appInstanceType VARCHAR(45),
    IN customData BLOB,
    IN region VARCHAR(45)
)
BEGIN

	INSERT INTO user_data_aws_configs 
		(name, userid, user_cloud_provider_id, vpc, app_subnet, 
        app_sg, app_instance_type, custom_data, region)
	VALUES
		(name, userId, userCloudProviderId, vpc, appSubnet, 
        appSecurityGroup, appInstanceType, customData, region);

	SELECT LAST_INSERT_ID() AS insertId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertPricing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertPricing`(
	IN cloudId INT(11),
    IN vmSize VARCHAR(45),
    IN vmPricePerHour DECIMAL(18,9),
    IN region VARCHAR(100),
    IN usageType VARCHAR(45),
    IN sMemory VARCHAR(20),
    IN ivcpu INT(11),
    IN skuCode VARCHAR(200),
    IN sOS VARCHAR(50),
    IN metaData TEXT
)
BEGIN
    
	INSERT INTO 
		pricing (cloudid, vm_size, vm_price_per_hour, region, usage_type, memory, vcpu, sku, timestamp, os, meta) 
	VALUES 
		(cloudId,vmSize,vmPricePerHour,region,usageType, sMemory, ivcpu, skuCode, NOW(), sOS, metaData);

	SELECT LAST_INSERT_ID() AS insertId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUserCloudProvider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUserCloudProvider`(
	IN iUserId INT(11),
    IN iCloudProviderId INT(11),
    IN awsAccountId VARCHAR(45),
    IN strName VARCHAR(255),
    IN isDefault TINYINT
)
BEGIN

	START TRANSACTION;
    
		IF isDefault = 1
		THEN
			UPDATE user_cloud_provider
			SET isDefault = 0
			WHERE userid = iUserId;
		END IF;

		INSERT INTO 
			user_cloud_provider(userid, cloud_provider_id, aws_account_id, name, isDefault)
		VALUES
			(iUserId, icloudProviderId, awsAccountId, strName, isDefault);
        
	COMMIT;
    
    SELECT LAST_INSERT_ID() AS insertId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertUserDataProvider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertUserDataProvider`(
	IN userCloudProviderID INT(11),
    IN awsAuthMethod VARCHAR(45),
    IN authData TEXT
)
BEGIN

	INSERT INTO 
		user_data_providers(user_cloud_provider_id, aws_auth_method, auth_data)
	VALUES
		(userCloudProviderID, awsAuthMethod, authData);
        
	SELECT LAST_INSERT_ID() AS insertId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateALB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateALB`(

	IN iAppId INT(11),
	IN sSubnets VARCHAR(255),
    IN sListeners VARCHAR(45),
    IN sSSLArn VARCHAR(255)
)
BEGIN
DECLARE albCount INT DEFAULT 0;

SET albCount=(SELECT count(*) from app_alb 
WHERE appid=iAppId);

IF albCount>0 THEN
	UPDATE app_alb SET 
		subnets = sSubnets, 
        listeners = sListeners,
        sslArn=sSSLArn
        WHERE 
		appid=iAppId;
	SELECT id from app_alb 
	WHERE appid=iAppId;
ELSE
	INSERT INTO app_alb
    (appid, subnets, listeners, sslArn)
    VALUES
    (iAppId, sSubnets, sListeners, sSSLArn);
    SELECT LAST_INSERT_ID() AS insertId;
END IF;


	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateApp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateApp`(

	IN iAppId INT(11),
	IN iUserId INT(11),
    IN strName VARCHAR(255),
    IN iStatus INT(11),
	IN iCloudProviderId INT(11),
    IN appData BLOB,
    IN strAppUrl VARCHAR(255),
    IN iAppProviderId INT(11),
	IN iUserCloudProviderId INT(11),
    IN iUserDataProviderId INT(11),
    IN iUserAWSConfigId INT(11)
)
BEGIN

	UPDATE app SET 
		name = strName, 
        cloud = iCloudProviderId, 
        status = iStatus, 
        user_cloud_provider_id = iUserCloudProviderId, 
        user_data_provider_id =iUserDataProviderId, 
        data = appData, 
        appurl = strAppUrl, 
		app_provider_id = iAppProviderId, 
        aws_config_data_id = iUserAWSConfigId
	where 
		id = iAppId and userid = iUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateAWSConfig` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateAWSConfig`(
	IN iId INT(11),
	IN vcName VARCHAR(255),
    IN iUserId INT(11),
    IN iUserCloudProviderId INT(11),
    IN vcVPC VARCHAR(45),
    IN appSubnet VARCHAR(45),
    IN appSecurityGroup VARCHAR(45),
    IN appInstanceType VARCHAR(45),
    IN customData BLOB,
    IN vcRegion VARCHAR(45)
)
BEGIN

	UPDATE user_data_aws_configs
	SET
		name = vcName,
        userid = iUserId,
        user_cloud_provider_id = iUserCloudProviderId,
        vpc = vcVPC,
        app_subnet = appSubnet,
        app_sg = appSecurityGroup,
        app_instance_type = appInstanceType,
        custom_data = customData,
        region = vcRegion
	WHERE
		id = iId;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updateUserCloudProvider` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updateUserCloudProvider`(
	IN iId INT(11),
    IN iUserId INT(11),
    IN awsAccountId VARCHAR(45),
    IN strName VARCHAR(255),
    IN bisDefault TINYINT
)
BEGIN

	UPDATE user_cloud_provider 
    SET isDefault = 0 
    WHERE userid = iUserId AND cloud_provider_id = 1;
    
    UPDATE user_cloud_provider 
    SET 
		aws_account_id = IF(ISNULL(awsAccountId), aws_account_id, awsAccountId),
		isDefault = bisDefault,
        name = IF(ISNULL(strName), name, strName)
    WHERE 
		id = iId AND userid = iUserId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-19  6:55:07
