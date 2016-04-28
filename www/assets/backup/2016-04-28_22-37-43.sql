#
# Graphic Technology Database Dump
# MODX Version:1.1
# 
# Host: 
# Generation Time: 28-04-2016 22:37:43
# Server version: 5.5.47-0ubuntu0.14.04.1
# PHP Version: 5.5.9-1ubuntu4.14
# Database : `gt_db`
#

# --------------------------------------------------------

#
# Table structure for table `gt_active_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_active_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

#
# Dumping data for table `gt_active_users`
#

INSERT INTO `gt_active_users` VALUES ('1','admin','1461883063','','93','10.0.2.2');

# --------------------------------------------------------

#
# Table structure for table `gt_categories`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_categories`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc';

#
# Dumping data for table `gt_categories`
#

INSERT INTO `gt_categories` VALUES ('1','Js');
INSERT INTO `gt_categories` VALUES ('2','Manager and Admin');
INSERT INTO `gt_categories` VALUES ('3','Search');
INSERT INTO `gt_categories` VALUES ('4','Navigation');
INSERT INTO `gt_categories` VALUES ('5','Content');
INSERT INTO `gt_categories` VALUES ('6','Forms');
INSERT INTO `gt_categories` VALUES ('7','Login');
INSERT INTO `gt_categories` VALUES ('8','html');
INSERT INTO `gt_categories` VALUES ('9','LP');
INSERT INTO `gt_categories` VALUES ('10','PORTFOLIO');

# --------------------------------------------------------

#
# Table structure for table `gt_document_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_document_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `gt_document_groups`
#


# --------------------------------------------------------

#
# Table structure for table `gt_documentgroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_documentgroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `gt_documentgroup_names`
#


# --------------------------------------------------------

#
# Table structure for table `gt_event_log`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_event_log`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs';

#
# Dumping data for table `gt_event_log`
#

