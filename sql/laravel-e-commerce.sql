-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 08:04 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=>Inactive,1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `order_id`, `product_id`, `user_id`, `name`, `profile_picture`, `quantity`, `price`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 7, 2, 'Water Melon', 'public/uploads/products/171101868878.jpg', '1', '67', '67', '2024-04-30 05:10:42', '2024-04-30 05:11:55', NULL),
(2, '1', 2, 2, 'Banana', 'public/uploads/products/171101680163.jpg', '1', '33', '33', '2024-04-30 05:10:52', '2024-04-30 05:11:55', NULL),
(3, '2', 7, 2, 'Water Melon', 'public/uploads/products/171101868878.jpg', '1', '67', '67', '2024-04-30 05:11:27', '2024-04-30 05:11:55', NULL),
(4, '2', 37, 2, 'Garlic (Lahsun)', 'public/uploads/products/171110001272.jpg', '1', '55', '55', '2024-04-30 05:11:39', '2024-04-30 05:11:55', NULL),
(5, '3', 38, 2, 'Tomato', 'public/uploads/products/171110009551.jpg', '1', '18', '18', '2024-04-30 05:13:23', '2024-04-30 05:14:07', NULL),
(6, '3', 39, 2, 'Potato(Aloo)', 'public/uploads/products/171110050577.jpg', '1', '30', '30', '2024-04-30 05:13:33', '2024-04-30 05:14:07', NULL),
(7, '3', 40, 2, 'Onions', 'public/uploads/products/171110304021.jpg', '1', '32', '32', '2024-04-30 05:13:47', '2024-04-30 05:14:07', NULL),
(10, NULL, 7, 3, 'Water Melon', 'public/uploads/products/171101868878.jpg', '1', '67', '67', '2024-04-30 05:46:28', '2024-04-30 05:47:25', '2024-04-30 05:47:25'),
(11, '5', 7, 3, 'Water Melon', 'public/uploads/products/171101868878.jpg', '2', '67', '134', '2024-04-30 05:48:41', '2024-04-30 05:59:59', NULL),
(12, '5', 72, 3, 'Sprouts Mixed', 'public/uploads/products/171145143952.jpg', '1', '46', '46', '2024-04-30 05:59:49', '2024-04-30 05:59:59', NULL),
(13, NULL, 20, 3, 'Raw Mango', 'public/uploads/products/171108801763.jpg', '1', '108', '108', '2024-05-03 05:34:21', '2024-05-03 05:34:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=>Inactive,1=>Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `profile_picture`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Fruits & Vegetables', 'public/uploads/category/171014647596.jpg', '1', NULL, '2024-03-08 02:42:01', '2024-03-11 03:11:15'),
(2, 'Breakfast & Instant Food', 'public/uploads/category/170988555896.jpg', '1', NULL, '2024-03-08 02:42:38', '2024-03-08 02:42:38'),
(3, 'Bakery & Biscuits', 'public/uploads/category/170988558641.jpg', '1', NULL, '2024-03-08 02:43:06', '2024-03-08 02:43:06'),
(4, 'Atta , Rice & Dal', 'public/uploads/category/170988563092.jpg', '1', NULL, '2024-03-08 02:43:50', '2024-03-08 02:43:50'),
(5, 'Sauces & Spreads', 'public/uploads/category/171014314786.jpg', '1', NULL, '2024-03-08 02:44:44', '2024-03-11 02:15:47'),
(6, 'Baby Care', 'public/uploads/category/170988574660.jpg', '1', NULL, '2024-03-08 02:45:46', '2024-03-08 02:45:46'),
(7, 'Cleaning Essentials', 'public/uploads/category/170988578546.jpg', '1', NULL, '2024-03-08 02:46:25', '2024-03-08 02:46:25'),
(8, 'Personal Care', 'public/uploads/category/171014626513.jpg', '1', NULL, '2024-03-08 02:47:06', '2024-03-11 03:07:45'),
(9, 'Dairy & Bread', 'public/uploads/category/170988585933.jpg', '1', NULL, '2024-03-08 02:47:39', '2024-03-08 02:47:39'),
(10, 'Juices & Cold Drinks', 'public/uploads/category/170988594880.png', '1', NULL, '2024-03-08 02:49:08', '2024-03-08 02:49:08'),
(11, 'Tea ,  Coffee & Drinks', 'public/uploads/category/171014234938.jpg', '1', NULL, '2024-03-08 02:50:18', '2024-03-11 02:02:29'),
(12, 'Masala & Oils', 'public/uploads/category/171014298024.jpg', '1', NULL, '2024-03-08 02:52:25', '2024-03-11 02:13:00'),
(13, 'Health Care', 'public/uploads/category/171014254812.jpg', '1', NULL, '2024-03-08 02:53:00', '2024-03-11 02:05:48'),
(14, 'Pet Care', 'public/uploads/category/170988622223.jpg', '1', NULL, '2024-03-08 02:53:42', '2024-03-08 02:53:42'),
(15, 'Snacks & Munchies', 'public/uploads/category/170988624892.jpg', '1', NULL, '2024-03-08 02:54:08', '2024-03-08 02:54:08'),
(16, 'ddsfsdfsdfdsf', NULL, '0', NULL, '2024-03-14 02:12:01', '2024-03-14 02:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(33, '2014_10_12_000000_create_users_table', 1),
(34, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(35, '2019_08_19_000000_create_failed_jobs_table', 1),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(37, '2024_02_26_112835_create_categories_table', 1),
(38, '2024_02_28_040241_create_sub_categories_table', 1),
(39, '2024_03_04_095818_create_products_table', 1),
(43, '2024_03_14_053258_add_column_to_sub_categories', 2),
(44, '2024_03_21_044949_create_brands_table', 2),
(45, '2024_03_21_053832_create_products_table', 3),
(46, '2024_03_22_103859_add_description_to_products', 4),
(47, '2024_04_03_110012_add_primary_image_to_products', 5),
(48, '2024_04_22_105758_create_order_products_table', 6),
(49, '2024_04_23_064329_add_total_to_order_product', 7),
(50, '2024_04_23_112037_create_cart_table', 8),
(51, '2024_04_24_102919_create_order_table', 9),
(52, '2024_04_24_105805_create_order_table', 10),
(53, '2024_04_24_111905_create_order_table', 11),
(54, '2024_04_24_113450_add_order_status_to_order', 12),
(55, '2024_04_24_114047_create_order_table', 13),
(56, '2024_04_24_114448_create_order_table', 14),
(57, '2024_04_24_114601_add_order_id_to_cart', 14),
(58, '2024_04_24_114903_create_order_table', 15),
(59, '2024_04_25_120048_create_order_table', 16),
(60, '2024_04_26_091127_create_payment_table', 17),
(61, '2024_04_29_110221_create_payment_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `order_number`, `sub_total`, `shipping_charge`, `total`, `address`, `order_date`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 2, '2878098', '100', '10', '110', '203, Arise, Ghanteshwer, Jamnagar RoadRajkot380015GujaratIndia', '2024-04-30 05:10:55', 'Received', '2024-04-30 05:10:42', '2024-04-30 05:11:11'),
(2, 2, '7748239', '122', '10', '132', '203, Arise, Ghanteshwer, Jamnagar RoadRajkot380015GujaratIndia', '2024-04-30 05:11:55', 'Received', '2024-04-30 05:11:27', '2024-04-30 05:12:12'),
(3, 2, '8577653', '80', '10', '90', '203, Arise, Ghanteshwer, Jamnagar RoadRajkot380015GujaratIndia', '2024-04-30 05:14:07', 'Received', '2024-04-30 05:13:23', '2024-04-30 05:14:28'),
(5, 3, '2595800', '180', '10', '190', '203, Arise, Ghanteshwer, Jamnagar RoadRajkot380015GujaratIndia', '2024-04-30 05:59:59', 'Received', '2024-04-30 05:46:28', '2024-04-30 06:00:30'),
(6, 3, NULL, '108', '10', '118', NULL, NULL, 'Pending', '2024-05-03 05:34:21', '2024-05-03 05:34:21');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cvv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `user_id`, `order_id`, `card_number`, `holder_name`, `expiry_date`, `cvv`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '4242424242424242', 'Jimin', '04/2027', '1231', '2024-04-30 05:11:11', '2024-04-30 05:11:11'),
(2, 2, 2, '4242424242424242', 'Jin', '11/2029', '456', '2024-04-30 05:12:12', '2024-04-30 05:12:12'),
(3, 2, 3, '4242424242424242', 'Suga', '04/2031', '2313', '2024-04-30 05:14:28', '2024-04-30 05:14:28'),
(4, 3, 5, '4242424242424242', 'JK', '04/2032', '2536', '2024-04-30 06:00:30', '2024-04-30 06:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primary_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=>Inactive,1=>Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `name`, `description`, `profile_picture`, `primary_image`, `quantity`, `price`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'Mango', 'Mango is sourced from Ratnagiri, Devgad and Konkan regions of Maharashtra. Early season variety offers a perfect balance of sweetness and acidity with rich aroma and creamy texture. Their juicy & succulent nature makes for a perfect snack or dessert, either on its own or combined with other fruits in a fruit salad.', 'public/uploads/products/171384593883.jpg', 'public/uploads/primary_images/171384591013.jpg', '2 Pieces (500gm - 600gm)', '149', '1', '2024-03-21 02:17:41', '2024-04-22 22:48:58', NULL),
(2, 1, 1, 'Banana', NULL, 'public/uploads/products/171101680163.jpg', 'public/uploads/primary_images/171220594822.jpg', '4 Pieces', '33', '1', '2024-03-21 04:56:41', '2024-04-03 23:15:48', NULL),
(3, 1, 1, 'Pineapple', 'Pineapple is an incredibly delicious and healthy tropical fruit. It is a large tropical fruit with a spiky, tough skin and sweet insides and is an exceptionally juicy and sweet fruit.', 'public/uploads/products/171101686863.jpg', 'public/uploads/primary_images/171220737067.jpg', '1 Piece (1 kg - 1.4 kg)', '98', '1', '2024-03-21 04:57:48', '2024-04-18 06:32:14', NULL),
(4, 1, 1, 'Green Grapes', NULL, 'public/uploads/products/171101693323.jpg', 'public/uploads/primary_images/171220855812.jpg', '500 g', '69', '1', '2024-03-21 04:58:53', '2024-04-03 23:59:18', NULL),
(5, 1, 1, 'Tender Coconut(Nariyel Pani)', NULL, 'public/uploads/products/171101705811.jpg', 'public/uploads/primary_images/171220888747.jpg', '1 Piece', '50', '1', '2024-03-21 05:00:58', '2024-04-04 00:04:47', NULL),
(6, 1, 1, 'Nagpur Orange', NULL, 'public/uploads/products/171101714226.jpg', 'public/uploads/primary_images/171220965796.jpg', '500 g', '46', '1', '2024-03-21 05:02:22', '2024-04-04 00:17:37', NULL),
(7, 1, 1, 'Water Melon', NULL, 'public/uploads/products/171101868878.jpg', 'public/uploads/primary_images/171221012863.jpg', '1 Piece', '67', '1', '2024-03-21 05:28:08', '2024-04-04 00:25:28', NULL),
(8, 1, 1, 'Apple', NULL, 'public/uploads/products/171101877776.jpg', 'public/uploads/primary_images/171214307220.jpg', '4 Unit (500 g - 700 g)', '166', '1', '2024-03-21 05:29:37', '2024-04-03 05:47:52', NULL),
(9, 1, 1, 'Pomegranate', NULL, 'public/uploads/products/171101884524.jpg', 'public/uploads/primary_images/171221026319.jpg', '2 Pieces(350 g - 450 g)', '96', '1', '2024-03-21 05:30:45', '2024-04-04 00:27:43', NULL),
(10, 1, 1, 'Papaya', NULL, 'public/uploads/products/171101897287.jpg', 'public/uploads/primary_images/171221056858.jpg', '1 Piece (750 g - 1.25 kg)', '67', '1', '2024-03-21 05:32:52', '2024-04-04 00:32:48', NULL),
(11, 1, 1, 'Shimla Apple', NULL, 'public/uploads/products/17110191041.jpg', 'public/uploads/primary_images/171221188975.jpg', '500 g - 600 g', '204', '1', '2024-03-21 05:35:04', '2024-04-04 00:54:49', NULL),
(12, 1, 1, 'Black Grapes', NULL, 'public/uploads/products/171101914130.jpg', 'public/uploads/primary_images/171221201797.jpg', '500 g', '110', '1', '2024-03-21 05:35:41', '2024-04-04 00:56:57', NULL),
(13, 1, 1, 'Brown Coconut(Nariyel)', NULL, 'public/uploads/products/171101933382.jpg', 'public/uploads/primary_images/171221294882.jpg', '1', '36', '1', '2024-03-21 05:38:53', '2024-04-04 01:12:28', NULL),
(14, 1, 1, 'Chikku', NULL, 'public/uploads/products/171107668079.jpg', 'public/uploads/primary_images/171221752323.jpg', '400 g-500 g', '81', '1', '2024-03-21 21:34:40', '2024-04-04 02:28:43', NULL),
(15, 1, 1, 'Muskmelon', NULL, 'public/uploads/products/1711076799100.jpg', 'public/uploads/primary_images/17122176656.jpg', '1 Unit (400 g - 700 g)', '43', '1', '2024-03-21 21:36:39', '2024-04-04 02:31:05', NULL),
(16, 1, 1, 'Sweet Lime', NULL, 'public/uploads/products/171108706155.jpg', 'public/uploads/primary_images/171221798920.jpg', '500 g - 700 g', '51', '1', '2024-03-22 00:27:41', '2024-04-04 02:36:29', NULL),
(17, 1, 1, 'Sweet Taramind Box', NULL, 'public/uploads/products/171108735587.jpg', 'public/uploads/primary_images/171221843669.jpg', '225 g', '119', '1', '2024-03-22 00:32:35', '2024-04-04 02:43:56', NULL),
(18, 1, 1, 'Wood Apple(Bel)', NULL, 'public/uploads/products/171108740030.jpg', 'public/uploads/primary_images/171221866875.jpg', '1 Piece (150 g - 200 g)', '19', '1', '2024-03-22 00:33:20', '2024-04-04 02:47:48', NULL),
(19, 1, 1, 'Groundnuts', NULL, 'public/uploads/products/171108748262.jpg', 'public/uploads/primary_images/171221879921.jpg', '550 g', '110', '1', '2024-03-22 00:34:42', '2024-04-04 02:49:59', NULL),
(20, 1, 1, 'Raw Mango', NULL, 'public/uploads/products/171108801763.jpg', 'public/uploads/primary_images/171221899465.jpg', '500 g -600 g', '108', '1', '2024-03-22 00:43:37', '2024-04-04 02:53:14', NULL),
(21, 1, 1, 'Coconut-Chunks', NULL, 'public/uploads/products/171108838972.jpg', 'public/uploads/primary_images/171221910919.jpg', '100 g', '31', '1', '2024-03-22 00:49:49', '2024-04-04 02:55:09', NULL),
(22, 1, 1, 'Thai Guava', NULL, 'public/uploads/products/17110884406.jpg', 'public/uploads/primary_images/171222032659.jpg', '2 Pieces', '104', '1', '2024-03-22 00:50:40', '2024-04-04 03:15:26', NULL),
(23, 1, 1, 'Red Flame Seedless Grapes', NULL, 'public/uploads/products/171108854758.jpg', 'public/uploads/primary_images/171222210990.jpg', '500 g', '67', '1', '2024-03-22 00:52:27', '2024-04-04 03:45:09', NULL),
(24, 1, 1, 'Sugarcane Cubes', NULL, 'public/uploads/products/171108903765.jpg', 'public/uploads/primary_images/171222232482.jpg', '175 g', '30', '1', '2024-03-22 01:00:37', '2024-04-04 03:48:44', NULL),
(25, 1, 1, 'Kiwi', NULL, 'public/uploads/products/171108981245.jpg', 'public/uploads/primary_images/17122224822.jpg', '3 Pieces', '169', '1', '2024-03-22 01:13:32', '2024-04-04 03:51:22', NULL),
(26, 1, 1, 'Imported Lichi', NULL, 'public/uploads/products/171109002264.jpg', 'public/uploads/primary_images/171222303865.jpg', '100 g', '61', '1', '2024-03-22 01:17:02', '2024-04-04 04:00:38', NULL),
(27, 1, 1, 'Avaccado', NULL, 'public/uploads/products/171109047279.jpg', 'public/uploads/primary_images/171222370654.jpg', '1 Piece(150 g - 200 g)', '159', '1', '2024-03-22 01:24:32', '2024-04-04 04:11:46', NULL),
(28, 1, 1, 'Blue Berry', NULL, 'public/uploads/products/171222459159.jpg', 'public/uploads/primary_images/171222459125.jpg', '125 g', '299', '1', '2024-03-22 02:39:15', '2024-04-04 04:26:31', NULL),
(29, 1, 1, 'Plum', NULL, 'public/uploads/products/171109506987.jpg', 'public/uploads/primary_images/171222483463.jpg', '250 g', '106', '1', '2024-03-22 02:41:09', '2024-04-04 04:30:34', NULL),
(30, 1, 1, 'Pear Beuty', NULL, 'public/uploads/products/171109512977.jpg', 'public/uploads/primary_images/171222498033.jpg', '2 Pieces (250 g - 350 g)', '161', '1', '2024-03-22 02:42:09', '2024-04-08 00:58:08', NULL),
(31, 1, 1, 'Red Cherry', NULL, 'public/uploads/products/171109519226.jpg', 'public/uploads/primary_images/171222516032.jpg', '100 g', '356', '1', '2024-03-22 02:43:12', '2024-04-04 04:36:00', NULL),
(32, 1, 1, 'Sugar Can Stick', NULL, 'public/uploads/products/171109541494.jpg', 'public/uploads/primary_images/171222619125.jpg', '1Piece (across 2 ft.)', '48', '1', '2024-03-22 02:46:54', '2024-04-04 04:53:11', NULL),
(33, 1, 1, 'Sun Melon', NULL, 'public/uploads/products/171109571861.jpg', 'public/uploads/primary_images/171222628735.jpg', '1 Piece(500 g- 700 g)', '46', '1', '2024-03-22 02:51:58', '2024-04-04 04:54:47', NULL),
(34, 1, 1, 'Dates', NULL, 'public/uploads/products/171109584312.jpg', 'public/uploads/primary_images/171222897614.jpg', '400 g - 500 g', '229', '1', '2024-03-22 02:54:03', '2024-04-04 05:39:36', NULL),
(35, 1, 1, 'Dried Apricots', NULL, 'public/uploads/products/171109610639.jpg', 'public/uploads/primary_images/171222730455.jpg', '200 g', '350', '1', '2024-03-22 02:58:26', '2024-04-04 05:11:44', NULL),
(36, 1, 1, 'Dragon Fruit', NULL, 'public/uploads/products/171109622372.jpg', 'public/uploads/primary_images/171222739780.jpg', '1 Piece (300 g - 400 g)', '99', '1', '2024-03-22 03:00:23', '2024-04-04 05:13:18', NULL),
(37, 1, 2, 'Garlic (Lahsun)', NULL, 'public/uploads/products/171110001272.jpg', 'public/uploads/primary_images/171222750215.jpg', '200 g', '55', '1', '2024-03-22 04:03:32', '2024-04-04 05:15:02', NULL),
(38, 1, 2, 'Tomato', NULL, 'public/uploads/products/171110009551.jpg', 'public/uploads/primary_images/171222774924.jpg', '500 g', '18', '1', '2024-03-22 04:04:55', '2024-04-08 04:15:38', NULL),
(39, 1, 2, 'Potato(Aloo)', NULL, 'public/uploads/products/171110050577.jpg', 'public/uploads/primary_images/171222808336.jpg', '1 kg', '30', '1', '2024-03-22 04:11:45', '2024-04-04 05:24:43', NULL),
(40, 1, 2, 'Onions', NULL, 'public/uploads/products/171110304021.jpg', 'public/uploads/primary_images/171222814277.jpg', '1 kg', '32', '1', '2024-03-22 04:54:00', '2024-04-04 05:25:42', NULL),
(41, 1, 2, 'Green Chilli', NULL, 'public/uploads/products/171110308017.jpg', 'public/uploads/primary_images/171222820374.jpg', '100 g', '14', '1', '2024-03-22 04:54:40', '2024-04-04 05:26:43', NULL),
(42, 1, 2, 'Ginger(Adrak)', NULL, 'public/uploads/products/171110379466.jpg', 'public/uploads/primary_images/171222828624.jpg', '200 g', '38', '1', '2024-03-22 05:06:34', '2024-04-04 05:28:06', NULL),
(43, 1, 2, 'Green Cucumber', NULL, 'public/uploads/products/171110583395.jpg', 'public/uploads/primary_images/171222841463.jpg', '500 g', '28', '1', '2024-03-22 05:40:33', '2024-04-04 05:30:14', NULL),
(44, 1, 2, 'English Cucumber', NULL, 'public/uploads/products/171110589078.jpg', 'public/uploads/primary_images/171222875125.jpg', '500 g - 600 g', '24', '1', '2024-03-22 05:41:30', '2024-04-04 05:35:51', NULL),
(45, 1, 2, 'Lady FIngers', NULL, 'public/uploads/products/171110594110.jpg', 'public/uploads/primary_images/17122288189.jpg', '250 g', '19', '1', '2024-03-22 05:42:21', '2024-04-04 05:36:58', NULL),
(46, 1, 2, 'Red Carrots', NULL, 'public/uploads/products/171110598111.jpg', 'public/uploads/primary_images/171222895422.jpg', '500 g', '16', '1', '2024-03-22 05:43:01', '2024-04-04 05:39:14', NULL),
(47, 1, 2, 'Orange Carrots', NULL, 'public/uploads/products/171110601271.jpg', 'public/uploads/primary_images/171222904834.jpg', '500 g', '26', '1', '2024-03-22 05:43:32', '2024-04-04 05:40:48', NULL),
(48, 1, 2, 'Limbu(Nimbu)', NULL, 'public/uploads/products/171142866092.jpg', 'public/uploads/primary_images/171222913943.jpg', '250 g - 300 g', '69', '1', '2024-03-25 23:21:00', '2024-04-04 05:42:19', NULL),
(49, 1, 2, 'Cauliflower(Phool Gobi)', NULL, 'public/uploads/products/171142880780.jpg', 'public/uploads/primary_images/171222924265.jpg', '1 Piece(400 g - 6-00 g)', '37', '1', '2024-03-25 23:23:27', '2024-04-04 05:44:02', NULL),
(50, 1, 2, 'Cabbage (Patta Gobhii)', NULL, 'public/uploads/products/171142888526.jpg', 'public/uploads/primary_images/171222933677.jpg', '1 Piece(400 g - 600 g)', '25', '1', '2024-03-25 23:24:45', '2024-04-04 05:45:36', NULL),
(51, 1, 2, 'Bottle Gourd(Lauki)', NULL, 'public/uploads/products/171142899892.jpg', 'public/uploads/primary_images/171222942182.jpg', '1 Piece (400 g - 600 g)', '39', '1', '2024-03-25 23:26:38', '2024-04-04 05:47:01', NULL),
(52, 1, 2, 'Green Capsicum(Shimla Mirch)', NULL, 'public/uploads/products/171142933174.jpg', 'public/uploads/primary_images/171222950340.jpg', '500 g', '78', '1', '2024-03-25 23:32:11', '2024-04-04 05:48:23', NULL),
(53, 1, 2, 'Green Peas(Mattar)', NULL, 'public/uploads/products/171142943420.jpg', 'public/uploads/primary_images/171222957240.jpg', '250 g', '36', '1', '2024-03-25 23:33:54', '2024-04-04 05:49:32', NULL),
(54, 1, 2, 'Mushroom', NULL, 'public/uploads/products/171142954214.jpg', 'public/uploads/primary_images/171222966166.jpg', '180 g - 200 g', '52', '1', '2024-03-25 23:35:42', '2024-04-04 05:51:01', NULL),
(55, 1, 2, 'Brinjal', NULL, 'public/uploads/products/171142980154.jpg', 'public/uploads/primary_images/17122298345.jpg', '500 g', '28', '1', '2024-03-25 23:40:01', '2024-04-04 05:53:54', NULL),
(56, 1, 2, 'Onions', NULL, 'public/uploads/products/171143003987.jpg', NULL, '250 g', '16', '1', '2024-03-25 23:43:59', '2024-03-25 23:43:59', NULL),
(57, 1, 2, 'Beetroot', NULL, 'public/uploads/products/171143011134.jpg', NULL, '500 g - 600 g', '40', '1', '2024-03-25 23:45:11', '2024-03-25 23:45:11', NULL),
(58, 1, 2, 'Potato', NULL, 'public/uploads/products/171143071238.jpg', NULL, '500 g', '22', '1', '2024-03-25 23:55:12', '2024-03-25 23:55:12', NULL),
(59, 1, 2, 'Corn', NULL, 'public/uploads/products/171143073963.jpg', 'public/uploads/primary_images/171229198371.jpg', '1 Piece', '27', '1', '2024-03-25 23:55:39', '2024-04-04 23:09:43', NULL),
(60, 1, 2, 'Sweet Potato(Shkkarkandi)', NULL, 'public/uploads/products/171143081185.jpg', 'public/uploads/primary_images/171229263216.jpg', '500 g - 700 g', '59', '1', '2024-03-25 23:56:51', '2024-04-04 23:20:32', NULL),
(61, 1, 2, 'Bitter Gourd(Karela)', NULL, 'public/uploads/products/17114308925.jpg', 'public/uploads/primary_images/171229287283.jpg', '250 g- 300 g', '40', '1', '2024-03-25 23:58:12', '2024-04-04 23:24:32', NULL),
(62, 1, 2, 'Broad Beans', NULL, 'public/uploads/products/171143096636.jpg', 'public/uploads/primary_images/171229300944.jpg', '250 g', '32', '1', '2024-03-25 23:59:26', '2024-04-04 23:26:49', NULL),
(63, 1, 2, 'Cluster Beans(Gawar Phali)', NULL, 'public/uploads/products/171143124529.jpg', 'public/uploads/primary_images/171229325897.jpg', '250 g', '49', '1', '2024-03-26 00:04:05', '2024-04-04 23:30:58', NULL),
(64, 1, 2, 'Ivy Gourd(Kundru)', NULL, 'public/uploads/products/17114313291.jpg', 'public/uploads/primary_images/171229473366.jpg', '250 g', '35', '1', '2024-03-26 00:05:29', '2024-04-04 23:55:33', NULL),
(65, 1, 2, 'Sponge Gourd(Tori)', NULL, 'public/uploads/products/171143147315.jpg', 'public/uploads/primary_images/171229528445.jpg', '400 g - 500 g', '56', '1', '2024-03-26 00:07:53', '2024-04-05 00:04:44', NULL),
(66, 1, 2, 'Pigeon Pea', NULL, 'public/uploads/products/171143247185.jpg', 'public/uploads/primary_images/17122959799.jpg', '250 g', '38', '1', '2024-03-26 00:24:31', '2024-04-05 00:16:19', NULL),
(67, 1, 2, 'Pointed Gourd(Parwal)', NULL, 'public/uploads/products/171144943334.jpg', 'public/uploads/primary_images/171229612261.jpg', '250 g', '43', '1', '2024-03-26 05:07:13', '2024-04-05 00:18:42', NULL),
(68, 1, 2, 'Round Gourd', NULL, 'public/uploads/products/171145032585.jpg', 'public/uploads/primary_images/171229725245.jpg', '250 g', '21', '1', '2024-03-26 05:22:05', '2024-04-05 00:37:32', NULL),
(69, 1, 2, 'Broccoli', NULL, 'public/uploads/products/171145076638.jpg', 'public/uploads/primary_images/171229782022.jpg', '300 g - 400 g', '71', '1', '2024-03-26 05:29:26', '2024-04-05 00:47:00', NULL),
(70, 1, 2, 'Coriander(Dhaniya)', NULL, 'public/uploads/products/171145121458.jpg', 'public/uploads/primary_images/171229800633.jpg', '100 g', '13', '1', '2024-03-26 05:36:54', '2024-04-05 00:50:06', NULL),
(71, 1, 2, 'Green Moong Spruots', NULL, 'public/uploads/products/171145132386.jpg', 'public/uploads/primary_images/171229809723.jpg', '150 g - 160 g', '45', '1', '2024-03-26 05:38:43', '2024-04-05 00:51:37', NULL),
(72, 1, 2, 'Sprouts Mixed', NULL, 'public/uploads/products/171145143952.jpg', 'public/uploads/primary_images/171229819894.jpg', '200 g', '46', '1', '2024-03-26 05:40:39', '2024-04-05 00:53:18', NULL),
(73, 1, 2, 'Spinach(Palak)', NULL, 'public/uploads/products/171145149298.jpg', 'public/uploads/primary_images/17122989318.jpg', '200 g', '30', '1', '2024-03-26 05:41:32', '2024-04-05 01:05:31', NULL),
(74, 1, 2, 'Iceberg Lettus', NULL, 'public/uploads/products/171145157366.jpg', 'public/uploads/primary_images/171229959175.jpg', '250 g', '61', '1', '2024-03-26 05:42:53', '2024-04-05 01:16:31', NULL),
(75, 1, 2, 'Spring Onion(Hari Pyaz)', NULL, 'public/uploads/products/171145166499.jpg', 'public/uploads/primary_images/17125495143.jpg', '150 g', '15', '1', '2024-03-26 05:44:24', '2024-04-07 22:41:54', NULL),
(76, 1, 2, 'Green Zuchhini', NULL, 'public/uploads/products/17114521687.jpg', 'public/uploads/primary_images/171255173540.jpg', '1 Piece(200 g - 250 g)', '50', '1', '2024-03-26 05:51:42', '2024-04-07 23:18:56', NULL),
(77, 1, 2, 'Fenugreek(Methi)', NULL, 'public/uploads/products/171145237231.jpg', 'public/uploads/primary_images/171255209789.jpg', '250 g', '40', '1', '2024-03-26 05:56:12', '2024-04-07 23:24:57', NULL),
(78, 1, 2, 'Radish', NULL, 'public/uploads/products/171145306717.jpg', 'public/uploads/primary_images/171255295524.jpg', '250 g- 300 g', '32', '1', '2024-03-26 06:07:47', '2024-04-07 23:39:15', NULL),
(79, 1, 2, 'Drumstick Cut', NULL, 'public/uploads/products/171151252224.jpg', 'public/uploads/primary_images/171255313184.jpg', '200 g', '47', '1', '2024-03-26 22:38:42', '2024-04-07 23:42:11', NULL),
(80, 1, 2, 'Basil Leaves', NULL, 'public/uploads/products/17115131655.jpg', 'public/uploads/primary_images/171255413545.jpg', '50 g', '20', '1', '2024-03-26 22:49:25', '2024-04-07 23:58:55', NULL),
(81, 1, 2, 'Lemon Grass', NULL, 'public/uploads/products/171151331911.jpg', 'public/uploads/primary_images/171255464020.jpg', '100 g', '26', '1', '2024-03-26 22:51:59', '2024-04-08 00:07:20', NULL),
(82, 2, 3, 'Meggi 2-minute instant noodles', NULL, 'public/uploads/products/171160055158.jpg', 'public/uploads/primary_images/171255477819.jpg', '280 g', '56', '1', '2024-03-27 23:05:51', '2024-04-08 00:09:38', NULL),
(83, 2, 3, 'Meggi Masala Veg Atta', NULL, 'public/uploads/products/17119506349.jpg', NULL, '290 g', '102', '1', '2024-04-01 00:20:34', '2024-04-01 00:20:34', NULL),
(84, 2, 3, 'Meggi Cuppa Masala Cup Noodles', NULL, 'public/uploads/products/171197065483.jpg', NULL, '70 g', '50', '1', '2024-04-01 05:54:14', '2024-04-01 05:54:14', NULL),
(85, 2, 3, 'Maggi Korean BBQ Veg Noodles', NULL, 'public/uploads/products/171197074142.jpg', NULL, '90 g', '55', '1', '2024-04-01 05:55:41', '2024-04-01 05:55:41', NULL),
(86, 2, 3, 'Magi Spicy Garlic Instant Noodles', NULL, 'public/uploads/products/171203525550.jpg', NULL, '248 g', '80', '1', '2024-04-01 23:50:55', '2024-04-01 23:50:55', NULL),
(87, 2, 3, 'Nissin geki hot & spicy korean kimchi instant noodles', NULL, 'public/uploads/products/171203552186.jpg', NULL, '80 g', '44', '1', '2024-04-01 23:55:21', '2024-04-01 23:55:21', NULL),
(88, 2, 3, 'Nissin geki - hot & spicy korean veg flavoured instant noodles', NULL, 'public/uploads/products/171203648046.jpg', NULL, '240 g', '126', '1', '2024-04-02 00:11:20', '2024-04-02 00:11:20', NULL),
(89, 2, 3, 'Sunfeast yippy magic masala instant noodles', NULL, 'public/uploads/products/171203664312.jpg', NULL, '240 g', '52', '1', '2024-04-02 00:14:03', '2024-04-02 00:14:03', NULL),
(90, 2, 3, 'Nissin geki hot & spicy korean cheese Instant Noodles', NULL, 'public/uploads/products/171203835652.jpg', NULL, '80 g', '44', '1', '2024-04-02 00:42:36', '2024-04-02 00:42:36', NULL),
(91, 2, 3, 'Yu 100% whole wheat noodles', NULL, 'public/uploads/products/171203880942.jpg', NULL, '150 g', '39', '1', '2024-04-02 00:50:09', '2024-04-02 00:50:09', NULL),
(92, 2, 3, 'Maggi cuppa chily chow noodles', NULL, 'public/uploads/products/171204417284.jpg', NULL, '70 g', '50', '1', '2024-04-02 02:19:32', '2024-04-02 02:19:32', NULL),
(93, 2, 3, 'Top ramen masala noodles', NULL, 'public/uploads/products/171204716990.jpg', NULL, '240 g', '53', '1', '2024-04-02 03:09:29', '2024-04-02 03:09:29', NULL),
(94, 2, 3, 'Top ramen curry veg noodles', NULL, 'public/uploads/products/171204726883.jpg', NULL, '280 g', '100', '1', '2024-04-02 03:11:08', '2024-04-02 03:11:08', NULL),
(95, 2, 3, 'Sunfeast Yippy mood masala instant noodles', NULL, 'public/uploads/products/171204803081.jpg', NULL, '260 g', '51', '1', '2024-04-02 03:23:50', '2024-04-02 03:23:50', NULL),
(96, 2, 3, 'Maggi cuppa chilly chow cup noodles', NULL, 'public/uploads/products/171204867276.jpg', NULL, '70 g', '50', '1', '2024-04-02 03:34:32', '2024-04-02 03:34:32', NULL),
(97, 2, 3, 'Master chow instant cup noodles', NULL, 'public/uploads/products/171204932975.jpg', NULL, '100 g', '61', '1', '2024-04-02 03:45:29', '2024-04-02 03:45:29', NULL),
(98, 2, 3, 'Maggi korean spicy cheesy instant noodles', NULL, 'public/uploads/products/171204971326.jpg', NULL, '715 g', '100', '1', '2024-04-02 03:51:53', '2024-04-02 03:51:53', NULL),
(99, 2, 3, 'Nissin geki hot & spicy korean veg cup instant noodles', NULL, 'public/uploads/products/171205017695.jpg', NULL, '70 g', '72', '1', '2024-04-02 03:59:36', '2024-04-02 03:59:36', NULL),
(100, 2, 3, 'Nissin geki super hot chilly cup noodles', NULL, 'public/uploads/products/171205082447.jpg', NULL, '70 g', '40', '1', '2024-04-02 04:10:24', '2024-04-02 04:10:24', NULL),
(101, 2, 3, 'Nissim vegi manchow cup noodles - pack 2', NULL, 'public/uploads/products/171205099213.jpg', NULL, '2 * 70 g', '79', '1', '2024-04-02 04:13:12', '2024-04-02 04:13:12', NULL),
(102, 2, 3, 'Patanjali chat patta atta noodles', NULL, 'public/uploads/products/171205115612.jpg', NULL, '240 g', '48', '1', '2024-04-02 04:15:56', '2024-04-02 04:15:56', NULL),
(103, 2, 4, 'HyFun French Fries', NULL, 'public/uploads/products/171205147555.jpg', NULL, '425 g', '100', '1', '2024-04-02 04:21:15', '2024-04-02 04:21:15', NULL),
(104, 2, 4, 'Aashirvad Aloo paratha', NULL, 'public/uploads/products/171205159860.jpg', NULL, '400 g (4 Pieces)', '135', '1', '2024-04-02 04:23:18', '2024-04-02 04:23:18', NULL),
(105, 2, 4, 'Aashirvad Malabar Paratha', NULL, 'public/uploads/products/171205170923.jpg', NULL, '400 g (5 pieces)', '135', '1', '2024-04-02 04:25:09', '2024-04-02 04:25:09', NULL),
(106, 2, 4, 'HyFun Veg Paradise Pizza(Regular Base)', NULL, 'public/uploads/products/171205252149.jpg', NULL, '240 g', '150', '1', '2024-04-02 04:38:42', '2024-04-02 04:38:42', NULL),
(107, 2, 4, 'ITC Master Chef French Fries(Frozen)', NULL, 'public/uploads/products/171205288323.jpg', NULL, '420 g', '99', '1', '2024-04-02 04:44:43', '2024-04-02 04:44:43', NULL),
(108, 2, 4, 'ITC Master Chef veggie pizza pocket(Frozen)', NULL, 'public/uploads/products/171205317687.jpg', NULL, '340 g', '171', '1', '2024-04-02 04:49:36', '2024-04-02 04:49:36', NULL),
(109, 2, 4, 'Maccain Chilli Cheese Nuggets', NULL, 'public/uploads/products/171205432845.jpg', NULL, '250 g', '150', '1', '2024-04-02 05:08:48', '2024-04-02 05:08:48', NULL),
(110, 2, 4, 'McCain Aloo Tikki', NULL, 'public/uploads/products/171255856819.jpg', NULL, '760 g', '225', '1', '2024-04-02 05:15:55', '2024-04-08 01:12:48', NULL),
(111, 2, 4, 'McCain Cheese Corn Mini Samosa', NULL, 'public/uploads/products/171205551851.jpg', NULL, '240 g', '155', '1', '2024-04-02 05:28:38', '2024-04-02 05:28:38', NULL),
(112, 2, 4, 'McCain Cheese Pizza Fingers', NULL, 'public/uploads/products/171255859225.jpg', NULL, '250 g', '210', '1', '2024-04-02 05:31:03', '2024-04-08 01:13:12', NULL),
(113, 2, 4, 'McCain Cheese Garlic Potato Bites Nuggets', NULL, 'public/uploads/products/171205575816.jpg', NULL, '700 g', '240', '1', '2024-04-02 05:32:38', '2024-04-02 05:32:38', NULL),
(114, 2, 4, 'McCain Crazy French fries with masala', NULL, 'public/uploads/products/1712118620100.jpg', NULL, '400 g', '150', '1', '2024-04-02 23:00:20', '2024-04-02 23:00:20', NULL),
(115, 2, 4, 'McCain Crispy Onion Rings', NULL, 'public/uploads/products/171211947022.jpg', NULL, '250 g', '150', '1', '2024-04-02 23:14:30', '2024-04-02 23:14:30', NULL),
(116, 2, 4, 'McCain Crispy Potato Smile', NULL, 'public/uploads/products/171211997251.jpg', NULL, '750 g', '250', '1', '2024-04-02 23:22:52', '2024-04-02 23:22:52', NULL),
(117, 2, 4, 'McCain French Fries', NULL, 'public/uploads/products/171212061139.jpg', NULL, '1.25 kg', '284', '1', '2024-04-02 23:33:31', '2024-04-02 23:33:31', NULL),
(118, 2, 4, 'McCain Pepper Crunch French Fries', NULL, 'public/uploads/products/171255861594.jpg', NULL, '420 g', '150', '1', '2024-04-02 23:54:41', '2024-04-08 01:13:35', NULL),
(119, 2, 4, 'McCain Pizza Cheese Mini Samosa', NULL, 'public/uploads/products/171212203940.jpg', NULL, '240 g', '155', '1', '2024-04-02 23:57:19', '2024-04-02 23:57:19', NULL),
(120, 2, 4, 'McCain Potato Cheese Nuggets', NULL, 'public/uploads/products/171212463726.jpg', NULL, '250 g', '160', '1', '2024-04-03 00:40:37', '2024-04-03 00:40:37', NULL),
(121, 2, 4, 'McCain Chilli Garlic Potato Bites Nuggets', NULL, 'public/uploads/products/171255864291.jpg', NULL, '700 g', '240', '1', '2024-04-03 00:51:19', '2024-04-08 01:14:02', NULL),
(122, 2, 4, 'McCain Crispy Potato Smile', NULL, 'public/uploads/products/171212547885.jpg', NULL, '750 g', '250', '1', '2024-04-03 00:54:38', '2024-04-03 00:54:38', NULL),
(123, 2, 4, 'McCain Veggie Burger Patty(Pack Of 2)', NULL, 'public/uploads/products/171255849780.jpg', NULL, '2 * 360', '286', '1', '2024-04-03 01:16:48', '2024-04-08 01:11:37', NULL),
(124, 2, 4, 'McCain Veggie Fingers (Pack Of 2)', NULL, 'public/uploads/products/171212693897.jpg', NULL, '2 * 400', '297', '1', '2024-04-03 01:18:58', '2024-04-03 01:18:58', NULL),
(125, 2, 4, 'Prasuma Bao Bun Veg Pizza (6 Baos)', NULL, 'public/uploads/products/17121272704.jpg', NULL, '300 g', '249', '1', '2024-04-03 01:24:30', '2024-04-03 01:24:30', NULL),
(126, 2, 4, 'Prasuma Bao Bun Spicy Veg', NULL, 'public/uploads/products/171213055567.jpg', NULL, '300 g', '199', '1', '2024-04-03 02:19:15', '2024-04-03 02:19:15', NULL),
(127, 2, 4, 'Prasuma Vegetable Spring roll', NULL, 'public/uploads/products/17125585322.jpg', NULL, '6 Pieces', '175', '1', '2024-04-03 02:20:15', '2024-04-08 01:12:12', NULL),
(128, 2, 4, 'Prasuma Veg Paneer And Momos', NULL, 'public/uploads/products/171213069313.jpg', NULL, '10 Pieces', '165', '1', '2024-04-03 02:21:33', '2024-04-03 02:21:33', NULL),
(129, 2, 4, 'Sumeru Aloo Paratha', NULL, 'public/uploads/products/171213093260.jpg', NULL, '2 * 400 g', '213', '1', '2024-04-03 02:25:32', '2024-04-03 02:25:32', NULL),
(130, 2, 4, 'Sumeru Classique Franky Paratha', NULL, 'public/uploads/products/171213098384.jpg', NULL, '400 g', '107', '1', '2024-04-03 02:26:23', '2024-04-03 02:26:23', NULL),
(131, 2, 4, 'Switz Puff Dough Paratha', NULL, 'public/uploads/products/171213107014.jpg', NULL, '400', '99', '1', '2024-04-03 02:27:50', '2024-04-03 02:29:37', NULL),
(132, 2, 4, 'Switz Spring Roll Dough Sheets', NULL, 'public/uploads/products/171213116282.jpg', NULL, '275 g', '99', '1', '2024-04-03 02:29:22', '2024-04-03 02:29:22', NULL),
(133, 2, 5, 'Meggi Cheese Macron Instant Noodles', NULL, 'public/uploads/products/171263902156.jpg', 'public/uploads/primary_images/171263902125.jpg', '70 g', '32', '1', '2024-04-08 23:33:41', '2024-04-08 23:33:41', NULL),
(134, 2, 5, 'Maggi Cheesy Tomato Instant Pasta', NULL, 'public/uploads/products/171264208129.jpg', 'public/uploads/primary_images/171264208139.jpg', '64 g', '32', '1', '2024-04-09 00:24:41', '2024-04-09 00:24:41', NULL),
(135, 2, 5, 'Chef\'s  Basket Instant Macron Pasta', NULL, 'public/uploads/products/171264291326.jpg', 'public/uploads/primary_images/171264291311.jpg', '850 g', '84', '1', '2024-04-09 00:38:33', '2024-04-09 00:38:33', NULL),
(136, 2, 5, 'Borges Speghetti Pasta', NULL, 'public/uploads/products/171264443564.jpg', 'public/uploads/primary_images/171264443525.jpg', '500 g', '189', '1', '2024-04-09 01:03:55', '2024-04-09 01:03:55', NULL),
(137, 2, 5, 'Sunfeast Yipee Tricolor Masala Instant Pasta (Pack of 2)', NULL, 'public/uploads/products/171264605213.jpg', 'public/uploads/primary_images/171264605277.jpg', '2 * 65 g', '37', '1', '2024-04-09 01:30:52', '2024-04-09 01:30:52', NULL),
(138, 2, 5, 'Sunfeast Yippee Cheese Instant Pasta', NULL, 'public/uploads/products/171264933817.jpg', 'public/uploads/primary_images/171264933895.jpg', '2 * 65 g', '37', '1', '2024-04-09 02:25:38', '2024-04-09 02:25:38', NULL),
(139, 2, 5, 'Bambino Pep Macaroni', NULL, 'public/uploads/products/171265736677.jpg', 'public/uploads/primary_images/17126573669.jpg', '850 g', '109', '1', '2024-04-09 04:39:26', '2024-04-09 04:39:26', NULL),
(140, 2, 5, 'MOM- Meal of the moment cheesy peri peri pasta', NULL, 'public/uploads/products/171265793918.jpg', 'public/uploads/primary_images/171265793927.jpg', '74 g', '99', '1', '2024-04-09 04:48:59', '2024-04-09 04:48:59', NULL),
(141, 2, 6, 'Yoga Bar Dark Chocolate Pancake Mix', NULL, 'public/uploads/products/171265842243.jpg', 'public/uploads/primary_images/171265842215.jpg', '150 G', '99', '1', '2024-04-09 04:57:02', '2024-04-09 04:57:02', NULL),
(142, 2, 6, 'MTR 3 Minute Poha Breakfast Mix', NULL, 'public/uploads/products/171265871098.jpg', 'public/uploads/primary_images/171265871025.jpg', '60 g', '25', '1', '2024-04-09 05:01:50', '2024-04-09 05:01:50', NULL),
(143, 2, 6, 'Suhana Paneer Tikka Masala Instant Mix', NULL, 'public/uploads/products/171265919944.jpg', 'public/uploads/primary_images/171265919937.jpg', '50 g', '45', '1', '2024-04-09 05:09:59', '2024-04-09 05:09:59', NULL),
(144, 2, 6, 'MTR Dosa Breakfast Mix', NULL, 'public/uploads/products/171265953976.jpg', 'public/uploads/primary_images/171265953964.jpg', '500 g', '135', '1', '2024-04-09 05:15:39', '2024-04-09 05:15:39', NULL),
(145, 2, 6, 'MTR Rava Idli Breakfast Mix', NULL, 'public/uploads/products/171266012948.jpg', 'public/uploads/primary_images/171266012923.jpg', '1 kg', '235', '1', '2024-04-09 05:25:29', '2024-04-09 05:25:29', NULL),
(146, 2, 6, 'MTR Rice Idli Breakfast Mix', NULL, 'public/uploads/products/171266077211.jpg', 'public/uploads/primary_images/171266077217.jpg', '500 g', '136', '1', '2024-04-09 05:36:12', '2024-04-09 05:36:12', NULL),
(147, 2, 6, 'MTR Sambhar Instant Mix', NULL, 'public/uploads/products/171266109774.jpg', 'public/uploads/primary_images/171266109799.jpg', '180 g', '105', '1', '2024-04-09 05:41:37', '2024-04-09 05:41:37', NULL),
(148, 2, 6, 'Gits Khaman Dhokla Instant Mix', NULL, 'public/uploads/products/171266352180.jpg', 'public/uploads/primary_images/171266352160.jpg', '180 g', '64', '1', '2024-04-09 06:22:01', '2024-04-09 06:22:01', NULL),
(149, 2, 6, 'MTR Upma Breakfast Mix', NULL, 'public/uploads/products/171272661834.jpg', 'public/uploads/primary_images/171272661859.jpg', '160 g', '60', '1', '2024-04-09 23:53:38', '2024-04-09 23:53:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0=>Inactive,1=>Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `name`, `description`, `profile_picture`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fruits', '<p><strong>Buy Fresh Fruits at&nbsp;<a href=\"https://blinkit.com/\">Online grocery s</a>tores&nbsp;in india</strong></p>\r\n\r\n<p>Are you super fond of online shopping because you hate crowded supermarkets? Now you don&#39;t need to be worry as Blinkit is delivering&nbsp;Fresh Fruits&nbsp;at your doorstep superfast with easy returns for your complete peace of mind.</p>\r\n\r\n<p>Get&nbsp;Fresh Fruits&nbsp;delivered to your home in minutes. you can check&nbsp;Fresh Fruits&nbsp;price before buying.</p>', 'public/uploads/subcategory/171039847884.jpg', '1', NULL, '2024-03-11 03:39:37', '2024-04-08 04:47:29'),
(2, 1, 'Vegetable', '<p>Fresh vegetables are an essential part of a healthy diet. Packed with vitamins, minerals, and fiber, they provide numerous health benefits and contribute to overall well-being. In this article, we will explore the world of fresh vegetables, discussing their importance, nutritional value, selection, and storage.<br />\r\n<br />\r\n<strong>Importance of Fresh Vegetables:</strong><br />\r\nIncluding fresh vegetables in your diet offers a myriad of advantages for your health:<br />\r\nNutrient-rich: Fresh vegetables are abundant in essential nutrients, such as vitamins (A, C, K, and B-complex), minerals (iron, potassium, and calcium), and dietary fiber.<br />\r\nDisease prevention: The consumption of fresh vegetables has been linked to a reduced risk of chronic diseases, including heart disease, certain types of cancer, and obesity.<br />\r\nWeight management: Vegetables are generally low in calories and high in fiber, making them ideal for weight management and maintaining a healthy body weight.<br />\r\nDigestive health: The fiber content in fresh vegetables promotes healthy digestion, aids in regular bowel movements, and contributes to gut health.<br />\r\n<br />\r\n<strong>Nutritional Value of Fresh Vegetables:</strong><br />\r\nDifferent types of fresh vegetables offer varying nutritional profiles. Here are some examples of commonly consumed vegetables and their key nutrients:<br />\r\nLeafy Greens (Spinach, Kale, and Lettuce): Rich in vitamins A, C, K, and folate, as well as minerals like iron and calcium.<br />\r\nCruciferous Vegetables (Broccoli, Cauliflower, and Brussels Sprouts): Packed with vitamin C, fiber, and phytochemicals that may have anti-cancer properties.<br />\r\nRoot Vegetables (Carrots, Potatoes, and Sweet Potatoes): Excellent sources of vitamin A, potassium, and dietary fiber.<br />\r\nAllium Vegetables (Onions, Garlic, and Leeks): Contain sulfur compounds that may offer immune-boosting and anti-inflammatory benefits.<br />\r\nColorful Vegetables (Bell Peppers, Tomatoes, and Eggplants): Vibrant-colored vegetables are rich in vitamins, antioxidants, and phytochemicals that support overall health.<br />\r\n<br />\r\n<strong>Selecting and Storing Fresh Vegetables:</strong><br />\r\nTo make the most of your fresh vegetables, consider the following tips for selection and storage:<br />\r\nChoose fresh and vibrant vegetables: Look for vegetables with bright colors, firm texture, and minimal blemishes or bruises. This indicates freshness and optimal nutrient content.<br />\r\nOrganic and local options: Opt for organic vegetables when possible, as they are grown without synthetic pesticides and fertilizers. Local produce tends to be fresher, as it spends less time in transit.<br />\r\nProper storage: Different vegetables have varying storage requirements. Generally, it&#39;s advisable to store vegetables in the refrigerator&#39;s crisper drawer, except for tomatoes, onions, and potatoes, which are best stored at room temperature.<br />\r\nHandling with care: Handle vegetables gently to avoid bruising or damage. Rinse them before consumption, but avoid washing them before storing, as excess moisture can accelerate spoilage.</p>', 'public/uploads/subcategory/171039890488.jpg', '1', NULL, '2024-03-11 03:42:39', '2024-04-08 04:43:11'),
(3, 2, 'Noodles', NULL, 'public/uploads/subcategory/171039893385.png', '1', NULL, '2024-03-11 04:03:59', '2024-03-14 01:18:53'),
(4, 2, 'Frozen Snacks', NULL, 'public/uploads/subcategory/17108250097.png', '1', NULL, '2024-03-11 04:14:19', '2024-03-18 23:40:09'),
(5, 2, 'Pasta', NULL, 'public/uploads/subcategory/171082499774.png', '1', NULL, '2024-03-11 04:17:03', '2024-03-18 23:39:57'),
(6, 2, 'Instant Mix', NULL, 'public/uploads/subcategory/171082497526.png', '1', NULL, '2024-03-11 04:56:41', '2024-03-18 23:39:35'),
(7, 2, 'Energy Bars', NULL, 'public/uploads/subcategory/171082495842.png', '1', NULL, '2024-03-11 04:57:11', '2024-03-18 23:39:18'),
(8, 2, 'Soup', NULL, 'public/uploads/subcategory/171082494280.png', '1', NULL, '2024-03-11 04:57:38', '2024-03-18 23:39:02'),
(9, 2, 'Frozen Veg', NULL, 'public/uploads/subcategory/171082492666.png', '1', NULL, '2024-03-11 04:58:05', '2024-03-18 23:38:46'),
(10, 2, 'Ready to Cook & Eat', NULL, 'public/uploads/subcategory/171082490822.png', '1', NULL, '2024-03-11 04:58:44', '2024-03-18 23:38:28'),
(11, 2, 'Deserts & Cake Mix', NULL, 'public/uploads/subcategory/171082488070.png', '1', NULL, '2024-03-11 04:59:28', '2024-03-18 23:38:00'),
(12, 2, 'Herbs & Seasoning', NULL, 'public/uploads/subcategory/171082486210.png', '1', NULL, '2024-03-11 04:59:51', '2024-03-18 23:37:43'),
(13, 2, 'Batter', NULL, 'public/uploads/subcategory/171082484113.jpg', '1', NULL, '2024-03-11 05:00:17', '2024-03-18 23:37:21'),
(14, 2, 'Imported Noodles & Pasta', NULL, 'public/uploads/subcategory/171082481393.png', '1', NULL, '2024-03-11 05:01:26', '2024-03-18 23:36:53'),
(15, 3, 'Biscuits Gift Pack', NULL, 'public/uploads/subcategory/171082475926.png', '1', NULL, '2024-03-11 05:24:15', '2024-03-18 23:35:59'),
(16, 3, 'Bread  & Pav', NULL, 'public/uploads/subcategory/171082473495.png', '1', NULL, '2024-03-11 05:28:11', '2024-03-18 23:35:34'),
(17, 3, 'Cookies', NULL, 'public/uploads/subcategory/171082470814.png', '1', NULL, '2024-03-11 05:28:42', '2024-03-18 23:35:08'),
(18, 3, 'Cream Biscuits', NULL, 'public/uploads/subcategory/171082468930.png', '1', NULL, '2024-03-11 05:30:33', '2024-03-18 23:34:49'),
(19, 3, 'Healthy & Digestive', NULL, 'public/uploads/subcategory/17108246535.png', '1', NULL, '2024-03-11 05:32:21', '2024-03-18 23:34:13'),
(20, 3, 'Rusk & Wafer', NULL, 'public/uploads/subcategory/171082462563.png', '1', NULL, '2024-03-11 05:33:09', '2024-03-18 23:33:45'),
(21, 3, 'Cake & Roll', NULL, 'public/uploads/subcategory/171082459267.png', '1', NULL, '2024-03-11 05:33:31', '2024-03-18 23:33:12'),
(22, 3, 'Baking Ingredients', NULL, 'public/uploads/subcategory/171082456885.png', '1', NULL, '2024-03-11 05:34:16', '2024-03-18 23:32:48'),
(23, 3, 'Sweet & Salty', NULL, 'public/uploads/subcategory/171082453897.png', '1', NULL, '2024-03-11 05:34:44', '2024-03-18 23:32:18'),
(24, 4, 'Atta', NULL, 'public/uploads/subcategory/171082448914.png', '1', NULL, '2024-03-11 05:58:26', '2024-03-18 23:31:29'),
(25, 4, 'Rice', NULL, 'public/uploads/subcategory/171082447359.png', '1', NULL, '2024-03-11 05:58:42', '2024-03-18 23:31:13'),
(26, 4, 'Toor, Urad & Chana', NULL, 'public/uploads/subcategory/171082443269.png', '1', NULL, '2024-03-11 05:59:15', '2024-03-18 23:30:32'),
(27, 4, 'Besan, Sooji & Maida', NULL, 'public/uploads/subcategory/17108243927.png', '1', NULL, '2024-03-11 05:59:43', '2024-03-18 23:29:52'),
(28, 4, 'Poha, Daliya & Other Grains', NULL, 'public/uploads/subcategory/171082435013.png', '1', NULL, '2024-03-11 06:00:15', '2024-03-18 23:29:10'),
(29, 4, 'Millet & Other Flours', NULL, 'public/uploads/subcategory/171082430552.png', '1', NULL, '2024-03-11 06:00:40', '2024-03-18 23:28:25'),
(30, 4, 'Rajma, Chhole & Others', NULL, 'public/uploads/subcategory/171082427363.png', '1', NULL, '2024-03-11 06:01:03', '2024-03-18 23:27:53'),
(31, 4, 'Moong & Masoor', NULL, 'public/uploads/subcategory/171082422675.png', '1', NULL, '2024-03-11 06:01:27', '2024-03-18 23:27:06'),
(32, 5, 'Tomato & Chilli Ketchup', NULL, 'public/uploads/subcategory/171082420014.png', '1', NULL, '2024-03-11 06:20:42', '2024-03-18 23:26:40'),
(33, 5, 'Asian Sauces', NULL, 'public/uploads/subcategory/171082417227.png', '1', NULL, '2024-03-11 06:21:06', '2024-03-18 23:26:12'),
(34, 5, 'Mayonnaise', NULL, 'public/uploads/subcategory/171082415246.png', '1', NULL, '2024-03-11 06:21:39', '2024-03-18 23:25:52'),
(35, 5, 'Peanut Butter', NULL, 'public/uploads/subcategory/171082412812.png', '1', NULL, '2024-03-11 06:22:02', '2024-03-18 23:25:28'),
(36, 5, 'Jam & Spreads', NULL, 'public/uploads/subcategory/17108240926.png', '1', NULL, '2024-03-11 06:22:33', '2024-03-18 23:24:52'),
(37, 5, 'Honey & Chyawanprash', NULL, 'public/uploads/subcategory/171082374815.png', '1', NULL, '2024-03-11 06:23:00', '2024-03-18 23:19:08'),
(38, 5, 'Syrups', NULL, 'public/uploads/subcategory/171082372199.png', '1', NULL, '2024-03-11 06:23:29', '2024-03-18 23:18:41'),
(39, 5, 'Indian Chutney & Pickle', NULL, 'public/uploads/subcategory/17108236986.png', '1', NULL, '2024-03-11 06:24:01', '2024-03-18 23:18:18'),
(40, 5, 'Dips', NULL, 'public/uploads/subcategory/171082367141.png', '1', NULL, '2024-03-11 06:24:35', '2024-03-18 23:17:51'),
(41, 5, 'Table Sauces', NULL, 'public/uploads/subcategory/171082364988.png', '1', NULL, '2024-03-11 06:25:00', '2024-03-18 23:17:29'),
(42, 5, 'Cooking Sauces & Vinegar', NULL, 'public/uploads/subcategory/171082362486.png', '1', NULL, '2024-03-11 06:25:34', '2024-03-18 23:17:04'),
(43, 5, 'Salad Dressings', NULL, 'public/uploads/subcategory/171082358523.png', '1', NULL, '2024-03-11 06:26:01', '2024-03-18 23:16:25'),
(44, 6, 'Diaper', NULL, 'public/uploads/subcategory/171082355150.png', '1', NULL, '2024-03-11 06:39:26', '2024-03-18 23:15:51'),
(45, 6, 'Bathing Needs', NULL, 'public/uploads/subcategory/171082352624.png', '1', NULL, '2024-03-11 06:39:54', '2024-03-18 23:15:26'),
(46, 6, 'Baby Wipes', NULL, 'public/uploads/subcategory/171082350273.png', '1', NULL, '2024-03-11 06:40:19', '2024-03-18 23:15:02'),
(47, 6, 'Baby Food', NULL, 'public/uploads/subcategory/171082348363.png', '1', NULL, '2024-03-11 06:40:45', '2024-03-18 23:14:43'),
(48, 6, 'Skin & Hair Care', NULL, 'public/uploads/subcategory/171084674568.png', '1', NULL, '2024-03-11 06:41:19', '2024-03-19 05:42:25'),
(49, 6, 'Feeding', NULL, 'public/uploads/subcategory/171041160634.png', '1', NULL, '2024-03-11 06:41:48', '2024-03-14 04:50:06'),
(50, 6, 'Oral & Nasal Care', NULL, 'public/uploads/subcategory/171041158751.png', '1', NULL, '2024-03-11 06:43:33', '2024-03-14 04:49:47'),
(51, 6, 'Hygiene', NULL, 'public/uploads/subcategory/171041156446.png', '1', NULL, '2024-03-11 06:48:06', '2024-03-14 04:49:24'),
(52, 6, 'Health & Safety', NULL, 'public/uploads/subcategory/171041154630.png', '1', NULL, '2024-03-11 06:48:37', '2024-03-14 04:49:06'),
(53, 7, 'Freshners', NULL, 'public/uploads/subcategory/17104115173.png', '1', NULL, '2024-03-11 22:32:39', '2024-03-14 04:48:37'),
(54, 7, 'Garbage Bags', NULL, 'public/uploads/subcategory/171041149218.png', '1', NULL, '2024-03-11 22:33:41', '2024-03-18 00:40:40'),
(55, 7, 'Liquid Detergents', NULL, 'public/uploads/subcategory/171041146564.png', '1', NULL, '2024-03-11 22:35:28', '2024-03-14 04:47:45'),
(56, 7, 'Laundry Additives', NULL, 'public/uploads/subcategory/171041144547.png', '1', NULL, '2024-03-11 22:38:45', '2024-03-14 04:47:25'),
(57, 7, 'Floor Cleaner & More', NULL, 'public/uploads/subcategory/171041142557.png', '1', NULL, '2024-03-11 22:41:27', '2024-03-14 04:47:06'),
(58, 7, 'Toilet Cleaner & More', NULL, 'public/uploads/subcategory/171041140649.png', '1', NULL, '2024-03-11 22:43:39', '2024-03-14 04:46:46'),
(59, 7, 'Detergent Powder & Bars', NULL, 'public/uploads/subcategory/171041138858.png', '1', NULL, '2024-03-11 23:00:55', '2024-03-14 04:46:28'),
(60, 7, 'Dishwashing Gels & Powder', NULL, 'public/uploads/subcategory/171041135536.png', '1', NULL, '2024-03-11 23:01:41', '2024-03-14 04:45:55'),
(61, 7, 'Cleaning Tools', NULL, 'public/uploads/subcategory/171041132581.png', '1', NULL, '2024-03-11 23:02:24', '2024-03-14 04:45:25'),
(62, 7, 'Dishwashing Bars', NULL, 'public/uploads/subcategory/17104113072.png', '1', NULL, '2024-03-11 23:03:01', '2024-03-14 04:45:07'),
(63, 7, 'Disinfectant & More', NULL, 'public/uploads/subcategory/171041129215.png', '1', NULL, '2024-03-11 23:05:27', '2024-03-14 04:44:52'),
(64, 7, 'Dishwashing Accessories', NULL, 'public/uploads/subcategory/171041124917.png', '1', NULL, '2024-03-11 23:06:30', '2024-03-14 04:44:09'),
(65, 7, 'Shoe Care', NULL, 'public/uploads/subcategory/17104112233.png', '1', NULL, '2024-03-11 23:07:44', '2024-03-14 04:43:43'),
(66, 8, 'Body Moisturizers & More', NULL, 'public/uploads/subcategory/17104111631.png', '1', NULL, '2024-03-11 23:53:25', '2024-03-14 04:42:43'),
(67, 8, 'Bath & Beauty Gifts', NULL, 'public/uploads/subcategory/171041108580.jpg', '1', NULL, '2024-03-11 23:54:08', '2024-03-14 04:41:25'),
(68, 8, 'Bathing Soaps', NULL, 'public/uploads/subcategory/171041102063.png', '1', NULL, '2024-03-11 23:55:26', '2024-03-14 04:40:20'),
(69, 8, 'Hair Oil & Serum', NULL, 'public/uploads/subcategory/171041098443.png', '1', NULL, '2024-03-11 23:56:47', '2024-03-14 04:39:44'),
(70, 8, 'Colgate', NULL, 'public/uploads/subcategory/17104109473.png', '1', NULL, '2024-03-11 23:57:26', '2024-03-14 04:39:07'),
(71, 8, 'Feminine Care', NULL, 'public/uploads/subcategory/171041091554.png', '1', NULL, '2024-03-11 23:57:58', '2024-03-14 04:38:35'),
(72, 8, 'Oral Care', NULL, 'public/uploads/subcategory/171041088385.png', '1', NULL, '2024-03-11 23:58:36', '2024-03-14 04:38:03'),
(73, 8, 'Face Cream & Lotion', NULL, 'public/uploads/subcategory/171041081799.png', '1', NULL, '2024-03-11 23:59:30', '2024-03-14 04:36:57'),
(74, 8, 'Hand Wash', NULL, 'public/uploads/subcategory/171041076629.png', '1', NULL, '2024-03-12 00:00:02', '2024-03-14 04:36:06'),
(75, 8, 'Face Care', NULL, 'public/uploads/subcategory/171041072966.png', '1', NULL, '2024-03-12 00:01:53', '2024-03-14 04:35:29'),
(76, 8, 'Shampoo & Conditioner', NULL, 'public/uploads/subcategory/171041070584.png', '1', NULL, '2024-03-12 00:02:31', '2024-03-14 04:35:05'),
(77, 8, 'Shower Gel & Scrub', NULL, 'public/uploads/subcategory/171041068169.png', '1', NULL, '2024-03-12 00:03:15', '2024-03-14 04:34:41'),
(78, 8, 'Men\'s Grooming', NULL, 'public/uploads/subcategory/171041065753.png', '1', NULL, '2024-03-12 00:03:51', '2024-03-14 04:34:17'),
(79, 8, 'Sunscreen', NULL, 'public/uploads/subcategory/171041061588.png', '1', NULL, '2024-03-12 00:08:30', '2024-03-14 04:33:35'),
(80, 8, 'Face Wash & Scrub', NULL, 'public/uploads/subcategory/171041059080.png', '1', NULL, '2024-03-12 00:09:02', '2024-03-14 04:33:10'),
(81, 8, 'Hair Styling', NULL, 'public/uploads/subcategory/171041056778.png', '1', NULL, '2024-03-12 00:09:31', '2024-03-14 04:32:47'),
(82, 8, 'Fragrance & Talc', NULL, 'public/uploads/subcategory/171041048074.png', '1', NULL, '2024-03-12 00:37:57', '2024-03-14 04:31:20'),
(83, 8, 'Hand & Foot Care', NULL, 'public/uploads/subcategory/171041043763.png', '1', NULL, '2024-03-12 00:38:32', '2024-03-14 04:30:37'),
(84, 8, 'Women\'s Grooming', NULL, 'public/uploads/subcategory/171041040878.png', '1', NULL, '2024-03-12 00:39:04', '2024-03-18 00:40:22'),
(85, 8, 'Makeup', NULL, 'public/uploads/subcategory/171041038617.png', '1', NULL, '2024-03-12 00:39:35', '2024-03-14 04:29:46'),
(86, 9, 'Milk', NULL, 'public/uploads/subcategory/171041036743.png', '1', NULL, '2024-03-12 01:54:20', '2024-03-14 04:29:27'),
(87, 9, 'Bread & Pav', NULL, 'public/uploads/subcategory/171041034516.png', '1', NULL, '2024-03-12 01:54:48', '2024-03-14 04:29:05'),
(88, 9, 'Flakes & Kids Cereal', NULL, 'public/uploads/subcategory/171041032060.png', '1', NULL, '2024-03-12 02:00:17', '2024-03-14 04:28:40'),
(89, 9, 'Muesli & Granola', NULL, 'public/uploads/subcategory/171041024288.png', '1', NULL, '2024-03-12 02:19:50', '2024-03-14 04:27:22'),
(90, 9, 'Oats', NULL, 'public/uploads/subcategory/171041021185.png', '1', NULL, '2024-03-12 02:34:19', '2024-03-14 04:26:51'),
(91, 9, 'Paneer & Tofu', NULL, 'public/uploads/subcategory/171040974729.png', '1', NULL, '2024-03-12 02:36:54', '2024-03-14 04:19:07'),
(92, 9, 'Curd & Yogurt', NULL, 'public/uploads/subcategory/171040970730.jpg', '1', NULL, '2024-03-12 02:41:28', '2024-03-14 04:18:27'),
(93, 9, 'Butter & More', NULL, 'public/uploads/subcategory/171040803562.png', '1', NULL, '2024-03-12 02:46:38', '2024-03-14 03:50:35'),
(94, 9, 'Cheese', NULL, 'public/uploads/subcategory/171040794153.png', '1', NULL, '2024-03-12 02:49:44', '2024-03-14 03:49:01'),
(95, 9, 'Cream & Whitener', NULL, 'public/uploads/subcategory/171040747081.png', '1', NULL, '2024-03-12 02:50:20', '2024-03-14 03:41:10'),
(96, 9, 'Condensed Milk', NULL, 'public/uploads/subcategory/171040724752.jpg', '1', NULL, '2024-03-12 02:50:55', '2024-03-14 03:37:27'),
(97, 9, 'Milk Drinks', NULL, 'public/uploads/subcategory/17104072339.png', '1', NULL, '2024-03-12 02:51:18', '2024-03-14 03:37:13'),
(98, 10, 'Cold Drinks', NULL, 'public/uploads/subcategory/171040720511.png', '1', NULL, '2024-03-12 03:26:59', '2024-03-14 03:36:45'),
(99, 10, 'Fruit Juices', NULL, 'public/uploads/subcategory/17104071797.png', '1', NULL, '2024-03-12 03:27:50', '2024-03-14 03:36:19'),
(100, 10, '100% Juices', NULL, 'public/uploads/subcategory/171040711622.png', '1', NULL, '2024-03-12 03:34:19', '2024-03-14 03:35:16'),
(101, 10, 'Concentrates & Syrups', NULL, 'public/uploads/subcategory/171040710070.png', '1', NULL, '2024-03-12 03:35:19', '2024-03-14 03:35:00'),
(102, 10, 'Herbal Drinks', NULL, 'public/uploads/subcategory/171040704839.png', '1', NULL, '2024-03-12 03:36:02', '2024-03-14 03:34:08'),
(103, 10, 'Energy Drinks', NULL, 'public/uploads/subcategory/171040702371.png', '1', NULL, '2024-03-12 03:36:22', '2024-03-14 03:33:43'),
(104, 10, 'Coconut Water', NULL, 'public/uploads/subcategory/171040693820.png', '1', NULL, '2024-03-12 03:36:57', '2024-03-14 03:32:18'),
(105, 10, 'Milk Drinks', NULL, 'public/uploads/subcategory/171040691849.png', '1', NULL, '2024-03-12 03:37:33', '2024-03-14 03:31:58'),
(106, 10, 'Water & Ice Cubes', NULL, 'public/uploads/subcategory/171084659386.png', '1', NULL, '2024-03-12 03:38:04', '2024-03-19 05:39:53'),
(107, 10, 'Cold Coffee & Ice Tea', NULL, 'public/uploads/subcategory/171040645071.png', '1', NULL, '2024-03-12 03:38:48', '2024-03-14 03:24:10'),
(108, 10, 'Soda & Mixers', NULL, 'public/uploads/subcategory/171040637599.jpg', '1', NULL, '2024-03-12 03:39:15', '2024-03-14 03:22:55'),
(109, 11, 'Tea', NULL, 'public/uploads/subcategory/171040631678.png', '1', NULL, '2024-03-12 04:25:07', '2024-03-14 03:21:56'),
(110, 11, 'Coffee', NULL, 'public/uploads/subcategory/171040626986.png', '1', NULL, '2024-03-12 04:26:00', '2024-03-14 03:21:09'),
(111, 11, 'Fruit Juices', NULL, 'public/uploads/subcategory/171040593169.png', '1', NULL, '2024-03-12 04:27:05', '2024-03-14 03:15:31'),
(112, 11, 'Health Drinks', NULL, 'public/uploads/subcategory/171040589092.png', '1', NULL, '2024-03-12 04:28:13', '2024-03-14 03:14:50'),
(113, 11, 'Green & Flavoured Tea', NULL, 'public/uploads/subcategory/171040578312.png', '1', NULL, '2024-03-12 04:29:11', '2024-03-14 03:13:03'),
(114, 11, 'Herbal Drinks', NULL, 'public/uploads/subcategory/171040574290.png', '1', NULL, '2024-03-12 04:31:01', '2024-03-14 03:12:22'),
(115, 11, 'Hot Chocolate', NULL, 'public/uploads/subcategory/171040570898.png', '1', NULL, '2024-03-12 04:32:32', '2024-03-14 03:11:48'),
(116, 11, 'Energy Drinks', NULL, 'public/uploads/subcategory/171040562411.png', '1', NULL, '2024-03-12 04:33:00', '2024-03-14 03:10:24'),
(117, 11, 'Milk Drinks', NULL, 'public/uploads/subcategory/171040556495.png', '1', NULL, '2024-03-12 04:37:55', '2024-03-14 03:09:24'),
(118, 11, 'Cold Coffee & Ice Tea', NULL, 'public/uploads/subcategory/171040552117.png', '1', NULL, '2024-03-12 04:38:41', '2024-03-14 03:08:41'),
(119, 11, 'Tea & Coffee Add-Ons', NULL, 'public/uploads/subcategory/171040546425.png', '1', NULL, '2024-03-12 04:40:28', '2024-03-14 03:07:44'),
(120, 11, 'Lactose Free Drink', NULL, 'public/uploads/subcategory/17104054129.png', '1', NULL, '2024-03-12 04:42:34', '2024-03-14 03:06:52'),
(121, 12, 'Oil', NULL, 'public/uploads/subcategory/171040538460.png', '1', NULL, '2024-03-12 04:57:09', '2024-03-14 03:06:24'),
(122, 12, 'Dry Fruits', NULL, 'public/uploads/subcategory/171040528431.png', '1', NULL, '2024-03-12 04:58:06', '2024-03-14 03:04:44'),
(123, 12, 'Whole Spices', NULL, 'public/uploads/subcategory/171040524024.png', '1', NULL, '2024-03-12 05:00:25', '2024-03-14 03:04:00'),
(124, 12, 'Powdered Spices', NULL, 'public/uploads/subcategory/171040516884.png', '1', NULL, '2024-03-12 05:01:13', '2024-03-14 03:02:48'),
(125, 12, 'Dates & Seeds', NULL, 'public/uploads/subcategory/171040511332.png', '1', NULL, '2024-03-12 05:02:25', '2024-03-14 03:01:53'),
(126, 12, 'Salt, Sugar & Jaggery', NULL, 'public/uploads/subcategory/1710405086100.png', '1', NULL, '2024-03-12 05:03:30', '2024-03-14 03:01:26'),
(127, 12, 'Papad & Fryums', NULL, 'public/uploads/subcategory/171040504566.png', '1', NULL, '2024-03-12 05:04:09', '2024-03-14 03:00:45'),
(128, 13, 'Cough & Cold', NULL, 'public/uploads/subcategory/171040501217.png', '1', NULL, '2024-03-12 05:46:49', '2024-03-14 03:00:12'),
(129, 13, 'Everyday Medicine', NULL, 'public/uploads/subcategory/171040498390.png', '1', NULL, '2024-03-12 05:47:54', '2024-03-14 02:59:43'),
(130, 13, 'Digestive Care', NULL, 'public/uploads/subcategory/171040496026.png', '1', NULL, '2024-03-12 05:48:54', '2024-03-14 02:59:20'),
(131, 13, 'Health Care Device', NULL, 'public/uploads/subcategory/171040493427.png', '1', NULL, '2024-03-12 05:49:42', '2024-03-14 02:58:54'),
(132, 13, 'Adult Diapers', NULL, 'public/uploads/subcategory/171040490089.png', '1', NULL, '2024-03-12 05:50:08', '2024-03-14 02:58:20'),
(133, 13, 'Vitamins & Daily Nutrition', NULL, 'public/uploads/subcategory/17104048839.png', '1', NULL, '2024-03-12 05:51:06', '2024-03-14 02:58:03'),
(134, 13, 'Proteins & Sports Supplements', NULL, 'public/uploads/subcategory/171040485171.png', '1', NULL, '2024-03-12 05:54:12', '2024-03-14 02:57:31'),
(135, 13, 'Wound Care & Pain Relief', NULL, 'public/uploads/subcategory/171040481320.png', '1', NULL, '2024-03-12 05:57:40', '2024-03-14 02:56:53'),
(136, 13, 'Antiseptic Liquid', NULL, 'public/uploads/subcategory/171039964380.png', '1', NULL, '2024-03-12 05:58:48', '2024-03-14 01:30:43'),
(137, 13, 'Oral Health & Eye Care', NULL, 'public/uploads/subcategory/171039953226.png', '1', NULL, '2024-03-12 06:01:00', '2024-03-14 01:28:52'),
(138, 13, 'Skin Treatments', NULL, 'public/uploads/subcategory/171039948257.png', '1', NULL, '2024-03-12 06:14:11', '2024-03-14 01:28:02'),
(139, 13, 'Masks & Sanitizers', NULL, 'public/uploads/subcategory/171039945729.png', '1', NULL, '2024-03-12 06:18:11', '2024-03-14 01:27:37'),
(140, 13, 'Health  Drinks', NULL, 'public/uploads/subcategory/17103994397.png', '1', NULL, '2024-03-12 06:18:44', '2024-03-14 01:27:19'),
(141, 13, 'Smoking Cessation', NULL, 'public/uploads/subcategory/171039942164.png', '1', NULL, '2024-03-12 06:19:19', '2024-03-14 01:27:01'),
(142, 13, 'Pre & Post Workout', NULL, 'public/uploads/subcategory/171039940174.png', '1', NULL, '2024-03-12 06:19:52', '2024-03-14 01:26:41'),
(143, 13, 'Herbal Drinks', NULL, 'public/uploads/subcategory/171039937771.png', '1', NULL, '2024-03-12 06:20:29', '2024-03-14 01:26:17'),
(144, 13, 'Other Supplements', NULL, 'public/uploads/subcategory/17103993471.png', '1', NULL, '2024-03-12 06:20:58', '2024-03-14 01:25:47'),
(145, 14, 'Dog Food', NULL, 'public/uploads/subcategory/171039932925.png', '1', NULL, '2024-03-12 06:37:58', '2024-03-14 01:25:29'),
(146, 14, 'Dog Treat', NULL, 'public/uploads/subcategory/171039930825.png', '1', NULL, '2024-03-12 06:38:18', '2024-03-14 01:25:08'),
(147, 14, 'Cat Food', NULL, 'public/uploads/subcategory/171039928397.png', '1', NULL, '2024-03-12 06:38:32', '2024-03-14 01:24:43'),
(148, 14, 'Cat Treat', NULL, 'public/uploads/subcategory/171039926715.png', '1', NULL, '2024-03-12 06:38:52', '2024-03-14 01:24:27'),
(149, 14, 'Pet Grooming', NULL, 'public/uploads/subcategory/171039924865.png', '1', NULL, '2024-03-12 06:39:20', '2024-03-14 01:24:08'),
(150, 14, 'Pet Health & Supplements', NULL, 'public/uploads/subcategory/171039922328.png', '1', NULL, '2024-03-12 06:39:44', '2024-03-14 01:23:43'),
(151, 14, 'Accessories & Other Supplies', NULL, 'public/uploads/subcategory/171039919093.png', '1', NULL, '2024-03-12 06:40:30', '2024-03-14 01:23:10'),
(152, 14, 'Pet Litter', NULL, 'public/uploads/subcategory/171039915878.png', '1', NULL, '2024-03-12 06:40:54', '2024-03-14 01:22:38'),
(153, 14, 'Pet Toys', NULL, 'public/uploads/subcategory/171039913279.png', '1', NULL, '2024-03-12 06:41:23', '2024-03-14 01:22:12'),
(154, 15, 'Chips & Crisps', NULL, 'public/uploads/subcategory/171039911095.png', '1', NULL, '2024-03-12 06:48:48', '2024-03-14 01:21:50'),
(155, 15, 'Rusk & Wafers', NULL, 'public/uploads/subcategory/171039909112.png', '1', NULL, '2024-03-12 06:49:21', '2024-03-14 01:21:31'),
(156, 15, 'Energy Bars', NULL, 'public/uploads/subcategory/171039906618.png', '1', NULL, '2024-03-12 06:49:50', '2024-03-14 01:21:06'),
(157, 15, 'Nachos', NULL, 'public/uploads/subcategory/171039904779.png', '1', NULL, '2024-03-12 06:50:48', '2024-03-14 01:20:47'),
(158, 15, 'Bhujia & Mixtures', NULL, 'public/uploads/subcategory/171039902723.png', '1', NULL, '2024-03-12 06:51:21', '2024-03-14 01:20:27'),
(159, 15, 'Popcorns', NULL, 'public/uploads/subcategory/171039901323.png', '1', NULL, '2024-03-12 06:52:07', '2024-03-14 01:20:13'),
(160, 15, 'Namkeen Snacks', NULL, 'public/uploads/subcategory/171039899384.png', '1', NULL, '2024-03-12 06:52:41', '2024-03-14 01:19:53'),
(161, 15, 'Makhana & More', NULL, 'public/uploads/subcategory/171039897487.jpg', '1', NULL, '2024-03-12 06:53:14', '2024-03-14 01:19:34'),
(162, 15, 'Papad & Fryums', NULL, 'public/uploads/subcategory/171039895942.png', '1', NULL, '2024-03-12 06:53:44', '2024-03-14 01:19:19'),
(163, 16, 'hhwhhhhh', NULL, NULL, '0', NULL, '2024-03-14 02:12:28', '2024-03-14 02:12:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profile_photo`, `phone_number`, `other_info`, `role`, `provider`, `provider_id`, `status`, `deleted_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@yopmail.com', '$2y$12$p/qQdyP840ib0sTu2JBi0egj2PbIviamRHDLOTlcl3Tf6HRT2eR7a', 'public/uploads/users/17102313069.jpg', '9652310478', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL, '2024-03-12 02:45:06'),
(2, 'Hiral', 'hiral@yopmail.com', '$2y$12$fo4Z1MPqxmwGs7UdX3l8O.js2q80rATiPvQ5xpx25ostOVhnv8VRq', NULL, '9874512036', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2024-04-23 23:39:05', '2024-04-23 23:39:05'),
(3, 'Jimin', 'jimin@yopmail.com', '$2y$12$Bx/xI92kwKMlSBpCgqABTOnkxDcXtYOdshX0GeDR5xaWI6slI5TtS', NULL, '9874512036', NULL, 'user', NULL, NULL, 'active', NULL, NULL, '2024-04-30 05:43:47', '2024-04-30 05:43:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
