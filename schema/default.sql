-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: teem
-- ------------------------------------------------------
-- Server version	5.6.24

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
  PRIMARY KEY (`id`),
  KEY `FK_user_data_provider_id_idx` (`user_data_provider_id`),
  KEY `FK_app_provider_id_idx` (`app_provider_id`),
  KEY `FK_aws_config_data_id_idx` (`aws_config_data_id`),
  KEY `FK_app_user_id_idx` (`userid`),
  CONSTRAINT `FK_app_provider_id` FOREIGN KEY (`app_provider_id`) REFERENCES `app_provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_aws_config_data_id` FOREIGN KEY (`aws_config_data_id`) REFERENCES `user_data_aws_configs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_user_data_provider_id` FOREIGN KEY (`user_data_provider_id`) REFERENCES `user_data_providers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_provider`
--

DROP TABLE IF EXISTS `app_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `os` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `type` varchar(45) NOT NULL,
  `enabled` varchar(45) DEFAULT NULL,
  `aws_account_id` varchar(30) DEFAULT NULL,
  `aws_ami_name` text,
  `connect_user` varchar(45) NOT NULL,
  `connect_type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_app_provider_image_list_id` FOREIGN KEY (`app_provider_id`) REFERENCES `app_provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pricing` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `cloudid` int(11) NOT NULL,
  `vm_size` varchar(45) DEFAULT NULL,
  `vm_price_per_hour` decimal(5,4) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `usage_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_cloud_provider_id` FOREIGN KEY (`cloud_provider_id`) REFERENCES `cloud_provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `app_subnet` varchar(45) NOT NULL,
  `db_subnet` varchar(45) DEFAULT NULL,
  `elb_sg` varchar(45) DEFAULT NULL,
  `app_sg` varchar(45) NOT NULL,
  `db_sg` varchar(45) DEFAULT NULL,
  `app_instance_type` varchar(45) DEFAULT NULL,
  `db_instance_type` varchar(45) DEFAULT NULL,
  `cache_instance_type` varchar(45) DEFAULT NULL,
  `custom_data` blob,
  `region` varchar(45) NOT NULL,
  `user_cloud_provider_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_aws_config_user_id_idx` (`userid`),
  CONSTRAINT `FK_user_aws_config_user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_user_cloud_provider_id` FOREIGN KEY (`user_cloud_provider_id`) REFERENCES `user_cloud_provider` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Dumping routines for database 'teem'
--
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
CREATE  PROCEDURE `sp_deleteAWSConfig`(
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
CREATE  PROCEDURE `sp_deleteUserCloudProvider`(
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
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_getAppByUserID`(
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
        ap.connect_type as connectType
	FROM 
		app AS a INNER join 
        cloud_provider AS cp ON a.cloud = cp.id left join
		user_cloud_provider AS ucp ON ucp.id = a.user_cloud_provider_id left join
		user_data_providers udp ON udp.id = a.user_data_provider_id left join
		user_data_aws_configs udac ON a.aws_config_data_id = udac.id left join 
		app_provider_image_list apil ON 
			(a.app_provider_id=apil.app_provider_id and 
			a.cloud=apil.cloud_provider_id and 
			apil.region=udac.region) left join
		app_provider as ap ON a.app_provider_id=ap.id
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
CREATE  PROCEDURE `sp_getAppList`(IN iUserId BIGINT)
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
CREATE  PROCEDURE `sp_getAppListByUserID`(
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
        ucp.aws_account_id AS awsAccountId,
        a.user_data_provider_id AS userDataProviderId,
        a.aws_config_data_id AS awsConfigId,
		cp.id AS cloud, 
		ap.os, 
        ap.name AS appProviderName,
        ap.description as appProviderDesc, 
        cp.description as cloudProviderDesc 
	FROM 
		app as a INNER JOIN 
        app_provider as ap ON a.app_provider_id = ap.id LEFT JOIN 
        cloud_provider cp ON a.cloud=cp.id LEFT JOIN
        user_cloud_provider AS ucp ON a.user_cloud_provider_id = ucp.id
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
CREATE  PROCEDURE `sp_getAWSConfigRegionARN`(
	IN iAWSConfigId BIGINT
)
BEGIN

	SELECT 
	udac.id, region, auth_data
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
CREATE  PROCEDURE `sp_getAWSConfigsByUserId`(
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
CREATE  PROCEDURE `sp_getDataProvidersByAccountId`(
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
CREATE  PROCEDURE `sp_getDataProvidersByUserId`(
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_getUserById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_getUserById`(
	IN userId INT(11)
)
BEGIN

	SET SESSION group_concat_max_len = 1000000;

	SELECT 
		u.*,
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
CREATE  PROCEDURE `sp_insertApp`(

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
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_insertAWSConfig`(
	IN name VARCHAR(255),
    IN userId INT(11),
    IN userCloudProviderId INT(11),
    IN vpc VARCHAR(45),
    IN appSubnet VARCHAR(45),
    IN appSecurityGroup VARCHAR(45),
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
CREATE  PROCEDURE `sp_insertUserCloudProvider`(
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
CREATE  PROCEDURE `sp_insertUserDataProvider`(
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
CREATE  PROCEDURE `sp_updateApp`(

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
CREATE  PROCEDURE `sp_updateAWSConfig`(
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
CREATE  PROCEDURE `sp_updateUserCloudProvider`(
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

-- Dump completed on 2019-01-17  6:25:30
