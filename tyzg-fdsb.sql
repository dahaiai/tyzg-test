/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : tyzg-fdsb

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2015-10-20 17:41:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for carinfo
-- ----------------------------
DROP TABLE IF EXISTS `carinfo`;
CREATE TABLE `carinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `car_no` varchar(128) DEFAULT NULL,
  `gps_no` varchar(128) DEFAULT NULL,
  `subsidiary` varchar(128) DEFAULT NULL,
  `subcompany` varchar(128) DEFAULT NULL,
  `standard` varchar(128) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `custome_id` int(11) DEFAULT NULL,
  `custome_info` varchar(128) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `lng` varchar(128) DEFAULT NULL,
  `lat` varchar(128) DEFAULT NULL,
  `locked` int(1) DEFAULT NULL,
  `sal_status` int(1) DEFAULT NULL,
  `payment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carinfo
-- ----------------------------
INSERT INTO `carinfo` VALUES ('19', 'dsfd', 'fsd', 'fdsf', 'sdf', 'sdfsd', '2015-10-20 16:30:07', '0', 'aa', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('26', 'sdfsd', 'fsdfds', 'fdsfsd', 'fsdfds', 'fsdfsd', '2015-10-20 17:09:53', '2', '??', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('27', 'sdf', 'sdfds', 'fsdf', 'sdfsd', 'fdsfsdf', '2015-10-20 17:12:13', '3', '??', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('28', 'sdfsdf', 'sadfs', 'fsdfsdf', 'sdfsdf', 'sdfsdfsf', '2015-10-20 17:16:57', '3', '??', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('29', '11111', '11111', '11111', '11111', '11111', '2015-10-20 17:27:52', '2', '??', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('30', '231232', '123', '?????', '??????', '???', '2015-10-20 17:30:53', '3', '??', '0', null, null, '1', '1', null);
INSERT INTO `carinfo` VALUES ('31', '222', '222', '??? ', '???', '??', '2015-10-20 17:38:53', '3', '??', '0', null, null, '1', '1', null);

-- ----------------------------
-- Table structure for custome
-- ----------------------------
DROP TABLE IF EXISTS `custome`;
CREATE TABLE `custome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `person` varchar(128) DEFAULT NULL,
  `phone` varchar(128) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custome
-- ----------------------------
INSERT INTO `custome` VALUES ('1', 'aa', 'bb', '123', 'sdfsfsd');
INSERT INTO `custome` VALUES ('2', '小明', '小明明', '12212', '江苏');
INSERT INTO `custome` VALUES ('3', '小花', '小花花', '234242312', '上海');
