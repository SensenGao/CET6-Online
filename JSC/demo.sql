/*
 Navicat Premium Data Transfer

 Source Server         : main
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : demo

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 05/06/2023 13:14:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `Examiner_ID` int(0) NOT NULL,
  `ExamPaper_ID` int(0) NOT NULL,
  `Examinee_ID` int(0) NULL DEFAULT NULL,
  `Choice_A` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Subjective_A` varchar(4096) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Seperate_S` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Gross_S` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Whe_Take_Test` int(0) NULL DEFAULT NULL,
  `Whe_Pay_Fees` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ExamPaper_ID`) USING BTREE,
  INDEX `ExamPaper_ID`(`ExamPaper_ID`) USING BTREE,
  INDEX `Examinee_ID`(`Examinee_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, 1, 2013628, 'A@@B@@C', 'hello@@morning@@', '75.5', '100', 1, 1);

-- ----------------------------
-- Table structure for choice
-- ----------------------------
DROP TABLE IF EXISTS `choice`;
CREATE TABLE `choice`  (
  `Choice_ID` int(0) NOT NULL,
  `Examiner_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Choice_Stem` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Choice_Options` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Choice_Answer` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Choice_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice
-- ----------------------------
INSERT INTO `choice` VALUES (1, 'null', 'what', 'you@@he@@she@@we', 'C');
INSERT INTO `choice` VALUES (2, 'null', 'when', 'today@@yesterday@@tommoro@@nextweek', 'D');
INSERT INTO `choice` VALUES (3, 'null', 'who', 'he@@you@@her@@me', 'C');

-- ----------------------------
-- Table structure for examinee
-- ----------------------------
DROP TABLE IF EXISTS `examinee`;
CREATE TABLE `examinee`  (
  `ID` int(0) NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examinee
-- ----------------------------
INSERT INTO `examinee` VALUES (1231231, '李明', 'female', '2056897@mail.nankai.edu.cn', '15426354587', '123456');
INSERT INTO `examinee` VALUES (2010764, 'gaosensen', 'male', 'morigao@163.com', '19991010101', '123456');
INSERT INTO `examinee` VALUES (2013628, 'jiayuhang', 'male', '3324218393@qq.com', '18008033185', '123456');
INSERT INTO `examinee` VALUES (2213121, '小刚', 'female', '2056412@mail.nankai.edu.cn', '15632541458', '123456');
INSERT INTO `examinee` VALUES (3231321, '小红', 'male', '2074561@mail.nankai.edu.cn', '13256987451', '123456');

-- ----------------------------
-- Table structure for examiner
-- ----------------------------
DROP TABLE IF EXISTS `examiner`;
CREATE TABLE `examiner`  (
  `ID` int(0) NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of examiner
-- ----------------------------
INSERT INTO `examiner` VALUES (2010764, 'gaosensen', 'male', 'XiaoWan@mail.nankai.edu.cn', '15965478951', '123456');
INSERT INTO `examiner` VALUES (2013628, 'jiayuhang', 'male', 'jiayuhang@nankai.com', '18008399185', '123456');

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `ExamPaper_ID` int(0) NOT NULL,
  `ExamPaper_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ExamDate` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Choice_Num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Choice_IDs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Subjective_Num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Subjective_IDs` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ExamPaper_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (1, '2002/06/CET6/paper1', '2002-06-14', '', NULL, '3', '2@@3@@4@@1');
INSERT INTO `exampaper` VALUES (2, '2002/12/CET6/paper1', '2002-12-15', NULL, NULL, '1', '3');
INSERT INTO `exampaper` VALUES (3, '2003/06/CET6/paper1', '2003-06-14', NULL, NULL, NULL, NULL);
INSERT INTO `exampaper` VALUES (4, '2003/12/CET6/paper2', '2003-12-15', NULL, NULL, NULL, NULL);
INSERT INTO `exampaper` VALUES (5, '2004/06/CET6/paper1', '2004-06-14', NULL, NULL, NULL, NULL);
INSERT INTO `exampaper` VALUES (6, '2004/12/CET6/paper2', '2004-12-15', NULL, NULL, NULL, '');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `ID` int(0) NOT NULL,
  `Name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (2013627, 'gaosensen', 'male', 'Layfi@mail.nankai.edu.cn', '15865478956', '123456');
INSERT INTO `manager` VALUES (2013628, '2013628', 'male', '1', '1', '123456');

-- ----------------------------
-- Table structure for subjective
-- ----------------------------
DROP TABLE IF EXISTS `subjective`;
CREATE TABLE `subjective`  (
  `Subjective_ID` int(0) NOT NULL,
  `Examinee_ID` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Subjective_Stem` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `Subjective_Answer` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Subjective_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subjective
-- ----------------------------
INSERT INTO `subjective` VALUES (1, 'null', 'Describe a memorable vacation you have had and explain why it was special to you.', 'One of the most memorable vacations I had was when I traveled to Bali, Indonesia. The natural beauty of the island, with its stunning beaches and lush green landscapes, left a lasting impression on me. Moreover, the warm and welcoming culture of the Balinese people made the experience even more special. I had the opportunity to explore ancient temples, try traditional Balinese cuisine, and participate in cultural activities. It was a perfect blend of relaxation and adventure, and it allowed me to create cherished memories that I will treasure for a lifetime.');
INSERT INTO `subjective` VALUES (2, 'null', 'Discuss the importance of learning a second language and how it can benefit individuals.', 'Learning a second language is incredibly important in today\'s globalized world. It opens up opportunities for communication and understanding across different cultures and communities. Not only does it facilitate effective communication with people from diverse backgrounds, but it also broadens one\'s horizons by providing insight into different perspectives and ways of life. Additionally, learning a second language can enhance cognitive abilities, improve problem-solving skills, and even boost career prospects. It enables individuals to connect with others on a deeper level, fosters cultural sensitivity, and promotes personal growth.');
INSERT INTO `subjective` VALUES (3, 'null', 'Share your opinion on the impact of technology in our daily lives.', 'Technology has undeniably transformed our daily lives in numerous ways. It has revolutionized communication, making it faster and more convenient through smartphones, social media platforms, and video conferencing tools. It has also improved access to information, enabling us to stay informed and learn about various topics with just a few clicks. However, it\'s important to recognize that excessive reliance on technology can have its downsides, such as reduced face-to-face interactions, privacy concerns, and the potential for addiction. Striking a balance between embracing technology\'s benefits and being mindful of its drawbacks is crucial for maintaining a healthy and well-rounded lifestyle.');
INSERT INTO `subjective` VALUES (4, 'null', 'Discuss the advantages and disadvantages of social media in today\'s society.', 'My favorite movie is \"The Shawshank Redemption.\" I love it because it tells a compelling story of hope, friendship, and resilience. The characters are well-developed, and the acting is superb. The film\'s message about the power one.');
INSERT INTO `subjective` VALUES (5, 'null', 'what', 'yes');

SET FOREIGN_KEY_CHECKS = 1;
