/*
 Navicat Premium Data Transfer

 Source Server         : 我们的服务器
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : 172.17.0.1:3308
 Source Schema         : plm_demo

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 19/10/2022 10:51:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` bigint unsigned NOT NULL,
  `parent_id` bigint(0) NULL DEFAULT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Department Name',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id_index`(`parent_id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, NULL, '集团总部', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `department` VALUES (2, 1, '上海分公司', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `department` VALUES (3, 1, '常州分公司', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint unsigned NOT NULL,
  `sn` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Product SN',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Product Name',
  `supplier_id` bigint(0) NULL DEFAULT NULL,
  `type` enum('finished','component','standard','utils','dashboard') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'finished' COMMENT 'Product Type',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Remark',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sn_index`(`sn`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `supplier_id_index`(`supplier_id`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '8LC.940.001', '加长六角螺母', 22, 'standard', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (2, 'GB/T70.1  M6x145', '内六角圆柱头螺钉', 165, 'standard', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (3, 'GB/T9074.8 M3x30', '组合螺钉', 108, 'standard', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (4, 'GB/T 845 ST6.3x19', '十字槽大扁头自攻螺丝', 141, 'standard', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (5, '8LC.744.002', '灭弧罩', 2, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (6, '8LC.233.003', '连杆', 71, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (7, '8LC.300.002', '罩', 175, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (8, '8LC.750.002', '绝缘板', 60, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (9, '8LC.043.004', '支座', 17, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (10, '8LC.043.004', '支座', 115, 'component', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (11, '5LC.050.005', '铆钉旋铆夹具', 44, 'utils', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (12, '5LC.050.006', '铆钉旋铆夹具', 159, 'utils', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (13, '5LC.550.008', '侧板装配夹具', 169, 'utils', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (14, '8LC.282.003', '弹簧', 29, 'dashboard', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `product` VALUES (15, 'JSLC-2022-001', '框架断路器5000', 143, 'finished', NULL, 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` bigint unsigned NOT NULL,
  `sn` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `start` date NULL DEFAULT NULL COMMENT '开始时间',
  `end` date NULL DEFAULT NULL COMMENT '结束时间',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` enum('pending','complete','archive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sn_index`(`sn`) USING BTREE,
  INDEX `start_index`(`start`) USING BTREE,
  INDEX `end_index`(`end`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 'JSLC-2021-001', '2021-01-01', '2021-05-31', '框架断路器5000(本体、抽架)', NULL, 'archive', NULL, '2022-10-19 06:37:06', '2022-10-19 07:06:57', NULL);
INSERT INTO `project` VALUES (2, 'JSLC-2021-002', '2021-02-18', '2021-06-30', '框架断路器1600(本体、抽架)', NULL, 'archive', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (3, 'JSLC-2021-003', '2021-04-18', '2021-12-31', '框架断路器2000(本体、抽架)', NULL, 'archive', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (4, 'JSLC-2022-001', '2022-01-01', '2022-08-31', '框架断路器5000(本体、抽架)', NULL, 'complete', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (5, 'JSLC-2022-002', '2022-06-12', '2022-09-30', '框架断路器3200(本体、抽架)', NULL, 'complete', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (6, 'JSLC-2022-003', '2022-08-31', '2022-12-31', '框架断路器2000(本体、抽架)', NULL, 'pending', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (7, 'JSLC-2022-004', '2022-09-16', '2023-01-30', '框架断路器4000(本体、抽架)', NULL, 'pending', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project` VALUES (8, 'JSLC-2022-005', '2022-10-10', '2023-05-30', '框架断路器1000(本体、抽架)', NULL, 'pending', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for project_member
-- ----------------------------
DROP TABLE IF EXISTS `project_member`;
CREATE TABLE `project_member`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `staff_id` bigint(0) NOT NULL COMMENT 'Staff ID',
  `is_manager` tinyint(1) NULL DEFAULT NULL COMMENT 'Is Manager',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `staff_id_index`(`staff_id`) USING BTREE,
  INDEX `is_manager_index`(`is_manager`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_member
-- ----------------------------
INSERT INTO `project_member` VALUES (1, 1, 1, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (2, 1, 2, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (3, 1, 3, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (4, 1, 4, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (5, 1, 5, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (6, 1, 6, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (7, 2, 7, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (8, 2, 8, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (9, 2, 9, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (10, 2, 10, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (11, 2, 11, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (12, 2, 12, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (13, 3, 13, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (14, 3, 14, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (15, 3, 15, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (16, 3, 16, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (17, 3, 17, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (18, 3, 18, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (19, 4, 19, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (20, 4, 20, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (21, 4, 21, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (22, 4, 22, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (23, 4, 23, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (24, 4, 24, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (25, 5, 25, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (26, 5, 26, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (27, 5, 27, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (28, 5, 28, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (29, 5, 29, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (30, 5, 30, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (31, 6, 31, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (32, 6, 32, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (33, 6, 33, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (34, 6, 34, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (35, 6, 35, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (36, 6, 36, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (37, 7, 37, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (38, 7, 38, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (39, 7, 39, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (40, 7, 40, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (41, 7, 41, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (42, 7, 42, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (43, 8, 43, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (44, 8, 44, 1, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (45, 8, 45, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (46, 8, 46, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (47, 8, 47, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_member` VALUES (48, 8, 48, 0, NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for project_milestone
-- ----------------------------
DROP TABLE IF EXISTS `project_milestone`;
CREATE TABLE `project_milestone`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `step_id` bigint(0) NOT NULL COMMENT 'Step ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '里程碑',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `step_id_index`(`step_id`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_milestone
-- ----------------------------
INSERT INTO `project_milestone` VALUES (1, 1, 1, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (2, 1, 1, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (3, 1, 1, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (4, 1, 2, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (5, 1, 3, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (6, 1, 3, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (7, 1, 4, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (8, 1, 4, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (9, 2, 5, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (10, 2, 5, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (11, 2, 5, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (12, 2, 6, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (13, 2, 7, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (14, 2, 7, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (15, 2, 8, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (16, 2, 8, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (17, 3, 9, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (18, 3, 9, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (19, 3, 9, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (20, 3, 10, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (21, 3, 11, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (22, 3, 11, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (23, 3, 12, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (24, 3, 12, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (25, 4, 13, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (26, 4, 13, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (27, 4, 13, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (28, 4, 14, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (29, 4, 15, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (30, 4, 15, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (31, 4, 16, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (32, 4, 16, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (33, 5, 17, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (34, 5, 17, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (35, 5, 17, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (36, 5, 18, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (37, 5, 19, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (38, 5, 19, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (39, 5, 20, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (40, 5, 20, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (41, 6, 21, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (42, 6, 21, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (43, 6, 21, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (44, 6, 22, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (45, 6, 23, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (46, 6, 23, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (47, 6, 24, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (48, 6, 24, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (49, 7, 25, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (50, 7, 25, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (51, 7, 25, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (52, 7, 26, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (53, 7, 27, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (54, 7, 27, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (55, 7, 28, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (56, 7, 28, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (57, 8, 29, '确定方案', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (58, 8, 29, '样机验证及结构优化（第一轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (59, 8, 29, '样机验证及结构优化（第二轮）', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (60, 8, 30, '零件开模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (61, 8, 31, '修模', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (62, 8, 31, '样品加工', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (63, 8, 32, '验证', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_milestone` VALUES (64, 8, 32, '技术归档', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for project_step
-- ----------------------------
DROP TABLE IF EXISTS `project_step`;
CREATE TABLE `project_step`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Step',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_step
-- ----------------------------
INSERT INTO `project_step` VALUES (1, 1, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (2, 1, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (3, 1, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (4, 1, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (5, 2, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (6, 2, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (7, 2, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (8, 2, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (9, 3, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (10, 3, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (11, 3, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (12, 3, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (13, 4, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (14, 4, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (15, 4, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (16, 4, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (17, 5, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (18, 5, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (19, 5, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (20, 5, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (21, 6, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (22, 6, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (23, 6, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (24, 6, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (25, 7, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (26, 7, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (27, 7, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (28, 7, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (29, 8, '第一阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (30, 8, '第二阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (31, 8, '第三阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `project_step` VALUES (32, 8, '第四阶段', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for project_template
-- ----------------------------
DROP TABLE IF EXISTS `project_template`;
CREATE TABLE `project_template`  (
  `id` bigint unsigned NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模板名称',
  `data` json NULL COMMENT 'T:json|模板正文',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_template
-- ----------------------------
INSERT INTO `project_template` VALUES (1, '框架断路器1000,1600,2000,3200,4000,5000', '{\"steps\": [{\"name\": \"第一阶段\", \"milestones\": [{\"name\": \"确定方案\", \"tasks\": [{\"name\": \"产品结构改进设计及评审\", \"deliverables\": [{\"name\": \"3D模型\", \"nums\": 1}]}]}, {\"name\": \"样机验证及结构优化（第一轮）\", \"tasks\": [{\"name\": \"样机加工零件、样机装配\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 5}]}, {\"name\": \"温升试验\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 1}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}, {\"name\": \"分断（1天）、短耐性能试验\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 2}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}, {\"name\": \"试验评审、整机模型修改\", \"deliverables\": [{\"name\": \"工程图（开模）\", \"nums\": 1}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}]}, {\"name\": \"样机验证及结构优化（第二轮）\", \"tasks\": [{\"name\": \"样机加工零件、样机装配\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 5}]}, {\"name\": \"温升试验\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 1}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}, {\"name\": \"分断（1天）、短耐性能试验\", \"deliverables\": [{\"name\": \"样品\", \"nums\": 2}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}, {\"name\": \"试验评审、整机模型修改\", \"deliverables\": [{\"name\": \"3D模型\", \"nums\": 1}, {\"name\": \"试验报告、整改意见\", \"nums\": 1}]}]}]}, {\"name\": \"第二阶段\", \"milestones\": [{\"name\": \"\", \"tasks\": [{\"name\": \"工程图定稿\", \"deliverables\": [{\"name\": \"工程图（开模）\", \"nums\": 1}]}]}, {\"name\": \"零件开模\", \"tasks\": [{\"name\": \"合同签订\", \"deliverables\": [{\"name\": \"合同\", \"nums\": 1}]}, {\"name\": \"开模\", \"deliverables\": [{\"name\": \"模具\", \"nums\": 1}]}, {\"name\": \"检卡定稿\", \"deliverables\": [{\"name\": \"检卡\", \"nums\": 1}]}, {\"name\": \"首样确认\", \"deliverables\": [{\"name\": \"首样照片\", \"nums\": 1}]}]}]}, {\"name\": \"第三阶段\", \"milestones\": [{\"name\": \"修模\", \"tasks\": [{\"name\": \"修模计划下发\", \"deliverables\": [{\"name\": \"修模计划书\", \"nums\": 1}]}, {\"name\": \"开模\", \"deliverables\": [{\"name\": \"模具\", \"nums\": 1}]}, {\"name\": \"修模件确认\", \"deliverables\": [{\"name\": \"产品\", \"nums\": 1}]}]}, {\"name\": \"样品加工\", \"tasks\": [{\"name\": \"产品小批量试制及3C样机\", \"deliverables\": [{\"name\": \"试制报告（含修模计划）\", \"nums\": 1}]}]}]}, {\"name\": \"第四阶段\", \"milestones\": [{\"name\": \"验证\", \"tasks\": [{\"name\": \"开模件产品验证\", \"deliverables\": [{\"name\": \"试验报告\", \"nums\": 1}]}]}, {\"name\": \"\", \"tasks\": [{\"name\": \"3C认证\", \"deliverables\": [{\"name\": \"样机\", \"nums\": 20}, {\"name\": \"认证报告\", \"nums\": 1}]}]}, {\"name\": \"技术归档\", \"tasks\": [{\"name\": \"结题归档\", \"deliverables\": [{\"name\": \"全套项目资料\", \"nums\": 1}]}]}]}]}', NULL, '2022-10-19 06:37:07', NULL, NULL);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` bigint unsigned NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Mobile',
  `department_ids` json NULL COMMENT 'T:json|Department IDs',
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Password',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Full Name',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `mobile_unique`(`mobile`) USING BTREE,
  INDEX `password_index`(`password`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'fqogroh@iqka.com', '31BDB1BC2D23A8422D7989C6AEFD23B2', '[1, 2]', NULL, '唐熠宁', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (2, 'jekb@iqka.com', 'C560FDAB06DE31E5A3AC067A8BA3474C', '[1, 3]', NULL, '唐惟漫', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (3, 'lcebbvr@iqka.com', '208021D2097F21917FCF754F8EA1F958', '[1, 2]', NULL, '翟里炎', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (4, 'ouhcswtmaivraaf@iqka.com', '334D605EB33B0C75EF1595FF6AFDEA1E', '[1, 2]', NULL, '毛闯鸿', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (5, 'jllewpadfre@iqka.com', '8E5A19E06138DDB047151DA1C3F1FF6A', '[1, 3]', NULL, '费念怡', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (6, 'hhowcho@iqka.com', '55F08A3735D19EEB728F198DE21A3749', '[1, 2]', NULL, '樊寒焘', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (7, 'gevolmitlhhku@iqka.com', '1FAF8440992B58466CB78A5DF7E25BBD', '[1, 3]', NULL, '谭言宝', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (8, 'omjmavueta@iqka.com', '852C196EB1C7A150515E1FA7D4D38A68', '[1, 3]', NULL, '喻俏会', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (9, 'kfprwopjjifm@iqka.com', '406129900D6DDB787A12EBD894BA5149', '[1, 3]', NULL, '赵霞静', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (10, 'qkgeovjrkrpbmn@iqka.com', 'EC45468158A8ACAEE2588BE1FC129003', '[1, 2]', NULL, '乔汝婵', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (11, 'pvchvta@iqka.com', '02D35BA214000A5656CFF67B4D180742', '[1, 3]', NULL, '宫姬彩', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (12, 'pbmpobk@iqka.com', 'BD4122E2B72941497D041FF3F9DDDE72', '[1, 2]', NULL, '班璇椒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (13, 'iwntn@iqka.com', '04567B5D378E378A1CF3E68768E91D3B', '[1, 2]', NULL, '乔昭毓', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (14, 'pmvnawkapja@iqka.com', '0C2703D1DE5CDC8B4107569500BA4188', '[1, 3]', NULL, '符鸽芸', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (15, 'qlgvowp@iqka.com', 'A8B4A1BE2F981EEBB634E333E13B6559', '[1, 3]', NULL, '柯洲国', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (16, 'nccf@iqka.com', '84BB891B85705C1A7D0C3B600F92CCCB', '[1, 2]', NULL, '骆芝斐', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (17, 'qamgbwrragmjh@iqka.com', '55E05BE1B7CCA0D23BF20E2B2C705A09', '[1, 2]', NULL, '樊璐萱', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (18, 'atpjcpghwvkind@iqka.com', '5E54B8634B29E365473CD9E7AD94F665', '[1, 2]', NULL, '童一钰', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (19, 'amjpsgwu@iqka.com', '50E396297F30B00305D367F319A6E9C5', '[1, 3]', NULL, '龙隽妲', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (20, 'nkgopfqmhdof@iqka.com', '1C55AC97D0803D6623344275A8B9380C', '[1, 3]', NULL, '祖渝印', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (21, 'qwnlibotqjogwq@iqka.com', 'C1C649103E38383145987FA7E747EBDE', '[1, 2]', NULL, '龙遥根', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (22, 'qlnb@iqka.com', '045F503EA548E5B315931486285813B4', '[1, 2]', NULL, '常嫚娅', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (23, 'vtpipoqfvajlect@iqka.com', '1259E89DA8E4F905007A0C5FB35C4062', '[1, 2]', NULL, '黄爽闻', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (24, 'bhuugutb@iqka.com', '8E83C5D8270DC593A0AF47E0C13785C5', '[1, 2]', NULL, '滕名劫', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (25, 'hplnssnngwt@iqka.com', '8600451036D934D395E538EB9234A563', '[1, 3]', NULL, '盛熠婉', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (26, 'fsqhjvq@iqka.com', 'D0B64A9EF86DA1BCBEA96E1BEA252B08', '[1, 2]', NULL, '白迅盈', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (27, 'ccuuqpdpdqbanqi@iqka.com', '153DEC9B928D0AD7944B88788783CDFC', '[1, 2]', NULL, '汤俊越', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (28, 'epcetvudactldmt@iqka.com', '34D391BA443F10FFE8E1516205E13DE9', '[1, 3]', NULL, '黄筝群', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (29, 'ccmfsotdoujnutq@iqka.com', 'C89E4B391E99AC4C202D7A6D97484C04', '[1, 3]', NULL, '沈钧喆', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (30, 'krdrslcee@iqka.com', 'C6C454013C868A335C7D50FCC7B681E9', '[1, 3]', NULL, '祖兰唯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (31, 'uotplntculdd@iqka.com', 'C0CC0AD05F13676D63C2A5A8583D2CE4', '[1, 3]', NULL, '诸梓欢', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (32, 'mswmv@iqka.com', '5A63328BA6213A084802D7F80E3A0D77', '[1, 3]', NULL, '花进麒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (33, 'hfdihbjjc@iqka.com', '18F56A603720BA654278CC3444A18ED7', '[1, 2]', NULL, '白赫凌', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (34, 'owiac@iqka.com', '878F524F1962DB7F5273E4FE77C713EC', '[1, 3]', NULL, '冯慈炯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (35, 'fgwjsrsvfihon@iqka.com', '377FE694389AE69BAF6D7443A5C6BA30', '[1, 3]', NULL, '蒙贞寒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (36, 'svdpukqglncequg@iqka.com', 'E9D8E84E82256F1514A14B23F054C4A9', '[1, 3]', NULL, '苗晓雯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (37, 'rcbrnpmmq@iqka.com', 'BCA92338DE0DEEDDB6D9DDD433F73D18', '[1, 2]', NULL, '丁亚侃', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (38, 'kfdvrsseip@iqka.com', '20593D670B7F40FD24F4B49DA20DE8B2', '[1, 3]', NULL, '班迅蕾', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (39, 'pdobvsjhoaupqn@iqka.com', '0371B87272C92DAE56FA55EDFD8EE4FD', '[1, 2]', NULL, '卢玄昀', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (40, 'mshcj@iqka.com', '8770D1EF2A4FF4E805751D7DBC6EC781', '[1, 2]', NULL, '符知亚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (41, 'whaldmshim@iqka.com', '0FC954980B2FF9C5DBB142750AF389A5', '[1, 3]', NULL, '韩俏菊', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (42, 'npbvjqoud@iqka.com', '5FBBF36C483D3DF0C453D624DF18233C', '[1, 2]', NULL, '戚铎渊', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (43, 'cmmmj@iqka.com', '836DB1DCF156512389E5DD3E4E4D95E3', '[1, 2]', NULL, '毛冰烁', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (44, 'mfatfgf@iqka.com', '60D45C3301A7F8870A16ECCA7D6D1DF4', '[1, 3]', NULL, '岑润含', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (45, 'tonsfnaflica@iqka.com', '8D7A38ADA38255DDD7539BBAC3C14586', '[1, 2]', NULL, '乔壮富', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (46, 'fccpffiur@iqka.com', 'E73C0CDA9E9AC39E2BB47E1ED474AD5C', '[1, 3]', NULL, '惠音彤', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (47, 'vqefbiqgh@iqka.com', '4B02F06D50A3DE1AA7E7CA37E3F32ADF', '[1, 2]', NULL, '宗卿煊', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (48, 'ibsdtpmf@iqka.com', '0A2AD9A6A3FAFEDDBAAFEAA6FB00F842', '[1, 3]', NULL, '秋冰爽', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (49, 'aekithcvdaatt@iqka.com', 'B21C2700DF354A0AF7CFCBE8BB06216C', '[1, 3]', NULL, '陆鹰利', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (50, 'doca@iqka.com', 'A39E6588EB2985C2FED88B384D3CCEA2', '[1, 3]', NULL, '荣筱嫒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (51, 'aqdcb@iqka.com', 'FB400372FDDBFF3243174A3FE29E7416', '[1, 2]', NULL, '吴纳冶', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (52, 'hmo@iqka.com', '46F72615876517C09125830390360DA1', '[1, 2]', NULL, '纪沛梅', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (53, 'mrpgqwnepeo@iqka.com', '6BBDBFD28E2214E8815C7DC361F814EF', '[1, 3]', NULL, '万钰勃', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (54, 'kmbqm@iqka.com', '5F7AF3BB2EC9FB69A1377B8205B71A91', '[1, 3]', NULL, '吴凝莹', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (55, 'vsmu@iqka.com', '0A42126D7772342E124F82EC0C4E9363', '[1, 2]', NULL, '贡彬文', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (56, 'gjcbpmorwow@iqka.com', '700A6FF91E61C81CE39A100968F2C761', '[1, 2]', NULL, '方娜佳', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (57, 'kfocwgmhr@iqka.com', 'E479057E73424B4E80D42C56DC4A0BD9', '[1, 3]', NULL, '黄书乐', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (58, 'tgoahkfns@iqka.com', 'CBCA459C58C4E80CEDCD7F80D540E427', '[1, 2]', NULL, '包望枫', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (59, 'ocju@iqka.com', '0A5F1DFA5A15F726297CB8FDE7D7C05B', '[1, 3]', NULL, '严佳艺', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (60, 'uupajpnlao@iqka.com', 'D1AC65A03D056EC33D4FE8B8D18B1BB6', '[1, 3]', NULL, '任柯生', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (61, 'uawlanurm@iqka.com', '49E8B04A1A10862B99658C040F5DBEE0', '[1, 2]', NULL, '谭起照', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (62, 'kofdmistuhsrl@iqka.com', '6F8FD900FBA7D6990443160C875EC99A', '[1, 3]', NULL, '傅渊山', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (63, 'jugh@iqka.com', 'BEB27D16994692242A2BC1A083249B47', '[1, 2]', NULL, '苏鑫言', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (64, 'frnjsneohcaeph@iqka.com', '4F36A679B32BC8F71F9233A034A43D8E', '[1, 2]', NULL, '成蕙雯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (65, 'jfjtugsocgpd@iqka.com', '45F83E5C69E2627C53DBA0AC72523660', '[1, 3]', NULL, '尚钰群', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (66, 'ubdhnuhbu@iqka.com', '75A894F68DC4B865792F8058DC451CA5', '[1, 2]', NULL, '宗章田', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (67, 'jnhrkr@iqka.com', '48ADD828B22219B843CAF66B820DCDA2', '[1, 2]', NULL, '花瑾笛', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (68, 'cdkqpekjknkdkc@iqka.com', '993AA32736E6A96C2CA17DB99C478E78', '[1, 3]', NULL, '包程武', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (69, 'jqqf@iqka.com', 'E37C0D8F6AA818CEC87F659CD9DA8BB3', '[1, 3]', NULL, '解烽璋', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (70, 'qoswqmwafmmhtgd@iqka.com', '4125D3F97EC5F7299EEEF4B5167C6255', '[1, 3]', NULL, '魏羿如', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (71, 'prfupudgu@iqka.com', '499F0804DC31F2AF32910EFDC2813353', '[1, 3]', NULL, '郦雄峥', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (72, 'jdgeobfsdlikac@iqka.com', 'D8FE5F44439A9C1CC174BB26A4CCF982', '[1, 3]', NULL, '蒋迁准', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (73, 'kdubc@iqka.com', 'B2F50216946EBBA6FA03730E58EB31B3', '[1, 2]', NULL, '庞兰萱', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (74, 'evnrvki@iqka.com', 'E3BA6142EF0D3AE972160D43FA3DEF63', '[1, 2]', NULL, '程娣苹', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (75, 'sllcsd@iqka.com', '8B4891D1ACA36037C5CB397318D71E01', '[1, 3]', NULL, '贺炎纲', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (76, 'qbulcadpdfrcpf@iqka.com', '8E0B0D12ADAAC5E180FC17EBBB617BA9', '[1, 2]', NULL, '喻达名', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (77, 'ffrmeepkqntm@iqka.com', 'EF86E124EBB9949ABC7BE9B53A9735FF', '[1, 2]', NULL, '姚倩蒙', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (78, 'athfwiq@iqka.com', 'E9CBE95EB0BDA5CC3656263E220F3375', '[1, 2]', NULL, '巫桢炎', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (79, 'anah@iqka.com', '5BE73D71A947FE760089C4A7064B82CF', '[1, 3]', NULL, '洪园翊', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (80, 'gjle@iqka.com', 'ED2208EBCDC927A3C15C23E13227C9A8', '[1, 2]', NULL, '齐或珏', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (81, 'pacffif@iqka.com', 'A1DFEAA045205C98E6B0402C107C8F8B', '[1, 2]', NULL, '赖歆颉', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (82, 'pboeufkspgumdhm@iqka.com', '4C5B9A8EB3417B98CA280C3372736C61', '[1, 2]', NULL, '时果娜', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (83, 'fpqfcufvmfe@iqka.com', '903EBFFECD5A81141D1A689825E604B6', '[1, 3]', NULL, '秦田将', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (84, 'erowwappks@iqka.com', '78C202D256A7506A63E3043A9181E001', '[1, 2]', NULL, '赵亚静', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (85, 'rugodopehkl@iqka.com', '0390EB7B52D42C4463514F5441A5FC9E', '[1, 3]', NULL, '邵娣妃', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (86, 'noatrsqopaunupv@iqka.com', '5C7469020E22A954208D1320A6ED9D96', '[1, 3]', NULL, '房仁和', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (87, 'doudjawitg@iqka.com', '1685AFCE6AC3F2B8E686736C6D8578FD', '[1, 3]', NULL, '武祺蕴', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (88, 'guau@iqka.com', 'F06EEA74BE2CA4A864B33CDCADC28DAB', '[1, 2]', NULL, '农培子', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (89, 'qrbh@iqka.com', '61D8232A571DC9696333E5E9069FDFE2', '[1, 3]', NULL, '娄珣馨', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (90, 'dvtqewrwpqkqcbp@iqka.com', 'FAF8472766ABE4BDF4B92D61B5474020', '[1, 2]', NULL, '管笑桃', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (91, 'hnmpoakpjr@iqka.com', '51039B1BC352628B0993909E2D46323E', '[1, 2]', NULL, '汪旭卿', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (92, 'dsuconnwqak@iqka.com', '48A2E82E548C7D22AA2F1F5F824C7969', '[1, 2]', NULL, '王希蝶', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (93, 'afienp@iqka.com', 'FBF50C75C0EB86278ADB63A04A97E848', '[1, 2]', NULL, '虞桔露', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (94, 'rweljelphd@iqka.com', 'F215E9072158C29B127189139DDBA1FA', '[1, 3]', NULL, '华昕彬', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (95, 'dhjhndsns@iqka.com', '1A237044CD0EF22E665DE3A47C7AB85E', '[1, 3]', NULL, '戚天存', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (96, 'mbwm@iqka.com', 'D00EF70324352EDBA54A05FEFF0012FF', '[1, 3]', NULL, '孙榕知', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (97, 'hlkfsuatwqwgkv@iqka.com', '469554A270FF2BB163614238DB000AD4', '[1, 2]', NULL, '卢允暖', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (98, 'ufte@iqka.com', 'B54FFCDBBEB2B9A55587FAD01E207BCD', '[1, 3]', NULL, '龙凤亚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (99, 'csqoejwtkfuewm@iqka.com', '2BBE838BCD05549BC68621C27C1E8358', '[1, 2]', NULL, '侯蔚均', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (100, 'wfbhndkjonuhpp@iqka.com', 'DC4A323CDD7104634AF2E1871A701661', '[1, 2]', NULL, '袁思旖', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (101, 'lrscfi@iqka.com', '1584E4E5C0CED678CB38D7A705FE7F68', '[1, 3]', NULL, '许年勤', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (102, 'flmu@iqka.com', '42A4F7439BACC0988DFEF9BDE5311D4E', '[1, 3]', NULL, '吕蔓蓉', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (103, 'apfuwnm@iqka.com', '05430935AA48762BE0E21D064EFA345B', '[1, 3]', NULL, '诸直耀', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (104, 'mhu@iqka.com', '2D7495096A19E3D9514F4F4602306CCE', '[1, 2]', NULL, '束冲潮', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (105, 'hruccl@iqka.com', '81216B5CB8D8524067120A1EEF9DA12D', '[1, 3]', NULL, '郁园辉', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (106, 'uhiwkpqjueffsj@iqka.com', 'E7928F356EE2836BCDC165A37B3C7807', '[1, 2]', NULL, '胡芝莉', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (107, 'rgongjoqrdtlsk@iqka.com', '22BE964877E69155E594BD4B7D14F152', '[1, 3]', NULL, '萧润典', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (108, 'adwoaaopr@iqka.com', '9820FBC99E3766D47B4C614506562A0B', '[1, 2]', NULL, '宋芝琚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (109, 'fepuh@iqka.com', '1DB6548D3A78C4B058D9A57EF882AC09', '[1, 2]', NULL, '龚深轲', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (110, 'cuka@iqka.com', 'B9ACF7F389E2A5C4C5BFC70CF378EC25', '[1, 3]', NULL, '程晨彭', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (111, 'klekgoosne@iqka.com', 'BEE84C9DBF276D12B82A1E69E4B93A71', '[1, 3]', NULL, '何峥树', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (112, 'vjdbfdjtdntjbfv@iqka.com', '0DDD8244ABB6B8CF2A2256F734AF8D4F', '[1, 2]', NULL, '陆津嫣', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (113, 'kcrnhjumprdrj@iqka.com', 'F6DFE267C2D0B9D4A428BDD71EE8BB8D', '[1, 2]', NULL, '洪宜晴', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (114, 'udwgffqftvlnuwo@iqka.com', '87575299E98905BFAEBC251CE8C17127', '[1, 3]', NULL, '戴奇秀', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (115, 'dfhs@iqka.com', '36057ADB70203AABF64C6C3DD3D09365', '[1, 3]', NULL, '柳朦耘', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (116, 'qtnol@iqka.com', '1284993DF00676BEB80ABA4425D237A4', '[1, 2]', NULL, '梅祺武', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (117, 'ojkaokdqp@iqka.com', 'CDFB54DD563B59BDD0FA690E15A538B4', '[1, 2]', NULL, '华英巧', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (118, 'rwqcefsc@iqka.com', 'F274A644B217E78EA9DC0B8B123F518F', '[1, 3]', NULL, '林洋嫱', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (119, 'mvvnovknsdhi@iqka.com', 'B4AD4EC73D7D9252723BF05B259398F3', '[1, 3]', NULL, '裴严烨', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (120, 'qqcsivtdrfv@iqka.com', '155F93B24979A7B8EC8600F0D715E58C', '[1, 3]', NULL, '范奕展', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (121, 'ifnqwkaluwn@iqka.com', 'C61743198E909E1E3997DA0422AE7736', '[1, 2]', NULL, '邢谨依', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (122, 'ttcetinibcfa@iqka.com', 'A4B2B8C4E7CF357CC1C51A6C4538F61C', '[1, 2]', NULL, '葛艺焱', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (123, 'juufnrpwvgptusq@iqka.com', 'D955346D3DCC400A16E3671A617114E0', '[1, 3]', NULL, '宋令凤', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (124, 'urrcjw@iqka.com', '4B79F83A01501E46ED4B766C75056D16', '[1, 3]', NULL, '舒宝莺', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (125, 'tpgjpnnfa@iqka.com', '65DBB771A00A701AA54392FB656A7E82', '[1, 3]', NULL, '白凌骁', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (126, 'qnmdghevqu@iqka.com', 'BE5FABD81F5DDE06D9EAE1B1E613CB4C', '[1, 3]', NULL, '宋万冕', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (127, 'jhvmtbehlu@iqka.com', '5586500441E7AD005D5D9B641D7B1205', '[1, 2]', NULL, '嵇育晏', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (128, 'jibmgiwjia@iqka.com', '0DBB4ACE9ABA37E36CEFD5B4D2B015F3', '[1, 2]', NULL, '宣霜菱', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (129, 'gefddnkmepb@iqka.com', 'A7FA523D70C9B0B389E1AAB2947570AB', '[1, 3]', NULL, '夏艳义', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (130, 'jihtsmjulpcddbq@iqka.com', 'AF21EB7F95BA00DA7883CBE7BDB0CA2D', '[1, 3]', NULL, '黄烈畅', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (131, 'svh@iqka.com', '3C40346F8D00EFC79274FFF0D3828D45', '[1, 3]', NULL, '韶申顺', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (132, 'nrarhqunuv@iqka.com', 'CCE2B7552C15A0F6A9BA7B3D367D59FF', '[1, 3]', NULL, '鲁尤姝', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (133, 'uikpevlduvcd@iqka.com', 'C6AE99291F644A6604AF5A9DD52FED4C', '[1, 3]', NULL, '常苹蔚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (134, 'bbwbtjqfil@iqka.com', 'BAD432218DD1557F079C5D3C53CC868B', '[1, 3]', NULL, '成翊非', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (135, 'ohnmbos@iqka.com', '73D43E3570C8C133C894C743295C5BE3', '[1, 2]', NULL, '钟骊朦', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (136, 'mwe@iqka.com', '4220CABD2EEE3DDE337795CB07DD83EC', '[1, 2]', NULL, '郦轶连', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (137, 'qjmchrknkojpf@iqka.com', 'B1B20E0A11B54C1289D6F041269CAED0', '[1, 3]', NULL, '宋超弛', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (138, 'trlfkmtcativ@iqka.com', '5B8E9B0F215F55F05C076B7945671D40', '[1, 2]', NULL, '咎弛中', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (139, 'fdcn@iqka.com', '6BD1E673374A2B84AF7D4F34D0971AD2', '[1, 2]', NULL, '诸隆启', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (140, 'ugfohhjkvvu@iqka.com', 'D490B1F3E53C59E8D5636EE9D650E154', '[1, 2]', NULL, '杜秋霜', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (141, 'vvh@iqka.com', 'EEE94BB96523663CCD0FE7F380F085EC', '[1, 2]', NULL, '支婵微', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (142, 'rbmhmpv@iqka.com', '3F51F4674F04ED68DBDE4004C3BFD8F2', '[1, 2]', NULL, '马涛烨', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (143, 'jpqipekias@iqka.com', 'E8569496EAA9D6EC16CC0917285C71EE', '[1, 3]', NULL, '朱焰歆', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (144, 'vlekdswnveavk@iqka.com', '31363D2B714C8EF8C4DC274BE80D50C5', '[1, 2]', NULL, '虞蔚习', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (145, 'rlcngceiof@iqka.com', '0E538C6EDB9054C43B5E3C009EA04A00', '[1, 2]', NULL, '贾正阳', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (146, 'nbsrkladcjs@iqka.com', '024BD11EB9D15DDB38190C60831AF59D', '[1, 2]', NULL, '凌椒音', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (147, 'oilmbwjirg@iqka.com', 'B1B9449C55D26F48C0DBA99723536C84', '[1, 3]', NULL, '缪京维', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (148, 'vphsqpnmuvsm@iqka.com', '3EE1DDEF7A1DF52706615302F899F008', '[1, 2]', NULL, '舒禹盛', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (149, 'etkqashewule@iqka.com', 'F0174A51CF3420E639E76C758EFC6B30', '[1, 3]', NULL, '窦云芝', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (150, 'mdiftughtbcq@iqka.com', '67B7D1477ADEE06CA19BD76013C28E56', '[1, 3]', NULL, '叶翠萍', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (151, 'kmtvos@iqka.com', '94A66CF25C1D37CB6144740D38978C35', '[1, 3]', NULL, '宣令绚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (152, 'rielqivwmwrto@iqka.com', '4655F0FC23B2C92CEFDFDED70AD61AB1', '[1, 3]', NULL, '樊朵嫒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (153, 'djeobvgkhsiaqis@iqka.com', '75A3F4B96571BEDC9409ED7BB3D5944D', '[1, 2]', NULL, '程利添', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (154, 'agpiwdv@iqka.com', '4C99FE1D944ADB76CDA546EF34D00747', '[1, 2]', NULL, '龙望娜', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (155, 'mlvhrugfbhhcpg@iqka.com', '320EDEFBB0ABF423F96175EC6A6C3533', '[1, 3]', NULL, '舒众实', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (156, 'tmhbjdqpn@iqka.com', '2D324AE1C7FD45C50EDC3767B8A95855', '[1, 3]', NULL, '廉桥轲', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (157, 'evlef@iqka.com', '541EF5D421C6770CF0501BF3EECB01B6', '[1, 3]', NULL, '巫妙露', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (158, 'wkhcnavpjlcvjap@iqka.com', '8F80F85FA28D47A40C2A650F8BFE82CC', '[1, 2]', NULL, '凌唯唯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (159, 'rrsspcmptsh@iqka.com', 'EC0DE5ECE2D3357030107B63E506CDA8', '[1, 3]', NULL, '滑鹃寒', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (160, 'nwsb@iqka.com', 'B1B35595B1111F187A0ED0D95FE0F7E1', '[1, 2]', NULL, '郎申喆', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (161, 'hhohevtnpoubr@iqka.com', '5FA8719D23AFF9D4FF18995142C7EE68', '[1, 3]', NULL, '云欣澄', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (162, 'mlleqi@iqka.com', '002A6172721BD1FE7006D0787066E4B4', '[1, 2]', NULL, '平鹃岭', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (163, 'htvofrpt@iqka.com', '92DB791E61F8698672DD35A39F9D1D51', '[1, 3]', NULL, '包年深', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (164, 'jqab@iqka.com', '05EE1C5E9EECBA1ADF37D1B3E0B93B14', '[1, 3]', NULL, '羿晨蕊', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (165, 'qaim@iqka.com', 'F41DB4D6832CE411E97E5F9AF5A3BDF0', '[1, 3]', NULL, '苗心姬', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (166, 'wfwkoobnsnbsb@iqka.com', '474A1C25E87E3BD12E03F0C48E89BFC7', '[1, 2]', NULL, '龙敬柯', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (167, 'jwlqpvdernee@iqka.com', 'AF560614F8932B72F8B9E9ACC099C9A1', '[1, 3]', NULL, '穆俭曼', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (168, 'qdt@iqka.com', '095E35D0D5FAF9A38F9369D5AFB7592E', '[1, 2]', NULL, '水均庭', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (169, 'dovjehiha@iqka.com', '9606E8F7BF9351086502268B87D7BDD6', '[1, 3]', NULL, '邴娟柳', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (170, 'etfao@iqka.com', '80F4A29B99D0D7B077984E0AB2B9FE19', '[1, 3]', NULL, '祁操尚', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (171, 'hpcehpnprkj@iqka.com', '9444EA57BF4444A048A1027D6BF33384', '[1, 2]', NULL, '左臣舸', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (172, 'jmijvc@iqka.com', 'DBDD1077B8960D5E84B7BBF8E03E7102', '[1, 2]', NULL, '凤化魁', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (173, 'ddgeociorvhmmn@iqka.com', '4A79E0E27BFB7C38A9A014091B49326B', '[1, 2]', NULL, '谢莺晓', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (174, 'qabodlbfo@iqka.com', '0BB11ADCA0E3684C51F33BBB77DF4007', '[1, 2]', NULL, '温继谦', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (175, 'vcukssvcckmb@iqka.com', '9F0147EAAF4E701BA83110A4E158D755', '[1, 3]', NULL, '吉恺翔', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (176, 'kcvatqkut@iqka.com', '0B8642174B0348645853771831D3E7FE', '[1, 2]', NULL, '黄远昌', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (177, 'uthihvjcuok@iqka.com', '1BBF399B2F385D675AD1DFFAC899950A', '[1, 3]', NULL, '姬毅祺', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (178, 'aldvdjkkcaon@iqka.com', 'D2DBAB704018C7BEB26C3F793AEA55FC', '[1, 2]', NULL, '莫佳铭', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (179, 'mfkemetbkw@iqka.com', '224D0F3C6244E196F1A1C86BD706F74F', '[1, 3]', NULL, '孙晗韶', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (180, 'ljndpipjaqc@iqka.com', '4A3DB3F9498C5759554B43C3DCC9D6D7', '[1, 2]', NULL, '苏仲富', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (181, 'tunakjmu@iqka.com', 'CF256A9C7305181273220393D0160A5A', '[1, 2]', NULL, '戴策锟', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (182, 'rrrqw@iqka.com', '246D13419D0DA99A44728139CC2DE3BA', '[1, 3]', NULL, '樊涓苏', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (183, 'hjnpmlmkqsgsrh@iqka.com', '5D8ECE8681762DA4914048103DA0302A', '[1, 2]', NULL, '石琰庄', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (184, 'mtkso@iqka.com', '059B0D063CF4766DA3AB960A2105CD8F', '[1, 2]', NULL, '郑彬珏', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (185, 'wdjpuc@iqka.com', '8FB9812AEF543733CE75B76C2BB6D6AB', '[1, 2]', NULL, '卓胡继', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (186, 'qptkqkha@iqka.com', 'E87AE135FB33F4D83AC068D6C3217C03', '[1, 3]', NULL, '魏丞奔', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (187, 'bmuhktfe@iqka.com', 'ED16E5B51C9BE3B1087E6EE3F16A59FB', '[1, 3]', NULL, '林英泽', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (188, 'smweuhvini@iqka.com', 'FD779078FB50F87255F72322A2DE5F8E', '[1, 2]', NULL, '葛凤静', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (189, 'eapjcq@iqka.com', '157D1095A329EFA18CBD1C772110820D', '[1, 2]', NULL, '房榕怡', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (190, 'wtc@iqka.com', 'BD509B4686DA1EFBF75B80D760977A57', '[1, 2]', NULL, '诸令剑', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (191, 'aecsvu@iqka.com', 'C63AEFB466B34823DD794BF65F972E9E', '[1, 2]', NULL, '袁皓禹', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (192, 'tcvebbm@iqka.com', '03D3307109BDC21AD0563533021B3CB8', '[1, 3]', NULL, '翟达名', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (193, 'lrmmitwr@iqka.com', 'FD2178F966DDBD635C7E50656F770241', '[1, 2]', NULL, '戴莉娥', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (194, 'btlers@iqka.com', 'D1BA26F417D895A47D84CD88B2806883', '[1, 3]', NULL, '杭双超', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (195, 'illmsc@iqka.com', '8AA3EF87D36595FCF8339B16BC85BB0E', '[1, 3]', NULL, '胡韬柳', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (196, 'iaar@iqka.com', '2383AA74AA1F57BDD7C1B4DA64869FE5', '[1, 2]', NULL, '平菲研', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (197, 'hwvou@iqka.com', 'EC1E38338BFC50D2A28F819AFC364B9D', '[1, 2]', NULL, '孔民聪', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (198, 'egkhrkakuqc@iqka.com', 'AADC7CA12ABA261ED84B662A3A9D56E8', '[1, 2]', NULL, '毕瑛乐', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (199, 'dchptmmw@iqka.com', 'E75508CCCC77F27DD1E7B314A03BA912', '[1, 2]', NULL, '韦亚申', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `staff` VALUES (200, 'jodlhcrkgce@iqka.com', 'BFBEDE10A1FEA54ADCB0AE19F41120D9', '[1, 3]', NULL, '杭隆承', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` bigint unsigned NOT NULL,
  `sn` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Supplier SN',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Supplier Name',
  `province` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'City',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'City',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sn_unique`(`sn`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `province_index`(`province`) USING BTREE,
  INDEX `city_index`(`city`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '913700006139918126', '鲁南制药集团股份有限公司', '山东省', '临沂市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (2, '914413023152526673', '广东利元亨智能装备股份有限公司', '广东省', '惠州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (3, '91440300693950518U', '深圳麦克韦尔科技有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (4, '91440500617557490G', '奥飞娱乐股份有限公司', '广东省', '汕头市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (5, '91320481703625269H', '江苏上上电缆集团有限公司', '江苏省', '常州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (6, '91110000100003495Y', '中国建材股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (7, '91220101571145270J', '中国第一汽车股份有限公司', '吉林省', '长春市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (8, '91310000631696382C', '宝山钢铁股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (9, '91330000780477634Q', '浙江世纪华通集团股份有限公司', '浙江省', '绍兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (10, '914201003033179534', '武汉华星光电技术有限公司', '湖北省', '武汉市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (11, '91430100567699262E', '蓝思科技（长沙）有限公司', '湖南省', '长沙市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (12, '91440300MA5DFAEB6U', '深圳市华星光电半导体显示技术有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (13, '91340000MA2RCF4L9Q', '大众汽车（安徽）有限公司', '安徽省', '合肥市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (14, '91330600MA2BDY6H13', '绍兴中芯集成电路制造股份有限公司', '浙江省', '绍兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (15, '912100007497716597', '东北特殊钢集团股份有限公司', '辽宁省', '大连市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (16, '91440300MA5EE7EF65', '宝能汽车集团有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (17, '911100001055722912', '新兴际华集团有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (18, '91110000100008886U', '中国恒天集团有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (19, '91330200704800698F', '雅戈尔集团股份有限公司', '浙江省', '宁波市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (20, '91370800734712875Q', '山东如意科技集团有限公司', '山东省', '济宁市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (21, '9137172816928036XB', '山东东明石化集团有限公司', '山东省', '菏泽市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (22, '91440300618869509J', '中国国际海运集装箱（集团）股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (23, '915101002051154851', '东方电气股份有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (24, '9144030077272966XD', '深圳市兆驰股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (25, '9145060075122294X6', '广西盛隆冶金有限公司', '广西壮族自治区', '防城港市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (26, '914403006188385775', '中国南玻集团股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (27, '913713006139930338', '临沂新程金锣肉制品集团有限公司', '山东省', '临沂市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (28, '91370200743966332L', '赛轮集团股份有限公司', '山东省', '青岛市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (29, '914200007068068827', '华新水泥股份有限公司', '湖北省', '黄石市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (30, '91110000633646901B', '北京燕京啤酒股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (31, '91330000736007862B', '浙江森马服饰股份有限公司', '浙江省', '温州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (32, '91440300618810099P', '深圳创维-RGB电子有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (33, '91320281250344877K', '江苏阳光集团有限公司', '江苏省', '无锡市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (34, '91320509138285715E', '亨通集团有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (35, '913100001321787408', '上海美特斯邦威服饰股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (36, '91410000614914114G', '华兰生物工程股份有限公司', '河南省', '新乡市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (37, '91440600708118119M', '新明珠集团股份有限公司', '广东省', '佛山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (38, '914403006188861815', '深圳达实智能股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (39, '91330200717285453P', '海天塑机集团有限公司', '浙江省', '宁波市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (40, '91370000614071479T', '鲁西化工集团股份有限公司', '山东省', '聊城市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (41, '91440300279422189D', '海能达通信股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (42, '91370800706094280Q', '山东太阳纸业股份有限公司', '山东省', '济宁市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (43, '91620500756558610D', '天水华天科技股份有限公司', '甘肃省', '天水市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (44, '9137162616720307XL', '西王集团有限公司', '山东省', '滨州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (45, '91610000220524252T', '陕西汽车集团股份有限公司', '陕西省', '西安市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (46, '913205946739170837', '苏州旭创科技有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (47, '91330000712561789G', '浙江交工集团股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (48, '91410800173472241R', '龙佰集团股份有限公司', '河南省', '焦作市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (49, '91340000711722608T', '中粮生物科技股份有限公司', '安徽省', '蚌埠市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (50, '9133078425507428XE', '铁牛集团有限公司', '浙江省', '金华市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (51, '913300007368873961', '浙江华友钴业股份有限公司', '浙江省', '嘉兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (52, '91320800139859741X', '江苏今世缘酒业股份有限公司', '江苏省', '淮安市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (53, '915300002919937260', '云南云天化股份有限公司', '云南省', '昆明市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (54, '91510100052516850P', '捷普科技（成都）有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (55, '91350000611541826X', '达利食品集团有限公司', '福建省', '泉州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (56, '91360500716575125F', '江西赣锋锂业集团股份有限公司', '江西省', '新余市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (57, '91371300757484684H', '山东临工工程机械有限公司', '山东省', '临沂市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (58, '914405007254810917', '维信诺科技股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (59, '91440000190343548J', '海信家电集团股份有限公司', '广东省', '佛山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (60, '91650000710886440T', '新疆天山水泥股份有限公司', '新疆维吾尔自治区', '乌鲁木齐市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (61, '914403007451834971', '新纶新材料股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (62, '91110000633027609B', '北京东方国信科技股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (63, '913300007043088475', '浙江万马股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (64, '91440300192413773Q', '深圳拓邦股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (65, '911201167803498783', '奥的斯电梯（中国）有限公司', '天津市', '天津市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (66, '91440300736297302X', '深圳市沃特玛电池有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (67, '913702117439759413', '青岛海信日立空调系统有限公司', '山东省', '青岛市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (68, '91440000743693119N', '广东奥马电器股份有限公司', '广东省', '中山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (69, '9144030072988519X9', '深圳市长盈精密技术股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (70, '911301317343451044', '敬业钢铁有限公司', '河北省', '石家庄市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (71, '91350000154586155B', '新大陆数字技术股份有限公司', '福建省', '福州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (72, '91440300726198124D', '神州数码信息服务股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (73, '91330000725252053F', '杭州老板电器股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (74, '915106837175377539', '四川剑南春（集团）有限责任公司', '四川省', '德阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (75, '914403007883357614', '深圳市信维通信股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (76, '914403007109245909', '华润三九医药股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (77, '913302001449739014', '东方日升新能源股份有限公司', '浙江省', '宁波市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (78, '914406052318367964', '广东志高空调有限公司', '广东省', '佛山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (79, '914403007341708695', '深圳市裕同包装科技股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (80, '91350902671920959B', '宁德新能源科技有限公司', '福建省', '宁德市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (81, '913205007317618904', '江苏中利集团股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (82, '91370100MA3P43E719', '泉芯集成电路制造（济南）有限公司', '山东省', '济南市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (83, '91110000101461180X', '中国北京同仁堂（集团）有限责任公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (84, '91370200163621493Q', '澳柯玛股份有限公司', '山东省', '青岛市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (85, '91350000611520128M', '福建七匹狼实业股份有限公司', '福建省', '泉州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (86, '91410800719115730E', '多氟多新材料股份有限公司', '河南省', '焦作市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (87, '9133010060912074XW', '中策橡胶集团股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (88, '9131000074494301X3', '科大智能科技股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (89, '915101007978308873', '四川天味食品集团股份有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (90, '913500007640583922', '贵人鸟股份有限公司', '福建省', '泉州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (91, '91440300715297653W', '普联技术有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (92, '91310000631324319E', '上海良信电器股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (93, '91440606231959841B', '科顺防水科技股份有限公司', '广东省', '佛山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (94, '91440300790475026R', '深圳市赢合科技股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (95, '91440300192441045W', '华润怡宝饮料（中国）有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (96, '913716251671540959', '山东京博石油化工有限公司', '山东省', '滨州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (97, '91620000712767189Y', '大禹节水集团股份有限公司', '甘肃省', '酒泉市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (98, '914403007230429091', '贝特瑞新材料集团股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (99, '91340100743065219J', '安徽鸿路钢结构（集团）股份有限公司', '安徽省', '合肥市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (100, '91621200695632863J', '金徽酒股份有限公司', '甘肃省', '陇南市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (101, '91430100743176293C', '楚天科技股份有限公司', '湖南省', '长沙市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (102, '91350000611528672E', '福建恒安集团有限公司', '福建省', '泉州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (103, '911301002360444643', '石药控股集团有限公司', '河北省', '石家庄市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (104, '91320500628396530U', '科沃斯机器人股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (105, '911302006010646915', '紫光国芯微电子股份有限公司', '河北省', '唐山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (106, '913101157626272806', '中微半导体设备（上海）股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (107, '91110106335516068G', '中建科技集团有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (108, '9145080070864475XF', '广西扬翔股份有限公司', '广西壮族自治区', '贵港市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (109, '914101007794205343', '郑州思念食品有限公司', '河南省', '郑州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (110, '91330000717612987P', '浙江天正电气股份有限公司', '浙江省', '温州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (111, '913303007793989040', '浙江一鸣食品股份有限公司', '浙江省', '温州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (112, '9112000071821557X4', '爱玛科技集团股份有限公司', '天津市', '天津市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (113, '91320500565336601D', '昆山科森科技股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (114, '913101166078754287', '上海起帆电缆股份有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (115, '91330481554013049C', '火星人厨具股份有限公司', '浙江省', '嘉兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (116, '91350200705404670M', '科华数据股份有限公司', '福建省', '厦门市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (117, '91440300728579238Y', '深圳市卓宝科技股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (118, '91310000607389788T', '上海微创医疗器械（集团）有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (119, '91510122096784048U', '四川德康农牧食品集团股份有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (120, '913505005673244367', '九牧厨卫股份有限公司', '福建省', '泉州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (121, '91433100183806380W', '酒鬼酒股份有限公司', '湖南省', '湘西土家族苗族自治州', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (122, '912112233993842441', '贵州茅台集团健康产业有限公司', '辽宁省', '铁岭市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (123, '9137078577418160X7', '山东星宇手套有限公司', '山东省', '潍坊市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (124, '91510922206360562E', '四川沱牌舍得集团有限公司', '四川省', '遂宁市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (125, '91442000617592341J', '完美（中国）有限公司', '广东省', '中山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (126, '913708006722078217', '山东东宏管业股份有限公司', '山东省', '济宁市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (127, '91410728729606285J', '河南亚都实业有限公司', '河南省', '新乡市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (128, '91510724708973633Q', '好医生药业集团有限公司', '四川省', '绵阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (129, '9133038225602433XW', '人民电器集团有限公司', '浙江省', '温州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (130, '914403006729969713', '深圳市海目星激光智能装备股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (131, '91330800792060211R', '江山欧派门业股份有限公司', '浙江省', '衢州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (132, '914403006188674153', '研祥智能科技股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (133, '91420200615481883L', '劲牌有限公司', '湖北省', '黄石市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (134, '91371400724953026A', '山东格瑞德集团有限公司', '山东省', '德州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (135, '91421300764141823Q', '程力专用汽车股份有限公司', '湖北省', '随州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (136, '9134010068976734XU', '科大国盾量子技术股份有限公司', '安徽省', '合肥市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (137, '91520221MA6HRT1L8R', '贵州千硕建设（集团）有限公司', '贵州省', '六盘水市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (138, '9133020114479257XW', '宁波方太厨具有限公司', '浙江省', '宁波市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (139, '914403007634628367', '深圳市通拓科技有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (140, '911103027404017237', '中芯国际集成电路制造（北京）有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (141, '91210114589394646P', '沈阳昌隆鑫不锈钢商展道具有限公司', '辽宁省', '沈阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (142, '91360106MA35WNBE9F', '南昌华勤电子科技有限公司', '江西省', '南昌市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (143, '91371100168371999W', '日照三奇医疗卫生用品有限公司', '山东省', '日照市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (144, '91440605MA52ETCC8Y', '广东玺茜日化商贸有限公司', '广东省', '佛山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (145, '91130525721609633G', '远大阀门集团有限公司', '河北省', '邢台市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (146, '913101131332070132', '上海良工阀门厂有限公司', '上海市', '上海市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (147, '914403007675804181', '深圳市海思半导体有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (148, '91440183788918844K', '广州福耀玻璃有限公司', '广东省', '广州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (149, '91510000621601466X', '中国铁路成都局集团有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (150, '91110000562091696T', '北京汽车股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (151, '91110000625906670H', '松下电器（中国）有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (152, '91340000610400837Y', '马鞍山钢铁股份有限公司', '安徽省', '马鞍山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (153, '913700007058303114', '山东南山铝业股份有限公司', '山东省', '烟台市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (154, '91370000726230489L', '山东钢铁股份有限公司', '山东省', '济南市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (155, '91320594608243799B', '金红叶纸业集团有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (156, '914201006823191306', '武汉天马微电子有限公司', '湖北省', '武汉市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (157, '91140000110114391W', '太原钢铁（集团）有限公司', '山西省', '太原市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (158, '9112000010409702XT', '天津红日药业股份有限公司', '天津市', '天津市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (159, '91440300708416327M', '深圳市比亚迪锂电池有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (160, '91371200169533590A', '山东泰山钢铁集团有限公司', '山东省', '济南市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (161, '91340500150509144U', '马钢（集团）控股有限公司', '安徽省', '马鞍山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (162, '91110000696364303P', '北京新能源汽车股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (163, '91130283741535782L', '迁安市九江线材有限责任公司', '河北省', '唐山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (164, '91330000704202137E', '浙江龙盛集团股份有限公司', '浙江省', '绍兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (165, '9141030067166633X2', '中信重工机械股份有限公司', '河南省', '洛阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (166, '91540000219667563J', '梅花生物科技集团股份有限公司', '西藏自治区', '拉萨市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (167, '9151000062160427XG', '中国东方电气集团有限公司', '四川省', '成都市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (168, '91630000226593742J', '青海盐湖工业股份有限公司', '青海省', '海西蒙古族藏族自治州', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (169, '91320500756428744L', '苏州胜利精密制造科技股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (170, '913700001675754710', '通裕重工股份有限公司', '山东省', '德州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (171, '912101067931971483', '北方重工集团有限公司', '辽宁省', '沈阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (172, '91370200740365750X', '中车青岛四方机车车辆股份有限公司', '山东省', '青岛市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (173, '913714257402105138', '山东莱钢永锋钢铁有限公司', '山东省', '德州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (174, '914302007790310965', '中车株洲电力机车有限公司', '湖南省', '株洲市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (175, '91500000202819532B', '中节能太阳能股份有限公司', '重庆市', '重庆市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (176, '913300006096907427', '浙江三花智能控制股份有限公司', '浙江省', '绍兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (177, '91320505691330112T', '阿特斯阳光电力集团股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (178, '91330100MA2AX8UL47', '杭州中欣晶圆半导体股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (179, '91210200716996405L', '中国华录集团有限公司', '辽宁省', '大连市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (180, '91440300192317458F', '比亚迪股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (181, '91330000712560575G', '浙江新和成股份有限公司', '浙江省', '绍兴市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (182, '91320000743718216W', '江苏恒力化纤股份有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (183, '91340100586142822H', '联宝（合肥）电子科技有限公司', '安徽省', '合肥市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (184, '914100007694904919', '天瑞集团股份有限公司', '河南省', '平顶山市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (185, '91510600205363163Y', '四川宏达股份有限公司', '四川省', '德阳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (186, '913400007199042708', '芜湖长信科技股份有限公司', '安徽省', '芜湖市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (187, '9113060970075812XB', '河北大午农牧集团有限公司', '河北省', '保定市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (188, '914200001775644500', '三环集团有限公司', '湖北省', '武汉市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (189, '913201157512997959', '南京高速齿轮制造有限公司', '江苏省', '南京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (190, '913202007579586082', '无锡江南电缆有限公司', '江苏省', '无锡市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (191, '91330000143853115H', '南方中金环境股份有限公司', '浙江省', '杭州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (192, '91330200MA283665X6', '奥克斯空调股份有限公司', '浙江省', '宁波市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (193, '91320583722291823U', '立讯电子科技（昆山）有限公司', '江苏省', '苏州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (194, '91330000730337692W', '光启技术股份有限公司', '广东省', '深圳市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (195, '91320312753237707L', '江苏徐钢钢铁集团有限公司', '江苏省', '徐州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (196, '91410700791902544H', '河南心连心化学工业集团股份有限公司', '河南省', '新乡市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (197, '91130100104397700P', '华北制药股份有限公司', '河北省', '石家庄市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (198, '91450200198229141F', '广西柳工机械股份有限公司', '广西壮族自治区', '柳州市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (199, '913700001650810568', '东方电子股份有限公司', '山东省', '烟台市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);
INSERT INTO `supplier` VALUES (200, '91110000600069802M', '北京天坛生物制品股份有限公司', '北京市', '北京市', 'enabled', NULL, '2022-10-19 06:37:06', NULL, NULL);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `step_id` bigint(0) NOT NULL COMMENT 'Step ID',
  `milestone_id` bigint(0) NULL DEFAULT NULL COMMENT 'Milestone ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `start` date NULL DEFAULT NULL COMMENT '开始时间',
  `end` date NULL DEFAULT NULL COMMENT '完成时间',
  `start_plan` date NULL DEFAULT NULL COMMENT '计划开始时间',
  `end_plan` date NULL DEFAULT NULL COMMENT '计划完成时间',
  `delayed` tinyint(1) NULL DEFAULT NULL COMMENT 'Delayed',
  `delivered` tinyint(1) NULL DEFAULT NULL COMMENT 'Delivered',
  `remark` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Remark',
  `status` enum('waiting','doing','done') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'waiting' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `step_id_index`(`step_id`) USING BTREE,
  INDEX `milestone_id_index`(`milestone_id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `start_index`(`start`) USING BTREE,
  INDEX `end_index`(`end`) USING BTREE,
  INDEX `start_plan_index`(`start_plan`) USING BTREE,
  INDEX `end_plan_index`(`end_plan`) USING BTREE,
  INDEX `delayed_index`(`delayed`) USING BTREE,
  INDEX `delivered_index`(`delivered`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 1, 1, 1, '产品结构改进设计及评审', '2020-12-31', '2021-01-09', '2020-12-31', '2021-01-09', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (2, 1, 1, 2, '样机加工零件、样机装配', '2020-12-31', '2021-01-19', '2021-01-10', '2021-01-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (3, 1, 1, 2, '温升试验', '2021-01-19', '2021-01-30', '2021-01-19', '2021-01-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (4, 1, 1, 2, '分断（1天）、短耐性能试验', '2021-01-31', '2021-02-27', '2021-01-31', '2021-02-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (5, 1, 1, 2, '试验评审、整机模型修改', '2021-02-28', '2021-03-09', '2021-02-28', '2021-03-09', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (6, 1, 1, 3, '样机加工零件、样机装配', '2021-03-14', '2021-03-19', '2021-03-14', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (7, 1, 1, 3, '温升试验', '2021-03-14', '2021-03-19', '2021-03-14', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (8, 1, 1, 3, '分断（1天）、短耐性能试验', '2021-03-14', '2021-03-19', '2021-03-14', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (9, 1, 1, 3, '试验评审、整机模型修改', '2021-03-14', '2021-03-19', '2021-03-14', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (10, 1, 2, 0, '工程图定稿', '2021-03-30', '2021-04-19', '2021-03-20', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (11, 1, 2, 4, '合同签订', '2021-04-14', '2021-04-19', '2021-03-31', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (12, 1, 2, 4, '开模', '2021-04-14', '2021-04-19', '2021-03-31', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (13, 1, 2, 4, '检卡定稿', '2021-04-14', '2021-04-19', '2021-03-31', '2021-03-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (14, 1, 2, 4, '首样确认', '2021-04-14', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (15, 1, 3, 5, '修模计划下发', '2021-04-29', '2021-04-19', '2021-04-15', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (16, 1, 3, 5, '开模', '2021-04-29', '2021-04-19', '2021-04-15', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (17, 1, 3, 5, '修模件确认', '2021-04-29', '2021-04-19', '2021-04-15', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (18, 1, 3, 6, '产品小批量试制及3C样机', '2021-04-29', '2021-04-19', '2021-04-15', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (19, 1, 4, 7, '开模件产品验证', '2021-04-20', '2021-04-29', '2021-04-20', '2021-04-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (20, 1, 4, 0, '3C认证', '2021-05-20', '2021-05-19', '2021-05-02', '2021-05-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (21, 1, 4, 8, '结题归档', '2021-05-20', '2021-05-30', '2021-05-20', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (22, 2, 5, 9, '产品结构改进设计及评审', '2021-02-17', '2021-02-27', '2021-02-17', '2021-02-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (23, 2, 5, 10, '样机加工零件、样机装配', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (24, 2, 5, 10, '温升试验', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (25, 2, 5, 10, '分断（1天）、短耐性能试验', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (26, 2, 5, 10, '试验评审、整机模型修改', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (27, 2, 5, 11, '样机加工零件、样机装配', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (28, 2, 5, 11, '温升试验', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (29, 2, 5, 11, '分断（1天）、短耐性能试验', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (30, 2, 5, 11, '试验评审、整机模型修改', '2021-02-27', '2021-03-30', '2021-02-27', '2021-03-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (31, 2, 6, 0, '工程图定稿', '2021-03-31', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (32, 2, 6, 12, '合同签订', '2021-03-31', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (33, 2, 6, 12, '开模', '2021-03-31', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (34, 2, 6, 12, '检卡定稿', '2021-03-31', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (35, 2, 6, 12, '首样确认', '2021-03-31', '2021-04-19', '2021-03-31', '2021-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (36, 2, 7, 13, '修模计划下发', '2021-04-20', '2021-05-29', '2021-04-20', '2021-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (37, 2, 7, 13, '开模', '2021-04-20', '2021-05-29', '2021-04-20', '2021-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (38, 2, 7, 13, '修模件确认', '2021-04-20', '2021-05-29', '2021-04-20', '2021-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (39, 2, 7, 14, '产品小批量试制及3C样机', '2021-04-20', '2021-05-29', '2021-04-20', '2021-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (40, 2, 8, 15, '开模件产品验证', '2021-05-30', '2021-06-19', '2021-05-30', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (41, 2, 8, 0, '3C认证', '2021-05-30', '2021-06-19', '2021-05-30', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (42, 2, 8, 16, '结题归档', '2021-06-20', '2021-06-29', '2021-06-20', '2021-06-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (43, 3, 9, 17, '产品结构改进设计及评审', '2021-04-17', '2021-04-27', '2021-04-17', '2021-04-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (44, 3, 9, 18, '样机加工零件、样机装配', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (45, 3, 9, 18, '温升试验', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (46, 3, 9, 18, '分断（1天）、短耐性能试验', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (47, 3, 9, 18, '试验评审、整机模型修改', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (48, 3, 9, 19, '样机加工零件、样机装配', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (49, 3, 9, 19, '温升试验', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (50, 3, 9, 19, '分断（1天）、短耐性能试验', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (51, 3, 9, 19, '试验评审、整机模型修改', '2021-02-27', '2021-05-30', '2021-04-27', '2021-05-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (52, 3, 10, 0, '工程图定稿', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (53, 3, 10, 20, '合同签订', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (54, 3, 10, 20, '开模', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (55, 3, 10, 20, '检卡定稿', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (56, 3, 10, 20, '首样确认', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (57, 3, 11, 21, '修模计划下发', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (58, 3, 11, 21, '开模', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (59, 3, 11, 21, '修模件确认', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (60, 3, 11, 22, '产品小批量试制及3C样机', '2021-05-31', '2021-06-19', '2021-05-31', '2021-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (61, 3, 12, 23, '开模件产品验证', '2021-06-20', '2021-11-19', '2021-06-20', '2021-11-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (62, 3, 12, 0, '3C认证', '2021-06-20', '2021-11-19', '2021-06-20', '2021-11-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (63, 3, 12, 24, '结题归档', '2021-11-20', '2021-12-30', '2021-11-20', '2021-12-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (64, 4, 13, 25, '产品结构改进设计及评审', '2022-01-17', '2022-01-27', '2021-12-31', '2022-01-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (65, 4, 13, 26, '样机加工零件、样机装配', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (66, 4, 13, 26, '温升试验', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (67, 4, 13, 26, '分断（1天）、短耐性能试验', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (68, 4, 13, 26, '试验评审、整机模型修改', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (69, 4, 13, 27, '样机加工零件、样机装配', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (70, 4, 13, 27, '温升试验', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (71, 4, 13, 27, '分断（1天）、短耐性能试验', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (72, 4, 13, 27, '试验评审、整机模型修改', '2022-01-28', '2022-03-27', '2022-01-28', '2022-03-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (73, 4, 14, 0, '工程图定稿', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (74, 4, 14, 28, '合同签订', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (75, 4, 14, 28, '开模', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (76, 4, 14, 28, '检卡定稿', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (77, 4, 14, 28, '首样确认', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (78, 4, 15, 29, '修模计划下发', '2022-03-31', '2022-04-19', '2022-03-31', '2022-04-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (79, 4, 15, 29, '开模', '2022-04-20', '2022-05-29', '2022-04-20', '2022-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (80, 4, 15, 29, '修模件确认', '2022-04-20', '2022-05-29', '2022-04-20', '2022-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (81, 4, 15, 30, '产品小批量试制及3C样机', '2022-04-20', '2022-05-29', '2022-04-20', '2022-05-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (82, 4, 16, 31, '开模件产品验证', '2022-05-30', '2022-06-19', '2022-05-30', '2022-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (83, 4, 16, 0, '3C认证', '2022-05-30', '2022-06-19', '2022-05-30', '2022-06-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (84, 4, 16, 32, '结题归档', '2022-06-20', '2022-08-30', '2022-06-20', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (85, 5, 17, 33, '产品结构改进设计及评审', '2022-06-11', '2022-06-27', '2022-06-11', '2022-06-27', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (86, 5, 17, 34, '样机加工零件、样机装配', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (87, 5, 17, 34, '温升试验', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (88, 5, 17, 34, '分断（1天）、短耐性能试验', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (89, 5, 17, 34, '试验评审、整机模型修改', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (90, 5, 17, 35, '样机加工零件、样机装配', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (91, 5, 17, 35, '温升试验', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (92, 5, 17, 35, '分断（1天）、短耐性能试验', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (93, 5, 17, 35, '试验评审、整机模型修改', '2022-06-28', '2022-07-30', '2022-06-28', '2022-07-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (94, 5, 18, 0, '工程图定稿', '2022-07-31', '2022-08-30', '2022-07-31', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (95, 5, 18, 36, '合同签订', '2022-07-31', '2022-08-30', '2022-07-31', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (96, 5, 18, 36, '开模', '2022-07-31', '2022-08-30', '2022-07-31', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (97, 5, 18, 36, '检卡定稿', '2022-07-31', '2022-08-30', '2022-07-31', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (98, 5, 18, 36, '首样确认', '2022-07-31', '2022-08-30', '2022-07-31', '2022-08-30', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (99, 5, 19, 37, '修模计划下发', '2022-08-31', '2022-09-19', '2022-08-31', '2022-09-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (100, 5, 19, 37, '开模', '2022-08-31', '2022-09-19', '2022-08-31', '2022-09-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (101, 5, 19, 37, '修模件确认', '2022-08-31', '2022-09-19', '2022-08-31', '2022-09-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (102, 5, 19, 38, '产品小批量试制及3C样机', '2022-08-31', '2022-09-19', '2022-08-31', '2022-09-19', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (103, 5, 20, 39, '开模件产品验证', '2022-09-20', '2022-09-24', '2022-09-20', '2022-09-24', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (104, 5, 20, 0, '3C认证', '2022-09-20', '2022-09-24', '2022-09-20', '2022-09-24', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (105, 5, 20, 40, '结题归档', '2022-09-25', '2022-09-29', '2022-09-25', '2022-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (106, 6, 21, 41, '产品结构改进设计及评审', '2022-08-30', '2022-09-09', '2022-08-30', '2022-09-09', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (107, 6, 21, 42, '样机加工零件、样机装配', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (108, 6, 21, 42, '温升试验', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (109, 6, 21, 42, '分断（1天）、短耐性能试验', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (110, 6, 21, 42, '试验评审、整机模型修改', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (111, 6, 21, 43, '样机加工零件、样机装配', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (112, 6, 21, 43, '温升试验', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (113, 6, 21, 43, '分断（1天）、短耐性能试验', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (114, 6, 21, 43, '试验评审、整机模型修改', '2021-09-10', '2021-09-29', '2022-09-10', '2021-09-29', 0, 1, NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (115, 6, 22, 0, '工程图定稿', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (116, 6, 22, 44, '合同签订', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (117, 6, 22, 44, '开模', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (118, 6, 22, 44, '检卡定稿', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (119, 6, 22, 44, '首样确认', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (120, 6, 23, 45, '修模计划下发', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (121, 6, 23, 45, '开模', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (122, 6, 23, 45, '修模件确认', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (123, 6, 23, 46, '产品小批量试制及3C样机', '2021-09-30', NULL, '2022-09-30', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (124, 6, 24, 47, '开模件产品验证', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (125, 6, 24, 0, '3C认证', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (126, 6, 24, 48, '结题归档', NULL, NULL, '2022-11-30', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (127, 7, 25, 49, '产品结构改进设计及评审', '2022-09-15', NULL, '2022-09-15', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (128, 7, 25, 50, '样机加工零件、样机装配', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (129, 7, 25, 50, '温升试验', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (130, 7, 25, 50, '分断（1天）、短耐性能试验', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (131, 7, 25, 50, '试验评审、整机模型修改', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (132, 7, 25, 51, '样机加工零件、样机装配', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (133, 7, 25, 51, '温升试验', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (134, 7, 25, 51, '分断（1天）、短耐性能试验', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (135, 7, 25, 51, '试验评审、整机模型修改', NULL, NULL, '2022-10-31', '2022-11-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (136, 7, 26, 0, '工程图定稿', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (137, 7, 26, 52, '合同签订', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (138, 7, 26, 52, '开模', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (139, 7, 26, 52, '检卡定稿', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (140, 7, 26, 52, '首样确认', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (141, 7, 27, 53, '修模计划下发', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (142, 7, 27, 53, '开模', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (143, 7, 27, 53, '修模件确认', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (144, 7, 27, 54, '产品小批量试制及3C样机', NULL, NULL, '2022-11-30', '2022-12-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (145, 7, 28, 55, '开模件产品验证', NULL, NULL, '2021-12-31', '2023-01-19', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (146, 7, 28, 0, '3C认证', NULL, NULL, '2022-01-19', '2023-01-24', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (147, 7, 28, 56, '结题归档', NULL, NULL, '2022-01-25', '2023-01-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (148, 8, 29, 57, '产品结构改进设计及评审', '2022-10-09', NULL, '2022-10-09', '2022-10-30', 0, 0, NULL, 'doing', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (149, 8, 29, 58, '样机加工零件、样机装配', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (150, 8, 29, 58, '温升试验', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (151, 8, 29, 58, '分断（1天）、短耐性能试验', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (152, 8, 29, 58, '试验评审、整机模型修改', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (153, 8, 29, 59, '样机加工零件、样机装配', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (154, 8, 29, 59, '温升试验', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (155, 8, 29, 59, '分断（1天）、短耐性能试验', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (156, 8, 29, 59, '试验评审、整机模型修改', NULL, NULL, '2022-10-31', '2022-12-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (157, 8, 30, 0, '工程图定稿', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (158, 8, 30, 60, '合同签订', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (159, 8, 30, 60, '开模', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (160, 8, 30, 60, '检卡定稿', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (161, 8, 30, 60, '首样确认', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (162, 8, 31, 61, '修模计划下发', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (163, 8, 31, 61, '开模', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (164, 8, 31, 61, '修模件确认', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (165, 8, 31, 62, '产品小批量试制及3C样机', NULL, NULL, '2022-12-31', '2023-03-30', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (166, 8, 32, 63, '开模件产品验证', NULL, NULL, '2023-03-31', '2023-04-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (167, 8, 32, 0, '3C认证', NULL, NULL, '2023-04-30', '2023-05-19', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task` VALUES (168, 8, 32, 64, '结题归档', NULL, NULL, '2023-05-19', '2023-05-29', 0, 0, NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);

-- ----------------------------
-- Table structure for task_deliverable
-- ----------------------------
DROP TABLE IF EXISTS `task_deliverable`;
CREATE TABLE `task_deliverable`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `task_id` bigint(0) NOT NULL COMMENT 'Task ID',
  `product_id` bigint(0) NULL DEFAULT NULL COMMENT 'Product ID',
  `nums` int(0) NULL DEFAULT NULL COMMENT '数量',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '交付物',
  `files` json NULL COMMENT 'T:json|Files',
  `status` enum('waiting','done') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'waiting' COMMENT '状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `task_id_index`(`task_id`) USING BTREE,
  INDEX `product_id_index`(`product_id`) USING BTREE,
  INDEX `nums_index`(`nums`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_deliverable
-- ----------------------------
INSERT INTO `task_deliverable` VALUES (1, 1, 1, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (2, 1, 2, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (3, 1, 3, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (4, 1, 3, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (5, 1, 4, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (6, 1, 4, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (7, 1, 5, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (8, 1, 5, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (9, 1, 6, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (10, 1, 7, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (11, 1, 7, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (12, 1, 8, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (13, 1, 8, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (14, 1, 9, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (15, 1, 9, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (16, 1, 10, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (17, 1, 11, NULL, 1, '合同', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (18, 1, 12, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (19, 1, 13, NULL, 1, '检卡', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (20, 1, 14, NULL, 1, '首样照片', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (21, 1, 15, NULL, 1, '修模计划书', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (22, 1, 16, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (23, 1, 17, 1, 1, '产品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (24, 1, 18, NULL, 1, '试制报告（含修模计划）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (25, 1, 19, NULL, 1, '试验报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (26, 1, 20, 1, 20, '样机', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (27, 1, 20, NULL, 1, '认证报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (28, 1, 21, 1, 1, '全套项目资料', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (29, 2, 22, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (30, 2, 23, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (31, 2, 24, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (32, 2, 24, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (33, 2, 25, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (34, 2, 25, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (35, 2, 26, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (36, 2, 26, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (37, 2, 27, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (38, 2, 28, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (39, 2, 28, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (40, 2, 25, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (41, 2, 25, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (42, 2, 30, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (43, 2, 30, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (44, 2, 31, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (45, 2, 32, NULL, 1, '合同', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (46, 2, 33, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (47, 2, 34, NULL, 1, '检卡', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (48, 2, 35, NULL, 1, '首样照片', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (49, 2, 36, NULL, 1, '修模计划书', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (50, 2, 37, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (51, 2, 38, 1, 1, '产品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (52, 2, 39, NULL, 1, '试制报告（含修模计划）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (53, 2, 40, NULL, 1, '试验报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (54, 2, 41, 1, 20, '样机', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (55, 2, 41, NULL, 1, '认证报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (56, 2, 42, 1, 1, '全套项目资料', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (57, 3, 43, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (58, 3, 44, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (59, 3, 45, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (60, 3, 45, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (61, 3, 46, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (62, 3, 46, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (63, 3, 47, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (64, 3, 47, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (65, 3, 48, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (66, 3, 49, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (67, 3, 49, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (68, 3, 50, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (69, 3, 50, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (70, 3, 51, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (71, 3, 51, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (72, 3, 52, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (73, 3, 53, NULL, 1, '合同', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (74, 3, 54, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (75, 3, 55, NULL, 1, '检卡', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (76, 3, 56, NULL, 1, '首样照片', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (77, 3, 57, NULL, 1, '修模计划书', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (78, 3, 58, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (79, 3, 59, 1, 1, '产品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (80, 3, 60, NULL, 1, '试制报告（含修模计划）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (81, 3, 61, NULL, 1, '试验报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (82, 3, 62, 1, 20, '样机', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (83, 3, 62, NULL, 1, '认证报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (84, 3, 63, 1, 1, '全套项目资料', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (85, 4, 64, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (86, 4, 65, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (87, 4, 66, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (88, 4, 66, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (89, 4, 67, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (90, 4, 67, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (91, 4, 68, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (92, 4, 68, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (93, 4, 69, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (94, 4, 70, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (95, 4, 70, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (96, 4, 71, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (97, 4, 71, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (98, 4, 72, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (99, 4, 72, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (100, 4, 73, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (101, 4, 74, NULL, 1, '合同', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (102, 4, 75, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (103, 4, 76, NULL, 1, '检卡', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (104, 4, 77, NULL, 1, '首样照片', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (105, 4, 78, NULL, 1, '修模计划书', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (106, 4, 79, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (107, 4, 80, 1, 1, '产品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (108, 4, 81, NULL, 1, '试制报告（含修模计划）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (109, 4, 82, NULL, 1, '试验报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (110, 4, 83, 1, 20, '样机', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (111, 4, 83, NULL, 1, '认证报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (112, 4, 84, 1, 1, '全套项目资料', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (113, 5, 85, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (114, 5, 86, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (115, 5, 87, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (116, 5, 87, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (117, 5, 88, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (118, 5, 88, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (119, 5, 89, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (120, 5, 89, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (121, 5, 90, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (122, 5, 91, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (123, 5, 91, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (124, 5, 92, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (125, 5, 92, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (126, 5, 93, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (127, 5, 93, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (128, 5, 94, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (129, 5, 95, NULL, 1, '合同', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (130, 5, 96, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (131, 5, 97, NULL, 1, '检卡', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (132, 5, 98, NULL, 1, '首样照片', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (133, 5, 99, NULL, 1, '修模计划书', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (134, 5, 100, NULL, 1, '模具', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (135, 5, 101, 1, 1, '产品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (136, 5, 102, NULL, 1, '试制报告（含修模计划）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (137, 5, 103, NULL, 1, '试验报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (138, 5, 104, 1, 20, '样机', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (139, 5, 104, NULL, 1, '认证报告', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (140, 5, 105, 1, 1, '全套项目资料', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (141, 6, 106, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (142, 6, 107, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (143, 6, 108, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (144, 6, 108, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (145, 6, 109, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (146, 6, 109, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (147, 6, 110, NULL, 1, '工程图（开模）', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (148, 6, 110, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (149, 6, 111, 2, 5, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (150, 6, 112, 2, 1, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (151, 6, 112, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (152, 6, 113, 2, 2, '样品', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (153, 6, 113, NULL, 1, '试验报告、整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (154, 6, 114, NULL, 1, '3D模型', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (155, 6, 114, NULL, 1, '整改意见', NULL, 'done', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (156, 6, 115, NULL, 1, '工程图（开模）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (157, 6, 116, NULL, 1, '合同', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (158, 6, 117, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (159, 6, 118, NULL, 1, '检卡', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (160, 6, 119, NULL, 1, '首样照片', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (161, 6, 120, NULL, 1, '修模计划书', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (162, 6, 121, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (163, 6, 122, 1, 1, '产品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (164, 6, 123, NULL, 1, '试制报告（含修模计划）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (165, 6, 124, NULL, 1, '试验报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (166, 6, 125, 1, 20, '样机', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (167, 6, 125, NULL, 1, '认证报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (168, 6, 126, 1, 1, '全套项目资料', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (169, 7, 127, NULL, 1, '3D模型', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (170, 7, 128, 2, 5, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (171, 7, 129, 2, 1, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (172, 7, 129, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (173, 7, 130, 2, 2, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (174, 7, 130, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (175, 7, 131, NULL, 1, '工程图（开模）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (176, 7, 131, NULL, 1, '整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (177, 7, 132, 2, 5, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (178, 7, 133, 2, 1, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (179, 7, 133, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (180, 7, 134, 2, 2, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (181, 7, 134, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (182, 7, 135, NULL, 1, '3D模型', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (183, 7, 135, NULL, 1, '整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (184, 7, 136, NULL, 1, '工程图（开模）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (185, 7, 137, NULL, 1, '合同', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (186, 7, 138, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (187, 7, 139, NULL, 1, '检卡', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (188, 7, 140, NULL, 1, '首样照片', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (189, 7, 141, NULL, 1, '修模计划书', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (190, 7, 142, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (191, 7, 143, 1, 1, '产品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (192, 7, 144, NULL, 1, '试制报告（含修模计划）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (193, 7, 145, NULL, 1, '试验报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (194, 7, 146, 1, 20, '样机', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (195, 7, 146, NULL, 1, '认证报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (196, 7, 147, 1, 1, '全套项目资料', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (197, 8, 148, NULL, 1, '3D模型', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (198, 8, 149, 2, 5, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (199, 8, 150, 2, 1, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (200, 8, 150, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (201, 8, 151, 2, 2, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (202, 8, 151, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (203, 8, 152, NULL, 1, '工程图（开模）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (204, 8, 152, NULL, 1, '整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (205, 8, 153, 2, 5, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (206, 8, 154, 2, 1, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (207, 8, 154, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (208, 8, 155, 2, 2, '样品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (209, 8, 155, NULL, 1, '试验报告、整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (210, 8, 156, NULL, 1, '3D模型', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (211, 8, 156, NULL, 1, '整改意见', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (212, 8, 157, NULL, 1, '工程图（开模）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (213, 8, 158, NULL, 1, '合同', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (214, 8, 159, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (215, 8, 160, NULL, 1, '检卡', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (216, 8, 161, NULL, 1, '首样照片', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (217, 8, 162, NULL, 1, '修模计划书', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (218, 8, 163, NULL, 1, '模具', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (219, 8, 164, 1, 1, '产品', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (220, 8, 165, NULL, 1, '试制报告（含修模计划）', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (221, 8, 166, NULL, 1, '试验报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (222, 8, 167, 1, 20, '样机', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (223, 8, 167, NULL, 1, '认证报告', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_deliverable` VALUES (224, 8, 168, 1, 1, '全套项目资料', NULL, 'waiting', NULL, '2022-10-19 06:37:07', NULL, NULL);

-- ----------------------------
-- Table structure for task_member
-- ----------------------------
DROP TABLE IF EXISTS `task_member`;
CREATE TABLE `task_member`  (
  `id` bigint unsigned NOT NULL,
  `project_id` bigint(0) NOT NULL COMMENT 'Project ID',
  `task_id` bigint(0) NOT NULL COMMENT 'Task ID',
  `staff_id` bigint(0) NOT NULL COMMENT 'Staff ID',
  `is_manager` tinyint(1) NULL DEFAULT NULL COMMENT 'Is Manager',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `project_id_index`(`project_id`) USING BTREE,
  INDEX `task_id_index`(`task_id`) USING BTREE,
  INDEX `staff_id_index`(`staff_id`) USING BTREE,
  INDEX `is_manager_index`(`is_manager`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_member
-- ----------------------------
INSERT INTO `task_member` VALUES (1, 1, 1, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (2, 1, 1, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (3, 1, 2, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (4, 1, 2, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (5, 1, 3, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (6, 1, 3, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (7, 1, 4, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (8, 1, 4, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (9, 1, 5, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (10, 1, 5, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (11, 1, 6, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (12, 1, 6, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (13, 1, 7, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (14, 1, 7, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (15, 1, 8, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (16, 1, 8, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (17, 1, 9, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (18, 1, 9, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (19, 1, 10, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (20, 1, 10, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (21, 1, 11, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (22, 1, 11, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (23, 1, 12, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (24, 1, 12, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (25, 1, 13, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (26, 1, 13, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (27, 1, 14, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (28, 1, 14, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (29, 1, 15, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (30, 1, 15, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (31, 1, 16, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (32, 1, 16, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (33, 1, 17, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (34, 1, 17, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (35, 1, 18, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (36, 1, 18, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (37, 1, 19, 1, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (38, 1, 19, 2, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (39, 1, 20, 3, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (40, 1, 20, 4, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (41, 1, 21, 5, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (42, 1, 21, 6, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (43, 2, 22, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (44, 2, 22, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (45, 2, 23, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (46, 2, 23, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (47, 2, 24, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (48, 2, 24, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (49, 2, 25, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (50, 2, 25, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (51, 2, 26, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (52, 2, 26, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (53, 2, 27, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (54, 2, 27, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (55, 2, 28, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (56, 2, 28, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (57, 2, 29, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (58, 2, 29, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (59, 2, 30, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (60, 2, 30, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (61, 2, 31, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (62, 2, 31, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (63, 2, 32, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (64, 2, 32, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (65, 2, 33, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (66, 2, 33, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (67, 2, 34, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (68, 2, 34, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (69, 2, 35, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (70, 2, 35, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (71, 2, 36, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (72, 2, 36, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (73, 2, 37, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (74, 2, 37, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (75, 2, 38, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (76, 2, 38, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (77, 2, 39, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (78, 2, 39, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (79, 2, 40, 7, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (80, 2, 40, 8, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (81, 2, 41, 9, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (82, 2, 41, 10, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (83, 2, 42, 11, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (84, 2, 42, 12, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (85, 3, 43, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (86, 3, 43, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (87, 3, 44, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (88, 3, 44, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (89, 3, 45, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (90, 3, 45, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (91, 3, 46, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (92, 3, 46, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (93, 3, 47, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (94, 3, 47, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (95, 3, 48, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (96, 3, 48, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (97, 3, 49, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (98, 3, 49, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (99, 3, 50, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (100, 3, 50, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (101, 3, 51, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (102, 3, 51, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (103, 3, 52, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (104, 3, 52, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (105, 3, 53, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (106, 3, 53, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (107, 3, 54, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (108, 3, 54, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (109, 3, 55, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (110, 3, 55, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (111, 3, 56, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (112, 3, 56, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (113, 3, 57, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (114, 3, 57, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (115, 3, 58, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (116, 3, 58, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (117, 3, 59, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (118, 3, 59, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (119, 3, 60, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (120, 3, 60, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (121, 3, 61, 13, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (122, 3, 61, 14, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (123, 3, 62, 15, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (124, 3, 62, 16, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (125, 3, 63, 17, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (126, 3, 63, 18, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (127, 4, 64, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (128, 4, 64, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (129, 4, 65, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (130, 4, 65, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (131, 4, 66, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (132, 4, 66, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (133, 4, 67, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (134, 4, 67, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (135, 4, 68, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (136, 4, 68, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (137, 4, 69, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (138, 4, 69, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (139, 4, 70, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (140, 4, 70, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (141, 4, 71, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (142, 4, 71, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (143, 4, 72, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (144, 4, 72, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (145, 4, 73, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (146, 4, 73, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (147, 4, 74, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (148, 4, 74, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (149, 4, 75, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (150, 4, 75, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (151, 4, 76, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (152, 4, 76, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (153, 4, 77, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (154, 4, 77, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (155, 4, 78, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (156, 4, 78, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (157, 4, 79, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (158, 4, 79, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (159, 4, 80, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (160, 4, 80, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (161, 4, 81, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (162, 4, 81, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (163, 4, 82, 19, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (164, 4, 82, 20, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (165, 4, 83, 21, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (166, 4, 83, 22, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (167, 4, 84, 23, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (168, 4, 84, 24, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (169, 5, 85, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (170, 5, 85, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (171, 5, 86, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (172, 5, 86, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (173, 5, 87, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (174, 5, 87, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (175, 5, 88, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (176, 5, 88, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (177, 5, 89, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (178, 5, 89, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (179, 5, 90, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (180, 5, 90, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (181, 5, 91, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (182, 5, 91, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (183, 5, 92, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (184, 5, 92, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (185, 5, 93, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (186, 5, 93, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (187, 5, 94, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (188, 5, 94, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (189, 5, 95, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (190, 5, 95, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (191, 5, 96, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (192, 5, 96, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (193, 5, 97, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (194, 5, 97, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (195, 5, 98, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (196, 5, 98, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (197, 5, 99, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (198, 5, 99, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (199, 5, 100, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (200, 5, 100, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (201, 5, 101, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (202, 5, 101, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (203, 5, 102, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (204, 5, 102, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (205, 5, 103, 25, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (206, 5, 103, 26, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (207, 5, 104, 27, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (208, 5, 104, 28, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (209, 5, 105, 29, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (210, 5, 105, 30, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (211, 6, 106, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (212, 6, 106, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (213, 6, 107, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (214, 6, 107, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (215, 6, 108, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (216, 6, 108, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (217, 6, 109, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (218, 6, 109, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (219, 6, 110, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (220, 6, 110, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (221, 6, 111, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (222, 6, 111, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (223, 6, 112, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (224, 6, 112, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (225, 6, 113, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (226, 6, 113, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (227, 6, 114, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (228, 6, 114, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (229, 6, 115, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (230, 6, 115, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (231, 6, 116, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (232, 6, 116, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (233, 6, 117, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (234, 6, 117, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (235, 6, 118, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (236, 6, 118, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (237, 6, 119, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (238, 6, 119, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (239, 6, 120, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (240, 6, 120, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (241, 6, 121, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (242, 6, 121, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (243, 6, 122, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (244, 6, 122, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (245, 6, 123, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (246, 6, 123, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (247, 6, 124, 31, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (248, 6, 124, 32, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (249, 6, 125, 33, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (250, 6, 125, 34, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (251, 6, 126, 35, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (252, 6, 126, 36, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (253, 7, 127, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (254, 7, 127, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (255, 7, 128, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (256, 7, 128, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (257, 7, 129, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (258, 7, 129, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (259, 7, 130, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (260, 7, 130, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (261, 7, 131, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (262, 7, 131, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (263, 7, 132, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (264, 7, 132, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (265, 7, 133, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (266, 7, 133, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (267, 7, 134, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (268, 7, 134, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (269, 7, 135, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (270, 7, 135, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (271, 7, 136, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (272, 7, 136, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (273, 7, 137, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (274, 7, 137, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (275, 7, 138, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (276, 7, 138, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (277, 7, 139, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (278, 7, 139, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (279, 7, 140, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (280, 7, 140, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (281, 7, 141, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (282, 7, 141, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (283, 7, 142, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (284, 7, 142, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (285, 7, 143, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (286, 7, 143, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (287, 7, 144, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (288, 7, 144, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (289, 7, 145, 37, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (290, 7, 145, 38, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (291, 7, 146, 39, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (292, 7, 146, 40, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (293, 7, 147, 41, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (294, 7, 147, 42, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (295, 8, 148, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (296, 8, 148, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (297, 8, 149, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (298, 8, 149, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (299, 8, 150, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (300, 8, 150, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (301, 8, 151, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (302, 8, 151, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (303, 8, 152, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (304, 8, 152, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (305, 8, 153, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (306, 8, 153, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (307, 8, 154, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (308, 8, 154, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (309, 8, 155, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (310, 8, 155, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (311, 8, 156, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (312, 8, 156, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (313, 8, 157, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (314, 8, 157, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (315, 8, 158, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (316, 8, 158, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (317, 8, 159, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (318, 8, 159, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (319, 8, 160, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (320, 8, 160, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (321, 8, 161, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (322, 8, 161, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (323, 8, 162, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (324, 8, 162, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (325, 8, 163, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (326, 8, 163, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (327, 8, 164, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (328, 8, 164, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (329, 8, 165, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (330, 8, 165, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (331, 8, 166, 43, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (332, 8, 166, 44, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (333, 8, 167, 45, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (334, 8, 167, 46, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (335, 8, 168, 47, 1, NULL, '2022-10-19 06:37:07', NULL, NULL);
INSERT INTO `task_member` VALUES (336, 8, 168, 48, 0, NULL, '2022-10-19 06:37:07', NULL, NULL);

-- ----------------------------
-- Table structure for xiang_menu
-- ----------------------------
DROP TABLE IF EXISTS `xiang_menu`;
CREATE TABLE `xiang_menu`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `parent` bigint(0) NULL DEFAULT NULL COMMENT '父节点',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `blocks` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'block布局',
  `visible_menu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '显示',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由',
  `rank` int(0) NOT NULL DEFAULT 9999 COMMENT '排列',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '菜单状态 enabled 开启, disabled 关闭',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_index`(`parent`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `blocks_index`(`blocks`) USING BTREE,
  INDEX `visible_menu_index`(`visible_menu`) USING BTREE,
  INDEX `path_index`(`path`) USING BTREE,
  INDEX `rank_index`(`rank`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiang_menu
-- ----------------------------
INSERT INTO `xiang_menu` VALUES (1, NULL, '数据看板', 'icon-activity', 1, 0, '/kanban', 1, 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);
INSERT INTO `xiang_menu` VALUES (2, NULL, '云服务库', 'icon-cloud', 0, 0, '/table/service', 2, 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);

-- ----------------------------
-- Table structure for xiang_user
-- ----------------------------
DROP TABLE IF EXISTS `xiang_user`;
CREATE TABLE `xiang_user`  (
  `id` bigint unsigned NOT NULL,
  `type` enum('admin','staff','user','robot') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'user' COMMENT '账号类型 admin 管理员, staff 员工, user 用户, robot 机器人',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `password2nd` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作密码',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `key` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API Key',
  `secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'API 密钥',
  `extra` json NULL COMMENT 'T:json|扩展信息',
  `status` enum('enabled','disabled') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'enabled' COMMENT '用户状态 enabled 有效, disabled 无效',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key_unique`(`key`) USING BTREE,
  UNIQUE INDEX `type_email_unique`(`type`, `email`) USING BTREE,
  UNIQUE INDEX `type_mobile_unique`(`type`, `mobile`) USING BTREE,
  INDEX `type_index`(`type`) USING BTREE,
  INDEX `email_index`(`email`) USING BTREE,
  INDEX `mobile_index`(`mobile`) USING BTREE,
  INDEX `password_index`(`password`) USING BTREE,
  INDEX `password2nd_index`(`password2nd`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `idcard_index`(`idcard`) USING BTREE,
  INDEX `secret_index`(`secret`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xiang_user
-- ----------------------------
INSERT INTO `xiang_user` VALUES (1, 'admin', 'xiang@iqka.com', NULL, '$2a$04$ODJ7AGubnsJQds9KCjOjFOelo6evSTUsQ4nbqzGrT2MjM9z1Q5EZq', NULL, '管理员', NULL, '8304925176', 'DFA9FCA03FC160993B81A921B5E4EC4AD4DD0502A876EE12C1A350EB0C0321D76F253E665F589DCCB29A17F5D4FB268E', '{\"sex\": \"男\"}', 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);
INSERT INTO `xiang_user` VALUES (2, 'staff', 'staff@iqka.com', NULL, '$2a$04$B4KaDoWkTvTli6yV2npl5u.oWDe/uPJPY3eqNyZqQ4Z.69nbCQhSq', NULL, '员工', NULL, NULL, NULL, '{\"sex\": \"女\"}', 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);
INSERT INTO `xiang_user` VALUES (3, 'user', NULL, 'B3FE5501344A312773A88160297C34C4', '$2a$04$3Frt1VcEWY7W.LS4fzE.mOq13f92xRx5/7oQvSSMatY/ToWHF.W76', NULL, '用户', NULL, NULL, NULL, '{\"sex\": \"女\"}', 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);
INSERT INTO `xiang_user` VALUES (4, 'robot', NULL, NULL, NULL, NULL, '机器人', NULL, '3845196072', '0ED59349BDA934EFB1F76B1EC65A4A2C939A3BC881759F14781A92C64A73A2A66F253E665F589DCCB29A17F5D4FB268E', '{\"sex\": \"女\"}', 'enabled', NULL, '2022-10-19 06:32:35', NULL, NULL);

-- ----------------------------
-- Table structure for xiang_workflow
-- ----------------------------
DROP TABLE IF EXISTS `xiang_workflow`;
CREATE TABLE `xiang_workflow`  (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工作流名称',
  `data_id` bigint(0) NULL DEFAULT NULL COMMENT '关联数据标识, 关联数据模型表格ID',
  `node_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前节点名称',
  `node_status` enum('未开始','进行中','已完成') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未开始' COMMENT '当前节点状态',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '当前处理人',
  `user_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关处理人ID列表(用于检索)',
  `users` json NULL COMMENT 'T:json|相关处理人',
  `input` json NULL COMMENT 'T:json|各节点输入数据(Key-Value)',
  `output` json NULL COMMENT 'T:json|各节点处理结果(Key-Value)',
  `history` json NULL COMMENT 'T:json|操作记录',
  `status` enum('未开始','进行中','已完成','已关闭') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '未开始' COMMENT '流程状态',
  `deleted_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除标记',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `__restore_data` json NULL COMMENT 'T:json|',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name_index`(`name`) USING BTREE,
  INDEX `data_id_index`(`data_id`) USING BTREE,
  INDEX `node_name_index`(`node_name`) USING BTREE,
  INDEX `node_status_index`(`node_status`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `user_ids_index`(`user_ids`) USING BTREE,
  INDEX `status_index`(`status`) USING BTREE,
  INDEX `created_at_index`(`created_at`) USING BTREE,
  INDEX `updated_at_index`(`updated_at`) USING BTREE,
  INDEX `deleted_at_index`(`deleted_at`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
