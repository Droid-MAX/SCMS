/*
Navicat MySQL Data Transfer

Source Server         : mysql5.5
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : student

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-06-07 17:05:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Cno` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Cname` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Ccredit` tinyint(4) DEFAULT NULL,
  `Semester` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('01', '计算机文化学', '3', '2');
INSERT INTO `course` VALUES ('02', 'VB', '2', '3');
INSERT INTO `course` VALUES ('03', '计算机网络', '4', '7');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc` (
  `Sno` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `Cno` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Grade` tinyint(4) DEFAULT NULL,
  `XKLB` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Sno`,`Cno`),
  KEY `Cno` (`Cno`),
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`Sno`) REFERENCES `student` (`Sno`),
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`Cno`) REFERENCES `course` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('0102', '01', '76', '选修');
INSERT INTO `sc` VALUES ('0102', '02', '89', '必修');
INSERT INTO `sc` VALUES ('0103', '01', '99', '选修');
INSERT INTO `sc` VALUES ('0103', '03', '80', '必修');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `Sno` char(7) COLLATE utf8_unicode_ci NOT NULL,
  `Sname` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Ssex` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sage` tinyint(4) DEFAULT NULL,
  `Sdept` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('0102', '王三', '男', '20', '软件系');
INSERT INTO `student` VALUES ('0103', '张飞', '男', '18', '信息系');

DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
INSERT INTO `usertable`(`username`,`password`) VALUES ('admin','admin');
INSERT INTO `usertable`(`username`,`password`) VALUES ('student','student');