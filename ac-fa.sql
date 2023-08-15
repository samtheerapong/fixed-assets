-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 15, 2023 at 09:28 AM
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
-- Database: `ac-fa`
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
('202308-???', 16, 1, 1691746087),
('5bce8a536749f4b5ebc03a256521426b', 24, 1, 1690343279),
('B-66-PN-B1-???', 2, 1, 1692075007),
('B-66-PN-IT-???', 4, 1, 1692004280),
('cb6105f484ffd5639fbc25fa3de20634', 14, 1, 1691746087),
('E-63-E-E-???', 1, 1, 1692003649),
('E-63-EN-IT-???', 1, 1, 1692003716),
('E-63-PC-IT-???', 1, 1, 1692003377),
('E-63-PU-B1-???', 1, 1, 1692075083),
('E-66-EN-EN-???', 1, 1, 1692077968),
('E-66-PN-B1-???', 2, 1, 1692075070),
('E-66-PN-IT-???', 4, 1, 1692003173),
('F-63-EN-B1-???', 1, 1, 1692075095),
('F-63-EN-IT-???', 1, 1, 1692003743),
('F-66-AC-B1-???', 3, 1, 1692075774),
('F-66-AC-BOL-???', 1, 1, 1692073223),
('F-66-AC-GBS-???', 1, 1, 1692073097),
('F-66-AC-GUH-???', 1, 1, 1692073177),
('F-66-AC-IT-???', 1, 1, 1692004172),
('F-66-AC-QCR-???', 1, 1, 1692062113),
('F-66-AC-WSP-???', 3, 1, 1692073235),
('F-66-IT-B1-???', 2, 1, 1692075820),
('F-66-IT-IT-???', 1, 1, 1692003212),
('F-66-PN-IT-???', 2, 1, 1692003140),
('M-63-EN-WS-???', 1, 1, 1692075115),
('M-66-PN-B1-???', 2, 1, 1692074999),
('M-66-PN-IT-???', 2, 1, 1692004189),
('V-66-PN-B1-???', 1, 1, 1692075060),
('V-66-PN-IT-???', 1, 1, 1692004144);

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
(8, '202307-007', 'ถั่วเหลือง Organic Fairtrade (Gebana)', '', '2023-12-31', 60, '2023-07-22 09:09:40', '2023-08-11 13:17:14', 3, 3, 4, 2, 1, 1, 'GebU-zdiovR_5XoDiylaAj', '{\"18bd120b62fa910d2a721b7f5a55ba46.pdf\":\"Organic Soybean Fairtrade - Gebana.pdf\"}'),
(9, '202307-008', 'ถั่วเหลือง (ชาญ บรรณมาศ)', '', '2023-11-09', 60, '2023-07-22 09:26:50', '2023-08-11 13:16:56', 3, 3, 4, 2, 1, 1, 'gUnyjNevFJMU7rZQ3M4XsY', '{\"69008dceb176053607d173bfc58f22f7.pdf\":\"ถั่วเหลือง - ชาญ บรรณมาศ.pdf\"}'),
(10, '202307-009', 'ข้าวสาลี (Blue Point)', '', '2022-02-23', 60, '2023-07-22 09:49:32', '2023-08-11 13:16:44', 3, 3, 7, 2, 2, 3, '8AfVcCcTixDY_ckM4-pro8', '{\"23555e50f9f5a3105fcc7a076b7a0ed8.pdf\":\"ข้าวสาลี - Blue Point.pdf\"}'),
(11, '202307-010', 'ถั่วเหลือง Organic Fairtrade (Pratithi)', '', '2027-02-06', 60, '2023-07-22 10:15:12', '2023-08-11 13:16:19', 3, 3, 4, 2, 1, 1, 'HtKTESkQWykqPDPpG2JkQG', '{\"e053e82e52d86ac3673e40dd65fd173b.pdf\":\"Organic Soybean Fairtrade - Pratithi Organic Foods.pdf\"}'),
(12, '202307-011', 'ข้าวหอมมะลิอินทรีย์ (กฤษณกรณ์ออร์แกนิคฟาร์ม)', '', '2022-12-23', 60, '2023-07-22 10:27:25', '2023-08-11 13:16:03', 3, 3, 4, 2, 1, 3, 'lQm3O5BNqFSA_OhOC6BhFD', '{\"02daa11c12a6811f8626656e1ad50129.pdf\":\"ข้าวหอมมะลิอินทรีย์ - กฤษณกรณ์.pdf\"}'),
(13, '202307-012', 'ถั่วเหลือง Organic (ST.Lawrence Beans)', '', '2019-11-28', 60, '2023-07-22 13:16:01', '2023-08-11 13:15:41', 3, 3, 4, 2, 1, 3, 'hH11yBt30BGkqY3dzmL2b0', '{\"d739cad180f87056c5867f323fdc6a24.pdf\":\"ถั่วเหลือง Organic - ST-Lawrence Beans.pdf\"}'),
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
(27, '202308-002', 'Certificate CERES Organic Standard (CE-OS) EU Equivalent Standard (NFC)', 'CERES Organic Standard (CE-OS) EU Equivalent Standard for third countries และ Product list', '2023-10-31', 60, '2023-08-05 11:53:37', '2023-08-11 16:00:23', 3, 3, 8, 1, 1, 1, 'bAQMxZX7ZtFDq1rCXQ2hkB', '{\"d9bd7413ec8873474cd277bbe4f702b4.pdf\":\"CERES_Produkteliste.pdf\",\"e79f6407f7440e71ea5018346e752fa0.pdf\":\"CERES_Zertifikat_v4.pdf\",\"87c10256024e4630b1923acd25b9f4e5.pdf\":\"2022 Northern Food CERES EU cert ext 306305_2023.08.10#1.pdf\"}'),
(28, '202308-004', 'Certificate Organic Products (Ban Um Sang)', 'Certificate Organic Products and Conformity', '2023-06-02', 60, '2023-08-11 13:30:54', NULL, 3, 3, 8, 2, 1, 3, 'zQqD8uGtD96q8QugEH735q', '{\"71416a4e323c9b3c443fe08fb26a7f1d.pdf\":\"EUI92ICC_BAN UM SANG 2022  exp 02062023.pdf\",\"15d078e3d79fd1da2751b7c413b6c39f.pdf\":\"NPI92ICC_BAN UM SANG 2022-NOP. 29.01.2023.pdf\"}'),
(29, '202308-005', 'Certificate Organic Products (Gebana)', 'Certificate Organic Products and USDA Organic', '2024-03-31', 60, '2023-08-11 13:39:56', NULL, 3, 3, 8, 2, 1, 1, 'bHPiE8pd8q4rNUpMUfZ3-Z', '{\"5e777c489355813a7b7a65db5d1d1acd.pdf\":\"EU + NOPCertificado Cataratas Gebana.ไฟล์รวม.pdf\"}'),
(30, '202308-006', 'Certificate Organic Products (La Du Riz)', 'Certificate Organic Products and Label Organic Products', '2024-03-31', 60, '2023-08-11 13:48:55', NULL, 3, 3, 8, 2, 1, 1, 'Y3SUq5Qlc9DAuuNSD7lDKG', '{\"ac2b823dbd312b536835c40fe9362e85.pdf\":\"CER-OPT59245-C255893 31.04.2024.pdf\"}'),
(31, '202308-007', 'Certificate Organic Products (Natural & Premium Food)', 'Certificate Organic Products and Conformity', '2023-07-17', 60, '2023-08-11 13:54:13', NULL, 3, 3, 8, 2, 1, 3, 'zEExuVaDi6PDnhO-iv2bmc', '{\"6dc94f50e9b2a509e1916063be59372e.pdf\":\"Organic EU regulation Certificate _Natural and premium food Co,Ltd.pdf\",\"b2363ee4a5922208968c17c1dde90180.pdf\":\"Organic NOP USDA regulation Certificate_Natural and premium food Co,Ltd.pdf\"}'),
(32, '202308-008', 'Certificate Organic Products (North Organic Thai)', 'Certificate Organic Product, USDA Organic and Product List', '2023-08-31', 60, '2023-08-11 14:07:26', NULL, 3, 3, 8, 2, 1, 1, '57h4SL1KKUyLFfG8a-LRqi', '{\"339a03eea466ce108fe99b25b3397fc9.pdf\":\"cer   organc  eu  nop.pdf\",\"d5f10e286c09a49472dd974a74c43283.pdf\":\"list  CERES_Produkteliste_v1.pdf\"}'),
(33, '202308-009', 'Certificate Organic Products (Credence)', 'Certificate Organic Products and Conformity', '2024-02-15', 60, '2023-08-11 14:12:27', NULL, 3, 3, 8, 2, 1, 1, 'jwhW3v6hl30IFScc9qTaAz', '{\"5ae9530b028c15bdc8d6a9bbe2b370c6.pdf\":\"EUI95VCC.2023-2024.pdf\",\"36405e31b86ff63818b91f1deea8f099.pdf\":\"NPI95VCC.pdf\"}'),
(34, '202308-010', 'Certificate Organic Products (Pratithi)', 'Certificate Organic Products', '2024-02-06', 60, '2023-08-11 14:17:35', NULL, 3, 3, 8, 2, 1, 1, 'QFmU1esNFfEf_vO9RS9QyL', '{\"ba4ae798e7b3d83f9680b6aa15f7450f.pdf\":\"13279123 PRATITHI ORGANIC FOODS PRIVATE LIMITED ....pdf\"}'),
(35, '202308-011', 'Certificate Organic Products (Southeast Asia)', 'Certificate Organic Products and Conformity', '2023-04-06', 60, '2023-08-11 14:23:55', NULL, 3, 3, 8, 2, 1, 3, 'vZ7L35HsUsd6Oz_bmk7bKV', '{\"03878eeb861f5a4ddb6eab65138e5aeb.pdf\":\"annex EU2022 SEA Exp.06.04.2023 (1).pdf\",\"e2775c14c117c6ba0ccd5cbb169ef26b.pdf\":\"EU2022 SEA Exp.06.04.2023 (1).pdf\",\"bbd2adab8dd7477989c353338b001f96.pdf\":\"NOP certificate (1).pdf\",\"c876bd4a3dc686afaad584a04c97659c.pdf\":\"NPA16PCC (1) (1).pdf\"}'),
(36, '202308-012', 'Certificate Organic Products (Ubon Sunflower)', 'Certificate EU, NOP, JAS, GMP, HACCP, Halal, ISO9001:2015, Kosher, Test Report, FSMA, BRC', '2023-03-31', 60, '2023-08-11 16:14:07', '2023-08-11 16:14:25', 3, 3, 8, 2, 1, 3, 'l7jA2ITvJpx6K7rpHAdHQV', '{\"d68f6734e925b8d23ad7048e7936b726.pdf\":\"CU 842683EU-01.2022 Ubon Sunflower Company.pdf\",\"75c954515babe944566463a4683f424f.pdf\":\"CU 842683JAS-01.2022 Ubon Sunflower Company.pdf\",\"bbbbfb437a85d9162247fab1fff9ae71.pdf\":\"CU 842683NOP-01.2022 Ubon Sunflower Company_Exp 16-JAN-2023.pdf\",\"87b9290a3828b5e6f34aa291469743ec.pdf\":\"GMP- Ubon Sunflower Co., Ltd.pdf\",\"c79e93ea11744e798dc52694ae7cc362.pdf\":\"HACCP-Ubon Sunflower Co., Ltd.pdf\",\"2e32ce711fc33fd012a5c7ae367cdaee.pdf\":\"HALAL C350-2555 ENG UBONSUNFLOWER EXP. 28-11-22.pdf\",\"13d041474219602006840ce5f2aec105.pdf\":\"ISO 9001-2015-Ubon Sunflower Co., Ltd.pdf\",\"cc76b601f20c3d8d38e3f27c4d56b3fb.pdf\":\"KOSHER Cert. UBS Exp 31Jan2023.pdf\",\"f6832083b8c5017e424d4132c83f3b27.pdf\":\"Test report yearly_Oganic cassava flour 2022.pdf\",\"79eef8e53099e73eee57ae629b777390.pdf\":\"UBS_BRC_Exp Nov 5 2022.pdf\",\"7daa8800b9f43f1fb81587531ae1b5e2.pdf\":\"UBS_FSMA_Exp Nov 5 2022.pdf\"}'),
(37, '202308-013', 'Certificate Fair Trade (Raitong Organic Farm)', '', '2024-12-14', 60, '2023-08-11 16:26:13', NULL, 3, 3, 8, 2, 3, 1, 'awVPoLvyh7gaW0ZhYoDcn1', '{\"7be7be52786e487540516f080398d9ea.pdf\":\"2022-2024 FTUSA Trader Certificate (1).pdf\"}'),
(38, '202308-014', 'Certificate Organic Products (Raitong Organic Farm)', 'Certificate Organic และ หนังสือรับรอง', '2023-06-30', 60, '2023-08-11 16:28:07', NULL, 3, 3, 8, 2, 1, 3, '-o66-AoiD_1NmDw_3JReTY', '{\"9ea2deb8dafcb281b920d3484495f333.pdf\":\"Business Registration Certificate (1).pdf\",\"84668487622800b616e96a74f7423cb4.pdf\":\"Organic Certificate 2022 -Raitong Organics Farm EXP 300623.pdf\",\"3b2dc0f16fe1baa96976aa647d7c6969.pdf\":\"ใบ cer  Organic ไร่ทองEXP 30 SEP 2022.pdf\"}');

