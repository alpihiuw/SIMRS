-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2026 at 08:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id` int(11) NOT NULL,
  `pasien_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `poli` varchar(50) NOT NULL,
  `metode` varchar(40) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `waktu_admisi` decimal(6,1) DEFAULT NULL,
  `durasi_layanan` decimal(6,1) DEFAULT NULL,
  `no_antrean` varchar(10) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Menunggu',
  `jam_daftar` datetime DEFAULT NULL,
  `jam_dipanggil` datetime DEFAULT NULL,
  `jam_mulai` datetime DEFAULT NULL,
  `jam_selesai` datetime DEFAULT NULL,
  `petugas_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id`, `pasien_id`, `tanggal`, `poli`, `metode`, `diagnosis`, `waktu_admisi`, `durasi_layanan`, `no_antrean`, `status`, `jam_daftar`, `jam_dipanggil`, `jam_mulai`, `jam_selesai`, `petugas_id`) VALUES
(1, 1, '2026-11-15', 'Penyakit Dalam', 'Mobile App', 'I10 - Hipertensi', 4.0, 45.0, 'A-001', 'Selesai', '2026-11-15 08:06:00', '2026-11-15 08:10:00', '2026-11-15 08:12:00', '2026-11-15 08:57:00', NULL),
(2, 2, '2026-11-15', 'Anak', 'Loket Konvensional', 'J00 - Nasofaringitis Akut', 20.0, 35.0, 'A-002', 'Selesai', '2026-11-15 08:12:00', '2026-11-15 08:32:00', '2026-11-15 08:34:00', '2026-11-15 09:09:00', NULL),
(3, 3, '2026-11-15', 'Jantung', 'APM / Kiosk Mandiri', 'I20 - Angina Pektoris', 5.0, 60.0, 'A-003', 'Selesai', '2026-11-15 08:18:00', '2026-11-15 08:23:00', '2026-11-15 08:25:00', '2026-11-15 09:25:00', NULL),
(4, 4, '2026-11-15', 'Mata', 'Mobile App', 'H10 - Konjungtivitis', 3.0, 30.0, 'A-004', 'Selesai', '2026-11-15 08:24:00', '2026-11-15 08:27:00', '2026-11-15 08:29:00', '2026-11-15 08:59:00', NULL),
(5, 5, '2026-11-15', 'Saraf', 'Loket Konvensional', 'G40 - Epilepsi', 22.0, 55.0, 'A-005', 'Selesai', '2026-11-15 08:30:00', '2026-11-15 08:52:00', '2026-11-15 08:54:00', '2026-11-15 09:49:00', NULL),
(6, 6, '2026-11-15', 'Bedah', 'APM / Kiosk Mandiri', 'K80 - Kolelitiasis', 4.0, 65.0, 'A-006', 'Selesai', '2026-11-15 08:36:00', '2026-11-15 08:40:00', '2026-11-15 08:42:00', '2026-11-15 09:47:00', NULL),
(7, 7, '2026-11-15', 'THT', 'Mobile App', 'H65 - Otitis Media', 3.0, 40.0, 'A-007', 'Selesai', '2026-11-15 08:42:00', '2026-11-15 08:45:00', '2026-11-15 08:47:00', '2026-11-15 09:27:00', NULL),
(8, 8, '2026-11-15', 'Penyakit Dalam', 'Loket Konvensional', 'E11 - Diabetes Melitus', 24.0, 50.0, 'A-008', 'Selesai', '2026-11-15 08:48:00', '2026-11-15 09:12:00', '2026-11-15 09:14:00', '2026-11-15 10:04:00', NULL),
(9, 9, '2026-11-15', 'Gigi', 'Mobile App', 'K02 - Karies Gigi', 5.0, 35.0, 'A-009', 'Selesai', '2026-11-15 08:54:00', '2026-11-15 08:59:00', '2026-11-15 09:01:00', '2026-11-15 09:36:00', NULL),
(10, 10, '2026-11-15', 'Umum', 'APM / Kiosk Mandiri', 'J06 - ISPA', 4.0, 30.0, 'A-010', 'Selesai', '2026-11-15 09:00:00', '2026-11-15 09:04:00', '2026-11-15 09:06:00', '2026-11-15 09:36:00', NULL),
(11, 11, '2026-11-15', 'Jantung', 'Loket Konvensional', 'I25 - Penyakit Jantung Iskemik', 21.0, 62.0, 'A-011', 'Selesai', '2026-11-15 09:06:00', '2026-11-15 09:27:00', '2026-11-15 09:29:00', '2026-11-15 10:31:00', NULL),
(12, 12, '2026-11-15', 'Kulit', 'Mobile App', 'L20 - Dermatitis Atopik', 4.0, 32.0, 'A-012', 'Selesai', '2026-11-15 09:12:00', '2026-11-15 09:16:00', '2026-11-15 09:18:00', '2026-11-15 09:50:00', NULL),
(13, 13, '2026-11-15', 'Penyakit Dalam', 'APM / Kiosk Mandiri', 'I10 - Hipertensi', 5.0, 42.0, 'A-013', 'Selesai', '2026-11-15 09:18:00', '2026-11-15 09:23:00', '2026-11-15 09:25:00', '2026-11-15 10:07:00', NULL),
(14, 14, '2026-11-15', 'Mata', 'Loket Konvensional', 'H25 - Katarak', 19.0, 48.0, 'A-014', 'Selesai', '2026-11-15 09:24:00', '2026-11-15 09:43:00', '2026-11-15 09:45:00', '2026-11-15 10:33:00', NULL),
(15, 15, '2026-11-15', 'Gigi', 'Mobile App', 'K04 - Pulpitis', 3.0, 38.0, 'A-015', 'Selesai', '2026-11-15 09:30:00', '2026-11-15 09:33:00', '2026-11-15 09:35:00', '2026-11-15 10:13:00', NULL),
(16, 16, '2026-11-15', 'THT', 'APM / Kiosk Mandiri', 'J30 - Rinitis Alergi', 4.0, 28.0, 'A-016', 'Selesai', '2026-11-15 09:36:00', '2026-11-15 09:40:00', '2026-11-15 09:42:00', '2026-11-15 10:10:00', NULL),
(17, 17, '2026-11-15', 'Umum', 'Mobile App', 'K29 - Gastritis', 5.0, 33.0, 'A-017', 'Selesai', '2026-11-15 09:42:00', '2026-11-15 09:47:00', '2026-11-15 09:49:00', '2026-11-15 10:22:00', NULL),
(18, 18, '2026-11-15', 'Saraf', 'Loket Konvensional', 'G43 - Migrain', 23.0, 45.0, 'A-018', 'Selesai', '2026-11-15 09:48:00', '2026-11-15 10:11:00', '2026-11-15 10:13:00', '2026-11-15 10:58:00', NULL),
(19, 19, '2026-11-15', 'Kulit', 'APM / Kiosk Mandiri', 'L30 - Dermatitis', 3.0, 30.0, 'A-019', 'Selesai', '2026-11-15 09:54:00', '2026-11-15 09:57:00', '2026-11-15 09:59:00', '2026-11-15 10:29:00', NULL),
(20, 20, '2026-11-15', 'Jantung', 'Mobile App', 'I50 - Gagal Jantung', 6.0, 70.0, 'A-020', 'Selesai', '2026-11-15 10:00:00', '2026-11-15 10:06:00', '2026-11-15 10:08:00', '2026-11-15 11:18:00', NULL),
(21, 21, '2026-11-15', 'Penyakit Dalam', 'Loket Konvensional', 'E78 - Dislipidemia', 25.0, 48.0, 'A-021', 'Selesai', '2026-11-15 10:06:00', '2026-11-15 10:31:00', '2026-11-15 10:33:00', '2026-11-15 11:21:00', NULL),
(22, 22, '2026-11-15', 'Bedah', 'Mobile App', 'K64 - Hemoroid', 4.0, 66.0, 'A-022', 'Selesai', '2026-11-15 10:12:00', '2026-11-15 10:16:00', '2026-11-15 10:18:00', '2026-11-15 11:24:00', NULL),
(23, 23, '2026-11-15', 'Mata', 'APM / Kiosk Mandiri', 'H52 - Gangguan Refraksi', 5.0, 25.0, 'A-023', 'Selesai', '2026-11-15 10:18:00', '2026-11-15 10:23:00', '2026-11-15 10:25:00', '2026-11-15 10:50:00', NULL),
(24, 24, '2026-11-15', 'THT', 'Loket Konvensional', 'J32 - Sinusitis Kronis', 20.0, 40.0, 'A-024', 'Selesai', '2026-11-15 10:24:00', '2026-11-15 10:44:00', '2026-11-15 10:46:00', '2026-11-15 11:26:00', NULL),
(25, 25, '2026-11-15', 'Gigi', 'Mobile App', 'K05 - Gingivitis', 3.0, 34.0, 'A-025', 'Selesai', '2026-11-15 10:30:00', '2026-11-15 10:33:00', '2026-11-15 10:35:00', '2026-11-15 11:09:00', NULL),
(26, 26, '2026-11-15', 'Umum', 'APM / Kiosk Mandiri', 'K29 - Gastritis', 4.0, 38.0, 'A-026', 'Selesai', '2026-11-15 10:36:00', '2026-11-15 10:40:00', '2026-11-15 10:42:00', '2026-11-15 11:20:00', NULL),
(27, 27, '2026-11-15', 'Anak', 'Mobile App', 'J20 - Bronkitis Akut', 5.0, 36.0, 'A-027', 'Selesai', '2026-11-15 10:42:00', '2026-11-15 10:47:00', '2026-11-15 10:49:00', '2026-11-15 11:25:00', NULL),
(28, 28, '2026-11-15', 'Kulit', 'Loket Konvensional', 'B35 - Tinea', 18.0, 30.0, 'A-028', 'Selesai', '2026-11-15 10:48:00', '2026-11-15 11:06:00', '2026-11-15 11:08:00', '2026-11-15 11:38:00', NULL),
(29, 29, '2026-11-15', 'Saraf', 'APM / Kiosk Mandiri', 'G44 - Sakit Kepala Tegang', 4.0, 42.0, 'A-029', 'Selesai', '2026-11-15 10:54:00', '2026-11-15 10:58:00', '2026-11-15 11:00:00', '2026-11-15 11:42:00', NULL),
(30, 30, '2026-11-15', 'Bedah', 'Mobile App', 'K40 - Hernia Inguinalis', 3.0, 58.0, 'A-030', 'Selesai', '2026-11-15 11:00:00', '2026-11-15 11:03:00', '2026-11-15 11:05:00', '2026-11-15 12:03:00', NULL),
(31, 31, '2026-11-15', 'Kulit', 'Mobile App', 'Tinea', 4.0, 44.0, 'A-031', 'Selesai', '2026-11-15 11:06:00', '2026-11-15 11:10:00', '2026-11-15 11:12:00', '2026-11-15 11:56:00', NULL),
(32, 32, '2026-11-15', 'Gigi', 'Mobile App', 'K02-Karies gigi', NULL, 0.1, 'A-032', 'Selesai', NULL, '2026-11-15 20:04:28', '2026-11-15 20:04:33', '2026-11-15 20:04:40', NULL),
(33, 1, '2026-11-15', 'Penyakit Dalam', 'Mobile App', 'I10 - Hipertensi', NULL, 0.1, 'A-033', 'Selesai', NULL, '2026-11-15 20:04:36', '2026-11-15 20:04:41', '2026-11-15 20:04:45', NULL),
(34, 33, '2026-11-15', 'Gigi', 'Mobile App', 'K02-Karies gigi', 0.7, 0.1, 'A-034', 'Selesai', '2026-11-15 20:10:20', '2026-11-15 20:11:00', '2026-11-15 20:11:10', '2026-11-15 20:11:13', NULL),
(36, 2, '2026-11-16', 'Anak', 'Mobile App', 'J06 - ISPA: batuk pilek', 1.8, 1.5, 'A-002', 'Selesai', '2026-11-16 00:39:41', '2026-11-16 00:41:31', '2026-11-16 00:42:13', '2026-11-16 00:43:42', 1),
(37, 35, '2026-11-16', 'Anak', 'APM / Kiosk Mandiri', 'K02-Karies gigi', 1.7, 0.2, 'A-003', 'Selesai', '2026-11-16 10:51:07', '2026-11-16 10:52:47', '2026-11-16 10:52:55', '2026-11-16 10:53:05', 2),
(38, 5, '2026-11-16', 'Saraf', 'Mobile App', 'G40 - Epilepsi', 1.1, 0.1, 'A-004', 'Selesai', '2026-11-16 10:51:56', '2026-11-16 10:53:01', '2026-11-16 10:53:07', '2026-11-16 10:53:11', 2),
(39, 36, '2026-11-16', 'Umum', 'Mobile App', 'I10 - Hipertensi', NULL, NULL, 'A-004', 'Menunggu', '2026-11-16 11:00:48', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `no_rm` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` char(1) NOT NULL,
  `umur` int(11) NOT NULL,
  `penjamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `no_rm`, `nama`, `jk`, `umur`, `penjamin`) VALUES
