-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 10, 2023 at 04:34 AM
-- Server version: 5.7.39
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adv-docs`
--

-- --------------------------------------------------------

--
-- Table structure for table `auto_number`
--

CREATE TABLE `auto_number` (
  `group` varchar(32) NOT NULL,
  `number` int(11) DEFAULT NULL,
  `optimistic_lock` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auto_number`
--

INSERT INTO `auto_number` (`group`, `number`, `optimistic_lock`, `update_time`) VALUES
('202307-???', 24, 1, 1690343279),
('202308-???', 5, 1, 1691475474),
('5bce8a536749f4b5ebc03a256521426b', 24, 1, 1690343279),
('cb6105f484ffd5639fbc25fa3de20634', 3, 1, 1691475474);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'หมวดหมู่',
  `details` text COMMENT 'รายละเอียด',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `details`, `color`) VALUES
(1, 'ทั่วไป', 'เอกสารทั่วไป', '#434343'),
(2, 'COI', 'หนังสือรับรองสูตรส่วนประกอบ (Certificate of Ingredient)', '#F31559'),
(3, 'ISO', 'International Organization for Standardization', '#8e7cc3'),
(4, 'COA', 'ใบรายงานผลการตรวจวิเคราะห์สินค้า Certificate of Analysis', '#090580'),
(5, 'Quality', 'Quality Assurance', '#ef4dd8'),
(6, 'Transport Cert.', 'ใบรับรองการขนส่ง (Transport Certificate)', '#9900ff'),
(7, 'Test Report', 'รายงานผลการทดสอบ (Test Report)', '#0000ff'),
(8, 'Certificate', 'ใบรับรอง (Master Certificate)', '#ff9900');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `numbers` varchar(255) DEFAULT NULL COMMENT 'รหัสเอกสาร',
  `title` varchar(255) NOT NULL COMMENT 'ชื่อเอกสาร',
  `description` text COMMENT 'รายละเอียด',
  `expiration_date` date DEFAULT NULL COMMENT 'วันที่หมดอายุ',
  `document_date` smallint(6) DEFAULT '60',
  `created_at` datetime DEFAULT NULL COMMENT 'วันที่เอกสาร',
  `updated_at` datetime DEFAULT NULL COMMENT 'วันที่ปรับปรุง',
  `created_by` int(11) DEFAULT NULL COMMENT 'ผู้สร้าง',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ผู้ปรับปรุง',
  `categories_id` int(11) DEFAULT NULL COMMENT 'หมวดหมู่',
  `occupier_id` int(11) NOT NULL COMMENT 'ครอบครอง',
  `types_id` int(11) DEFAULT NULL COMMENT 'ประเภท',
  `status_id` int(11) DEFAULT '1' COMMENT 'สถานะ',
  `ref` varchar(255) DEFAULT NULL COMMENT 'อ้างอิง',
  `docs` text COMMENT 'ไฟล์เอกสาร'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `numbers`, `title`, `description`, `expiration_date`, `document_date`, `created_at`, `updated_at`, `created_by`, `updated_by`, `categories_id`, `occupier_id`, `types_id`, `status_id`, `ref`, `docs`) VALUES
