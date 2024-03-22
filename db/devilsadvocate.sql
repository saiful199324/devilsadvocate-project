-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for devilsadvocate
CREATE DATABASE IF NOT EXISTS `devilsadvocate` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `devilsadvocate`;

-- Dumping structure for table devilsadvocate.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.addresses: ~0 rows (approximately)
INSERT INTO `addresses` (`id`, `user_id`, `address`, `created_at`, `updated_at`) VALUES
	(1, 12, 'Mirpur,Dhaka', '2024-03-22 03:03:45', '2024-03-22 03:03:45'),
	(2, 12, 'Savar,Dhaka', '2024-03-22 03:03:45', '2024-03-22 03:03:45'),
	(3, 1, 'Mirpur,Dhaka', '2024-03-22 10:13:38', '2024-03-22 10:13:38'),
	(4, 1, 'Bhola, Barishal', '2024-03-22 10:13:38', '2024-03-22 10:13:38'),
	(5, 2, 'Mirpur,Dhaka', '2024-03-22 10:13:52', '2024-03-22 10:13:52'),
	(6, 2, 'Savar,Dhaka', '2024-03-22 10:13:52', '2024-03-22 10:13:52'),
	(7, 3, 'Mirpur,Dhaka', '2024-03-22 10:15:33', '2024-03-22 10:15:33'),
	(8, 3, 'Bhola, Barishal', '2024-03-22 10:15:33', '2024-03-22 10:15:33');

-- Dumping structure for table devilsadvocate.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table devilsadvocate.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2024_03_21_051810_create_addresses_table', 1),
	(7, '2024_03_22_042157_create_sessions_table', 1);