(1, 'RM-2026-001', 'Johan Santoso', 'L', 45, 'Umum'),
(2, 'RM-2026-002', 'Yosua Hendrawan', 'L', 10, 'Umum'),
(3, 'RM-2026-003', 'Hosea Kusuma', 'L', 55, 'BPJS'),
(4, 'RM-2026-004', 'Wendi Junaidi', 'L', 28, 'Umum'),
(5, 'RM-2026-005', 'Wawan Prasetyo', 'L', 60, 'Umum'),
(6, 'RM-2026-006', 'Vernando Hasibuan', 'L', 35, 'Umum'),
(7, 'RM-2026-007', 'Asih Hamidah', 'P', 42, 'BPJS'),
(8, 'RM-2026-008', 'Jihan Pardede', 'P', 50, 'BPJS'),
(9, 'RM-2026-009', 'Hendro Sukamto', 'L', 33, 'Umum'),
(10, 'RM-2026-010', 'Jaelani Purba', 'L', 38, 'BPJS'),
(11, 'RM-2026-011', 'Junaedi Kurniawan', 'L', 58, 'BPJS'),
(12, 'RM-2026-012', 'Dodi Yunanto', 'L', 29, 'Umum'),
(13, 'RM-2026-013', 'Yosi Anggraini', 'P', 47, 'BPJS'),
(14, 'RM-2026-014', 'Haryanto Wijaya', 'L', 39, 'Umum'),
(15, 'RM-2026-015', 'Jumari Hamzah', 'L', 24, 'BPJS'),
(16, 'RM-2026-016', 'Jaka Hermawan', 'L', 19, 'Umum'),
(17, 'RM-2026-017', 'Mulyadi Jayadi', 'L', 46, 'BPJS'),
(18, 'RM-2026-018', 'Wahyu Hakim', 'L', 52, 'BPJS'),
(19, 'RM-2026-019', 'Hanif Setiawan', 'L', 31, 'Umum'),
(20, 'RM-2026-020', 'Ilham Hanafi', 'L', 64, 'BPJS'),
(21, 'RM-2026-021', 'Sabina Chandra', 'P', 57, 'BPJS'),
(22, 'RM-2026-022', 'Yanuar Junianto', 'L', 36, 'Umum'),
(23, 'RM-2026-023', 'Bima Gunadi', 'L', 22, 'BPJS'),
(24, 'RM-2026-024', 'Hening Kartika', 'P', 41, 'Umum'),
(25, 'RM-2026-025', 'Yongki Jatmiko', 'L', 26, 'BPJS'),
(26, 'RM-2026-026', 'Hani Jiwandari', 'P', 48, 'BPJS'),
(27, 'RM-2026-027', 'Hanzen Pratama', 'L', 12, 'Umum'),
(28, 'RM-2026-028', 'Dohar Simbolon', 'L', 30, 'BPJS'),
(29, 'RM-2026-029', 'Shinta Yuliani', 'P', 44, 'Umum'),
(30, 'RM-2026-030', 'Kurniasih Minarti', 'P', 37, 'BPJS'),
(31, 'RM-2026-031', 'Racha', 'P', 24, 'Umum'),
(32, 'RM-2026-032', 'Junior', 'L', 27, 'BPJS'),
(33, 'RM-2026-033', 'Natalia', 'P', 47, 'Umum'),
(35, 'RM-2026-035', 'Renjin', 'L', 12, 'Umum'),
(36, 'RM-2026-036', 'Nani', 'P', 18, 'BPJS');

