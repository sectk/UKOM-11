-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2024 at 05:41 AM
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
-- Database: `ecomerce`
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

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('17ba0791499db908433b80f37c5fbc89b870084b', 'i:2;', 1725503197),
('17ba0791499db908433b80f37c5fbc89b870084b:timer', 'i:1725503197;', 1725503197);

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
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(16, 11, 17, 3, '2024-09-04 19:47:44', '2024-09-04 20:35:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Men', '2024-08-16 21:28:07', '2024-08-17 21:21:14'),
(2, 'Sport', '2024-08-16 23:11:14', '2024-08-16 23:11:14'),
(3, 'Electronic', '2024-08-16 23:40:01', '2024-08-16 23:40:01'),
(4, 'Makeup', '2024-08-17 00:04:52', '2024-08-17 00:04:52'),
(5, 'Women/Men', '2024-08-17 21:19:59', '2024-08-17 21:20:51'),
(6, 'Special', '2024-08-19 06:48:00', '2024-08-19 06:48:00'),
(7, 'Women', '2024-08-21 20:46:46', '2024-08-21 20:46:46');

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
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(7, '2024_08_16_093844_create_categories_table', 2),
(9, '2024_08_17_035242_create_products_table', 3),
(12, '2024_08_18_152622_create_carts_table', 4),
(14, '2024_08_22_025515_add_payment_status_to_orders_table', 6),
(15, '2024_09_02_115704_create_otps_table', 7),
(16, '2024_09_02_122841_create_otps_table', 8),
(17, '2024_09_02_125045_create_otps_table', 9),
(20, '2024_09_02_131430_create_otps_table', 11),
(21, '2024_08_20_133203_create_orders_table', 12),
(22, '2024_09_02_125645_create_otps_table', 12),
(23, '2024_09_05_005611_create_carts_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rec_address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'in progress',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('enditadwi3@gmail.com', '$2y$12$MNfoavxfhjWCD1e89g/CPeKxJnUFYiIuocGSjpnSvbTA.Dmhy6r2.', '2024-09-02 09:18:27');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `image`, `price`, `category`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'SepatuBola', 'Dengan Warna Hitam \r\nUkuran 40 41 42', '1723996863.webp', '4.000.000', 'Sport', '1200', '2024-08-18 09:01:03', '2024-08-18 09:01:03'),
(2, 'CelanaJeans', 'Nikmati gaya kasual yang elegan dengan jeans warna abu ini. Dirancang untuk kenyamanan dan penampilan yang stylish, jeans ini tersedia dalam ukuran L, XL, dan XXL, cocok untuk berbagai bentuk tubuh. Terbuat dari bahan denim berkualitas tinggi, jeans ini menawarkan daya tahan yang baik dan fit yang nyaman. Ideal untuk dipadukan dengan berbagai atasan, menjadikannya pilihan serbaguna untuk berbagai kesempatan.', '1723996950.jpeg', '45.000.000', 'Women', '2', '2024-08-18 09:02:30', '2024-08-18 09:02:30'),
(3, 'Laptop', 'Laptop [Merek/Model] menawarkan performa tinggi dan desain yang ramping, ideal untuk produktivitas dan hiburan sehari-hari. Ditenagai oleh prosesor terbaru dan RAM yang cukup, laptop ini menangani berbagai tugas dengan lancar. Layar [ukuran] inci memberikan tampilan jernih dan tajam, sementara penyimpanan [kapasitas] GB menyediakan ruang yang cukup untuk file dan aplikasi penting. Dengan baterai tahan lama dan konektivitas yang lengkap, laptop ini menjadi pilihan tepat untuk kebutuhan kerja dan hiburan di mana saja.', '1723997030.jfif', '7.000.000', 'Electronic', '300', '2024-08-18 09:03:50', '2024-08-18 09:03:50'),
(4, 'Kaos Putih', 'Kaos putih ini adalah pilihan sempurna untuk gaya kasual sehari-hari. Terbuat dari bahan katun berkualitas, kaos ini menawarkan kenyamanan dan daya tahan. Desainnya yang sederhana dan serbaguna memudahkan pemaduannya dengan berbagai jenis celana atau rok. Dengan potongan yang nyaman dan pas, kaos ini cocok untuk berbagai kesempatan, dari aktivitas santai hingga acara informal.', '1723997104.avif', '149.000', 'Women/Men', '690', '2024-08-18 09:05:04', '2024-08-18 09:05:04'),
(5, 'Print', 'Mesin Print', '1724051746.jpg', '3.000.000', 'Electronic', '34', '2024-08-19 00:15:46', '2024-08-19 00:15:46'),
(6, 'Parfum Gatsby', 'Parfum Pria\r\nwangi tahan lama', '1724076287.jpg', '2.500.000', 'Special', '45', '2024-08-19 07:04:47', '2024-08-19 07:04:47'),
(7, 'Parfum Dasfelix', 'Wangi tahan lama', '1724076365.png', '1.000.000', 'Special', '564', '2024-08-19 07:06:05', '2024-08-19 07:06:05'),
(8, 'Parfum Kahf', 'Wangi tahan lama', '1724076412.webp', '2.600.700', 'Special', '5445', '2024-08-19 07:06:52', '2024-08-19 07:06:52'),
(9, 'Jam SKMEI', 'Sangat Elegan \r\nCocok untuk dipakai dimanapun', '1724076539.jpg', '5.670.00', 'Men', '21', '2024-08-19 07:08:59', '2024-08-19 07:08:59'),
(10, 'Jam Stylish', 'Warna hitam coklat ukuran dewasa', '1724076636.jpg', '45.000.000', 'Select a Option', '2', '2024-08-19 07:10:36', '2024-08-19 07:10:36'),
(11, 'SepatuBola', 'Warna Abu\r\nUKURAN 39 40 41 42', '1724298514.jfif', '300.000', 'Sport', '43', '2024-08-21 20:48:34', '2024-08-21 20:48:52'),
(12, 'Lukisan', 'Ukuran minimalis dengan gambar ombak laut berwarna biru yang sangat indah', '1725318769.jpg', '128.000', 'Special', '780', '2024-08-27 06:12:22', '2024-09-02 16:12:49'),
(13, 'Lukisan', 'Ukuran minimalis dengan gambar ombak laut berwarna biru yang sangat indah', '1725318787.jpg', '420.000', 'Special', '569', '2024-08-27 06:12:58', '2024-09-02 16:13:07'),
(14, 'Lukisan', 'Ukuran minimalis dengan gambar ombak laut berwarna biru yang sangat indah', '1725318819.webp', '321.000', 'Special', '555', '2024-08-27 06:13:30', '2024-09-02 16:13:39'),
(15, 'Boneka', 'sangat imut dan lucu', '1725298137.jpg', '130.000', 'Special', '342', '2024-09-02 10:28:57', '2024-09-02 10:28:57'),
(16, 'Lukisan', 'sangat indah dan bagus', '1725298260.jpg', '300.000', 'Special', '765', '2024-09-02 10:31:00', '2024-09-02 10:31:00'),
(17, 'Boneka', 'Boneka Kucing', '1725344066.webp', '150.000', 'Special', '5', '2024-09-02 23:14:26', '2024-09-02 23:14:26');

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
('7BkwslkdkJrSfzWDMMspyHEEip5mwEASm20MzyL8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibG5vTmQ0aXVKZ1dhaTQ3N1VZWGNlVmtsMmlPSWJvQmFPa1VtN0QzTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxODoiZmxhc2hlcjo6ZW52ZWxvcGVzIjthOjA6e31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwIjt9fQ==', 1725507538);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'user',
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `phone`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user', 'user@gmail.com', 'user', '1234567', 'USA', NULL, '$2y$12$EkG7G/FNuuo5HMRDyL40y.oWNgtUao6a/wuBJQGybSkSHSmQpnLkC', NULL, '2024-08-15 07:25:10', '2024-08-15 07:25:10'),
(2, 'admin', 'admin@gmail.com', 'admin', '126728', 'ASY', NULL, '$2y$12$qhQMep9K5M4LR8EuIrbZW.zWjKxlUslFweLLj99C.iuBf7ONJCGgC', NULL, '2024-08-15 07:26:19', '2024-08-15 07:26:19'),
(3, 'tutu', 'tutu@gmail.com', 'user', '32423141', 'INDO', NULL, '$2y$12$v.P.hZi5Fe4NV2g1Q8qup.s1VbJHj7uPxBflXKzGtwkb5oGHeTk0u', NULL, '2024-08-18 02:01:57', '2024-08-18 02:01:57'),
(4, 'Mali', 'malison@gmail.com', 'user', '0892712', 'Gurun', NULL, '$2y$12$mRz4CzlvEvx9yPZv6qkPJez2/gnMW6yMJDiglgtikrldZzT1JYGnC', NULL, '2024-08-21 04:31:15', '2024-08-21 04:31:15'),
(5, 'Atotok', 'atok@gmail.com', 'user', '930210382', 'PALO ALTO', NULL, '$2y$12$UkwBu3CQXvfTmNbBVF2g9uFTfJ8PhSvYMpTFk/b48JUhK6ElNXddq', NULL, '2024-08-21 04:40:50', '2024-08-21 04:40:50'),
(6, 'nemo', 'nemo@gmail.com', 'user', '2137723', 'Gapura', NULL, '$2y$12$iE6k7ulSrhlWatRxpiZJvORlQcclSCNyRCWqDtNn4K4.Om.ceMgty', NULL, '2024-08-27 05:33:11', '2024-08-27 05:33:11'),
(7, 'gaga', 'gaga@gmail.com', 'admin', '213123', 'fdfaasd', NULL, '$2y$12$awqs36nsThra1Ms1wsTMCuSeVJIfaR/w3QLOeYkSneHtMBUDMZxxO', NULL, '2024-09-02 09:26:22', '2024-09-02 09:26:22'),
(9, 'hara', 'enditadwi3@gmail.com', 'admin', '4322434', 'Gapo', '2024-09-02 22:55:04', '$2y$12$4ACZ8mh.0PvH4JAfqd74KecWrrvDZVy43pl0oM2OGxh0tosX9y6iu', NULL, '2024-09-02 22:53:30', '2024-09-02 22:55:04'),
(11, 'martin', 'marrtrik34@gmail.com', 'user', '8293812', 'Aussie', '2024-09-04 19:25:49', '$2y$12$KGrEjpaetWFLFes2qwJd4u4A8pIa3dnwTbNTyyXdCrBazhFOFfXUK', NULL, '2024-09-04 19:25:04', '2024-09-04 19:25:49');

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_product_id_foreign` (`product_id`);

--
-- Indexes for table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `otps_email_unique` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