-- --------------------------------------------------------

--
-- Table structure for table `fa`
--

CREATE TABLE `fa` (
  `id` int(11) NOT NULL,
  `coming_date` date DEFAULT NULL COMMENT 'วันที่ได้มา',
  `category` int(11) DEFAULT NULL COMMENT 'ประเภท',
  `name` varchar(255) DEFAULT NULL COMMENT 'ชื่อ',
  `description` text COMMENT 'รายละเอียด',
  `asset_code` varchar(45) DEFAULT NULL COMMENT 'รหัสทรัพย์สิน',
  `cover` text COMMENT 'ภาพหน้าปก',
  `images` text COMMENT 'รูปภาพ',
  `location` int(11) DEFAULT NULL COMMENT 'สถานที่',
  `department` int(11) DEFAULT NULL COMMENT 'หน่วยงาน',
  `owner` int(11) DEFAULT NULL COMMENT 'ผู้ครอบครอง',
  `qty` int(11) DEFAULT NULL COMMENT 'จำนวน',
  `unit` varchar(45) DEFAULT NULL COMMENT 'หน่วย',
  `cost` decimal(10,2) DEFAULT NULL COMMENT 'ราคาทุน',
  `status` varchar(45) DEFAULT NULL,
  `depreciation` decimal(10,2) DEFAULT NULL COMMENT 'ค่าเสื่อมคงเหลือ',
  `created_at` date DEFAULT NULL COMMENT 'สร้างเมื่อ',
  `updated_at` date DEFAULT NULL COMMENT 'ปรับปรุงเมื่อ',
  `created_by` int(11) DEFAULT NULL COMMENT 'สร้างโดย',
  `updated_by` int(11) DEFAULT NULL COMMENT 'ปรับปรุงโดย'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa`
--

INSERT INTO `fa` (`id`, `coming_date`, `category`, `name`, `description`, `asset_code`, `cover`, `images`, `location`, `department`, `owner`, `qty`, `unit`, `cost`, `status`, `depreciation`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '2023-08-15', 4, 'จอคอมพิวเตอร์', '', 'F-66-IT-B1-002', 'cover/F-66-AC-IT-001.jpg', '', 1, 10, 3, NULL, '', NULL, '1', NULL, '2023-08-14', '2023-08-15', 1, 1),
(2, '2023-08-14', 2, 'เครื่องเจียร์มือ มากีต้า รุ่น 9556HP 4\"', '', 'E-66-EN-EN-001', 'cover/B-66-PN-IT-004.jpg', '', 22, 2, 2, NULL, '', NULL, '2', NULL, '2023-08-14', '2023-08-15', 1, 1),
(3, '2023-08-14', 3, 'ปากกาจับชิ้นงาน ขนาด 8 นิ้ว ปากกว้าง 235 มม. รุ่น T8(Mechanics\'Vice)', '', 'M-66-PN-B1-001', NULL, '', 1, 5, 2, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(4, '2023-08-14', 3, 'ปากกาจับชิ้นงาน ขนาด 8 นิ้ว ปากกว้าง 235 มม. รุ่น T8(Mechanics\'Vice)', '', 'M-66-PN-B1-002', NULL, '', 1, 5, 2, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(5, '2023-08-14', 1, 'เครื่องปิดฝาเบ่ง 2\" ( ใช้กับเครื่องปิดฝาปี๊ป)', '', 'B-66-PN-B1-002', 'cover/B-66-PN-IT-002.jpg', '', 1, 5, 2, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(6, '2023-08-14', 4, 'เครื่องโม่ถั่วเหลือง 8\"', '', 'F-66-IT-B1-001', NULL, '', 1, 10, 2, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(7, '2023-08-16', 2, 'มอเตอร์มิตชู 1HP2สายSC-KR เครื่องโม่ถั่วเหลือง 8\"', '', 'E-66-PN-B1-001', NULL, '', 1, 5, 3, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(8, '2023-08-15', 5, 'ปั๊มแช่ MITSU CSP-1505T2HP380V 3\"ดูดโคลนบ่อบำบัดน้ำเสีย', '', 'V-66-PN-B1-001', NULL, '', 1, 5, 4, NULL, '', NULL, '4', NULL, '2023-08-14', '2023-08-15', 1, 1),
(9, '2023-08-16', 2, 'CHAIN SLING 100 \"KITO\"', '', 'E-66-PN-B1-002', NULL, '', 1, 5, 4, NULL, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1),
(10, '2020-08-14', 2, 'หินโม่ถั่วเหลือง 8\"', '', 'E-63-PU-B1-001', NULL, '', 1, 4, 2, NULL, '', NULL, '1', NULL, '2023-08-14', '2023-08-15', 1, 1),
(11, '2020-08-08', 3, 'โครงสร้างเครื่องเติมอากาศผิวน้ำ', '', 'M-63-EN-WS-001', NULL, '', 27, 2, 3, 1, '', NULL, '3', NULL, '2023-08-14', '2023-08-15', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fa_category`
--

CREATE TABLE `fa_category` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa_category`
--

INSERT INTO `fa_category` (`id`, `code`, `name`, `color`) VALUES
(1, 'B', 'อาคาร', '#0000ff'),
(2, 'E', 'ระบบไฟฟ้า', '#ff00ff'),
(3, 'M', 'เครื่องจักร', '#ff9900'),
(4, 'F', 'เครื่องใช้สำนักงาน', '#DF2E38'),
(5, 'V', 'ยานพาหนะ', '#9900ff');

-- --------------------------------------------------------

--
-- Table structure for table `fa_department`
--

CREATE TABLE `fa_department` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa_department`
--

INSERT INTO `fa_department` (`id`, `code`, `name`, `color`) VALUES
(1, 'AC', 'แผนกบัญชี (Account )', '#274e13'),
(2, 'EN', 'แผนกวิศวกรรม (Engineer)', '#9900ff'),
(3, 'HR', 'แผนกบุคคล (Human Resources)', '#f6b26b'),
(4, 'PU', 'แผนกจัดซื้อ (Purchasing)', '#ff00ff'),
(5, 'PN', 'ฝ่ายวางแผนและควบคุมการผลิต (Planning)', '#674ea7'),
(6, 'PD', 'ฝ่ายผลิต (Production)', '#4a86e8'),
(7, 'QC', 'แผนกควบคุมคุณภาพ (Quality Control)', '#ff9900'),
(8, 'RD', 'แผนกวิจัยและพัฒนาผลิตภัณฑ์ (R&D)', '#ff0000'),
(9, 'WH', 'แผนกคลังสินค้า (Ware House)', '#980000'),
(10, 'IT', 'แผนกไอที (IT)', '#8e7cc3'),
(11, 'GM', 'ผู้จัดการทั่วไป (General Manager)', '#93c47d'),
(12, 'XX', 'ยังไม่กำหนด (Temp)', '#434343');

-- --------------------------------------------------------

--
-- Table structure for table `fa_location`
--

CREATE TABLE `fa_location` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa_location`
--

INSERT INTO `fa_location` (`id`, `code`, `name`, `color`) VALUES
(1, 'B1', 'อาคารสำนักงาน (Office)', '#1C6758'),
(2, 'QC', 'ห้องควบคุมคุณภาพ (Quality Control)', '#1C6758'),
(3, 'PU', 'ห้องจัดซื้อ (Purchasing )', '#1C6758'),
(4, 'HR', 'ห้องบุคคล (Human Resources)', '#1C6758'),
(5, 'PD', 'ห้องผลิต (Production)', '#1C6758'),
(6, 'IT', 'ห้องคอมพิวเตอร์ (Information Technology)', '#1C6758'),
(7, 'WH', 'คลังเก็บสินค้า (Warehouse)', '#1C6758'),
(8, 'RE', 'ห้องน้ำ (Restroom)', '#1C6758'),
(9, 'BF', 'ห้องนมแม่ (Breast Feeding Room)', '#1C6758'),
(10, 'KC', 'ห้องครัว (Kitchen )', '#1C6758'),
(11, 'MT', 'ห้องประชุม (Meeting)', '#1C6758'),
(12, 'AC', 'ห้องบัญชี (Accounting)', '#1C6758'),
(13, 'CT', 'ห้องรับประทานอาหาร (Canteen)', '#1C6758'),
(14, 'GM', 'ห้องผู้จัดการทั่วไป (General Manager)', '#1C6758'),
(15, '2K', 'อาคารB2 (Koji)', '#EC7272'),
(16, '3M', 'อาคารB3 (Moromi)', '#F7A76C'),
(17, '4P', 'อาคารB4 ส่วนคั้น (Pressing)', '#2B7A0B'),
(18, '4F', 'อาคารB4 ส่วนกรอง (Filter)', '#2B7A0B'),
(19, '4G', 'อาคารB4 ส่วนบรรจุ (Packing)', '#2B7A0B'),
(20, '5V', 'อาคารB5 ส่วนน้ำส้ม (Rice Vinegar)', '#876445'),
(21, '5R', 'อาคารB5 ส่วนล้างวัตถุดิบ (Raw Material)', '#876445'),
(22, 'EN', 'อาคารวิศวกรรม (Engineering)', '#FF9F29'),
(23, 'BO', 'อาคารบอยเลอร์ (Boiler)', '#FF9F29'),
(24, 'RD', 'ห้องวิจัยและพัฒนา (Research & Development )', '#1C6758'),
(25, 'GU', 'ป้อมยาม (Guardhouse)', '#990000'),
(26, 'GB', 'โรงเก็บขยะ (Garbage Shed)', '#990000'),
(27, 'WS', 'บ่อบำบัดน้ำเสีย (Wastewater Stabilization Pon', '#990000');

-- --------------------------------------------------------

--
-- Table structure for table `fa_status`
--

CREATE TABLE `fa_status` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fa_status`
--

INSERT INTO `fa_status` (`id`, `code`, `name`, `color`) VALUES
(1, 'Assets', 'สินทรัพย์', '#557A46'),
(2, 'broken', 'ชำรุด', '#DF2E38'),
(3, 'Not found', 'ไม่พบสินทรัพย์', '#E86A33'),
(4, 'Sold', 'ขาย', '#483838');

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
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `upload_id` int(11) NOT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `file_name` varchar(150) DEFAULT NULL COMMENT 'ชื่อไฟล์',
  `real_filename` varchar(150) DEFAULT NULL COMMENT 'ชื่อไฟล์จริง',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT NULL COMMENT 'ประเภท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(2, 'demo', 'ทดสอบระบบ', 'lJsMEFiO-XjqJrVhH2aDcjXyrP0oC0vy', '$2y$13$9cR6h5aFzqkDiaIYP4DQYuywLj.cgAyUBuIexfQNZCqaJQ.T/Zxfi', NULL, 'demo@demo.com', 10, 1689756005, 1691656266, 'sfLH5psKTa0wMf7dH-kiSrkNcSPqn9OD_1689756005', 1),
(3, 'onanong', 'อรอนงค์ ชมภู', '2bj5VmZ1PEwJDerqRsj3fhE8i2zvsVZq', '$2y$13$08zXpjOdJu83tT84JNqebe3SMFVctXSfynLDfss3sFMiveC7tPEUS', NULL, 'onanong@nfc.com', 10, 1689759317, 1689759317, '9NqfkSJcx8KkIodMLNCeH9HLqhOUmcxw_1689759317', 10),
(4, 'supanna', 'สุพรรณา พันธ์ภู่', 'yJwBMulOJv3IDmDkCXrdYZ-VMEw_zwLZ', '$2y$13$O4m3JByeXwarBQx8Na5aXuqT8v0WqaRJakqletAVt/p8XffgPvcau', NULL, 'supanna@nfc.com', 10, 1689759339, 1689759339, '4Zgy1uVGJvXg2nZOAHcFCSj0NK0Ll3Ze_1689759339', 9),
(5, 'prakaiwan', 'ประกายวรรณ เทพมณี', 'y2RYhV3E1NG68CUaa8svzBknRdbCTO79', '$2y$13$GkUZhR.dM5CJdm9MCnTYp.Ij9eya2sBVX.9CaRP/nlJq92WAQ7y02', NULL, 'prakaiwan@nfc.com', 10, 1689759362, 1689759362, '2qNZk71gb01_K-bdCiscD38z36G9exZH_1689759362', 9),
(6, 'sale', 'ฝ่ายขาย', 'EHSvx6uElywR8fG2XRQ_xKE4sups-8cO', '$2y$13$0UZFJxx7tUAPdy972cvXEejPhldI17L0Ld7C3KnSKUk7KTLYVUP0y', NULL, 'sale@nfc.com', 10, 1689759388, 1691648993, '9ZnxmSRzPpvLgxD0MPSamdokpcp_eMul_1689759388', 8),
(7, 'planning', 'ฝ่ายวางแผน', 'JWT4BgIkYF4TIN62mLaKv5iL0uLMn7C9', '$2y$13$g08zQ7xjXISzs99kS2yApuOCRcV6QpMOfdzNAwYY8fP9N96pEuAye', NULL, 'planning@nfc.com', 9, 1689759413, 1691634989, '7xCjBXE9xNLx1gWqKX2LaVex2ah0IWt4_1689759413', 1),
(8, 'production', 'ฝ่ายผลิต', 'FjE8vrSWJ1uVTanpvQJDnpq_OiUySrzg', '$2y$13$Oa3U4rEqDwN8W0ytkDHCjuPw8CW4d44l9tEWbi3N3myBogr4mmzBy', NULL, 'production@nfc.com', 9, 1689759430, 1689759430, 'qNJ-e9RkWlfqvHqmvmSsItU1rlpb_D3j_1689759430', 1),
(9, 'user', 'ผู้ใช้งาน', 'XEPSPmb7Bt0oI_tklPUc5Uh4Jq4HM4Ig', '$2y$13$Cnpq/RL3WMS2iCp5aceVpOtAEuq.LIilfbVNr4uJiBDNwswJhKkuq', NULL, 'user@local.com', 9, 1690430330, 1691646338, 't1iesBNA9TNHWotQHvGzbLCVhrK6LF9O_1690430330', 1),
(10, 'somsak', 'สมศักดิ์ ชาญเกียรติก้อง', '3tiUcswenYgRTZTfuvfv_Tv4V7BXwAcn', '$2y$13$RaVMZpvieW5IfdwpInG4JejNTn8rb7rTCluwPUDO6R8kAJBj1l7D.', NULL, 'somsak@northernfoodcomplex.com', 10, 1691631165, 1691656212, 'Pj5G3y6R8VeykAb0cyXVIHChtnlpquo9_1691631165', 5),
(11, 'peeranai', 'พีรนัย โสทรทวีพงศ์', 'G3b3XCgv3uFzzly7jDX0cJXzNm45qoUV', '$2y$13$5gM/232mFQdlLwbqiQOdE.n2zbN3cLuDGdhIsTK0USk.ASVILRPZy', NULL, 'peeranai@northernfoodcomplex.com', 10, 1691631423, 1691656203, 'HmjAFfcWByo3VbwpZDD9qeBA-shqds8q_1691631423', 5),
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
-- Indexes for table `fa`
--
ALTER TABLE `fa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `asset_code_UNIQUE` (`asset_code`);

--
-- Indexes for table `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `fa_department`
--
ALTER TABLE `fa_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `fa_location`
--
ALTER TABLE `fa_location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `fa_status`
--
ALTER TABLE `fa_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

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
-- Indexes for table `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`upload_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `fa`
--
ALTER TABLE `fa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fa_department`
--
ALTER TABLE `fa_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `fa_location`
--
ALTER TABLE `fa_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `fa_status`
--
ALTER TABLE `fa_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `uploads`
--
ALTER TABLE `uploads`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
