/*
 Navicat Premium Data Transfer

 Source Server         : 本地5.7
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 13/11/2023 17:53:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fx_account_titles
-- ----------------------------
DROP TABLE IF EXISTS `fx_account_titles`;
CREATE TABLE `fx_account_titles`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上一级，0为顶级',
  `level` bigint(11) NOT NULL DEFAULT 1 COMMENT '级次1,2,3,4,5',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目代码',
  `cn_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '中文名',
  `en_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'asset' COMMENT '科目类型asset:资产类,profit:损益类,cost:成本类,common:共同类,ownership:所有者权益类,liabilities:负债类,settlement:结算对象类',
  `format` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'amount' COMMENT '账页格式amount:金额式,currencyAmount:外币式金额',
  `abb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '助记码',
  `currency` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'CNY' COMMENT '核算币种',
  `com_id` int(11) NOT NULL DEFAULT 1 COMMENT '公司ID',
  `is_foreign` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是外币核算Y是N否',
  `is_dn` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '余额方向Y借方N贷方',
  `is_freezed` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否冻结Y是N否',
  `is_cash` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否现金流科目Y是N否',
  `is_last` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否末级科目Y是N否',
  `balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '期末余额',
  `currency_balance` decimal(11, 2) NULL DEFAULT NULL COMMENT '核算币种余额统计',
  `year_begining` decimal(11, 2) NULL DEFAULT NULL COMMENT '年初余额',
  `year_begining_currency` decimal(11, 2) NULL DEFAULT NULL COMMENT '年初余额(核算币种)',
  `account_opening` decimal(11, 2) NULL DEFAULT NULL COMMENT '开户时的余额',
  `account_opening_currency` decimal(11, 2) NULL DEFAULT NULL COMMENT '开户时的余额余额',
  `vender_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '往来单位是否必填',
  `clerk_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '员工是否必填',
  `team_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '部门是否必填',
  `branch_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '分公司是否必填',
  `created_by` bigint(20) NOT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `updated_by` bigint(20) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `code_com_id_idx`(`code`, `com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119587 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会计科目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fx_account_titles
-- ----------------------------
INSERT INTO `fx_account_titles` VALUES (71142, 0, 1, '1001', '库存现金', 'cash on hand', 'asset', 'amount', '1001', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-11-04 18:05:09', '2023-11-04 18:05:09', 1);
INSERT INTO `fx_account_titles` VALUES (71143, 0, 1, '1002', '银行存款', 'bank deposit', 'asset', 'amount', '1002', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 401825.52, 0.00, 599564.92, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71144, 0, 1, '1015', '其他货币资金', 'other monetary capital', 'asset', 'amount', '1015', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71145, 0, 1, '1101', '交易性金融资产', 'transaction monetary assets', 'asset', 'amount', '1101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 1190466.19, 0.00, 1190466.19, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71146, 0, 1, '1121', '应收票据', 'notes receivable', 'asset', 'amount', '1121', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71147, 0, 1, '1122', '应收账款', 'account receivable', 'asset', 'amount', '1122', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 3233191.60, 0.00, 3094197.40, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71148, 0, 1, '1123', '预付账款', 'account prepaid', 'asset', 'amount', '1123', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71149, 0, 1, '1131', '应收股利', 'dividend receivable', 'asset', 'amount', '1131', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71150, 0, 1, '1132', '应收利息', 'accrued interest receivable', 'asset', 'amount', '1132', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71151, 0, 1, '1231', '其他应收款', 'accounts receivable-others', 'asset', 'amount', '1231', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 21388263.21, 0.00, 18696480.09, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71152, 0, 1, '1241', '坏账准备', 'had debts reserve', 'asset', 'amount', '1241', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71153, 0, 1, '1401', '材料采购', 'procurement of materials', 'asset', 'amount', '1401', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71154, 0, 1, '1402', '在途物资', 'materials in transit', 'asset', 'amount', '1402', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71155, 0, 1, '1403', '原材料', 'raw materials', 'asset', 'amount', '1403', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71156, 0, 1, '1406', '库存商品', 'commodity stocks', 'asset', 'amount', '1406', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71157, 0, 1, '1407', '发出商品', 'goods in transit', 'asset', 'amount', '1407', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71158, 0, 1, '1412', '包装物及低值易耗品', 'wrappage and low value and easily wornout articles', 'asset', 'amount', '1412', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71159, 0, 1, '1461', '存货跌价准备', 'reserve against stock price declining', 'asset', 'amount', '1461', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71160, 0, 1, '1521', '持有至到期投资', 'hold investment due', 'asset', 'amount', '1521', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71161, 0, 1, '1522', '持有至到期投资减值准备', 'hold investment due reduction reserve', 'asset', 'amount', '1522', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71162, 0, 1, '1523', '可供出售金融资产', 'financial assets available for sale', 'asset', 'amount', '1523', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71163, 0, 1, '1524', '长期股权投资', 'long-term stock ownership investment', 'asset', 'amount', '1524', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71164, 0, 1, '1525', '长期股权投资减值准备', 'long-term stock ownership investment reduction reserve', 'asset', 'amount', '1525', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71165, 0, 1, '1526', '投资性房地产', 'investment real eastate', 'asset', 'amount', '1526', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71166, 0, 1, '1531', '长期应收款', 'long-term account receivable', 'asset', 'amount', '1531', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71167, 0, 1, '1541', '未实现融资收益', 'unrealized financing income', 'asset', 'amount', '1541', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71168, 0, 1, '1601', '固定资产', 'permanent assets', 'asset', 'amount', '1601', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71169, 0, 1, '1602', '累计折旧', 'accumulated depreciation', 'asset', 'amount', '1602', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71170, 0, 1, '1603', '固定资产减值准备permanent', 'assets reduction reserve', 'asset', 'amount', '1603', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71171, 0, 1, '1604', '在建工程', 'construction in process', 'asset', 'amount', '1604', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71172, 0, 1, '1605', '工程物资', 'engineer material', 'asset', 'amount', '1605', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71173, 0, 1, '1606', '固定资产清理', 'disposal of fixed assets', 'asset', 'amount', '1606', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71174, 0, 1, '1701', '无形资产', 'intangible assets', 'asset', 'amount', '1701', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71175, 0, 1, '1702', '累计摊销', 'accumulated amortization', 'asset', 'amount', '1702', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71176, 0, 1, '1703', '无形资产减值准备', 'intangible assets reduction reserve', 'asset', 'amount', '1703', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71177, 0, 1, '1711', '商誉', 'business reputation', 'asset', 'amount', '1711', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71178, 0, 1, '1801', '长期待摊费用', 'long-term deferred expenses', 'asset', 'amount', '1801', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 199833.48, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71179, 0, 1, '1811', '递延所得税资产', 'deferred income tax assets', 'asset', 'amount', '1811', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71180, 0, 1, '1901', '待处理财产损溢', 'waiting assets profit and loss', 'asset', 'amount', '1901', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71181, 0, 1, '2001', '短期借款', 'short-term loan', 'liabilities', 'amount', '2001', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71182, 0, 1, '2101', '交易性金融负债', 'transaction financial liabilities', 'liabilities', 'amount', '2101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71183, 0, 1, '2201', '应付票据', 'notes payable', 'liabilities', 'amount', '2201', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71184, 0, 1, '2202', '应付账款', 'account payable', 'liabilities', 'amount', '2202', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 2268677.92, 0.00, 2208376.47, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71185, 0, 1, '2205', '预收账款', 'item received in advance', 'liabilities', 'amount', '2205', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', -2982844.00, 0.00, -86601.70, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71186, 0, 1, '2211', '应付职工薪酬', 'employee pay payable', 'liabilities', 'amount', '2211', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 269530.04, 0.00, 276235.82, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71187, 0, 1, '2221', '应交税费', 'tax payable', 'liabilities', 'amount', '2221', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 3150.26, 0.00, 1113.91, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71188, 0, 1, '2231', '应付股利', 'dividend payable', 'liabilities', 'amount', '2231', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71189, 0, 1, '2232', '应付利息', 'interest payable', 'liabilities', 'amount', '2232', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71190, 0, 1, '2241', '其他应付款', 'other account payable', 'liabilities', 'amount', '2241', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 19072742.19, 0.00, 14326071.05, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71191, 0, 1, '2411', '预计负债', 'estimated liabilities', 'liabilities', 'amount', '2411', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71192, 0, 1, '2501', '递延收益', 'deferred income', 'liabilities', 'amount', '2501', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71193, 0, 1, '2601', '长期借款', 'money borrowed for long term', 'liabilities', 'amount', '2601', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71194, 0, 1, '2602', '长期债券', 'long-term bond', 'liabilities', 'amount', '2602', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71195, 0, 1, '2801', '长期应付款', 'long-term account payable', 'liabilities', 'amount', '2801', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71196, 0, 1, '2802', '未确认融资费用', 'unacknowledged financial charges', 'liabilities', 'amount', '2802', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71197, 0, 1, '2811', '专项应付款', 'special accounts payable', 'liabilities', 'amount', '2811', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71198, 0, 1, '2901', '递延所得税负债', 'deferred income tax liabilities', 'liabilities', 'amount', '2901', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71199, 0, 1, '3101', '衍生工具', 'derivative tool', 'common', 'amount', '3101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71200, 0, 1, '3201', '套期工具', 'arbitrage tool', 'common', 'amount', '3201', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71201, 0, 1, '3202', '被套期项目', 'arbitrage project', 'common', 'amount', '3202', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71202, 0, 1, '4001', '实收资本', 'paid-up capital', 'ownership', 'amount', '4001', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71203, 0, 1, '4002', '资本公积', 'contributed surplus', 'ownership', 'amount', '4002', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71204, 0, 1, '4101', '盈余公积', 'earned surplus', 'ownership', 'amount', '4101', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71205, 0, 1, '4103', '本年利润', 'profit for the current year', 'ownership', 'amount', '4103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 7782323.59, 0.00, 6855513.05, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71206, 0, 1, '4104', '利润分配', 'allocation of profits', 'ownership', 'amount', '4104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71207, 0, 1, '4201', '库存股', 'treasury stock', 'ownership', 'amount', '4201', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71208, 0, 1, '5001', '生产成本', 'production cost', 'cost', 'amount', '5001', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71209, 0, 1, '5101', '制造费用', 'cost of production', 'cost', 'amount', '5101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71210, 0, 1, '5201', '劳务成本', 'service cost', 'cost', 'amount', '5201', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71211, 0, 1, '5301', '研发支出', 'research and development expenditures', 'cost', 'amount', '5301', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71212, 0, 1, '6001', '主营业务收入', 'main business income', 'profit', 'amount', '6001', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71213, 0, 1, '6011', '利息收入', 'interest income financial sharing', 'profit', 'amount', '6011', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71214, 0, 1, '6051', '其他业务收入', 'other business income', 'profit', 'amount', '6051', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71215, 0, 1, '6061', '禁用', 'exchange gain or loss exclusively for finance', 'profit', 'amount', '6061', 'CNY', 4, 'N', 'N', 'Y', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71216, 0, 1, '6101', '公允价值变动损益', 'sound value flexible loss and profit', 'profit', 'amount', '6101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71217, 0, 1, '6111', '投资收益', 'income on investment', 'profit', 'amount', '6111', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71218, 0, 1, '6301', '营业外收入', 'nonrevenue receipt', 'profit', 'amount', '6301', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71219, 0, 1, '6401', '主营业务成本', 'main business cost', 'profit', 'amount', '6401', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71220, 0, 1, '6402', '其他业务支出', 'other business expense', 'profit', 'amount', '6402', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71221, 0, 1, '6405', '营业税金及附加', 'business tariff and annex', 'profit', 'amount', '6405', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71222, 0, 1, '6411', '利息支出', 'interest expense financial sharing', 'profit', 'amount', '6411', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71223, 0, 1, '6601', '销售费用', 'marketing cost', 'profit', 'amount', '6601', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71224, 0, 1, '6602', '管理费用', 'managing cost', 'profit', 'amount', '6602', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71225, 0, 1, '6603', '财务费用', 'financial cost', 'profit', 'amount', '6603', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71226, 71225, 2, '660301', '损失', 'gains', 'profit', 'amount', '660301', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71227, 71225, 2, '660302', '利得', 'loss', 'profit', 'amount', '660302', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71228, 71225, 2, '660303', '汇兑损益', 'exchange gain or loss', 'profit', 'amount', '660303', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71229, 0, 1, '6604', '勘探费用', 'exploration expense', 'profit', 'amount', '6604', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71230, 0, 1, '6701', '资产减值损失', 'loss from asset devaluation', 'profit', 'amount', '6701', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71231, 0, 1, '6711', '营业外支出', 'nonoperating expense', 'profit', 'amount', '6711', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71232, 0, 1, '6801', '所得税', 'income tax', 'profit', 'amount', '6801', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71233, 0, 1, '6901', '以前年度损益调整', 'prior year profit and loss adjustment', 'profit', 'amount', '6901', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71234, 0, 1, '8801', '客户结算', 'client settlement obj', 'settlement', 'amount', '8801', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71235, 0, 1, '8802', '订舱代理结算', 'booking agent settlement obj', 'settlement', 'amount', '8802', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71236, 0, 1, '8803', '海外代理结算', 'overseas agent settlement obj', 'settlement', 'amount', '8803', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71237, 0, 1, '8804', '供应商结算', 'vender settlement obj', 'settlement', 'amount', '8804', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71238, 0, 1, '1001', '库存现金', 'cash on hand', 'asset', 'amount', '1001', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71239, 0, 1, '1002', '银行存款', 'bank deposit', 'asset', 'amount', '1002', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 10926856.09, 0.00, 5150970.18, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71240, 0, 1, '1015', '其他货币资金', 'other monetary capital', 'asset', 'amount', '1015', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71241, 0, 1, '1101', '交易性金融资产', 'transaction monetary assets', 'asset', 'amount', '1101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71242, 0, 1, '1121', '应收票据', 'notes receivable', 'asset', 'amount', '1121', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71243, 0, 1, '1122', '应收账款', 'account receivable', 'asset', 'amount', '1122', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 4983059.58, 0.00, 4046331.13, -2492.81, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71244, 0, 1, '1123', '预付账款', 'account prepaid', 'asset', 'amount', '1123', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 11503.16, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71245, 0, 1, '1131', '应收股利', 'dividend receivable', 'asset', 'amount', '1131', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71246, 0, 1, '1132', '应收利息', 'accrued interest receivable', 'asset', 'amount', '1132', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71247, 0, 1, '1231', '其他应收款', 'accounts receivable-others', 'asset', 'amount', '1231', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 22073122.53, 0.00, 25000838.72, -2236895.77, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71248, 0, 1, '1241', '坏账准备', 'had debts reserve', 'asset', 'amount', '1241', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71249, 0, 1, '1401', '材料采购', 'procurement of materials', 'asset', 'amount', '1401', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71250, 0, 1, '1402', '在途物资', 'materials in transit', 'asset', 'amount', '1402', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71251, 0, 1, '1403', '原材料', 'raw materials', 'asset', 'amount', '1403', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71252, 0, 1, '1406', '库存商品', 'commodity stocks', 'asset', 'amount', '1406', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71253, 0, 1, '1407', '发出商品', 'goods in transit', 'asset', 'amount', '1407', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71254, 0, 1, '1412', '包装物及低值易耗品', 'wrappage and low value and easily wornout articles', 'asset', 'amount', '1412', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71255, 0, 1, '1461', '存货跌价准备', 'reserve against stock price declining', 'asset', 'amount', '1461', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71256, 0, 1, '1521', '持有至到期投资', 'hold investment due', 'asset', 'amount', '1521', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71257, 0, 1, '1522', '持有至到期投资减值准备', 'hold investment due reduction reserve', 'asset', 'amount', '1522', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71258, 0, 1, '1523', '可供出售金融资产', 'financial assets available for sale', 'asset', 'amount', '1523', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71259, 0, 1, '1524', '长期股权投资', 'long-term stock ownership investment', 'asset', 'amount', '1524', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71260, 0, 1, '1525', '长期股权投资减值准备', 'long-term stock ownership investment reduction reserve', 'asset', 'amount', '1525', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71261, 0, 1, '1526', '投资性房地产', 'investment real eastate', 'asset', 'amount', '1526', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71262, 0, 1, '1531', '长期应收款', 'long-term account receivable', 'asset', 'amount', '1531', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71263, 0, 1, '1541', '未实现融资收益', 'unrealized financing income', 'asset', 'amount', '1541', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71264, 0, 1, '1601', '固定资产', 'permanent assets', 'asset', 'amount', '1601', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 22938.50, 0.00, 22938.50, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71265, 0, 1, '1602', '累计折旧', 'accumulated depreciation', 'asset', 'amount', '1602', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', -11208.84, 0.00, -8787.56, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71266, 0, 1, '1603', '固定资产减值准备permanent', 'assets reduction reserve', 'asset', 'amount', '1603', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71267, 0, 1, '1604', '在建工程', 'construction in process', 'asset', 'amount', '1604', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71268, 0, 1, '1605', '工程物资', 'engineer material', 'asset', 'amount', '1605', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71269, 0, 1, '1606', '固定资产清理', 'disposal of fixed assets', 'asset', 'amount', '1606', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71270, 0, 1, '1701', '无形资产', 'intangible assets', 'asset', 'amount', '1701', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71271, 0, 1, '1702', '累计摊销', 'accumulated amortization', 'asset', 'amount', '1702', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71272, 0, 1, '1703', '无形资产减值准备', 'intangible assets reduction reserve', 'asset', 'amount', '1703', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71273, 0, 1, '1711', '商誉', 'business reputation', 'asset', 'amount', '1711', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71274, 0, 1, '1801', '长期待摊费用', 'long-term deferred expenses', 'asset', 'amount', '1801', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71275, 0, 1, '1811', '递延所得税资产', 'deferred income tax assets', 'asset', 'amount', '1811', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71276, 0, 1, '1901', '待处理财产损溢', 'waiting assets profit and loss', 'asset', 'amount', '1901', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71277, 0, 1, '2001', '短期借款', 'short-term loan', 'liabilities', 'amount', '2001', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71278, 0, 1, '2101', '交易性金融负债', 'transaction financial liabilities', 'liabilities', 'amount', '2101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71279, 0, 1, '2201', '应付票据', 'notes payable', 'liabilities', 'amount', '2201', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71280, 0, 1, '2202', '应付账款', 'account payable', 'liabilities', 'amount', '2202', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 1642913.00, 0.00, 1934171.36, 12435.88, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71281, 0, 1, '2205', '预收账款', 'item received in advance', 'liabilities', 'amount', '2205', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 1561947.83, 0.00, 76280.23, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71282, 0, 1, '2211', '应付职工薪酬', 'employee pay payable', 'liabilities', 'amount', '2211', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 546206.19, 0.00, 525381.76, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71283, 0, 1, '2221', '应交税费', 'tax payable', 'liabilities', 'amount', '2221', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 5577.69, 0.00, 7381.09, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71284, 0, 1, '2231', '应付股利', 'dividend payable', 'liabilities', 'amount', '2231', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71285, 0, 1, '2232', '应付利息', 'interest payable', 'liabilities', 'amount', '2232', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71286, 0, 1, '2241', '其他应付款', 'other account payable', 'liabilities', 'amount', '2241', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 26732666.32, 0.00, 24964820.20, -243601.92, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71287, 0, 1, '2411', '预计负债', 'estimated liabilities', 'liabilities', 'amount', '2411', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71288, 0, 1, '2501', '递延收益', 'deferred income', 'liabilities', 'amount', '2501', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71289, 0, 1, '2601', '长期借款', 'money borrowed for long term', 'liabilities', 'amount', '2601', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71290, 0, 1, '2602', '长期债券', 'long-term bond', 'liabilities', 'amount', '2602', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71291, 0, 1, '2801', '长期应付款', 'long-term account payable', 'liabilities', 'amount', '2801', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71292, 0, 1, '2802', '未确认融资费用', 'unacknowledged financial charges', 'liabilities', 'amount', '2802', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71293, 0, 1, '2811', '专项应付款', 'special accounts payable', 'liabilities', 'amount', '2811', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71294, 0, 1, '2901', '递延所得税负债', 'deferred income tax liabilities', 'liabilities', 'amount', '2901', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71295, 0, 1, '3101', '衍生工具', 'derivative tool', 'common', 'amount', '3101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71296, 0, 1, '3201', '套期工具', 'arbitrage tool', 'common', 'amount', '3201', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71297, 0, 1, '3202', '被套期项目', 'arbitrage project', 'common', 'amount', '3202', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71298, 0, 1, '4001', '实收资本', 'paid-up capital', 'ownership', 'amount', '4001', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71299, 0, 1, '4002', '资本公积', 'contributed surplus', 'ownership', 'amount', '4002', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71300, 0, 1, '4101', '盈余公积', 'earned surplus', 'ownership', 'amount', '4101', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71301, 0, 1, '4103', '本年利润', 'profit for the current year', 'ownership', 'amount', '4103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 7521758.74, 0.00, 6709055.08, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71302, 0, 1, '4104', '利润分配', 'allocation of profits', 'ownership', 'amount', '4104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71303, 0, 1, '4201', '库存股', 'treasury stock', 'ownership', 'amount', '4201', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71304, 0, 1, '5001', '生产成本', 'production cost', 'cost', 'amount', '5001', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71305, 0, 1, '5101', '制造费用', 'cost of production', 'cost', 'amount', '5101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71306, 0, 1, '5201', '劳务成本', 'service cost', 'cost', 'amount', '5201', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71307, 0, 1, '5301', '研发支出', 'research and development expenditures', 'cost', 'amount', '5301', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71308, 0, 1, '6001', '主营业务收入', 'main business income', 'profit', 'amount', '6001', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71309, 0, 1, '6011', '利息收入', 'interest income financial sharing', 'profit', 'amount', '6011', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71310, 0, 1, '6051', '其他业务收入', 'other business income', 'profit', 'amount', '6051', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71311, 0, 1, '6061', '禁用', 'exchange gain or loss exclusively for finance', 'profit', 'amount', '6061', 'CNY', 2, 'N', 'N', 'Y', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71312, 0, 1, '6101', '公允价值变动损益', 'sound value flexible loss and profit', 'profit', 'amount', '6101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71313, 0, 1, '6111', '投资收益', 'income on investment', 'profit', 'amount', '6111', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71314, 0, 1, '6301', '营业外收入', 'nonrevenue receipt', 'profit', 'amount', '6301', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71315, 0, 1, '6401', '主营业务成本', 'main business cost', 'profit', 'amount', '6401', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 4798.75, 0.00, 4798.75, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71316, 0, 1, '6402', '其他业务支出', 'other business expense', 'profit', 'amount', '6402', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71317, 0, 1, '6405', '营业税金及附加', 'business tariff and annex', 'profit', 'amount', '6405', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71318, 0, 1, '6411', '利息支出', 'interest expense financial sharing', 'profit', 'amount', '6411', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71319, 0, 1, '6601', '销售费用', 'marketing cost', 'profit', 'amount', '6601', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71320, 0, 1, '6602', '管理费用', 'managing cost', 'profit', 'amount', '6602', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71321, 0, 1, '6603', '财务费用', 'financial cost', 'profit', 'amount', '6603', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71322, 71321, 2, '660301', '损失', 'gains', 'profit', 'amount', '660301', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71323, 71321, 2, '660302', '利得', 'loss', 'profit', 'amount', '660302', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71324, 71321, 2, '660303', '汇兑损益', 'exchange gain or loss', 'profit', 'amount', '660303', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71325, 0, 1, '6604', '勘探费用', 'exploration expense', 'profit', 'amount', '6604', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71326, 0, 1, '6701', '资产减值损失', 'loss from asset devaluation', 'profit', 'amount', '6701', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71327, 0, 1, '6711', '营业外支出', 'nonoperating expense', 'profit', 'amount', '6711', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71328, 0, 1, '6801', '所得税', 'income tax', 'profit', 'amount', '6801', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71329, 0, 1, '6901', '以前年度损益调整', 'prior year profit and loss adjustment', 'profit', 'amount', '6901', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71330, 0, 1, '8801', '客户结算', 'client settlement obj', 'settlement', 'amount', '8801', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71331, 0, 1, '8802', '订舱代理结算', 'booking agent settlement obj', 'settlement', 'amount', '8802', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71332, 0, 1, '8803', '海外代理结算', 'overseas agent settlement obj', 'settlement', 'amount', '8803', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71333, 0, 1, '8804', '供应商结算', 'vender settlement obj', 'settlement', 'amount', '8804', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71334, 0, 1, '1001', '库存现金', 'cash on hand', 'asset', 'amount', '1001', 'CNY', 1, 'N', 'Y', 'Y', 'Y', 'N', 15959.00, 0.00, 6602.00, 0.00, 6687246.02, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-11-04 18:07:48', '2023-11-04 18:07:48', 1);
INSERT INTO `fx_account_titles` VALUES (71335, 0, 1, '1002', '银行存款', 'bank deposit', 'asset', 'amount', '1002', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'N', 31789534.35, 0.00, 22716664.25, -1133930.68, 3532157.68, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71336, 0, 1, '1015', '其他货币资金', 'other monetary capital', 'asset', 'amount', '1015', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71337, 0, 1, '1101', '交易性金融资产', 'transaction monetary assets', 'asset', 'amount', '1101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 10700000.00, 0.00, 16462611.10, 0.00, 716886.40, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71338, 0, 1, '1121', '应收票据', 'notes receivable', 'asset', 'amount', '1121', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71339, 0, 1, '1122', '应收账款', 'account receivable', 'asset', 'amount', '1122', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', -386851.64, 0.00, 27045444.91, 926697.09, 30358751.72, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71340, 0, 1, '1123', '预付账款', 'account prepaid', 'asset', 'amount', '1123', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 2133899.53, 0.00, 4421111.68, -193785.83, 311643.94, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71341, 0, 1, '1131', '应收股利', 'dividend receivable', 'asset', 'amount', '1131', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71342, 0, 1, '1132', '应收利息', 'accrued interest receivable', 'asset', 'amount', '1132', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71343, 0, 1, '1231', '其他应收款', 'accounts receivable-others', 'asset', 'amount', '1231', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', -27373980.37, 0.00, -26434101.58, 1409271.93, 3237599.84, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71344, 0, 1, '1241', '坏账准备', 'had debts reserve', 'asset', 'amount', '1241', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 152761.63, 0.00, 152761.63, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71345, 0, 1, '1401', '材料采购', 'procurement of materials', 'asset', 'amount', '1401', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71346, 0, 1, '1402', '在途物资', 'materials in transit', 'asset', 'amount', '1402', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71347, 0, 1, '1403', '原材料', 'raw materials', 'asset', 'amount', '1403', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71348, 0, 1, '1406', '库存商品', 'commodity stocks', 'asset', 'amount', '1406', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 11268.22, 0.00, 86199.79, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71349, 0, 1, '1407', '发出商品', 'goods in transit', 'asset', 'amount', '1407', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71350, 0, 1, '1412', '包装物及低值易耗品', 'wrappage and low value and easily wornout articles', 'asset', 'amount', '1412', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 1056.00, 0.00, -300.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71351, 0, 1, '1461', '存货跌价准备', 'reserve against stock price declining', 'asset', 'amount', '1461', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71352, 0, 1, '1521', '持有至到期投资', 'hold investment due', 'asset', 'amount', '1521', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71353, 0, 1, '1522', '持有至到期投资减值准备', 'hold investment due reduction reserve', 'asset', 'amount', '1522', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71354, 0, 1, '1523', '可供出售金融资产', 'financial assets available for sale', 'asset', 'amount', '1523', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71355, 0, 1, '1524', '长期股权投资', 'long-term stock ownership investment', 'asset', 'amount', '1524', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71356, 0, 1, '1525', '长期股权投资减值准备', 'long-term stock ownership investment reduction reserve', 'asset', 'amount', '1525', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71357, 0, 1, '1526', '投资性房地产', 'investment real eastate', 'asset', 'amount', '1526', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71358, 0, 1, '1531', '长期应收款', 'long-term account receivable', 'asset', 'amount', '1531', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71359, 0, 1, '1541', '未实现融资收益', 'unrealized financing income', 'asset', 'amount', '1541', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71360, 0, 1, '1601', '固定资产', 'permanent assets', 'asset', 'amount', '1601', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 2396118.42, 0.00, 2341466.44, 0.00, 912285.41, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71361, 0, 1, '1602', '累计折旧', 'accumulated depreciation', 'asset', 'amount', '1602', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', -1193071.58, 0.00, -937079.64, 0.00, -443292.50, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71362, 0, 1, '1603', '固定资产减值准备permanent', 'assets reduction reserve', 'asset', 'amount', '1603', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71363, 0, 1, '1604', '在建工程', 'construction in process', 'asset', 'amount', '1604', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71364, 0, 1, '1605', '工程物资', 'engineer material', 'asset', 'amount', '1605', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71365, 0, 1, '1606', '固定资产清理', 'disposal of fixed assets', 'asset', 'amount', '1606', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71366, 0, 1, '1701', '无形资产', 'intangible assets', 'asset', 'amount', '1701', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71367, 0, 1, '1702', '累计摊销', 'accumulated amortization', 'asset', 'amount', '1702', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71368, 0, 1, '1703', '无形资产减值准备', 'intangible assets reduction reserve', 'asset', 'amount', '1703', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71369, 0, 1, '1711', '商誉', 'business reputation', 'asset', 'amount', '1711', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71370, 0, 1, '1801', '长期待摊费用', 'long-term deferred expenses', 'asset', 'amount', '1801', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 732178.30, 0.00, 540967.11, 0.00, 152727.45, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71371, 0, 1, '1811', '递延所得税资产', 'deferred income tax assets', 'asset', 'amount', '1811', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71372, 0, 1, '1901', '待处理财产损溢', 'waiting assets profit and loss', 'asset', 'amount', '1901', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71373, 0, 1, '2001', '短期借款', 'short-term loan', 'liabilities', 'amount', '2001', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 5000000.00, 0.00, 5000000.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71374, 0, 1, '2101', '交易性金融负债', 'transaction financial liabilities', 'liabilities', 'amount', '2101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71375, 0, 1, '2201', '应付票据', 'notes payable', 'liabilities', 'amount', '2201', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71376, 0, 1, '2202', '应付账款', 'account payable', 'liabilities', 'amount', '2202', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 5305644.55, 0.00, 10623834.25, 159312.51, 10465197.07, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71377, 0, 1, '2205', '预收账款', 'item received in advance', 'liabilities', 'amount', '2205', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 4518221.10, 0.00, 1318008.43, -34477.19, 1972420.62, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71378, 0, 1, '2211', '应付职工薪酬', 'employee pay payable', 'liabilities', 'amount', '2211', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 2799243.84, 0.00, 2505235.66, 0.00, 840265.15, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71379, 0, 1, '2221', '应交税费', 'tax payable', 'liabilities', 'amount', '2221', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 47096.03, 0.00, 71735.98, 0.00, 138313.07, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71380, 0, 1, '2231', '应付股利', 'dividend payable', 'liabilities', 'amount', '2231', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71381, 0, 1, '2232', '应付利息', 'interest payable', 'liabilities', 'amount', '2232', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71382, 0, 1, '2241', '其他应付款', 'other account payable', 'liabilities', 'amount', '2241', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', -45234383.07, 0.00, -37024977.60, 1377700.30, 182115.75, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71383, 0, 1, '2411', '预计负债', 'estimated liabilities', 'liabilities', 'amount', '2411', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71384, 0, 1, '2501', '递延收益', 'deferred income', 'liabilities', 'amount', '2501', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71385, 0, 1, '2601', '长期借款', 'money borrowed for long term', 'liabilities', 'amount', '2601', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71386, 0, 1, '2602', '长期债券', 'long-term bond', 'liabilities', 'amount', '2602', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71387, 0, 1, '2801', '长期应付款', 'long-term account payable', 'liabilities', 'amount', '2801', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71388, 0, 1, '2802', '未确认融资费用', 'unacknowledged financial charges', 'liabilities', 'amount', '2802', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71389, 0, 1, '2811', '专项应付款', 'special accounts payable', 'liabilities', 'amount', '2811', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71390, 0, 1, '2901', '递延所得税负债', 'deferred income tax liabilities', 'liabilities', 'amount', '2901', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71391, 0, 1, '3101', '衍生工具', 'derivative tool', 'common', 'amount', '3101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71392, 0, 1, '3201', '套期工具', 'arbitrage tool', 'common', 'amount', '3201', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71393, 0, 1, '3202', '被套期项目', 'arbitrage project', 'common', 'amount', '3202', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71394, 0, 1, '4001', '实收资本', 'paid-up capital', 'ownership', 'amount', '4001', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 2600000.00, 0.00, 2600000.00, 0.00, 1000000.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71395, 0, 1, '4002', '资本公积', 'contributed surplus', 'ownership', 'amount', '4002', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71396, 0, 1, '4101', '盈余公积', 'earned surplus', 'ownership', 'amount', '4101', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71397, 0, 1, '4103', '本年利润', 'profit for the current year', 'ownership', 'amount', '4103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 13075355.11, 0.00, 30440816.67, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71398, 0, 1, '4104', '利润分配', 'allocation of profits', 'ownership', 'amount', '4104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 30867694.30, 0.00, 30867694.30, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71399, 0, 1, '4201', '库存股', 'treasury stock', 'ownership', 'amount', '4201', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71400, 0, 1, '5001', '生产成本', 'production cost', 'cost', 'amount', '5001', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71401, 0, 1, '5101', '制造费用', 'cost of production', 'cost', 'amount', '5101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71402, 0, 1, '5201', '劳务成本', 'service cost', 'cost', 'amount', '5201', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71403, 0, 1, '5301', '研发支出', 'research and development expenditures', 'cost', 'amount', '5301', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71404, 0, 1, '6001', '主营业务收入', 'main business income', 'profit', 'amount', '6001', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71405, 0, 1, '6011', '利息收入', 'interest income financial sharing', 'profit', 'amount', '6011', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71406, 0, 1, '6051', '其他业务收入', 'other business income', 'profit', 'amount', '6051', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71407, 0, 1, '6061', '禁用', 'exchange gain or loss exclusively for finance', 'profit', 'amount', '6061', 'CNY', 1, 'N', 'N', 'Y', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71408, 0, 1, '6101', '公允价值变动损益', 'sound value flexible loss and profit', 'profit', 'amount', '6101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71409, 0, 1, '6111', '投资收益', 'income on investment', 'profit', 'amount', '6111', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71410, 0, 1, '6301', '营业外收入', 'nonrevenue receipt', 'profit', 'amount', '6301', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71411, 0, 1, '6401', '主营业务成本', 'main business cost', 'profit', 'amount', '6401', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71412, 0, 1, '6402', '其他业务支出', 'other business expense', 'profit', 'amount', '6402', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71413, 0, 1, '6405', '营业税金及附加', 'business tariff and annex', 'profit', 'amount', '6405', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71414, 0, 1, '6411', '利息支出', 'interest expense financial sharing', 'profit', 'amount', '6411', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71415, 0, 1, '6601', '销售费用', 'marketing cost', 'profit', 'amount', '6601', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71416, 0, 1, '6602', '管理费用', 'managing cost', 'profit', 'amount', '6602', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71417, 0, 1, '6603', '财务费用', 'financial cost', 'profit', 'amount', '6603', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71418, 71417, 2, '660301', '损失', 'gains', 'profit', 'amount', '660301', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71419, 71417, 2, '660302', '利得', 'loss', 'profit', 'amount', '660302', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71420, 71417, 2, '660303', '汇兑损益', 'exchange gain or loss', 'profit', 'amount', '660303', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71421, 0, 1, '6604', '勘探费用', 'exploration expense', 'profit', 'amount', '6604', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71422, 0, 1, '6701', '资产减值损失', 'loss from asset devaluation', 'profit', 'amount', '6701', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71423, 0, 1, '6711', '营业外支出', 'nonoperating expense', 'profit', 'amount', '6711', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71424, 0, 1, '6801', '所得税', 'income tax', 'profit', 'amount', '6801', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71425, 0, 1, '6901', '以前年度损益调整', 'prior year profit and loss adjustment', 'profit', 'amount', '6901', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71426, 0, 1, '8801', '客户结算', 'client settlement obj', 'settlement', 'amount', '8801', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71427, 0, 1, '8802', '订舱代理结算', 'booking agent settlement obj', 'settlement', 'amount', '8802', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71428, 0, 1, '8803', '海外代理结算', 'overseas agent settlement obj', 'settlement', 'amount', '8803', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (71429, 0, 1, '8804', '供应商结算', 'vender settlement obj', 'settlement', 'amount', '8804', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72156, 71339, 2, '1122CN', 'CNY', 'RMB', 'asset', 'amount', '1122CN', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 7850128.37, 0.00, 35363904.10, 0.00, 30358751.72, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72489, 71334, 2, '100101', '现金', 'Shenzhen RQ International Logistics Co.,Ltd', 'asset', 'amount', '100101', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 15959.00, 0.00, 6602.00, 0.00, 6687246.02, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72490, 71335, 2, '100201', '瑞秋物流中国银行', 'Shenzhen RQ International Logistics Co.,Ltd', 'asset', 'amount', '100201', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'N', 70097.21, 0.00, 71703.23, -7765.57, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72494, 72490, 3, '1002010001', '瑞秋物流中国银行--USD', '美元', 'asset', 'currencyAmount', '10020101', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 11219.09, 1547.46, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72495, 72490, 3, '1002010002', '瑞秋物流中国银行--GBP', '英镑', 'asset', 'currencyAmount', '10020102', 'GBP', 1, 'Y', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 53.73, 6.14, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72497, 72490, 3, '1002010004', '瑞秋物流中国银行--HKD', '港币', 'asset', 'currencyAmount', '10020104', 'HKD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72499, 72490, 3, '1002010005', '瑞秋物流中国银行--CNY', '人民币', 'asset', 'amount', '10020105', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 58878.12, 0.00, 71649.50, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72500, 71337, 2, '110101', '中国工商银行理财', NULL, 'asset', 'amount', '110101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72501, 71337, 2, '110102', '中国银行理财', NULL, 'asset', 'amount', '110102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 716886.40, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72502, 71335, 2, '100202', '瑞秋物流支付宝', NULL, 'asset', 'amount', '100202', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 246488.29, 0.00, 38567.41, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72503, 71335, 2, '100203', '瑞秋物流工行', NULL, 'asset', 'amount', '100203', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 639478.75, 0.00, 5258.43, 0.00, 3532157.68, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72504, 71335, 2, '100204', '香港汇丰银行', NULL, 'asset', 'amount', '100204', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'N', 6565239.89, 0.00, 9367470.12, -980923.36, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72505, 72504, 3, '1002040001', '香港汇丰银行--USD', 'USD', 'asset', 'currencyAmount', '10020401', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 3795461.28, 523511.90, 6643531.81, 913828.31, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72506, 72504, 3, '1002040002', '香港汇丰银行--GBP', 'GBP', 'asset', 'currencyAmount', '10020402', 'GBP', 1, 'Y', 'Y', 'N', 'Y', 'Y', 62789.24, 6992.12, 22054.20, 2520.48, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72507, 72504, 3, '1002040003', '香港汇丰银行--EUR', 'EUR', 'asset', 'currencyAmount', '10020403', 'EUR', 1, 'Y', 'Y', 'N', 'Y', 'Y', 55402.92, 7158.00, 266453.55, 35198.62, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72508, 72504, 3, '1002040004', '香港汇丰银行--HKD', 'HKD', 'asset', 'currencyAmount', '10020404', 'HKD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 30528.98, 28800.92, 87182.84, 82247.96, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72510, 71335, 2, '100205', '美国银行-USD（2509）', NULL, 'asset', 'currencyAmount', '100205', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 510892.71, 70467.96, 272896.53, 37537.35, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72511, 71142, 2, '100101', '现金', 'Shenzhen RQ International Logistics Co.,Ltd', 'asset', 'amount', '100101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72512, 71145, 2, '110101', '中国工商银行理财', NULL, 'asset', 'amount', '110101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72513, 71145, 2, '110102', '中国银行理财', NULL, 'asset', 'amount', '110102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 1190466.19, 0.00, 1190466.19, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72514, 71147, 2, '1122CN', 'CNY', 'RMB', 'asset', 'amount', '1122CN', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 2553278.23, 0.00, 2549729.73, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72515, 71238, 2, '100101', '现金', 'Shenzhen RQ International Logistics Co.,Ltd', 'asset', 'amount', '100101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72516, 71241, 2, '110101', '中国工商银行理财', NULL, 'asset', 'amount', '110101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72517, 71241, 2, '110102', '中国银行理财', NULL, 'asset', 'amount', '110102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72518, 71243, 2, '1122CN', 'CNY', 'RMB', 'asset', 'amount', '1122CN', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 4983059.58, 0.00, 4028208.40, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72522, 71340, 2, '112301', '供应商往来-USD', 'USD', 'asset', 'currencyAmount', '112301', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 850454.00, 117304.00, 2392346.53, 329071.05, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72523, 71340, 2, '112302', '供应商往来-GBP', 'GBP', 'asset', 'currencyAmount', '112302', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', 385794.00, 42961.47, 334441.89, 38221.93, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72542, 71339, 2, '1122GB', 'GBP', 'GBP', 'asset', 'currencyAmount', '1122GB', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', -800460.77, -89138.17, -782876.94, -89471.65, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72549, 71376, 2, '2202US', 'USD', 'USD', 'liabilities', 'currencyAmount', '2202US', 'USD', 1, 'Y', 'N', 'N', 'N', 'Y', -2090833.37, -288390.81, -4091074.22, -562733.73, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72550, 71376, 2, '2202CN', 'CNY', 'RMB', 'liabilities', 'amount', '2202CN', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 8247099.52, 0.00, 15940912.77, 0.00, 10465197.07, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72572, 71339, 2, '1122US', 'USD', 'USD', 'asset', 'currencyAmount', '1122US', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', -7109838.22, -980667.34, -7217387.96, -992763.13, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72604, 71147, 2, '1122GB', 'GBP', 'GBP', 'asset', 'currencyAmount', '1122GB', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 20908.18, 2414.34, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72605, 71147, 2, '1122US', 'USD', 'USD', 'asset', 'currencyAmount', '1122US', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 99505.83, 14174.62, 13471.38, 1853.01, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72606, 71148, 2, '112301', '供应商往来-USD', 'USD', 'asset', 'currencyAmount', '112301', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72607, 71148, 2, '112302', '供应商往来-GBP', 'GBP', 'asset', 'currencyAmount', '112302', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72608, 71184, 2, '2202CN', 'CNY', 'RMB', 'liabilities', 'amount', '2202CN', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 1094815.97, 0.00, 1398853.26, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72609, 71184, 2, '2202US', 'USD', 'USD', 'liabilities', 'currencyAmount', '2202US', 'USD', 4, 'Y', 'N', 'N', 'N', 'Y', 147667.31, 21035.23, 116808.33, 16067.17, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72610, 71243, 2, '1122GB', 'GBP', 'GBP', 'asset', 'currencyAmount', '1122GB', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72611, 71243, 2, '1122US', 'USD', 'USD', 'asset', 'currencyAmount', '1122US', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 18122.73, 2492.81, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72612, 71244, 2, '112301', '供应商往来-USD', 'USD', 'asset', 'currencyAmount', '112301', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72613, 71244, 2, '112302', '供应商往来-GBP', 'GBP', 'asset', 'currencyAmount', '112302', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72614, 71280, 2, '2202CN', 'CNY', 'RMB', 'liabilities', 'amount', '2202CN', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 1529192.11, 0.00, 1901648.51, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72615, 71280, 2, '2202US', 'USD', 'USD', 'liabilities', 'currencyAmount', '2202US', 'USD', 2, 'Y', 'N', 'N', 'N', 'Y', 106119.09, 15116.68, 30304.92, 4168.49, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72747, 71335, 2, '100206', '微信账户-夏秋菊', NULL, 'asset', 'amount', '100206', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 325842.59, 0.00, 85375.65, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72748, 71335, 2, '100207', '支付宝-夏秋菊', NULL, 'asset', 'amount', '100207', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72749, 71335, 2, '100208', '民生银行-夏秋菊', NULL, 'asset', 'amount', '100208', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 15659046.26, 0.00, 12233220.91, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72825, 71376, 2, '2202HK', 'HKD', 'HKD', 'liabilities', 'currencyAmount', '2202HK', 'HKD', 1, 'Y', 'N', 'N', 'N', 'Y', -50890.84, -48010.23, -50890.84, -48010.23, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72846, 71339, 2, '1122HK', 'HKD', 'HKD', 'asset', 'currencyAmount', '1122HK', 'HKD', 1, 'Y', 'Y', 'N', 'N', 'Y', -4045.27, -3816.29, -4045.27, -3816.29, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72848, 71339, 2, '1122EU', 'EUR', 'EUR', 'asset', 'currencyAmount', '1122EUR', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', -319262.69, -41248.41, -314149.02, -41499.21, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72853, 71360, 2, '160101', '办公设备', '办公设备', 'asset', 'amount', '160101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 482578.76, 0.00, 446794.78, 0.00, 912285.41, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72855, 71360, 2, '160102', '操作设备', '操作设备', 'asset', 'amount', '160102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 103936.00, 0.00, 92466.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72857, 71360, 2, '160103', '电子设备', '电子设备', 'asset', 'amount', '160103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 77794.86, 0.00, 70396.86, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72858, 71360, 2, '160104', '运输设备', '运输设备', 'asset', 'amount', '160104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 1731808.80, 0.00, 1731808.80, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72860, 71361, 2, '160201', '办公设备', '办公设备', 'asset', 'amount', '160201', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', -296269.24, 0.00, -240733.67, 0.00, -443292.50, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72861, 71361, 2, '160202', '操作设备', '操作设备', 'asset', 'amount', '160202', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', -79595.91, 0.00, -70407.33, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72863, 71361, 2, '160203', '电子设备', '电子设备', 'asset', 'amount', '160203', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', -59117.57, 0.00, -54712.01, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72864, 71361, 2, '160204', '运输设备', '运输设备', 'asset', 'amount', '160204', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', -758088.86, 0.00, -571226.63, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72865, 71376, 2, '2202GB', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '2202GB', 'GBP', 1, 'Y', 'N', 'N', 'N', 'Y', -951741.53, -105984.58, -982800.26, -112320.03, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72866, 71376, 2, '2202EU', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '2202EU', 'EUR', 1, 'Y', 'N', 'N', 'N', 'Y', 127394.52, 16459.24, -192313.20, -25404.65, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72876, 71378, 2, '221101', '职工工资、奖金、津贴、补贴', '职工工资、奖金、津贴、补贴', 'liabilities', 'amount', '221101', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 2855660.51, 0.00, 2561652.33, 0.00, 840265.15, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72878, 72876, 3, '2211010001', '职工工资', '职工工资', 'liabilities', 'amount', '22110101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 797026.87, 0.00, -320574.59, 0.00, 840265.15, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72879, 72876, 3, '2211010002', '奖金', '奖金', 'liabilities', 'amount', '22110102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 2058633.64, 0.00, 2882226.92, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72880, 72876, 3, '2211010003', '津贴', '津贴', 'liabilities', 'amount', '22110103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72882, 72876, 3, '2211010004', '补贴', '补贴', 'liabilities', 'amount', '22110104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72883, 71378, 2, '221102', '五险一金', '五险一金', 'liabilities', 'amount', '221102', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72884, 72883, 3, '2211020001', '社会保险费', '社会保险费', 'liabilities', 'amount', '22110201', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72885, 72883, 3, '2211020002', '公积金', '公积金', 'liabilities', 'amount', '22110202', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72886, 71378, 2, '221103', '工会经费与职工教育经费', '工会经费与职工教育经费', 'liabilities', 'amount', '221103', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72887, 72886, 3, '2211030001', '工会经费', '工会经费', 'liabilities', 'amount', '22110301', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72888, 72886, 3, '2211030002', '职工教育经费', '职工教育经费', 'liabilities', 'amount', '22110302', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72889, 71378, 2, '221104', '辞退福利', '辞退福利', 'liabilities', 'amount', '221104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', -56416.67, 0.00, -56416.67, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72890, 71379, 2, '222101', '应交增值税', '应交增值税', 'liabilities', 'amount', '222101', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 707.93, 0.00, -972.97, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72891, 72890, 3, '2221010001', '进项税额', '进项税额', 'liabilities', 'amount', '22210101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72892, 72890, 3, '2221010002', '销项税额抵减', '销项税额抵减', 'liabilities', 'amount', '22210102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72893, 72890, 3, '2221010003', '已交税金', '已交税金', 'liabilities', 'amount', '22210103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72894, 72890, 3, '2221010004', '减免税款', '减免税款', 'liabilities', 'amount', '22210104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72895, 72890, 3, '2221010005', '出口抵减内销产品应纳税额', '出口抵减内销产品应纳税额', 'liabilities', 'amount', '22210105', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72896, 72890, 3, '2221010006', '转出未交增值税', '转出未交增值税', 'liabilities', 'amount', '22210106', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72897, 72890, 3, '2221010007', '销项税额', '销项税额', 'liabilities', 'amount', '22210107', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 707.93, 0.00, -972.97, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72898, 72890, 3, '2221010008', '出口退税', '出口退税', 'liabilities', 'amount', '22210108', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72899, 72890, 3, '2221010009', '进项税额转出', '进项税额转出', 'liabilities', 'amount', '22210109', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72900, 72890, 3, '2221010010', '转出多交增值税', '转出多交增值税', 'liabilities', 'amount', '22210110', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72901, 71379, 2, '222102', '应交企业所得税', '应交企业所得税', 'liabilities', 'amount', '222102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72902, 71379, 2, '222103', '应交城市维护建设税', '应交城市维护建设税', 'liabilities', 'amount', '222103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', -1.63, 0.00, -1.63, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72903, 71379, 2, '222104', '应交教育费附加', '应交教育费附加', 'liabilities', 'amount', '222104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', -1.17, 0.00, -1.17, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72904, 71379, 2, '222105', '应交个人所得税', '应交个人所得税', 'liabilities', 'amount', '222105', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 46390.90, 0.00, 72711.75, 0.00, 138313.07, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72905, 71382, 2, '224101', '应付职员', '应付职员', 'liabilities', 'amount', '224101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 630000.00, 0.00, 934496.00, 0.00, 182115.75, 0.00, 'N', 'Y', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72906, 71382, 2, '224102', '应付供应商', '应付供应商', 'liabilities', 'amount', '224102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 1734.30, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72907, 71395, 2, '400201', '资本溢价', '资本溢价', 'ownership', 'amount', '400201', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72908, 71395, 2, '400202', '股本溢价', '股本溢价', 'ownership', 'amount', '400202', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72909, 71395, 2, '400203', '其他资本公积', '其他资本公积', 'ownership', 'amount', '400203', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72910, 71396, 2, '410101', '法定盈余公积', '法定盈余公积', 'ownership', 'amount', '410101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72911, 71396, 2, '410102', '任意盈余公积', '任意盈余公积', 'ownership', 'amount', '410102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72912, 71396, 2, '410103', '法定公益金', '法定公益金', 'ownership', 'amount', '410103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72913, 71396, 2, '410104', '储备基金', '储备基金', 'ownership', 'amount', '410104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72914, 71396, 2, '410105', '企业发展基金', '企业发展基金', 'ownership', 'amount', '410105', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72917, 71410, 2, '630101', '低值品盘盈', '低值品盘盈', 'profit', 'amount', '630101', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72919, 71410, 2, '630102', '固定资产盘盈', '固定资产盘盈', 'profit', 'amount', '630102', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72922, 71410, 2, '630103', '处置固定资产净收益', '处置固定资产净收益', 'profit', 'amount', '630103', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72923, 71410, 2, '630104', '非货币性交易收益', '非货币性交易收益', 'profit', 'amount', '630104', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72924, 71410, 2, '630105', '债务重组利得', '债务重组利得', 'profit', 'amount', '630105', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72925, 71410, 2, '630106', '政府补助', '政府补助', 'profit', 'amount', '630106', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72926, 71410, 2, '630107', '捐赠所得', '捐赠所得', 'profit', 'amount', '630107', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72927, 71410, 2, '630199', '其他', '其他', 'profit', 'amount', '630199', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72934, 71413, 2, '640501', '城市维护建设税', '城市维护建设税', 'profit', 'amount', '640501', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72935, 71413, 2, '640502', '教育费附加', '教育费附加', 'profit', 'amount', '640502', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72936, 71413, 2, '640503', '地方教育费附加', '地方教育费附加', 'profit', 'amount', '640303', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72937, 71413, 2, '640504', '印花税', '印花税', 'profit', 'amount', '640504', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72938, 71415, 2, '660101', '职工薪酬', '职工薪酬', 'profit', 'amount', '660101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72939, 72938, 3, '6601010001', '职工工资', '职工工资', 'profit', 'amount', '66010101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72940, 72938, 3, '6601010002', '职工福利费', '职工福利费', 'profit', 'amount', '66010102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72941, 72938, 3, '6601010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66010103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72942, 72938, 3, '6601010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66010104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72943, 72938, 3, '6601010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66010105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72944, 72938, 3, '6601010006', '工会经费', '工会经费', 'profit', 'amount', '66010106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72945, 72938, 3, '6601010007', '社会保险费', '社会保险费', 'profit', 'amount', '66010107', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72946, 72938, 3, '6601010008', '住房公积金', '住房公积金', 'profit', 'amount', '66010108', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72947, 72938, 3, '6601010009', '奖金', '奖金', 'profit', 'amount', '66010109', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72948, 72938, 3, '6601010010', '其他', '其他', 'profit', 'amount', '66010110', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72949, 71415, 2, '660102', '房租', '房租', 'profit', 'amount', '660102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72950, 71415, 2, '660103', '水电费', '水电费', 'profit', 'amount', '660103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72951, 71415, 2, '660104', '物业管理费', '物业管理费', 'profit', 'amount', '660104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72952, 71415, 2, '660105', '广告费', '广告费', 'profit', 'amount', '660105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72953, 71415, 2, '660106', '业务宣传费', '业务宣传费', 'profit', 'amount', '660106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72954, 71415, 2, '660107', '业务招待费', '业务招待费', 'profit', 'amount', '660107', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72955, 71415, 2, '660108', '折旧费', '折旧费', 'profit', 'amount', '660108', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72956, 71415, 2, '660109', '修理费', '修理费', 'profit', 'amount', '660109', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72957, 71415, 2, '660110', '运输费', '运输费', 'profit', 'amount', '660110', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72958, 71415, 2, '660111', '保险费', '保险费', 'profit', 'amount', '660111', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72959, 71415, 2, '660112', '装卸费', '装卸费', 'profit', 'amount', '660112', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72960, 71415, 2, '660113', '包装费', '包装费', 'profit', 'amount', '660113', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72961, 71415, 2, '660114', '低值易耗品', '低值易耗品', 'profit', 'amount', '660114', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72962, 71415, 2, '660115', '办公费', '办公费', 'profit', 'amount', '660115', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72963, 72962, 3, '6601150001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66011501', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72964, 72962, 3, '6601150002', '书报资料费', '书报资料费', 'profit', 'amount', '66011502', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72965, 72962, 3, '6601150003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66011503', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72968, 71415, 2, '660116', '快递费', '快递费', 'profit', 'amount', '660116', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72969, 71415, 2, '660117', '差旅费', '差旅费', 'profit', 'amount', '660117', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72970, 72969, 3, '6601170001', '交通费', '交通费', 'profit', 'amount', '66011701', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72971, 72969, 3, '6601170002', '住宿费', '住宿费', 'profit', 'amount', '66011702', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72972, 72969, 3, '6601170003', '出差补助', '出差补助', 'profit', 'amount', '66011703', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72973, 71415, 2, '660118', '市内交通费', '市内交通费', 'profit', 'amount', '660118', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72974, 71415, 2, '660119', '通信费', '通信费', 'profit', 'amount', '660119', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72975, 71415, 2, '660120', '业务提成/佣金', '业务提成/佣金', 'profit', 'amount', '660120', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72976, 71415, 2, '660121', '车辆费', '车辆费', 'profit', 'amount', '660121', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72977, 72976, 3, '6601210001', '加油费', '加油费', 'profit', 'amount', '66012101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72978, 72976, 3, '6601210002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66012102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72979, 72976, 3, '6601210003', '维修保养费', '维修保养费', 'profit', 'amount', '66012103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72980, 72976, 3, '6601210004', '保险费', '保险费', 'profit', 'amount', '66012104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72981, 72976, 3, '6601210005', '其他', '其他', 'profit', 'amount', '66012105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72982, 71415, 2, '660122', '销售折让', '销售折让', 'profit', 'amount', '660122', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72983, 71415, 2, '660199', '其他', '其他', 'profit', 'amount', '660199', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72987, 71416, 2, '660201', '职工薪酬', '职工薪酬', 'profit', 'amount', '660201', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72988, 72987, 3, '6602010001', '职工工资', '职工工资', 'profit', 'amount', '66020101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72989, 72987, 3, '6602010002', '职工福利费', '职工福利费', 'profit', 'amount', '66020102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72990, 72987, 3, '6602010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66020103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72991, 72987, 3, '6602010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66020104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72992, 72987, 3, '6602010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66020105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72993, 72987, 3, '6602010006', '工会经费', '工会经费', 'profit', 'amount', '66020106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72994, 72987, 3, '6602010007', '社会保险费', '社会保险费', 'profit', 'amount', '66020107', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72995, 72987, 3, '6602010008', '住房公积金', '住房公积金', 'profit', 'amount', '66020108', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72996, 72987, 3, '6602010009', '奖金', '奖金', 'profit', 'amount', '66020109', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72997, 72987, 3, '6602010010', '其他', '其他', 'profit', 'amount', '66020110', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72998, 71416, 2, '660202', '房租', '房租', 'profit', 'amount', '660202', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (72999, 71416, 2, '660203', '水电费', '水电费', 'profit', 'amount', '660203', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73000, 71416, 2, '660204', '物业管理费', '物业管理费', 'profit', 'amount', '660204', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73001, 71416, 2, '660205', '业务招待费', '业务招待费', 'profit', 'amount', '660205', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73002, 71416, 2, '660206', '折旧费', '折旧费', 'profit', 'amount', '660206', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73003, 71416, 2, '660207', '修理费', '修理费', 'profit', 'amount', '660207', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73004, 71416, 2, '660208', '低值易耗品', '低值易耗品', 'profit', 'amount', '660208', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73005, 71416, 2, '660209', '办公费', '办公费', 'profit', 'amount', '660209', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73006, 73005, 3, '6602090001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66020901', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73007, 73005, 3, '6602090002', '书报资料费', '书报资料费', 'profit', 'amount', '66020902', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73008, 73005, 3, '6602090003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66020903', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73009, 73005, 3, '6602090004', '办公用品租赁费', '办公用品租赁费', 'profit', 'amount', '66020904', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73010, 71416, 2, '660210', '快递费', '快递费', 'profit', 'amount', '660210', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73011, 71416, 2, '660211', '差旅费', '差旅费', 'profit', 'amount', '660211', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73014, 73011, 3, '6602110001', '交通费', '交通费', 'profit', 'amount', '66021101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73015, 73011, 3, '6602110002', '住宿费', '住宿费', 'profit', 'amount', '66021102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73016, 73011, 3, '6602110003', '出差补助', '出差补助', 'profit', 'amount', '66021103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73030, 71416, 2, '660212', '市内交通费', '市内交通费', 'profit', 'amount', '660212', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73033, 71416, 2, '660213', '通信费', '通信费', 'profit', 'amount', '660213', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73034, 73033, 3, '6602130001', '移动通讯费', '移动通讯费', 'profit', 'amount', '66021301', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73036, 73033, 3, '6602130002', '网络通讯费', '网络通讯费', 'profit', 'amount', '66021302', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73038, 71416, 2, '660214', '车辆费', '车辆费', 'profit', 'amount', '660214', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73041, 73038, 3, '6602140001', '加油费', '加油费', 'profit', 'amount', '66021401', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73042, 73038, 3, '6602140002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66021402', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73043, 73038, 3, '6602140003', '维修保养费', '维修保养费', 'profit', 'amount', '66021403', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73045, 73038, 3, '6602140004', '保险费', '保险费', 'profit', 'amount', '66021404', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73047, 73038, 3, '6602140005', '其他', '其他', 'profit', 'amount', '66021405', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73050, 71416, 2, '660215', '中介服务费', '中介服务费', 'profit', 'amount', '660215', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73052, 73050, 3, '6602150001', '审计费', '审计费', 'profit', 'amount', '66021501', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73054, 73050, 3, '6602150002', '诉讼费', '诉讼费', 'profit', 'amount', '66021502', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73056, 73050, 3, '6602150003', '评估费', '评估费', 'profit', 'amount', '66021503', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73058, 73050, 3, '6602150004', '技术咨询费', '技术咨询费', 'profit', 'amount', '66021504', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73059, 73050, 3, '6602150005', '认证费', '认证费', 'profit', 'amount', '66021505', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73060, 73050, 3, '6602150006', '专利费', '专利费', 'profit', 'amount', '66021506', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73061, 73050, 3, '6602150007', '会员费', '会员费', 'profit', 'amount', '66021507', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73062, 73050, 3, '6602150008', '其他', '其他', 'profit', 'amount', '66021508', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73064, 71416, 2, '660220', '冻结', '冻结', 'profit', 'amount', '660220', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73069, 71416, 2, '660299', '其他', '其他', 'profit', 'amount', '660299', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73070, 71423, 2, '671101', '赔付支出', '赔付支出', 'profit', 'amount', '671101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73071, 71423, 2, '671102', '处理固定资产净损失', '处理固定资产净损失', 'profit', 'amount', '671102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73072, 71423, 2, '671103', '捐赠支出', '捐赠支出', 'profit', 'amount', '671103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73073, 71423, 2, '671104', '固定资产盘亏', '固定资产盘亏', 'profit', 'amount', '671104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73074, 71423, 2, '671105', '非常损失', '非常损失', 'profit', 'amount', '671105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73075, 71423, 2, '671106', '出售无形资产损失', '出售无形资产损失', 'profit', 'amount', '671106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73076, 71423, 2, '671107', '债务重组损失', '债务重组损失', 'profit', 'amount', '671107', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73077, 71423, 2, '671108', '固定资产减值准备', '固定资产减值准备', 'profit', 'amount', '671108', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73078, 71423, 2, '671109', '无形资产减值准备', '无形资产减值准备', 'profit', 'amount', '671109', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73079, 71423, 2, '671110', '在建工程减值准备', '在建工程减值准备', 'profit', 'amount', '671110', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73080, 71423, 2, '671199', '其他', '其他', 'profit', 'amount', '671199', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73081, 71424, 2, '680101', '当期所得税费用', '当期所得税费用', 'profit', 'amount', '680101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73083, 71424, 2, '680102', '递延所得税费用', '递延所得税费用', 'profit', 'amount', '680102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73084, 71147, 2, '1122EU', 'EUR', 'EUR', 'asset', 'currencyAmount', '1122EUR', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 559499.36, 73232.90, 530996.29, 70144.82, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73085, 71147, 2, '1122HK', 'HKD', 'HKD', 'asset', 'currencyAmount', '1122HK', 'HKD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73086, 71168, 2, '160101', '办公设备', '办公设备', 'asset', 'amount', '160101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73087, 71168, 2, '160102', '操作设备', '操作设备', 'asset', 'amount', '160102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73088, 71168, 2, '160103', '电子设备', '电子设备', 'asset', 'amount', '160103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73089, 71168, 2, '160104', '运输设备', '运输设备', 'asset', 'amount', '160104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73090, 71169, 2, '160201', '办公设备', '办公设备', 'asset', 'amount', '160201', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73091, 71169, 2, '160202', '操作设备', '操作设备', 'asset', 'amount', '160202', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73092, 71169, 2, '160203', '电子设备', '电子设备', 'asset', 'amount', '160203', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73093, 71169, 2, '160204', '运输设备', '运输设备', 'asset', 'amount', '160204', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73094, 71184, 2, '2202EU', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '2202EU', 'EUR', 4, 'Y', 'N', 'N', 'N', 'Y', 1026194.64, 134318.67, 692714.88, 91507.91, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73095, 71184, 2, '2202GB', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '2202GB', 'GBP', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73096, 71184, 2, '2202HK', 'HKD', 'HKD', 'liabilities', 'currencyAmount', '2202HK', 'HKD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73097, 71186, 2, '221101', '职工工资、奖金、津贴、补贴', '职工工资、奖金、津贴、补贴', 'liabilities', 'amount', '221101', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 269530.04, 0.00, 276235.82, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73098, 71186, 2, '221102', '五险一金', '五险一金', 'liabilities', 'amount', '221102', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73099, 71186, 2, '221103', '工会经费与职工教育经费', '工会经费与职工教育经费', 'liabilities', 'amount', '221103', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73100, 71186, 2, '221104', '辞退福利', '辞退福利', 'liabilities', 'amount', '221104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73101, 71187, 2, '222101', '应交增值税', '应交增值税', 'liabilities', 'amount', '222101', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73102, 71187, 2, '222102', '应交企业所得税', '应交企业所得税', 'liabilities', 'amount', '222102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73103, 71187, 2, '222103', '应交城市维护建设税', '应交城市维护建设税', 'liabilities', 'amount', '222103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73104, 71187, 2, '222104', '应交教育费附加', '应交教育费附加', 'liabilities', 'amount', '222104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73105, 71187, 2, '222105', '应交个人所得税', '应交个人所得税', 'liabilities', 'amount', '222105', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 3150.26, 0.00, 1113.91, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73106, 71190, 2, '224101', '应付职员', '应付职员', 'liabilities', 'amount', '224101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 25440.00, 0.00, 0.00, 0.00, 'N', 'Y', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73107, 71190, 2, '224102', '应付供应商', '应付供应商', 'liabilities', 'amount', '224102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73108, 71203, 2, '400201', '资本溢价', '资本溢价', 'ownership', 'amount', '400201', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73109, 71203, 2, '400202', '股本溢价', '股本溢价', 'ownership', 'amount', '400202', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73110, 71203, 2, '400203', '其他资本公积', '其他资本公积', 'ownership', 'amount', '400203', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73111, 71204, 2, '410101', '法定盈余公积', '法定盈余公积', 'ownership', 'amount', '410101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73112, 71204, 2, '410102', '任意盈余公积', '任意盈余公积', 'ownership', 'amount', '410102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73113, 71204, 2, '410103', '法定公益金', '法定公益金', 'ownership', 'amount', '410103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73114, 71204, 2, '410104', '储备基金', '储备基金', 'ownership', 'amount', '410104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73115, 71204, 2, '410105', '企业发展基金', '企业发展基金', 'ownership', 'amount', '410105', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73116, 71218, 2, '630101', '低值品盘盈', '低值品盘盈', 'profit', 'amount', '630101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73117, 71218, 2, '630102', '固定资产盘盈', '固定资产盘盈', 'profit', 'amount', '630102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73118, 71218, 2, '630103', '处置固定资产净收益', '处置固定资产净收益', 'profit', 'amount', '630103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73119, 71218, 2, '630104', '非货币性交易收益', '非货币性交易收益', 'profit', 'amount', '630104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73120, 71218, 2, '630105', '债务重组利得', '债务重组利得', 'profit', 'amount', '630105', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73121, 71218, 2, '630106', '政府补助', '政府补助', 'profit', 'amount', '630106', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73122, 71218, 2, '630107', '捐赠所得', '捐赠所得', 'profit', 'amount', '630107', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73123, 71218, 2, '630199', '其他', '其他', 'profit', 'amount', '630199', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73124, 71221, 2, '640501', '城市维护建设税', '城市维护建设税', 'profit', 'amount', '640501', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73125, 71221, 2, '640502', '教育费附加', '教育费附加', 'profit', 'amount', '640502', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73126, 71221, 2, '640503', '地方教育费附加', '地方教育费附加', 'profit', 'amount', '640303', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73127, 71221, 2, '640504', '印花税', '印花税', 'profit', 'amount', '640504', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73128, 71223, 2, '660101', '职工薪酬', '职工薪酬', 'profit', 'amount', '660101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73129, 71223, 2, '660102', '房租', '房租', 'profit', 'amount', '660102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73130, 71223, 2, '660103', '水电费', '水电费', 'profit', 'amount', '660103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73131, 71223, 2, '660104', '物业管理费', '物业管理费', 'profit', 'amount', '660104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73132, 71223, 2, '660105', '广告费', '广告费', 'profit', 'amount', '660105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73133, 71223, 2, '660106', '业务宣传费', '业务宣传费', 'profit', 'amount', '660106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73134, 71223, 2, '660107', '业务招待费', '业务招待费', 'profit', 'amount', '660107', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73135, 71223, 2, '660108', '折旧费', '折旧费', 'profit', 'amount', '660108', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73136, 71223, 2, '660109', '修理费', '修理费', 'profit', 'amount', '660109', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73137, 71223, 2, '660110', '运输费', '运输费', 'profit', 'amount', '660110', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73138, 71223, 2, '660111', '保险费', '保险费', 'profit', 'amount', '660111', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73139, 71223, 2, '660112', '装卸费', '装卸费', 'profit', 'amount', '660112', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73140, 71223, 2, '660113', '包装费', '包装费', 'profit', 'amount', '660113', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73141, 71223, 2, '660114', '低值易耗品', '低值易耗品', 'profit', 'amount', '660114', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73142, 71223, 2, '660115', '办公费', '办公费', 'profit', 'amount', '660115', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73143, 71223, 2, '660116', '快递费', '快递费', 'profit', 'amount', '660116', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73144, 71223, 2, '660117', '差旅费', '差旅费', 'profit', 'amount', '660117', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73145, 71223, 2, '660118', '市内交通费', '市内交通费', 'profit', 'amount', '660118', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73146, 71223, 2, '660119', '通信费', '通信费', 'profit', 'amount', '660119', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73147, 71223, 2, '660120', '业务提成/佣金', '业务提成/佣金', 'profit', 'amount', '660120', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73148, 71223, 2, '660121', '车辆费', '车辆费', 'profit', 'amount', '660121', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73149, 71223, 2, '660122', '销售折让', '销售折让', 'profit', 'amount', '660122', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73150, 71223, 2, '660199', '其他', '其他', 'profit', 'amount', '660199', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73151, 71224, 2, '660201', '职工薪酬', '职工薪酬', 'profit', 'amount', '660201', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73152, 71224, 2, '660202', '房租', '房租', 'profit', 'amount', '660202', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73153, 71224, 2, '660203', '水电费', '水电费', 'profit', 'amount', '660203', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73154, 71224, 2, '660204', '物业管理费', '物业管理费', 'profit', 'amount', '660204', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73155, 71224, 2, '660205', '业务招待费', '业务招待费', 'profit', 'amount', '660205', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73156, 71224, 2, '660206', '折旧费', '折旧费', 'profit', 'amount', '660206', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73157, 71224, 2, '660207', '修理费', '修理费', 'profit', 'amount', '660207', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73158, 71224, 2, '660208', '低值易耗品', '低值易耗品', 'profit', 'amount', '660208', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73159, 71224, 2, '660209', '办公费', '办公费', 'profit', 'amount', '660209', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73160, 71224, 2, '660210', '快递费', '快递费', 'profit', 'amount', '660210', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73161, 71224, 2, '660211', '差旅费', '差旅费', 'profit', 'amount', '660211', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73162, 71224, 2, '660212', '市内交通费', '市内交通费', 'profit', 'amount', '660212', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73163, 71224, 2, '660213', '通信费', '通信费', 'profit', 'amount', '660213', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73164, 71224, 2, '660214', '车辆费', '车辆费', 'profit', 'amount', '660214', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73165, 71224, 2, '660215', '中介服务费', '中介服务费', 'profit', 'amount', '660215', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73166, 71224, 2, '660220', '冻结', '冻结', 'profit', 'amount', '660220', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73167, 71224, 2, '660299', '其他', '其他', 'profit', 'amount', '660299', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73168, 71231, 2, '671101', '赔付支出', '赔付支出', 'profit', 'amount', '671101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73169, 71231, 2, '671102', '处理固定资产净损失', '处理固定资产净损失', 'profit', 'amount', '671102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73170, 71231, 2, '671103', '捐赠支出', '捐赠支出', 'profit', 'amount', '671103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73171, 71231, 2, '671104', '固定资产盘亏', '固定资产盘亏', 'profit', 'amount', '671104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73172, 71231, 2, '671105', '非常损失', '非常损失', 'profit', 'amount', '671105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73173, 71231, 2, '671106', '出售无形资产损失', '出售无形资产损失', 'profit', 'amount', '671106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73174, 71231, 2, '671107', '债务重组损失', '债务重组损失', 'profit', 'amount', '671107', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73175, 71231, 2, '671108', '固定资产减值准备', '固定资产减值准备', 'profit', 'amount', '671108', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73176, 71231, 2, '671109', '无形资产减值准备', '无形资产减值准备', 'profit', 'amount', '671109', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73177, 71231, 2, '671110', '在建工程减值准备', '在建工程减值准备', 'profit', 'amount', '671110', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73178, 71231, 2, '671199', '其他', '其他', 'profit', 'amount', '671199', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73179, 71232, 2, '680101', '当期所得税费用', '当期所得税费用', 'profit', 'amount', '680101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73180, 71232, 2, '680102', '递延所得税费用', '递延所得税费用', 'profit', 'amount', '680102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73181, 73097, 3, '2211010001', '职工工资', '职工工资', 'liabilities', 'amount', '22110101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 44974.40, 0.00, 13438.65, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73182, 73097, 3, '2211010002', '奖金', '奖金', 'liabilities', 'amount', '22110102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 224555.64, 0.00, 262797.17, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73183, 73097, 3, '2211010003', '津贴', '津贴', 'liabilities', 'amount', '22110103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73184, 73097, 3, '2211010004', '补贴', '补贴', 'liabilities', 'amount', '22110104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73185, 73098, 3, '2211020001', '社会保险费', '社会保险费', 'liabilities', 'amount', '22110201', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73186, 73098, 3, '2211020002', '公积金', '公积金', 'liabilities', 'amount', '22110202', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73187, 73099, 3, '2211030001', '工会经费', '工会经费', 'liabilities', 'amount', '22110301', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73188, 73099, 3, '2211030002', '职工教育经费', '职工教育经费', 'liabilities', 'amount', '22110302', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73189, 73101, 3, '2221010001', '进项税额', '进项税额', 'liabilities', 'amount', '22210101', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73190, 73101, 3, '2221010002', '销项税额抵减', '销项税额抵减', 'liabilities', 'amount', '22210102', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73191, 73101, 3, '2221010003', '已交税金', '已交税金', 'liabilities', 'amount', '22210103', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73192, 73101, 3, '2221010004', '减免税款', '减免税款', 'liabilities', 'amount', '22210104', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73193, 73101, 3, '2221010005', '出口抵减内销产品应纳税额', '出口抵减内销产品应纳税额', 'liabilities', 'amount', '22210105', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73194, 73101, 3, '2221010006', '转出未交增值税', '转出未交增值税', 'liabilities', 'amount', '22210106', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73195, 73101, 3, '2221010007', '销项税额', '销项税额', 'liabilities', 'amount', '22210107', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73196, 73101, 3, '2221010008', '出口退税', '出口退税', 'liabilities', 'amount', '22210108', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73197, 73101, 3, '2221010009', '进项税额转出', '进项税额转出', 'liabilities', 'amount', '22210109', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73198, 73101, 3, '2221010010', '转出多交增值税', '转出多交增值税', 'liabilities', 'amount', '22210110', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73199, 73128, 3, '6601010001', '职工工资', '职工工资', 'profit', 'amount', '66010101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73200, 73128, 3, '6601010002', '职工福利费', '职工福利费', 'profit', 'amount', '66010102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73201, 73128, 3, '6601010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66010103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73202, 73128, 3, '6601010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66010104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73203, 73128, 3, '6601010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66010105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73204, 73128, 3, '6601010006', '工会经费', '工会经费', 'profit', 'amount', '66010106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73205, 73128, 3, '6601010007', '社会保险费', '社会保险费', 'profit', 'amount', '66010107', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73206, 73128, 3, '6601010008', '住房公积金', '住房公积金', 'profit', 'amount', '66010108', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73207, 73128, 3, '6601010009', '奖金', '奖金', 'profit', 'amount', '66010109', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73208, 73128, 3, '6601010010', '其他', '其他', 'profit', 'amount', '66010110', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73209, 73142, 3, '6601150001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66011501', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73210, 73142, 3, '6601150002', '书报资料费', '书报资料费', 'profit', 'amount', '66011502', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73211, 73142, 3, '6601150003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66011503', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73212, 73144, 3, '6601170001', '交通费', '交通费', 'profit', 'amount', '66011701', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73213, 73144, 3, '6601170002', '住宿费', '住宿费', 'profit', 'amount', '66011702', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73214, 73144, 3, '6601170003', '出差补助', '出差补助', 'profit', 'amount', '66011703', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73215, 73148, 3, '6601210001', '加油费', '加油费', 'profit', 'amount', '66012101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73216, 73148, 3, '6601210002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66012102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73217, 73148, 3, '6601210003', '维修保养费', '维修保养费', 'profit', 'amount', '66012103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73218, 73148, 3, '6601210004', '保险费', '保险费', 'profit', 'amount', '66012104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73219, 73148, 3, '6601210005', '其他', '其他', 'profit', 'amount', '66012105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73220, 73151, 3, '6602010001', '职工工资', '职工工资', 'profit', 'amount', '66020101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73221, 73151, 3, '6602010002', '职工福利费', '职工福利费', 'profit', 'amount', '66020102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73222, 73151, 3, '6602010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66020103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73223, 73151, 3, '6602010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66020104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73224, 73151, 3, '6602010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66020105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73225, 73151, 3, '6602010006', '工会经费', '工会经费', 'profit', 'amount', '66020106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73226, 73151, 3, '6602010007', '社会保险费', '社会保险费', 'profit', 'amount', '66020107', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73227, 73151, 3, '6602010008', '住房公积金', '住房公积金', 'profit', 'amount', '66020108', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73228, 73151, 3, '6602010009', '奖金', '奖金', 'profit', 'amount', '66020109', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73229, 73151, 3, '6602010010', '其他', '其他', 'profit', 'amount', '66020110', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73230, 73159, 3, '6602090001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66020901', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73231, 73159, 3, '6602090002', '书报资料费', '书报资料费', 'profit', 'amount', '66020902', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73232, 73159, 3, '6602090003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66020903', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73233, 73159, 3, '6602090004', '办公用品租赁费', '办公用品租赁费', 'profit', 'amount', '66020904', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73234, 73161, 3, '6602110001', '交通费', '交通费', 'profit', 'amount', '66021101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73235, 73161, 3, '6602110002', '住宿费', '住宿费', 'profit', 'amount', '66021102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73236, 73161, 3, '6602110003', '出差补助', '出差补助', 'profit', 'amount', '66021103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73237, 73163, 3, '6602130001', '移动通讯费', '移动通讯费', 'profit', 'amount', '66021301', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73238, 73163, 3, '6602130002', '网络通讯费', '网络通讯费', 'profit', 'amount', '66021302', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73239, 73164, 3, '6602140001', '加油费', '加油费', 'profit', 'amount', '66021401', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73240, 73164, 3, '6602140002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66021402', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73241, 73164, 3, '6602140003', '维修保养费', '维修保养费', 'profit', 'amount', '66021403', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73242, 73164, 3, '6602140004', '保险费', '保险费', 'profit', 'amount', '66021404', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73243, 73164, 3, '6602140005', '其他', '其他', 'profit', 'amount', '66021405', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73244, 73165, 3, '6602150001', '审计费', '审计费', 'profit', 'amount', '66021501', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73245, 73165, 3, '6602150002', '诉讼费', '诉讼费', 'profit', 'amount', '66021502', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73246, 73165, 3, '6602150003', '评估费', '评估费', 'profit', 'amount', '66021503', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73247, 73165, 3, '6602150004', '技术咨询费', '技术咨询费', 'profit', 'amount', '66021504', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73248, 73165, 3, '6602150005', '认证费', '认证费', 'profit', 'amount', '66021505', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73249, 73165, 3, '6602150006', '专利费', '专利费', 'profit', 'amount', '66021506', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73250, 73165, 3, '6602150007', '会员费', '会员费', 'profit', 'amount', '66021507', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73251, 73165, 3, '6602150008', '其他', '其他', 'profit', 'amount', '66021508', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73252, 73166, 3, '6602200001', '招聘费', '招聘费', 'profit', 'amount', '66022001', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73253, 73166, 3, '6602200002', '开办费', '开办费', 'profit', 'amount', '66022002', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73254, 71243, 2, '1122EU', 'EUR', 'EUR', 'asset', 'currencyAmount', '1122EUR', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73255, 71243, 2, '1122HK', 'HKD', 'HKD', 'asset', 'currencyAmount', '1122HK', 'HKD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73256, 71264, 2, '160101', '办公设备', '办公设备', 'asset', 'amount', '160101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 20840.00, 0.00, 20840.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73257, 71264, 2, '160102', '操作设备', '操作设备', 'asset', 'amount', '160102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73258, 71264, 2, '160103', '电子设备', '电子设备', 'asset', 'amount', '160103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 2098.50, 0.00, 2098.50, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73259, 71264, 2, '160104', '运输设备', '运输设备', 'asset', 'amount', '160104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73260, 71265, 2, '160201', '办公设备', '办公设备', 'asset', 'amount', '160201', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', -9990.48, 0.00, -7790.72, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73261, 71265, 2, '160202', '操作设备', '操作设备', 'asset', 'amount', '160202', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73262, 71265, 2, '160203', '电子设备', '电子设备', 'asset', 'amount', '160203', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', -1218.36, 0.00, -996.84, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73263, 71265, 2, '160204', '运输设备', '运输设备', 'asset', 'amount', '160204', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73264, 71280, 2, '2202EU', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '2202EU', 'EUR', 2, 'Y', 'N', 'N', 'N', 'Y', 7601.80, 995.00, 2217.93, 292.99, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73265, 71280, 2, '2202GB', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '2202GB', 'GBP', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73266, 71280, 2, '2202HK', 'HKD', 'HKD', 'liabilities', 'currencyAmount', '2202HK', 'HKD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73267, 71282, 2, '221101', '职工工资、奖金、津贴、补贴', '职工工资、奖金、津贴、补贴', 'liabilities', 'amount', '221101', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 546206.19, 0.00, 525381.76, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73268, 71282, 2, '221102', '五险一金', '五险一金', 'liabilities', 'amount', '221102', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73269, 71282, 2, '221103', '工会经费与职工教育经费', '工会经费与职工教育经费', 'liabilities', 'amount', '221103', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73270, 71282, 2, '221104', '辞退福利', '辞退福利', 'liabilities', 'amount', '221104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73271, 71283, 2, '222101', '应交增值税', '应交增值税', 'liabilities', 'amount', '222101', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73272, 71283, 2, '222102', '应交企业所得税', '应交企业所得税', 'liabilities', 'amount', '222102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73273, 71283, 2, '222103', '应交城市维护建设税', '应交城市维护建设税', 'liabilities', 'amount', '222103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73274, 71283, 2, '222104', '应交教育费附加', '应交教育费附加', 'liabilities', 'amount', '222104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73275, 71283, 2, '222105', '应交个人所得税', '应交个人所得税', 'liabilities', 'amount', '222105', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 5577.69, 0.00, 7381.09, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73276, 71286, 2, '224101', '应付职员', '应付职员', 'liabilities', 'amount', '224101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 282576.00, 0.00, 0.00, 0.00, 'N', 'Y', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73277, 71286, 2, '224102', '应付供应商', '应付供应商', 'liabilities', 'amount', '224102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73278, 71299, 2, '400201', '资本溢价', '资本溢价', 'ownership', 'amount', '400201', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73279, 71299, 2, '400202', '股本溢价', '股本溢价', 'ownership', 'amount', '400202', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73280, 71299, 2, '400203', '其他资本公积', '其他资本公积', 'ownership', 'amount', '400203', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73281, 71300, 2, '410101', '法定盈余公积', '法定盈余公积', 'ownership', 'amount', '410101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73282, 71300, 2, '410102', '任意盈余公积', '任意盈余公积', 'ownership', 'amount', '410102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73283, 71300, 2, '410103', '法定公益金', '法定公益金', 'ownership', 'amount', '410103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73284, 71300, 2, '410104', '储备基金', '储备基金', 'ownership', 'amount', '410104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73285, 71300, 2, '410105', '企业发展基金', '企业发展基金', 'ownership', 'amount', '410105', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73286, 71314, 2, '630101', '低值品盘盈', '低值品盘盈', 'profit', 'amount', '630101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73287, 71314, 2, '630102', '固定资产盘盈', '固定资产盘盈', 'profit', 'amount', '630102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73288, 71314, 2, '630103', '处置固定资产净收益', '处置固定资产净收益', 'profit', 'amount', '630103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73289, 71314, 2, '630104', '非货币性交易收益', '非货币性交易收益', 'profit', 'amount', '630104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73290, 71314, 2, '630105', '债务重组利得', '债务重组利得', 'profit', 'amount', '630105', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73291, 71314, 2, '630106', '政府补助', '政府补助', 'profit', 'amount', '630106', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73292, 71314, 2, '630107', '捐赠所得', '捐赠所得', 'profit', 'amount', '630107', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73293, 71314, 2, '630199', '其他', '其他', 'profit', 'amount', '630199', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73294, 71317, 2, '640501', '城市维护建设税', '城市维护建设税', 'profit', 'amount', '640501', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73295, 71317, 2, '640502', '教育费附加', '教育费附加', 'profit', 'amount', '640502', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73296, 71317, 2, '640503', '地方教育费附加', '地方教育费附加', 'profit', 'amount', '640303', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73297, 71317, 2, '640504', '印花税', '印花税', 'profit', 'amount', '640504', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73298, 71319, 2, '660101', '职工薪酬', '职工薪酬', 'profit', 'amount', '660101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73299, 71319, 2, '660102', '房租', '房租', 'profit', 'amount', '660102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73300, 71319, 2, '660103', '水电费', '水电费', 'profit', 'amount', '660103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73301, 71319, 2, '660104', '物业管理费', '物业管理费', 'profit', 'amount', '660104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73302, 71319, 2, '660105', '广告费', '广告费', 'profit', 'amount', '660105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73303, 71319, 2, '660106', '业务宣传费', '业务宣传费', 'profit', 'amount', '660106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73304, 71319, 2, '660107', '业务招待费', '业务招待费', 'profit', 'amount', '660107', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73305, 71319, 2, '660108', '折旧费', '折旧费', 'profit', 'amount', '660108', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73306, 71319, 2, '660109', '修理费', '修理费', 'profit', 'amount', '660109', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73307, 71319, 2, '660110', '运输费', '运输费', 'profit', 'amount', '660110', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73308, 71319, 2, '660111', '保险费', '保险费', 'profit', 'amount', '660111', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73309, 71319, 2, '660112', '装卸费', '装卸费', 'profit', 'amount', '660112', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73310, 71319, 2, '660113', '包装费', '包装费', 'profit', 'amount', '660113', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73311, 71319, 2, '660114', '低值易耗品', '低值易耗品', 'profit', 'amount', '660114', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73312, 71319, 2, '660115', '办公费', '办公费', 'profit', 'amount', '660115', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73313, 71319, 2, '660116', '快递费', '快递费', 'profit', 'amount', '660116', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73314, 71319, 2, '660117', '差旅费', '差旅费', 'profit', 'amount', '660117', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73315, 71319, 2, '660118', '市内交通费', '市内交通费', 'profit', 'amount', '660118', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73316, 71319, 2, '660119', '通信费', '通信费', 'profit', 'amount', '660119', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73317, 71319, 2, '660120', '业务提成/佣金', '业务提成/佣金', 'profit', 'amount', '660120', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73318, 71319, 2, '660121', '车辆费', '车辆费', 'profit', 'amount', '660121', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73319, 71319, 2, '660122', '销售折让', '销售折让', 'profit', 'amount', '660122', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73320, 71319, 2, '660199', '其他', '其他', 'profit', 'amount', '660199', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73321, 71320, 2, '660201', '职工薪酬', '职工薪酬', 'profit', 'amount', '660201', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73322, 71320, 2, '660202', '房租', '房租', 'profit', 'amount', '660202', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73323, 71320, 2, '660203', '水电费', '水电费', 'profit', 'amount', '660203', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73324, 71320, 2, '660204', '物业管理费', '物业管理费', 'profit', 'amount', '660204', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73325, 71320, 2, '660205', '业务招待费', '业务招待费', 'profit', 'amount', '660205', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73326, 71320, 2, '660206', '折旧费', '折旧费', 'profit', 'amount', '660206', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73327, 71320, 2, '660207', '修理费', '修理费', 'profit', 'amount', '660207', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73328, 71320, 2, '660208', '低值易耗品', '低值易耗品', 'profit', 'amount', '660208', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73329, 71320, 2, '660209', '办公费', '办公费', 'profit', 'amount', '660209', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73330, 71320, 2, '660210', '快递费', '快递费', 'profit', 'amount', '660210', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73331, 71320, 2, '660211', '差旅费', '差旅费', 'profit', 'amount', '660211', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73332, 71320, 2, '660212', '市内交通费', '市内交通费', 'profit', 'amount', '660212', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73333, 71320, 2, '660213', '通信费', '通信费', 'profit', 'amount', '660213', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73334, 71320, 2, '660214', '车辆费', '车辆费', 'profit', 'amount', '660214', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73335, 71320, 2, '660215', '中介服务费', '中介服务费', 'profit', 'amount', '660215', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73336, 71320, 2, '660220', '冻结', '冻结', 'profit', 'amount', '660220', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73337, 71320, 2, '660299', '其他', '其他', 'profit', 'amount', '660299', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73338, 71327, 2, '671101', '赔付支出', '赔付支出', 'profit', 'amount', '671101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73339, 71327, 2, '671102', '处理固定资产净损失', '处理固定资产净损失', 'profit', 'amount', '671102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73340, 71327, 2, '671103', '捐赠支出', '捐赠支出', 'profit', 'amount', '671103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73341, 71327, 2, '671104', '固定资产盘亏', '固定资产盘亏', 'profit', 'amount', '671104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73342, 71327, 2, '671105', '非常损失', '非常损失', 'profit', 'amount', '671105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73343, 71327, 2, '671106', '出售无形资产损失', '出售无形资产损失', 'profit', 'amount', '671106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73344, 71327, 2, '671107', '债务重组损失', '债务重组损失', 'profit', 'amount', '671107', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73345, 71327, 2, '671108', '固定资产减值准备', '固定资产减值准备', 'profit', 'amount', '671108', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73346, 71327, 2, '671109', '无形资产减值准备', '无形资产减值准备', 'profit', 'amount', '671109', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73347, 71327, 2, '671110', '在建工程减值准备', '在建工程减值准备', 'profit', 'amount', '671110', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73348, 71327, 2, '671199', '其他', '其他', 'profit', 'amount', '671199', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73349, 71328, 2, '680101', '当期所得税费用', '当期所得税费用', 'profit', 'amount', '680101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73350, 71328, 2, '680102', '递延所得税费用', '递延所得税费用', 'profit', 'amount', '680102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73351, 73267, 3, '2211010001', '职工工资', '职工工资', 'liabilities', 'amount', '22110101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 56475.33, 0.00, -78290.13, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73352, 73267, 3, '2211010002', '奖金', '奖金', 'liabilities', 'amount', '22110102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 489730.86, 0.00, 603671.89, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73353, 73267, 3, '2211010003', '津贴', '津贴', 'liabilities', 'amount', '22110103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73354, 73267, 3, '2211010004', '补贴', '补贴', 'liabilities', 'amount', '22110104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73355, 73268, 3, '2211020001', '社会保险费', '社会保险费', 'liabilities', 'amount', '22110201', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73356, 73268, 3, '2211020002', '公积金', '公积金', 'liabilities', 'amount', '22110202', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73357, 73269, 3, '2211030001', '工会经费', '工会经费', 'liabilities', 'amount', '22110301', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73358, 73269, 3, '2211030002', '职工教育经费', '职工教育经费', 'liabilities', 'amount', '22110302', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73359, 73271, 3, '2221010001', '进项税额', '进项税额', 'liabilities', 'amount', '22210101', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73360, 73271, 3, '2221010002', '销项税额抵减', '销项税额抵减', 'liabilities', 'amount', '22210102', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73361, 73271, 3, '2221010003', '已交税金', '已交税金', 'liabilities', 'amount', '22210103', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73362, 73271, 3, '2221010004', '减免税款', '减免税款', 'liabilities', 'amount', '22210104', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73363, 73271, 3, '2221010005', '出口抵减内销产品应纳税额', '出口抵减内销产品应纳税额', 'liabilities', 'amount', '22210105', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73364, 73271, 3, '2221010006', '转出未交增值税', '转出未交增值税', 'liabilities', 'amount', '22210106', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73365, 73271, 3, '2221010007', '销项税额', '销项税额', 'liabilities', 'amount', '22210107', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73366, 73271, 3, '2221010008', '出口退税', '出口退税', 'liabilities', 'amount', '22210108', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73367, 73271, 3, '2221010009', '进项税额转出', '进项税额转出', 'liabilities', 'amount', '22210109', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73368, 73271, 3, '2221010010', '转出多交增值税', '转出多交增值税', 'liabilities', 'amount', '22210110', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73369, 73298, 3, '6601010001', '职工工资', '职工工资', 'profit', 'amount', '66010101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73370, 73298, 3, '6601010002', '职工福利费', '职工福利费', 'profit', 'amount', '66010102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73371, 73298, 3, '6601010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66010103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73372, 73298, 3, '6601010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66010104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73373, 73298, 3, '6601010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66010105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73374, 73298, 3, '6601010006', '工会经费', '工会经费', 'profit', 'amount', '66010106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73375, 73298, 3, '6601010007', '社会保险费', '社会保险费', 'profit', 'amount', '66010107', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73376, 73298, 3, '6601010008', '住房公积金', '住房公积金', 'profit', 'amount', '66010108', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73377, 73298, 3, '6601010009', '奖金', '奖金', 'profit', 'amount', '66010109', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73378, 73298, 3, '6601010010', '其他', '其他', 'profit', 'amount', '66010110', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73379, 73312, 3, '6601150001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66011501', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73380, 73312, 3, '6601150002', '书报资料费', '书报资料费', 'profit', 'amount', '66011502', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73381, 73312, 3, '6601150003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66011503', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73382, 73314, 3, '6601170001', '交通费', '交通费', 'profit', 'amount', '66011701', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73383, 73314, 3, '6601170002', '住宿费', '住宿费', 'profit', 'amount', '66011702', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73384, 73314, 3, '6601170003', '出差补助', '出差补助', 'profit', 'amount', '66011703', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73385, 73318, 3, '6601210001', '加油费', '加油费', 'profit', 'amount', '66012101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73386, 73318, 3, '6601210002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66012102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73387, 73318, 3, '6601210003', '维修保养费', '维修保养费', 'profit', 'amount', '66012103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73388, 73318, 3, '6601210004', '保险费', '保险费', 'profit', 'amount', '66012104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73389, 73318, 3, '6601210005', '其他', '其他', 'profit', 'amount', '66012105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73390, 73321, 3, '6602010001', '职工工资', '职工工资', 'profit', 'amount', '66020101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73391, 73321, 3, '6602010002', '职工福利费', '职工福利费', 'profit', 'amount', '66020102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73392, 73321, 3, '6602010003', '职工教育经费', '职工教育经费', 'profit', 'amount', '66020103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73393, 73321, 3, '6602010004', '解除职工劳动关系补偿', '解除职工劳动关系补偿', 'profit', 'amount', '66020104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73394, 73321, 3, '6602010005', '非货币性福利', '非货币性福利', 'profit', 'amount', '66020105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73395, 73321, 3, '6602010006', '工会经费', '工会经费', 'profit', 'amount', '66020106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73396, 73321, 3, '6602010007', '社会保险费', '社会保险费', 'profit', 'amount', '66020107', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73397, 73321, 3, '6602010008', '住房公积金', '住房公积金', 'profit', 'amount', '66020108', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73398, 73321, 3, '6602010009', '奖金', '奖金', 'profit', 'amount', '66020109', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73399, 73321, 3, '6602010010', '其他', '其他', 'profit', 'amount', '66020110', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73400, 73329, 3, '6602090001', '日常办公用品费', '日常办公用品费', 'profit', 'amount', '66020901', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73401, 73329, 3, '6602090002', '书报资料费', '书报资料费', 'profit', 'amount', '66020902', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73402, 73329, 3, '6602090003', '企业文化宣传费', '企业文化宣传费', 'profit', 'amount', '66020903', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73403, 73329, 3, '6602090004', '办公用品租赁费', '办公用品租赁费', 'profit', 'amount', '66020904', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73404, 73331, 3, '6602110001', '交通费', '交通费', 'profit', 'amount', '66021101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73405, 73331, 3, '6602110002', '住宿费', '住宿费', 'profit', 'amount', '66021102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73406, 73331, 3, '6602110003', '出差补助', '出差补助', 'profit', 'amount', '66021103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73407, 73333, 3, '6602130001', '移动通讯费', '移动通讯费', 'profit', 'amount', '66021301', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73408, 73333, 3, '6602130002', '网络通讯费', '网络通讯费', 'profit', 'amount', '66021302', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73409, 73334, 3, '6602140001', '加油费', '加油费', 'profit', 'amount', '66021401', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73410, 73334, 3, '6602140002', '过路过桥费', '过路过桥费', 'profit', 'amount', '66021402', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73411, 73334, 3, '6602140003', '维修保养费', '维修保养费', 'profit', 'amount', '66021403', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73412, 73334, 3, '6602140004', '保险费', '保险费', 'profit', 'amount', '66021404', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73413, 73334, 3, '6602140005', '其他', '其他', 'profit', 'amount', '66021405', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73414, 73335, 3, '6602150001', '审计费', '审计费', 'profit', 'amount', '66021501', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73415, 73335, 3, '6602150002', '诉讼费', '诉讼费', 'profit', 'amount', '66021502', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73416, 73335, 3, '6602150003', '评估费', '评估费', 'profit', 'amount', '66021503', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73417, 73335, 3, '6602150004', '咨询费', '咨询费', 'profit', 'amount', '66021504', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73418, 73335, 3, '6602150005', '认证费', '认证费', 'profit', 'amount', '66021505', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73419, 73335, 3, '6602150006', '专利费', '专利费', 'profit', 'amount', '66021506', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73420, 73335, 3, '6602150007', '会员费', '会员费', 'profit', 'amount', '66021507', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73421, 73335, 3, '6602150008', '其他', '其他', 'profit', 'amount', '66021508', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73422, 73336, 3, '6602200001', '招聘费', '招聘费', 'profit', 'amount', '66022001', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73423, 73336, 3, '6602200002', '开办费', '开办费', 'profit', 'amount', '66022002', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73424, 71239, 2, '100201', '供应链交通银行', '交通银行', 'asset', 'amount', '100201', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 7255799.02, 0.00, 3588142.15, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73425, 71143, 2, '100201', '顺锦通中国银行', '', 'asset', 'amount', '100201', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 401825.52, 0.00, 599564.92, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73516, 71239, 2, '100202', '瑞秋物流工行', NULL, 'asset', 'amount', '100202', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73598, 71247, 2, '123101', '其他', NULL, 'asset', 'amount', '123101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 4430.00, 0.00, 4430.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73599, 71343, 2, '123101', '其他', NULL, 'asset', 'amount', '123101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 431691.87, 0.00, 374660.83, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (73600, 71151, 2, '123101', '其他', NULL, 'asset', 'amount', '123101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', -200000.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74886, 71376, 2, '2202CA', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '2202CA', 'CAD', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74978, 71335, 2, '100209', '瑞秋供应链交通银行', NULL, 'asset', 'amount', '100209', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74979, 71184, 2, '2202CA', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '2202CA', 'CAD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74980, 71280, 2, '2202CA', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '2202CA', 'CAD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74981, 71239, 2, '100203', '瑞秋中国银行', NULL, 'asset', 'amount', '100203', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 583.52, 0.00, 582.79, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74982, 74981, 3, '1002030001', '中国银行-USD', NULL, 'asset', 'currencyAmount', '10020301', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74983, 74981, 3, '1002030002', '中国银行-GBP', NULL, 'asset', 'currencyAmount', '10020302', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74984, 74981, 3, '1002030003', '中国银行-EUR', NULL, 'asset', 'currencyAmount', '10020303', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74985, 74981, 3, '1002030004', '中国银行-HKD', NULL, 'asset', 'currencyAmount', '10020304', 'HKD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (74986, 74981, 3, '1002030005', '中国银行-CNY', NULL, 'asset', 'amount', '10020305', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 583.52, 0.00, 582.79, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75168, 71343, 2, '123102', '应收职员', NULL, 'asset', 'amount', '123102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 18123904.25, 0.00, 15114533.85, 0.00, 3237599.84, 0.00, 'N', 'Y', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75169, 71343, 2, '123103', '押金', NULL, 'asset', 'amount', '123103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 523674.00, 0.00, 386400.00, -70000.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75170, 71340, 2, '112303', '供应商往来-CNY', 'RMB', 'asset', 'amount', '112303', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 396796.13, 0.00, 385280.05, 0.00, 311643.94, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75234, 71343, 2, '123104', '内部往来', NULL, 'asset', 'amount', '123104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', -46466727.64, 0.00, -42319743.61, 1479271.93, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75236, 75234, 3, '1231040001', '内部往来-CNY', 'RMB', 'asset', 'amount', '12310401', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', -7127517.76, 0.00, -8211604.75, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75237, 75234, 3, '1231040002', '内部往来-USD', 'USD', 'asset', 'currencyAmount', '12310402', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', -28986904.54, -3998193.73, -26859706.38, -3694595.10, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75238, 75234, 3, '1231040003', '内部往来-GBP', 'GBP', 'asset', 'currencyAmount', '12310403', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', -61689.01, -6869.60, -58357.60, -6669.44, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75239, 75234, 3, '1231040004', '内部往来-EUR', 'EUR', 'asset', 'currencyAmount', '12310404', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', -10150720.60, -1311462.61, -7050179.15, -931331.46, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75240, 75234, 3, '1231040005', '内部往来-HKD', 'HKD', 'asset', 'currencyAmount', '12310405', 'HKD', 1, 'Y', 'Y', 'N', 'N', 'Y', -139895.73, -131977.10, -139895.73, -131977.10, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75241, 75234, 3, '1231040006', '内部往来-CAD', 'CAD', 'asset', 'currencyAmount', '12310406', 'CAD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75242, 71382, 2, '224103', '内部往来', NULL, 'liabilities', 'amount', '224103', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', -45874847.07, 0.00, -37980825.10, 1377700.30, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75243, 75242, 3, '2241030001', '内部往来-CNY', 'RMB', 'liabilities', 'amount', '22410301', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', -23410386.73, 0.00, -17570152.44, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75244, 75242, 3, '2241030002', '内部往来-USD', 'USD', 'liabilities', 'currencyAmount', '22410302', 'USD', 1, 'Y', 'N', 'N', 'N', 'Y', -7895235.65, -1088998.02, -10203461.72, -1403502.30, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75245, 75242, 3, '2241030003', '内部往来-GBP', 'GBP', 'liabilities', 'currencyAmount', '22410303', 'GBP', 1, 'Y', 'N', 'N', 'N', 'Y', -588978.17, -65587.77, -804266.75, -91916.20, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75246, 75242, 3, '2241030004', '内部往来-EUR', 'EUR', 'liabilities', 'currencyAmount', '22410304', 'EUR', 1, 'Y', 'N', 'N', 'N', 'Y', -13957477.83, -1803291.71, -9401158.09, -1241896.71, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75247, 75242, 3, '2241030005', '内部往来-HKD', 'HKD', 'liabilities', 'currencyAmount', '22410305', 'HKD', 1, 'Y', 'N', 'N', 'N', 'Y', -1786.10, -1685.00, -1786.10, -1685.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75248, 75242, 3, '2241030006', '内部往来-CAD', 'CAD', 'liabilities', 'currencyAmount', '22410306', 'CAD', 1, 'Y', 'N', 'N', 'N', 'Y', -20982.59, -3900.11, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75249, 71247, 2, '123103', '押金', NULL, 'asset', 'amount', '123103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 70644.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75250, 75249, 3, '1231030001', '押金-CNY', 'RMB', 'asset', 'amount', '12310301', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 70644.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75251, 75249, 3, '1231030002', '押金-USD', 'USD', 'asset', 'currencyAmount', '12310302', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75252, 75249, 3, '1231030003', '押金-GBP', 'GBP', 'asset', 'currencyAmount', '12310303', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75253, 75249, 3, '1231030004', '押金-EUR', 'EUR', 'asset', 'currencyAmount', '12310004', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75255, 75249, 3, '1231030006', '押金-CAD', 'CAD', 'asset', 'currencyAmount', '12310306', 'CAD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75256, 71286, 2, '224103', '内部往来', NULL, 'liabilities', 'amount', '224103', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 26732666.32, 0.00, 24682244.20, -243601.92, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75257, 75256, 3, '2241030001', '内部往来-CNY', 'RMB', 'liabilities', 'amount', '22410301', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 24215749.27, 0.00, 21254984.12, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75258, 75256, 3, '2241030002', '内部往来-USD', 'USD', 'liabilities', 'currencyAmount', '22410302', 'USD', 2, 'Y', 'N', 'N', 'N', 'Y', 1576122.40, 224518.86, 2546681.73, 350300.10, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75259, 75256, 3, '2241030003', '内部往来-GBP', 'GBP', 'liabilities', 'currencyAmount', '22410303', 'GBP', 2, 'Y', 'N', 'N', 'N', 'Y', 683979.36, 78981.45, 569113.39, 65041.53, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75260, 75256, 3, '2241030004', '内部往来-EUR', 'EUR', 'liabilities', 'currencyAmount', '22410304', 'EUR', 2, 'Y', 'N', 'N', 'N', 'Y', 255079.74, 33387.40, 309678.86, 40908.70, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75261, 75256, 3, '2241030005', '内部往来-HKD', 'HKD', 'liabilities', 'currencyAmount', '22410305', 'HKD', 2, 'Y', 'N', 'N', 'N', 'Y', 1735.55, 1685.00, 1786.10, 1685.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75262, 75256, 3, '2241030006', '内部往来-CAD', 'CAD', 'liabilities', 'currencyAmount', '22410306', 'CAD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75265, 71151, 2, '123103', '押金', NULL, 'asset', 'amount', '123103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 12720.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75272, 71190, 2, '224103', '内部往来', NULL, 'liabilities', 'amount', '224103', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 19072742.19, 0.00, 14300631.05, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75273, 75272, 3, '2241030001', '内部往来-CNY', 'RMB', 'liabilities', 'amount', '22410301', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', -2484753.66, 0.00, -2684831.68, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75274, 75272, 3, '2241030002', '内部往来-USD', 'USD', 'liabilities', 'currencyAmount', '22410302', 'USD', 4, 'Y', 'N', 'N', 'N', 'Y', 8358627.30, 1190687.65, 7658830.13, 1053484.20, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75275, 75272, 3, '2241030003', '内部往来-GBP', 'GBP', 'liabilities', 'currencyAmount', '22410303', 'GBP', 4, 'Y', 'N', 'N', 'N', 'Y', 306344.56, 35374.66, 235153.36, 26874.67, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75276, 75272, 3, '2241030004', '内部往来-EUR', 'EUR', 'liabilities', 'currencyAmount', '22410304', 'EUR', 4, 'Y', 'N', 'N', 'N', 'Y', 12872126.41, 1684833.30, 9091479.24, 1200988.01, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75277, 75272, 3, '2241030005', '内部往来-HKD', 'HKD', 'liabilities', 'currencyAmount', '22410305', 'HKD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75278, 75272, 3, '2241030006', '内部往来-CAD', 'CAD', 'liabilities', 'currencyAmount', '22410306', 'CAD', 4, 'Y', 'N', 'N', 'N', 'Y', 20397.58, 3900.11, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75321, 71416, 2, '660221', '装修费', NULL, 'profit', 'amount', '660221', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75322, 72976, 3, '6601210006', '停车费', NULL, 'profit', 'amount', '66012106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75328, 73005, 3, '6602090005', '印刷费', NULL, 'profit', 'amount', '66020905', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75329, 72962, 3, '6601150004', '办公用品租赁费', NULL, 'profit', 'amount', '660115', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75330, 72962, 3, '6601150005', '印刷费', NULL, 'profit', 'amount', '66015', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75331, 71148, 2, '112303', '供应商往来-CNY', 'RMB', 'asset', 'amount', '112303', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75332, 71151, 2, '123102', '应收职员', NULL, 'asset', 'amount', '123102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', -2880.34, 0.00, -2880.34, 0.00, 0.00, 0.00, 'N', 'Y', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75333, 71151, 2, '123104', '内部往来', NULL, 'asset', 'amount', '123104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 21578070.55, 0.00, 18699125.43, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75334, 71224, 2, '660221', '装修费', NULL, 'profit', 'amount', '660221', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75335, 75333, 3, '1231040001', '内部往来-CNY', 'RMB', 'asset', 'amount', '12310401', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 4071370.93, 0.00, 3302891.83, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75336, 75333, 3, '1231040002', '内部往来-USD', 'USD', 'asset', 'currencyAmount', '12310402', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 8467965.84, 1206262.94, 8328326.25, 1145574.45, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75337, 75333, 3, '1231040003', '内部往来-GBP', 'GBP', 'asset', 'currencyAmount', '12310403', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 17545.85, 2026.08, 17728.20, 2026.08, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75338, 75333, 3, '1231040004', '内部往来-EUR', 'EUR', 'asset', 'currencyAmount', '12310404', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 9021187.93, 1180783.76, 7050179.15, 931331.46, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75339, 75333, 3, '1231040005', '内部往来-HKD', 'HKD', 'asset', 'currencyAmount', '12310405', 'HKD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75340, 75333, 3, '1231040006', '内部往来-CAD', 'CAD', 'asset', 'currencyAmount', '12310406', 'CAD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75341, 73142, 3, '6601150004', '办公用品租赁费', NULL, 'profit', 'amount', '660115', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75342, 73142, 3, '6601150005', '印刷费', NULL, 'profit', 'amount', '66015', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75343, 73148, 3, '6601210006', '停车费', NULL, 'profit', 'amount', '66012106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75344, 73159, 3, '6602090005', '印刷费', NULL, 'profit', 'amount', '66020905', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75345, 73166, 3, '6602200003', '装修费', NULL, 'profit', 'amount', '6602203', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75346, 71244, 2, '112303', '供应商往来-CNY', 'RMB', 'asset', 'amount', '112303', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 11503.16, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75347, 71247, 2, '123102', '应收职员', NULL, 'asset', 'amount', '123102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 373016.50, 0.00, 373016.50, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75348, 71247, 2, '123104', '内部往来', NULL, 'asset', 'amount', '123104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 21624090.03, 0.00, 24622450.22, -2236895.77, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75349, 71320, 2, '660221', '装修费', NULL, 'profit', 'amount', '660221', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75350, 75348, 3, '1231040001', '内部往来-CNY', 'RMB', 'asset', 'amount', '12310401', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 1995019.91, 0.00, 5908712.92, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75351, 75348, 3, '1231040002', '内部往来-USD', 'USD', 'asset', 'currencyAmount', '12310402', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 19451188.83, 2770824.62, 18533212.17, 2549272.65, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75352, 75348, 3, '1231040003', '内部往来-GBP', 'GBP', 'asset', 'currencyAmount', '12310403', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 41944.88, 4843.52, 40629.40, 4643.36, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75353, 75348, 3, '1231040004', '内部往来-EUR', 'EUR', 'asset', 'currencyAmount', '12310404', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75354, 75348, 3, '1231040005', '内部往来-HKD', 'HKD', 'asset', 'currencyAmount', '12310405', 'HKD', 2, 'Y', 'Y', 'N', 'N', 'Y', 135936.41, 131977.10, 139895.73, 131977.10, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75355, 75348, 3, '1231040006', '内部往来-CAD', 'CAD', 'asset', 'currencyAmount', '12310406', 'CAD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'Y', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75356, 73312, 3, '6601150004', '办公用品租赁费', NULL, 'profit', 'amount', '660115', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75357, 73312, 3, '6601150005', '印刷费', NULL, 'profit', 'amount', '66015', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75358, 73318, 3, '6601210006', '停车费', NULL, 'profit', 'amount', '66012106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75359, 73329, 3, '6602090005', '印刷费', NULL, 'profit', 'amount', '66020905', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75360, 73336, 3, '6602200003', '装修费', NULL, 'profit', 'amount', '6602203', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75849, 71417, 2, '660304', '银行手续费', '', 'profit', 'amount', '660304', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75850, 75849, 3, '6603040001', '银行手续费-CNY', 'RMB', 'profit', 'amount', '66030401', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75851, 75849, 3, '6603040002', '银行手续费-USD', 'USD', 'profit', 'currencyAmount', '66030402', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75852, 75849, 3, '6603040003', '银行手续费-GBP', 'GBP', 'profit', 'currencyAmount', '660304', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75853, 75849, 3, '6603040004', '银行手续费-EUR', 'EUR', 'profit', 'currencyAmount', '66030404', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75854, 75849, 3, '6603040005', '银行手续费-HKD', 'HKD', 'profit', 'currencyAmount', '66030405', 'HKD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75855, 75849, 3, '6603040006', '银行手续费-CAD', 'CAD', 'profit', 'currencyAmount', '66030406', 'CAD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75875, 71321, 2, '660304', '银行手续费-CNY', 'RMB', 'profit', 'amount', '660304', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75903, 73334, 3, '6602140006', '停车费', NULL, 'profit', 'amount', '66021406', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (75904, 73038, 3, '6602140006', '停车费', NULL, 'profit', 'amount', '66021406', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76439, 71417, 2, '660305', '其他', '', 'profit', 'amount', '660305', 'CNY', 1, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76440, 76439, 3, '6603050001', '其他CNY', 'RMB', 'profit', 'amount', '66030501', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76441, 76439, 3, '6603050002', '其他USD', 'USD', 'profit', 'currencyAmount', '66030502', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76442, 76439, 3, '6603050003', '其他GBP', 'GBP', 'profit', 'currencyAmount', '66030503', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76443, 76439, 3, '6603050004', '其他EUR', 'EUR', 'profit', 'currencyAmount', '66030504', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76444, 76439, 3, '6603050005', '其他HKD', 'HKD', 'profit', 'currencyAmount', '66030505', 'HKD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76445, 76439, 3, '6603050006', '其他CAD', 'CAD', 'profit', 'currencyAmount', '66030506', 'CAD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76476, 72504, 3, '1002040005', '香港汇丰银行--CAD', 'CAD', 'asset', 'currencyAmount', '10020405', 'CAD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76477, 72504, 3, '1002040006', '香港汇丰银行--CNY', 'RMB', 'asset', 'amount', '10020406', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 2621057.47, 0.00, 2348247.72, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76478, 71335, 2, '100210', '交通银行-夏秋菊', NULL, 'asset', 'amount', '100209', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76490, 71337, 2, '110103', '夏秋菊理财', NULL, 'asset', 'amount', '110103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76495, 75169, 3, '1231030001', '押金-CNY', 'RMB', 'asset', 'amount', '12310301', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 487424.00, 0.00, 386400.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76496, 75169, 3, '1231030002', '押金-USD', 'USD', 'asset', 'currencyAmount', '12310302', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 36250.00, 5000.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76497, 75169, 3, '1231030003', '押金-GBP', 'GBP', 'asset', 'currencyAmount', '12310303', 'GBP', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76517, 71370, 2, '180101', '在建工程', NULL, 'asset', 'amount', '180101', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 275456.21, 0.00, 238194.35, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76518, 71370, 2, '180102', '技术咨询费', NULL, 'asset', 'amount', '180102', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 89219.65, 0.00, 61631.57, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76522, 71340, 2, '112304', '供应商往来-EUR', 'EUR', 'asset', 'currencyAmount', '112304', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', 488244.46, 63080.68, 1258134.00, 166200.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76729, 71377, 2, '220501', 'CNY', 'RMB', 'liabilities', 'amount', '220501', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', -1531055.55, 0.00, -1173466.43, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76730, 71377, 2, '220502', 'USD', 'USD', 'liabilities', 'currencyAmount', '220502', 'USD', 1, 'Y', 'N', 'N', 'N', 'Y', -7004.52, -966.14, 20782.89, 2858.72, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76731, 71377, 2, '220503', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '220503', 'GBP', 1, 'Y', 'N', 'N', 'N', 'Y', -33422.21, -3721.85, -32566.19, -3721.85, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76732, 71377, 2, '220504', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '220504', 'EUR', 1, 'Y', 'N', 'N', 'N', 'Y', 3443010.98, 444833.46, 462338.20, 61075.06, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76733, 71377, 2, '220505', 'HKD', 'HKD', 'liabilities', 'currencyAmount', '220505', 'HKD', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76734, 71377, 2, '220506', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '220506', 'CAD', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76735, 71145, 2, '110103', '夏秋菊理财', NULL, 'asset', 'amount', '110103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76736, 71148, 2, '112304', '供应商往来-EUR', 'EUR', 'asset', 'currencyAmount', '112304', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76737, 71178, 2, '180101', '在建工程', NULL, 'asset', 'amount', '180101', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76738, 71178, 2, '180102', '技术咨询费', NULL, 'asset', 'amount', '180102', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 199833.48, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76739, 71185, 2, '220501', 'CNY', 'RMB', 'liabilities', 'amount', '220501', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', -4123.98, 0.00, -40712.13, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76740, 71185, 2, '220502', 'USD', 'USD', 'liabilities', 'currencyAmount', '220502', 'USD', 4, 'Y', 'N', 'N', 'N', 'Y', -3339.13, -475.66, -3458.05, -475.66, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76741, 71185, 2, '220503', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '220503', 'GBP', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76742, 71185, 2, '220504', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '220504', 'EUR', 4, 'Y', 'N', 'N', 'N', 'Y', -2975380.89, -389447.76, -42431.52, -5605.22, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76743, 71185, 2, '220505', 'HKD', 'HKD', 'liabilities', 'currencyAmount', '220505', 'HKD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76744, 71185, 2, '220506', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '220506', 'CAD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76745, 71225, 2, '660304', '银行手续费', '', 'profit', 'amount', '660304', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76746, 71225, 2, '660305', '其他', '', 'profit', 'amount', '660305', 'CNY', 4, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76747, 75265, 3, '1231030001', '押金-CNY', 'RMB', 'asset', 'amount', '12310301', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 12720.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76748, 75265, 3, '1231030002', '押金-USD', 'USD', 'asset', 'currencyAmount', '12310302', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76749, 75265, 3, '1231030003', '押金-GBP', 'GBP', 'asset', 'currencyAmount', '12310303', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76750, 73164, 3, '6602140006', '停车费', NULL, 'profit', 'amount', '66021406', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76751, 76745, 3, '6603040001', '银行手续费-CNY', 'RMB', 'profit', 'amount', '66030401', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76752, 76745, 3, '6603040002', '银行手续费-USD', 'USD', 'profit', 'currencyAmount', '66030402', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76753, 76745, 3, '6603040003', '银行手续费-GBP', 'GBP', 'profit', 'currencyAmount', '660304', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76754, 76745, 3, '6603040004', '银行手续费-EUR', 'EUR', 'profit', 'currencyAmount', '66030404', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76755, 76745, 3, '6603040005', '银行手续费-HKD', 'HKD', 'profit', 'currencyAmount', '66030405', 'HKD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76756, 76745, 3, '6603040006', '银行手续费-CAD', 'CAD', 'profit', 'currencyAmount', '66030406', 'CAD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76757, 76746, 3, '6603050001', '其他CNY', 'RMB', 'profit', 'amount', '66030501', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76758, 76746, 3, '6603050002', '其他USD', 'USD', 'profit', 'currencyAmount', '66030502', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76759, 76746, 3, '6603050003', '其他GBP', 'GBP', 'profit', 'currencyAmount', '66030503', 'GBP', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76760, 76746, 3, '6603050004', '其他EUR', 'EUR', 'profit', 'currencyAmount', '66030504', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76761, 76746, 3, '6603050005', '其他HKD', 'HKD', 'profit', 'currencyAmount', '66030505', 'HKD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76762, 76746, 3, '6603050006', '其他CAD', 'CAD', 'profit', 'currencyAmount', '66030506', 'CAD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76763, 71241, 2, '110103', '夏秋菊理财', NULL, 'asset', 'amount', '110103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76764, 71244, 2, '112304', '供应商往来-EUR', 'EUR', 'asset', 'currencyAmount', '112304', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76765, 71274, 2, '180101', '在建工程', NULL, 'asset', 'amount', '180101', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76766, 71274, 2, '180102', '技术咨询费', NULL, 'asset', 'amount', '180102', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76767, 71321, 2, '660305', '其他', '', 'profit', 'amount', '660305', 'CNY', 2, 'N', 'Y', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76768, 76767, 3, '6603050001', '其他CNY', 'RMB', 'profit', 'amount', '66030501', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76769, 76767, 3, '6603050002', '其他USD', 'USD', 'profit', 'currencyAmount', '66030502', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76770, 76767, 3, '6603050003', '其他GBP', 'GBP', 'profit', 'currencyAmount', '66030503', 'GBP', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76771, 76767, 3, '6603050004', '其他EUR', 'EUR', 'profit', 'currencyAmount', '66030504', 'EUR', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76772, 76767, 3, '6603050005', '其他HKD', 'HKD', 'profit', 'currencyAmount', '66030505', 'HKD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76773, 76767, 3, '6603050006', '其他CAD', 'CAD', 'profit', 'currencyAmount', '66030506', 'CAD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76774, 71244, 2, '112305', '供应商往来HKD', 'HKD', 'asset', 'currencyAmount', '112305', 'HKD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76775, 71244, 2, '112306', '供应商往来CAD', 'CAD', 'asset', 'currencyAmount', '112306', 'CAD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76776, 71281, 2, '220501', 'CNY', 'RMB', 'liabilities', 'amount', '220501', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 1535269.33, 0.00, 76280.23, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76777, 71281, 2, '220502', 'USD', 'USD', 'liabilities', 'currencyAmount', '220502', 'USD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76781, 71281, 2, '220503', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '220503', 'GBP', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76782, 71281, 2, '220504', 'EUR', 'EUR', 'liabilities', 'currencyAmount', '220504', 'EUR', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76783, 71281, 2, '220505', 'GBP', 'GBP', 'liabilities', 'currencyAmount', '220505', 'GBP', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76786, 71281, 2, '220506', 'CAD', 'CAD', 'liabilities', 'currencyAmount', '220506', 'CAD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76896, 71335, 2, '100211', '瑞晟达浦发银行', '瑞晟达浦发银行', 'asset', 'amount', '100211', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 52595.95, 0.00, 246830.56, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76990, 71343, 2, '123105', '社保-个人', NULL, 'asset', 'amount', '123105', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 12852.15, 0.00, 9894.35, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76991, 71343, 2, '123106', '公积金-个人', NULL, 'asset', 'amount', '123106', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 625.00, 0.00, 153.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76992, 71247, 2, '123105', '社保-个人', NULL, 'asset', 'amount', '123105', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 234.00, 0.00, 234.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76993, 71247, 2, '123106', '公积金-个人', NULL, 'asset', 'amount', '123106', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 708.00, 0.00, 708.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76994, 71151, 2, '123105', '社保-个人', NULL, 'asset', 'amount', '123105', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 117.00, 0.00, 117.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (76995, 71151, 2, '123106', '公积金-个人', NULL, 'asset', 'amount', '123106', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 236.00, 0.00, 118.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (77025, 71379, 2, '222106', '未交增值税', '未交增值税', 'liabilities', 'amount', '222106', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (77026, 71379, 2, '222107', '应交地方教育费附加', '应交地方教育费附加', 'liabilities', 'amount', '222107', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (77167, 71283, 2, '222106', '未交增值税', '未交增值税', 'liabilities', 'amount', '222106', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (77168, 71283, 2, '222107', '应交地方教育费附加', '应交地方教育费附加', 'liabilities', 'amount', '222107', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (81498, 71416, 2, '660222', '招聘费', '招聘费', 'profit', 'amount', '66022', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (81500, 71370, 2, '180103', '招聘费', NULL, 'asset', 'amount', '180103', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 15904.58, 0.00, 12302.61, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (81510, 71239, 2, '100204', '支付宝-供应链', NULL, 'asset', 'amount', '100204', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 3339050.04, 0.00, 1562245.24, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (81615, 75169, 3, '1231030004', '押金-EUR', 'EUR', 'asset', 'currencyAmount', '12310004', 'EUR', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (84580, 71339, 2, '1122CA', 'CAD', 'CAD', 'asset', 'currencyAmount', '1122CA', 'CAD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (85284, 71410, 2, '630108', '罚款收入', NULL, 'profit', 'amount', '630108', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (85285, 71218, 2, '630108', '罚款收入', NULL, 'profit', 'amount', '630108', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (85286, 71314, 2, '630108', '罚款收入', NULL, 'profit', 'amount', '630108', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86821, 71424, 2, '680103', '美国所得税', NULL, 'profit', 'currencyAmount', '680103', 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86954, 71147, 2, '1122CA', 'CAD', 'CAD', 'asset', 'currencyAmount', '1122CA', 'CAD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86955, 71178, 2, '180103', '招聘费', NULL, 'asset', 'amount', '180103', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86956, 71187, 2, '222106', '未交增值税', '未交增值税', 'liabilities', 'amount', '222106', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86957, 71187, 2, '222107', '应交地方教育费附加', '应交地方教育费附加', 'liabilities', 'amount', '222107', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86958, 71224, 2, '660222', '招聘费', '招聘费', 'profit', 'amount', '66022', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86959, 71232, 2, '680103', '美国所得税', NULL, 'profit', 'currencyAmount', '680103', 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86960, 75265, 3, '1231030004', '押金-EUR', 'EUR', 'asset', 'currencyAmount', '12310004', 'EUR', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86961, 71243, 2, '1122CA', 'CAD', 'CAD', 'asset', 'currencyAmount', '1122CA', 'CAD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86962, 71274, 2, '180103', '招聘费', NULL, 'asset', 'amount', '180103', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86963, 71320, 2, '660222', '招聘费', '招聘费', 'profit', 'amount', '66022', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (86964, 71328, 2, '680103', '美国所得税', NULL, 'profit', 'currencyAmount', '680103', 'USD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (87871, 71335, 2, '100212', '富辉通交通银行', NULL, 'asset', 'amount', '100212', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 11601.21, 0.00, 73267.77, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (88144, 71241, 2, '110104', '交通银行理财', NULL, 'asset', 'amount', '110104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (89569, 71370, 2, '180104', '服务费', NULL, 'asset', 'amount', '180104', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 198870.41, 0.00, 76111.13, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (92622, 71376, 2, '2202AU', 'AUD', 'AUD', 'liabilities', 'currencyAmount', '2202AU', 'AUD', 1, 'Y', 'N', 'N', 'N', 'Y', 24616.25, 5160.64, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93538, 71335, 2, '100213', '瑞秋物流工行-USD', NULL, 'asset', 'currencyAmount', '100213', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 4.28, 0.59, 3.93, 0.54, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93539, 71178, 2, '180104', '服务费', NULL, 'asset', 'amount', '180104', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93540, 71184, 2, '2202AU', 'AUD', 'AUD', 'liabilities', 'currencyAmount', '2202AU', 'AUD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93541, 71274, 2, '180104', '服务费', NULL, 'asset', 'amount', '180104', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93542, 71280, 2, '2202AU', 'AUD', 'AUD', 'liabilities', 'currencyAmount', '2202AU', 'AUD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93634, 71377, 2, '220507', '不明款', NULL, 'liabilities', 'amount', '220507', 'CNY', 1, 'N', 'N', 'N', 'N', 'N', 674271.78, 0.00, 68499.34, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93635, 93634, 3, '2205070001', '不明款-CNY', NULL, 'liabilities', 'amount', '22050701', 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 656514.93, 0.00, 53780.43, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93636, 93634, 3, '2205070002', '不明款-USD', NULL, 'liabilities', 'currencyAmount', '22050701', 'USD', 1, 'Y', 'N', 'N', 'N', 'Y', 17756.85, 2449.22, 14718.91, 2024.61, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93637, 93634, 3, '2205070003', '不明款-GBP', NULL, 'liabilities', 'currencyAmount', '22050703', 'GBP', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93638, 93634, 3, '2205070004', '不明款-EUR', NULL, 'liabilities', 'currencyAmount', '22050704', 'EUR', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93639, 93634, 3, '2205070005', '不明款-HKD', NULL, 'liabilities', 'currencyAmount', '22050705', 'HKD', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93640, 93634, 3, '2205070006', '不明款-CAD', NULL, 'liabilities', 'currencyAmount', '22050706', 'CAD', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93641, 71185, 2, '220507', '不明款', NULL, 'liabilities', 'amount', '220507', 'CNY', 4, 'N', 'N', 'N', 'N', 'N', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93642, 93641, 3, '2205070001', '不明款-CNY', NULL, 'liabilities', 'amount', '22050701', 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93643, 93641, 3, '2205070002', '不明款-USD', NULL, 'liabilities', 'currencyAmount', '22050701', 'USD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93644, 93641, 3, '2205070003', '不明款-GBP', NULL, 'liabilities', 'currencyAmount', '22050703', 'GBP', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93645, 93641, 3, '2205070004', '不明款-EUR', NULL, 'liabilities', 'currencyAmount', '22050704', 'EUR', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93646, 93641, 3, '2205070005', '不明款-HKD', NULL, 'liabilities', 'currencyAmount', '22050705', 'HKD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93647, 93641, 3, '2205070006', '不明款-CAD', NULL, 'liabilities', 'currencyAmount', '22050706', 'CAD', 4, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93648, 71281, 2, '220507', '不明款', NULL, 'liabilities', 'amount', '220507', 'CNY', 2, 'N', 'N', 'N', 'N', 'N', 26678.50, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93649, 93648, 3, '2205070001', '不明款-CNY', NULL, 'liabilities', 'amount', '22050701', 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 26678.50, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93650, 93648, 3, '2205070002', '不明款-USD', NULL, 'liabilities', 'currencyAmount', '22050701', 'USD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93651, 93648, 3, '2205070003', '不明款-GBP', NULL, 'liabilities', 'currencyAmount', '22050703', 'GBP', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93652, 93648, 3, '2205070004', '不明款-EUR', NULL, 'liabilities', 'currencyAmount', '22050704', 'EUR', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93653, 93648, 3, '2205070005', '不明款-HKD', NULL, 'liabilities', 'currencyAmount', '22050705', 'HKD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93654, 93648, 3, '2205070006', '不明款-CAD', NULL, 'liabilities', 'currencyAmount', '22050706', 'CAD', 2, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93657, 71382, 2, '224104', '预提费用', NULL, 'liabilities', 'amount', NULL, 'CNY', 1, 'N', 'N', 'N', 'N', 'Y', 10464.00, 0.00, 19617.20, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (93661, 71286, 2, '224104', '预提费用', NULL, 'liabilities', 'amount', NULL, 'CNY', 2, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (95146, 71335, 2, '100214', '供应链中行', NULL, 'asset', 'amount', '100214', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (95147, 71190, 2, '224104', '预提费用', NULL, 'liabilities', 'amount', NULL, 'CNY', 4, 'N', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (95281, 71337, 2, '110104', '香港USD理财', NULL, 'asset', 'currencyAmount', NULL, 'USD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (96304, 71335, 2, '100215', '宁波银行-CNY', NULL, 'asset', 'amount', '100215', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 4797233.11, 0.00, 133093.38, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (96330, 71145, 2, '110104', '香港USD理财', NULL, 'asset', 'currencyAmount', NULL, 'USD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (97036, 71339, 2, '1122AU', 'AUD', 'AUD', 'asset', 'currencyAmount', '1122AU', 'AUD', 1, 'Y', 'Y', 'N', 'N', 'Y', -3373.06, -707.14, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98136, 71337, 2, '110105', '宁波银行理财', NULL, 'asset', 'amount', NULL, 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 10700000.00, 0.00, 16462611.10, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98200, 71415, 2, '660123', '培训费', NULL, 'profit', 'amount', '660123', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'Y', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98201, 71335, 2, '100216', '宁波银行-USD', NULL, 'asset', 'currencyAmount', '100216', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 161256.31, 22242.25, 186667.50, 25676.41, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98202, 71145, 2, '110105', '宁波银行理财', NULL, 'asset', 'amount', NULL, 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98203, 71147, 2, '1122AU', 'AUD', 'AUD', 'asset', 'currencyAmount', '1122AU', 'AUD', 4, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98204, 71223, 2, '660123', '培训费', NULL, 'profit', 'amount', '660123', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98205, 71241, 2, '110105', '宁波银行理财', NULL, 'asset', 'amount', NULL, 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98206, 71243, 2, '1122AU', 'AUD', 'AUD', 'asset', 'currencyAmount', '1122AU', 'AUD', 2, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98207, 71319, 2, '660123', '培训费', NULL, 'profit', 'amount', '660123', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (98208, 71416, 2, '660223', '培训费', NULL, 'profit', 'amount', '660223', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (99266, 71335, 2, '100217', '宁波银行-EUR', NULL, 'asset', 'currencyAmount', '100217', 'EUR', 1, 'Y', 'Y', 'N', 'Y', 'Y', 2607875.58, 336934.83, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (99267, 71224, 2, '660223', '培训费', NULL, 'profit', 'amount', '660223', 'CNY', 4, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (99268, 71320, 2, '660223', '培训费', NULL, 'profit', 'amount', '660223', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (105043, 71376, 2, '2202CH', 'CHF', 'CHF', 'liabilities', 'currencyAmount', '2202CH', 'CHF', 1, 'Y', 'N', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (106140, 71335, 2, '100218', '宁波银行-GBP', NULL, 'asset', 'currencyAmount', '100218', 'GBP', 1, 'Y', 'Y', 'N', 'Y', 'Y', 436.25, 48.58, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (108453, 71335, 2, '100219', '瑞晟达中行', NULL, 'asset', 'amount', '100219', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 18.56, 0.00, 2308.83, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (109060, 71416, 2, '660216', '业务宣传费', NULL, 'profit', 'amount', '660216', 'CNY', 1, 'N', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'Y', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (110153, 71340, 2, '112305', '供应商往为-CAD', 'CAD', 'asset', 'currencyAmount', NULL, 'CAD', 1, 'Y', 'Y', 'N', 'N', 'Y', 12610.94, 2344.04, 50909.21, 9341.14, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (112244, 71340, 2, '112306', '供应商往来-AUD', 'AUD', 'asset', 'currencyAmount', '112306', 'AUD', 1, 'Y', 'Y', 'N', 'N', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Y', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (114228, 71335, 2, '100220', '瑞秋物流宝安分公司工行-CNY', '', 'asset', 'amount', '100220', 'CNY', 1, 'N', 'Y', 'N', 'Y', 'Y', 43561.10, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (114569, 71239, 2, '100205', '供应链宁波银行', NULL, 'asset', 'amount', '100205', 'CNY', 2, 'N', 'Y', 'N', 'N', 'Y', 331423.51, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (119000, 71335, 2, '100221', '美国银行-USD-2（7791）', NULL, 'asset', 'currencyAmount', '100221', 'USD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 97866.30, 13498.80, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);
INSERT INTO `fx_account_titles` VALUES (119586, 72504, 3, '1002040007', '香港汇丰银行--AUD', 'AUD', 'asset', 'currencyAmount', '10020407', 'AUD', 1, 'Y', 'Y', 'N', 'Y', 'Y', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'N', 'N', 'N', 'N', 1, '2023-10-31 06:18:04', '2023-10-31 06:18:04', 1);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'fx_account_titles', '会计科目表', NULL, NULL, 'AccountTitle', 'crud', 'com.ruoyi.data', 'data', 'titles', '会计科目', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (31, 2, 'id', NULL, 'bigint(11) unsigned', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (32, 2, 'pid', '上一级，0为顶级', 'int(11)', 'Long', 'pid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (33, 2, 'level', '级次1,2,3,4,5', 'bigint(11)', 'Long', 'level', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (34, 2, 'code', '科目代码', 'varchar(100)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (35, 2, 'cn_name', '中文名', 'varchar(100)', 'String', 'cnName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (36, 2, 'en_name', '英文名', 'varchar(100)', 'String', 'enName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (37, 2, 'type', '科目类型asset:资产类,profit:损益类,cost:成本类,common:共同类,ownership:所有者权益类,liabilities:负债类,settlement:结算对象类', 'varchar(20)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (38, 2, 'format', '账页格式amount:金额式,currencyAmount:外币式金额', 'varchar(20)', 'String', 'format', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (39, 2, 'abb', '助记码', 'varchar(100)', 'String', 'abb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (40, 2, 'currency', '核算币种', 'varchar(10)', 'String', 'currency', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (41, 2, 'com_id', '公司ID', 'int(11)', 'Long', 'comId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (42, 2, 'is_foreign', '是否是外币核算Y是N否', 'char(1)', 'String', 'isForeign', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (43, 2, 'is_dn', '余额方向Y借方N贷方', 'char(1)', 'String', 'isDn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (44, 2, 'is_freezed', '是否冻结Y是N否', 'char(1)', 'String', 'isFreezed', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (45, 2, 'is_cash', '是否现金流科目Y是N否', 'char(1)', 'String', 'isCash', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (46, 2, 'is_last', '是否末级科目Y是N否', 'char(1)', 'String', 'isLast', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (47, 2, 'balance', '期末余额', 'decimal(11,2)', 'BigDecimal', 'balance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (48, 2, 'currency_balance', '核算币种余额统计', 'decimal(11,2)', 'BigDecimal', 'currencyBalance', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (49, 2, 'year_begining', '年初余额', 'decimal(11,2)', 'BigDecimal', 'yearBegining', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (50, 2, 'year_begining_currency', '年初余额(核算币种)', 'decimal(11,2)', 'BigDecimal', 'yearBeginingCurrency', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (51, 2, 'account_opening', '开户时的余额', 'decimal(11,2)', 'BigDecimal', 'accountOpening', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (52, 2, 'account_opening_currency', '开户时的余额余额', 'decimal(11,2)', 'BigDecimal', 'accountOpeningCurrency', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (53, 2, 'vender_required', '往来单位是否必填', 'char(1)', 'String', 'venderRequired', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (54, 2, 'clerk_required', '员工是否必填', 'char(1)', 'String', 'clerkRequired', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (55, 2, 'team_required', '部门是否必填', 'char(1)', 'String', 'teamRequired', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (56, 2, 'branch_required', '分公司是否必填', 'char(1)', 'String', 'branchRequired', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (57, 2, 'created_by', '创建人', 'bigint(20)', 'Long', 'createdBy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (58, 2, 'created_time', '创建时间', 'timestamp', 'Date', 'createdTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 28, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (59, 2, 'updated_time', '修改时间', 'timestamp', 'Date', 'updatedTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 29, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');
INSERT INTO `gen_table_column` VALUES (60, 2, 'updated_by', '更新人', 'bigint(20)', 'Long', 'updatedBy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2023-11-13 17:10:03', '', '2023-11-13 17:12:11');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-11-13 16:05:28', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-11-13 16:05:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-13 16:15:43');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-13 16:15:59');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-13 16:15:59');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 16:16:36');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-11-13 17:31:53');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 17:32:00');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-11-13 16:05:28', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-11-13 16:05:28', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-11-13 16:05:28', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-11-13 16:05:28', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-11-13 16:05:28', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-11-13 16:05:28', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-11-13 16:05:28', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-11-13 16:05:28', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-11-13 16:05:28', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-11-13 16:05:28', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-11-13 16:05:28', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-11-13 16:05:28', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-11-13 16:05:28', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-11-13 16:05:28', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-11-13 16:05:28', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-11-13 16:05:28', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-11-13 16:05:28', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-11-13 16:05:28', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-11-13 16:05:28', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-11-13 16:05:28', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-11-13 16:05:28', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-11-13 16:05:28', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-11-13 16:05:28', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '财务资料', 0, 0, 'data', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'nested', 'admin', '2023-11-13 16:26:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '会计科目', 2000, 1, 'titles', 'data/titles/index', NULL, 1, 0, 'C', '0', '0', 'data:titles:list', 'build', 'admin', '2023-11-13 16:41:06', 'admin', '2023-11-13 17:16:52', '会计科目菜单');
INSERT INTO `sys_menu` VALUES (2003, '会计科目查询', 2002, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:titles:query', '#', 'admin', '2023-11-13 16:41:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '会计科目新增', 2002, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:titles:add', '#', 'admin', '2023-11-13 16:41:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '会计科目修改', 2002, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:titles:edit', '#', 'admin', '2023-11-13 16:41:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '会计科目删除', 2002, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:titles:remove', '#', 'admin', '2023-11-13 16:41:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '会计科目导出', 2002, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'data:titles:export', '#', 'admin', '2023-11-13 16:41:06', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:05:53', 152);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 16:06:36', 259);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"FxAccountTitles\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":2,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":3,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":4,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:07:27', 83);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitle\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:07:27\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":2,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:07:27\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":3,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:07:27\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":4,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:09:34', 67);
INSERT INTO `sys_oper_log` VALUES (104, '定时任务', 5, 'com.ruoyi.quartz.controller.SysJobController.export()', 'POST', 1, 'admin', NULL, '/monitor/job/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-13 16:14:57', 722);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 16:21:27', 70);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"财务资料\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"data\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:26:35', 4);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitle\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:09:34\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":2,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:09:34\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":3,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:09:34\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":4,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:26:55', 75);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 16:27:11', 80);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitle\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:26:55\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":2,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:26:55\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":3,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:26:55\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":4,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:28:58', 86);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 16:29:02', 39);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitle\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:28:58\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":2,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:28:58\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":3,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 16:28:58\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":4,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 16:05:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:32:22', 69);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 16:32:24', 79);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"会计科目\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"data/titles\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:36:49', 15);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-11-13 16:36:49\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"会计科目\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"titles\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 16:38:04', 17);
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', NULL, 0, NULL, '2023-11-13 17:09:42', 256);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:09:57', 34);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"fx_account_titles\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:10:03', 168);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"FxAccountTitles\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":32,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":33,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":34,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:10:15', 108);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitles\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:10:14\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":32,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:10:14\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":33,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:10:14\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":34,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:11:30', 96);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"titles\",\"className\":\"AccountTitle\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"bigint(11) unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:11:30\",\"usableColumn\":false},{\"capJavaField\":\"Pid\",\"columnComment\":\"上一级，0为顶级\",\"columnId\":32,\"columnName\":\"pid\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"pid\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:11:30\",\"usableColumn\":false},{\"capJavaField\":\"Level\",\"columnComment\":\"级次1,2,3,4,5\",\"columnId\":33,\"columnName\":\"level\",\"columnType\":\"bigint(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"level\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-11-13 17:11:30\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"科目代码\",\"columnId\":34,\"columnName\":\"code\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2023-11-13 17:10:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"i', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:12:12', 81);
INSERT INTO `sys_oper_log` VALUES (121, '会计科目', 5, 'com.ruoyi.data.controller.AccountTitleController.export()', 'POST', 1, 'admin', NULL, '/data/titles/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-13 17:15:26', 1272);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"data/titles/index\",\"createTime\":\"2023-11-13 16:41:06\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"会计科目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"titles\",\"perms\":\"data:titles:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:16:52', 23);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-11-13 17:18:26', 40);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-11-13 16:05:28\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:18:45', 54);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:18:52', 24);
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-13 17:20:52', 17);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-11-13 16:05:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-11-13 16:05:28', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-11-13 16:05:28', 'admin', '2023-11-13 17:18:45', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-13 17:32:00', 'admin', '2023-11-13 16:05:28', '', '2023-11-13 17:32:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-13 16:05:28', 'admin', '2023-11-13 16:05:28', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
