-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 04, 2025 at 02:16 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shri_tech_gd`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `gst` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `max_users` int(11) DEFAULT '0',
  `max_logins` int(11) DEFAULT '0',
  `rate_type` tinyint(4) NOT NULL DEFAULT '1',
  `hide_amount` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `client_name`, `email`, `mobile`, `status`, `gst`, `address`, `org_id`, `max_users`, `max_logins`, `rate_type`, `hide_amount`, `updated_at`, `created_at`) VALUES
(1, 'M/s New Nabaratna Hospitality Pvt. Ltd.', 'Haridwar Lounge', 'admin@haridwar', '7351334717', 1, '18AAICN4763E1ZA', 'AC Executive Lounge, Haridwar Railway Station<br>PF No. 1', 1, 2, 0, 1, 200, '2024-08-20 11:02:14', NULL),
(2, 'M/s New Nabaratna Hospitality Pvt. Ltd.', 'Guwahati Lounge', 'admin@haridwar', '7351334717', 1, '18AAICN4763E1ZA', 'AC Executive Lounge, <br>Guwahati Railway Station PF-1', 1, 0, 0, 1, 300, '2024-08-20 11:02:14', NULL),
(3, 'M/s New Nabaratna Hospitality Pvt. Ltd.', 'Exit Gate  Gh', 'admin@haridwar', '7351334717', 1, '18AAICN4763E1ZA', 'Exit Gate, Guwahati Railway Station', 1, 0, 0, 1, 1000, '2024-08-20 11:02:14', NULL),
(4, 'Shri Tech ', 'Shri Tech', 'admin@shriTech', '7351334717', 1, '05AOSPG5873P1Z2', 'M-39 Shivalik Nagar Haridwar', 0, 0, 0, 1, 0, '2024-08-20 11:02:14', NULL),
(5, 'Northern Railway Amritsar, Secalgotech Projects India Pvt. Ltd', 'Amritsar', 'admin@secalgotech', '7351334717', 1, '10AB0CS3588B1ZE', 'Amritsar', 2, 0, 0, 2, 0, '2024-08-20 11:02:14', NULL),
(6, 'MS Kanha Social Welfare Organisation', 'Haridwar', 'admin@haridwar', '7351334717', 1, '10AABAK5354K1ZU', 'Haridwar', 2, 0, 0, 1, 0, '2024-12-24 12:56:28', NULL),
(7, 'MS Kanha Social Welfare Organisation', 'Chandigarh', 'chandigarh@admin', '8146452545', 1, '10AABAK5354K1ZU', 'Chandigarh', 2, 0, 0, 1, 0, '2025-01-04 12:50:43', NULL),
(8, 'MS Kanha Social Welfare Organisation', 'Moradabad Admin', 'moradabad@admin', '8146452545', 1, '10AABAK5354K1ZU', 'Moradabad', 2, 0, 0, 1, 0, '2025-01-04 12:50:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_services`
--