-- Dumping structure for table devilsadvocate.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table devilsadvocate.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table devilsadvocate.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('Cl0qYlilTm4ujb0rNQMl5xKEqukDUDWdrOCrnI8F', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWTJxREhsbGJ1NWJvdTBKdTdWVGFiU2FtdVp1blpXeWRDdUZwckN5bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly9kZXZpbHNhZHZvY2F0ZS50ZXN0L3VzZXJzLzIvZWRpdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTIkbHE1T3Fjb3lTd1dlQ2dTajNqMTJrdWJEb2M1WS5Sek5KdFZiM2lyL215TjAvay95UDN1WUciO30=', 1711124227),
	('ePQogBWmtuMhEJlXJYk44GNscvS7jg3MEuGaEKrR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmJ2R2NMNWZETEV4VVVjTFo0NlZUR2ZGbDVsUDZ4UVNvVzNkMUs0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly9kZXZpbHNhZHZvY2F0ZS50ZXN0L2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1711122496),
	('OcTk71yakDXDGR5yuQd0zZX1IQ2dKWUlZNLeyEmD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:124.0) Gecko/20100101 Firefox/124.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2RzVzQyR2RYc1BsY2pFeXpVYm1NbTBVVHFVY0pJYkdtcFhQSUFlRiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2Rldmlsc2Fkdm9jYXRlLnRlc3QvZGFzaGJvYXJkIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9kZXZpbHNhZHZvY2F0ZS50ZXN0L2Rhc2hib2FyZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1711122495);

-- Dumping structure for table devilsadvocate.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table devilsadvocate.users: ~1 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Md. Saiful Islam Asif', 'cei.developer1@gmail.com', NULL, '$2y$12$lq5OqcoySwWeCgSj3j12kubDoc5Y.RzNJtVb3ir/myN0/k/yP3uYG', NULL, NULL, NULL, NULL, NULL, '202403221613pp.jpg', '2024-03-22 00:28:50', '2024-03-22 10:13:38', NULL),
	(2, 'tuhin', 'tuhin@gmail.com', NULL, '$2y$12$58Jq5mqLzpW9vOl52XGfLuvd4aMsGyKAeeTq.ck5joNsXSpw2PAdG', NULL, NULL, NULL, NULL, NULL, '202403221613pp.jpg', '2024-03-22 00:30:03', '2024-03-22 10:13:52', NULL),
	(3, 'Md. Saiful Islam Prantor', 'molin.dupl.75@gmail.com', NULL, '$2y$12$G5nbyrAOBjYrN6CwnN44uupRP8ELOTcym1AX9RD0zlpCfu37W5aDe', NULL, NULL, NULL, NULL, NULL, '202403221615pp.jpg', '2024-03-22 00:46:06', '2024-03-22 10:15:33', NULL),
	(4, 'Ahmed Emon', 'emon@gmail.com', NULL, '$2y$12$xtvZQ6RU3Um/EzZtbnyo3.A6X1s5t2S4ucIzrKOJZViNsqmB9l5Pq', NULL, NULL, NULL, NULL, NULL, '202403220652pp.jpg', '2024-03-22 00:52:11', '2024-03-22 00:52:11', NULL),
	(5, 'Shakib Al Hasan', 'hasan@gmail.com', NULL, '$2y$12$LGLY3UubNr.gceyrbdR1F.rckgFeb4bYHRBx..ybOyqZoq0CaIWT.', NULL, NULL, NULL, NULL, NULL, '202403220826pp.jpg', '2024-03-22 02:26:16', '2024-03-22 02:26:16', NULL),
	(6, 'Md. Saiful Islam', 'abc@gmail.com', NULL, '$2y$12$9RjhSNcvSOsMibO4Rwb8E.GZB3pYYstXA2iYwMNiAsD1El9TqHXO6', NULL, NULL, NULL, NULL, NULL, '202403220829pp.jpg', '2024-03-22 02:29:41', '2024-03-22 02:29:41', NULL),
	(7, 'Abdul Momen', 'momin@gmail.com', NULL, '$2y$12$0W11nQ8ej5ipLkJvM.SuQ.67NaFEzt8SjO5qLaLQU9bOULwg80TD6', NULL, NULL, NULL, NULL, NULL, '202403220832pp.jpg', '2024-03-22 02:32:07', '2024-03-22 02:32:07', NULL),
	(8, 'tuhin', 'afd@gmail.com', NULL, '$2y$12$j1x9LDHbdKQaDlsuELYh6.0n9GQqkJmzUtbBAjBLjodt3t6XqZdoy', NULL, NULL, NULL, NULL, NULL, '202403220833pp.jpg', '2024-03-22 02:33:57', '2024-03-22 02:33:57', NULL),
	(9, 'Md. Saiful Islam', 'saif@gmail.com', NULL, '$2y$12$1xwGOT8jHnstcP9lJhfqbejE87VZR5fEq/Hf3d3zNtOtDd5U88/Tm', NULL, NULL, NULL, NULL, NULL, '202403220837pp.jpg', '2024-03-22 02:37:44', '2024-03-22 02:37:44', NULL),
	(10, 'Md. Saiful Islam', 'fdsafas@gmail.com', NULL, '$2y$12$TktFAuNyPF87D7yJ7LtHSusfAOv80Aap3GgU/6.gt/xtNFf12IVNa', NULL, NULL, NULL, NULL, NULL, '202403220846pp.jpg', '2024-03-22 02:46:46', '2024-03-22 02:46:46', NULL),
	(11, 'Md. Saiful Islam Prantor', 'prantor@gmail.com', NULL, '$2y$12$oLOtg0jua/EVMPN3Tx/0Puidt12TcwihD9uJz/LEKs5KbrXLk8R3G', NULL, NULL, NULL, NULL, NULL, '202403220850pp.jpg', '2024-03-22 02:50:59', '2024-03-22 02:50:59', NULL),
	(12, 'Md. Saiful Islam', 'arif@gmail.com', NULL, '$2y$12$SD6QSfmz..rgbz/XoW0i6.mUIDyzIacO7zRwWmtKW9lfqMxC1pbV2', NULL, NULL, NULL, NULL, NULL, '202403220903pp.jpg', '2024-03-22 03:03:45', '2024-03-22 03:03:45', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
