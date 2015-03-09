-- MySQL dump 10.11
--
-- Host: localhost    Database: dwz4j
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Table structure for table `con_file`
--

DROP TABLE IF EXISTS `con_file`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `con_file` (
  `ID` char(32) NOT NULL,
  `USER_ID` char(32) default NULL,
  `FOLDER_ID` char(32) default NULL,
  `NAME` varchar(100) NOT NULL,
  `EXT` varchar(32) default NULL,
  `PATH` varchar(255) default NULL,
  `SIZE` int(11) default NULL,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime default NULL,
  `RESIZE` set('S','M') default NULL,
  `FILE_TYPE` varchar(50) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `insert_date` (`INSERT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `con_file`
--

LOCK TABLES `con_file` WRITE;
/*!40000 ALTER TABLE `con_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `con_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `con_folder`
--

DROP TABLE IF EXISTS `con_folder`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `con_folder` (
  `ID` varchar(32) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `LFT` int(11) default NULL,
  `RGT` int(11) default NULL,
  `PARENT_ID` varchar(32) default NULL,
  `USER_ID` varchar(32) default NULL,
  `INSERT_DATE` datetime NOT NULL,
  `INSERT_BY` varchar(32) NOT NULL,
  `ROLE_ID` varchar(32) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `con_folder`
--

LOCK TABLES `con_folder` WRITE;
/*!40000 ALTER TABLE `con_folder` DISABLE KEYS */;
/*!40000 ALTER TABLE `con_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inf_news`
--

DROP TABLE IF EXISTS `inf_news`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inf_news` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMPANY_ID` int(10) unsigned default NULL,
  `TYPE` enum('NEWS','NOTICE','ANNOUNCEMENT') NOT NULL,
  `STATUS` enum('PENDING','ACTIVE','DISABLED') NOT NULL,
  `TITLE` varchar(255) default NULL,
  `CONTENT` text,
  `AUTHOR` varchar(100) default NULL,
  `SOURCE` varchar(100) default NULL,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `INSERT_DATE` (`INSERT_DATE`),
  KEY `NewIndex1` (`UPDATE_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inf_news`
--

LOCK TABLES `inf_news` WRITE;
/*!40000 ALTER TABLE `inf_news` DISABLE KEYS */;
INSERT INTO `inf_news` VALUES (1,NULL,'NEWS','ACTIVE','DWZ Java Web 快速开发平台','###DWZ Java Web 快速开发平台',NULL,NULL,'2010-12-22 10:26:09','2010-12-22 10:26:09'),(2,NULL,'NEWS','PENDING','DWZ Java Web 快速开发平台v0.1','<span style=\"font-size:medium;\"></span>DWZ Java Web 快速开发平台v0.1<br />',NULL,NULL,'2011-02-19 20:37:14','2011-02-19 20:37:14');
/*!40000 ALTER TABLE `inf_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_category`
--

DROP TABLE IF EXISTS `inv_category`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inv_category` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned default NULL,
  `lft` int(10) unsigned default NULL,
  `rgt` int(10) unsigned default NULL,
  `name` varchar(100) default NULL,
  `description` text,
  `meta_title` varchar(100) default NULL,
  `meta_keyword` varchar(200) default NULL,
  `meta_description` varchar(500) default NULL,
  `pic_url` varchar(255) default NULL,
  `product_num` int(11) NOT NULL default '0',
  `insert_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inv_category`
--

LOCK TABLES `inv_category` WRITE;
/*!40000 ALTER TABLE `inv_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_product`
--

DROP TABLE IF EXISTS `inv_product`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `inv_product` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `brand_id` int(10) unsigned default NULL,
  `category_id` int(10) unsigned default NULL,
  `status` varchar(32) default NULL,
  `sku` varchar(30) NOT NULL,
  `name` varchar(100) default NULL,
  `short_description` text,
  `long_description` text,
  `pic_url` varchar(255) default NULL,
  `meta_title` varchar(100) default NULL,
  `meta_keyword` text,
  `meta_description` text,
  `regular_price` decimal(8,2) default NULL,
  `quantity` int(11) default '0',
  `sales_price` decimal(8,2) default NULL,
  `show_sales_price` smallint(1) default '1',
  `list_price` decimal(8,2) default NULL,
  `show_list_price` smallint(1) default NULL,
  `show_on_web` smallint(1) default '1',
  `call_pricing` smallint(1) default '0',
  `call_pricing_message` varchar(100) default NULL,
  `cost` decimal(8,2) default NULL,
  `sell_count` decimal(5,0) default '0',
  `hit_count` decimal(5,0) default '0',
  `spec_url` varchar(255) default NULL,
  `weight` decimal(6,2) default NULL,
  `weight_uom` varchar(10) default NULL,
  `insert_date` datetime default NULL,
  `update_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `inv_product`
--

LOCK TABLES `inv_product` WRITE;
/*!40000 ALTER TABLE `inv_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `set_preference`
--

DROP TABLE IF EXISTS `set_preference`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `set_preference` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `COMPANY_ID` int(10) unsigned NOT NULL,
  `REF_KEY` varchar(100) NOT NULL,
  `REF_VALUE` text,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`ID`),
  KEY `insert_date` (`INSERT_DATE`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `set_preference`
--

LOCK TABLES `set_preference` WRITE;
/*!40000 ALTER TABLE `set_preference` DISABLE KEYS */;
/*!40000 ALTER TABLE `set_preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_log` (
  `ID` char(32) NOT NULL,
  `USER_ID` char(32) NOT NULL,
  `LOG_TYPE` enum('LODGE_REPORT','LODGE_EA') NOT NULL,
  `LOG_LEVEL` enum('ERROR','WARN','INFO') NOT NULL,
  `IP_ADDRESS` varchar(64) default NULL,
  `NAME` varchar(100) default NULL,
  `CONTENT` text,
  `INSERT_DATE` datetime NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_sys_log_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_permission`
--

DROP TABLE IF EXISTS `sys_permission`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_permission` (
  `ROLE_ID` int(10) unsigned NOT NULL,
  `RESOURCE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`ROLE_ID`,`RESOURCE_ID`),
  KEY `FK_sys_permission` (`RESOURCE_ID`),
  KEY `FK_sys_permission2` (`ROLE_ID`),
  CONSTRAINT `FK_sys_permission_resource` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sys_resource` (`ID`),
  CONSTRAINT `FK_sys_permission_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_permission`
--

LOCK TABLES `sys_permission` WRITE;
/*!40000 ALTER TABLE `sys_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_resource`
--

DROP TABLE IF EXISTS `sys_resource`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_resource` (
  `ID` int(10) unsigned NOT NULL,
  `SN` varchar(50) NOT NULL,
  `NAME` varchar(100) default NULL,
  `DESCRIPTION` varchar(200) default NULL,
  `PURVIEW` tinyint(4) NOT NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_resource`
--

LOCK TABLES `sys_resource` WRITE;
/*!40000 ALTER TABLE `sys_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_role` (
  `ID` int(10) unsigned NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `DESCRIPTION` varchar(200) default NULL,
  `STATUS` enum('ACTIVE','INACTIVE') default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'Person','Person','ACTIVE'),(2,'Manager','Manager','ACTIVE');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_user` (
  `ID` char(32) NOT NULL,
  `TITLE` enum('Mr','Mrs','Miss','Ms','Dr','Prof') default NULL,
  `USER_NAME` varchar(100) NOT NULL,
  `PASSWORD` varchar(50) default NULL,
  `USER_TYPE` enum('PERSON','ADMIN') NOT NULL,
  `FIRST_NAME` varchar(50) default NULL,
  `LAST_NAME` varchar(50) default NULL,
  `POST_CODE` varchar(50) default NULL,
  `EMAIL` varchar(100) default NULL,
  `PHONE` varchar(30) default NULL,
  `STATUS` enum('ACTIVE','INACTIVE','TEST','DELETED') NOT NULL,
  `BIRTH_DATE` datetime default NULL,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime NOT NULL,
  `INSERT_BY` varchar(32) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `i_user_name` (`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('101','Mr','admin','123456','ADMIN','huihua','zhang','100091','zhanghuihua@sohu.com','1234567','ACTIVE','2011-01-01 00:00:00','2010-12-22 00:00:00','2011-09-15 10:36:37','101'),('402881b22d0cf023012d0cf0efc50001','Miss','test','123456','PERSON','xx','x','100091','11dd@11.com','1234567','ACTIVE','2010-01-09 00:00:00','2010-12-19 00:00:00','2011-02-19 11:56:26','101'),('402881b2326af30501326afcd7c50002','Mr','test01','ux71jt','PERSON','huihua','zhang','100027','zhanghuihua1@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-13 10:49:07','2011-09-13 10:49:07','101'),('402881b2326af30501326afd224b0003','Mr','test02','dgxo5k','PERSON','huihua','zhang','100027','zhanghuihua2@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-14 10:49:26','2011-09-14 10:49:26','101'),('402881b2326af30501326afee9fb0004','Mr','test03','ifixla','PERSON','huihua','zhang','100027','zhanghuihua3@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:51:23','2011-09-15 10:51:23','101'),('402881b2326af30501326b00517a0005','Mr','test04','r8t2sy','PERSON','huihua','zhang','100027','zhanghuihua4@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:52:55','2011-09-15 10:52:55','101'),('402881b2326af30501326b0062a10006','Mr','test05','w4fq4s','PERSON','huihua','zhang','100027','zhanghuihua5@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:52:59','2011-09-15 10:52:59','101'),('402881b2326af30501326b006d5f0007','Mr','test06','dec00g','PERSON','huihua','zhang','100027','zhanghuihua6@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:02','2011-09-15 10:53:02','101'),('402881b2326af30501326b0075eb0008','Mr','test07','u6mxw2','PERSON','huihua','zhang','100027','zhanghuihua7@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:04','2011-09-15 10:53:04','101'),('402881b2326af30501326b0088d60009','Mr','test08','jzfndz','PERSON','huihua','zhang','100027','zhanghuihua8@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:09','2011-09-15 10:53:09','101'),('402881b2326af30501326b009171000a','Mr','test09','yb35ag','PERSON','huihua','zhang','100027','zhanghuihua9@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:11','2011-09-15 10:53:11','101'),('402881b2326af30501326b009d68000b','Mr','test10','zyf8hn','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:14','2011-09-15 10:53:14','101'),('402881b2326af30501326b00df72000c','Mr','test11','thvd6b','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:31','2011-09-15 10:53:31','101'),('402881b2326af30501326b00e761000d','Mr','test12','at4caz','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:33','2011-09-15 10:53:33','101'),('402881b2326af30501326b00ee86000e','Mr','test13','cefe11','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:35','2011-09-15 10:53:35','101'),('402881b2326af30501326b00f55c000f','Mr','test14','758jpv','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:37','2011-09-15 10:53:37','101'),('402881b2326af30501326b00fc320010','Mr','test15','ojtxok','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:53:39','2011-09-15 10:53:39','101'),('402881b2326af30501326b0160f60011','Mr','test16','z7jxr3','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:05','2011-09-15 10:54:05','101'),('402881b2326af30501326b0166b30012','Mr','test17','egtvvn','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:06','2011-09-15 10:54:06','101'),('402881b2326af30501326b016c410013','Mr','test18','2yvx3m','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:07','2011-09-15 10:54:07','101'),('402881b2326af30501326b01728a0014','Mr','test19','751lim','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:09','2011-09-15 10:54:09','101'),('402881b2326af30501326b0181300015','Mr','test20','yhw1vc','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:13','2011-09-15 10:54:13','101'),('402881b2326af30501326b0187890016','Mr','test21','oothr3','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:14','2011-09-15 10:54:14','101'),('402881b2326af30501326b0190530017','Mr','test22','aahiti','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:17','2011-09-15 10:54:17','101'),('402881b2326af30501326b01996c0018','Mr','test23','bv15u0','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','ACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:19','2011-09-15 10:54:19','101'),('402881b2326af30501326b01a2160019','Mr','test24','mzk5gg','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','INACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:21','2011-09-15 10:58:51','101'),('402881b2326af30501326b01a840001a','Mr','test25','tti21a','PERSON','huihua','zhang','100027','zhanghuihua@sohu.com','13621397091','INACTIVE','1979-11-13 00:00:00','2011-09-15 10:54:23','2011-09-15 12:54:03','101');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sys_user_role` (
  `USER_ID` char(32) NOT NULL,
  `ROLE_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`USER_ID`,`ROLE_ID`),
  KEY `FK_sys_user_role` (`USER_ID`),
  KEY `FK_sys_user_role2` (`ROLE_ID`),
  CONSTRAINT `FK_sys_user_role` FOREIGN KEY (`USER_ID`) REFERENCES `sys_user` (`ID`),
  CONSTRAINT `FK_sys_user_role2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_page`
--

DROP TABLE IF EXISTS `web_page`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `web_page` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `NAME` varchar(100) default NULL,
  `SEQUENCE` int(5) default NULL,
  `TITLE` varchar(100) default NULL,
  `META_KEYWORDS` varchar(255) default NULL,
  `META_DESCRIPTION` varchar(500) default NULL,
  `CONTENT` text,
  `TARGET` set('header','sidebar','footer') default NULL,
  `INSERT_DATE` datetime NOT NULL,
  `UPDATE_DATE` datetime default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `web_page`
--

LOCK TABLES `web_page` WRITE;
/*!40000 ALTER TABLE `web_page` DISABLE KEYS */;
INSERT INTO `web_page` VALUES (1,'联系我们',1,'联系我们','','','联系我们<br />','header,footer','2012-06-19 16:58:20',NULL),(3,'公司介绍',0,'公司介绍','','','公司介绍','header','2011-02-19 20:41:32',NULL),(2,'服务条款',2,'服务条款','','','服务条款<br />','header,footer','2012-06-19 16:58:25',NULL),(5,'友情链接',3,'友情链接','','','','header,footer','2012-06-19 16:58:29',NULL),(18,'法律声明',0,'法律声明','','','','header','2012-06-19 16:58:04',NULL),(19,'友情链接',0,'友情链接','','','','header','2012-06-19 16:58:15',NULL),(20,'测试页面1',NULL,'测试页面 title','','','','header,footer','2012-06-19 16:57:59',NULL),(21,'测试页面2',NULL,'测试页面2','','','测试页面2','header','2012-06-19 16:59:39',NULL);
/*!40000 ALTER TABLE `web_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_website`
--

DROP TABLE IF EXISTS `web_website`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `web_website` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `TITLE` varchar(100) default NULL,
  `META_KEYWORDS` varchar(255) default NULL,
  `META_DESCRIPTION` varchar(500) default NULL,
  `TEMPLATE` varchar(20) default NULL,
  `LAYOUT` varchar(20) default NULL,
  `THEME` varchar(20) default NULL,
  `LOGO` text,
  `AREA_HEADER` text,
  `AREA_SIDEBAR` text,
  `AREA_BANNER` text,
  `AREA_FOOTER` text,
  `ICP` varchar(50) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `web_website`
--

LOCK TABLES `web_website` WRITE;
/*!40000 ALTER TABLE `web_website` DISABLE KEYS */;
INSERT INTO `web_website` VALUES (1,'DWZ Java Web 快速开发平台','DWZ Java RIA jQuery','DWZ Java Web 快速开发平台',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `web_website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-08  7:12:53