-- --------------------------------------------------------

--
-- Table structure for table `pasien_lama`
--

CREATE TABLE `pasien_lama` (
  `id` int(11) NOT NULL,
  `no_rm` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` char(1) NOT NULL,
  `umur` int(11) NOT NULL,
  `penjamin` varchar(20) NOT NULL,
  `poli` varchar(50) NOT NULL,
  `metode` varchar(40) NOT NULL,
  `diagnosis` varchar(100) NOT NULL,
  `waktu_admisi` int(11) NOT NULL,
  `durasi_layanan` int(11) NOT NULL,
  `no_antrean` varchar(10) DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Menunggu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien_lama`
--

INSERT INTO `pasien_lama` (`id`, `no_rm`, `nama`, `jk`, `umur`, `penjamin`, `poli`, `metode`, `diagnosis`, `waktu_admisi`, `durasi_layanan`, `no_antrean`, `status`) VALUES
(1, 'RM-2026-001', 'Johan Santoso', 'L', 45, 'BPJS', 'Penyakit Dalam', 'Mobile App', 'I10 - Hipertensi', 4, 45, 'A-001', 'Selesai'),
(2, 'RM-2026-002', 'Yosua Hendrawan', 'L', 10, 'Umum', 'Anak', 'Loket Konvensional', 'J00 - Nasofaringitis Akut', 20, 35, 'A-002', 'Selesai'),
(3, 'RM-2026-003', 'Hosea Kusuma', 'L', 55, 'BPJS', 'Jantung', 'APM / Kiosk Mandiri', 'I20 - Angina Pektoris', 5, 60, 'A-003', 'Selesai'),
(4, 'RM-2026-004', 'Wendi Junaidi', 'L', 28, 'Umum', 'Mata', 'Mobile App', 'H10 - Konjungtivitis', 3, 30, 'A-004', 'Selesai'),
(5, 'RM-2026-005', 'Wawan Prasetyo', 'L', 60, 'BPJS', 'Saraf', 'Loket Konvensional', 'G40 - Epilepsi', 22, 55, 'A-005', 'Selesai'),
(6, 'RM-2026-006', 'Vernando Hasibuan', 'L', 35, 'Umum', 'Bedah', 'APM / Kiosk Mandiri', 'K80 - Kolelitiasis', 4, 65, 'A-006', 'Selesai'),
(7, 'RM-2026-007', 'Asih Hamidah', 'P', 42, 'BPJS', 'THT', 'Mobile App', 'H65 - Otitis Media', 3, 40, 'A-007', 'Selesai'),
(8, 'RM-2026-008', 'Jihan Pardede', 'P', 50, 'BPJS', 'Penyakit Dalam', 'Loket Konvensional', 'E11 - Diabetes Melitus', 24, 50, 'A-008', 'Selesai'),
(9, 'RM-2026-009', 'Hendro Sukamto', 'L', 33, 'Umum', 'Gigi', 'Mobile App', 'K02 - Karies Gigi', 5, 35, 'A-009', 'Selesai'),
(10, 'RM-2026-010', 'Jaelani Purba', 'L', 38, 'BPJS', 'THT', 'APM / Kiosk Mandiri', 'J06 - ISPA', 4, 30, 'A-010', 'Selesai'),
(11, 'RM-2026-011', 'Junaedi Kurniawan', 'L', 58, 'BPJS', 'Jantung', 'Loket Konvensional', 'I25 - Penyakit Jantung Iskemik', 21, 62, 'A-011', 'Selesai'),
(12, 'RM-2026-012', 'Dodi Yunanto', 'L', 29, 'Umum', 'Kulit', 'Mobile App', 'L20 - Dermatitis Atopik', 4, 32, 'A-012', 'Selesai'),
(13, 'RM-2026-013', 'Yosi Anggraini', 'P', 47, 'BPJS', 'Penyakit Dalam', 'APM / Kiosk Mandiri', 'I10 - Hipertensi', 5, 42, 'A-013', 'Selesai'),
(14, 'RM-2026-014', 'Haryanto Wijaya', 'L', 39, 'Umum', 'Mata', 'Loket Konvensional', 'H25 - Katarak', 19, 48, 'A-014', 'Selesai'),
(15, 'RM-2026-015', 'Jumari Hamzah', 'L', 24, 'BPJS', 'Gigi', 'Mobile App', 'K04 - Pulpitis', 3, 38, 'A-015', 'Selesai'),
(16, 'RM-2026-016', 'Jaka Hermawan', 'L', 19, 'Umum', 'THT', 'APM / Kiosk Mandiri', 'J30 - Rinitis Alergi', 4, 28, 'A-016', 'Selesai'),
(17, 'RM-2026-017', 'Mulyadi Jayadi', 'L', 46, 'BPJS', 'Penyakit Dalam', 'Mobile App', 'K29 - Gastritis', 5, 33, 'A-017', 'Selesai'),
(18, 'RM-2026-018', 'Wahyu Hakim', 'L', 52, 'BPJS', 'Saraf', 'Loket Konvensional', 'G43 - Migrain', 23, 45, 'A-018', 'Selesai'),
(19, 'RM-2026-019', 'Hanif Setiawan', 'L', 31, 'Umum', 'Kulit', 'APM / Kiosk Mandiri', 'L30 - Dermatitis', 3, 30, 'A-019', 'Selesai'),
(20, 'RM-2026-020', 'Ilham Hanafi', 'L', 64, 'BPJS', 'Jantung', 'Mobile App', 'I50 - Gagal Jantung', 6, 70, 'A-020', 'Selesai'),
(21, 'RM-2026-021', 'Sabina Chandra', 'P', 57, 'BPJS', 'Penyakit Dalam', 'Loket Konvensional', 'E78 - Dislipidemia', 25, 48, 'A-021', 'Selesai'),
(22, 'RM-2026-022', 'Yanuar Junianto', 'L', 36, 'Umum', 'Bedah', 'Mobile App', 'K35 - Apendisitis', 4, 66, 'A-022', 'Selesai'),
(23, 'RM-2026-023', 'Bima Gunadi', 'L', 22, 'BPJS', 'Mata', 'APM / Kiosk Mandiri', 'H52 - Gangguan Refraksi', 5, 25, 'A-023', 'Selesai'),
(24, 'RM-2026-024', 'Hening Kartika', 'P', 41, 'Umum', 'THT', 'Loket Konvensional', 'J32 - Sinusitis Kronis', 20, 40, 'A-024', 'Selesai'),
(25, 'RM-2026-025', 'Yongki Jatmiko', 'L', 26, 'BPJS', 'Gigi', 'Mobile App', 'K05 - Gingivitis', 3, 34, 'A-025', 'Selesai'),
(26, 'RM-2026-026', 'Hani Jiwandari', 'P', 48, 'BPJS', 'Penyakit Dalam', 'APM / Kiosk Mandiri', 'K29 - Gastritis', 4, 38, 'A-026', 'Selesai'),
(27, 'RM-2026-027', 'Hanzen Pratama', 'L', 12, 'Umum', 'Anak', 'Mobile App', 'J20 - Bronkitis Akut', 5, 36, 'A-027', 'Selesai'),
(28, 'RM-2026-028', 'Dohar Simbolon', 'L', 30, 'BPJS', 'Kulit', 'Loket Konvensional', 'B35 - Tinea', 18, 30, 'A-028', 'Selesai'),
(29, 'RM-2026-029', 'Shinta Yuliani', 'P', 44, 'Umum', 'Saraf', 'APM / Kiosk Mandiri', 'G44 - Sakit Kepala Tegang', 4, 42, 'A-029', 'Selesai'),
(30, 'RM-2026-030', 'Kurniasih Minarti', 'P', 37, 'BPJS', 'Bedah', 'Mobile App', 'K40 - Hernia Inguinalis', 3, 58, 'A-030', 'Selesai'),
(31, 'RM-2026-031', 'Racha', 'P', 24, 'Umum', 'Kulit', 'Mobile App', 'Tinea', 4, 44, 'A-031', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `username`, `password`, `nama`) VALUES
(1, 'alfi', '$2y$10$lRHP6gEOpnwaAGAABEKxWeKsrO6UC.z11db2nEZ.UBEI9gTefI9gq', 'Alfi'),
(2, 'deden', '$2y$10$qN/JkLY8oHHcK1qrDmzcUehQ0Ivoy4lZYLZXNuzekK6Q1QH4yCG/K', 'Deden'),
(3, 'intan', '$2y$10$V93vKPRYqnQgWqE9e0k/1OKjJmK.h.GbAZRERbcF/r5JNzspu8NDK', 'Intan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pasien_id` (`pasien_id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_rm` (`no_rm`);

--
-- Indexes for table `pasien_lama`
--
ALTER TABLE `pasien_lama`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pasien_lama`
--
ALTER TABLE `pasien_lama`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`pasien_id`) REFERENCES `pasien` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
