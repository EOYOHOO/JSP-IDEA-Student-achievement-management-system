/*
 Navicat Premium Data Transfer

 Source Server         : first
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : student

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 06/27/2017 15:40:52 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `grade`
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cpp` varchar(30) NOT NULL,
  `circuit` varchar(30) NOT NULL,
  `Ewrite` varchar(30) NOT NULL,
  `Elisten` varchar(30) NOT NULL,
  `physics` varchar(30) NOT NULL,
  `probability` varchar(30) NOT NULL,
  `history` varchar(30) NOT NULL,
  `xingzheng` varchar(30) NOT NULL,
  `pe` varchar(30) NOT NULL,
  `discrete` varchar(30) NOT NULL,
  `overall` varchar(30) DEFAULT '0',
  `gpa` varchar(30) DEFAULT '0',
  `rank` varchar(30) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `id` varchar(30) NOT NULL,
  `rank` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
