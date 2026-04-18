-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2026 at 09:41 AM
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
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Mohamed', 'Moha@gmial.com', '$2y$10$qqE6YIuFqh9z/v6DDjKJeem3N5eES5VeGxrjhwn22QpC6kjwKSKvy', '2023-08-14 10:59:41', '2023-08-14 10:59:41'),
(2, 'user.second', 'user.second@yahoo.com', '$2y$10$bDZWRHcE/SbU/lIVatOD0uwUBzzEY9D28K8lxGLT6iZCLAtBO7Rp6', '2023-08-14 09:38:49', '2023-08-14 09:38:49'),
(3, 'Admin', 'Admin@gmail.com', '$2y$10$pg.9AY.JwIm14Uv4jpr.j.UpkGWJNiA2d8nFZt8RitrYtaAaKUb0q', '2025-10-28 14:18:34', '2025-10-28 14:18:34'),
(4, 'System Admin', 'admin@hotel.com', '$2y$10$1l0vlEs0bAjnOFP8Q9pOF.mukfoBXdadNRCHiSN7RZ4LKFZZUN36C', '2026-04-13 06:34:28', '2026-04-13 06:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `icon`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Swimming Pool', 'pool-icon', 'Outdoor swimming pool', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(2, 'Free WiFi', 'wifi-icon', 'Complimentary high-speed internet', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(3, 'Spa', 'spa-icon', 'Full service spa and wellness center', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(4, 'Fitness Center', 'gym-icon', '24/7 fitness facility', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(5, 'Restaurant', 'restaurant-icon', 'On-site dining restaurant', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(6, 'Parking', 'parking-icon', 'Free parking for guests', '2023-09-23 09:34:00', '2023-09-23 09:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `max_persons` int(10) NOT NULL,
  `size` int(10) NOT NULL,
  `view` varchar(200) NOT NULL,
  `num_beds` int(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  `hotel_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `image`, `max_persons`, `size`, `view`, `num_beds`, `price`, `hotel_id`, `created_at`, `updated_at`) VALUES
(1, 'Suite Room', 'room-1.jpg', 3, 45, 'Sea View', 2, '100', 1, '2023-08-12 13:22:50', '2023-08-12 13:22:50'),
(2, 'Standard Room', 'room-2.jpg', 2, 40, 'Sea View', 1, '50', 2, '2023-08-12 13:22:50', '2023-08-12 13:22:50'),
(3, 'Family Room', 'room-3.jpg', 4, 50, ' Sea View', 2, '200', 3, '2023-08-12 13:22:50', '2023-08-12 13:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(40) NOT NULL,
  `check_in` varchar(200) NOT NULL,
  `check_out` varchar(200) NOT NULL,
  `days` int(10) NOT NULL,
  `price` int(30) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_name` varchar(200) NOT NULL,
  `hotel_name` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL DEFAULT 'Processing',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `phone_number`, `check_in`, `check_out`, `days`, `price`, `user_id`, `room_name`, `hotel_name`, `status`, `created_at`, `updated_at`) VALUES
(140, 'macalin cumar', 'macalin@gmail.com', '633260289', '3/29/2026', '4/4/2026', 6, 1200, 44, 'Family Room', 'The Ritz', 'Processing', '2026-03-28 13:45:28', '2026-03-28 13:45:28');

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
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `image`, `description`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Sheraton', 'image_4.jpg', 'Holisticly revolutionize scalable initiatives with viral web services. Progressively maximize interactive potentialities whereas value-added partnerships. ', 'Cairo', '2023-08-12 13:07:32', '2023-08-12 13:07:32'),
(2, 'The Plaza Hotel\n', 'services-1.jpg', 'Conveniently restore visionary services with visionary systems. Enthusiastically unleash holistic e-commerce and superior leadership. Credibly enable prospective initiatives after virtual partnerships. Interactively ', 'New york.', '2023-08-12 13:07:32', '2023-08-12 13:07:32'),
(3, 'The Ritz', 'image_4.jpg', 'ontinually iterate high-payoff convergence via ubiquitous products. Phosfluorescently synergize enterprise-wide portals vis-a-vis clicks-and-mortar mindshare. Professionally iterate synergistic ROI ', 'Paris', '2023-08-12 13:07:32', '2023-08-12 13:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_amenities`
--

CREATE TABLE `hotel_amenities` (
  `id` int(10) NOT NULL,
  `hotel_id` int(10) NOT NULL,
  `amenity_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel_amenities`
--

INSERT INTO `hotel_amenities` (`id`, `hotel_id`, `amenity_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(2, 1, 2, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(3, 1, 4, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(4, 1, 5, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(5, 2, 2, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(6, 2, 3, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(7, 2, 5, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(8, 2, 6, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(9, 3, 1, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(10, 3, 2, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(11, 3, 3, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(12, 3, 4, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(13, 3, 5, '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(14, 3, 6, '2023-09-23 09:34:00', '2023-09-23 09:34:00');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` int(10) NOT NULL,
  `apartment_id` int(10) DEFAULT NULL,
  `rating` int(1) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `hotel_id`, `apartment_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, 'Excellent service and beautiful sea view!', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(2, 2, 1, NULL, 4, 'Great hotel with amazing amenities', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(3, 1, 2, 2, 3, 'Good value for money, but room was small', '2023-09-23 09:34:00', '2023-09-23 09:34:00'),
(4, 2, 3, 3, 5, 'Luxurious experience, highly recommended!', '2023-09-23 09:34:00', '2023-09-23 09:34:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mohamed', 'moha12@gmail.com', NULL, '$2y$10$qqE6YIuFqh9z/v6DDjKJeem3N5eES5VeGxrjhwn22QpC6kjwKSKvy', NULL, '2023-08-12 06:35:08', '2023-08-12 06:35:08'),
(2, 'new.user', 'new.use@yahoo.com', NULL, '$2y$10$aUhOFTNJKvoPymlCMGnIaeGa9Q0SPEblLspjL4eTfxcxoxxMTT1.i', NULL, '2023-08-12 08:01:55', '2023-08-12 08:01:55'),
(38, 'Farah Abdi Hasan', 'Farah@gmail.com', NULL, '$2y$10$P4RxSUlEEIqcnA2LnulaK.23IDsj/.SFIyzOavhsCiYsDK5GcZ7da', NULL, '2026-03-11 06:30:37', '2026-03-11 06:30:37'),
(39, 'Ahmed Saed', 'Ahmed@gmail.com', NULL, '$2y$10$JGKq4Qfk8iu4FBG2xnTlieI5zp.bhP3IYjjIWQQ7/3rZph7VU2Mcm', NULL, '2026-03-17 15:00:11', '2026-03-17 15:00:11'),
(40, 'Cali Cumar', 'Cali@gmail.com', NULL, '$2y$10$MhLdcvfmV/XJLF2EPeSiF.urF3jdXaCaTMQFLHltZVZdidJdLm3fy', NULL, '2026-03-18 05:52:08', '2026-03-18 05:52:08'),
(41, 'khalid mohamed', 'khalid@gmail.com', NULL, '$2y$10$QB6tcXp7hzGHjyeK7RIG.O94/zUSRWbUgwds30cIBTzsa4Vbk.2m.', NULL, '2026-03-18 06:50:51', '2026-03-18 06:50:51'),
(42, 'Ilburo Saed', 'ilburo@gmail.com', NULL, '$2y$10$CTr1VYeNVSYYlQxdAY7gXeFTEzunRdgyGLyhWwVAtS133/2NWQyHS', NULL, '2026-03-23 14:01:44', '2026-03-23 14:01:44'),
(44, 'macalin cumar', 'macalin@gmail.com', NULL, '$2y$10$v8bIE72KIvvihjzde84jhO3V6xkmm74bQ3d53OE1wULbcareD7PJS', NULL, '2026-03-28 13:44:53', '2026-03-28 13:44:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_amenities`
--
ALTER TABLE `hotel_amenities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_hotel_amenity` (`hotel_id`,`amenity_id`),
  ADD KEY `amenity_id` (`amenity_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hotel_id` (`hotel_id`),
  ADD KEY `apartment_id` (`apartment_id`);

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
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hotel_amenities`
--
ALTER TABLE `hotel_amenities`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartments`
--
ALTER TABLE `apartments`
  ADD CONSTRAINT `apartments_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hotel_amenities`
--
ALTER TABLE `hotel_amenities`
  ADD CONSTRAINT `hotel_amenities_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hotel_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`apartment_id`) REFERENCES `apartments` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
