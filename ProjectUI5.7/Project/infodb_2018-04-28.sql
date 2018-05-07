# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.38)
# Database: infodb
# Generation Time: 2018-04-28 07:18:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table tb_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_info`;

CREATE TABLE `tb_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `info_type` int(11) DEFAULT NULL,
  `info_title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `info_content` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `info_linkman` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `info_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `info_email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info_date` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `info_state` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `info_attention` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '0是老师，1是学生',
  `info_typepid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_info` WRITE;
/*!40000 ALTER TABLE `tb_info` DISABLE KEYS */;

INSERT INTO `tb_info` (`id`, `info_type`, `info_title`, `info_content`, `info_linkman`, `info_phone`, `info_email`, `info_date`, `info_state`, `info_attention`, `info_typepid`)
VALUES
	(101,1,'ccf能力养成','你要努力参加啊！话说大宋仁宗天子在位，嘉佑三年三月三日五更三点，天子驾坐紫哀殿，受百官朝贺。但见：\n\n　　祥云迷凤阁，瑞气罩龙楼。含烟御柳拂篮旗，带露宫花迎剑戟。天香影里，玉吞珠履聚丹墀；仙乐声中，绣袄锦衣扶御驾。珍珠帘卷，黄金殿上现金舆；凤羽扇开，白王阶前停宝辇。隐隐净鞭三下响，层层文武两班齐。','https://www.baidu.com','15111135597','980381110@qq.com','2018-04-16','1','0',1),
	(102,2,'机器人大赛培养','two content','https://www.baidu.com','15111135597','980381110@qq.com','2018-04-16','1','1',2),
	(103,3,'全国计算机等级考试','three content','https://www.baidu.com','15111135597','980381110@qq.com','2018-04-16','1','1',3),
	(104,4,'c语言全国竞赛','four content','https://www.baidu.com','15111135597','980381110@qq.com','2018-04-16','0','1',4),
	(105,1,'java养成记','当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏：一面降赦天下罪囚，应有民间税赋悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛。仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣越班启奏。天子看时，乃是参知政事范仲淹。\n当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏：一面降赦天下罪囚，应有民间税赋悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛。仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣越班启奏。天子看时，乃是参知政事范仲淹。\n当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏：一面降赦天下罪囚，应有民间税赋悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛。仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣越班启奏。天子看时，乃是参知政事范仲淹。\n当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏：一面降赦天下罪囚，应有民间税赋悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛。仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣越班启奏。天子看时，乃是参知政事范仲淹。\n当有殿头官喝道：“有事出班早奏，无事卷帘退朝。”只见班部丛中，宰相赵哲、参政文彦博出班奏曰：“目今京师瘟疫盛行，伤损军民甚多。伏望陛下释罪宽恩，省刑薄税，祈禳天灾，救济万民。”天子听奏，急敕翰林院随即草诏：一面降赦天下罪囚，应有民间税赋悉皆赦免；一面命在京宫观寺院，修设好事禳灾。不料其年瘟疫转盛。仁宗天子闻知，龙体不安，复会百官计议。向那班部中，有一大臣越班启奏。天子看时，乃是参知政事范仲淹。\n当有殿头当','https://www.baidu.com','15111135597','980381110@qq.com','2018-04-16','1','0',1),
	(112,3,'asdfas','asdfsdf','dfasd','fasdfa','sdfasdf','2018-04-26 16:44:37','0','0',3),
	(114,1,' 你说相思赋予谁','ad积分卡了坚实的拉法基圣诞快乐房间爱上了打开了房间爱了时代峻峰','哈哈哈','1717177171','938942839489','2018-04-26 16:50:58','1','1',1),
	(115,2,'向泽阳就怎样','蓝思科技弗拉克鲁斯接待来访讲述了打开了房间里','啊哈哈哈','29308239','940890','2018-04-26 16:54:48','1','0',2),
	(117,1,'asdfasdf','阿拉山口洞房就阿里斯顿减肥拉克丝老地方','你说怎么做就怎么做','2121212','123412341234122','2018-04-26 17:00:44','1','0',1),
	(120,2,'asdfasd','asdfasdfasdf','啥是打发士大夫','asdfa','asdf','2018-04-26 17:03:17','1','0',2),
	(121,1,'水浒传','青松屈曲，翠柏阴森。门悬敕额金书，户列灵符玉篆。虚皇坛畔，依稀垂柳名花；炼药炉边，掩映苍松老桧。左壁厢天丁力士，参随着大乙真君；右势下玉女金童，簇捧定紫微大帝。披发仗剑，北方真武踏龟蛇；权履顶冠，南极老人伏龙虎。前排二十八宿星君，后列三十二帝天子。阶砌下流水语谩，墙院后好山环绕。鹤生丹顶，龟长绿毛。树梢头献果苍猿，莎草内衔芝白鹿。三清殿上，呜金钟道士步虚；四圣堂前，敲玉磐真人礼斗，献香台砌，彩霞光射碧琉璃；召将瑶坛，赤日影摇红玛淄。早来门外祥云现，疑是天师送老君。','andy','18017872915','980381110@qq.com','2018-04-26 17:07:06','1','0',1),
	(122,2,'飒飒发','啊','阿发的说法','阿道夫阿萨德发','阿萨德发','2018-04-26 18:51:45','1','0',2),
	(123,2,'我真的好想你','啊哈哈哈哈哈哈哈哈阿斯顿发送到发啊所发生的发说的发手动阀啊所发生的发说的','哈哈','18017872915','980381110','2018-04-28 14:49:55','1','0',2);

/*!40000 ALTER TABLE `tb_info` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_type`;

CREATE TABLE `tb_type` (
  `id` int(11) DEFAULT NULL,
  `type_sign` int(11) DEFAULT NULL,
  `type_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `type_pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_type` WRITE;
/*!40000 ALTER TABLE `tb_type` DISABLE KEYS */;

INSERT INTO `tb_type` (`id`, `type_sign`, `type_name`, `type_pid`)
VALUES
	(1,1,'前端开发',1),
	(2,2,'后台开发',2),
	(3,3,'php开发',3),
	(4,4,'Java开发',4);

/*!40000 ALTER TABLE `tb_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table tb_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `user_password` varchar(20) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;

INSERT INTO `tb_user` (`id`, `user_name`, `user_password`)
VALUES
	(1,'andy','wenqi');

/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
