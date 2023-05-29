/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : cet6

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 29/05/2023 21:46:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `Examiner_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ExamPaper_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Examinee_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Choice_A` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Subjective_A` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Seperate_S` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Gross_S` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Whe_Take_Test` int(1) NULL DEFAULT NULL,
  `Whe_Pay_Fees` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`Examiner_ID`, `ExamPaper_ID`) USING BTREE,
  INDEX `ExamPaper_ID`(`ExamPaper_ID`) USING BTREE,
  INDEX `Examinee_ID`(`Examinee_ID`) USING BTREE,
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Examiner_ID`) REFERENCES `examiner` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`ExamPaper_ID`) REFERENCES `exampaper` (`ExamPaper_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`Examinee_ID`) REFERENCES `examinee` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `Choice_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Examiner_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Choice_Stem` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Choice_Options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Choice_Answer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Choice_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examinee
-- ----------------------------
DROP TABLE IF EXISTS `examinee`;
CREATE TABLE `examinee`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for examiner
-- ----------------------------
DROP TABLE IF EXISTS `examiner`;
CREATE TABLE `examiner`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `ExamPaper_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ExamDate` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Choice_Num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Choice_IDs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Subjective_IDs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Subjective_Num` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ExamPaper_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for subjective
-- ----------------------------
DROP TABLE IF EXISTS `subjective`;
CREATE TABLE `subjective`  (
  `Subjective_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Examinee_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Subjective_Stem` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Subjective_Answer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Subjective_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