INSERT INTO `gt_event_log` VALUES ('1','0','1457720430','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://localhost/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36 OPR/35.0.2066.92</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-11 18:20:28</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>225.4534 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>225.4534 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>2.539680480957 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('2','0','1457720458','3','1','0','Системные файлы были изменены.','Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)');
INSERT INTO `gt_event_log` VALUES ('3','0','1457720458','3','1','0','Файл конфигурации все еще доступен для записи','Злоумышленники потенциально могут нанести вред вашему сайту. <strong>Серьёзно.</strong> Пожалуйста, установите права доступа к файлу конфигурации (/manager/includes/config.inc.php) в режим \'Только для чтения\'');
INSERT INTO `gt_event_log` VALUES ('4','0','1457720458','3','1','0','Не удалена папка с файлами, использовавшимися в пр','Папка /install содержит инсталляционные файлы системы MODX. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.');
INSERT INTO `gt_event_log` VALUES ('5','0','1457769728','3','1','0','Системные файлы были изменены.','Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)');
INSERT INTO `gt_event_log` VALUES ('6','0','1458331385','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://counter.yadro.ru/hit;Pikabu?r;s1920*1080*24;uhttp%3A//pikabu.ru/best/;0.3652379553000944</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://pikabu.ru/best/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>105.4720 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>105.4720 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.2914581298828 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('7','0','1458331386','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://counter.yadro.ru/logo;Pikabu?17.2</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://pikabu.ru/best/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>105.3199 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>105.3199 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.2888412475586 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('8','0','1458331386','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://localhost/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:06</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>30.0541 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>30.0541 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>0.53868865966797 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('9','0','1458331386','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://counter.yadro.ru/logo;Pikabu?17.2</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://pikabu.ru/best/</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>84.4128 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>84.4128 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>1.0415649414062 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('10','0','1458331386','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://counter.yadro.ru/hit;Pikabu?rhttp%3A//pikabu.ru/best/;s1920*1080*24;uhttp%3A//pikabu.ru/story/rekomendatsii_sovetskikh_uchyonyikh_4073120;0.1736673486045004</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td>http://pikabu.ru/story/rekomendatsii_sovetskikh_uchyonyikh_4073120</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:05</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>51.1302 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>51.1302 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>0.79133605957031 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('11','0','1458331386','3','0','1','Parser','<h2 style=\"color:red\">&laquo; MODX Parse Error &raquo;</h2><h3 style=\"color:red\">Failed to create the database connection!</h3>\n<table class=\"grid\">\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Basic info</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>REQUEST_URI</td>\n		<td>http://localhost/</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Referer</td>\n		<td></td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>User Agent</td>\n		<td>Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.75 Safari/537.36 OPR/36.0.2130.32</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>IP</td>\n		<td>10.0.2.2</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Current time</td>\n		<td>2016-03-18 20:03:06</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th width=\"100px\" >Benchmarks</th>\n		<th></th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td>MySQL</td>\n		<td>0.0000 s (0 Requests)</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>PHP</td>\n		<td>15.0568 s</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td>Total</td>\n		<td>15.0568 s</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td>Memory</td>\n		<td>0.53868865966797 mb</td>\n	</tr>\n</table>\n<br />\n<table class=\"grid\">\n	<thead>\n	<tr class=\"\">\n		<th>Backtrace</th>\n	</tr>\n	</thead>\n	<tr class=\"gridItem\">\n		<td><strong>DocumentParser->executeParser</strong>()<br />index.php on line 145</td>\n	</tr>\n	<tr class=\"gridAltItem\">\n		<td><strong>DBAPI->connect</strong>()<br />manager/includes/document.parser.class.inc.php on line 1690</td>\n	</tr>\n	<tr class=\"gridItem\">\n		<td><strong>mysqli->mysqli</strong>(\'localhost\', \'root\', 1234, \'gt_db\')<br />manager/includes/extenders/dbapi.mysqli.class.inc.php on line 29</td>\n	</tr>\n</table>\n');
INSERT INTO `gt_event_log` VALUES ('12','0','1461017342','3','1','0','Системные файлы были изменены.','Вы включили проверку системных файлов на наличие изменений, характерных для взломанных сайтов. Это не значит, что сайт был взломан, но желательно просмотреть измененные файлы.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)');

# --------------------------------------------------------

#
# Table structure for table `gt_keyword_xref`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_keyword_xref`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

#
# Dumping data for table `gt_keyword_xref`
#


# --------------------------------------------------------

#
# Table structure for table `gt_manager_log`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_manager_log`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1549 DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.';

#
# Dumping data for table `gt_manager_log`
#

INSERT INTO `gt_manager_log` VALUES ('1','1457570172','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('2','1457570173','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('3','1457570175','1','admin','27','1','MODX CMS Install Success','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('4','1457570195','1','admin','5','1','Лендинг','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('5','1457570196','1','admin','3','1','Лендинг','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('6','1457570198','1','admin','27','1','Лендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('7','1457570216','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('8','1457570381','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('9','1457570382','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('10','1457570383','1','admin','27','1','Лендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('11','1457570429','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('12','1457570444','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('13','1457570445','1','admin','27','1','Лендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('14','1457570455','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('15','1457570457','1','admin','16','3','Minimal Template','Editing template');
INSERT INTO `gt_manager_log` VALUES ('16','1457570472','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('17','1457570472','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('18','1457570550','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('19','1457570632','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('20','1457570632','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('21','1457570634','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('22','1457570647','1','admin','79','-','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('23','1457570647','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('24','1457570648','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('25','1457570670','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('26','1457570672','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('27','1457570829','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('28','1457570829','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('29','1457570838','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('30','1457570862','1','admin','5','-','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('31','1457570862','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('32','1457570864','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('33','1457570866','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('34','1457570958','1','admin','5','-','Project Title','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('35','1457570959','1','admin','3','3','Project Title','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('36','1457570962','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('37','1457570964','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('38','1457570989','1','admin','20','-','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('39','1457570989','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('40','1457570990','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('41','1457570992','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('42','1457570993','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('43','1457571152','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('44','1457571154','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('45','1457571175','1','admin','79','-','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('46','1457571175','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('47','1457574971','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('48','1457575019','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('49','1457575023','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('50','1457575037','1','admin','79','-','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('51','1457575037','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('52','1457575075','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('53','1457575087','1','admin','79','-','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('54','1457575087','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('55','1457575186','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('56','1457575200','1','admin','79','-','LP-PARALAX','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('57','1457575200','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('58','1457575217','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('59','1457575223','1','admin','79','-','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('60','1457575223','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('61','1457575239','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('62','1457575248','1','admin','79','-','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('63','1457575248','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('64','1457575276','1','admin','79','-','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('65','1457575276','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('66','1457575329','1','admin','79','-','LP-PARALAX-PRICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('67','1457575329','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('68','1457575357','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('69','1457575357','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('70','1457575359','1','admin','79','-','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('71','1457575359','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('72','1457575386','1','admin','79','-','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('73','1457575386','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('74','1457575443','1','admin','79','-','LP-CONTACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('75','1457575443','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('76','1457575452','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('77','1457575453','1','admin','78','10','LP-PARALAX-PRICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('78','1457575457','1','admin','79','10','LP-PRICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('79','1457575457','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('80','1457575458','1','admin','78','6','LP-PARALAX','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('81','1457575492','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('82','1457575493','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('83','1457575497','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('84','1457575499','1','admin','78','6','LP-PARALAX','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('85','1457575521','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('86','1457575521','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('87','1457575523','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('88','1457575523','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('89','1457575525','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('90','1457575576','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('91','1457575584','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('92','1457575666','1','admin','78','13','LP-CONTACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('93','1457575690','1','admin','79','13','LP-CONTACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('94','1457575690','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('95','1457575705','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('96','1457575706','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('97','1457575707','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('98','1457575709','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('99','1457575711','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('100','1457575719','1','admin','79','-','LP-FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('101','1457575719','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('102','1457575726','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('103','1457575726','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('104','1457575766','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('105','1457575768','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('106','1457575776','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('107','1457575779','1','admin','78','14','LP-FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('108','1457576055','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('109','1457576056','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('110','1457576087','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('111','1457576087','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('112','1457576117','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('113','1457576120','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('114','1457576123','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('115','1457576128','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('116','1457576129','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('117','1457576136','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('118','1457576136','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('119','1457576141','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('120','1457576158','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('121','1457576161','1','admin','23','-','Новый сниппет','Creating a new Snippet');
INSERT INTO `gt_manager_log` VALUES ('122','1457576173','1','admin','24','-','year','Saving Snippet');
INSERT INTO `gt_manager_log` VALUES ('123','1457576173','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('124','1457576212','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('125','1457576231','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('126','1457576231','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('127','1457576287','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('128','1457576288','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('129','1457576296','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('130','1457576298','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('131','1457576301','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('132','1457576305','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('133','1457576353','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('134','1457576353','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('135','1457576398','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('136','1457576420','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('137','1457576420','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('138','1457576520','1','admin','27','3','Project Title','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('139','1457576537','1','admin','27','3','Project Title','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('140','1457576539','1','admin','5','3','Project Title','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('141','1457576540','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('142','1457576540','1','admin','3','3','Project Title','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('143','1457576542','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('144','1457576545','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('145','1457576570','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('146','1457576575','1','admin','27','3','Project Title','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('147','1457576655','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('148','1457576655','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('149','1457576663','1','admin','5','3','Project Title','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('150','1457576664','1','admin','3','3','Project Title','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('151','1457577633','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('152','1457577635','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('153','1457577661','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('154','1457577661','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('155','1457577696','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('156','1457577698','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('157','1457577701','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('158','1457577740','1','admin','27','3','Project Title','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('159','1457577754','1','admin','5','3','La Playa','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('160','1457577756','1','admin','3','3','La Playa','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('161','1457578032','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('162','1457580424','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('163','1457580547','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('164','1457580547','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('165','1457580548','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('166','1457580552','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('167','1457580554','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('168','1457580556','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('169','1457580556','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('170','1457580558','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('171','1457720457','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('172','1457727083','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('173','1457727097','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('174','1457727101','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('175','1457727103','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('176','1457769727','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('177','1457769771','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('178','1457769772','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('179','1457769776','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('180','1457776876','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('181','1457776883','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('182','1457776885','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('183','1457776889','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('184','1457776896','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('185','1457777011','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('186','1457777200','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('187','1457777202','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('188','1457777892','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('189','1457777929','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('190','1457777938','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('191','1457777938','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('192','1457777940','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('193','1457777943','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('194','1457777943','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('195','1457777945','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('196','1457777948','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('197','1457777948','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('198','1457777955','1','admin','78','13','LP-CONTACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('199','1457777958','1','admin','79','13','LP-CONTACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('200','1457777958','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('201','1457777960','1','admin','78','10','LP-PRICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('202','1457777964','1','admin','79','10','LP-PRICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('203','1457777964','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('204','1457777966','1','admin','78','14','LP-FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('205','1457777969','1','admin','79','14','LP-FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('206','1457777969','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('207','1457777971','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('208','1457777975','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('209','1457777975','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('210','1457777976','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('211','1457777980','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('212','1457777980','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('213','1457777982','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('214','1457777984','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('215','1457777984','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('216','1457777986','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('217','1457777990','1','admin','79','4','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('218','1457777990','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('219','1457777991','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('220','1457777995','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('221','1457777995','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('222','1457777997','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('223','1457778001','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('224','1457778001','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('225','1457778003','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('226','1457778016','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('227','1457778016','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('228','1457778021','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('229','1457778036','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('230','1457778040','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('231','1457778154','1','admin','79','-','PORTFOLIO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('232','1457778154','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('233','1457778208','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('234','1457778237','1','admin','79','-','PORTFOLIO_MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('235','1457778237','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('236','1457778249','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('237','1457778249','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('238','1457778252','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('239','1457778258','1','admin','79','15','PORTFOLIO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('240','1457778258','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('241','1457778305','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('242','1457778316','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('243','1457778336','1','admin','78','16','PORTFOLIO_MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('244','1457778429','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('245','1457778431','1','admin','78','16','PORTFOLIO_MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('246','1457778440','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('247','1457778442','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('248','1457778577','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('249','1457778616','1','admin','79','-','PORTFOLIO_MORE_ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('250','1457778616','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('251','1457778618','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('252','1457778627','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('253','1457778638','1','admin','302','-','worktype','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('254','1457778638','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('255','1457778643','1','admin','78','16','PORTFOLIO_MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('256','1457778646','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('257','1457778647','1','admin','78','17','PORTFOLIO_MORE_ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('258','1457778651','1','admin','79','17','PORTFOLIO_MORE_ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('259','1457778651','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('260','1457778656','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('261','1457778663','1','admin','302','-','tags','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('262','1457778663','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('263','1457778667','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('264','1457778688','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('265','1457778696','1','admin','5','3','La Playa','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('266','1457778696','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('267','1457778722','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('268','1457778727','1','admin','78','17','PORTFOLIO_MORE_ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('269','1457778730','1','admin','79','17','PORTFOLIO_MORE_ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('270','1457778730','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('271','1457778737','1','admin','78','16','PORTFOLIO_MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('272','1457778741','1','admin','79','16','PORTFOLIO-MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('273','1457778741','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('274','1457778742','1','admin','78','17','PORTFOLIO_MORE_ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('275','1457778747','1','admin','79','17','PORTFOLIO-MORE-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('276','1457778747','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('277','1457778749','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('278','1457778752','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('279','1457778752','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('280','1457778767','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('281','1457797071','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('282','1457797083','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('283','1457797088','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('284','1457811574','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('285','1457811602','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('286','1457811604','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('287','1457811637','1','admin','302','-','img','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('288','1457811637','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('289','1457811640','1','admin','301','3','img','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('290','1457811644','1','admin','302','3','Изображение','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('291','1457811644','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('292','1457811647','1','admin','301','3','Изображение','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('293','1457811654','1','admin','302','3','Изображение','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('294','1457811654','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('295','1457811656','1','admin','301','3','Изображение','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('296','1457811658','1','admin','302','3','Изображение','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('297','1457811658','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('298','1457811659','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('299','1457811707','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('300','1457812080','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('301','1457812092','1','admin','5','3','La Playa','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('302','1457812092','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('303','1457812115','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('304','1457812122','1','admin','5','-','Команда','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('305','1457812123','1','admin','3','4','Команда','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('306','1457812125','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('307','1457812127','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('308','1457812136','1','admin','20','-','Сотрудник','Saving template');
INSERT INTO `gt_manager_log` VALUES ('309','1457812136','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('310','1457812138','1','admin','16','5','Сотрудник','Editing template');
INSERT INTO `gt_manager_log` VALUES ('311','1457812140','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('312','1457812140','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('313','1457812142','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('314','1457812154','1','admin','5','-','Melissa Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('315','1457812155','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('316','1457812155','1','admin','3','5','Melissa Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('317','1457812157','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('318','1457812158','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('319','1457812164','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('320','1457812166','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('321','1457812177','1','admin','302','-','photo','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('322','1457812177','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('323','1457812179','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('324','1457812207','1','admin','5','5','Melissa Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('325','1457812208','1','admin','3','5','Melissa Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('326','1457812215','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('327','1457812221','1','admin','5','5','Melissa Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('328','1457812222','1','admin','3','5','Melissa Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('329','1457812222','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('330','1457812228','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('331','1457812231','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('332','1457812235','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('333','1457812239','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('334','1457812265','1','admin','5','-','John Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('335','1457812267','1','admin','3','6','John Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('336','1457812268','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('337','1457812279','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('338','1457812299','1','admin','5','-','Victoria Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('339','1457812299','1','admin','27','7','Victoria Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('340','1457812309','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('341','1457812312','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('342','1457812314','1','admin','5','6','John Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('343','1457812315','1','admin','3','6','John Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('344','1457812316','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('345','1457812318','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('346','1457812321','1','admin','5','6','John Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('347','1457812322','1','admin','3','6','John Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('348','1457812322','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('349','1457812323','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('350','1457812324','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('351','1457812326','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('352','1457812327','1','admin','5','5','Melissa Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('353','1457812328','1','admin','3','5','Melissa Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('354','1457812328','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('355','1457812330','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('356','1457812330','1','admin','27','7','Victoria Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('357','1457812337','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('358','1457812355','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('359','1457812360','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('360','1457812365','1','admin','5','-','Robert Doe','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('361','1457812366','1','admin','3','8','Robert Doe','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('362','1457812368','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('363','1457812368','1','admin','27','8','Robert Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('364','1457812372','1','admin','27','7','Victoria Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('365','1457812375','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('366','1457812377','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('367','1457812379','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('368','1457812389','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('369','1457812396','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('370','1457812409','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('371','1457812410','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('372','1457812471','1','admin','79','-','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('373','1457812471','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('374','1457812474','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('375','1457812475','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('376','1457812480','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('377','1457812480','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('378','1457812483','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('379','1457812532','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('380','1457812532','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('381','1457812566','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('382','1457812568','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('383','1457812587','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('384','1457812587','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('385','1457812607','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('386','1457812610','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('387','1457812613','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('388','1457812618','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('389','1457812620','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('390','1457812632','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('391','1457812632','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('392','1457812649','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('393','1457812660','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('394','1457812664','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('395','1457812672','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('396','1457812672','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('397','1457812675','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('398','1457812676','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('399','1457812680','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('400','1457812699','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('401','1457812699','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('402','1457812707','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('403','1457812727','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('404','1457813478','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('405','1457813551','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('406','1457813602','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('407','1457813609','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('408','1457813610','1','admin','27','3','La Playa','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('409','1457813705','1','admin','5','3','Girl with hat','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('410','1457813705','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('411','1457813711','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('412','1457813711','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('413','1457813712','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('414','1457813714','1','admin','94','3','Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('415','1457813714','1','admin','3','9','Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('416','1457813716','1','admin','94','9','Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('417','1457813716','1','admin','3','10','Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('418','1457813718','1','admin','94','10','Duplicate of Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('419','1457813718','1','admin','3','11','Duplicate of Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('420','1457813725','1','admin','94','11','Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('421','1457813725','1','admin','3','12','Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('422','1457813727','1','admin','94','12','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('423','1457813727','1','admin','3','13','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('424','1457813728','1','admin','94','13','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('425','1457813728','1','admin','3','14','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('426','1457813730','1','admin','94','14','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('427','1457813730','1','admin','3','15','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('428','1457813737','1','admin','27','10','Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('429','1457813737','1','admin','27','9','Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('430','1457813741','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('431','1457813745','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('432','1457813748','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('433','1457813749','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('434','1457813753','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('435','1457813753','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('436','1457813754','1','admin','27','9','Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('437','1457813780','1','admin','5','9','A new bag','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('438','1457813781','1','admin','3','9','A new bag','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('439','1457813782','1','admin','27','10','Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('440','1457813798','1','admin','5','10','Fashion sunglasses','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('441','1457813799','1','admin','3','10','Fashion sunglasses','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('442','1457813799','1','admin','27','11','Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('443','1457813823','1','admin','5','11','Red Lipstick','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('444','1457813824','1','admin','3','11','Red Lipstick','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('445','1457813825','1','admin','27','12','Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('446','1457813831','1','admin','27','11','Red Lipstick','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('447','1457813835','1','admin','5','11','Red Lipstick','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('448','1457813837','1','admin','3','11','Red Lipstick','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('449','1457813837','1','admin','27','12','Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('450','1457813851','1','admin','5','12','Dressing in red','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('451','1457813852','1','admin','3','12','Dressing in red','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('452','1457813853','1','admin','27','13','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('453','1457813873','1','admin','5','13','Perfect landscape','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('454','1457813874','1','admin','3','13','Perfect landscape','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('455','1457813874','1','admin','27','14','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('456','1457813906','1','admin','5','14','Cold light','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('457','1457813908','1','admin','27','15','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('458','1457813908','1','admin','3','14','Cold light','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('459','1457813909','1','admin','27','15','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('460','1457813925','1','admin','5','15','Point of View','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('461','1457813926','1','admin','3','15','Point of View','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('462','1457813928','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('463','1457813931','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('464','1457813940','1','admin','112','1','Doc Manager','Менеджер ресурсов: свойство ресурсов \"Опубликовать / Отменить публикацию\" изменено.');
INSERT INTO `gt_manager_log` VALUES ('465','1457813940','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('466','1457813944','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('467','1457813946','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('468','1457813951','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('469','1457813955','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('470','1457813991','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('471','1457813992','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('472','1457814044','1','admin','79','-','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('473','1457814044','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('474','1457814047','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('475','1457814049','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('476','1457814051','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('477','1457814055','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('478','1457814057','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('479','1457814058','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('480','1457814062','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('481','1457814086','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('482','1457814086','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('483','1457814095','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('484','1457814248','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('485','1457815893','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('486','1457815896','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('487','1457815898','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('488','1457815907','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('489','1457815966','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('490','1457815966','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('491','1457815978','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('492','1457816033','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('493','1457816035','1','admin','23','-','Новый сниппет','Creating a new Snippet');
INSERT INTO `gt_manager_log` VALUES ('494','1457816046','1','admin','24','-','multiPhotos','Saving Snippet');
INSERT INTO `gt_manager_log` VALUES ('495','1457816046','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('496','1457816048','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('497','1457816232','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('498','1457816476','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('499','1457816481','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('500','1457816497','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('501','1457816497','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('502','1457816506','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('503','1457816513','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('504','1457816515','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('505','1457816529','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('506','1457816529','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('507','1457816545','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('508','1457816566','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('509','1457816567','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('510','1457816573','1','admin','79','-','SRC','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('511','1457816573','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('512','1457816584','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('513','1457816584','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('514','1457816608','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('515','1457816608','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('516','1457816684','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('517','1457816687','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('518','1457816708','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('519','1457816708','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('520','1457816710','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('521','1457816716','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('522','1457816716','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('523','1457816719','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('524','1457816726','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('525','1457816726','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('526','1457816730','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('527','1457816735','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('528','1457816735','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('529','1457816738','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('530','1457816741','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('531','1457816741','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('532','1457816742','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('533','1457816745','1','admin','79','4','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('534','1457816745','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('535','1457816746','1','admin','78','14','LP-FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('536','1457816748','1','admin','79','14','LP-FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('537','1457816748','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('538','1457816749','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('539','1457816751','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('540','1457816751','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('541','1457816751','1','admin','78','10','LP-PRICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('542','1457816753','1','admin','79','10','LP-PRICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('543','1457816753','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('544','1457816754','1','admin','78','13','LP-CONTACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('545','1457816756','1','admin','79','13','LP-CONTACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('546','1457816756','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('547','1457816757','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('548','1457816759','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('549','1457816759','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('550','1457816760','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('551','1457816762','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('552','1457816762','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('553','1457816763','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('554','1457816765','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('555','1457816765','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('556','1457816766','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('557','1457816767','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('558','1457816768','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('559','1457816771','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('560','1457816771','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('561','1457816772','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('562','1457816774','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('563','1457816774','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('564','1457816781','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('565','1457816786','1','admin','79','15','PORTFOLIO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('566','1457816786','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('567','1457816787','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('568','1457816790','1','admin','79','16','PORTFOLIO-MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('569','1457816790','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('570','1457816791','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('571','1457816794','1','admin','79','17','PORTFOLIO-MORE-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('572','1457816794','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('573','1457816796','1','admin','78','20','SRC','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('574','1457816800','1','admin','79','20','SRC','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('575','1457816800','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('576','1457816802','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('577','1457816805','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('578','1457816805','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('579','1457816807','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('580','1457816811','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('581','1457816811','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('582','1457816813','1','admin','16','5','Сотрудник','Editing template');
INSERT INTO `gt_manager_log` VALUES ('583','1457816815','1','admin','20','5','Сотрудник','Saving template');
INSERT INTO `gt_manager_log` VALUES ('584','1457816815','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('585','1457816905','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('586','1457816908','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('587','1457817004','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('588','1457817007','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('589','1457817015','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('590','1457817025','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('591','1457817050','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('592','1457817052','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('593','1457817067','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('594','1457817067','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('595','1457817364','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('596','1457817369','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('597','1457817369','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('598','1457817383','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('599','1457817386','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('600','1457817388','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('601','1457817392','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('602','1457817392','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('603','1457817400','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('604','1457817411','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('605','1457817413','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('606','1457817420','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('607','1457817420','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('608','1457817443','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('609','1457817450','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('610','1457817450','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('611','1457817868','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('612','1457817884','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('613','1457817884','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('614','1457817902','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('615','1457817902','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('616','1457817912','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('617','1457817917','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('618','1457817920','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('619','1457817929','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('620','1457817929','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('621','1457817970','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('622','1457817972','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('623','1457817975','1','admin','78','14','LP-FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('624','1457817980','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('625','1457818020','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('626','1457818025','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('627','1457818034','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('628','1457818046','1','admin','20','4','Элемент портфолио','Saving template');
INSERT INTO `gt_manager_log` VALUES ('629','1457818046','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('630','1457818108','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('631','1457818112','1','admin','79','15','PORTFOLIO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('632','1457818112','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('633','1457818156','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('634','1457818161','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('635','1457818162','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('636','1457818167','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('637','1457818169','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('638','1457818170','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('639','1457818242','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('640','1457818243','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('641','1457818245','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('642','1457818252','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('643','1457818253','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('644','1457818254','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('645','1457818255','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('646','1457818306','1','admin','79','16','PORTFOLIO-MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('647','1457818306','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('648','1457818391','1','admin','79','16','PORTFOLIO-MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('649','1457818391','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('650','1457818391','1','admin','79','16','PORTFOLIO-MORE','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('651','1457818391','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('652','1457818393','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('653','1457818395','1','admin','78','17','PORTFOLIO-MORE-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('654','1457818397','1','admin','80','17','PORTFOLIO-MORE-ITEM','Deleting Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('655','1457818398','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('656','1457818551','1','admin','78','16','PORTFOLIO-MORE','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('657','1457818557','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('658','1457818559','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('659','1457818641','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('660','1457818641','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('661','1457818649','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('662','1457818652','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('663','1457818654','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('664','1457818658','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('665','1457818658','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('666','1457818661','1','admin','27','10','Fashion sunglasses','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('667','1457818661','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('668','1457818664','1','admin','27','9','A new bag','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('669','1457818671','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('670','1457818674','1','admin','301','1','worktype','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('671','1457818679','1','admin','302','1','Тип услуги','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('672','1457818679','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('673','1457818682','1','admin','301','4','photo','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('674','1457818685','1','admin','302','4','Фото','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('675','1457818685','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('676','1457818686','1','admin','301','2','tags','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('677','1457818689','1','admin','302','2','Тэги','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('678','1457818689','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('679','1457818692','1','admin','27','9','A new bag','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('680','1457818699','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('681','1457818703','1','admin','78','1','mm_rules','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('682','1457818711','1','admin','27','9','A new bag','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('683','1457818717','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('684','1457818740','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('685','1457818761','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('686','1457818761','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('687','1457818768','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('688','1457818788','1','admin','79','11','LP-WORKS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('689','1457818788','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('690','1457818813','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('691','1457818827','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('692','1457818827','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('693','1457818841','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('694','1457818883','1','admin','78','19','LP-WORKS-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('695','1457818896','1','admin','79','19','LP-WORKS-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('696','1457818896','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('697','1457818919','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('698','1457818931','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('699','1457818931','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('700','1457818939','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('701','1457818947','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('702','1457818976','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('703','1457818976','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('704','1457818978','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('705','1457818990','1','admin','79','-','FOOTER-STYLE-SWITCHER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('706','1457818990','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('707','1457818993','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('708','1457819004','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('709','1457819004','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('710','1457819005','1','admin','78','21','FOOTER-STYLE-SWITCHER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('711','1457819008','1','admin','79','21','FOOTER-STYLE-SWITCHER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('712','1457819008','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('713','1457819011','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('714','1457819089','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('715','1457819089','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('716','1457819119','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('717','1457819127','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('718','1457819130','1','admin','301','3','Изображение','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('719','1457819135','1','admin','302','3','Изображение','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('720','1457819135','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('721','1457819137','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('722','1457819147','1','admin','302','4','Фото','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('723','1457819147','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('724','1457819149','1','admin','301','2','Тэги','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('725','1457819152','1','admin','302','2','Тэги','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('726','1457819152','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('727','1457819154','1','admin','301','1','Тип услуги','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('728','1457819157','1','admin','302','1','Тип услуги','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('729','1457819157','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('730','1457819161','1','admin','301','3','Изображение','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('731','1457819163','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('732','1457819165','1','admin','301','2','Тэги','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('733','1457819166','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('734','1457819168','1','admin','301','1','Тип услуги','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('735','1457819169','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('736','1457819197','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('737','1457819199','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('738','1457819234','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('739','1457819237','1','admin','78','1','mm_rules','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('740','1457819247','1','admin','79','1','mm_rules','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('741','1457819247','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('742','1457819249','1','admin','27','9','A new bag','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('743','1457819273','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('744','1457819276','1','admin','78','1','mm_rules','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('745','1457819307','1','admin','79','1','mm_rules','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('746','1457819307','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('747','1457819311','1','admin','102','4','ManagerManager','Edit plugin');
INSERT INTO `gt_manager_log` VALUES ('748','1457819339','1','admin','27','11','Red Lipstick','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('749','1457819342','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('750','1457819345','1','admin','27','10','Fashion sunglasses','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('751','1457819345','1','admin','27','10','Fashion sunglasses','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('752','1457819347','1','admin','27','13','Perfect landscape','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('753','1457819348','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('754','1457819350','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('755','1457819351','1','admin','27','12','Dressing in red','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('756','1457819352','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('757','1457819355','1','admin','78','1','mm_rules','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('758','1457819367','1','admin','79','1','mm_rules','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('759','1457819367','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('760','1457819369','1','admin','27','12','Dressing in red','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('761','1457819370','1','admin','27','12','Dressing in red','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('762','1457819372','1','admin','27','11','Red Lipstick','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('763','1457819374','1','admin','27','11','Red Lipstick','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('764','1457819735','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('765','1457819738','1','admin','78','18','LP-TEAM-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('766','1457819743','1','admin','79','18','LP-TEAM-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('767','1457819743','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('768','1457819834','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('769','1457819856','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('770','1457819857','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('771','1457819860','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('772','1457819869','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('773','1457819871','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('774','1457819998','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('775','1457819998','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('776','1457820007','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('777','1457820015','1','admin','5','-','Клиенты','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('778','1457820016','1','admin','3','16','Клиенты','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('779','1457820016','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('780','1457820018','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('781','1457820021','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('782','1457820037','1','admin','5','-','1','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('783','1457820037','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('784','1457820041','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('785','1457820043','1','admin','94','17','Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('786','1457820043','1','admin','3','18','Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('787','1457820045','1','admin','94','18','Duplicate of Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('788','1457820045','1','admin','3','19','Duplicate of Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('789','1457820046','1','admin','94','19','Duplicate of Duplicate of Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('790','1457820046','1','admin','3','20','Duplicate of Duplicate of Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('791','1457820052','1','admin','94','20','Duplicate of Duplicate of Duplicate of Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('792','1457820052','1','admin','3','21','Duplicate of Duplicate of Duplicate of Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('793','1457820053','1','admin','94','21','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('794','1457820053','1','admin','3','22','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('795','1457820055','1','admin','94','22','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Duplicate resource');
INSERT INTO `gt_manager_log` VALUES ('796','1457820055','1','admin','3','23','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('797','1457820057','1','admin','27','18','Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('798','1457820058','1','admin','5','18','2','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('799','1457820060','1','admin','3','18','2','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('800','1457820061','1','admin','27','19','Duplicate of Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('801','1457820062','1','admin','5','19','3','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('802','1457820063','1','admin','27','20','Duplicate of Duplicate of Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('803','1457820066','1','admin','5','20','4','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('804','1457820067','1','admin','3','20','4','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('805','1457820071','1','admin','27','21','Duplicate of Duplicate of Duplicate of Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('806','1457820073','1','admin','5','21','5','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('807','1457820074','1','admin','3','21','5','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('808','1457820074','1','admin','27','22','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('809','1457820076','1','admin','5','22','6','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('810','1457820077','1','admin','27','23','Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of Duplicate of 1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('811','1457820079','1','admin','5','23','7','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('812','1457820080','1','admin','3','23','7','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('813','1457820082','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('814','1457820096','1','admin','112','1','Doc Manager','Менеджер ресурсов: свойство ресурсов \"Опубликовать / Отменить публикацию\" изменено.');
INSERT INTO `gt_manager_log` VALUES ('815','1457820096','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('816','1457820099','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('817','1457820101','1','admin','112','1','Doc Manager','Менеджер ресурсов: свойство ресурсов \"Опубликовать / Отменить публикацию\" изменено.');
INSERT INTO `gt_manager_log` VALUES ('818','1457820101','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('819','1457820103','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('820','1457820110','1','admin','112','1','Doc Manager','Менеджер ресурсов: свойство ресурсов \"Опубликовать / Отменить публикацию\" изменено.');
INSERT INTO `gt_manager_log` VALUES ('821','1457820110','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('822','1457820112','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('823','1457820114','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('824','1457820116','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('825','1457820131','1','admin','20','-','Клиент','Saving template');
INSERT INTO `gt_manager_log` VALUES ('826','1457820131','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('827','1457820133','1','admin','16','6','Клиент','Editing template');
INSERT INTO `gt_manager_log` VALUES ('828','1457820134','1','admin','20','6','Клиент','Saving template');
INSERT INTO `gt_manager_log` VALUES ('829','1457820135','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('830','1457820136','1','admin','16','6','Клиент','Editing template');
INSERT INTO `gt_manager_log` VALUES ('831','1457820137','1','admin','20','6','Клиент','Saving template');
INSERT INTO `gt_manager_log` VALUES ('832','1457820137','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('833','1457820139','1','admin','27','23','7','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('834','1457820142','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('835','1457820144','1','admin','16','6','Клиент','Editing template');
INSERT INTO `gt_manager_log` VALUES ('836','1457820145','1','admin','20','6','Клиент','Saving template');
INSERT INTO `gt_manager_log` VALUES ('837','1457820145','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('838','1457820147','1','admin','16','6','Клиент','Editing template');
INSERT INTO `gt_manager_log` VALUES ('839','1457820149','1','admin','20','6','Клиент','Saving template');
INSERT INTO `gt_manager_log` VALUES ('840','1457820149','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('841','1457820153','1','admin','106','-','-','Viewing Modules');
INSERT INTO `gt_manager_log` VALUES ('842','1457820154','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('843','1457820163','1','admin','112','1','Doc Manager','Менеджер ресурсов: шаблоны изменены.');
INSERT INTO `gt_manager_log` VALUES ('844','1457820163','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('845','1457820164','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('846','1457820165','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('847','1457820166','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('848','1457820169','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('849','1457820169','1','admin','5','4','Команда','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('850','1457820170','1','admin','3','4','Команда','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('851','1457820171','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('852','1457820172','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('853','1457820174','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('854','1457820177','1','admin','301','3','Изображение','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('855','1457820187','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('856','1457820189','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('857','1457820190','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('858','1457820191','1','admin','300','-','Новый параметр (TV)','Create Template Variable');
INSERT INTO `gt_manager_log` VALUES ('859','1457820193','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('860','1457820194','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('861','1457820198','1','admin','302','4','Фото','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('862','1457820198','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('863','1457820200','1','admin','27','18','2','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('864','1457820200','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('865','1457820209','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('866','1457820212','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('867','1457820213','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('868','1457820219','1','admin','302','4','Фото','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('869','1457820219','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('870','1457820220','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('871','1457820227','1','admin','5','17','1','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('872','1457820228','1','admin','27','18','2','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('873','1457820232','1','admin','5','18','2','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('874','1457820233','1','admin','3','18','2','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('875','1457820233','1','admin','27','19','3','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('876','1457820246','1','admin','5','19','3','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('877','1457820247','1','admin','3','19','3','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('878','1457820248','1','admin','27','20','4','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('879','1457820252','1','admin','5','20','4','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('880','1457820253','1','admin','3','20','4','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('881','1457820254','1','admin','27','21','5','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('882','1457820257','1','admin','5','21','5','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('883','1457820258','1','admin','3','21','5','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('884','1457820259','1','admin','27','22','6','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('885','1457820265','1','admin','5','22','6','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('886','1457820265','1','admin','27','23','7','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('887','1457820268','1','admin','5','23','7','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('888','1457820270','1','admin','3','23','7','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('889','1457820270','1','admin','27','23','7','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('890','1457820272','1','admin','27','22','6','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('891','1457820273','1','admin','27','21','5','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('892','1457820275','1','admin','27','20','4','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('893','1457820277','1','admin','27','19','3','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('894','1457820278','1','admin','27','18','2','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('895','1457820278','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('896','1457820279','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('897','1457820280','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('898','1457820290','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('899','1457820306','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('900','1457820308','1','admin','78','11','LP-WORKS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('901','1457820312','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('902','1457820316','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('903','1457820339','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('904','1457820339','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('905','1457820348','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('906','1457820353','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('907','1457820353','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('908','1457820367','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('909','1457820367','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('910','1457820368','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('911','1457820375','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('912','1457820375','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('913','1457820387','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('914','1457820387','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('915','1457820387','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('916','1457820390','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('917','1457820390','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('918','1457820415','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('919','1457820419','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('920','1457820481','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('921','1457820486','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('922','1457820491','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('923','1457820491','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('924','1457820504','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('925','1457820507','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('926','1457820509','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('927','1457820523','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('928','1457820542','1','admin','79','12','LP-CLIENTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('929','1457820542','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('930','1457820544','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('931','1457820576','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('932','1457820625','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('933','1457820628','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('934','1457820630','1','admin','97','4','Duplicate of LP-SLIDER','Duplicate Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('935','1457820630','1','admin','78','22','Duplicate of LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('936','1457820722','1','admin','79','22','LP-SLIDER-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('937','1457820722','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('938','1457820724','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('939','1457820732','1','admin','5','-','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('940','1457820733','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('941','1457820735','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('942','1457820745','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('943','1457820751','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('944','1457820763','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('945','1457820769','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('946','1457820771','1','admin','78','1','mm_rules','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('947','1457820776','1','admin','79','1','mm_rules','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('948','1457820776','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('949','1457820777','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('950','1457820780','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('951','1457820787','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('952','1457820799','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('953','1457820800','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('954','1457820803','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('955','1457820858','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('956','1457820860','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('957','1457820860','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('958','1457820861','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('959','1457820862','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('960','1457820862','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('961','1457820863','1','admin','27','1','Лендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('962','1457820865','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('963','1457820867','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('964','1457820870','1','admin','5','4','Команда','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('965','1457820871','1','admin','3','4','Команда','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('966','1457820871','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('967','1457820875','1','admin','5','16','Клиенты','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('968','1457820875','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('969','1457820878','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('970','1457820879','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('971','1457820880','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('972','1457820888','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('973','1457820889','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('974','1457820914','1','admin','5','-','Новый ресурс','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('975','1457820915','1','admin','3','25','Новый ресурс','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('976','1457820916','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('977','1457820921','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('978','1457821448','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('979','1457821453','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('980','1457821456','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('981','1457821456','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('982','1457821459','1','admin','102','8','TransAlias','Edit plugin');
INSERT INTO `gt_manager_log` VALUES ('983','1457821478','1','admin','103','8','TransAlias','Saving plugin');
INSERT INTO `gt_manager_log` VALUES ('984','1457821478','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('985','1457821480','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('986','1457821485','1','admin','5','25','Новый ресурс','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('987','1457821486','1','admin','3','25','Новый ресурс','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('988','1457821487','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('989','1457821521','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('990','1457821620','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('991','1457821676','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('992','1457821676','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('993','1457821686','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('994','1457821721','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('995','1457821721','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('996','1457821734','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('997','1457821802','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('998','1457821804','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('999','1457821805','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1000','1457821807','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1001','1457821840','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1002','1457821844','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1003','1457822367','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1004','1457822370','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1005','1457822472','1','admin','79','22','LP-SLIDER-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1006','1457822472','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1007','1457822475','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1008','1457822478','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1009','1457822480','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1010','1457822487','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1011','1457822489','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1012','1457822504','1','admin','79','22','LP-SLIDER-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1013','1457822504','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1014','1457822506','1','admin','27','25','Новый ресурс','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1015','1457822540','1','admin','5','25','Графические','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1016','1457822541','1','admin','3','25','Графические','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1017','1457822542','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1018','1457822545','1','admin','27','25','Графические','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1019','1457822569','1','admin','5','25','Графические Технологии','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1020','1457822570','1','admin','3','25','Графические Технологии','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1021','1457822572','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1022','1457822575','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1023','1457822599','1','admin','79','22','LP-SLIDER-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1024','1457822599','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1025','1457822600','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1026','1457822605','1','admin','79','22','LP-SLIDER-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1027','1457822605','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1028','1457822609','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1029','1457822618','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1030','1457822621','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1031','1457822623','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1032','1457822625','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1033','1457822628','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1034','1457822631','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1035','1457822635','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1036','1457822638','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1037','1457822664','1','admin','79','4','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1038','1457822664','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1039','1457822680','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1040','1457822801','1','admin','78','22','LP-SLIDER-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1041','1457822805','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1042','1457822811','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1043','1457822815','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('1044','1457822819','1','admin','20','-','Слайдер','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1045','1457822819','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1046','1457822821','1','admin','16','7','Слайдер','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1047','1457822822','1','admin','20','7','Слайдер','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1048','1457822822','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1049','1457822825','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('1050','1457822829','1','admin','302','4','Фото','Save Template Variable');
INSERT INTO `gt_manager_log` VALUES ('1051','1457822829','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1052','1457822831','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1053','1457822836','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1054','1457822845','1','admin','5','25','Графические Технологии','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1055','1457822846','1','admin','3','25','Графические Технологии','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1056','1457822864','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1057','1457822879','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1058','1457822884','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1059','1457822935','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1060','1457822944','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1061','1457822998','1','admin','5','-','Totally handcrafted built for','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1062','1457823000','1','admin','3','26','Totally handcrafted built for','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1063','1457823011','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1064','1457823030','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1065','1457823036','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1066','1457823062','1','admin','79','4','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1067','1457823062','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1068','1457823065','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1069','1457823067','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1070','1457823117','1','admin','5','-','Some of my features','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1071','1457823119','1','admin','3','27','Some of my features','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1072','1457823141','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1073','1457823145','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1074','1457823302','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1075','1457823305','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1076','1457823955','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1077','1457823958','1','admin','78','13','LP-CONTACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1078','1457824150','1','admin','79','13','LP-CONTACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1079','1457824150','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1080','1457824831','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1081','1457824840','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1082','1457824848','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1083','1457824850','1','admin','78','12','LP-CLIENTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1084','1457824854','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1085','1457824860','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1086','1457825000','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1087','1457825001','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1088','1457825008','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1089','1457825008','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1090','1457825032','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1091','1457825060','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1092','1457825062','1','admin','78','15','PORTFOLIO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1093','1457825063','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1094','1457825065','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1095','1457825083','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1096','1457825083','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1097','1457825097','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1098','1457825111','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1099','1457825111','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1100','1457825125','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1101','1457825142','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1102','1457825143','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1103','1457825152','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1104','1457825152','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1105','1457825166','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1106','1457825382','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1107','1457825384','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1108','1457825411','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1109','1457825411','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1110','1457825415','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1111','1457825418','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1112','1457825418','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1113','1457825449','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1114','1457825461','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1115','1457825461','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1116','1457825471','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1117','1457825513','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1118','1457825522','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1119','1457825524','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1120','1457825539','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1121','1457825555','1','admin','79','3','FOOTER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1122','1457825555','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1123','1457825557','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1124','1457825560','1','admin','20','3','Лендинг','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1125','1457825560','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1126','1457825562','1','admin','16','7','Слайдер','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1127','1457825566','1','admin','20','7','Слайдер','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1128','1457825566','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1129','1457825582','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1130','1457825696','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1131','1457825696','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1132','1457825703','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1133','1457825725','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1134','1457825744','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1135','1457825744','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1136','1457825748','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1137','1457825789','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1138','1457825792','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1139','1457825792','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1140','1457825802','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1141','1457825840','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1142','1457825840','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1143','1457825846','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1144','1457825847','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1145','1457825873','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1146','1457825902','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1147','1457825902','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1148','1457825935','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1149','1457825936','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1150','1457825953','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1151','1457825953','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1152','1457825986','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1153','1457825987','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1154','1457827270','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1155','1457827305','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1156','1457827326','1','admin','27','1','Лендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1157','1457827332','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1158','1457827336','1','admin','16','3','Лендинг','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1159','1457827338','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1160','1457827340','1','admin','16','6','Клиент','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1161','1457827342','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1162','1457827348','1','admin','301','4','Фото','Edit Template Variable');
INSERT INTO `gt_manager_log` VALUES ('1163','1457827355','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1164','1457827358','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1165','1457827360','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1166','1457827361','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1167','1457827363','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1168','1457827366','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1169','1457827367','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1170','1457827369','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1171','1457827370','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1172','1457827374','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1173','1457827378','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1174','1457827381','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1175','1457827382','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1176','1457827390','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1177','1457827405','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1178','1457827405','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1179','1457827424','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1180','1457827424','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1181','1457827442','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1182','1457827442','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1183','1457827462','1','admin','3','3','Girl with hat','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1184','1457827463','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1185','1457827473','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1186','1457827482','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1187','1457827482','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1188','1457827496','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1189','1457827496','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1190','1457827523','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1191','1457827529','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1192','1457827529','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1193','1457827541','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1194','1457827542','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1195','1457827542','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1196','1457827558','1','admin','114','-','-','View event log');
INSERT INTO `gt_manager_log` VALUES ('1197','1457827560','1','admin','13','-','-','Viewing logging');
INSERT INTO `gt_manager_log` VALUES ('1198','1457827566','1','admin','114','-','-','View event log');
INSERT INTO `gt_manager_log` VALUES ('1199','1457827568','1','admin','115','5','-','View event log details');
INSERT INTO `gt_manager_log` VALUES ('1200','1457827587','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1201','1457827592','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1202','1457827600','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1203','1457827601','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1204','1457827604','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1205','1457827606','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1206','1457827618','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1207','1457827633','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1208','1457827634','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1209','1457827636','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1210','1457827639','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1211','1457827647','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1212','1457827652','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1213','1457827653','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1214','1457827653','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1215','1457827655','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1216','1457827695','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1217','1457827696','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1218','1457827697','1','admin','27','3','Girl with hat','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1219','1457827726','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1220','1457827734','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1221','1457827738','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1222','1457827744','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1223','1457827750','1','admin','5','-','404','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1224','1457827750','1','admin','27','28','404','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1225','1457827761','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1226','1457827763','1','admin','27','28','404','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1227','1457827767','1','admin','5','28','404','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1228','1457827768','1','admin','3','28','404','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1229','1457827775','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1230','1457827782','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('1231','1457827785','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1232','1457827798','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1233','1457827799','1','admin','5','-','403','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1234','1457827800','1','admin','3','29','403','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1235','1457827802','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1236','1457827823','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('1237','1457827867','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1238','1457827872','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1239','1457827877','1','admin','5','4','Команда','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1240','1457827878','1','admin','3','4','Команда','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1241','1457827879','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1242','1457827883','1','admin','5','16','Клиенты','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1243','1457827884','1','admin','3','16','Клиенты','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1244','1457827885','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1245','1457827888','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1246','1457827889','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1247','1457827890','1','admin','27','29','403','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1248','1457827896','1','admin','5','29','403','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1249','1457827897','1','admin','3','29','403','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1250','1457827901','1','admin','27','29','403','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1251','1457827903','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1252','1457827915','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('1253','1457827921','1','admin','27','29','403','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1254','1457827925','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1255','1457827934','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1256','1457827936','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1257','1457827936','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1258','1457827939','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1259','1457827941','1','admin','5','4','Команда','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1260','1457827942','1','admin','3','4','Команда','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1261','1457827942','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1262','1457827944','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1263','1457827944','1','admin','5','16','Клиенты','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1264','1457827945','1','admin','3','16','Клиенты','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1265','1457827947','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1266','1457827949','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1267','1457827950','1','admin','5','24','Слайдер','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1268','1457827951','1','admin','3','24','Слайдер','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1269','1457827952','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1270','1457827955','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1271','1457827957','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1272','1457827958','1','admin','5','2','Портфолио','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1273','1457827959','1','admin','3','2','Портфолио','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1274','1457827959','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1275','1457827961','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1276','1457827963','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1277','1457827964','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1278','1457827965','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1279','1457827968','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1280','1457828285','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1281','1457828287','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1282','1457906220','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1283','1457906232','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1284','1457906237','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1285','1457906238','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1286','1457906285','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1287','1457906285','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1288','1457906292','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1289','1457906359','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1290','1457906361','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1291','1457906370','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1292','1457906371','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1293','1457906373','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1294','1457906625','1','admin','78','13','LP-CONTACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1295','1457906642','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1296','1457906643','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1297','1457906652','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1298','1457906652','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1299','1457906660','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1300','1457906678','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1301','1457906680','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1302','1457906687','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1303','1457906689','1','admin','78','3','FOOTER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1304','1457906715','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1305','1457906716','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1306','1457907087','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1307','1457907371','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1308','1457907371','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1309','1457907373','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1310','1457907402','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1311','1457907403','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1312','1457907415','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1313','1457907415','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1314','1457907420','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1315','1457907489','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1316','1457907492','1','admin','78','2','HEADER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1317','1457907500','1','admin','79','2','HEADER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1318','1457907500','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1319','1457907611','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1320','1457907618','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1321','1457907630','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1322','1457907630','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1323','1457907703','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1324','1457907709','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1325','1457907709','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1326','1457907717','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1327','1457908751','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1328','1457908755','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1329','1457908761','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1330','1461017342','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('1331','1461017349','1','admin','17','-','-','Editing settings');
INSERT INTO `gt_manager_log` VALUES ('1332','1461017355','1','admin','30','-','-','Saving settings');
INSERT INTO `gt_manager_log` VALUES ('1333','1461017359','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1334','1461017380','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1335','1461017382','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1336','1461017384','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1337','1461017510','1','admin','79','5','LP-ABOUT','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1338','1461017510','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1339','1461017544','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1340','1461017708','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1341','1461017716','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1342','1461017721','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1343','1461017721','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1344','1461017791','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1345','1461017794','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1346','1461017883','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1347','1461017883','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1348','1461017898','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1349','1461018042','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1350','1461018043','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1351','1461018070','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1352','1461018070','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1353','1461018097','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1354','1461018117','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1355','1461018119','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1356','1461018204','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1357','1461018204','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1358','1461018209','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1359','1461018487','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1360','1461018489','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1361','1461018505','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1362','1461018505','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1363','1461018510','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1364','1461018608','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1365','1461019311','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1366','1461019314','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1367','1461019365','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1368','1461019366','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1369','1461019374','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1370','1461019502','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1371','1461019515','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1372','1461019515','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1373','1461019517','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1374','1461019543','1','admin','78','6','LP-ABOUT-FACTS','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1375','1461019632','1','admin','79','6','LP-ABOUT-FACTS','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1376','1461019632','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1377','1461019633','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1378','1461019737','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1379','1461020141','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1380','1461020141','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1381','1461020148','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1382','1461020575','1','admin','79','7','LP-TEAM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1383','1461020575','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1384','1461020576','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1385','1461020578','1','admin','78','7','LP-TEAM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1386','1461190491','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('1387','1461190494','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1388','1461190498','1','admin','93','-','-','Backup Manager');
INSERT INTO `gt_manager_log` VALUES ('1389','1461879367','1','admin','58','-','MODX','Logged in');
INSERT INTO `gt_manager_log` VALUES ('1390','1461879371','1','admin','27','5','Melissa Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1391','1461879484','1','admin','5','5','Али Абу','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1392','1461879485','1','admin','3','5','Али Абу','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1393','1461879486','1','admin','27','6','John Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1394','1461879514','1','admin','5','6','Суворова Юлия','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1395','1461879515','1','admin','3','6','Суворова Юлия','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1396','1461879516','1','admin','27','7','Victoria Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1397','1461879541','1','admin','5','7','Гульшина Юлия','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1398','1461879542','1','admin','3','7','Гульшина Юлия','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1399','1461879550','1','admin','27','8','Robert Doe','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1400','1461879564','1','admin','5','8','Гульшин Владимир','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1401','1461879566','1','admin','3','8','Гульшин Владимир','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1402','1461880033','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1403','1461880038','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1404','1461880084','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1405','1461880084','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1406','1461880138','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1407','1461880216','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1408','1461880216','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1409','1461880500','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1410','1461880500','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1411','1461880699','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1412','1461880699','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1413','1461880708','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1414','1461880892','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1415','1461880896','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1416','1461880977','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1417','1461880977','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1418','1461881032','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1419','1461881045','1','admin','79','8','LP-VIDEO','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1420','1461881045','1','admin','78','8','LP-VIDEO','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1421','1461881049','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1422','1461881158','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1423','1461881162','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1424','1461881295','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1425','1461881295','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1426','1461881304','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1427','1461881685','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1428','1461881687','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1429','1461881689','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1430','1461881691','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1431','1461881858','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1432','1461881858','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1433','1461881866','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1434','1461881893','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1435','1461881893','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1436','1461881894','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1437','1461882068','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1438','1461882068','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1439','1461882069','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1440','1461882085','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1441','1461882085','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1442','1461882228','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1443','1461882228','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1444','1461882231','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1445','1461882319','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1446','1461882323','1','admin','5','-','Услуги','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1447','1461882324','1','admin','3','30','Услуги','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1448','1461882325','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1449','1461882328','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1450','1461882334','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1451','1461882338','1','admin','5','30','Услуги','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1452','1461882339','1','admin','3','30','Услуги','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1453','1461882342','1','admin','27','19','3','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1454','1461882346','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1455','1461882349','1','admin','19','-','Новый шаблон','Creating a new template');
INSERT INTO `gt_manager_log` VALUES ('1456','1461882355','1','admin','20','-','Услуга','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1457','1461882355','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1458','1461882358','1','admin','16','4','Элемент портфолио','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1459','1461882360','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1460','1461882366','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1461','1461882384','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1462','1461882386','1','admin','77','-','Новый чанк','Creating a new Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1463','1461882396','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1464','1461882443','1','admin','79','-','LP-SERVICES-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1465','1461882443','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1466','1461882444','1','admin','78','23','LP-SERVICES-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1467','1461882448','1','admin','79','23','LP-SERVICES-ITEM','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1468','1461882448','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1469','1461882450','1','admin','78','23','LP-SERVICES-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1470','1461882450','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1471','1461882452','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1472','1461882458','1','admin','79','4','LP-SLIDER','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1473','1461882458','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1474','1461882460','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1475','1461882477','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1476','1461882477','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1477','1461882479','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1478','1461882486','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1479','1461882489','1','admin','16','8','Услуга','Editing template');
INSERT INTO `gt_manager_log` VALUES ('1480','1461882493','1','admin','20','8','Услуга','Saving template');
INSERT INTO `gt_manager_log` VALUES ('1481','1461882493','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1482','1461882494','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1483','1461882496','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1484','1461882510','1','admin','5','-','Брендинг','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1485','1461882511','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1486','1461882515','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1487','1461882516','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1488','1461882517','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1489','1461882525','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1490','1461882526','1','admin','5','30','Услуги','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1491','1461882527','1','admin','3','30','Услуги','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1492','1461882536','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1493','1461882547','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1494','1461882551','1','admin','27','31','Брендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1495','1461882554','1','admin','5','31','Брендинг','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1496','1461882555','1','admin','3','31','Брендинг','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1497','1461882556','1','admin','27','31','Брендинг','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1498','1461882560','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1499','1461882562','1','admin','5','30','Услуги','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1500','1461882563','1','admin','3','30','Услуги','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1501','1461882564','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1502','1461882574','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1503','1461882625','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1504','1461882627','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1505','1461882628','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1506','1461882629','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1507','1461882649','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1508','1461882673','1','admin','5','-','Дизайн','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1509','1461882673','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1510','1461882695','1','admin','5','-','Веб-дизайн','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1511','1461882695','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1512','1461882733','1','admin','5','-','Полиграфия','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1513','1461882733','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1514','1461882754','1','admin','5','-','Упаковка','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1515','1461882754','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1516','1461882770','1','admin','5','-','Сувенирная продукция','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1517','1461882770','1','admin','4','-','Новый ресурс','Creating a resource');
INSERT INTO `gt_manager_log` VALUES ('1518','1461882773','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1519','1461882779','1','admin','26','-','-','Refreshing site');
INSERT INTO `gt_manager_log` VALUES ('1520','1461882793','1','admin','78','9','LP-SERVICES','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1521','1461882838','1','admin','79','9','LP-SERVICES','Saving Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1522','1461882838','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1523','1461882860','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('1524','1461882863','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('1525','1461882893','1','admin','112','1','Doc Manager','Менеджер ресурсов: изменение индексов пунктов меню завершено.');
INSERT INTO `gt_manager_log` VALUES ('1526','1461882893','1','admin','112','1','Doc Manager','Execute module');
INSERT INTO `gt_manager_log` VALUES ('1527','1461882896','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1528','1461882897','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1529','1461882899','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1530','1461882900','1','admin','5','30','Услуги','Saving resource');
INSERT INTO `gt_manager_log` VALUES ('1531','1461882901','1','admin','3','30','Услуги','Viewing data for resource');
INSERT INTO `gt_manager_log` VALUES ('1532','1461882902','1','admin','27','4','Команда','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1533','1461882902','1','admin','27','30','Услуги','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1534','1461882903','1','admin','27','2','Портфолио','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1535','1461882904','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1536','1461882905','1','admin','27','24','Слайдер','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1537','1461882907','1','admin','27','16','Клиенты','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1538','1461882909','1','admin','27','17','1','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1539','1461882947','1','admin','106','-','-','Viewing Modules');
INSERT INTO `gt_manager_log` VALUES ('1540','1461882949','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1541','1461882953','1','admin','78','5','LP-ABOUT','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1542','1461882968','1','admin','27','25','Графические Технологии','Editing resource');
INSERT INTO `gt_manager_log` VALUES ('1543','1461882975','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1544','1461882983','1','admin','78','4','LP-SLIDER','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1545','1461882987','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1546','1461882988','1','admin','78','23','LP-SERVICES-ITEM','Editing Chunk (HTML Snippet)');
INSERT INTO `gt_manager_log` VALUES ('1547','1461882990','1','admin','76','-','-','Element management');
INSERT INTO `gt_manager_log` VALUES ('1548','1461883058','1','admin','93','-','-','Backup Manager');

# --------------------------------------------------------

#
# Table structure for table `gt_manager_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_manager_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.';

#
# Dumping data for table `gt_manager_users`
#

INSERT INTO `gt_manager_users` VALUES ('1','admin','uncrypt>08499110be83ff20017f51cf033f971a3a478528');

# --------------------------------------------------------

#
# Table structure for table `gt_member_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_member_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `gt_member_groups`
#


# --------------------------------------------------------

#
# Table structure for table `gt_membergroup_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_membergroup_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `gt_membergroup_access`
#


# --------------------------------------------------------

#
# Table structure for table `gt_membergroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_membergroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.';

#
# Dumping data for table `gt_membergroup_names`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_content`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_content`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.';

#
# Dumping data for table `gt_site_content`
#

INSERT INTO `gt_site_content` VALUES ('1','document','text/html','Лендинг','','','index.php','','1','0','0','0','0','','','1','3','0','1','1','1','1130304721','1','1457570194','0','0','0','1130304721','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('2','document','text/html','Портфолио','','','portfolio','','0','0','0','0','1','','','1','0','4','1','1','1','1457570862','1','1457827958','0','0','0','0','0','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('3','document','text/html','Girl with hat','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','la-playa','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457570958','1','1457813705','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('4','document','text/html','Команда','','','team','','0','0','0','0','1','','','1','0','2','1','1','1','1457812122','1','1457827940','0','0','0','0','0','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('5','document','text/html','Али Абу','Генеральный директор','ali@reklamagt.ru','ali-abu','','1','0','0','4','0','','','1','5','0','1','1','1','1457812154','1','1461879484','0','0','0','1457812154','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('6','document','text/html','Суворова Юлия','Креативный директор','','suvorova-yuliya','','1','0','0','4','0','','','1','5','1','1','1','1','1457812265','1','1461879514','0','0','0','1457812265','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('7','document','text/html','Гульшина Юлия','Арт-директор','','gulshina-yuliya','','1','0','0','4','0','','','1','5','2','1','1','1','1457812299','1','1461879541','0','0','0','1457812299','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('8','document','text/html','Гульшин Владимир','Аккаунт-директор','','gulshin-vladimir','','1','0','0','4','0','','','1','5','3','1','1','1','1457812365','1','1461879564','0','0','0','1457812365','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('9','document','text/html','A new bag','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','a-new-bag','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813714','1','1457813779','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('10','document','text/html','Fashion sunglasses','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','fashion-sunglasses','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813716','1','1457813798','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('11','document','text/html','Red Lipstick','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','red-lipstick','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813718','1','1457813835','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('12','document','text/html','Dressing in red','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','dressing-in-red','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813725','1','1457813851','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('13','document','text/html','Perfect landscape','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','perfect-landscape','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813727','1','1457813873','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('14','document','text/html','Cold light','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','cold-light','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813728','1','1457813906','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('15','document','text/html','Point of View','Phasellus enim libero, blandit vel sapien vitae.','ООО \"Ла Плая\"','point-of-view','','1','0','0','2','0','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.','','1','4','0','1','1','1','1457813730','1','1457813925','0','0','0','1457813940','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('16','document','text/html','Клиенты','','','clients','','0','0','0','0','1','','','1','0','5','1','1','1','1457820015','1','1457827944','0','0','0','0','0','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('17','document','text/html','1','','','1','','1','0','0','16','0','','','1','6','0','1','1','1','1457820037','1','1457820227','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('18','document','text/html','2','','','2','','1','0','0','16','0','','','1','6','0','1','1','1','1457820043','1','1457820232','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('19','document','text/html','3','','','3','','1','0','0','16','0','','','1','6','0','1','1','1','1457820045','1','1457820246','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('20','document','text/html','4','','','4','','1','0','0','16','0','','','1','6','0','1','1','1','1457820046','1','1457820252','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('21','document','text/html','5','','','5','','1','0','0','16','0','','','1','6','0','1','1','1','1457820052','1','1457820257','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('22','document','text/html','6','','','6','','1','0','0','16','0','','','1','6','0','1','1','1','1457820053','1','1457820265','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('24','document','text/html','Слайдер','','','slider','','0','0','0','0','1','','','1','0','1','1','1','1','1457820732','1','1457827950','0','0','0','0','0','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('23','document','text/html','7','','','7','','1','0','0','16','0','','','1','6','0','1','1','1','1457820055','1','1457820268','0','0','0','1457820110','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('25','document','text/html','Графические Технологии','Графические','Технологии','graficheskie-tehnologii','','1','0','0','24','0','','<!-- LAYER NR. 2 -->\n<div class=\"tp-caption lfb large_light_white text-center  tp-resizeme\"\n        data-x=\"center\"\n        data-y=\"200\"                \n        data-speed=\"1000\"\n        data-start=\"1500\"\n        data-easing=\"Back.easeInOut\"\n        style=\"z-index: 6\">\n  <h2 class=\"text-slide\">РЕКЛАМНОЕ АГЕНСТВО</h2>\n</div>\n\n<!-- LAYER NR. 3 -->\n<div class=\"tp-caption lfb large_light_white text-center  tp-resizeme\"\n        data-x=\"center\"\n        data-y=\"250\"               \n        data-speed=\"1000\"\n        data-start=\"2000\"\n        data-easing=\"Back.easeInOut\"\n        style=\"z-index: 6\">\n  <h2 class=\"text-slide\">ПОЛНОГО ЦИКЛА</h2>\n</div>','1','7','0','1','1','1','1457820914','1','1457822845','0','0','0','1457820914','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('26','document','text/html','Totally handcrafted built for','Totally handcrafted','built for','totally-handcrafted-built-for','','1','0','0','24','0','','        <!-- LAYER NR. 2 -->\n        <div class=\"tp-caption lfl large_bold_white_25 text-center  tp-resizeme\"\n                data-x=\"center\"\n                data-y=\"200\"                \n                data-speed=\"1000\"\n                data-start=\"1500\"\n                data-easing=\"Back.easeInOut\"\n                style=\"z-index: 6\">\n          <h2 class=\"text-slide\">AGENCY / PERSONAL / PORTFOLIO /</h2>\n        </div>\n        \n        <!-- LAYER NR. 3 -->\n        <div class=\"tp-caption lfr large_bold_white_25 tp-resizeme\"\n                data-x=\"center\"\n                data-hoffset=\"0\"\n                data-y=\"250\"\n                data-speed=\"1000\"\n                data-start=\"2200\"\n                data-easing=\"Power4.easeOut\"\n                data-endspeed=\"300\"\n                data-endeasing=\"Power1.easeIn\"\n                data-captionhidden=\"off\"\n                style=\"z-index: 6\">\n          <h2 class=\"text-slide\">PHOTOGRAPHER / CREATIVE / AND MUCH MORE...</h2>\n        </div>\n      </li>','1','7','1','1','1','1','1457822998','1','1457822998','0','0','0','1457822998','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('27','document','text/html','Some of my features','Some of my','features','some-of-my-features','','1','0','0','24','0','','        <!-- LAYER NR. 2 -->\n        <div class=\"tp-caption medium_bg_asbestos sfl\"\n            data-x=\"50\"\n            data-y=\"250\"\n            data-speed=\"500\"\n            data-start=\"800\"\n            data-easing=\"Power1.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Revolution Slider Included \n        </div>\n        \n        <!-- LAYER NR. 3 -->\n        <div class=\"tp-caption medium_bg_asbestos sfl\"\n            data-x=\"50\"\n            data-y=\"300\"\n            data-speed=\"500\"\n            data-start=\"1200\"\n            data-easing=\"Back.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Fully responsive \n        </div>\n        \n        <!-- LAYER NR. 5 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromleft\"\n            data-x=\"50\"\n            data-y=\"350\"\n            data-speed=\"800\"\n            data-start=\"1900\"\n            data-easing=\"Elastic.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Valid HTML5 / CSS3 \n        </div>\n        \n        <!-- LAYER NR. 6 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromleft\"\n            data-x=\"50\"\n            data-y=\"200\"\n            data-speed=\"800\"\n            data-start=\"2600\"\n            data-easing=\"Power3.easeInOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Cool animations \n        </div>\n        \n        <!-- LAYER NR. 7 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromleft\"\n            data-x=\"50\"\n\n            data-y=\"400\"\n            data-speed=\"800\"\n            data-start=\"3300\"\n            data-easing=\"Power4.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">jQuery Enhanced \n        </div>\n        \n        <!-- LAYER NR. 8 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"200\"\n            data-speed=\"800\"\n            data-start=\"4000\"\n            data-easing=\"Power2.easeInOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Crossbrowser Compatible \n        </div>\n        \n        <!-- LAYER NR. 9 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"250\"\n            data-speed=\"800\"\n            data-start=\"4700\"\n            data-easing=\"Circ.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Documentation included \n        </div>\n        \n        <!-- LAYER NR. 10 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"300\"\n            data-speed=\"800\"\n            data-start=\"5400\"\n            data-easing=\"Cube.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Parallax Backgrounds \n        </div>\n        \n        <!-- LAYER NR. 11 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"350\"\n            data-speed=\"800\"\n            data-start=\"6100\"\n            data-easing=\"Bounce.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Ajax Working Contact Form \n        </div>\n        \n        <!-- LAYER NR. 12 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"400\"\n            data-speed=\"800\"\n            data-start=\"6800\"\n            data-easing=\"Linear.easeNone\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Font Awesome \n        </div>\n        \n        <!-- LAYER NR. 13 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromright\"\n            data-x=\"right\"\n            data-hoffset=\"-50\"\n            data-y=\"450\"\n            data-speed=\"800\"\n            data-start=\"7500\"\n            data-easing=\"Expo.easeOut\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">Simple & Clean \n        </div>\n        \n        <!-- LAYER NR. 14 -->\n        <div class=\"tp-caption medium_bg_asbestos skewfromleft\"\n            data-x=\"50\"\n            data-y=\"450\"\n            data-speed=\"800\"\n            data-start=\"7500\"\n            data-easing=\"Expo.easeIn\"\n            data-endspeed=\"300\"\n            data-endeasing=\"Power1.easeIn\"\n            data-captionhidden=\"off\"\n            style=\"z-index: 6\">...And Much More \n        </div>\n      </li>','1','7','2','1','1','1','1457823117','1','1457823117','0','0','0','1457823117','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('28','document','text/html','404','','','404','','1','0','0','0','0','','404','1','0','6','1','1','1','1457827750','1','1457827767','0','0','0','1457827750','1','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('29','document','text/html','403','','','403','','1','0','0','0','0','','','1','0','7','1','1','1','1457827799','1','1457827896','0','0','0','1457827799','1','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('30','document','text/html','Услуги','','','services','','0','0','0','0','1','','','1','0','3','1','1','1','1461882323','1','1461882900','0','0','0','0','0','','0','0','0','0','0','0','1','1');
INSERT INTO `gt_site_content` VALUES ('31','document','text/html','Брендинг','fa-trademark','','brending','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','0','1','1','1','1461882510','1','1461882554','0','0','0','1461882510','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('32','document','text/html','Дизайн','fa-paint-brush','','dizajn','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','1','1','1','1','1461882673','1','1461882673','0','0','0','1461882673','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('33','document','text/html','Веб-дизайн','fa-desktop','','veb-dizajn','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','2','1','1','1','1461882695','1','1461882695','0','0','0','1461882695','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('34','document','text/html','Полиграфия','fa-map-o','','poligrafiya','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','3','1','1','1','1461882733','1','1461882733','0','0','0','1461882733','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('35','document','text/html','Упаковка','fa-dropbox','','upakovka','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','4','1','1','1','1461882753','1','1461882753','0','0','0','1461882753','1','','0','0','0','0','0','0','0','1');
INSERT INTO `gt_site_content` VALUES ('36','document','text/html','Сувенирная продукция','fa-gift','','suvenirnaya-produkciya','','1','0','0','30','0','Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur commodo exercitation.','','1','0','5','1','1','1','1461882770','1','1461882770','0','0','0','1461882770','1','','0','0','0','0','0','0','0','1');

# --------------------------------------------------------

#
# Table structure for table `gt_site_content_metatags`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_content_metatags`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

#
# Dumping data for table `gt_site_content_metatags`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_htmlsnippets`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_htmlsnippets`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `editor_name` varchar(50) NOT NULL DEFAULT 'none',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.';

#
# Dumping data for table `gt_site_htmlsnippets`
#

INSERT INTO `gt_site_htmlsnippets` VALUES ('1','mm_rules','Default ManagerManager rules.','2','none','1','0','// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\n\nif ($modx->db->getValue($modx->db->select(\'count(id)\', $modx->getFullTableName(\'site_tmplvars\'), \"name=\'documentTags\'\"))) {\n	mm_widget_tags(\'documentTags\', \' \'); // Give blog tag editing capabilities to the \'documentTags (3)\' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n//mm_hideFields(\"content,link_attributes\");\n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('2','HEADER','','2','none','8','0','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n<title>Graphic Technology | Рекламное агенство полного цикла</title>\n<meta name=\'description\' content=\'\'/>\n<meta name=\'keywords\' content=\'\'/>\n<meta name=\'robots\' content=\'index, follow\'/>\n<base href=\'[(site_url)]\'/>\n\n<!-- css files -->\n<link rel=\"stylesheet\" href=\"css/style.css\" />\n<link rel=\"stylesheet\" type=\"text/css\" href=\"css/settings.css\" media=\"screen\" />\n\n<!-- color styles - uncomment your preferred -->\n<link rel=\"stylesheet\" type=\"text/css\" href=\"css/skin/red.css\" name=\"colors\" />\n\n<!-- google-font links -->\n<link href=\'http://fonts.googleapis.com/css?family=Lobster\' rel=\'stylesheet\' type=\'text/css\'>\n<link href=\'http://fonts.googleapis.com/css?family=Roboto+Slab:100,300,700\' rel=\'stylesheet\' type=\'text/css\'>\n<link href=\'http://fonts.googleapis.com/css?family=PT+Sans:400,700,700italic,400italic\' rel=\'stylesheet\' type=\'text/css\'>\n\n<!-- modernizer js -->\n<script src=\"js/vendor/modernizr.js\"></script>\n\n<!-- favicon -->\n<link rel=\"shortcut icon\" href=\"img/favicon.ico\">\n\n</head>\n\n<body>\n\n<!-- Preloader -->\n<div class=\"mask\">\n  <div id=\"loader\" class=\"rotating\"></div>\n</div>\n<!--/Preloader -->\n\n<div id=\"up\"></div>\n\n<!-- Start Header -->\n<header id=\"navigation\">\n  <div class=\"row\">\n    <div class=\"large-3 small-6 medium-4 columns\">\n      \n      <!--start logo -->\n      <a title=\"\" href=\"/\"><img src=\"img/logo.png\" alt=\"Tangram\" /></a> \n      <!-- end logo -->\n\n    </div>\n    <div class=\"large-9 small-6 medium-8 columns\">\n      <div class=\"navigation\">\n        <div class=\"menu-button one-page\"></div>\n        <nav class=\"top-menu\"> \n          \n          <!-- start menu -->\n          <ul data-breakpoint=\"800\" class=\"flexnav one-page\">\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Главная\" href=\"[~[(site_start)]~]#up\" >Главная</a></li>\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Мы\" href=\"[~[(site_start)]~]#about\" >Мы</a></li>\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Команда\" href=\"[~[(site_start)]~]#team\" >Команда</a></li>\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Услуги\" href=\"[~[(site_start)]~]#services\" >Услуги</a></li>\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Работы\" href=\"[~[(site_start)]~]#works\" >Работы</a></li>\n            <li><a [[if? &is=`[*id*]:!=:[(site_start)]` &then=`class=\"external\" `]]title=\"Контакты\" href=\"[~[(site_start)]~]#contacts\" >Контакты</a></li>\n          </ul>\n          <!-- end menu --> \n          \n        </nav>\n      </div>\n    </div>\n  </div>\n</header>\n<!--end Header -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('3','FOOTER','','2','none','8','0','<!-- start footer -->\n<footer>\n  <div class=\"row\">\n    <div class=\"large-12 columns\"> <img src=\"img/logo_small.png\" alt=\"\" />\n      <p>2010-[!year!] © РА \"Графические технологии\".</p>\n    </div>\n  </div>\n</footer>\n<!-- end footer -->\n\n<script src=\"js/vendor/jquery.js\"></script> <!-- jquery js -->\n<script src=\"js/foundation.min.js\"></script> <!-- foundation js -->\n<script type=\"text/javascript\" src=\"js/jquery.mb.ytplayer.js\"></script> <!-- video background js -->\n<script type=\"text/javascript\"  src=\"js/jquery.onepagenav.js\"></script> <!-- navigation js -->\n<script type=\"text/javascript\" src=\"js/isotope.pkgd.min.js\"></script> <!-- isotope filter on portfolio js -->\n<script src=\"js/plugins.js\" type=\"text/javascript\"></script> <!-- various plugins js -->\n<script type=\"text/javascript\" src=\"js/jquery.themepunch.plugins.min.js\"></script> <!-- slider revolutiony js -->\n<script type=\"text/javascript\" src=\"js/jquery.themepunch.revolution.min.js\"></script> <!-- slider revolution js -->\n<script type=\"text/javascript\" src=\"js/revolution-custom.js\"></script> <!-- slider revolution settings js -->\n<script type=\"text/javascript\" src=\"js/jquery.magnific-popup.min.js\"></script> <!-- lightbox on portfolio js -->\n<script type=\"text/javascript\" src=\"js/jquery.videobg.js\"></script> <!-- video background js -->\n<script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp\"></script> <!-- google mapy js -->\n<script type=\"text/javascript\" src=\"js/custom.js\"></script> <!-- tangram required js -->\n\n<!--{FOOTER-STYLE-SWITCHER}-->\n</body>\n</html>','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('4','LP-SLIDER','','2','none','9','0','<!-- start Revolution Slider -->\n<div class=\"tp-banner-container\" >\n  <div class=\"tp-banner\" >\n    <ul>\n	  [[Ditto? &tpl=`LP-SLIDER-ITEM` &parents=`24` &orderBy=`menuindex ASC`]]\n    </ul>\n\n    <div class=\"tp-bannertimer\"></div>\n\n  </div>\n</div>\n<!-- end Revolution Slider --> \n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('5','LP-ABOUT','','2','none','9','0','<!-- start about -->\n<section id=\"about\">\n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n      <h1 class=\"title-section bold\"><span class=\"nbr\">01. </span>Мы<span class=\"border\"></span> </h1>\n      <h2 class=\"subtitle-section\"> Создаем коммуникации, которые способствуют эффективному продвижению товаров, услуг, проектов, концепций, идеологий и идей.</h2>\n    </div>\n  </div>\n  <div class=\"text-center\" data-scrollreveal=\"enter bottom and move 150px after 0.3s\"> \n    <img src=\"img/responsive.jpg\" alt=\"\" />   <br /><br /> <br /><br /> \n  </div>\n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n      <h2 class=\"subtitle-section\">\n		  Рекламное агентство Graphic Technology это команда, которая стремится сделать стиль Вашей компании более ярким, привлекательным и креативно насыщенным. Мы заинтересованы в том, чтобы наши специалисты в каждом проекте реализовывали свой потенциал на благо Вашего успеха.\n      </h2>\n    </div>\n  </div>\n</section>\n\n<section class=\"grey\">\n  <div class=\"row\">\n    <div class=\"large-12 columns\"> \n      \n      <!-- start box -->\n      <div class=\"large-4 medium-4 columns\">\n        <div class=\"icon-service\"> <i class=\"fa fa-star\"></i> </div>\n        <div class=\"info-service\">\n          <h4 class=\"bold\">ИНДИВИДУАЛЬНЫЙ ПОДХОД</h4>\n          <p>Мы считаем, что главное это интересы и реальные потребности клиента. Поэтому качественный сервис и индивидуальный подход обеспечивают наше устойчивое конкурентное преимущество.</p>\n        </div>\n      </div>\n      <!-- end box --> \n      \n      <!-- start box -->\n      <div class=\"large-4 medium-4 columns\">\n        <div class=\"icon-service\"> <i class=\"fa fa-lightbulb-o\"></i> </div>\n        <div class=\"info-service\">\n          <h4 class=\"bold\">КРЕАТИВНЫЕ РЕШЕНИЯ</h4>\n          <p>Мы не используем в своей работе шаблоны и готовые решения, не предллагаем идеи, лежащие на поверхности. Мы создаем новые концепции.</p>\n        </div>\n      </div>\n      <!-- end box --> \n      \n      <!-- start box -->\n      <div class=\"large-4 medium-4 columns\">\n        <div class=\"icon-service\"> <i class=\"fa fa-rocket\"></i> </div>\n        <div class=\"info-service\">\n          <h4 class=\"bold\">ИННОВАЦИОННЫЕ ТЕХНОЛОГИИ</h4>\n          <p>Для безупречного исполнения мы используем только современное высокотехнологичное оборудование и инновационные методы производства.</p>\n        </div>\n      </div>\n      <!-- end box --> \n      \n    </div>\n    <div class=\"large-12 columns text-center\">\n      <h1 class=\"slogan\"><a title=\"\" href=\"#works\" class=\"big_link\">А еще мы создаём яркий и привлекательный дизайн</a></h1>\n    </div>\n  </div>\n</section>\n<!-- end about --> \n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('6','LP-ABOUT-FACTS','','2','none','9','0','<!-- Start Parallax section -->\n<section class=\"parallax team-parallax\">\n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n      <h2 class=\"subtitle\">О нас<span class=\"border\"></span></h2>\n      <h3 class=\"subtitle\">..И что говорят наши клиенты</h3>\n\n      <!-- start counter -->\n      <div class=\"large-3 medium-3 columns\">                 \n        <div class=\"counter\" data-scrollreveal=\"enter left and move 150px after 0.3s\" data-perc=\"11\">\n          <div class=\"icon-counter\"> <i class=\"fa fa-briefcase\"></i> </div>\n          <div class=\"number-detail\">\n            <h1 class=\"number\"></h1>\n            <p>Лет работы</p>\n          </div>\n        </div>         \n      </div>\n      <!-- end counter -->\n\n      <!-- start counter -->\n      <div class=\"large-3  medium-3 columns\"> \n        <div class=\"counter\" data-scrollreveal=\"enter left and move 150px after 0.3s\" data-perc=\"186\">\n          <div class=\"icon-counter\"> <i class=\"fa fa-rocket\"></i> </div>\n          <div class=\"number-detail\">\n            <h1 class=\"number\"></h1>\n            <p>Проектов</p>\n          </div>\n        </div>        \n      </div>\n      <!-- end counter --> \n\n      <!-- start counter -->\n      <div class=\"large-3 medium-3 columns\"> \n        <div class=\"counter\" data-scrollreveal=\"enter left and move 150px after 0.3s\" data-perc=\"126\">\n          <div class=\"icon-counter\"> <i class=\"fa fa-users\"></i> </div>\n          <div class=\"number-detail\">\n            <h1 class=\"number\"></h1>\n            <p>Клиентов</p>\n          </div>\n        </div>         \n      </div>\n      <!-- end counter -->\n\n      <!-- start counter -->\n      <div class=\"large-3  medium-3 columns\"> \n        <div class=\"counter\" data-scrollreveal=\"enter left and move 150px after 0.3s\" data-perc=\"2651\">\n          <div class=\"icon-counter\"> <i class=\"fa fa-coffee\"></i> </div>\n          <div class=\"number-detail\">\n            <h1 class=\"number\"></h1>\n            <p>Чашек кофе</p>\n          </div>\n        </div>       \n      </div>\n      <!-- end counter -->\n\n    </div> \n  </div>\n  \n  <div class=\"row\">\n    <div class=\"large-12 medium-8 medium-centered columns\"> \n      \n      <!-- start testimonial coarousel -->\n      <div id=\"testimonial\" class=\"owl-carousel text-left\"> \n        \n        <!-- start slide -->\n        <div>\n          <div class=\"large-6 large-centered medium-12 medium-centered columns\">\n            <div class=\"large-3 medium-4 columns\"> <img class=\"testimonial-img\" src=\"img/testimonial/testimonial1.jpg\" alt=\"\" /> </div>\n            <div class=\"large-9 medium-8 columns\">\n              <h4 class=\"white semi-bold\">Мы рекомендуем агентство как надежного помощника и партнера для достижения поставленных маркетинговых задач.</h4>\n              <h5 class=\"white\">Анна Жданова</h5>\n            </div>\n          </div>\n        </div>\n        <!-- end slide --> \n        \n        <!-- start slide -->\n        <div>\n          <div class=\"large-6 large-centered medium-12 medium-centered columns\">\n            <div class=\"large-3 medium-4 columns\"> <img class=\"testimonial-img\" src=\"img/testimonial/testimonial2.jpg\" alt=\"\" /> </div>\n            <div class=\"large-9 medium-8 columns\">\n              <h4 class=\"white semi-bold\">Хочу отметить умение менеджеров находить индивидуальный подход к клиенту,\n				  способность оперативного реагирования на замечания и пожелания в процессе работы.</h4>\n              <h5 class=\"white\">Андрей Григоров</h5>\n            </div>\n          </div>\n        </div>\n        <!-- end slide --> \n        \n        <!-- start slide -->\n        <div>\n          <div class=\"large-6 large-centered medium-12 medium-centered columns\">\n            <div class=\"large-3 medium-4 columns\"> <img class=\"testimonial-img\" src=\"img/testimonial/testimonial3.jpg\" alt=\"\" /> </div>\n            <div class=\"large-9 medium-8 columns\">\n              <h4 class=\"white semi-bold\">Агентство «Графические Технологии» является нашим постоянным партером в области брендинга. \n				  За время длительного сотрудничества эта компания смогла неоднократно подтвердить свою высокую профессиональность и компетентность. </h4>\n              <h5 class=\"white\">Алексей Лымарь</h5>\n            </div>\n          </div>\n        </div>\n        <!-- end slide --> \n        \n      </div>\n      <!-- end#testimonial carousel --> \n      \n    </div> \n  </div>   \n</section>\n<!-- End Parallax Section -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('7','LP-TEAM','','2','none','9','0','<!-- start section team -->\n<section id=\"team\">\n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n      <h1 class=\"title-section bold\"><span class=\"nbr\">02.</span>Команда <span class=\"border\"></span> </h1>\n		<h2 class=\"subtitle-section\">Лучших Дизайнеров, Арт-Директоров,<br/> Маркетологов и Менеджеров</h2>\n    </div>\n    <div class=\"large-12 columns\"> \n        [[Ditto? &tpl=`LP-TEAM-ITEM` &parents=`4` &orderBy=`menuindex ASC`]]\n    </div>\n  </div>\n</section>\n<!-- end section team -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('19','LP-WORKS-ITEM','','2','none','9','0','<!-- start item -->        \n<div class=\"portfolio-item [+worktype+]\">\n  <div class=\"portfolio-img\">\n    <div class=\"portfolio-hover\"> \n      <a class=\"popup-link\" href=\"[[multiPhotos? &include=`1` &src=`[+img+]` &tpl=`SRC`]]\" title=\"[+pagetitle+]\"><i class=\"fa fa-expand\"></i></a> \n      <a href=\"[~[+id+]~]\"><i class=\"fa fa-search\"></i></a> \n    </div>\n	  <img src=\"thumbs/400x275/[[multiPhotos? &include=`1` &src=`[+img+]` &tpl=`SRC`]]\" alt=\"[+pagetitle+]\"> \n  </div>\n  <div class=\"project-info\">\n	  <h2>[+pagetitle+]</h2>\n    <p>[+worktype+]</p>\n  </div>\n</div>        \n<!-- end item -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('21','FOOTER-STYLE-SWITCHER','','2','none','8','0','<!-- Start Style Switcher -->\n<script src=\"js/styleswitcher.js\"></script>\n<script src=\"js/jquery-cookie.js\"></script> <!-- jQuery cookie -->\n<div class=\"switcher\"></div>\n<!-- End Style Switcher -->\n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('20','SRC','','2','none','8','0','[+src+]','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('8','LP-VIDEO','','2','none','9','0','<!-- start video section -->\n<section id=\"video-section\">\n  <div id=\"video-box\"></div>\n  <div class=\"overlay\"></div>\n  <div class=\"row\">\n    <div class=\"large-12 columns text-center white\"> \n      <i class=\"fa fa-quote-right fa-2x white\"></i>\n      <h2 class=\"subtitle white\">\"Делать деньги без рекламы может только монетный двор.\"<span class=\"border\"></span></h2>\n      <h3 class=\"subtitle white\">Томас Маколей</h3>\n    </div>\n    <a id=\"video\" class=\"player\" data-property=\"{videoURL:\'https://www.youtube.com/watch?v=0pXYp72dwl0\',containment:\'#video-box\', showControls:false, autoPlay:true, loop:true, mute:true, startAt:0, opacity:1, addRaster:false, quality:\'highres\'}\">My video</a>\n  </div>\n</section>\n<!-- end video section --> \n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('9','LP-SERVICES','','2','none','9','0','<!-- start services section -->\n<section id=\"services\">\n  <div class=\"row\" >\n    <div class=\"large-12 columns\">\n      <h1 class=\"title-section bold\"><span class=\"nbr\">03. </span>Услуги <span class=\"border\"></span> </h1>\n      <h2 class=\"subtitle-section\">Наши основные направления.</h2>\n    </div>\n	[[Ditto? &tpl=`LP-SERVICES-ITEM` &parents=`30` &orderBy=`menuindex ASC`]]\n  </div> \n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n      <h2 class=\"subtitle\">Our Process<span class=\"border\"></span></h2>\n      <h3 class=\"subtitle\">Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud</h3>\n      \n      <!-- start process -->\n      <div class=\"large-3 medium-3 columns\"> \n        <div class=\"process\">\n          <div class=\"process-hover\">\n            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\n          </div>\n          <i class=\"fa fa-lightbulb-o fa-5x\"></i>\n          <h3><span>0.1</span>Creative Ideas</h3>\n        </div>         \n      </div>\n      <!-- end process -->\n\n      <!-- start process -->\n      <div class=\"large-3 medium-3 columns\">         \n        <div class=\"process\">\n          <div class=\"process-hover\">\n            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\n          </div>\n          <i class=\"fa fa-flask fa-5x\"></i>\n          <h3><span>0.2</span>Find Solutions</h3>\n        </div>         \n      </div>\n      <!-- end process -->\n\n      <!-- start process -->\n      <div class=\"large-3 medium-3 columns\">         \n        <div class=\"process\">\n          <div class=\"process-hover\">\n            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\n          </div>\n          <i class=\"fa fa-code fa-5x\"></i>\n          <h3><span>0.3</span>Development</h3>\n        </div>         \n      </div>\n      <!-- end process -->\n\n      <!-- start process -->\n      <div class=\"large-3 medium-3 columns\">         \n        <div class=\"process\">\n          <div class=\"process-hover\">\n            <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>\n          </div>\n          <i class=\"fa fa-trophy fa-5x\"></i>\n          <h3><span>0.4</span>Awards</h3>\n        </div>         \n      </div>\n      <!-- end process -->\n\n    </div>\n  </div>\n</section>\n<!-- end services section -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('10','LP-PRICES','','2','none','9','0','<!-- start parallax section -->\n<div class=\"parallax works-parallax\">\n  <div class=\"row\">\n    <div class=\"large-12  columns\">\n      <h2 class=\"subtitle\">Our Plans<span class=\"border\"></span></h2>\n      <h3 class=\"subtitle\">Nostrud nulla qui nostrud est quis dolore cillum nisi nostrud ad ut in ex in fugiat cillum pariatur</h3>\n\n      <!-- start pricing table -->\n      <div class=\"large-3 medium-3 columns\">                 \n        <div class=\"pricing-table text-center\">\n          <h5 class=\"price-name\"><strong>Small</strong></h5>\n          <div class=\"price\">\n            <span class=\"price-amount\">$32</span> \n            <span class=\"price-time\">/ Month</span> \n          </div>\n          <ul class=\"price-options list-nostyle\">\n            <li><strong>100 GB</strong> disk space</li>\n            <li><strong>5 GB</strong> mothly traffic</li>\n            <li><strong>2</strong> subdomains</li>\n            <li><strong>2</strong> Email Accounts</li>\n          </ul>\n          <div class=\"price-button\"> <a href=\"#\">Sign Up</a> </div>\n        </div>         \n      </div>\n      <!-- end pricing table -->\n\n      <!-- start pricing table -->\n      <div class=\"large-3 medium-3 columns\">        \n        <div class=\"pricing-table pricing-big text-center\">\n          <h5 class=\"price-name\"><strong>Medium</strong></h5>\n          <div class=\"price\"> \n            <span class=\"price-amount red\">$49</span> \n            <span class=\"price-time\">/ Month</span> \n          </div>\n          <ul class=\"price-options list-nostyle\">\n            <li><strong>200 GB</strong> disk space</li>\n            <li><strong>10 GB</strong> mothly traffic</li>\n            <li><strong>20</strong> subdomains</li>\n            <li><strong>20</strong> Email Accounts</li>\n          </ul>\n          <div class=\"price-button\"> <a  href=\"#\">Sign Up</a> </div>\n        </div>\n      </div>\n      <!-- end pricing table -->\n\n      <!-- start pricing table -->\n      <div class=\"large-3 medium-3 columns\">         \n        <div class=\"pricing-table text-center\">\n          <h5 class=\"price-name\"><strong>Big</strong></h5>\n          <div class=\"price\"> \n            <span class=\"price-amount\">$90</span> \n            <span class=\"price-time\">/ Month</span> \n          </div>\n          <ul class=\"price-options list-nostyle\">\n            <li><strong>500 GB</strong> disk space</li>\n            <li><strong>10 GB</strong> mothly traffic</li>\n            <li><strong>unlimited</strong> subdomains</li>\n            <li><strong>unlimited</strong> Email Accounts</li>\n          </ul>\n          <div class=\"price-button\"> <a href=\"#\">Sign Up</a> </div>\n        </div>         \n      </div>\n      <!-- end pricing table -->\n\n      <!-- start pricing table -->\n      <div class=\"large-3 medium-3 columns\">         \n        <div class=\"pricing-table text-center\">\n          <h5 class=\"price-name\"><strong>Large</strong></h5>\n          <div class=\"price\"> \n            <span class=\"price-amount\">$120</span> \n            <span class=\"price-time\">/ Month</span> \n          </div>\n          <ul class=\"price-options list-nostyle\">\n            <li><strong>800 GB</strong> disk space</li>\n            <li><strong>20 GB</strong> mothly traffic</li>\n            <li><strong>unlimited</strong> subdomains</li>\n            <li><strong>unlimited</strong> Email Accounts</li>\n          </ul>\n          <div class=\"price-button\"> <a href=\"#\">Sign Up</a> </div>\n        </div>        \n      </div>\n      <!-- end pricing table -->\n    </div>\n  </div>\n</div>\n<!-- end parallax section -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('11','LP-WORKS','','2','none','9','0','<!-- start works section -->\n<section id=\"works\" >\n  <div class=\"row\">\n    <h1 class=\"title-section bold\"><span class=\"nbr\">04. </span>Работы <span class=\"border\"></span> </h1>\n    <h2 class=\"subtitle-section\">Phasellus enim libero, blandit vel sapien vitae.<br>\n      Aliquam in tortor enim.</h2>\n    <!--nav id=\"filters\" class=\"portfolio-filter\">\n      <ul>\n        <li class=\"active\"><a href=\"javascript:;\" data-filter-value=\"*\">ALL</a></li>\n        <li><a href=\"javascript:;\" data-filter-value=\".web\">WEB DESIGN</a></li>\n        <li><a href=\"javascript:;\" data-filter-value=\".logo\">LOGO</a></li>\n        <li><a href=\"javascript:;\" data-filter-value=\".other\">OTHER</a></li>\n      </ul>\n    </nav-->\n  </div>\n \n  <div class=\"row\">\n    <div class=\"large-12 columns\">\n\n      <!-- start portfolio-container -->\n      <div id=\"isotope\" class=\" portfolio-container\"> \n        [[Ditto? &tpl=`LP-WORKS-ITEM` &parents=`2` &orderBy=`menuindex ASC`]]\n      </div>\n      <!-- end portfolio-container -->\n\n    </div>\n  </div>\n</section>\n<!-- end works section -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('12','LP-CLIENTS','','2','none','9','0','<!-- start section grey -->\n<section class=\"grey\">\n  <div class=\"row\">\n    <div class=\"large-12 columns text-center\">\n      <h2 class=\"subtitle\">Наши клиенты<span class=\"border\"></span></h2>\n      <h3 class=\"subtitle\">Phasellus enim libero, blandit vel sapien vitae.</h3>\n      \n      <!-- start client\'s list -->\n      <div id=\"clients\" class=\"owl-carousel\">\n        [[Ditto? &tpl=`@CODE<img src=\"[+photo+]\" alt=\"[+pagetitle+]\" /> ` &parents=`16` &orderBy=`menuindex ASC`]]\n      </div>\n      <!-- end client\'s list -->\n\n    </div>\n  </div>\n</section>\n<!-- end section grey -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('13','LP-CONTACTS','','2','none','9','0','<!-- start parallax -->\n<div class=\"parallax responsive-parallax\">\n\n  <!-- start contacts section -->\n  <section id=\"contacts\" >\n    <div class=\"row\">\n      <div class=\"large-12 columns\">\n        <h1 class=\"title-section bold white\"><span class=\"nbr\">05.</span>Контакты <span class=\"border\"></span> </h1>\n        <h2 class=\"subtitle-section white\">Phasellus enim libero, blandit vel sapien vitae.<br>\n          Aliquam in tortor enim.</h2>\n      </div>\n      <div class=\"large-6 medium-6 columns text-left\">\n        <!--h4 class=\"white bold\">Get in Touch</h4>\n        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget leo at velit imperdiet varius. In eu ipsum vitae velit congue iaculis vitae.<br>\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br>\n          <br>\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit. \n        </p-->\n        <h4 class=\"white bold\">Ждем вас</h4>\n        <ul class=\"contact-detail\">\n          <li><strong><i class=\"fa fa-map-marker\"></i> Адрес: </strong>ул. Булатниковская 20, Москва</li>\n          <li><strong><i class=\"fa fa-phone\"></i> Phone: </strong>+7 (903) 102-95-92</li>\n          <li><strong><i class=\"fa fa-envelope\"></i> Email: </strong><a href=\"mailto:info@reklamagt.ru\" title=\"\">info@reklamagt.ru</a></li>\n          <li><strong>Social Networks: </strong> <a href=\"#\" title=\"facebook\"><i class=\"fa fa-facebook\"></i></a> <a href=\"#\" title=\"twitter\"><i class=\"fa fa-twitter\"></i></a> <a href=\"#\" title=\"google plus\"><i class=\"fa fa-google-plus\"></i></a> <a href=\"#\" title=\"pinterest\"><i class=\"fa fa-pinterest\"></i></a> </li>\n        </ul>\n      </div>\n      <div class=\"large-6  medium-6 columns text-left\">\n        <h4 class=\"white bold\">Обратный звонок</h4>\n        \n        <!-- start contact form -->\n        <form class=\"contactForm form\" id=\"contact\" method=\"post\">\n          <label>Имя:</label>\n          <input name=\"name\" id=\"name\" type=\"text\">\n          <label>Телефон:</label>\n          <input name=\"email\" id=\"email\" type=\"text\">\n          <!--label>Сообщение:</label>\n          <textarea  name=\"text\" id=\"text\"></textarea-->\n          <br/>\n          <input style=\"float: none;\"type=\"submit\" value=\"Перезвоните мне\" name=\"submit\" class=\"submit-button\">\n          <div id=\"form-sent\">\n            <p class=\"white\">Спасибо за Ваш интерес!</p>\n          </div>\n        </form>\n        <!-- end contact form -->\n        \n      </div>\n    </div>\n\n    <!-- google map --> \n    <a class=\"button-map close-map\"><span>На карте</span></a>\n    <div id=\"google-map\"></div>\n    <!-- end google-map -->\n\n  </section>\n  <!-- end contacts section -->\n</div>\n<!-- end parallax -->','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('14','LP-FOOTER','','2','none','9','0','<!-- start footer -->\n<footer>\n  <div class=\"row\">\n    <div class=\"large-12 columns\"> <img src=\"img/logo_small.png\" alt=\"\" />\n      <p>2016 © РА \"Графические технологии\".</p>\n    </div>\n  </div>\n</footer>\n<!-- end footer --> \n\n<script src=\"js/vendor/jquery.js\"></script> <!-- jquery js -->\n<script type=\"text/javascript\" src=\"js/jquery.mb.ytplayer.js\"></script> <!-- video background js -->\n<script src=\"js/foundation.min.js\"></script> <!-- foundation js -->\n<script type=\"text/javascript\"  src=\"js/jquery.onepagenav.js\"></script> <!-- navigation js --> \n<script src=\"js/plugins.js\" type=\"text/javascript\"></script> <!-- various plugins js -->\n<script type=\"text/javascript\" src=\"js/jquery.themepunch.plugins.min.js\"></script> <!-- slider revolutiony js --> \n<script type=\"text/javascript\" src=\"js/jquery.themepunch.revolution.min.js\"></script> <!-- slider revolution js -->\n<script type=\"text/javascript\" src=\"js/revolution-custom.js\"></script> <!-- slider revolution settings js --> \n<script type=\"text/javascript\" src=\"js/jquery.magnific-popup.min.js\"></script> <!-- lightbox on portfolio js -->\n<script src=\"https://maps.googleapis.com/maps/api/js?v=3.exp\"></script> <!-- google mapy js -->\n<script type=\"text/javascript\" src=\"js/custom.js\"></script> <!-- tangram required js -->\n\n<!-- Start Style Switcher to remove --> \n<script src=\"js/styleswitcher.js\"></script> \n<script src=\"js/jquery-cookie.js\"></script> <!-- jQuery cookie -->\n<div class=\"switcher\"></div>\n<!-- End Style Switcher -->\n\n<script>\n  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n  })(window,document,\'script\',\'//www.google-analytics.com/analytics.js\',\'ga\');\n\n  ga(\'create\', \'UA-50302093-1\', \'mordorthemes.com\');\n  ga(\'send\', \'pageview\');\n\n</script>\n</body>\n</html>','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('15','PORTFOLIO','','2','none','10','0','<!-- start section project -->\n<section id=\"portfolio\">\n  <div class=\"row\" data-scrollreveal=\"enter bottom and move 150px after 0.3s\">\n    <div class=\"large-12 columns\">\n    </div>\n    <div class=\"large-12 columns\">\n      <h1 class=\"title-section\">[*pagetitle*] <span class=\"border\"></span> </h1>\n      <h2 class=\"subtitle-section\">[*longtitle*]</h2>\n    </div>\n    <div class=\"large-8 columns\">\n\n      <!-- start project gallery -->\n      <div id=\"project-gallery\" class=\"owl-carousel\">\n        <div class=\"item\"><img src=\"img/slider/img1.jpg\" alt=\"\" /></div>\n        <div class=\"item\"><img src=\"img/slider/img2.jpg\" alt=\"\" /></div>\n        <div class=\"item\"><img src=\"img/slider/img3.jpg\" alt=\"\" /></div>\n      </div>\n      <!--end project gallery -->\n\n    </div>\n    <div class=\"large-4 columns\">\n      <p>[*introtext*]</p>\n      <!-- start project detail list -->\n      <ul class=\"project-detail\">\n        <li><strong>Client: </strong>[*description*]</li>\n        <li><strong>Tags: </strong>Themeforest, Codecanyon, Design</li>\n        <li><strong>Website: </strong><a title=\"\" href=\"http://www.mordorthemes.com\" target=\"_blank\">mordorthemes.com</a></li>\n        <li><strong>Share on: </strong> <a title=\"facebook\" href=\"#\"><i class=\"fa fa-facebook\"></i></a> <a title=\"twitter\" href=\"#\"><i class=\"fa fa-twitter\"></i></a> <a title=\"google plus\" href=\"#\"><i class=\"fa fa-google-plus\"></i></a> <a title=\"pinterest\" href=\"#\"><i class=\"fa fa-pinterest\"></i></a> </li>\n      </ul>\n      <!-- end project detail list -->\n    </div>\n  </div>\n</section>\n<!-- end section project -->\n\n<div id=\"google-map\"></div>\n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('16','PORTFOLIO-MORE','','2','none','10','0','<!-- start section grey -->\n<section class=\"grey\">\n  <div class=\"row\">\n      <div class=\"large-12 columns text-center\">\n          <h2 class=\"subtitle\">Другие работы<span class=\"border\"></span></h2>\n          <h3 class=\"subtitle\">Phasellus enim libero, blandit vel sapien vitae.</h3>\n        </div>\n      <div class=\"large-12 columns\">\n\n          <!-- start portfolio carousel -->\n            <div id=\"portfolio-carousel\" class=\"owl-carousel\">\n                \n				[[Ditto? &tpl=`LP-WORKS-ITEM` &parents=`2` &orderBy=`menuindex ASC`]]\n                \n            </div>\n            <!-- end portfolio carousel -->\n\n        </div>\n   </div>\n</section>\n<!-- end section grey -->\n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('22','LP-SLIDER-ITEM','','2','none','9','0','<!-- SLIDE  -->\n      <li data-transition=\"fade\" data-slotamount=\"1\" data-masterspeed=\"300\" >\n        <div class=\"overlay\"></div>\n        <!-- MAIN IMAGE --> \n        <img src=\"[+photo+]\" alt=\"[+pagetitle+]\"  data-bgfit=\"cover\" data-bgposition=\"center center\" data-bgrepeat=\"no-repeat\"> \n        <!-- LAYERS --> \n		  \n        <!-- LAYER NR. 1 -->\n        <div class=\"tp-caption large_bold_white_25 text-center start tp-resizeme\"\n                data-x=\"center\"\n                data-hoffset=\"0\"\n                data-y=\"90\"\n                data-speed=\"1000\"\n                data-start=\"1000\"\n                data-easing=\"Back.easeInOut\"\n                data-endspeed=\"300\">\n          <h1 class=\"text-slide\">[+longtitle+] <span class=\"red bold\">[+description+]</span></h1>\n        </div>\n		  \n        [+content+]\n      </li>','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('18','LP-TEAM-ITEM','','2','none','9','0','<!-- start team box -->\n<div class=\"large-3 medium-3 columns team\" data-scrollreveal=\"enter bottom and move 150px after 0.3s\">\n    <div class=\"team-item\">\n        <div class=\"team-hover\">\n            <a title=\"\" href=\"#\"><i class=\"fa fa-envelope fa-3x\"></i> [+description+]</a>\n        </div>\n        <img src=\"[+photo+]\" alt=\"[+pagetitle+]\" />\n    </div>\n    <h3><strong>[+pagetitle+]</strong><span>[+longtitle+]</span></h3>\n    <!--ul class=\"social-team\">\n        <li><a title=\"\" href=\"#\"><i class=\"fa fa-linkedin fa-lg\"></i></a></li>\n        <li><a title=\"\" href=\"#\"><i class=\"fa fa-skype fa-lg\"></i></a></li>\n        <li><a title=\"\" href=\"#\"><i class=\"fa fa-twitter fa-lg\"></i></a></li>\n        <li><a title=\"\" href=\"#\"><i class=\"fa fa-facebook fa-lg\"></i></a></li>\n        <li><a title=\"\" href=\"#\"><i class=\"fa fa-google-plus fa-lg\"></i></a></li>\n    </ul-->\n</div>\n<!-- end team box --> \n','0');
INSERT INTO `gt_site_htmlsnippets` VALUES ('23','LP-SERVICES-ITEM','','2','none','9','0','<!-- start service box -->\n<div class=\"large-4 medium-4 columns\" data-scrollreveal=\"enter top and move 150px after 0.3s\">            \n	<div class=\"icon-service\"> \n		<i class=\"fa [+longtitle+]\"></i> \n	</div>\n	<div class=\"info-service\">\n		<h3 class=\"bold\">[+pagetitle+]</h3>\n		<p>[+introtext+]</p>\n	</div>      \n</div>\n<!-- end service box -->\n','0');

# --------------------------------------------------------

#
# Table structure for table `gt_site_keywords`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_keywords`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list';

#
# Dumping data for table `gt_site_keywords`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_metatags`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_metatags`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags';

#
# Dumping data for table `gt_site_metatags`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_module_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_module_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission';

#
# Dumping data for table `gt_site_module_access`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_module_depobj`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_module_depobj`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies';

#
# Dumping data for table `gt_site_module_depobj`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_modules`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_modules`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Site Modules';

#
# Dumping data for table `gt_site_modules`
#

INSERT INTO `gt_site_modules` VALUES ('1','Doc Manager','<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions','0','0','2','0','0','','0','','0','0','docman435243542tf542t5t','1','','include_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/docmanager.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_frontend.class.php\');\ninclude_once(MODX_BASE_PATH.\'assets/modules/docmanager/classes/dm_backend.class.php\');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[\'theme\'] = $dm->getTheme();\n$dm->ph[\'ajax.endpoint\'] = MODX_SITE_URL.\'assets/modules/docmanager/tv.ajax.php\';\n$dm->ph[\'datepicker.offset\'] = $modx->config[\'datepicker_offset\'];\n$dm->ph[\'datetime.format\'] = $modx->config[\'datetime_format\'];\n\nif (isset($_POST[\'tabAction\'])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(\'main.tpl\', $dm->ph);\n}');
INSERT INTO `gt_site_modules` VALUES ('2','Extras','<strong>0.1.2</strong> first repository for MODX EVO','0','0','2','0','0','','0','','0','0','store435243542tf542t5t','1','','//AUTHORS: Bumkaka & Dmi3yy \ninclude_once(\'../assets/modules/store/core.php\');');

# --------------------------------------------------------

#
# Table structure for table `gt_site_plugin_events`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_plugin_events`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

#
# Dumping data for table `gt_site_plugin_events`
#

INSERT INTO `gt_site_plugin_events` VALUES ('1','23','0');
INSERT INTO `gt_site_plugin_events` VALUES ('1','29','0');
INSERT INTO `gt_site_plugin_events` VALUES ('1','35','0');
INSERT INTO `gt_site_plugin_events` VALUES ('1','41','0');
INSERT INTO `gt_site_plugin_events` VALUES ('1','47','0');
INSERT INTO `gt_site_plugin_events` VALUES ('1','73','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','34','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','35','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','36','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','40','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','41','0');
INSERT INTO `gt_site_plugin_events` VALUES ('2','42','0');
INSERT INTO `gt_site_plugin_events` VALUES ('3','80','0');
INSERT INTO `gt_site_plugin_events` VALUES ('3','81','0');
INSERT INTO `gt_site_plugin_events` VALUES ('3','93','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','28','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','29','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','30','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','31','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','35','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','53','0');
INSERT INTO `gt_site_plugin_events` VALUES ('4','205','0');
INSERT INTO `gt_site_plugin_events` VALUES ('5','3','0');
INSERT INTO `gt_site_plugin_events` VALUES ('5','13','0');
INSERT INTO `gt_site_plugin_events` VALUES ('5','28','0');
INSERT INTO `gt_site_plugin_events` VALUES ('5','31','0');
INSERT INTO `gt_site_plugin_events` VALUES ('5','92','0');
INSERT INTO `gt_site_plugin_events` VALUES ('6','3','0');
INSERT INTO `gt_site_plugin_events` VALUES ('7','85','0');
INSERT INTO `gt_site_plugin_events` VALUES ('7','87','0');
INSERT INTO `gt_site_plugin_events` VALUES ('7','88','0');
INSERT INTO `gt_site_plugin_events` VALUES ('8','100','0');

# --------------------------------------------------------

#
# Table structure for table `gt_site_plugins`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_plugins`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.';

#
# Dumping data for table `gt_site_plugins`
#

INSERT INTO `gt_site_plugins` VALUES ('1','CodeMirror','<strong>1.3</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.6','0','2','0','$_CM_BASE = \'assets/plugins/codemirror/\';\n\n$_CM_URL = $modx->config[\'site_url\'] . $_CM_BASE;\n\nrequire(MODX_BASE_PATH. $_CM_BASE .\'codemirror.plugin.php\');\n\n','0','&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true','0','');
INSERT INTO `gt_site_plugins` VALUES ('2','FileSource','<strong>0.1</strong> Save snippet and plugins to file','0','2','0','require MODX_BASE_PATH.\'assets/plugins/filesource/plugin.filesource.php\';','0','','0','');
INSERT INTO `gt_site_plugins` VALUES ('3','Forgot Manager Login','<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation','0','2','0','require MODX_BASE_PATH.\'assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php\';','0','','0','');
INSERT INTO `gt_site_plugins` VALUES ('4','ManagerManager','<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users.','0','2','0','// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php \n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end.\n\n// See also user-friendly module for editing ManagerManager configuration file ddMMEditor (http://code.divandesign.biz/modx/ddmmeditor).\n\n// ManagerManager requires jQuery 1.9.1, which is located in /assets/plugins/managermanager/js/ folder.\n\n// You don\'t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\ninclude($modx->config[\'base_path\'].\'assets/plugins/managermanager/mm.inc.php\');','0','&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules','0','');
INSERT INTO `gt_site_plugins` VALUES ('5','Quick Manager+','<strong>1.5.6</strong> Enables QuickManager+ front end content editing support','0','2','0','// In manager\nif (isset($_SESSION[\'mgrValidated\'])) {\n\n    $show = TRUE;\n\n    if ($disabled  != \'\') {\n        $arr = array_filter(array_map(\'intval\', explode(\',\', $disabled)));\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == \'true\') {\n            $e = $modx->Event;\n            if ($e->name == \'OnParseDocument\') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(\'~\\[\\*#(.*?)\\*\\]~\', \'<!-- \'.$tvbclass.\' $1 -->[*$1*]\', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[\'mgrValidated\'])) {\n            include_once($modx->config[\'base_path\'].\'assets/plugins/qm/qm.inc.php\');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}','0','&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv','1','');
INSERT INTO `gt_site_plugins` VALUES ('6','Search Highlight','<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results','0','3','0','/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://forums.modx.com/thread/47775/plugin-highlight-search-terms\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  \'utf8\' => \'UTF-8\',\n  \'latin1\' => \'ISO-8859-1\',\n  \'latin2\' => \'ISO-8859-2\'\n);\n\nif (isset($_REQUEST[\'searched\']) && isset($_REQUEST[\'highlight\'])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = \'<div class=\"searchTerms\">Search Terms: \';\n     $removeText = \'Remove Highlighting\';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = \'oneword\';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[\'searched\']));\n    $highlight = strip_tags(stripslashes($_REQUEST[\'highlight\']));\n    if (isset($_REQUEST[\'advsearch\'])) $advsearch = strip_tags(stripslashes($_REQUEST[\'advsearch\']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[\'searched\']);\n    $highlight = strip_tags($_REQUEST[\'highlight\']);\n    if (isset($_REQUEST[\'advsearch\'])) $advsearch = strip_tags($_REQUEST[\'advsearch\']);\n  }\n\n  if ($advsearch != \'nowords\') {\n\n    $searchArray = array();\n    if ($advsearch == \'exactphrase\') $searchArray[0] = $searched;\n    else $searchArray = explode(\' \', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(\'term\' => $word, \'class\' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode(\"<body\", $output); // break out the head\n\n    $highlightClass = explode(\' \',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(\'/[^A-Za-z0-9_-]/ms\', $value) == 1 ? \'\' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == \'UTF-8\') ? \'iu\' : \'i\';\n    $lookBehind = \'/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)\';  // avoid a match with a html entity\n    $lookAhead = \'(?=[^>]*<)/\'; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][\'term\'];\n      $class = $highlightClass[0].\' \'.$highlightClass[$searchTerms[$i][\'class\']];\n\n      $highlightText .= ($i > 0) ? \', \' : \'\';\n      $highlightText .= \'<span class=\"\'.$class.\'\">\'.$word.\'</span>\';\n\n      $pattern = $lookBehind . preg_quote($word, \'/\') . $lookAhead . $pcreModifier;\n      $replacement = \'<span class=\"\' . $class . \'\">${0}</span>\';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode(\"<body\", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= \'<br /><a href=\"\'.$removeUrl.\'\" class=\"ajaxSearch_removeHighlight\">\'.$removeText.\'</a></div>\';\n\n    $output = str_replace(\'<!--search_terms-->\',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}','0','','1','');
INSERT INTO `gt_site_plugins` VALUES ('7','TinyMCE Rich Text Editor','<strong>3.5.11</strong> Javascript WYSIWYG Editor','0','2','0','require MODX_BASE_PATH.\'assets/plugins/tinymce/plugin.tinymce.php\';\n','0','&customparams=Custom Parameters;textarea;valid_elements : \"*[*]\", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;100% &height=Height;text;500','0','');
INSERT INTO `gt_site_plugins` VALUES ('8','TransAlias','<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides','0','2','0','require MODX_BASE_PATH.\'assets/plugins/transalias/plugin.transalias.php\';','0','&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;','0',' ');

# --------------------------------------------------------

#
# Table structure for table `gt_site_snippets`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_snippets`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.';

#
# Dumping data for table `gt_site_snippets`
#

INSERT INTO `gt_site_snippets` VALUES ('1','AjaxSearch','<strong>1.10.1</strong> Ajax and non-Ajax search that supports results highlighting','0','3','0','return require MODX_BASE_PATH.\'assets/snippets/ajaxSearch/snippet.ajaxSearch.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('2','Breadcrumbs','<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/breadcrumbs/snippet.breadcrumbs.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('3','Ditto','<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/ditto/snippet.ditto.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('4','DocLister','<strong>2.1.30</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/DocLister/snippet.DocLister.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('5','eForm','<strong>1.4.6</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads','0','6','0','return require MODX_BASE_PATH.\'assets/snippets/eform/snippet.eform.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('6','FirstChildRedirect','<strong>2.0</strong> Automatically redirects to the first child of a Container Resource','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/firstchildredirect/snippet.firstchildredirect.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('7','if','<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/if/snippet.if.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('8','Jot','<strong>1.1.4</strong> User comments with moderation and email subscription','0','5','0','/*####\n#\n# Author: Armand \"bS\" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modx.com/extras/package/jot\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[\'base_path\'] . \'assets/snippets/jot/\';\ninclude_once($jotPath.\'jot.class.inc.php\');\n\n$Jot = new CJot;\n$Jot->VersionCheck(\"1.1.4\");\n$Jot->Set(\"path\",$jotPath);\n$Jot->Set(\"action\", $action);\n$Jot->Set(\"postdelay\", $postdelay);\n$Jot->Set(\"docid\", $docid);\n$Jot->Set(\"tagid\", $tagid);\n$Jot->Set(\"subscribe\", $subscribe);\n$Jot->Set(\"moderated\", $moderated);\n$Jot->Set(\"captcha\", $captcha);\n$Jot->Set(\"badwords\", $badwords);\n$Jot->Set(\"bw\", $bw);\n$Jot->Set(\"sortby\", $sortby);\n$Jot->Set(\"numdir\", $numdir);\n$Jot->Set(\"customfields\", $customfields);\n$Jot->Set(\"guestname\", $guestname);\n$Jot->Set(\"canpost\", $canpost);\n$Jot->Set(\"canview\", $canview);\n$Jot->Set(\"canedit\", $canedit);\n$Jot->Set(\"canmoderate\", $canmoderate);\n$Jot->Set(\"trusted\", $trusted);\n$Jot->Set(\"pagination\", $pagination);\n$Jot->Set(\"placeholders\", $placeholders);\n$Jot->Set(\"subjectSubscribe\", $subjectSubscribe);\n$Jot->Set(\"subjectModerate\", $subjectModerate);\n$Jot->Set(\"subjectAuthor\", $subjectAuthor);\n$Jot->Set(\"notify\", $notify);\n$Jot->Set(\"notifyAuthor\", $notifyAuthor);\n$Jot->Set(\"validate\", $validate);\n$Jot->Set(\"title\", $title);\n$Jot->Set(\"authorid\", $authorid);\n$Jot->Set(\"css\", $css);\n$Jot->Set(\"cssFile\", $cssFile);\n$Jot->Set(\"cssRowAlt\", $cssRowAlt);\n$Jot->Set(\"cssRowMe\", $cssRowMe);\n$Jot->Set(\"cssRowAuthor\", $cssRowAuthor);\n$Jot->Set(\"tplForm\", $tplForm);\n$Jot->Set(\"tplComments\", $tplComments);\n$Jot->Set(\"tplModerate\", $tplModerate);\n$Jot->Set(\"tplNav\", $tplNav);\n$Jot->Set(\"tplNotify\", $tplNotify);\n$Jot->Set(\"tplNotifyModerator\", $tplNotifyModerator);\n$Jot->Set(\"tplNotifyAuthor\", $tplNotifyAuthor);\n$Jot->Set(\"tplSubscribe\", $tplSubscribe);\n$Jot->Set(\"debug\", $debug);\n$Jot->Set(\"output\", $output);\nreturn $Jot->Run();','0','','');
INSERT INTO `gt_site_snippets` VALUES ('9','ListIndexer','<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/listindexer/snippet.listindexer.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('10','MemberCheck','<strong>1.1</strong> Show chunks based on a logged in Web User\'s group membership','0','7','0','return require MODX_BASE_PATH.\'assets/snippets/membercheck/snippet.membercheck.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('11','Personalize','<strong>2.1</strong> Personalize snippet','0','7','0','return require MODX_BASE_PATH.\'assets/snippets/personalize/snippet.personalize.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('12','phpthumb','<strong>1.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them','0','5','0','return require MODX_BASE_PATH.\'assets/snippets/phpthumb/snippet.phpthumb.php\';\n','0','','');
INSERT INTO `gt_site_snippets` VALUES ('13','Reflect','<strong>2.1.1</strong> Generates date-based archives using Ditto','0','5','0','/*\n * Author: \n *      Mark Kaplan for MODX CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page\'s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[\'base_path\'].$reflect_base : $modx->config[\'base_path\'].\"assets/snippets/reflect/\";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : \"default\";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    \"default\" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODX base path via @FILE\n\n    Default:\n    \"default\"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base.\"configs/default.config.php\");\nrequire($reflect_base.\"default.templates.php\");\nif ($config != \"default\") {\n    require((substr($config, 0, 5) != \"@FILE\") ? $reflect_base.\"configs/$config.config.php\" : $modx->config[\'base_path\'].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id.\"_\" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    \"\" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[\'id\'];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODX document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODX Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : \"createdon\";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODX fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    \"createdon\"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : \"%d-%b-%y %H:%M\";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    \"%d-%b-%y %H:%M\"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : \"DESC\";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    \"DESC\"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : \"ASC\";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    \"ASC\"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$emptymsg = isset($emptymsg)? $emptymsg : \"The Ditto object is invalid. Please check it.\";\n/*\n    Param: emptymsg\n\n    Purpose:\n    Message to return if error\n\n    Options:\n    Any string\n    \n    Default:\n    The Ditto object is invalid. Please check it.\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = \"reflect_\".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: \"@CODE:\".$defaultTemplates[\'item\'];\n    $dParams = array(\n        \"id\" => \"$rID\",\n        \"save\" => \"3\",  \n        \"summarize\" => \"all\",\n        \"tpl\" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode(\"|\",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(\":\",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(\'reflect_base\',\'config\',\'id\',\'getDocuments\',\'showItems\',\'groupByYears\',\'targetID\',\'yearSortDir\',\'monthSortDir\',\'start\',\'phx\',\'tplContainer\',\'tplYear\',\'tplMonth\',\'tplMonthInner\',\'tplItem\',\'save\');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != \'tpl\') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : \"Ditto\";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        \"Ditto\"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID.\"_ditto_object\");\n    $resource = $modx->getPlaceholder($rID.\"_ditto_resource\");\n} else {\n    $ditto = $modx->getPlaceholder($id.\"ditto_object\");\n    $resource = $modx->getPlaceholder($id.\"ditto_resource\");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : $emptymsg;\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[\'tpl\'] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[\'tpl\'];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[\'year\'] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[\'year\'];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[\'year_inner\'] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[\'year_inner\'];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[\'month\'] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[\'month\'];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[\'month_inner\'] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[\'month_inner\'];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[\'item\'] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[\'item\'];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField(\"date\",\"display\",\"custom\");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists(\"reflect\") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = \'\';\n    $ph = array(\'year\'=>\'\',\'month\'=>\'\',\'item\'=>\'\',\'out\'=>\'\');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date[\"year\"];\n        $month = $date[\"mon\"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == \"DESC\") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == \"ASC\") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = \'\';\n        $r_month = \'\';\n        $r_month_2 = \'\';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime(\"%B\", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL(\"month=\".$mon.\"&year=\".$year.\"&day=false&start=0\",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array(\"year\"=>$year,\"month\"=>$month_text,\"url\"=>$month_url,\"count\"=>$month_count),$templates[\'month\']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][\'items\'][] = $ditto->render($item, $templates[\'item\'], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(\'wrapper\' => implode(\'\',$items[$year][$mon][\'items\'])),$templates[\'month_inner\']);\n                $items[$year][$mon] = $ditto->template->replace(array(\'wrapper\' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL(\"year=\".$year.\"&month=false&day=false&start=0\",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array(\"year\"=>$year,\"url\"=>$year_url,\"count\"=>$year_count),$templates[\'year\']);\n            $var = $ditto->template->replace(array(\'wrapper\'=>implode(\'\',$items[$year])),$templates[\'year_inner\']);\n            $output .= $ditto->template->replace(array(\'wrapper\'=>$var),$r_year);\n        } else {\n            $output .= implode(\'\',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(\'wrapper\'=>$output),$templates[\'tpl\']);\n    $modx->setPlaceholder($id.\'reset\',$ditto->buildURL(\'year=false&month=false&day=false\',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);\n','0','','');
INSERT INTO `gt_site_snippets` VALUES ('14','UltimateParent','<strong>2.0</strong> Travels up the document tree from a specified document and returns its \"ultimate\" non-root parent','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/ultimateparent/snippet.ultimateparent.php\';','0','','');
INSERT INTO `gt_site_snippets` VALUES ('15','Wayfinder','<strong>2.0.4</strong> Completely template-driven and highly flexible menu builder','0','4','0','return require MODX_BASE_PATH.\'assets/snippets/wayfinder/snippet.wayfinder.php\';\n','0','','');
INSERT INTO `gt_site_snippets` VALUES ('16','WebChangePwd','<strong>1.0.1</strong> Allows Web User to change their password from the front-end of the website','0','7','0','# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->isBackend())? \"../\":\"\");\n$snipPath .= \"assets/snippets/\";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return \'\'; # don\'t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:\"\";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[\'cmdwebchngpwd\']);\n\n# Start processing\ninclude_once $snipPath.\"weblogin/weblogin.common.inc.php\";\ninclude_once $snipPath.\"weblogin/webchangepwd.inc.php\";\n\n# Return\nreturn $output;\n\n\n\n','0','','');
INSERT INTO `gt_site_snippets` VALUES ('17','WebLogin','<strong>1.1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups','0','7','0','# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[\'base_path\'] . \"assets/snippets/\";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n	return \'\'; # don\'t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? array_filter(array_map(\'intval\', explode(\',\', $loginhomeid))):array($modx->config[\'login_home\'],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:\'Login\';\n$logoutText	= isset($logouttext)? $logouttext:\'Logout\';\n$tpl		= isset($tpl)? $tpl:\"\";\n\n# System settings\n$webLoginMode = isset($_REQUEST[\'webloginmode\'])? $_REQUEST[\'webloginmode\']: \'\';\n$isLogOut		= $webLoginMode==\'lo\' ? 1:0;\n$isPWDActivate	= $webLoginMode==\'actp\' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[\'cmdweblogin\']) || isset($_POST[\'cmdweblogin_x\']));\n$txtPwdRem 		= isset($_REQUEST[\'txtpwdrem\'])? $_REQUEST[\'txtpwdrem\']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==\'1\' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: \'\';\n$cookieKey = substr(md5($site_id.\"Web-User\"),0,15);\n\n# Start processing\ninclude_once $snipPath.\"weblogin/weblogin.common.inc.php\";\ninclude_once ($modx->config[\'site_manager_path\'] . \"includes/crypt.class.inc.php\");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[\'site_manager_path\'] . \"includes/log.class.inc.php\";\n	include_once $snipPath.\"weblogin/weblogin.processor.inc.php\";\n}\n\ninclude_once $snipPath.\"weblogin/weblogin.inc.php\";\n\n# Return\nreturn $output;\n','0','&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;','');
INSERT INTO `gt_site_snippets` VALUES ('18','WebSignup','<strong>1.1.1</strong> Basic Web User account creation/signup system','0','7','0','# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#	    		   If custom template AND captcha on AND using WebSignup and \n#                  WebLogin on the same page make sure you have a field named\n#                  cmdwebsignup. In the default template it is the submit button \n#                  One can use a hidden field.\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[\'base_path\'] . \"assets/snippets/\";\n\n# check if inside manager\nif ($m = $modx->isBackend()) {\n    return \'\'; # don\'t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:\"\";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[\'use_captcha\'] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? array_filter(array_map(\'trim\', explode(\',\', $groups))):array();\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[\'cmdwebsignup\']);\n\n$output = \'\';\n\n# Start processing\ninclude_once $snipPath.\"weblogin/weblogin.common.inc.php\";\ninclude_once $snipPath.\"weblogin/websignup.inc.php\";\n\n# Return\nreturn $output;','0','&tpl=Template;string;','');
INSERT INTO `gt_site_snippets` VALUES ('19','year','','0','0','0','\nreturn date(\"Y\");\n','0','',' ');
INSERT INTO `gt_site_snippets` VALUES ('20','multiPhotos','','0','0','0','\n/* \n * name - multiPhotos\n * author - Baydin Artem\n * version 1.1\n *\n */\n// Settings\nif ($modx->getChunk($tpl) != \"\")  $tpl  = $modx->getChunk($tpl);\nelse if(substr($tpl, 0, 6) == \"@CODE:\") $tpl = substr($tpl, 6);\nelse $tpl = \'<img src=\"[+src+]\" alt=\"\"/>\';\n\n$include = isset($include) ? explode(\"||\",$include) : false;\n$exclude = isset($exclude) ? explode(\"||\",$exclude) : array();\n// End of settings\nif(empty($src)) $src=\'[]\';\n\n/* Phx Fix*/\n$phxSafeTags = array(\'&_PHX_INTERNAL_091_&\'=>\'[\',\'&_PHX_INTERNAL_093_&\'=>\']\');\n$src = str_replace(array_keys($phxSafeTags ),array_values($phxSafeTags),$src);\n\n$srcArr = json_decode($src);\nif(is_array($srcArr) && count($srcArr)>0){\n  $output=\'\';\n  foreach($srcArr as $i=>$val){\n    if(!in_array($i+1,$exclude) && (!is_array($include) || in_array($i+1,$include))){\n      $val = empty($val)? \'images/ico/nophoto.png\' : $val;\n      $output.= str_replace(\"[+src+]\",$val,$tpl);\n    }\n  }\n}\nelse $output = str_replace(\"[+src+]\",\"images/ico/nophoto.png\",$tpl);\n\nreturn $output;\n','0','',' ');

# --------------------------------------------------------

#
# Table structure for table `gt_site_templates`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_templates`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `selectable` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.';

#
# Dumping data for table `gt_site_templates`
#

INSERT INTO `gt_site_templates` VALUES ('3','Лендинг','','0','9','','0','{{HEADER}}\n{{LP-SLIDER}}\n{{LP-ABOUT}}\n{{LP-ABOUT-FACTS}}\n{{LP-TEAM}}\n{{LP-VIDEO}}\n{{LP-SERVICES}}\n{{LP-PRICES}}\n{{LP-WORKS}}\n{{LP-CLIENTS}}\n{{LP-CONTACTS}}\n{{FOOTER}}','0','1');
INSERT INTO `gt_site_templates` VALUES ('4','Элемент портфолио','','0','10','','0','{{HEADER}}\n{{PORTFOLIO}}\n{{PORTFOLIO-MORE}}\n{{FOOTER}}','0','1');
INSERT INTO `gt_site_templates` VALUES ('5','Сотрудник','','0','9','','0','','0','1');
INSERT INTO `gt_site_templates` VALUES ('6','Клиент','','0','9','','0','','0','1');
INSERT INTO `gt_site_templates` VALUES ('7','Слайдер','','0','9','','0','','0','1');
INSERT INTO `gt_site_templates` VALUES ('8','Услуга','','0','0','','0','','0','1');

# --------------------------------------------------------

#
# Table structure for table `gt_site_tmplvar_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_tmplvar_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.';

#
# Dumping data for table `gt_site_tmplvar_access`
#


# --------------------------------------------------------

#
# Table structure for table `gt_site_tmplvar_contentvalues`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_tmplvar_contentvalues`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table';

#
# Dumping data for table `gt_site_tmplvar_contentvalues`
#

INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('1','3','3','[\"assets/images/works/work1_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('2','4','5','assets/images/team/ali.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('3','4','6','assets/images/team/july.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('4','4','7','assets/images/team/july2.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('5','4','8','assets/images/team/vladimir.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('6','1','3','Logo');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('7','2','3','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('8','3','9','[\"assets/images/works/work2_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('9','1','9','Web');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('10','2','9','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('11','3','10','[\"assets/images/works/work3_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('12','1','10','Logo');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('13','2','10','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('14','3','11','[\"assets/images/works/work4_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('15','1','11','Other');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('16','2','11','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('17','3','12','[\"assets/images/works/work5_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('18','1','12','Web, Logo');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('19','2','12','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('20','3','13','[\"assets/images/works/work6_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('21','1','13','Web, Other');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('22','2','13','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('23','3','14','[\"assets/images/works/work7_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('24','1','14','Other, Logo');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('25','2','14','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('26','3','15','[\"assets/images/works/work8_big.jpg\"]');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('27','1','15','Other, Web');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('28','2','15','Themeforest, Codecanyon, Design');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('29','4','17','assets/images/clients/3docean.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('30','4','18','assets/images/clients/activeden.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('31','4','19','assets/images/clients/audiojungle.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('32','4','20','assets/images/clients/codecanyon.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('33','4','21','assets/images/clients/photodune.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('34','4','22','assets/images/clients/themeforest.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('35','4','23','assets/images/clients/videohive.png');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('36','4','25','assets/images/slider/forest.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('37','4','26','assets/images/slider/img2.jpg');
INSERT INTO `gt_site_tmplvar_contentvalues` VALUES ('38','4','27','assets/images/slider/img3.jpg');

# --------------------------------------------------------

#
# Table structure for table `gt_site_tmplvar_templates`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_tmplvar_templates`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

#
# Dumping data for table `gt_site_tmplvar_templates`
#

INSERT INTO `gt_site_tmplvar_templates` VALUES ('1','4','0');
INSERT INTO `gt_site_tmplvar_templates` VALUES ('2','4','0');
INSERT INTO `gt_site_tmplvar_templates` VALUES ('4','5','0');
INSERT INTO `gt_site_tmplvar_templates` VALUES ('3','4','0');
INSERT INTO `gt_site_tmplvar_templates` VALUES ('4','6','0');
INSERT INTO `gt_site_tmplvar_templates` VALUES ('4','7','0');

# --------------------------------------------------------

#
# Table structure for table `gt_site_tmplvars`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_site_tmplvars`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Site Template Variables';

#
# Dumping data for table `gt_site_tmplvars`
#

INSERT INTO `gt_site_tmplvars` VALUES ('1','text','worktype','Тип услуги','','0','10','0','','0','','','');
INSERT INTO `gt_site_tmplvars` VALUES ('2','text','tags','Тэги','','0','10','0','','0','','','');
INSERT INTO `gt_site_tmplvars` VALUES ('3','custom_tv','img','Изображение','','0','10','0','@INCLUDE: assets/widgets/multiphotos/multiphotos.inc.php','0','','','');
INSERT INTO `gt_site_tmplvars` VALUES ('4','image','photo','Фото','','0','9','0','','0','','','');

# --------------------------------------------------------

#
# Table structure for table `gt_system_eventnames`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_system_eventnames`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8 COMMENT='System Event Names.';

#
# Dumping data for table `gt_system_eventnames`
#

INSERT INTO `gt_system_eventnames` VALUES ('1','OnDocPublished','5','');
INSERT INTO `gt_system_eventnames` VALUES ('2','OnDocUnPublished','5','');
INSERT INTO `gt_system_eventnames` VALUES ('3','OnWebPagePrerender','5','');
INSERT INTO `gt_system_eventnames` VALUES ('4','OnWebLogin','3','');
INSERT INTO `gt_system_eventnames` VALUES ('5','OnBeforeWebLogout','3','');
INSERT INTO `gt_system_eventnames` VALUES ('6','OnWebLogout','3','');
INSERT INTO `gt_system_eventnames` VALUES ('7','OnWebSaveUser','3','');
INSERT INTO `gt_system_eventnames` VALUES ('8','OnWebDeleteUser','3','');
INSERT INTO `gt_system_eventnames` VALUES ('9','OnWebChangePassword','3','');
INSERT INTO `gt_system_eventnames` VALUES ('10','OnWebCreateGroup','3','');
INSERT INTO `gt_system_eventnames` VALUES ('11','OnManagerLogin','2','');
INSERT INTO `gt_system_eventnames` VALUES ('12','OnBeforeManagerLogout','2','');
INSERT INTO `gt_system_eventnames` VALUES ('13','OnManagerLogout','2','');
INSERT INTO `gt_system_eventnames` VALUES ('14','OnManagerSaveUser','2','');
INSERT INTO `gt_system_eventnames` VALUES ('15','OnManagerDeleteUser','2','');
INSERT INTO `gt_system_eventnames` VALUES ('16','OnManagerChangePassword','2','');
INSERT INTO `gt_system_eventnames` VALUES ('17','OnManagerCreateGroup','2','');
INSERT INTO `gt_system_eventnames` VALUES ('18','OnBeforeCacheUpdate','4','');
INSERT INTO `gt_system_eventnames` VALUES ('19','OnCacheUpdate','4','');
INSERT INTO `gt_system_eventnames` VALUES ('107','OnMakePageCacheKey','4','');
INSERT INTO `gt_system_eventnames` VALUES ('20','OnLoadWebPageCache','4','');
INSERT INTO `gt_system_eventnames` VALUES ('21','OnBeforeSaveWebPageCache','4','');
INSERT INTO `gt_system_eventnames` VALUES ('22','OnChunkFormPrerender','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('23','OnChunkFormRender','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('24','OnBeforeChunkFormSave','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('25','OnChunkFormSave','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('26','OnBeforeChunkFormDelete','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('27','OnChunkFormDelete','1','Chunks');
INSERT INTO `gt_system_eventnames` VALUES ('28','OnDocFormPrerender','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('29','OnDocFormRender','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('30','OnBeforeDocFormSave','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('31','OnDocFormSave','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('32','OnBeforeDocFormDelete','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('33','OnDocFormDelete','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('1033','OnDocFormUnDelete','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('1034','onBeforeMoveDocument','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('1035','onAfterMoveDocument','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('34','OnPluginFormPrerender','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('35','OnPluginFormRender','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('36','OnBeforePluginFormSave','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('37','OnPluginFormSave','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('38','OnBeforePluginFormDelete','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('39','OnPluginFormDelete','1','Plugins');
INSERT INTO `gt_system_eventnames` VALUES ('40','OnSnipFormPrerender','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('41','OnSnipFormRender','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('42','OnBeforeSnipFormSave','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('43','OnSnipFormSave','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('44','OnBeforeSnipFormDelete','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('45','OnSnipFormDelete','1','Snippets');
INSERT INTO `gt_system_eventnames` VALUES ('46','OnTempFormPrerender','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('47','OnTempFormRender','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('48','OnBeforeTempFormSave','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('49','OnTempFormSave','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('50','OnBeforeTempFormDelete','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('51','OnTempFormDelete','1','Templates');
INSERT INTO `gt_system_eventnames` VALUES ('52','OnTVFormPrerender','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('53','OnTVFormRender','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('54','OnBeforeTVFormSave','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('55','OnTVFormSave','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('56','OnBeforeTVFormDelete','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('57','OnTVFormDelete','1','Template Variables');
INSERT INTO `gt_system_eventnames` VALUES ('58','OnUserFormPrerender','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('59','OnUserFormRender','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('60','OnBeforeUserFormSave','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('61','OnUserFormSave','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('62','OnBeforeUserFormDelete','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('63','OnUserFormDelete','1','Users');
INSERT INTO `gt_system_eventnames` VALUES ('64','OnWUsrFormPrerender','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('65','OnWUsrFormRender','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('66','OnBeforeWUsrFormSave','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('67','OnWUsrFormSave','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('68','OnBeforeWUsrFormDelete','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('69','OnWUsrFormDelete','1','Web Users');
INSERT INTO `gt_system_eventnames` VALUES ('70','OnSiteRefresh','1','');
INSERT INTO `gt_system_eventnames` VALUES ('71','OnFileManagerUpload','1','');
INSERT INTO `gt_system_eventnames` VALUES ('72','OnModFormPrerender','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('73','OnModFormRender','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('74','OnBeforeModFormDelete','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('75','OnModFormDelete','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('76','OnBeforeModFormSave','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('77','OnModFormSave','1','Modules');
INSERT INTO `gt_system_eventnames` VALUES ('78','OnBeforeWebLogin','3','');
INSERT INTO `gt_system_eventnames` VALUES ('79','OnWebAuthentication','3','');
INSERT INTO `gt_system_eventnames` VALUES ('80','OnBeforeManagerLogin','2','');
INSERT INTO `gt_system_eventnames` VALUES ('81','OnManagerAuthentication','2','');
INSERT INTO `gt_system_eventnames` VALUES ('82','OnSiteSettingsRender','1','System Settings');
INSERT INTO `gt_system_eventnames` VALUES ('83','OnFriendlyURLSettingsRender','1','System Settings');
INSERT INTO `gt_system_eventnames` VALUES ('84','OnUserSettingsRender','1','System Settings');
INSERT INTO `gt_system_eventnames` VALUES ('85','OnInterfaceSettingsRender','1','System Settings');
INSERT INTO `gt_system_eventnames` VALUES ('86','OnMiscSettingsRender','1','System Settings');
INSERT INTO `gt_system_eventnames` VALUES ('87','OnRichTextEditorRegister','1','RichText Editor');
INSERT INTO `gt_system_eventnames` VALUES ('88','OnRichTextEditorInit','1','RichText Editor');
INSERT INTO `gt_system_eventnames` VALUES ('89','OnManagerPageInit','2','');
INSERT INTO `gt_system_eventnames` VALUES ('90','OnWebPageInit','5','');
INSERT INTO `gt_system_eventnames` VALUES ('101','OnLoadDocumentObject','5','');
INSERT INTO `gt_system_eventnames` VALUES ('104','OnBeforeLoadDocumentObject','5','');
INSERT INTO `gt_system_eventnames` VALUES ('105','OnAfterLoadDocumentObject','5','');
INSERT INTO `gt_system_eventnames` VALUES ('91','OnLoadWebDocument','5','');
INSERT INTO `gt_system_eventnames` VALUES ('92','OnParseDocument','5','');
INSERT INTO `gt_system_eventnames` VALUES ('106','OnParseProperties','5','');
INSERT INTO `gt_system_eventnames` VALUES ('93','OnManagerLoginFormRender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('94','OnWebPageComplete','5','');
INSERT INTO `gt_system_eventnames` VALUES ('95','OnLogPageHit','5','');
INSERT INTO `gt_system_eventnames` VALUES ('96','OnBeforeManagerPageInit','2','');
INSERT INTO `gt_system_eventnames` VALUES ('97','OnBeforeEmptyTrash','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('98','OnEmptyTrash','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('99','OnManagerLoginFormPrerender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('100','OnStripAlias','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('102','OnMakeDocUrl','5','');
INSERT INTO `gt_system_eventnames` VALUES ('103','OnBeforeLoadExtension','5','');
INSERT INTO `gt_system_eventnames` VALUES ('200','OnCreateDocGroup','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('201','OnManagerWelcomePrerender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('202','OnManagerWelcomeHome','2','');
INSERT INTO `gt_system_eventnames` VALUES ('203','OnManagerWelcomeRender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('204','OnBeforeDocDuplicate','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('205','OnDocDuplicate','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('206','OnManagerMainFrameHeaderHTMLBlock','2','');
INSERT INTO `gt_system_eventnames` VALUES ('207','OnManagerPreFrameLoader','2','');
INSERT INTO `gt_system_eventnames` VALUES ('208','OnManagerFrameLoader','2','');
INSERT INTO `gt_system_eventnames` VALUES ('209','OnManagerTreeInit','2','');
INSERT INTO `gt_system_eventnames` VALUES ('210','OnManagerTreePrerender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('211','OnManagerTreeRender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('212','OnManagerNodePrerender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('213','OnManagerNodeRender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('214','OnManagerMenuPrerender','2','');
INSERT INTO `gt_system_eventnames` VALUES ('224','OnDocFormTemplateRender','1','Documents');
INSERT INTO `gt_system_eventnames` VALUES ('999','OnPageUnauthorized','1','');
INSERT INTO `gt_system_eventnames` VALUES ('1000','OnPageNotFound','1','');
INSERT INTO `gt_system_eventnames` VALUES ('1001','OnFileBrowserUpload','1','File Browser Events');

# --------------------------------------------------------

#
# Table structure for table `gt_system_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_system_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

#
# Dumping data for table `gt_system_settings`
#

INSERT INTO `gt_system_settings` VALUES ('manager_theme','MODxRE');
INSERT INTO `gt_system_settings` VALUES ('settings_version','1.1');
INSERT INTO `gt_system_settings` VALUES ('show_meta','0');
INSERT INTO `gt_system_settings` VALUES ('server_offset_time','0');
INSERT INTO `gt_system_settings` VALUES ('server_protocol','http');
INSERT INTO `gt_system_settings` VALUES ('manager_language','russian-UTF8');
INSERT INTO `gt_system_settings` VALUES ('modx_charset','UTF-8');
INSERT INTO `gt_system_settings` VALUES ('site_name','Graphic Technology');
INSERT INTO `gt_system_settings` VALUES ('site_start','1');
INSERT INTO `gt_system_settings` VALUES ('error_page','28');
INSERT INTO `gt_system_settings` VALUES ('unauthorized_page','29');
INSERT INTO `gt_system_settings` VALUES ('site_status','1');
INSERT INTO `gt_system_settings` VALUES ('site_unavailable_message','The site is currently unavailable');
INSERT INTO `gt_system_settings` VALUES ('track_visitors','0');
INSERT INTO `gt_system_settings` VALUES ('top_howmany','10');
INSERT INTO `gt_system_settings` VALUES ('auto_template_logic','parent');
INSERT INTO `gt_system_settings` VALUES ('default_template','3');
INSERT INTO `gt_system_settings` VALUES ('old_template','3');
INSERT INTO `gt_system_settings` VALUES ('publish_default','1');
INSERT INTO `gt_system_settings` VALUES ('cache_default','1');
INSERT INTO `gt_system_settings` VALUES ('search_default','1');
INSERT INTO `gt_system_settings` VALUES ('friendly_urls','1');
INSERT INTO `gt_system_settings` VALUES ('friendly_url_prefix','');
INSERT INTO `gt_system_settings` VALUES ('friendly_url_suffix','');
INSERT INTO `gt_system_settings` VALUES ('friendly_alias_urls','1');
INSERT INTO `gt_system_settings` VALUES ('use_alias_path','1');
INSERT INTO `gt_system_settings` VALUES ('use_udperms','1');
INSERT INTO `gt_system_settings` VALUES ('udperms_allowroot','1');
INSERT INTO `gt_system_settings` VALUES ('failed_login_attempts','3');
INSERT INTO `gt_system_settings` VALUES ('blocked_minutes','5');
INSERT INTO `gt_system_settings` VALUES ('use_captcha','0');
INSERT INTO `gt_system_settings` VALUES ('captcha_words','MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote');
INSERT INTO `gt_system_settings` VALUES ('emailsender','art.hacker@ya.ru');
INSERT INTO `gt_system_settings` VALUES ('email_method','mail');
INSERT INTO `gt_system_settings` VALUES ('smtp_auth','0');
INSERT INTO `gt_system_settings` VALUES ('smtp_host','');
INSERT INTO `gt_system_settings` VALUES ('smtp_port','25');
INSERT INTO `gt_system_settings` VALUES ('smtp_username','');
INSERT INTO `gt_system_settings` VALUES ('emailsubject','Your login details');
INSERT INTO `gt_system_settings` VALUES ('number_of_logs','100');
INSERT INTO `gt_system_settings` VALUES ('number_of_messages','30');
INSERT INTO `gt_system_settings` VALUES ('number_of_results','20');
INSERT INTO `gt_system_settings` VALUES ('use_editor','1');
INSERT INTO `gt_system_settings` VALUES ('use_browser','1');
INSERT INTO `gt_system_settings` VALUES ('rb_base_dir','/var/www/site/assets/');
INSERT INTO `gt_system_settings` VALUES ('rb_base_url','assets/');
INSERT INTO `gt_system_settings` VALUES ('which_editor','none');
INSERT INTO `gt_system_settings` VALUES ('fe_editor_lang','russian-UTF8');
INSERT INTO `gt_system_settings` VALUES ('fck_editor_toolbar','standard');
INSERT INTO `gt_system_settings` VALUES ('fck_editor_autolang','0');
INSERT INTO `gt_system_settings` VALUES ('editor_css_path','');
INSERT INTO `gt_system_settings` VALUES ('editor_css_selectors','');
INSERT INTO `gt_system_settings` VALUES ('strip_image_paths','1');
INSERT INTO `gt_system_settings` VALUES ('upload_images','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff');
INSERT INTO `gt_system_settings` VALUES ('upload_media','au,avi,mp3,mp4,mpeg,mpg,wav,wmv');
INSERT INTO `gt_system_settings` VALUES ('upload_flash','fla,flv,swf');
INSERT INTO `gt_system_settings` VALUES ('upload_files','bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF');
INSERT INTO `gt_system_settings` VALUES ('upload_maxsize','10485760');
INSERT INTO `gt_system_settings` VALUES ('new_file_permissions','0644');
INSERT INTO `gt_system_settings` VALUES ('new_folder_permissions','0755');
INSERT INTO `gt_system_settings` VALUES ('filemanager_path','/var/www/site/');
INSERT INTO `gt_system_settings` VALUES ('theme_refresher','');
INSERT INTO `gt_system_settings` VALUES ('manager_layout','4');
INSERT INTO `gt_system_settings` VALUES ('custom_contenttype','application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json');
INSERT INTO `gt_system_settings` VALUES ('auto_menuindex','1');
INSERT INTO `gt_system_settings` VALUES ('session.cookie.lifetime','604800');
INSERT INTO `gt_system_settings` VALUES ('mail_check_timeperiod','60');
INSERT INTO `gt_system_settings` VALUES ('manager_direction','ltr');
INSERT INTO `gt_system_settings` VALUES ('tinymce_editor_theme','editor');
INSERT INTO `gt_system_settings` VALUES ('tinymce_custom_plugins','style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media');
INSERT INTO `gt_system_settings` VALUES ('tinymce_custom_buttons1','undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help');
INSERT INTO `gt_system_settings` VALUES ('tinymce_custom_buttons2','bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops');
INSERT INTO `gt_system_settings` VALUES ('tree_show_protected','1');
INSERT INTO `gt_system_settings` VALUES ('rss_url_news','http://feeds.feedburner.com/modx-announce');
INSERT INTO `gt_system_settings` VALUES ('rss_url_security','http://feeds.feedburner.com/modxsecurity');
INSERT INTO `gt_system_settings` VALUES ('validate_referer','1');
INSERT INTO `gt_system_settings` VALUES ('datepicker_offset','-10');
INSERT INTO `gt_system_settings` VALUES ('xhtml_urls','1');
INSERT INTO `gt_system_settings` VALUES ('allow_duplicate_alias','1');
INSERT INTO `gt_system_settings` VALUES ('automatic_alias','1');
INSERT INTO `gt_system_settings` VALUES ('datetime_format','dd-mm-YYYY');
INSERT INTO `gt_system_settings` VALUES ('warning_visibility','0');
INSERT INTO `gt_system_settings` VALUES ('remember_last_tab','1');
INSERT INTO `gt_system_settings` VALUES ('enable_bindings','1');
INSERT INTO `gt_system_settings` VALUES ('seostrict','1');
INSERT INTO `gt_system_settings` VALUES ('cache_type','2');
INSERT INTO `gt_system_settings` VALUES ('maxImageWidth','1600');
INSERT INTO `gt_system_settings` VALUES ('maxImageHeight','1200');
INSERT INTO `gt_system_settings` VALUES ('thumbWidth','150');
INSERT INTO `gt_system_settings` VALUES ('thumbHeight','150');
INSERT INTO `gt_system_settings` VALUES ('thumbsDir','.thumbs');
INSERT INTO `gt_system_settings` VALUES ('jpegQuality','90');
INSERT INTO `gt_system_settings` VALUES ('denyZipDownload','0');
INSERT INTO `gt_system_settings` VALUES ('denyExtensionRename','0');
INSERT INTO `gt_system_settings` VALUES ('showHiddenFiles','0');
INSERT INTO `gt_system_settings` VALUES ('docid_incrmnt_method','0');
INSERT INTO `gt_system_settings` VALUES ('make_folders','1');
INSERT INTO `gt_system_settings` VALUES ('tree_page_click','27');
INSERT INTO `gt_system_settings` VALUES ('clean_uploaded_filename','1');
INSERT INTO `gt_system_settings` VALUES ('site_id','56e0c17248a03');
INSERT INTO `gt_system_settings` VALUES ('site_unavailable_page','');
INSERT INTO `gt_system_settings` VALUES ('reload_site_unavailable','');
INSERT INTO `gt_system_settings` VALUES ('siteunavailable_message_default','В настоящее время сайт недоступен.');
INSERT INTO `gt_system_settings` VALUES ('aliaslistingfolder','0');
INSERT INTO `gt_system_settings` VALUES ('check_files_onlogin','index.php\n.htaccess\nmanager/index.php\nmanager/includes/config.inc.php\n');
INSERT INTO `gt_system_settings` VALUES ('error_reporting','1');
INSERT INTO `gt_system_settings` VALUES ('send_errormail','0');
INSERT INTO `gt_system_settings` VALUES ('pwd_hash_algo','UNCRYPT');
INSERT INTO `gt_system_settings` VALUES ('reload_captcha_words','');
INSERT INTO `gt_system_settings` VALUES ('captcha_words_default','MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote');
INSERT INTO `gt_system_settings` VALUES ('smtp_secure','none');
INSERT INTO `gt_system_settings` VALUES ('reload_emailsubject','');
INSERT INTO `gt_system_settings` VALUES ('emailsubject_default','Данные для авторизации');
INSERT INTO `gt_system_settings` VALUES ('reload_signupemail_message','');
INSERT INTO `gt_system_settings` VALUES ('signupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('system_email_signup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации в системе управления сайтом [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('reload_websignupemail_message','');
INSERT INTO `gt_system_settings` VALUES ('websignupemail_message','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('system_email_websignup_default','Здравствуйте, [+uid+]!\n\nВаши данные для авторизации на [+sname+]:\n\nИмя пользователя: [+uid+]\nПароль: [+pwd+]\n\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('reload_system_email_webreminder_message','');
INSERT INTO `gt_system_settings` VALUES ('webpwdreminder_message','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('system_email_webreminder_default','Здравствуйте, [+uid+]!\n\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\n\n[+surl+]\n\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\n\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\n\nС уважением, Администрация');
INSERT INTO `gt_system_settings` VALUES ('resource_tree_node_name','pagetitle');
INSERT INTO `gt_system_settings` VALUES ('mce_editor_skin','default');
INSERT INTO `gt_system_settings` VALUES ('mce_template_docs','');
INSERT INTO `gt_system_settings` VALUES ('mce_template_chunks','');
INSERT INTO `gt_system_settings` VALUES ('mce_entermode','p');
INSERT INTO `gt_system_settings` VALUES ('mce_element_format','xhtml');
INSERT INTO `gt_system_settings` VALUES ('mce_schema','html4');
INSERT INTO `gt_system_settings` VALUES ('tinymce_custom_buttons3','');
INSERT INTO `gt_system_settings` VALUES ('tinymce_custom_buttons4','');
INSERT INTO `gt_system_settings` VALUES ('tinymce_css_selectors','left=justifyleft;right=justifyright');
INSERT INTO `gt_system_settings` VALUES ('rb_webuser','0');
INSERT INTO `gt_system_settings` VALUES ('sys_files_checksum','a:4:{s:23:\"/var/www/site/index.php\";s:32:\"3fdee2b1be7b78f68e7c8b42224c523c\";s:23:\"/var/www/site/.htaccess\";s:32:\"b638c077bbdeb1948fe128acccd92c7f\";s:31:\"/var/www/site/manager/index.php\";s:32:\"7d548f647ca85e5d364c883713914884\";s:45:\"/var/www/site/manager/includes/config.inc.php\";s:32:\"fce6fbe807928962b7cc94662e807823\";}');

# --------------------------------------------------------

#
# Table structure for table `gt_user_attributes`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_user_attributes`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.';

#
# Dumping data for table `gt_user_attributes`
#

INSERT INTO `gt_user_attributes` VALUES ('1','1','Default admin account','1','art.hacker@ya.ru','','','0','0','0','7','1461190491','1461879367','0','5kr85vtl1s4638oe0lt0q110c4','0','0','','','','','','','','');

# --------------------------------------------------------

#
# Table structure for table `gt_user_messages`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_user_messages`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.';

#
# Dumping data for table `gt_user_messages`
#


# --------------------------------------------------------

#
# Table structure for table `gt_user_roles`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_user_roles`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.';

#
# Dumping data for table `gt_user_roles`
#

INSERT INTO `gt_user_roles` VALUES ('2','Editor','Limited to managing content','1','1','1','1','1','1','1','0','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','1','0','1','0','1','1','1','1','1','1','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','1');
INSERT INTO `gt_user_roles` VALUES ('3','Publisher','Editor with expanded permissions including manage users, update Elements and site settings','1','1','1','1','1','1','1','1','1','1','1','0','1','1','1','0','0','1','1','1','1','1','1','0','0','0','0','1','1','1','1','1','1','1','1','1','1','1','1','1','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','1','1','1','1','0','1','0','0','1');
INSERT INTO `gt_user_roles` VALUES ('1','Administrator','Site administrators have full access to all functions','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1');

# --------------------------------------------------------

#
# Table structure for table `gt_user_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_user_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

#
# Dumping data for table `gt_user_settings`
#


# --------------------------------------------------------

#
# Table structure for table `gt_web_groups`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_web_groups`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `gt_web_groups`
#


# --------------------------------------------------------

#
# Table structure for table `gt_web_user_attributes`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_web_user_attributes`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.';

#
# Dumping data for table `gt_web_user_attributes`
#


# --------------------------------------------------------

#
# Table structure for table `gt_web_user_settings`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_web_user_settings`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

#
# Dumping data for table `gt_web_user_settings`
#


# --------------------------------------------------------

#
# Table structure for table `gt_web_users`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_web_users`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Dumping data for table `gt_web_users`
#


# --------------------------------------------------------

#
# Table structure for table `gt_webgroup_access`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_webgroup_access`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `gt_webgroup_access`
#


# --------------------------------------------------------

#
# Table structure for table `gt_webgroup_names`
#

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `gt_webgroup_names`;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

CREATE TABLE `gt_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.';

#
# Dumping data for table `gt_webgroup_names`
#