(6, '202307-005', 'ถั่วเหลือง Organic (อุ่มแสง)', '', '2024-01-11', 60, '2023-07-21 16:52:12', '2023-08-10 10:13:39', 3, 1, 4, 2, 1, 1, 'Mh2Q3vg4bBIVuEB64Joxb0', '{\"befc1fd021f4ecbf6e6620e02a3ffc29.pdf\":\"ถั่วเหลือง Organic - อุ่มแสง.pdf\"}'),
(7, '202307-006', 'ถั่วเหลือง Organic Fairtrade (อุ่มแสง)', '', '2021-05-31', 30, '2023-07-22 08:54:08', '2023-08-10 10:15:10', 3, 1, 4, 2, 1, 3, 'EuL6CpCXtrijFWTXmEkdya', '{\"735854d45a4faf0cf656d0522e1bae23.pdf\":\"ถั่วเหลือง Organic FT. - อุ่มแสง.pdf\"}'),
(8, '202307-007', 'ถั่วเหลือง Organic Fairtrade (Gebana)', '', '2023-12-31', 60, '2023-07-22 09:09:40', '2023-07-22 10:15:40', 3, 3, 4, 1, 1, 1, 'GebU-zdiovR_5XoDiylaAj', '{\"18bd120b62fa910d2a721b7f5a55ba46.pdf\":\"Organic Soybean Fairtrade - Gebana.pdf\"}'),
(9, '202307-008', 'ถั่วเหลือง (ชาญ บรรณมาศ)', '', '2023-11-09', 60, '2023-07-22 09:26:50', '2023-07-22 10:15:52', 3, 3, 4, 1, 1, 1, 'gUnyjNevFJMU7rZQ3M4XsY', '{\"69008dceb176053607d173bfc58f22f7.pdf\":\"ถั่วเหลือง - ชาญ บรรณมาศ.pdf\"}'),
(10, '202307-009', 'ข้าวสาลี (Blue Point)', '', '2022-02-23', 60, '2023-07-22 09:49:32', '2023-08-08 16:40:37', 3, 2, 7, 1, 2, 3, '8AfVcCcTixDY_ckM4-pro8', '{\"23555e50f9f5a3105fcc7a076b7a0ed8.pdf\":\"ข้าวสาลี - Blue Point.pdf\"}'),
(11, '202307-010', 'ถั่วเหลือง Organic Fairtrade (Pratithi)', '', '2027-02-06', 60, '2023-07-22 10:15:12', NULL, 3, 3, 4, 1, 1, 1, 'HtKTESkQWykqPDPpG2JkQG', '{\"e053e82e52d86ac3673e40dd65fd173b.pdf\":\"Organic Soybean Fairtrade - Pratithi Organic Foods.pdf\"}'),
(12, '202307-011', 'ข้าวหอมมะลิอินทรีย์ (กฤษณกรณ์ออร์แกนิคฟาร์ม)', '', '2022-12-23', 60, '2023-07-22 10:27:25', NULL, 3, 3, 4, 1, 1, 3, 'lQm3O5BNqFSA_OhOC6BhFD', '{\"02daa11c12a6811f8626656e1ad50129.pdf\":\"ข้าวหอมมะลิอินทรีย์ - กฤษณกรณ์.pdf\"}'),
(13, '202307-012', 'ถั่วเหลือง Organic (ST.Lawrence Beans)', '', '2019-11-28', 60, '2023-07-22 13:16:01', '2023-08-08 09:52:38', 3, 1, 4, 1, 1, 3, 'hH11yBt30BGkqY3dzmL2b0', '{\"d739cad180f87056c5867f323fdc6a24.pdf\":\"ถั่วเหลือง Organic - ST-Lawrence Beans.pdf\"}'),
(14, '202307-013', 'Fairtrade Certificate (NFC)', '', '2025-09-02', 60, '2023-07-26 08:24:59', '2023-07-26 10:02:27', 3, 3, 8, 1, 1, 1, 'GQEE5_6NLCowdNnFHh7mGo', '{\"69e7f8fbf5fc374af40f64a83466e15a.pdf\":\"CERT_Certificate  Fairtrade 2021-2025.pdf\",\"adf7999b0487bd4b47907432cc4b224a.pdf\":\"LicensedProducts.pdf\"}'),
(15, '202307-014', 'Certificate FSSC 22000 (NFC)', '', '2025-01-05', 60, '2023-07-26 08:41:40', NULL, 3, 3, 8, 1, 1, 1, 'MZgYMcjAokdNMGBW7iNZEm', '{\"cdbd27a6ff8d63d81433221d02f6ef4e.pdf\":\"FSSC22000 EXP05JAN2025.pdf\"}'),
(16, '202307-015', 'Certificate GHPs, HACCP (NFC)', '', '2024-03-07', 60, '2023-07-26 08:56:46', NULL, 3, 3, 8, 1, 1, 1, 'r-InFsiMit20WyoOeJOWpq', '{\"f89fa2032a4eb2127f8cd20529e09dc0.pdf\":\"GMP  HACCP  Exp2024.pdf\"}'),
(17, '202307-016', 'Certificate ISO 9001:2015 (NFC)', '', '2023-09-24', 60, '2023-07-26 09:28:43', NULL, 3, 3, 8, 1, 1, 1, 'ikk0CUJoT5kbW7nwQZirlX', '{\"289736527acc04ab59ea4c135d21f362.pdf\":\"ISO 9001.2015(EN) exp 24092023.pdf\"}'),
(18, '202307-017', 'Certificate ISO 14001:2015 (NFC)', '', '2023-09-20', 60, '2023-07-26 09:32:28', NULL, 3, 3, 8, 1, 1, 1, '41E5gXM4vfL3sKtylwkACb', '{\"3ad7f385487d54d87eeda40eeccdc74b.pdf\":\"ISO 14001.2015 (EN)exp 20092023.pdf\"}'),
(19, '202307-018', 'Certificate มอก. 9001-2559 / ISO 9001:2015 (NFC)', '', '2025-10-17', 60, '2023-07-26 09:44:42', NULL, 3, 3, 8, 1, 1, 1, 'zUrhR8hrUvBdFse9KobVyi', '{\"6226040d2e818248d7b1cca56cc33fa2.pdf\":\"ISO9001 2015  Exp 10 2025  EN (1).pdf\",\"6af27f8cfdd51b6bef94ffbe2a805956.pdf\":\"ISO9001 2015  exp 2025 TH.pdf\"}'),
(20, '202307-019', 'Certificate มอก. 14001-2559 / ISO 14001:2015 (NFC)', '', '2025-10-17', 60, '2023-07-26 09:52:04', NULL, 3, 3, 8, 1, 1, 1, 'nMrCnHbvSO3sS-HsI17ij5', '{\"8c8f7e898b7aa1ba354fc9ef1d4a7ecf.pdf\":\"ISO14001  Exp 10 2025 EN (1).pdf\",\"d86b230d2468019961162f4dbac26218.pdf\":\"ISO14001 Exp 10 2025 TH.pdf\"}'),
(21, '202307-020', 'Certificate ISO 22000:2018 (NFC)', '', '2024-03-07', 60, '2023-07-26 09:54:51', NULL, 3, 3, 8, 1, 1, 1, 'QvZ0OeFYyKsCOsRRZi0pKB', '{\"0921c08a5b3b0eb93a04dccc5a55ea04.pdf\":\"ISO22000 (2).pdf\"}'),
(22, '202307-021', 'Certificate มอก. 45001:2561 / ISO 45001:2018 (NFC)', '', '2025-10-17', 60, '2023-07-26 10:01:31', NULL, 3, 3, 8, 1, 1, 1, '_jAc_uTZb4aFOLieumfku6', '{\"7988b480b78dd626bb27e5e258bd3610.pdf\":\"ISO45001 Exp10 2025 EN (1).pdf\",\"a62b3cb5b21f34e74de842f7f30b41cb.pdf\":\"ISO45001 EXP10 2565  TH.pdf\"}'),
(23, '202307-022', 'Certificate VALID-IT Non-GM PROTOCOL (NFC)', '', '2024-04-30', 60, '2023-07-26 10:30:31', NULL, 3, 3, 8, 1, 1, 1, 'iqigDUohgJ6qWtEEA0xWVW', '{\"11e77277d80f0656411ad15db2ef8bf6.pdf\":\"Northern Food Complex Co Ltd - 146 (2) (2).pdf\"}'),
(24, '202307-023', 'Halal Certificate (NFC)', '', '2023-07-31', 60, '2023-07-26 10:36:44', '2023-08-08 11:04:12', 3, 1, 8, 1, 1, 1, 'p7sir4lYZaSBuo_-YRBE07', '{\"3c9d53a4d1820ba3cb1a36dc9eab2f5a.pdf\":\"scan-Halal 2565-2566.pdf\"}'),
(25, '202307-024', 'Certificate TLS 8001:2020 (NFC)', '', '2025-01-16', 60, '2023-07-26 10:47:59', NULL, 3, 3, 8, 1, 1, 1, 'YqXl2u8QpLAT1F-nuOlJrx', '{\"f0c84206b2dafb4e21690eda031a1ed1.pdf\":\"scan-มรท.8001-2563 (2565-2568)-(Eng).pdf\"}'),
(26, '202308-001', 'Certificate USDA Organic (PB Valley Chiangrai)', 'DSDA Organic regulations, 7 CFR part 205 (NOP) และ Product list', '2023-07-31', 60, '2023-08-05 10:45:07', NULL, 3, 3, 8, 1, 1, 3, 'MlAspZCEGfeZyCPa9GeY-k', '{\"9b4a8be6ab410a8a7df371702073374a.pdf\":\"CERES_Produkteliste_PB valley.pdf\",\"6ff69564ad1c0d8cef7cdfdb098f8d7a.pdf\":\"CERES_Zertifikat_PB Valley.pdf\"}'),
(27, '202308-002', 'Certificate CERES Organic Standard (CE-OS) EU Equivalent Standard (NFC)', 'CERES Organic Standard (CE-OS) EU Equivalent Standard for third countries และ Product list', '2023-07-31', 60, '2023-08-05 11:53:37', '2023-08-08 11:29:22', 3, 1, 8, 1, 1, 3, 'bAQMxZX7ZtFDq1rCXQ2hkB', '{\"d9bd7413ec8873474cd277bbe4f702b4.pdf\":\"CERES_Produkteliste.pdf\",\"e79f6407f7440e71ea5018346e752fa0.pdf\":\"CERES_Zertifikat_v4.pdf\"}');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1689666301),
('m130524_201442_init', 1689666303),
('m190124_110200_add_verification_token_column_to_user_table', 1689666303);

