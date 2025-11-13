-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 10:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pw2_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_12_212925_create_products_table', 1),
(5, '2025_11_12_215156_create_personal_access_tokens_table', 1),
(6, '2025_11_12_221854_add_role_to_users_table', 2),
(7, '2025_11_12_222339_add_user_id_to_products_table', 3);

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
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'api', 'dea63598e77d5a9041183541473caa00c7c14f8e4756aa7198de5b31c8ea5049', '[\"*\"]', NULL, NULL, '2025-11-12 14:57:07', '2025-11-12 14:57:07'),
(2, 'App\\Models\\User', 1, 'api', '8b2e5fffed68f0627d764e295c8172eb9e8cd653a8c2fa1a8fa473bce360f6fe', '[\"*\"]', '2025-11-12 14:57:37', NULL, '2025-11-12 14:57:36', '2025-11-12 14:57:37'),
(3, 'App\\Models\\User', 2, 'api', '3bf04f88bf6a47a7c201f7b5c39ad30527515b3acdac4b749ebf266e893014f8', '[\"*\"]', NULL, NULL, '2025-11-12 14:59:08', '2025-11-12 14:59:08'),
(4, 'App\\Models\\User', 2, 'api', 'b43093ff4742f72c6af69c650ca437eee97bfbf2dd486ab718334a8a20a1d156', '[\"*\"]', '2025-11-12 14:59:24', NULL, '2025-11-12 14:59:23', '2025-11-12 14:59:24'),
(5, 'App\\Models\\User', 3, 'api', '6f329ac2a04a196af7d11cd43fd86d8fdbae1321c4f76aededd07af66cbbb8da', '[\"*\"]', '2025-11-12 14:59:50', NULL, '2025-11-12 14:59:49', '2025-11-12 14:59:50'),
(6, 'App\\Models\\User', 3, 'api', 'd8fad6039ab58ea8004cb7b2f750976e7778af3d49943907ea1629484bf1db54', '[\"*\"]', NULL, NULL, '2025-11-12 15:02:33', '2025-11-12 15:02:33'),
(7, 'App\\Models\\User', 3, 'api', '9c6c19e425885be1b0a9e15e0eceb2b7f6de87387c66b6f3b6f9d99f44940cb2', '[\"*\"]', NULL, NULL, '2025-11-12 15:02:47', '2025-11-12 15:02:47'),
(8, 'App\\Models\\User', 3, 'api', 'fafb6fc67b0eb6bc32e965289b67dce363c18ca9d0e3f9862a6d9ec3db68a834', '[\"*\"]', NULL, NULL, '2025-11-12 15:03:50', '2025-11-12 15:03:50'),
(9, 'App\\Models\\User', 3, 'api', 'd6c6fa5abc68e02afe82ec2d53a32d549014012621244ce3ba7479f0e73d6ad7', '[\"*\"]', '2025-11-12 15:11:24', NULL, '2025-11-12 15:04:24', '2025-11-12 15:11:24'),
(10, 'App\\Models\\User', 3, 'api', '5e8b5b6dc668c089f6c0304d33cfed970beedb25a5085ccdb804979b87f424ee', '[\"*\"]', NULL, NULL, '2025-11-12 15:11:46', '2025-11-12 15:11:46'),
(11, 'App\\Models\\User', 3, 'api', '8caddad78482bda47cd344314f826628952cd76c6fdee128777ab4cd8dea5fc2', '[\"*\"]', NULL, NULL, '2025-11-12 15:12:01', '2025-11-12 15:12:01'),
(12, 'App\\Models\\User', 4, 'api', '7d953a46c23fe116ff0ae441b6435a081c263843d5ea8cbfe711faff909672b7', '[\"*\"]', NULL, NULL, '2025-11-12 15:12:48', '2025-11-12 15:12:48'),
(13, 'App\\Models\\User', 4, 'api', '6919444e37ccb65484b17b8a58ceaf5f0214bb09bc9d424da3dce81dfe312f74', '[\"*\"]', '2025-11-12 15:15:07', NULL, '2025-11-12 15:13:43', '2025-11-12 15:15:07'),
(14, 'App\\Models\\User', 3, 'api', 'c4628d02d1729adf31fce2380945790452c6d6c6740ee3c8244d705c7b858e77', '[\"*\"]', '2025-11-12 15:27:08', NULL, '2025-11-12 15:15:25', '2025-11-12 15:27:08'),
(15, 'App\\Models\\User', 5, 'api', '49568c2180f79f404f96067f04f0b835b002fe81b0b08f303269655d5d22daa6', '[\"*\"]', '2025-11-12 15:38:38', NULL, '2025-11-12 15:30:37', '2025-11-12 15:38:38'),
(16, 'App\\Models\\User', 3, 'api', '6b36e298aaed420c16e2e789020ed5e3df3dd76804a3e3a66d63095ff8ce1cfc', '[\"*\"]', '2025-11-12 15:42:20', NULL, '2025-11-12 15:41:29', '2025-11-12 15:42:20'),
(17, 'App\\Models\\User', 3, 'api', 'aa2f13328ddc5fd7b576e265e2c4811ce5336faedc79b5bc76db81c863a9efae', '[\"*\"]', NULL, NULL, '2025-11-12 15:54:10', '2025-11-12 15:54:10'),
(18, 'App\\Models\\User', 4, 'api', '82d63a042e87587dfb6c90013b466f7c341b49e918dabcee67c6805d2620ff83', '[\"*\"]', NULL, NULL, '2025-11-12 15:54:30', '2025-11-12 15:54:30'),
(19, 'App\\Models\\User', 6, 'api', '3bc7e8039a9c6541ba750614012fa2d38b117e3c79fd2800ac3797382e9ec8e3', '[\"*\"]', NULL, NULL, '2025-11-12 15:55:03', '2025-11-12 15:55:03'),
(20, 'App\\Models\\User', 6, 'api', '1b9460fbf59dac6a89e9f9f4a4492ab4695b32da4f98c0d1b2d1a15bf8c2ac91', '[\"*\"]', '2025-11-12 15:58:10', NULL, '2025-11-12 15:56:49', '2025-11-12 15:58:10'),
(21, 'App\\Models\\User', 3, 'api', '9704181d8a2278893280c5fdbf548d8feadfd10b13f0304be1e146ea2a19c9a0', '[\"*\"]', '2025-11-12 15:58:25', NULL, '2025-11-12 15:58:24', '2025-11-12 15:58:25'),
(22, 'App\\Models\\User', 6, 'api', 'af3239e3d3617c20ce0035da5e24163e64c7e8104e393b86ab759a6af60b7a1a', '[\"*\"]', '2025-11-12 15:58:43', NULL, '2025-11-12 15:58:42', '2025-11-12 15:58:43'),
(23, 'App\\Models\\User', 5, 'api', 'b6a19c55f79d57e5d6b720a7245f9baca1070b660240d6892294707a25262136', '[\"*\"]', NULL, NULL, '2025-11-12 15:59:03', '2025-11-12 15:59:03'),
(24, 'App\\Models\\User', 5, 'api', 'f6f4ffe8709c036531334b4f543714375dfab1fe05c5c1af5d48fbc8993bd139', '[\"*\"]', NULL, NULL, '2025-11-12 16:01:16', '2025-11-12 16:01:16'),
(25, 'App\\Models\\User', 5, 'api', '981a8124fe42f6cc95ad7f024592294e611913abfc7613f0246c44b9a98ab921', '[\"*\"]', '2025-11-12 16:03:16', NULL, '2025-11-12 16:03:15', '2025-11-12 16:03:16'),
(26, 'App\\Models\\User', 5, 'api', '0ca681b493cf7a8e742a0aaf23c9d09ba5d87d524e253e8b7943976c898d70ff', '[\"*\"]', '2025-11-12 16:05:33', NULL, '2025-11-12 16:04:08', '2025-11-12 16:05:33'),
(27, 'App\\Models\\User', 7, 'api', 'b95744e72920457a3e3c2f391facfe049a843d55ac5e377d2caee2012298fa6e', '[\"*\"]', NULL, NULL, '2025-11-12 16:24:32', '2025-11-12 16:24:32'),
(28, 'App\\Models\\User', 7, 'api', '748f674ad1c59abea0c3bd73b23ebe0759ce58d78e868e8763b090740ca0eed1', '[\"*\"]', '2025-11-12 16:31:29', NULL, '2025-11-12 16:27:50', '2025-11-12 16:31:29'),
(29, 'App\\Models\\User', 7, 'api', 'd11a242745edbcbbb5c9c3093ed3c826692299ba1df8004259d50f313c169c41', '[\"*\"]', '2025-11-13 01:56:52', NULL, '2025-11-12 16:31:56', '2025-11-13 01:56:52'),
(30, 'App\\Models\\User', 7, 'api', '2e51d46fd80cb5ff19ce816b3b4518c1b8319327a9be68c246c9d80ea8498397', '[\"*\"]', '2025-11-12 17:07:49', NULL, '2025-11-12 16:34:23', '2025-11-12 17:07:49'),
(32, 'App\\Models\\User', 7, 'api', '0c988d1f893f7be9c04431183efc9dba2be3b2baa506806be2e4815b1d10ee54', '[\"*\"]', '2025-11-13 01:54:12', NULL, '2025-11-13 01:44:44', '2025-11-13 01:54:12'),
(33, 'App\\Models\\User', 5, 'api', '8c291ead3d233bc8dca445e5991c36737c452669c4d4ebb090d0bcb31bb8c443', '[\"*\"]', '2025-11-13 01:58:33', NULL, '2025-11-13 01:58:32', '2025-11-13 01:58:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stock`, `created_at`, `updated_at`, `user_id`) VALUES
(3, 'Laptop', 10000000.00, 3, '2025-11-12 16:29:35', '2025-11-12 16:32:01', 7),
(4, 'Monitor', 1000000.00, 6, '2025-11-12 16:35:19', '2025-11-13 01:56:51', 7);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('R4NM9jYT1wiYQMPYRMIuqwUnjzRlDisrIATtNRiO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFNSNGZ6dEdVWTlqNGp4VXBQVlJkam5sQ0RaWWRlZktwa3NpMzZPNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762984671),
('ROKWqNszc12ducoRD59ZaJJ0WINlZHm7qUzf4RTo', NULL, '127.0.0.1', 'PostmanRuntime/7.50.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGRGS2tOZkJKVlIwUU1wamhWUXRSZFVSb3lzRWZZVjRncW83blJUTiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763023791);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(5, 'Admin Demo', 'admin@example.test', 'admin', NULL, '$2y$12$QEQ3yEiLdiPiL/TptioyI..S.6IY/5e6ZphtNS9/wIVkhJ/86JRca', NULL, '2025-11-12 15:21:10', '2025-11-12 15:21:50'),
(7, 'Yuri Tri Wibowo', 'yuritriwibowo@gmail.com', 'user', NULL, '$2y$12$Mo5JGX21NZRF0DDbb/.7Bu3qeRZwklNKRSESJv5lR8o6g3wwpACB2', NULL, '2025-11-12 16:24:08', '2025-11-12 16:24:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
