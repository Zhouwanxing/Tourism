/*
Navicat Oracle Data Transfer
Oracle Client Version : 11.2.0.1.0

Source Server         : oracle11g
Source Server Version : 110200
Source Host           : :1521
Source Schema         : SCOTT

Target Server Type    : ORACLE
Target Server Version : 110200
File Encoding         : 65001

Date: 2017-10-30 18:48:35
*/


-- ----------------------------
-- Table structure for USERINFO
-- ----------------------------
DROP TABLE "SCOTT"."USERINFO";
CREATE TABLE "SCOTT"."USERINFO" (
"UNO" NUMBER NOT NULL ,
"USERID" VARCHAR2(20 BYTE) NOT NULL ,
"UNAME" VARCHAR2(20 BYTE) NULL ,
"PID" VARCHAR2(18 BYTE) NULL ,
"SEX" VARCHAR2(3 BYTE) NULL ,
"PHONE" VARCHAR2(33 BYTE) NULL ,
"PWD" VARCHAR2(20 BYTE) NULL ,
"ICON" VARCHAR2(50 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;

-- ----------------------------
-- Records of USERINFO
-- ----------------------------
INSERT INTO "SCOTT"."USERINFO" VALUES ('81', '张三', '孙悟空', '451247854521234', '女', '13145454545', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('101', '狄仁杰', '李元芳', '123456789987654321', '男', '12345678998', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('38', '王杰', '狄仁杰', '420704119408095094', '男', '55555555555', '123456', '20170925112307840.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('2', '张珊', '虞姬', '420704119408095094', '男', '13985426514', '520520', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('6', '李四', '男枪', '123456786431321', '男', '13114215214', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('102', '王五', '奥巴马', '147258369963258', '女', '12345678945', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('3', '小红', '赵云', '420704119408095094', '女', '13958421475', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('21', '小明', '鲁班', '123456786431321', '女', '13127368552', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('103', '小花', '孙尚香', '451247854521234', '男', '13145454545', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('121', '大表姐', '吴亦凡', '123456789987654123', '女', '12345678998', '123456', 'touxiang.jpg');
INSERT INTO "SCOTT"."USERINFO" VALUES ('122', '尼玛', '小乔', '123456789987654321', '男', '12345678998', '123456789', 'touxiang.jpg');

-- ----------------------------
-- Indexes structure for table USERINFO
-- ----------------------------

-- ----------------------------
-- Uniques structure for table USERINFO
-- ----------------------------
ALTER TABLE "SCOTT"."USERINFO" ADD UNIQUE ("USERID");

-- ----------------------------
-- Checks structure for table USERINFO
-- ----------------------------
ALTER TABLE "SCOTT"."USERINFO" ADD CHECK ("UNO" IS NOT NULL);
ALTER TABLE "SCOTT"."USERINFO" ADD CHECK ("USERID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table USERINFO
-- ----------------------------
ALTER TABLE "SCOTT"."USERINFO" ADD PRIMARY KEY ("UNO");