-- --------------------------------------------------------

--
-- Table structure for table `occupier`
--

CREATE TABLE `occupier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'ประเภท',
  `details` text COMMENT 'รายละเอียด',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `occupier`
--

INSERT INTO `occupier` (`id`, `name`, `details`, `color`) VALUES
(1, 'NFC', 'NorthernfoodComplex', '#2ecc0e'),
(2, 'Supplier', 'Other Company', '#C21010');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'สถานะ',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `name`, `color`) VALUES
(1, 'ใช้งาน', '#328906'),
(2, 'ยกเลิก', '#FE0000'),
(3, 'ร่าง', '#3AA6B9'),
(4, 'ดำเนินการ', '#E7B10A');

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'ประเภท',
  `details` text COMMENT 'รายละเอียด',
  `color` varchar(45) DEFAULT NULL COMMENT 'สี'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `types`
--

INSERT INTO `types` (`id`, `name`, `details`, `color`) VALUES
(1, 'Oranic', 'System Organic', '#274e13'),
(2, 'Original', '', '#a64d79'),
(3, 'System Fairtrade', 'Fairtrade', '#3AA6B9'),
(4, 'ในประเทศ', '', '#6aa84f'),
(5, 'ต่างประเทศ', 'ต่างประเทศ', '#e69138');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thai_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ-สกุล',
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` smallint(6) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `thai_name`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `verification_token`, `role`) VALUES
(1, 'admin', 'ผู้ดูแลระบบ', '2tzscTHLNpS0rJlIJx_Uz1qZnvi6yS_q', '$2y$13$HwJ0Osagp4BHhcjKJMS.Su1kte.bpcDMCIusYWpu088FzQai9YqC6', NULL, 'admin@admin.com', 10, 1689666356, 1691635667, 'SA3gozOob2BBbQR0Ue5t4mJQpoyb0gcp_1689666356', 10),
(2, 'demo', 'ธีรพงศ์ ขันตา', 'lJsMEFiO-XjqJrVhH2aDcjXyrP0oC0vy', '$2y$13$9cR6h5aFzqkDiaIYP4DQYuywLj.cgAyUBuIexfQNZCqaJQ.T/Zxfi', NULL, 'demo@demo.com', 10, 1689756005, 1689756005, 'sfLH5psKTa0wMf7dH-kiSrkNcSPqn9OD_1689756005', 5),
(3, 'onanong', 'อรอนงค์ ชมภู', '2bj5VmZ1PEwJDerqRsj3fhE8i2zvsVZq', '$2y$13$08zXpjOdJu83tT84JNqebe3SMFVctXSfynLDfss3sFMiveC7tPEUS', NULL, 'onanong@nfc.com', 10, 1689759317, 1689759317, '9NqfkSJcx8KkIodMLNCeH9HLqhOUmcxw_1689759317', 10),
(4, 'supanna', 'สุพรรณา พันธ์ภู่', 'yJwBMulOJv3IDmDkCXrdYZ-VMEw_zwLZ', '$2y$13$O4m3JByeXwarBQx8Na5aXuqT8v0WqaRJakqletAVt/p8XffgPvcau', NULL, 'supanna@nfc.com', 10, 1689759339, 1689759339, '4Zgy1uVGJvXg2nZOAHcFCSj0NK0Ll3Ze_1689759339', 9),
(5, 'prakaiwan', 'ประกายวรรณ เทพมณี', 'y2RYhV3E1NG68CUaa8svzBknRdbCTO79', '$2y$13$GkUZhR.dM5CJdm9MCnTYp.Ij9eya2sBVX.9CaRP/nlJq92WAQ7y02', NULL, 'prakaiwan@nfc.com', 10, 1689759362, 1689759362, '2qNZk71gb01_K-bdCiscD38z36G9exZH_1689759362', 9),
(6, 'sale', 'ฝ่ายขาย', 'EHSvx6uElywR8fG2XRQ_xKE4sups-8cO', '$2y$13$fOXl5gCyOYl4NxlvgBJ85O7wQvWcVNYnzg4IGDNkIkX6hl2d7aMbO', NULL, 'sale@nfc.com', 10, 1689759388, 1689759388, '9ZnxmSRzPpvLgxD0MPSamdokpcp_eMul_1689759388', 8),
(7, 'planning', 'ฝ่ายวางแผน', 'JWT4BgIkYF4TIN62mLaKv5iL0uLMn7C9', '$2y$13$g08zQ7xjXISzs99kS2yApuOCRcV6QpMOfdzNAwYY8fP9N96pEuAye', NULL, 'planning@nfc.com', 9, 1689759413, 1691634989, '7xCjBXE9xNLx1gWqKX2LaVex2ah0IWt4_1689759413', 1),
(8, 'production', 'ฝ่ายผลิต', 'FjE8vrSWJ1uVTanpvQJDnpq_OiUySrzg', '$2y$13$Oa3U4rEqDwN8W0ytkDHCjuPw8CW4d44l9tEWbi3N3myBogr4mmzBy', NULL, 'production@nfc.com', 9, 1689759430, 1689759430, 'qNJ-e9RkWlfqvHqmvmSsItU1rlpb_D3j_1689759430', 1),
(9, 'user', 'ผู้ใช้งาน', 'XEPSPmb7Bt0oI_tklPUc5Uh4Jq4HM4Ig', '$2y$13$Cnpq/RL3WMS2iCp5aceVpOtAEuq.LIilfbVNr4uJiBDNwswJhKkuq', NULL, 'user@local.com', 10, 1690430330, 1691639715, 't1iesBNA9TNHWotQHvGzbLCVhrK6LF9O_1690430330', 1),
(10, 'somsak', 'สมศักดิ์ ชาญเกียรติก้อง', '3tiUcswenYgRTZTfuvfv_Tv4V7BXwAcn', '$2y$13$RaVMZpvieW5IfdwpInG4JejNTn8rb7rTCluwPUDO6R8kAJBj1l7D.', NULL, 'somsak@northernfoodcomplex.com', 10, 1691631165, 1691636446, 'Pj5G3y6R8VeykAb0cyXVIHChtnlpquo9_1691631165', 8),
(11, 'peeranai', 'พีรนัย โสทรทวีพงศ์', 'G3b3XCgv3uFzzly7jDX0cJXzNm45qoUV', '$2y$13$5gM/232mFQdlLwbqiQOdE.n2zbN3cLuDGdhIsTK0USk.ASVILRPZy', NULL, 'peeranai@northernfoodcomplex.com', 10, 1691631423, 1691631423, 'HmjAFfcWByo3VbwpZDD9qeBA-shqds8q_1691631423', 8),
(12, 'theerapong', 'ธีรพงศ์ ขันตา', 'tWXwJZ5JEXbWCN0M-0zpCouAUJcL5BwZ', '$2y$13$WG5mTZIZ4ZcL3BoA/vA/7urFzlU2xQ2g4NU29gJegyCCcIte0TCP.', NULL, 'sam47290800@gmail.com', 10, 1691639318, 1691639449, NULL, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auto_number`
--
ALTER TABLE `auto_number`
  ADD PRIMARY KEY (`group`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_documents_categories_idx` (`categories_id`),
  ADD KEY `fk_documents_status1_idx` (`status_id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `occupier`
--
ALTER TABLE `occupier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `occupier`
--
ALTER TABLE `occupier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `fk_documents_categories` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_documents_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
