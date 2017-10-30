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

Date: 2017-10-30 18:49:03
*/


-- ----------------------------
-- Table structure for BUSINESS
-- ----------------------------
DROP TABLE "SCOTT"."BUSINESS";
CREATE TABLE "SCOTT"."BUSINESS" (
"DEAL_TIME" DATE NULL ,
"UNO" NUMBER NULL ,
"TID" NUMBER NULL ,
"STATUS" VARCHAR2(10 BYTE) NULL 
)
LOGGING
NOCOMPRESS
NOCACHE

;
COMMENT ON COLUMN "SCOTT"."BUSINESS"."DEAL_TIME" IS '交易时间(时间戳作为主键)';
COMMENT ON COLUMN "SCOTT"."BUSINESS"."UNO" IS '引用用户账号作为外键';
COMMENT ON COLUMN "SCOTT"."BUSINESS"."TID" IS '产品编号';
COMMENT ON COLUMN "SCOTT"."BUSINESS"."STATUS" IS '订单状态（待付款，已付款，已退款）';

-- ----------------------------
-- Records of BUSINESS
-- ----------------------------
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-21 19:13:37', 'YYYY-MM-DD HH24:MI:SS'), '81', '1', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-20 19:08:01', 'YYYY-MM-DD HH24:MI:SS'), '38', '2', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-22 10:46:02', 'YYYY-MM-DD HH24:MI:SS'), '21', '1', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-22 10:52:28', 'YYYY-MM-DD HH24:MI:SS'), '21', '2', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-22 18:14:16', 'YYYY-MM-DD HH24:MI:SS'), '101', '1', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-25 15:09:10', 'YYYY-MM-DD HH24:MI:SS'), '2', '14', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-21 11:25:14', 'YYYY-MM-DD HH24:MI:SS'), '21', '24', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-22 10:08:17', 'YYYY-MM-DD HH24:MI:SS'), '81', '5', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-20 16:49:04', 'YYYY-MM-DD HH24:MI:SS'), '38', '17', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-20 19:04:17', 'YYYY-MM-DD HH24:MI:SS'), '38', '11', '购物车');
INSERT INTO "SCOTT"."BUSINESS" VALUES (TO_DATE('2017-09-21 11:25:04', 'YYYY-MM-DD HH24:MI:SS'), '21', '4', '购物车');
