-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2018 at 05:45 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.0.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuliah`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Akademik',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `is_active` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `type` bigint(20) NOT NULL DEFAULT '0',
  `level` smallint(6) NOT NULL DEFAULT '0',
  `year` year(4) NOT NULL DEFAULT '0000',
  `organizer` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE `albums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `url`, `target`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'http://sekolahku.web.id', '_blank', '1.png', '2017-11-25 09:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'President University', 'http://president.ac.id', '_blank', '2.png', '2017-11-25 09:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
--

CREATE TABLE `class_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(100) DEFAULT NULL,
  `sub_class` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_group_settings`
--

CREATE TABLE `class_group_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `academic_year_id` bigint(20) NOT NULL DEFAULT '0',
  `class_group_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Kelas',
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_post_id` bigint(20) NOT NULL DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion` bigint(20) NOT NULL DEFAULT '0',
  `marital_status` bigint(20) NOT NULL DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institutions_lifter` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank` bigint(20) DEFAULT '0' COMMENT 'Pangkat / Golongan',
  `salary_source` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `skills_laboratory` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `handle_special_needs` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) NOT NULL DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_categories`
--

CREATE TABLE `file_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `file_categories`
--

INSERT INTO `file_categories` (`id`, `category`, `slug`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', '2017-11-25 09:04:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `image_sliders`
--

CREATE TABLE `image_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '1.png', '2017-11-25 09:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2.png', '2017-11-25 09:04:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `title`, `url`, `target`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'CMS Sekolahku', 'http://sekolahku.web.id', '_blank', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) UNSIGNED NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE `majors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majors`
--

INSERT INTO `majors` (`id`, `major`, `short_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'D3 Manajemen Informatika', 'D3 MI', '2018-02-13 04:13:26', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'false'),
(2, 'D3 Manajeman Akutansi', 'D3 MA', '2018-02-13 04:13:42', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `position` bigint(20) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `parent_id`, `position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Hubungi Kami', 'hubungi-kami', '_self', 'modules', 0, 4, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Gallery Photo', 'gallery-photo', '_self', 'modules', 9, 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Gallery Video', 'gallery-video', '_self', 'modules', 9, 2, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'Formulir PPDB', 'formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'Hasil Seleksi', 'hasil-seleksi-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 2, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'Cetak Formulir', 'cetak-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 3, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'Download Formulir', 'download-formulir-penerimaan-peserta-didik-baru', '_self', 'modules', 8, 4, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'PPDB 2017', '#', '_self', 'links', 0, 2, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'Gallery', '#', '_self', 'links', 0, 3, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'Kategori', '#', '_self', 'links', 0, 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, 'Uncategorized', 'category/uncategorized', '_self', 'post_categories', 10, 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'acl', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'PPDB / PMB', 'PPDB / PMB', 'admission', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'Blog', 'Blog', 'blog', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'GTK / Staff / Dosen', 'GTK / Staff / Dosen', 'employees', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'Media', 'Media', 'media', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'Data Referensi', 'Data Referensi', 'reference', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'Peserta Didik / Mahasiswa', 'Peserta Didik / Mahasiswa', 'students', 'true', '2017-11-25 09:04:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(100) NOT NULL,
  `option` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `group`, `option`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'student_status', 'Lulus', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'student_status', 'Mutasi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'student_status', 'Dikeluarkan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'student_status', 'Putus Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'student_status', 'Meninggal', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(8, 'student_status', 'Hilang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, 'student_status', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, 'employment', 'Tidak bekerja', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, 'employment', 'Nelayan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(12, 'employment', 'Petani', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(13, 'employment', 'Peternak', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(14, 'employment', 'PNS/TNI/POLRI', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(15, 'employment', 'Karyawan Swasta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(16, 'employment', 'Pedagang Kecil', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(17, 'employment', 'Pedagang Besar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(18, 'employment', 'Wiraswasta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(19, 'employment', 'Wirausaha', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(20, 'employment', 'Buruh', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(21, 'employment', 'Pensiunan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(22, 'employment', 'Lain-lain', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(23, 'special_needs', 'Tidak', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(24, 'special_needs', 'Tuna Netra', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(30, 'special_needs', 'Tuna Laras', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(32, 'special_needs', 'Tuna ganda', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(33, 'special_needs', 'Hiper aktif', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(37, 'special_needs', 'Narkoba', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(38, 'special_needs', 'Indigo', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(39, 'special_needs', 'Down Sindrome', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(40, 'special_needs', 'Autis', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(41, 'special_needs', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(42, 'education', 'Tidak sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(43, 'education', 'Putus SD', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(44, 'education', 'SD Sederajat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(45, 'education', 'SMP Sederajat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(46, 'education', 'SMA Sederajat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(47, 'education', 'D1', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(48, 'education', 'D2', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(49, 'education', 'D3', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(50, 'education', 'D4/S1', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(51, 'education', 'S2', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(52, 'education', 'S3', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(53, 'scholarship', 'Anak berprestasi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(54, 'scholarship', 'Anak Miskin', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(55, 'scholarship', 'Pendidikan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(56, 'scholarship', 'Unggulan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(57, 'scholarship', 'Lain-lain', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(58, 'achievement_type', 'Sains', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(59, 'achievement_type', 'Seni', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(60, 'achievement_type', 'Olahraga', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(61, 'achievement_type', 'Lain-lain', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(62, 'achievement_level', 'Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(63, 'achievement_level', 'Kecamatan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(64, 'achievement_level', 'Kabupaten', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(65, 'achievement_level', 'Provinsi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(66, 'achievement_level', 'Nasional', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(67, 'achievement_level', 'Internasional', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(68, 'monthly_income', 'Kurang dari 500,000', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(69, 'monthly_income', '500.000 - 999.9999', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(70, 'monthly_income', '1 Juta - 1.999.999', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(71, 'monthly_income', '2 Juta - 4.999.999', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(72, 'monthly_income', '5 Juta - 20 Juta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(73, 'monthly_income', 'Lebih dari 20 Juta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(74, 'residence', 'Bersama orang tua', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(75, 'residence', 'Wali', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(76, 'residence', 'Kos', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(77, 'residence', 'Asrama', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(78, 'residence', 'Panti Asuhan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(79, 'residence', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(80, 'transportation', 'Jalan kaki', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(81, 'transportation', 'Kendaraan pribadi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(82, 'transportation', 'Kendaraan Umum / angkot / Pete-pete', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(83, 'transportation', 'Jemputan Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(84, 'transportation', 'Kereta Api', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(85, 'transportation', 'Ojek', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(86, 'transportation', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(87, 'transportation', 'Perahu penyebrangan / Rakit / Getek', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(88, 'transportation', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(89, 'religion', 'Islam', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(90, 'religion', 'kristen / protestan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(91, 'religion', 'Katholik', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(92, 'religion', 'Hindu', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(93, 'religion', 'Budha', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(94, 'religion', 'Khong Hu Chu', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(95, 'religion', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(96, 'school_level', '1 - Sekolah Dasar (SD)/ Sederajat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(97, 'school_level', '2 - Sekolah Menengah Pertama (SMP)/ Sederajat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(98, 'school_level', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(99, 'school_level', '4 - Sekolah Menengah Kejuruan (SMK)', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(100, 'school_level', '5 - Perguruan Tinggi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(101, 'marital_status', 'Kawin', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(102, 'marital_status', 'Belum Kawin', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(103, 'marital_status', 'Berpisah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(104, 'institutions_lifter', 'Pemerintah Pusat', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(105, 'institutions_lifter', 'Pemerintah Provinsi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(106, 'institutions_lifter', 'Pemerintah Kab/Kota', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(107, 'institutions_lifter', 'Ketua yaysan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(108, 'institutions_lifter', 'Kepala Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(109, 'institutions_lifter', 'Komite Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(110, 'institutions_lifter', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(111, 'employment_status', 'PNS ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(112, 'employment_status', 'PNS Diperbantukan ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(113, 'employment_status', 'PNS DEPAG ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(114, 'employment_status', 'GTY/PTY ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(115, 'employment_status', 'GTT/PTT Provinsi ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(116, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(117, 'employment_status', 'Guru Bantu Pusat ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(118, 'employment_status', 'Guru Honor Sekolah ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(119, 'employment_status', 'Tenaga Honor Sekolah ', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(120, 'employment_status', 'CPNS', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(121, 'employment_status', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(122, 'employment_type', 'Guru Kelas', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(123, 'employment_type', 'Guru Mata Pelajaran', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(124, 'employment_type', 'Guru BK', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(125, 'employment_type', 'Guru Inklusi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(126, 'employment_type', 'Tenaga Administrasi Sekola', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(127, 'employment_type', 'Gurtu Pendamping', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(128, 'employment_type', 'Guru Magang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(129, 'employment_type', 'Guru TIK', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(130, 'employment_type', 'Laboran', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(131, 'employment_type', 'Pustakawan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(132, 'employment_type', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(133, 'rank', 'I/A', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(134, 'rank', 'I/B', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(135, 'rank', 'I/C', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(136, 'rank', 'I/D', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(137, 'rank', 'II/A', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(138, 'rank', 'II/B', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(139, 'rank', 'II/C', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(140, 'rank', 'II/D', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(141, 'rank', 'III/A', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(142, 'rank', 'III/B', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(143, 'rank', 'III/C', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(144, 'rank', 'III/D', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(145, 'rank', 'IV/A', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(146, 'rank', 'IV/B', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(147, 'rank', 'IV/C', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(148, 'rank', 'IV/D', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(149, 'rank', 'IV/E', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(150, 'salary_source', 'APBN', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(151, 'salary_source', 'APBD Provinsi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(152, 'salary_source', 'APBD Kab/Kota', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(153, 'salary_source', 'Yaysan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(154, 'salary_source', 'Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(155, 'salary_source', 'Lembaga Donor', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(156, 'salary_source', 'Lainnya', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(157, 'skills_laboratory', 'Lab IPA', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(158, 'skills_laboratory', 'Lab Fisika', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(159, 'skills_laboratory', 'Lab Biologi', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(160, 'skills_laboratory', 'Lab Kimia', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(161, 'skills_laboratory', 'Lab Bahasa', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(162, 'skills_laboratory', 'Lab Komputer', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(163, 'skills_laboratory', 'Teknik Bangunan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(164, 'skills_laboratory', 'Teknik Serveai & Pemetaan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(165, 'skills_laboratory', 'Teknik Ketenagakerjaan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(166, 'skills_laboratory', 'Teknik Pendidnginan & Tata Udara', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(167, 'skills_laboratory', 'Teknik Mesin', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo_album_id` bigint(20) NOT NULL DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pollings`
--

CREATE TABLE `pollings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer_id` bigint(20) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'publish',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'open',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'headmaster_photo.png', 0, '', 'welcome', 'publish', 'public', 'open', '', '', 0, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Sample Page', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', NULL, 1, '1', 'page', 'publish', 'public', 'open', 'sample-page', 'berita, pengumuman, sekilas-info', 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Sample Post 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-1', 'berita, pengumuman, sekilas-info', 5, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'Sample Post 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-2', 'berita, pengumuman, sekilas-info', 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'Sample Post 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-3', 'berita, pengumuman, sekilas-info', 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'Sample Post 4', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-4', 'berita, pengumuman, sekilas-info', 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'Sample Post 5', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', 'post_image.png', 1, '1', 'post', 'publish', 'public', 'open', 'sample-post-5', 'berita, pengumuman, sekilas-info', 1, '2017-11-25 09:04:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category`, `slug`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Uncategorized', 'uncategorized', 'Uncategorized', '2017-11-25 09:04:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `registration_phases`
--

CREATE TABLE `registration_phases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000' COMMENT 'Tahun PPDB',
  `phase` varchar(255) NOT NULL COMMENT 'Gelombang / Fase Pendaftaran',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `registration_quotas`
--

CREATE TABLE `registration_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year` year(4) NOT NULL DEFAULT '0000' COMMENT 'Tahun PPDB',
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Kuota yang diterima secara keseluruhan',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
--

CREATE TABLE `scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL DEFAULT '0',
  `type` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  `start_year` year(4) NOT NULL DEFAULT '0000',
  `end_year` year(4) NOT NULL DEFAULT '0000',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(100) NOT NULL,
  `variable` varchar(255) DEFAULT NULL,
  `value` text,
  `default` text,
  `group_access` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `variable`, `value`, `default`, `group_access`, `description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public, student, employee, administrator, super_user', 'Pemeliharaan situs', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Berakhir Pemeliharaan Situs', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public, student, employee, administrator, super_user', 'Cache situs', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public, student, employee, administrator, super_user', 'Lama Cache Situs', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public, student, employee, administrator, super_user', 'Deskripsi Meta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public, student, employee, administrator, super_user', 'Kata Kunci Meta', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(7, 'general', 'google_map_api_key', 'AIzaSyAhEkkwzUJUr_9zb_tsvgMMPPwwbnbznHo', '', 'public, student, employee, administrator, super_user', 'API Key Google Map', '2017-11-25 09:04:46', '2018-02-13 04:14:41', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(8, 'general', 'latitude', '-6.164799', '', 'public, student, employee, administrator, super_user', 'Latitude', '2017-11-25 09:04:46', '2018-02-13 04:14:50', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(9, 'general', 'longitude', '106.603549', '', 'public, student, employee, administrator, super_user', 'Longitude', '2017-11-25 09:04:46', '2018-02-13 04:14:56', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(10, 'general', 'favicon', NULL, 'favicon.png', 'public, student, employee, administrator, super_user', 'Favicon', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, 'general', 'header', NULL, 'header.png', 'public, student, employee, administrator, super_user', 'Gambar Header', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(12, 'general', 'recaptcha_site_key', '6Lc-A0YUAAAAAAoYvBv0m3PyGh-aNKglseMnnDdY', '', 'public', 'Recaptcha Site Key', '2017-11-25 09:04:46', '2018-02-13 04:18:32', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(13, 'general', 'recaptcha_secret_key', '6Lc-A0YUAAAAAPRTdv86W124oqTwUTPQsUB6ddAQ', '', '', 'Recaptcha Secret Key', '2017-11-25 09:04:46', '2018-02-13 04:18:41', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(14, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public, student, employee, administrator, super_user', 'Time Zone', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(15, 'media', 'file_allowed_types', NULL, 'jpg, jpeg, png, gif', 'public, student, employee, administrator, super_user', 'Tipe file yang diizinkan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(16, 'media', 'upload_max_filesize', NULL, '0', 'public, student, employee, administrator, super_user', 'Maksimal Ukuran File yang Diupload', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(17, 'media', 'thumbnail_size_height', NULL, '100', 'administrator, super_user', 'Tinggi Gambar Thumbnail', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(18, 'media', 'thumbnail_size_width', NULL, '150', 'administrator, super_user', 'Lebar Gambar Thumbnail', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(19, 'media', 'medium_size_height', NULL, '308', 'administrator, super_user', 'Tinggi Gambar Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(20, 'media', 'medium_size_width', NULL, '460', 'administrator, super_user', 'Lebar Gambar Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(21, 'media', 'large_size_height', NULL, '600', 'administrator, super_user', 'Tinggi Gambar Besar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(22, 'media', 'large_size_width', NULL, '800', 'administrator, super_user', 'Lebar Gambar Besar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(23, 'media', 'album_cover_height', NULL, '250', 'administrator, super_user', 'Tinggi Cover Album Photo', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(24, 'media', 'album_cover_width', NULL, '400', 'administrator, super_user', 'Lebar Cover Album Photo', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(25, 'media', 'banner_height', NULL, '81', 'administrator, super_user', 'Tinggi Iklan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(26, 'media', 'banner_width', NULL, '245', 'administrator, super_user', 'Lebar Iklan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(27, 'media', 'image_slider_height', NULL, '400', 'administrator, super_user', 'Tinggi Gambar Slide', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(28, 'media', 'image_slider_width', NULL, '900', 'administrator, super_user', 'Lebar Gambar Slide', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(29, 'media', 'student_photo_height', NULL, '170', 'public, student, employee, administrator, super_user', 'Tinggi Photo Peserta Didik', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(30, 'media', 'student_photo_width', NULL, '113', 'public, student, employee, administrator, super_user', 'Lebar Photo Peserta Didik', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(31, 'media', 'employee_photo_height', NULL, '170', 'employee, administrator, super_user', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(32, 'media', 'employee_photo_width', NULL, '113', 'employee, administrator, super_user', 'Lebar Photo Guru dan Tenaga Kependidikan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(33, 'media', 'headmaster_photo_height', NULL, '170', 'administrator, super_user', 'Tinggi Photo Kepala Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(34, 'media', 'headmaster_photo_width', NULL, '113', 'administrator, super_user', 'Lebar Photo Kepala Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(35, 'media', 'header_height', NULL, '80', 'administrator, super_user', 'Tinggi Gambar Header', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(36, 'media', 'header_width', NULL, '200', 'administrator, super_user', 'Lebar Gambar Header', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(37, 'media', 'logo_height', NULL, '120', 'administrator, super_user', 'Tinggi Logo Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(38, 'media', 'logo_width', NULL, '120', 'administrator, super_user', 'Lebar Logo Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(39, 'writing', 'default_post_category', NULL, '1', 'student, employee, administrator, super_user', 'Default Kategori Tulisan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(40, 'writing', 'default_post_status', NULL, 'publish', 'student, employee, administrator, super_user', 'Default Status Tulisan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(41, 'writing', 'default_post_visibility', NULL, 'public', 'student, employee, administrator, super_user', 'Default Akses Tulisan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(42, 'writing', 'default_post_discussion', NULL, 'open', 'student, employee, administrator, super_user', 'Default Komentar Tulisan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(43, 'writing', 'post_image_thumbnail_height', NULL, '100', 'student, employee, administrator, super_user', 'Tinggi Gambar Kecil', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(44, 'writing', 'post_image_thumbnail_width', NULL, '150', 'student, employee, administrator, super_user', 'Lebar Gambar Kecil', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(45, 'writing', 'post_image_medium_height', NULL, '250', 'student, employee, administrator, super_user', 'Tinggi Gambar Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(46, 'writing', 'post_image_medium_width', NULL, '400', 'student, employee, administrator, super_user', 'Lebar Gambar Sedang', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(47, 'writing', 'post_image_large_height', NULL, '450', 'student, employee, administrator, super_user', 'Tinggi Gambar Besar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(48, 'writing', 'post_image_large_width', NULL, '840', 'student, employee, administrator, super_user', 'Lebar Gambar Besar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(49, 'reading', 'post_per_page', NULL, '10', 'public, student, employee, administrator, super_user', 'Tulisan per halaman', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(50, 'reading', 'post_rss_count', NULL, '10', 'public, student, employee, administrator, super_user', 'Jumlah RSS', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(51, 'reading', 'post_related_count', NULL, '10', 'public, student, employee, administrator, super_user', 'Jumlah Tulisan Terkait', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(52, 'reading', 'comment_per_page', NULL, '10', 'public, student, employee, administrator, super_user', 'Komentar per halaman', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(53, 'discussion', 'comment_moderation', NULL, 'false', 'administrator, super_user', 'Komentar harus disetujui secara manual', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(54, 'discussion', 'comment_registration', NULL, 'false', 'public, student, employee, administrator, super_user', 'Pengguna harus terdaftar dan login untuk komentar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(55, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public, student, employee, administrator, super_user', 'Komentar disaring', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(56, 'discussion', 'comment_order', NULL, 'asc', 'public, student, employee, administrator, super_user', 'Urutan Komentar', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(57, 'social_account', 'facebook', NULL, '', 'public, student, employee, administrator, super_user', 'Facebook', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(58, 'social_account', 'twitter', NULL, '', 'public, student, employee, administrator, super_user', 'Twitter', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(59, 'social_account', 'google_plus', NULL, '', 'public, student, employee, administrator, super_user', 'Google Plus', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(60, 'social_account', 'linked_in', NULL, '', 'public, student, employee, administrator, super_user', 'Linked In', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(61, 'social_account', 'youtube', NULL, '', 'public, student, employee, administrator, super_user', 'Youtube', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(62, 'social_account', 'instagram', NULL, '', 'public, student, employee, administrator, super_user', 'Instagram', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(63, 'mail_server', 'mail_server_protocol', NULL, 'smpt', 'administrator, super_user', 'Mail Server Protocol', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(64, 'mail_server', 'mail_server_hostname', NULL, 'ssl://smtp.gmail.com', 'administrator, super_user', 'Mail Server Hostname', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(65, 'mail_server', 'mail_server_username', NULL, 'admin', 'administrator, super_user', 'Mail Server Username', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(66, 'mail_server', 'mail_server_password', NULL, 'admin', 'administrator, super_user', 'Mail Server Password', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(67, 'mail_server', 'mail_server_port', NULL, '465', 'administrator, super_user', 'Mail Server Port', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(68, 'school_profile', 'npsn', NULL, '123', 'public, student, employee, administrator, super_user', 'NPSN', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(69, 'school_profile', 'school_name', 'Gears Academy', 'SMA Negeri 9 Kuningan', 'public, student, employee, administrator, super_user', 'Nama Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(70, 'school_profile', 'headmaster', NULL, 'Anton Sofyan', 'public, student, employee, administrator, super_user', 'Kepala Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(71, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public, student, employee, administrator, super_user', 'Photo Kepala Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(72, 'school_profile', 'school_level', '5', '3', 'public, student, employee, administrator, super_user', 'Bentuk Pendidikan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(73, 'school_profile', 'school_status', NULL, '1', 'public, student, employee, administrator, super_user', 'Status Sekolah', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(74, 'school_profile', 'ownership_status', NULL, '1', 'administrator, super_user', 'Status Kepemilikan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(75, 'school_profile', 'decree_operating_permit', NULL, '-', 'administrator, super_user', 'SK Izin Operasional', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(76, 'school_profile', 'decree_operating_permit_date', NULL, '2017-11-25', 'administrator, super_user', 'Tanggal SK Izin Operasional', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(77, 'school_profile', 'tagline', 'Make a great generation for world', 'Where Tomorrow\'s Leaders Come Together', 'public, student, employee, administrator, super_user', 'Slogan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(78, 'school_profile', 'rt', NULL, '12', 'public, student, employee, administrator, super_user', 'RT', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(79, 'school_profile', 'rw', NULL, '06', 'public, student, employee, administrator, super_user', 'RW', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(80, 'school_profile', 'sub_village', NULL, 'Wage', 'public, student, employee, administrator, super_user', 'Dusun', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(81, 'school_profile', 'village', NULL, 'Kadugede', 'public, student, employee, administrator, super_user', 'Kelurahan / Desa', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(82, 'school_profile', 'sub_district', NULL, 'Kadugede', 'public, student, employee, administrator, super_user', 'Kecamatan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(83, 'school_profile', 'district', NULL, 'Kuningan', 'public, student, employee, administrator, super_user', 'Kabupaten', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(84, 'school_profile', 'postal_code', NULL, '45561', 'public, student, employee, administrator, super_user', 'Kode Pos', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(85, 'school_profile', 'street_address', 'jl. Angsana 3 no.78', 'Jalan Raya Kadugede No. 11', 'public, student, employee, administrator, super_user', 'Alamat Jalan', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(86, 'school_profile', 'phone', NULL, '0232123456', 'public, student, employee, administrator, super_user', 'Telepon', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(87, 'school_profile', 'fax', NULL, '0232123456', 'public, student, employee, administrator, super_user', 'Fax', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(88, 'school_profile', 'email', 'rizkys2323@gmail.com', 'info@sman9kuningan.sch.id', 'public, student, employee, administrator, super_user', 'Email', '2017-11-25 09:04:46', '2018-02-13 04:17:16', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(89, 'school_profile', 'website', NULL, 'http://www.sman9kuningan.sch.id', 'public, student, employee, administrator, super_user', 'Website', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(90, 'school_profile', 'logo', NULL, 'logo.png', 'public, student, employee, administrator, super_user', 'Logo', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(91, 'admission', 'admission_status', NULL, 'open', 'public, student, employee, administrator, super_user', 'Status Penerimaan Peserta Didik Baru', '2017-11-25 09:04:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(92, 'admission', 'admission_year', '2018', '2017', 'public, student, employee, administrator, super_user', 'Tahun Penerimaan Peserta Didik Baru', '2017-11-25 09:04:46', '2018-02-13 04:12:31', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(93, 'admission', 'admission_start_date', '2018-01-31', '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Mulai PPDB', '2017-11-25 09:04:46', '2018-02-13 04:12:24', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(94, 'admission', 'admission_end_date', '2018-02-28', '2017-12-31', 'public, student, employee, administrator, super_user', 'Tanggal Selesai PPDB', '2017-11-25 09:04:46', '2018-02-13 04:12:18', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(95, 'admission', 'announcement_start_date', '2018-03-01', '2017-01-01', 'public, student, employee, administrator, super_user', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2017-11-25 09:04:46', '2018-02-13 04:12:42', NULL, NULL, NULL, 1, NULL, NULL, 'false'),
(96, 'admission', 'announcement_end_date', '2018-03-10', '2017-12-31', 'public, student, employee, administrator, super_user', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2017-11-25 09:04:46', '2018-02-13 04:12:38', NULL, NULL, NULL, 1, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `major_id` bigint(20) DEFAULT NULL COMMENT 'Jurusan / Program Keahlian',
  `first_choice` bigint(20) DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice` bigint(20) DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB',
  `admission_phase_id` bigint(20) DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Calon Siswa Baru ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `is_alumni` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Alumni ?',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Student Aktif ?',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `nim` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Mahasiswa',
  `nis` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa',
  `nisn` varchar(50) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `diploma_number` varchar(50) DEFAULT NULL COMMENT 'No. Seri Ijazah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion` bigint(20) DEFAULT NULL,
  `special_needs` bigint(20) DEFAULT NULL COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence` bigint(20) DEFAULT NULL COMMENT 'Tempat Tinggal',
  `transportation` bigint(20) DEFAULT NULL COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education` bigint(20) DEFAULT '0',
  `father_employment` bigint(20) DEFAULT '0',
  `father_monthly_income` bigint(20) DEFAULT '0',
  `father_special_needs` bigint(20) DEFAULT '0',
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education` bigint(20) DEFAULT NULL,
  `mother_employment` bigint(20) DEFAULT NULL,
  `mother_monthly_income` bigint(20) DEFAULT NULL,
  `mother_special_needs` bigint(20) DEFAULT NULL,
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education` bigint(20) DEFAULT NULL,
  `guardian_employment` bigint(6) DEFAULT NULL,
  `guardian_monthly_income` bigint(20) DEFAULT NULL,
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(2) DEFAULT '0' COMMENT 'Jumlah Saudara Kandng',
  `student_status` bigint(20) DEFAULT NULL COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `major_id`, `first_choice`, `second_choice`, `registration_number`, `selection_result`, `admission_phase_id`, `photo`, `is_transfer`, `is_prospective_student`, `re_registration`, `is_alumni`, `is_student`, `start_date`, `nim`, `nis`, `nisn`, `nik`, `prev_exam_number`, `paud`, `tk`, `skhun`, `diploma_number`, `hobby`, `ambition`, `full_name`, `gender`, `birth_place`, `birth_date`, `religion`, `special_needs`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `residence`, `transportation`, `phone`, `mobile_phone`, `email`, `sktm`, `kks`, `kps`, `kip`, `kis`, `citizenship`, `country`, `father_name`, `father_birth_year`, `father_education`, `father_employment`, `father_monthly_income`, `father_special_needs`, `mother_name`, `mother_birth_year`, `mother_education`, `mother_employment`, `mother_monthly_income`, `mother_special_needs`, `guardian_name`, `guardian_birth_year`, `guardian_education`, `guardian_employment`, `guardian_monthly_income`, `mileage`, `traveling_time`, `height`, `weight`, `sibling_number`, `student_status`, `end_date`, `reason`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, NULL, 1, 2, '2018000001', NULL, 0, '56e85d0b639c4dcb53fe34fd5dee5967.jpg', 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, NULL, 'q3213213213', 'undefined', '', '', 'undefined', 'undefined', 'Main', 'main', 'Rizky Setiawan', 'M', 'Tangerang', '2018-02-05', 89, 25, 'wewqewqewq', '', '', '', '', '', 'wqewqewqeq', '', 0, 0, '', '23213213', NULL, '', '', '', '', '', 'WNI', '', 'qwewqe', 1996, 0, 0, 0, 23, 'wqewqewqe', 0000, 0, 0, 0, 23, '', 0000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2018-02-13 04:23:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(9, NULL, 2, 1, '2018000002', NULL, 0, '34a035d2e2f147cc12bef882a790aa7b.jpg', 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, NULL, '131232132121321', 'undefined', '', '', 'undefined', 'undefined', 'wqewqe', 'wqewqewq', 'Rizky SetiawanSs', 'M', 'Tangerang', '2018-01-29', 89, 23, 'tabefarar', '', '', '', '', '', 'wqewqewq', '', 0, 0, '', '0251515445', NULL, '', '', '', '', '', 'WNI', '', 'hsansa', 1995, 0, 0, 0, 23, 'stka', 0000, 0, 0, 0, 23, '', 0000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2018-02-13 04:36:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(10, NULL, 2, 1, '2018000003', NULL, 0, '72df35d8242b791d93c05008208c1b4e.jpg', 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, 'undefined', '131232132121321', 'undefined', '', '', 'undefined', 'undefined', 'wqewqe', 'wqewqewq', 'm setiawan', 'M', 'Tangerang', '2018-01-29', 89, 23, 'tabefarar', '', '', '', '', '', 'wqewqewq', '', 0, 0, '', '0251515445', NULL, '', '', '', '', '', 'WNI', '', 'hsansa', 1995, 0, 0, 0, 23, 'stka', 0000, 0, 0, 0, 23, '', 0000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2018-02-13 04:39:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(11, NULL, 1, 2, '2018000004', NULL, 0, NULL, 'false', 'true', 'false', 'false', 'false', NULL, NULL, NULL, 'undefined', '33435484548436541', 'undefined', '', '', 'undefined', 'undefined', '', '', 'Testing', 'M', 'Rumahsakit', '2000-02-08', 89, 23, 'jalan-jalan', '', '', '', '', '', 'terserah', '', 0, 0, '', '081684318234', NULL, '', '', '', '', '', 'WNI', '', 'sdfsdfs', 1999, 0, 0, 0, 23, 'sdfrtghg', 0000, 0, 0, 0, 23, '', 0000, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, '2018-02-13 04:43:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Pengumuman', 'pengumuman', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Cosmo', 'cosmo', 'Anton Sofyan', 'true', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(2, 'Flatly', 'flatly', 'Anton Sofyan', 'false', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false'),
(3, 'Journal', 'journal', 'Anton Sofyan', 'false', '2017-11-25 09:04:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `biography` text,
  `user_registered` datetime DEFAULT NULL,
  `user_group_id` bigint(20) NOT NULL DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `profile_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT 'student_id OR employee_id',
  `forgot_password_key` varchar(100) DEFAULT NULL,
  `forgot_password_request_date` date DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'true',
  `is_logged_in` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `biography`, `user_registered`, `user_group_id`, `user_type`, `profile_id`, `forgot_password_key`, `forgot_password_request_date`, `is_active`, `is_logged_in`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'admin', '$2y$10$eGcBH8Z01eT.vS8KfBf6FuE7TCcoFqBPtOwp7unGOZvd2etdMOWtK', 'Rizky Setiawan', 'admin@admin.com', NULL, NULL, '2018-02-13 11:11:36', 0, 'super_user', NULL, NULL, NULL, 'true', 'true', '2018-02-13 11:14:30', '::1', '2018-02-13 04:11:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE `user_privileges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `deleted_by` bigint(20) DEFAULT NULL,
  `restored_by` bigint(20) DEFAULT NULL,
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `_captcha`
--

CREATE TABLE `_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_captcha`
--

INSERT INTO `_captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
(1, 1504930085, '127.0.0.1', '25804');

-- --------------------------------------------------------

--
-- Table structure for table `_sessions`
--

CREATE TABLE `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('dmm3rr3vi2u5pnfp8dvij1n88cvemsbo', '::1', 1518495223, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439353130353b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a303a22223b6c617469747564657c733a303a22223b6c6f6e6769747564657c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a303a22223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32353a22696e666f40736d616e396b756e696e67616e2e7363682e6964223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b69647c733a313a2231223b757365725f6e616d657c733a353a2261646d696e223b757365725f66756c6c5f6e616d657c733a31343a2252697a6b7920536574696177616e223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f75726c7c4e3b757365725f726567697374657265647c733a31393a22323031382d30322d31332031313a31313a3336223b757365725f67726f75705f69647c733a313a2230223b757365725f747970657c733a31303a2273757065725f75736572223b70726f66696c655f69647c4e3b69735f6c6f676765645f696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a333a2261636c223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2273747564656e7473223b693a31333b733a373a2270726f66696c65223b7d7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22313730223b656d706c6f7965655f70686f746f5f77696474687c733a333a22313133223b686561646d61737465725f70686f746f5f6865696768747c733a333a22313730223b686561646d61737465725f70686f746f5f77696474687c733a333a22313133223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b6d61696c5f7365727665725f70726f746f636f6c7c733a343a22736d7074223b6d61696c5f7365727665725f686f73746e616d657c733a32303a2273736c3a2f2f736d74702e676d61696c2e636f6d223b6d61696c5f7365727665725f757365726e616d657c733a353a2261646d696e223b6d61696c5f7365727665725f70617373776f72647c733a353a2261646d696e223b6d61696c5f7365727665725f706f72747c733a333a22343635223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031372d31312d3235223b),
('rnoujjfdav8u9sl4dol27a2p501m0q8o', '125.161.112.80', 1518495530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439353233323b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b),
('4l4r00jcm7bro64in45n0hmcoimtlao3', '::1', 1518495802, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439353537363b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a303a22223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b69647c733a313a2231223b757365725f6e616d657c733a353a2261646d696e223b757365725f66756c6c5f6e616d657c733a31343a2252697a6b7920536574696177616e223b757365725f656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f75726c7c4e3b757365725f726567697374657265647c733a31393a22323031382d30322d31332031313a31313a3336223b757365725f67726f75705f69647c733a313a2230223b757365725f747970657c733a31303a2273757065725f75736572223b70726f66696c655f69647c4e3b69735f6c6f676765645f696e7c623a313b757365725f70726976696c656765737c613a31343a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a31313a226d61696e74656e616e6365223b693a333b733a333a2261636c223b693a343b733a393a2261646d697373696f6e223b693a353b733a31303a22617070656172616e6365223b693a363b733a343a22626c6f67223b693a373b733a393a22656d706c6f79656573223b693a383b733a353a226d65646961223b693a393b733a373a22706c7567696e73223b693a31303b733a393a227265666572656e6365223b693a31313b733a383a2273657474696e6773223b693a31323b733a383a2273747564656e7473223b693a31333b733a373a2270726f66696c65223b7d7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22313730223b656d706c6f7965655f70686f746f5f77696474687c733a333a22313133223b686561646d61737465725f70686f746f5f6865696768747c733a333a22313730223b686561646d61737465725f70686f746f5f77696474687c733a333a22313133223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b6d61696c5f7365727665725f70726f746f636f6c7c733a343a22736d7074223b6d61696c5f7365727665725f686f73746e616d657c733a32303a2273736c3a2f2f736d74702e676d61696c2e636f6d223b6d61696c5f7365727665725f757365726e616d657c733a353a2261646d696e223b6d61696c5f7365727665725f70617373776f72647c733a353a2261646d696e223b6d61696c5f7365727665725f706f72747c733a333a22343635223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031372d31312d3235223b),
('4919teqp1vnl6n1s35oh139lj2ipha1r', '125.161.112.80', 1518496787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439363736333b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b),
('8q4ev0mq6cmvtnkceonvuuugkklu2g1o', '66.220.148.104', 1518496842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439363834323b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b),
('smdr7t8551pr1t32srv1f89b7aipk6td', '173.252.98.25', 1518496843, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439363834333b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b),
('1vtj7dtss8tpbmfu8j822a1242kc8qk4', '110.136.125.168', 1518496879, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439363834373b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b),
('73vg5hsjjkrb8ddbqlglalljcmnc46ob', '110.136.125.168', 1518497030, 0x5f5f63695f6c6173745f726567656e65726174657c693a313531383439363839313b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031372d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b676f6f676c655f6d61705f6170695f6b65797c733a33393a2241497a6153794168456b6b777a554a55725f397a625f747376674d4d50507777626e627a6e486f223b6c617469747564657c733a393a222d362e313634373939223b6c6f6e6769747564657c733a31303a223130362e363033353439223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f736974655f6b65797c733a34303a22364c632d413059554141414141416f59764276306d33507947682d614e4b676c73654d6e6e446459223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a31393a226a70672c206a7065672c20706e672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b73747564656e745f70686f746f5f6865696768747c733a333a22313730223b73747564656e745f70686f746f5f77696474687c733a333a22313133223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a303a22223b747769747465727c733a303a22223b676f6f676c655f706c75737c733a303a22223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a303a22223b696e7374616772616d7c733a303a22223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31333a2247656172732041636164656d79223b686561646d61737465727c733a31323a22416e746f6e20536f6679616e223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a2235223b7363686f6f6c5f7374617475737c733a313a2231223b7461676c696e657c733a33333a224d616b6520612067726561742067656e65726174696f6e20666f7220776f726c64223b72747c733a323a223132223b72777c733a323a223036223b7375625f76696c6c6167657c733a343a2257616765223b76696c6c6167657c733a383a224b61647567656465223b7375625f64697374726963747c733a383a224b61647567656465223b64697374726963747c733a383a224b756e696e67616e223b706f7374616c5f636f64657c733a353a223435353631223b7374726565745f616464726573737c733a31393a226a6c2e20416e6773616e612033206e6f2e3738223b70686f6e657c733a31303a2230323332313233343536223b6661787c733a31303a2230323332313233343536223b656d61696c7c733a32303a2272697a6b79733233323340676d61696c2e636f6d223b776562736974657c733a33313a22687474703a2f2f7777772e736d616e396b756e696e67616e2e7363682e6964223b6c6f676f7c733a383a226c6f676f2e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303138223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031382d30312d3331223b61646d697373696f6e5f656e645f646174657c733a31303a22323031382d30322d3238223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031382d30332d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031382d30332d3130223b7468656d657c733a353a22636f736d6f223b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`question_id`,`answer`),
  ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`class`,`sub_class`,`major_id`),
  ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`academic_year_id`,`student_id`),
  ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE,
  ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE,
  ADD KEY `class_group_settings_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `nip` (`nip`),
  ADD UNIQUE KEY `npwp` (`npwp`),
  ADD UNIQUE KEY `niy` (`niy`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `employees_spouse_employment__idx` (`spouse_employment`) USING BTREE,
  ADD KEY `employees_employment_status__idx` (`employment_status`) USING BTREE,
  ADD KEY `employees_employment_type__idx` (`employment_type`) USING BTREE,
  ADD KEY `employees_institutions_lifter__idx` (`institutions_lifter`) USING BTREE,
  ADD KEY `employees_rank__idx` (`rank`) USING BTREE,
  ADD KEY `employees_salary_source__idx` (`salary_source`) USING BTREE,
  ADD KEY `employees_skills_laboratory__idx` (`skills_laboratory`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `file_categories`
--
ALTER TABLE `file_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `major` (`major`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`group`,`option`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`category`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `registration_phases`
--
ALTER TABLE `registration_phases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`year`,`phase`);

--
-- Indexes for table `registration_quotas`
--
ALTER TABLE `registration_quotas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`year`,`major_id`,`quota`),
  ADD KEY `registration_student_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`group`,`variable`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD UNIQUE KEY `nim` (`nim`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE,
  ADD KEY `students_full_name__idx` (`full_name`) USING BTREE,
  ADD KEY `students_first_choice__idx` (`first_choice`) USING BTREE,
  ADD KEY `students_second_choice__idx` (`second_choice`) USING BTREE,
  ADD KEY `students_major_id__idx` (`major_id`) USING BTREE,
  ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE;

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD UNIQUE KEY `user_url` (`user_url`),
  ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `users_profile_id__idx` (`profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group` (`group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`),
  ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE,
  ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_captcha`
--
ALTER TABLE `_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
  ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_categories`
--
ALTER TABLE `file_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registration_phases`
--
ALTER TABLE `registration_phases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `registration_quotas`
--
ALTER TABLE `registration_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `_captcha`
--
ALTER TABLE `_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
