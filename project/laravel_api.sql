-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 29, 2024 at 09:29 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(41, '2014_10_12_000000_create_users_table', 1),
(42, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(43, '2019_08_19_000000_create_failed_jobs_table', 1),
(44, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(45, '2024_02_28_130957_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` enum('admin','agent','user') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `photo`, `phone`, `address`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@gmail.com', NULL, '$2y$12$h0moZs/twG49SwlTLlcRhu9NsE11u2ME4TdtqCkgNPAJt0e30xfUa', NULL, NULL, NULL, 'admin', 'active', NULL, NULL, NULL),
(2, 'User', 'user', 'user@gmail.com', NULL, '$2y$12$JY7ENODAHr3kSjBq218Db.Hw6HsFPT4uoaEQr6AkEUBa6I4TFpjyi', NULL, NULL, NULL, 'user', 'active', NULL, NULL, NULL),
(3, 'Dr. Faustino Corwin DDS', NULL, 'chadrick27@example.com', '2024-02-28 09:02:14', '$2y$12$WI.0oCTP.sCUhB2nyhNtMO5twLssHj6OBuN4/3yvyubsjgvcvzcqO', 'https://via.placeholder.com/60x60.png/008811?text=ipsa', '1-820-557-4181', '1934 Caleb Hills\nDooleyville, AZ 84844-6251', 'admin', 'active', '3RVN1Z8xy8', '2024-02-28 09:02:14', '2024-02-28 09:02:14'),
(4, 'Thomas Boyer DDS', NULL, 'smiller@example.com', '2024-02-28 09:02:14', '$2y$12$WI.0oCTP.sCUhB2nyhNtMO5twLssHj6OBuN4/3yvyubsjgvcvzcqO', 'https://via.placeholder.com/60x60.png/00bb11?text=a', '+1.541.884.8441', '2396 Dicki Island Apt. 107\nCruickshankville, TN 92573', 'agent', 'active', 'x5lK4tsyGj', '2024-02-28 09:02:14', '2024-02-28 09:02:14'),
(5, 'Colin Schowalter', NULL, 'gfeeney@example.com', '2024-02-28 09:02:14', '$2y$12$WI.0oCTP.sCUhB2nyhNtMO5twLssHj6OBuN4/3yvyubsjgvcvzcqO', 'https://via.placeholder.com/60x60.png/006666?text=ipsum', '+1.678.759.8574', '260 Ayla Common\nWest Mireille, MI 32030-7207', 'admin', 'inactive', 'qOYgvV0gLc', '2024-02-28 09:02:15', '2024-02-28 09:02:15'),
(6, 'Assunta Simonis', NULL, 'kassulke.cary@example.net', '2024-02-28 09:02:14', '$2y$12$WI.0oCTP.sCUhB2nyhNtMO5twLssHj6OBuN4/3yvyubsjgvcvzcqO', 'https://via.placeholder.com/60x60.png/00bb88?text=tempora', '954.570.7012', '6507 Littel Keys\nNickbury, CA 50581-4974', 'agent', 'active', 'STYD4obvoC', '2024-02-28 09:02:15', '2024-02-28 09:02:15'),
(7, 'Shanie Hegmann', NULL, 'beahan.daryl@example.org', '2024-02-28 09:02:14', '$2y$12$WI.0oCTP.sCUhB2nyhNtMO5twLssHj6OBuN4/3yvyubsjgvcvzcqO', 'https://via.placeholder.com/60x60.png/005511?text=quibusdam', '+1 (262) 591-2324', '452 Lou Roads\nLake Quinton, TX 64326', 'user', 'inactive', 'KwuPDttQ8k', '2024-02-28 09:02:15', '2024-02-28 09:02:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