CREATE TABLE `client_services` (
  `id` int(11) NOT NULL,
  `services_id` int(11) NOT NULL DEFAULT '0' COMMENT '1=sittinng,2=cloakroom, 3=canteen,4= Massage, 5=Locker,6=Ledger account, 7 =  Recliners, 8 = Rooms',
  `client_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `capacity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_services`
--

INSERT INTO `client_services` (`id`, `services_id`, `client_id`, `status`, `capacity`) VALUES
(9, 3, 1, 1, 0),
(10, 4, 1, 1, 0),
(11, 5, 1, 1, 0),
(12, 1, 2, 1, 0),
(13, 4, 2, 1, 0),
(14, 1, 3, 1, 0),
(15, 4, 3, 1, 0),
(16, 3, 2, 1, 0),
(17, 1, 4, 1, 0),
(18, 3, 4, 1, 0),
(19, 4, 4, 1, 0),
(20, 5, 4, 1, 0),
(21, 2, 4, 1, 0),
(22, 6, 1, 1, 0),
(23, 7, 1, 1, 0),
(24, 8, 1, 1, 0),
(25, 2, 1, 1, 0),
(26, 9, 1, 1, 0),
(27, 1, 1, 1, 0),
(28, 10, 1, 1, 0),
(29, 11, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `g_canteen_items`
--

CREATE TABLE `g_canteen_items` (
  `id` int(11) NOT NULL,
  `canteen_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `godown_id` int(11) NOT NULL DEFAULT '0',
  `barcodevalue` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_short_name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `is_manual` tinyint(4) NOT NULL DEFAULT '0',
  `barvalue_avail` tinyint(4) NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `g_canteen_items`
--

INSERT INTO `g_canteen_items` (`id`, `canteen_id`, `client_id`, `godown_id`, `barcodevalue`, `item_name`, `item_short_name`, `price`, `stock`, `status`, `added_by`, `is_manual`, `barvalue_avail`, `updated_at`, `created_at`) VALUES
(1, 0, 1, 0, '172604569692', 'ST1', 'SD1', 15, 75, 0, 1, 0, 1, '2025-06-04 14:04:50', '2025-06-04 14:02:08');

-- --------------------------------------------------------

--
-- Table structure for table `g_canteen_item_stocks`
--

CREATE TABLE `g_canteen_item_stocks` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `canteen_id` int(11) NOT NULL DEFAULT '0',
  `canteen_item_id` int(11) NOT NULL DEFAULT '0',
  `stock` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `g_canteen_item_stocks`
--

INSERT INTO `g_canteen_item_stocks` (`id`, `client_id`, `canteen_id`, `canteen_item_id`, `stock`, `status`, `added_by`, `date`, `updated_at`, `created_at`) VALUES
(1, 1, 0, 1, 25, 0, 1, '2025-06-04', '2025-06-04 14:04:33', '2025-06-04 14:04:33'),
(2, 1, 0, 1, 50, 0, 1, '2025-06-04', '2025-06-04 14:04:50', '2025-06-04 14:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `g_daily_entries`
--

CREATE TABLE `g_daily_entries` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `canteen_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `check_in` time DEFAULT NULL,
  `pay_type` int(11) NOT NULL DEFAULT '0',
  `unique_id` varchar(255) DEFAULT NULL,
  `total_amount` int(11) NOT NULL DEFAULT '0',
  `added_by` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `g_daily_entry_items`
--

CREATE TABLE `g_daily_entry_items` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL DEFAULT '0',
  `client_id` int(11) DEFAULT NULL,
  `canteen_item_id` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `paid_amount` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `login_time` datetime DEFAULT NULL,
  `ip` mediumtext CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `client_id`, `user_id`, `login_time`, `ip`) VALUES
(1, 1, 1, '2025-05-24 14:52:41', '::1'),
(2, 1, 1, '2025-05-27 16:48:15', '::1'),
(3, 1, 1, '2025-05-28 15:25:11', '::1'),
(4, 1, 3, '2025-05-28 21:08:00', '::1'),
(5, 1, 3, '2025-05-28 21:08:40', '::1'),
(6, 1, 3, '2025-05-28 21:09:36', '::1'),
(7, 1, 3, '2025-05-28 21:10:57', '::1'),
(8, 1, 3, '2025-05-28 21:12:04', '::1'),
(9, 1, 3, '2025-06-01 07:19:25', '::1'),
(10, 1, 4, '2025-06-01 07:20:01', '::1'),
(11, 1, 5, '2025-06-01 07:20:43', '::1'),
(12, 1, 5, '2025-06-01 07:24:39', '::1'),
(13, 1, 5, '2025-06-01 07:25:37', '::1'),
(14, 1, 5, '2025-06-01 07:30:35', '::1'),
(15, 1, 5, '2025-06-01 07:31:34', '::1'),
(16, 1, 4, '2025-06-01 07:33:08', '::1'),
(17, 1, 3, '2025-06-01 07:34:22', '::1'),
(18, 1, 5, '2025-06-01 07:35:13', '::1'),
(19, 1, 6, '2025-06-01 07:37:46', '::1'),
(20, 1, 1, '2025-06-04 15:09:37', '::1'),
(21, 1, 1, '2025-06-04 19:21:09', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `login_token`
--

CREATE TABLE `login_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_token`
--

INSERT INTO `login_token` (`id`, `user_id`, `client_id`, `created_at`) VALUES
(10, 4, 1, '2025-06-01 02:03:08'),
(11, 3, 1, '2025-06-01 02:04:22'),
(13, 6, 1, '2025-06-01 02:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `status`) VALUES
(1, 'Sittinng', 0),
(2, 'Cloakroom', 0),
(3, 'Canteen', 0),
(4, 'Massage', 0),
(5, 'Locker', 0),
(6, 'Ledger Account', 0),
(7, 'Recliners', 0),
(8, 'Rooms', 0),
(9, 'Scanning', 0),
(10, 'Restroom', 0),
(11, 'Godown Canteen', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6TwMpyhWAx8OrB8I0rI46zengi6eNrLRQH1N74Ja', 3, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IkJQRG9hQUNKTTFDbVNhUHhYUTF0Vm1IVkdhZnA0eUFsNWdQV1NHdGQiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjU0OiJodHRwOi8vbG9jYWxob3N0Ojg4ODgvc2hyaV90ZWNoL3B1YmxpYy9hZG1pbi9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTE6ImNsaWVudF9uYW1lIjtzOjM5OiJNL3MgTmV3IE5hYmFyYXRuYSBIb3NwaXRhbGl0eSBQdnQuIEx0ZC4iO3M6NjoiZ3N0X25vIjtzOjE1OiIxOEFBSUNONDc2M0UxWkEiO3M6MTE6InNlcnZpY2VfaWRzIjthOjExOntpOjA7aTozO2k6MTtpOjQ7aToyO2k6NTtpOjM7aTo2O2k6NDtpOjc7aTo1O2k6ODtpOjY7aToyO2k6NztpOjk7aTo4O2k6MTtpOjk7aToxMDtpOjEwO2k6MTE7fXM6NzoiYWRkcmVzcyI7czo1NzoiQUMgRXhlY3V0aXZlIExvdW5nZSwgSGFyaWR3YXIgUmFpbHdheSBTdGF0aW9uPGJyPlBGIE5vLiAxIjtzOjE3OiJhdXRvX2FsZXJ0X3N0YXR1cyI7aTowO3M6MTA6ImxvZ2luX21vZGUiO3M6MToiMSI7czoxMDoiY2xpZW50X2lkcyI7YTo3OntpOjA7aToxO2k6MTtpOjI7aToyO2k6MztpOjM7aTo5O2k6NDtpOjEwO2k6NTtpOjExO2k6NjtpOjEyO319', 1748743463),
('76waV5cnu23UK7hpAStz2dLAiJb5lm4d0sfypcpu', 1, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IlZzVUJhN1lFRzFqRlp2WTdyQ0JJeXU0UGlabHQ5cXZvM3IzUXBkUzUiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjc2OiJodHRwOi8vbG9jYWxob3N0Ojg4ODgvc2hyaV90ZWNoX2dkL3B1YmxpYy9hZG1pbi9nb2Rvd24tY2FudGVlbi9kYWlseS1lbnRyaWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjExOiJjbGllbnRfbmFtZSI7czozOToiTS9zIE5ldyBOYWJhcmF0bmEgSG9zcGl0YWxpdHkgUHZ0LiBMdGQuIjtzOjY6ImdzdF9ubyI7czoxNToiMThBQUlDTjQ3NjNFMVpBIjtzOjExOiJzZXJ2aWNlX2lkcyI7YToxMTp7aTowO2k6MztpOjE7aTo0O2k6MjtpOjU7aTozO2k6NjtpOjQ7aTo3O2k6NTtpOjg7aTo2O2k6MjtpOjc7aTo5O2k6ODtpOjE7aTo5O2k6MTA7aToxMDtpOjExO31zOjc6ImFkZHJlc3MiO3M6NTc6IkFDIEV4ZWN1dGl2ZSBMb3VuZ2UsIEhhcmlkd2FyIFJhaWx3YXkgU3RhdGlvbjxicj5QRiBOby4gMSI7czoxNzoiYXV0b19hbGVydF9zdGF0dXMiO2k6MDtzOjEwOiJsb2dpbl9tb2RlIjtzOjE6IjEiO3M6MTA6ImNsaWVudF9pZHMiO2E6Nzp7aTowO2k6MTtpOjE7aToyO2k6MjtpOjM7aTozO2k6OTtpOjQ7aToxMDtpOjU7aToxMTtpOjY7aToxMjt9fQ==', 1749046460),
('vPdYF24YGm5YoSborkUUBOTEZ4XZQkuad8E3Z2iJ', 4, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6IjZzVFB2alhzb2FVa3M5TWliTGRtN1pTcHVnazk2Tmc5cWdEU0FNWGMiO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjUyOiJodHRwOi8vbG9jYWxob3N0Ojg4ODgvc2hyaV90ZWNoL3B1YmxpYy9hZG1pbi9zaXR0aW5nIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NDtzOjExOiJjbGllbnRfbmFtZSI7czozOToiTS9zIE5ldyBOYWJhcmF0bmEgSG9zcGl0YWxpdHkgUHZ0LiBMdGQuIjtzOjY6ImdzdF9ubyI7czoxNToiMThBQUlDTjQ3NjNFMVpBIjtzOjExOiJzZXJ2aWNlX2lkcyI7YToxMTp7aTowO2k6MztpOjE7aTo0O2k6MjtpOjU7aTozO2k6NjtpOjQ7aTo3O2k6NTtpOjg7aTo2O2k6MjtpOjc7aTo5O2k6ODtpOjE7aTo5O2k6MTA7aToxMDtpOjExO31zOjc6ImFkZHJlc3MiO3M6NTc6IkFDIEV4ZWN1dGl2ZSBMb3VuZ2UsIEhhcmlkd2FyIFJhaWx3YXkgU3RhdGlvbjxicj5QRiBOby4gMSI7czoxNzoiYXV0b19hbGVydF9zdGF0dXMiO2k6MDtzOjEwOiJsb2dpbl9tb2RlIjtzOjE6IjEiO3M6MTA6ImNsaWVudF9pZHMiO2E6Nzp7aTowO2k6MTtpOjE7aToyO2k6MjtpOjM7aTozO2k6OTtpOjQ7aToxMDtpOjU7aToxMTtpOjY7aToxMjt9fQ==', 1748744583),
('Z3UCWTfh0XM43tJoJfyjmYJWbwmxly132AApFpgQ', NULL, '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRno2OXBYSWdjOHNHSzdLWWJOM2RoWHBEbk1aMU5SVGtjRDd2akFmRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1748743716);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `old_id` int(11) NOT NULL DEFAULT '0',
  `canteen_id` int(11) NOT NULL DEFAULT '0',
  `lounge_id` int(11) NOT NULL DEFAULT '0',
  `enc_id` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `address` text,
  `password` varchar(200) NOT NULL,
  `password_check` text NOT NULL,
  `profile_pic` varchar(500) DEFAULT NULL,
  `priv` int(11) DEFAULT NULL,
  `active` tinyint(2) DEFAULT '1',
  `remember_token` text,
  `api_token` varchar(300) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `org_id` int(11) DEFAULT NULL,
  `perent_user_id` int(11) NOT NULL DEFAULT '0',
  `is_auto_alert_access` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>false, 1=>true',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `client_id`, `old_id`, `canteen_id`, `lounge_id`, `enc_id`, `name`, `email`, `mobile`, `address`, `password`, `password_check`, `profile_pic`, `priv`, `active`, `remember_token`, `api_token`, `last_login`, `org_id`, `perent_user_id`, `is_auto_alert_access`, `updated_at`, `created_at`) VALUES
(1, 1, 0, 0, 0, '0011', 'Avinash Jha', 'avinashjha', '343434343', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, 'Fmj9aFgxu3M6sE6rJFEuEiUQXC2q8S8zGQ2AL9fFRmYDZiPld0NqLklKmfp3', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-06-04 13:51:09', 1, 0, 0, '2025-06-04 13:51:09', NULL),
(3, 1, 0, 0, 0, '0013', 'Gaurv', 'gaurv@gmail.com', '8134878709', 'Haridwar', '$2y$10$kSIqBs6Ji3FPss9twvHSs.5jSORS6e0wOt0sgRXeEONCZvDzzsXtm', 'nnh123', NULL, 3, 1, NULL, NULL, '2025-06-01 02:04:22', NULL, 0, 0, '2025-06-01 02:04:22', NULL),
(4, 1, 0, 0, 0, '0014', 'Manoj', 'manoj@gmail.com', '8134878709', 'Haridwar', '$2y$10$kSIqBs6Ji3FPss9twvHSs.5jSORS6e0wOt0sgRXeEONCZvDzzsXtm', 'nnh123', NULL, 3, 1, NULL, NULL, '2025-06-01 02:03:08', NULL, 0, 0, '2025-06-01 02:03:08', NULL),
(5, 1, 0, 0, 0, '0015', 'Rohit', 'rohit@gmail.com', '8134878709', 'Haridwar', '$2y$10$kSIqBs6Ji3FPss9twvHSs.5jSORS6e0wOt0sgRXeEONCZvDzzsXtm', 'nnh123', NULL, 3, 1, NULL, NULL, '2025-06-01 02:05:13', NULL, 0, 1, '2025-06-01 02:05:13', NULL),
(6, 1, 0, 0, 0, '0016', 'Radhika', 'radhika@gmail.com', '8134878709', 'Haridwar', '$2y$10$ZalsGk.5B2hVP9JjQ3viK.tkSPf7nZtbsWdH.iRDix/rksFlHMB7m', 'nnh456', NULL, 3, 1, NULL, NULL, '2025-06-01 02:07:46', NULL, 0, 0, '2025-06-01 02:07:46', NULL),
(7, 1, 0, 0, 0, NULL, 'Shubham', 'shubham@gmail.com', '8979441315', NULL, '$2y$10$WWu1ouvKkNqgyUfFhsLmV.WBrvHDwyAvIypffTiHNnkir3fZyPmra', 'nnh123', NULL, 3, 1, NULL, NULL, '2025-01-16 07:00:01', NULL, 0, 1, '2025-01-16 07:00:01', '2024-02-15 02:34:56'),
(8, 1, 0, 0, 0, NULL, 'Night 10to12', '10to12', '8134878709', NULL, '$2y$10$eNGZJfxJCYIbuDN9jWH4a.4.uHGXkkP77aoHZjTXHGvkuRYx.rUU6', 'night10to12', NULL, 3, 1, NULL, NULL, '2025-01-16 04:56:23', NULL, 0, 0, '2025-01-16 04:56:23', '2024-02-16 19:08:27'),
(9, 1, 0, 0, 0, '0011', 'Shri Tech', 'admin', '343434343', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 1, 1, 'VTZlhGdn4RN9CuDdFjLKRRfriNc3hzcScrkeEGzdZ1o0OyCYMMbkQqIzbFMT', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2024-08-21 17:24:28', NULL, 0, 0, '2024-12-27 15:43:22', NULL),
(10, 2, 0, 0, 0, '0011', 'Vikash Jha', 'vikas@admin', '9122596900', 'ss', '$2y$10$w/vYhcwhkgq2AEJ2F4tSkOxj6e0BeU3kxAuDbXqqiP/ZFYAmAt5JK', 'vikash@5218', '', 2, 1, 'VlR8tZ6zvLtTZRas59cDE8i6hJtje4w20f5UOHeQTQSSSDMmaxXZ7VObeqEm', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-16 21:43:32', 1, 0, 0, '2025-01-16 21:43:32', '2024-08-21 04:39:18'),
(11, 2, 0, 0, 0, '0016', 'User 1', 'user1@gmail.com', '8134878709', 'Haridwar', '$2y$10$5qSq98ORGm9AdR5Vf2SMHelsX30mmTOgP9TxprRnPzadW.dgY6BN2', 'sample2', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-21 04:39:18'),
(12, 2, 0, 0, 0, NULL, 'User 2', 'user2@gmail.com', '898989891212', NULL, '$2y$10$XbMtcn4IM/sRSNncGJxCv.3ROrDTW2I1/tTPOjxbTTWrp1fic3ck2', 'sample', NULL, 3, 1, NULL, NULL, '2024-08-21 06:10:37', NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-21 04:39:18'),
(13, 2, 0, 0, 0, NULL, 'MEHAK BEGUM', 'mehak@morning', '7896938494', NULL, '$2y$10$jZKP25nBNhm3gZyUCrRl6.chbFSH07S9Twzgci5BcmAb8Y2ZfCBCa', 'mehak123', NULL, 3, 0, NULL, NULL, '2024-10-27 18:50:05', NULL, 0, 0, '2025-01-10 04:53:53', '2024-08-21 04:39:18'),
(14, 2, 0, 0, 0, NULL, 'CHHOTU KASHYAP', 'CHHOTU@NIGHT', '8317739594', NULL, '$2y$10$2U4qoCW9KBQ0LUh9OKhrW.Jc4AdLUuCAirktZJqfJd7Oe6A3vGecm', 'chhotu123', NULL, 3, 0, NULL, NULL, '2024-08-21 19:36:52', NULL, 0, 0, '2025-01-10 04:53:47', '2024-08-21 04:39:18'),
(15, 2, 0, 0, 0, NULL, 'KANHAIYA KR JHA', 'KANHAIYA', '8473981556', NULL, '$2y$10$pwMZ3JmtbGzEuqhEMnB.FuCm8I9MnDTwglNqkc4YmnDlXZ4uPngD6', 'kkmr12345', NULL, 3, 1, NULL, NULL, '2025-01-16 22:29:14', NULL, 0, 0, '2025-01-16 22:29:14', '2024-08-21 04:39:18'),
(16, 2, 0, 0, 0, NULL, 'TULLU KUMAR YADAV', 'SAROJ@123', '7050295341', NULL, '$2y$10$o5/wutWlmdmuRk82k85xR.33rBNfk/y.LtymLNS9Rg/qVxLl4YELu', 'SAROJ123', NULL, 3, 1, NULL, NULL, '2025-01-16 17:29:10', NULL, 0, 0, '2025-01-16 17:29:10', '2024-08-21 04:39:18'),
(17, 2, 0, 0, 0, NULL, 'UJJAL KUMAR PRASAD', 'UJJWAL.MORNING@NNHP', '7099673281', NULL, '$2y$10$AKuH.q7mFMi.6hBam43CyeasjKn9dxzsNC6ZhBhaEMk3uve70xgM6', '4xtzrj?', NULL, 3, 0, NULL, NULL, NULL, NULL, 0, 0, '2025-01-10 04:53:31', '2024-08-21 04:39:18'),
(18, 2, 0, 0, 0, NULL, 'BIKASH KALITA', 'Bikash@night', '9101563054', NULL, '$2y$10$4mWLj9el7SbJG3Af36fvYOB/Gxdr9RDn5gH2ybiqQpVtyUkb5Kj7q', 'Bikash@326', NULL, 3, 1, NULL, NULL, '2025-01-16 17:27:24', NULL, 0, 0, '2025-01-16 17:27:24', '2024-08-21 04:39:18'),
(19, 1, 0, 0, 0, '0011', 'Vikas Jha', 'vikasjha@haridwar', '343434343', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, 'LopCMFmxy7hIX8VXWxXz8cggYPll3S3SpEHwVCySwtb8VkiJX2DCr8N6sFqj', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-15 16:59:18', 1, 0, 0, '2025-01-15 04:29:33', NULL),
(20, 3, 0, 0, 2, '0011', 'Vikas Jha', 'guwahati@admin', '343434343', 'ss', '$2y$10$m3VTIYgN3sL7TwKxIzrgWOsl4ktyreYetipbyRnAjSWnqyTZ6YHaO', 'admin@321', '', 2, 1, '3LCc3JoFCX7ZzivxzI3oqyA7g7ScWleNWgvj0r3xe2zhcavmo1AWjNjG7E9g', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-16 20:20:38', 1, 0, 0, '2025-01-16 09:13:29', '2024-08-27 03:34:10'),
(21, 3, 0, 0, 2, NULL, 'MAHEK BAGUM', 'NIJARA@MORNING', '7896938494', NULL, '$2y$10$A7BMNTylcRCTcEDwaMlSaumT.QANwbp1K7EUVdlzc2dsRMjPJ6Voe', 'MAHEK786', NULL, 3, 1, NULL, NULL, '2024-08-30 17:24:38', NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-27 03:34:10'),
(22, 3, 0, 0, 2, NULL, 'RAHUL  SAHA 2', 'PRASENJIT@NIGHT', '9387858724', NULL, '$2y$10$1YfDUxuX9IVLQToUDzmwuuGwiGBLXHuf8u04jmSdspMqQEN2nrEX6', 'PRASENJIT123', NULL, 3, 1, NULL, NULL, '2024-11-22 06:21:23', NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-27 03:34:10'),
(23, 3, 0, 0, 2, NULL, 'RAHUL SAHA', 'rahul@night', '8720915542', NULL, '$2y$10$z7gh4nzDNWqYJOEsUN5PdOwonsYSUCh22fZYS0Hr0EPWIr9ZusxCu', 'RAHUL12345', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-27 03:34:10'),
(24, 3, 0, 0, 2, NULL, 'UJJAL KUMAR PRASAD', 'UJJWAL@NNHP', '7099673281', NULL, '$2y$10$mDt26BVLWtvNorLxKCnXy.wr75fAzH6ZeaM/F2QjazeVfmwN023Xu', '@UJJWAL36', NULL, 3, 1, NULL, NULL, '2024-11-14 09:49:22', NULL, 0, 0, '2024-12-27 15:43:22', '2024-08-27 03:34:10'),
(25, 2, 0, 0, 0, NULL, 'DHIRAJ SINGH', 'Dhiraj@night', '9001478348', NULL, '$2y$10$bLJ1y4lOFApDM4NvWtUOs.krPcoxvcvWPcYDhWji0MzDW8H5BuvGS', 'dhiraj1123', NULL, 3, 0, NULL, NULL, '2024-08-27 16:53:43', NULL, 0, 0, '2025-01-10 04:53:06', '2024-08-27 04:31:02'),
(26, 3, 0, 0, 0, NULL, 'DHIRAJ SINGH', 'Dhiraj@guwahati.lounge', '9001478348', NULL, '$2y$10$U.gJs0KxJsDkuePd1l7JweM32/ZitLDh2ar8h8gUciCw2YC8NvnZe', 'dhiraj@1123', NULL, 3, 1, NULL, NULL, '2025-01-14 04:22:03', NULL, 0, 0, '2025-01-14 04:22:03', '2024-08-27 04:42:36'),
(27, 2, 0, 0, 0, NULL, 'TULLU KUMAR', 'Tullu@guwahati.lounge', '6009377479', NULL, '$2y$10$4IFpGJpOVl2Du0WxhIxZaOIA7f8F4Y1qXJ3JItApJWggx88yK89ee', 'tullu@123', NULL, 3, 0, NULL, NULL, '2024-12-06 17:14:15', NULL, 0, 0, '2025-01-10 04:53:00', '2024-08-27 16:58:33'),
(28, 1, 0, 0, 0, NULL, 'Vipin', 'vghawry@gmail.com', '9068253064', NULL, '$2y$10$EW5KJJpU74IwinQwKHh0TeH34M1ASbAGvcspOrjc8QAetgrL92Crm', 'Vipin@', NULL, 3, 1, NULL, NULL, '2025-01-16 20:54:23', NULL, 0, 0, '2025-01-16 20:54:23', '2024-08-29 07:00:59'),
(29, 1, 0, 0, 0, NULL, 'Atul', 'atul@gmail.com', '7900612576', NULL, '$2y$10$tnoHfR5WCYKI7x6yMRtAFOGLWozSNXcL6MsGl8MdfUVXX/DI3Repu', 'Atul@nnhp', NULL, 3, 1, NULL, NULL, '2025-01-16 08:18:49', NULL, 0, 0, '2025-01-16 08:18:49', '2024-08-29 07:03:44'),
(30, 1, 0, 0, 0, NULL, '10To12 Canteen', '10to12@gmail.com', '111111111', NULL, '$2y$10$RAYFkYNeQw9UUI2s9NuswusEi0rkN4dFFBYgnSlJkR/GWnB9BUsUG', '22to24@', NULL, 3, 1, NULL, NULL, '2025-01-16 04:55:03', NULL, 0, 0, '2025-01-16 04:55:03', '2024-08-31 03:16:56'),
(31, 2, 0, 0, 0, NULL, 'TULLU KUMAR YADAV', 'Tullu@executive.lounge', '6009377479', NULL, '$2y$10$VPFhi4dC6yX6wKFAaczixe3wR2f37hpkMQt1PXrh94i.2TzO0rpT2', 'tullu@12345', NULL, 3, 0, NULL, NULL, '2024-10-06 17:36:55', NULL, 0, 0, '2025-01-11 04:25:27', '2024-08-31 18:59:24'),
(32, 4, 0, 0, 0, '0014', 'Devendra', 'devendra@demo', '7088262941', 'Shivalik Nagar', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, 'f6dGlbzFkhpkoXhOqlaVMOQvbZIkqYf7Mo5Zvuhj51scaTVb6eKtMF5qZUhg', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-04 20:05:19', 0, 0, 0, '2025-01-04 07:44:54', NULL),
(33, 4, 0, 0, 0, NULL, 'Devendra as Oprater', 'oprater@demo', '7088262941', NULL, '$2y$10$.BBFhZ38DgDwF4bbJIF9Gu1ZLA9chod/ypBA2a.BYJuw.6J6FpdnW', 'Demo@135', NULL, 3, 1, NULL, NULL, '2024-09-12 08:02:23', NULL, 0, 0, '2024-12-27 15:43:22', '2024-09-08 02:10:38'),
(34, 2, 0, 0, 0, NULL, 'APARNA DAS', 'aparna@canteen', '8473981556', NULL, '$2y$10$BxtmJJetfDiZxtT3/84EQe81shDBVj1yJxQVCNqD.y3CytusZrNt.', 'aparna123', NULL, 3, 0, NULL, NULL, '2025-01-01 17:50:49', NULL, 0, 0, '2025-01-10 04:52:39', '2024-09-09 01:53:20'),
(35, 2, 0, 0, 0, NULL, 'KANHAIYA JHA', 'kanhaiya@canteen', '9085835680', NULL, '$2y$10$5glQsl0hac7pqPDH7raOMOloMK/AsSbxx4CEEv4B8kyf7D4AlK3My', 'kanhaiya123', NULL, 3, 1, NULL, NULL, '2025-01-13 23:29:07', NULL, 0, 0, '2025-01-13 23:29:07', '2024-09-09 04:13:23'),
(36, 3, 0, 0, 0, NULL, 'GOVIND KUMAR', 'GOVIND@CANTEEN', '7250092382', NULL, '$2y$10$V5iZmmgLAL9Q/nRXN4wRqexWLxuNZYHseSTIUhJ8LMO8r42xm97Zq', 'GOVIND123', NULL, 3, 1, NULL, NULL, '2025-01-15 16:59:14', NULL, 0, 0, '2025-01-15 16:59:14', '2024-10-02 10:45:59'),
(37, 3, 0, 0, 0, NULL, 'SHOHAN YADAV', 'SOHAN@CANTEEN', '9128424878', NULL, '$2y$10$n8liK.Js/t/1HxlsAqeWFesoW7oBohQ2yl.Seg6wYeuzHS4lZNVIa', 'SOHAN123', NULL, 3, 1, NULL, NULL, '2025-01-16 16:12:11', NULL, 0, 0, '2025-01-16 16:12:11', '2024-10-02 10:47:26'),
(38, 5, 0, 0, 0, '0011', 'Admin SecalgoTech', 'admin@secalgotech', '8146452545', 'Amritsar', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, 'qKihKKO8dbrZGD2OidgT6vK1bMn7IrUVq75kUZOVYWbeKnXYnIKvRWt32lCl', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-16 05:16:53', 2, 0, 0, '2025-01-16 05:16:53', NULL),
(39, 3, 0, 0, 0, NULL, 'BIJOY MANDAL', 'Bijoy@guwahatilounge', '8724935496', NULL, '$2y$10$h27jx7qmyPqwTPMYQ5bGve2xLkNY.EASqcKqCl7IioIEyRc8xQ8PO', 'bijoy@123', NULL, 3, 1, NULL, NULL, '2025-01-16 22:30:26', NULL, 0, 0, '2025-01-16 22:30:26', '2024-11-16 16:48:28'),
(40, 5, 0, 0, 0, NULL, 'Gaurav jeet', 'gauravjeet@gmail.com', '9306629211', NULL, '$2y$10$l7MpTr1VjkVUzXsmeNKRIe7UJzRiiByrSLYmC3r310mQ6K.2Zzn6.', 'Gaurav@8091', NULL, 3, 1, NULL, NULL, '2025-01-12 23:23:17', NULL, 0, 0, '2025-01-12 23:23:17', '2024-11-17 18:50:39'),
(41, 5, 0, 0, 0, NULL, 'Vishal', 'vishal@sec', '999999999', NULL, '$2y$10$bLc8sw6EXbaAJo2ml6S//eYjFDKwa14rth02POxYnkGili9LM1Njy', 'Vishal@sec', NULL, 3, 1, NULL, NULL, '2024-11-18 01:27:08', NULL, 0, 0, '2025-01-16 05:57:43', '2024-11-17 19:05:46'),
(42, 0, 0, 1, 0, '0011', 'Admin Canteen', 'admin', '343434343', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, '04UlJI5PA4LdFWBnERMFYC78iLHCYdjl9T2Vhqf8LGcOHCRrXMMERq3Tw8pY', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2024-11-30 01:34:30', 1, 0, 0, '2024-12-27 15:43:22', NULL),
(43, 1, 1, 0, 0, '0011', 'Admin', 'admin', '343434343', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 1, 1, 'cJTOCCPG1EbFPdc0QomvxsxdHmAc12XBWA2OrAkPLVfnBW9hntwkt2kZw6FL', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2019-09-24 13:30:29', NULL, 0, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(44, 6, 13, 0, 0, '0011', 'Admin Haridwar', 'admin@haridwar', '7351334717', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, 'oFlMsthNlWga7i0Cgh5HdHnlYSJ69YNRpoWSsWYLpzgxYeWPMnvqtwmlwDay', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-14 17:06:16', 2, 0, 0, '2025-01-14 17:06:16', '2024-12-25 02:20:56'),
(45, 6, 21, 0, 0, NULL, 'Avdhesh', 'avdhesh8146@gmail.com', '8146452545', NULL, '$2y$10$JOlNTilIO5CZPTiIs85WhO9MUkYMXTh.qXdOKZb.Tel29XMiAE5Qa', '1982', NULL, 2, 1, NULL, NULL, NULL, 2, 0, 0, '2025-01-04 13:05:23', '2024-12-25 02:20:56'),
(46, 6, 22, 0, 0, NULL, 'Ajay', 'ajay11@gmail.comTest', '9708011012', NULL, '$2y$10$RaPj2Kvul8iIX1CF4B6zcenDzjaqFCLBM4zjemlI6.4JZf.782AEuTest', '73229', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(47, 6, 23, 0, 0, NULL, 'Shashi kant ray', 'shashikantppr@gmail.com', '7273804252', NULL, '$2y$10$/tprja0JbK3.Q.9ZWe056eBQu4N/VZe5Hc93inhIB8MLrhW1ft0dS', 'sas@123', NULL, 3, 1, NULL, NULL, '2025-01-16 17:27:31', NULL, 0, 0, '2025-01-16 17:27:31', '2024-12-25 02:20:56'),
(48, 6, 24, 0, 0, NULL, 'Ajay', 'ajaytest@gmail.com', '9708011014', NULL, '$2y$10$RaPj2Kvul8iIX1CF4B6zcenDzjaqFCLBM4zjemlI6.4JZf.782AEu', '73229', NULL, 4, 1, NULL, NULL, NULL, NULL, 29, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(49, 6, 25, 0, 0, NULL, 'Suresh Rai', 'sureshrai@gmail.com', '9546994034', NULL, '$2y$10$JOlNTilIO5CZPTiIs85WhO9MUkYMXTh.qXdOKZb.Tel29XMiAE5Qa', '1982', NULL, 2, 1, NULL, NULL, NULL, 2, 0, 0, '2025-01-04 13:05:26', '2024-12-25 02:20:56'),
(50, 6, 26, 0, 0, NULL, 'Tushar Lodhi', 'lodhitushar187xxx@gmail.com', '9548138438', NULL, '$2y$10$GbtMIz.snvC7FXMsHcSgW.dwSYqyI.sc8zrikfUU.5y465PIjHTGW1212121', 'tushar187', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(51, 6, 27, 0, 0, NULL, 'pushpendra kumar', 'push@8989Test', '9760008989', NULL, '$2y$10$60uoNmx.NJ0hJO3hGc1y1uelp7hyc73aAwD9xXDrs5J0NGgupwQhWTest', 'Push@976000', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(52, 6, 28, 0, 0, NULL, 'Chandan Kumar', 'chandankumar@gmail.com', '7840015457', NULL, '$2y$10$R/sQvqt0XqNUVcsyEUeFa.7OeoIUwymypTnGkd.NrWZBJTqu4mvcq', 'Chandan@78400', NULL, 3, 1, NULL, NULL, '2025-01-16 05:37:07', NULL, 0, 0, '2025-01-16 05:37:07', '2024-12-25 02:20:56'),
(53, 6, 29, 0, 0, NULL, 'Ashok Kumar', 'kashok24845@gmail.com', '8226967237', NULL, '$2y$10$ARcWSqZ58bEow0IrGu2zQOpN6Ib8JSKmXGz77SsO6cwEeNxCK509i', '8226@Ashok', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2024-12-27 15:43:22', '2024-12-25 02:20:56'),
(54, 7, 19, 0, 0, '0011', 'Chandigarh Admin', 'chandigarh@admin', '8146452545', 'chandigarh', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 1, '3Ly3yIMQVkdD5onG74p86jaCTgyMLmUpwfhci09SgMR1BdSCcutziC9W9Y6L', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-10 14:43:18', 2, 0, 0, '2025-01-10 14:43:18', '2025-01-05 01:52:13'),
(55, 7, 21, 0, 0, NULL, 'Rohit Kumar', 'rohit@railway', '9523153306', NULL, '$2y$10$LT8Pn9P4wfXQMilPn/u93u5ZEi2I5aV0KRfbtZUyRwwyy.5HNIwDa', '7544939388', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2025-01-04 13:27:32', '2025-01-05 01:52:13'),
(56, 7, 22, 0, 0, NULL, 'Subhash Yadav', 'subhash@railwayTest', '8920050096', NULL, '$2y$10$EnY9gBfygJfRuq8qdqZtWOR16L.eK8CkpJah.2pvTFr7EgJ09krQyTest', '844504', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2025-01-04 13:27:37', '2025-01-05 01:52:13'),
(57, 7, 28, 0, 0, NULL, 'Uday Shankar Ray', 'uday@railway', '9821369736', NULL, '$2y$10$mkRfhQ4TeuIo9Dwwk1pVEusof9BZnCsVbaPzpBVWn8tmpd8i9b09S', 'Uday9821', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2025-01-04 13:28:25', '2025-01-05 01:52:13'),
(58, 7, 29, 0, 0, NULL, 'Arun Kumar', 'arun@railway', '999999999', NULL, '$2y$10$afLWj40VnGmYM5UAPTW25.4mOj7CXm8KqbQeyi5n7mAgVxxkCcMnO', 'Arun@99', NULL, 3, 1, NULL, NULL, '2025-01-05 02:10:30', NULL, 0, 0, '2025-01-05 02:10:30', '2025-01-05 01:52:13'),
(59, 7, 30, 0, 0, NULL, 'Pavan', 'pavan@railway', '919669160431', NULL, '$2y$10$dZjRKZPu5EUYOc7k6u1PsewiLh3jkYZcFYXmwfL9.dP5CY92ixYXy', 'Pavan@60431', NULL, 3, 1, NULL, NULL, NULL, NULL, 0, 0, '2025-01-04 13:27:45', '2025-01-05 01:52:13'),
(60, 7, 31, 0, 0, NULL, 'Abhimanyu', 'Abhimanyu@cloakroom', '9264246188', NULL, '$2y$10$YSvg8kJg03vS2GwsO/WyA.YVu/67W4ufC0jfmZJvv6dkYGpm6mniW', 'abhimanyu@cdg', NULL, 3, 1, NULL, NULL, '2025-01-14 20:46:33', NULL, 0, 0, '2025-01-14 20:46:33', '2025-01-05 01:52:13'),
(61, 8, 19, 0, 0, NULL, 'RAVI', 'DIWAKAR@500', '8474901390', NULL, '$2y$10$9dxSY50ixor5k.uyz5yQj.Qf0QuStiDRQT7/r2iVImggrqsHebfDG', 'Raju@8969', NULL, 3, NULL, NULL, NULL, '2024-10-27 07:00:58', NULL, 0, 0, '2025-01-16 11:50:02', '2025-01-17 00:18:02'),
(62, 8, 24, 0, 0, NULL, 'Rohit Kumar', 'Rohit@mbd', '917088760382', NULL, '$2y$10$6xMuHsOwTpxlyvQNPVPTwOPgp9FjHctGf2nz2.2q.B9dbiAvhOUQG', 'Ro7088mbd', NULL, 3, NULL, NULL, NULL, '2025-01-16 19:07:53', NULL, 0, 0, '2025-01-16 11:50:59', '2025-01-17 00:18:02'),
(63, 8, 25, 0, 0, NULL, 'Raju Kumar', 'rjuraju2002@gmail.com', '8969804154', NULL, '$2y$10$ZlLLjWNaI1X3l.76s0nGcegcq/XGzIfi6IB6w4MaYPEfk4bDmc//e', 'Rajuboss', NULL, 3, NULL, NULL, NULL, '2024-11-03 07:02:34', NULL, 0, 0, '2025-01-16 11:50:48', '2025-01-17 00:18:02'),
(64, 8, 16, 0, 0, NULL, 'SANTOSH KUMAR', 'santosh@ayd', '918222877467', NULL, '$2y$10$Wx5M7OIc.2K44sTZxkhC/.54bZF0orEtFnr/oGq2QmZSYeYC5/mXG', 'santoshup', NULL, 3, NULL, NULL, NULL, '2025-01-16 19:03:03', NULL, 0, 0, '2025-01-16 11:50:38', '2025-01-17 00:18:02'),
(65, 8, 1, 0, 0, '0011', 'Admin12', 'admin112', '7351334717', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'sample', '', 1, 0, 'h2lSt7YkaSl2DzXQub3QecyvRI9St9N5kLaZxWUnaMVUyd34NxsiMGqns0yR', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2019-09-24 13:30:29', NULL, 0, 0, '2025-01-16 11:50:26', '2025-01-17 00:18:02'),
(66, 8, 13, 0, 0, '0011', 'Moradabad Admin', 'moradabad@admin', '8146452545', 'ss', '$2y$10$iazMmCMkeuUfjonUiQTLXuPHfTwxc/i/b/xLtqYP1dO4Q1m0z1hHe', 'R@jnee$h@135', '', 2, 0, 'ge7d9fe62DpdKBBhSlSHO2yUk7cTNwElaL0ybZn5aOh9CEHxuX6uDwvtXk5K', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2025-01-12 14:35:14', NULL, 0, 0, '2025-01-16 11:49:47', '2025-01-17 00:18:02'),
(67, 9, 21, 0, 0, '0011', 'Shri Admin', 'shri@admin', '8146452545', 'ss', '$2y$10$m6OJfIAp11mqieShJG1X9uu.LuyNLR4o./TKk5iHse3eCXYnGMfoi', 'dipanshu@135', '', 2, 0, '5xnUVmtWNKmCPCJNQumTdP48MRCoRhtLpU26eZ2WvsDJhJ2nSpFukYoTlKBN', '$2y$10$AqNLf6dmiAbUrs71HfIV0.7Qk/rCZsi6mRbtUJuwELDLsBYFItlYW', '2019-09-24 13:30:29', NULL, 0, 0, '2025-01-16 11:50:14', '2025-01-17 00:18:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_services`
--
ALTER TABLE `client_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `services_id` (`services_id`,`client_id`);

--
-- Indexes for table `g_canteen_items`
--
ALTER TABLE `g_canteen_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canteen_id` (`canteen_id`),
  ADD KEY `client_id` (`client_id`,`added_by`);

--
-- Indexes for table `g_canteen_item_stocks`
--
ALTER TABLE `g_canteen_item_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `canteen_id` (`canteen_id`,`canteen_item_id`),
  ADD KEY `client_id` (`client_id`,`added_by`);

--
-- Indexes for table `g_daily_entries`
--
ALTER TABLE `g_daily_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`,`canteen_id`,`unique_id`,`added_by`);

--
-- Indexes for table `g_daily_entry_items`
--
ALTER TABLE `g_daily_entry_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`,`canteen_item_id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_token`
--
ALTER TABLE `login_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `users` ADD FULLTEXT KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `client_services`
--
ALTER TABLE `client_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `g_canteen_items`
--
ALTER TABLE `g_canteen_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `g_canteen_item_stocks`
--
ALTER TABLE `g_canteen_item_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `g_daily_entries`
--
ALTER TABLE `g_daily_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `g_daily_entry_items`
--
ALTER TABLE `g_daily_entry_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `login_token`
--
ALTER TABLE `login_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
