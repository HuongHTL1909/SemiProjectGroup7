-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th8 12, 2022 lúc 11:52 PM
-- Phiên bản máy phục vụ: 5.7.36
-- Phiên bản PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ecommercel9`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New special discount', 'new-special-discount', '/storage/photos/1/Banners/coverwebcrep-1554432453i-1622454041-1623428656.png', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></p>', 'active', '2022-08-11 04:46:09', '2022-08-12 01:14:54'),
(2, 'Sample code constantly updated', 'offers when paying via paypal', '/storage/photos/1/Banners/shop-ban-giay-the-thao-dep-tp-hcm.jpg', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', 'active', '2022-08-11 04:46:56', '2022-08-12 01:30:09'),
(3, 'Popular items', 'popular-items', '/storage/photos/1/Banners/slider-2.png', 'a', 'active', '2022-08-11 04:59:00', '2022-08-12 01:17:58'),
(4, 'Elegance in every step', 'elegance-in-every-step', '/storage/photos/1/Banners/giay-tay-nam-da-nang-dang-cap.jpg', '<p>aaaaaaaaaaa</p>', 'active', '2022-08-12 01:31:57', '2022-08-12 01:31:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `codeBill` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

DROP TABLE IF EXISTS `billdetail`;
CREATE TABLE IF NOT EXISTS `billdetail` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `quantity` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billdetail_product_id_foreign` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'KAPA', 'kapa', 'active', '2022-08-11 01:30:42', '2022-08-11 01:30:42'),
(2, 'ADIDAS', 'adidas', 'active', '2022-08-11 01:30:50', '2022-08-11 01:30:50'),
(3, 'LUZYS', 'luzys', 'active', '2022-08-11 01:30:57', '2022-08-11 01:30:57'),
(4, 'DUEKSH', 'dueksh', 'active', '2022-08-11 01:31:05', '2022-08-11 01:31:05'),
(5, 'KAJYAGHAG', 'kajyaghag', 'active', '2022-08-11 05:00:29', '2022-08-11 05:00:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 1, 237500.00, 'new', 1, '237500.00', '2022-08-11 02:45:35', '2022-08-11 02:50:26'),
(4, 1, 2, 1, 300000.00, 'new', 2, '600000.00', '2022-08-11 02:52:22', '2022-08-11 04:25:53'),
(5, 5, 2, 1, 552000.00, 'new', 3, '1656000.00', '2022-08-11 02:53:03', '2022-08-11 04:25:53'),
(10, 6, 3, 1, 540000.00, 'new', 1, '540000.00', '2022-08-12 09:58:13', '2022-08-12 10:40:15'),
(11, 11, 3, 1, 395000.00, 'new', 1, '395000.00', '2022-08-12 10:39:32', '2022-08-12 10:40:15'),
(12, 10, 4, 1, 500000.00, 'new', 2, '1000000.00', '2022-08-12 10:44:32', '2022-08-12 10:45:08'),
(13, 1, 5, 1, 300000.00, 'new', 1, '300000.00', '2022-08-12 11:25:30', '2022-08-12 11:40:20'),
(14, 13, 5, 1, 850000.00, 'new', 1, '850000.00', '2022-08-12 11:25:48', '2022-08-12 11:40:20'),
(15, 13, 6, 1, 850000.00, 'new', 1, '850000.00', '2022-08-12 11:40:48', '2022-08-12 11:41:24'),
(16, 12, 6, 1, 350000.00, 'new', 1, '350000.00', '2022-08-12 11:40:53', '2022-08-12 11:41:24'),
(17, 15, NULL, 3, 540000.00, 'new', 2, '1080000.00', '2022-08-12 20:59:42', '2022-08-12 21:02:29'),
(18, 13, NULL, 4, 850000.00, 'new', 1, '850000.00', '2022-08-12 21:09:03', '2022-08-12 21:09:03'),
(19, 16, 7, 5, 500000.00, 'new', 3, '1500000.00', '2022-08-12 21:29:12', '2022-08-12 21:31:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sports shoes', 'sports-shoes', '<p>Lorem dddddddddddskjjjjjjjjjjjjjjjjjjjjjjjjj</p>', '/storage/photos/1/Category/cart-2.jpg', 1, NULL, NULL, 'active', '2022-08-11 01:29:02', '2022-08-11 01:29:02'),
(2, 'Fashion shoes', 'Men Shoes', '<p>Lorem síisuhshshsbsnsh</p>', '/storage/photos/1/Category/product-1.jpg', 1, NULL, NULL, 'active', '2022-08-11 01:30:10', '2022-08-12 11:22:47'),
(3, 'Nike shoes', 'Women Shoes', '<p>Lorem siushhsjsjsbsbhshshsjs</p>', '/storage/photos/1/Category/product-3.jpg', 1, NULL, NULL, 'active', '2022-08-11 01:30:32', '2022-08-12 11:22:17'),
(4, 'Soft climbing shoes', 'test', '<p>Loremne ssjshshs</p>', '/storage/photos/1/Category/p5.jpg', 1, NULL, NULL, 'active', '2022-08-11 05:00:03', '2022-08-11 21:20:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

DROP TABLE IF EXISTS `coupons`;
CREATE TABLE IF NOT EXISTS `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc', 'fixed', '10000.00', 'active', '2022-08-11 01:32:13', '2022-08-11 01:32:13'),
(2, 'aaaaaaaaa', 'fixed', '50000.00', 'active', '2022-08-12 21:27:15', '2022-08-12 21:27:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Group 7', 'Group 7', 'admin@gmail.com', NULL, '1234567890', 'Adddddddddddddddđ', NULL, '2022-08-11 05:08:13', '2022-08-11 05:08:13'),
(2, 'Ho Thi Lan Huong', 'Men Shoes', 'admin@gmail.com', NULL, '1234567890', 'The shop needs to import more product samples, but there are too few samples', NULL, '2022-08-12 21:34:46', '2022-08-12 21:34:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2022_08_06_140946_create_table_bill', 1),
(23, '2022_08_06_141010_create_table_billdetail', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fd0c6e84-6f01-4826-b0f8-6efce7b011e7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-du-lic-nam\",\"fas\":\"fa-star\"}', NULL, '2022-08-11 01:39:10', '2022-08-11 01:39:10'),
('9435998a-9c3c-43ba-a69b-97dae71c7584', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-11 02:50:26', '2022-08-11 02:50:26'),
('1da047ef-9f22-47d5-9324-c03936bbc1b1', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-11 04:25:53', '2022-08-11 04:25:53'),
('607302d8-9c76-459e-aa33-efa25a2cbc55', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-nam-jshsjhagagg\",\"fas\":\"fa-star\"}', NULL, '2022-08-11 05:06:17', '2022-08-11 05:06:17'),
('95c3d78c-4bd1-49b6-91a7-1e083dd4ab37', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/san-pham-nao-nen-mua\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-11 05:07:52', '2022-08-11 05:07:52'),
('2fa1db00-29fb-4ce5-b085-8a6bf478bf9f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-da-bong-san-co-nhan-tao-adidas-x-speedflow3\",\"fas\":\"fa-star\"}', NULL, '2022-08-12 10:33:16', '2022-08-12 10:33:16'),
('d8f2a6bb-5f34-4ef6-b5de-8fb6e3a2075a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 10:40:15', '2022-08-12 10:40:15'),
('a702ff71-b9e8-4f49-9b36-aaec3a398f9b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 10:45:08', '2022-08-12 10:45:08'),
('627921b8-2ae2-49bc-a9be-d15a891a81a9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 11:40:20', '2022-08-12 11:40:20'),
('704565a2-e290-48f7-a448-590df2627de8', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 11:41:24', '2022-08-12 11:41:24'),
('91a82990-9e61-4d64-83dc-a063acf68ff7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2022-08-12 21:31:52', '2022-08-12 21:31:52'),
('a7f4eacb-e3eb-471b-b2ac-682c45c0ffaf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-choi-bong-ro-protect-120\",\"fas\":\"fa-star\"}', NULL, '2022-08-12 21:33:04', '2022-08-12 21:33:04'),
('c7e7f38c-7569-46ed-87b5-76f650da5202', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/cac-mat-hang-dang-giam-gia-manh\",\"fas\":\"fas fa-comment\"}', NULL, '2022-08-12 21:33:53', '2022-08-12 21:33:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` decimal(18,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(7, 'ORD-UKIU8J5ZBC', 5, '1500000.00', 1, NULL, '1515000.00', 3, 'cod', 'unpaid', 'new', 'Ho Thi', 'Lan Huong', 'user@gmail.com', '1234567890', 'Viet Nam', '1223444', 'HN', '342 Ho Tung Mau Cau Dien Bac Tu Liem', '2022-08-12 21:31:50', '2022-08-12 21:31:50'),
(6, 'ORD-XCX0Q2TTML', 1, '1200000.00', 1, NULL, '1215000.00', 2, 'cod', 'unpaid', 'new', 'Group', '7', 'admin@gmail.com', '1234578902', 'Viet Nam', '1223444', 'HN', '342 Ho Tung Mau Cau Dien Bac Tu Liem', '2022-08-12 11:41:24', '2022-08-12 11:41:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Offers in August', 'offers in August', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Posts/post2.jpg', 'SJYSTSG', 1, NULL, 1, 'active', '2022-08-11 04:49:26', '2022-08-11 04:49:26'),
(2, 'Items are heavily discounted', 'items are heavily discounted', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Posts/blog_big_03.jpg', 'SJYSTSG', 1, NULL, 1, 'active', '2022-08-11 04:50:18', '2022-08-11 04:50:18'),
(3, 'Which product should I buy?', 'which product should I buy?', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Posts/post1.jpg', 'APOAHSH', 1, NULL, 1, 'active', '2022-08-11 04:51:17', '2022-08-11 04:51:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
CREATE TABLE IF NOT EXISTS `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Posts', 'new posts', 'active', '2022-08-11 04:48:14', '2022-08-11 04:48:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

DROP TABLE IF EXISTS `post_comments`;
CREATE TABLE IF NOT EXISTS `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 'KHSHSGSG', 'active', NULL, NULL, '2022-08-11 05:07:52', '2022-08-11 05:07:52'),
(2, 1, NULL, 'OK', 'active', NULL, NULL, '2022-08-12 21:33:53', '2022-08-12 21:33:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
CREATE TABLE IF NOT EXISTS `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'APOAHSH', 'apoahsh', 'active', '2022-08-11 04:48:26', '2022-08-11 04:48:26'),
(2, 'SJYSTSG', 'sjystsg', 'active', '2022-08-11 04:48:34', '2022-08-11 04:48:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'KAJHS Men Fashion Shoes', 'KAJHS-men-fashion-shoes', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', '/storage/photos/1/Products/p4.jpg', 100, '36,37,38', 'new', 'active', 300000.00, 0.00, 1, 2, NULL, 1, '2022-08-11 01:33:30', '2022-08-11 02:30:39'),
(2, 'Men Travel Shoes', 'men-travel-shoes', '<p><span style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time give you the pleasant warm feeling during the winter.</span><br></p>', '<p><span style=\"color: rgb(119, 119, 119); font-family: Roboto, sans-serif; font-size: 14px;\">Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time give you the pleasant warm feeling during the winter.</span><br></p>', '/storage/photos/1/Products/p7.jpg,/storage/photos/1/Products/p5.jpg,/storage/photos/1/Products/p8.jpg', 100, '40,41,42,43', 'hot', 'active', 450000.00, 10.00, 1, 2, NULL, 3, '2022-08-11 01:35:55', '2022-08-11 01:35:55'),
(3, 'Fashionable travel shoes', 'fashionable-travel-shoes', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Products/e-p1.png', 100, '40,41,42,43', 'hot', 'active', 500000.00, 0.00, 1, 2, NULL, 3, '2022-08-11 02:32:01', '2022-08-11 02:32:01'),
(4, 'KAJHS Women Fashion Shoes', 'KAJHS-women-fashion-shoes', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Products/p3.jpg', 100, '40,41,42,43', 'new', 'active', 250000.00, 5.00, 1, 3, NULL, 4, '2022-08-11 02:43:34', '2022-08-11 02:43:34'),
(5, 'Lorem issusmmss LJSHSHH', 'lorem-issusmmss-ljshshh', '<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br></p>', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span><br></p>', '/storage/photos/1/Products/p1.jpg', 100, '40,41,42,43', 'hot', 'active', 600000.00, 8.00, 1, 3, NULL, 4, '2022-08-11 02:45:00', '2022-08-11 02:45:00'),
(6, 'Men Shoes JSHSJHAGAGG', 'men-shoes-jshsjhagagg', '<p>Lidhdhsjshjshsggsg</p>', '<p>sjshgsjsksjshshhshshsgs</p>', '/storage/photos/1/Products/p28.jpg,/storage/photos/1/Products/p23.jpg', 200, '39,40,41,42,43,44', 'new', 'active', 600000.00, 10.00, 1, 2, NULL, 1, '2022-08-11 05:03:22', '2022-08-11 05:03:22'),
(7, 'RUN ONE SHOES FOR MEN - GRAY US', 'RUN-ONE-SHOES-FOR-MEN-GRAY US', '<p><span style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\">This shoe has an EVA foam sole so it is comfortable and lightweight for beginners.</span><br></p>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐƯỢC KIỂM TRA BỞI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày này đã được nhiều người chạy bộ kiểm nghiệm trong nhiều tháng trên đường chạy thực tế. Sản phẩm cũng đã trải qua một loạt kiểm tra cơ học trong phòng thí nghiệm.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Phần đế ngoài : 100.0% Ethylen Vinyl Acetat (EVA) Thân trên : 70.0% Polyester (PES), Thân trên : 30.0% Polyurethan (PU) Lớp lót : 100.0% Polyester (PES)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Nên bảo quản giày tránh ánh sáng trực tiếp (tia UV).</td></tr></tbody></table>', '/storage/photos/1/Products/images.png', 100, '39,40,41,42,43,44', 'hot', 'active', 275000.00, 0.00, 1, 1, NULL, 2, '2022-08-11 21:27:44', '2022-08-11 21:27:44'),
(8, 'TR2 TRAINING SHOES FOR MEN', 'TR2-TRAINING-SHOES-FOR-MEN', '<p><br></p><p><span style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\">Shoes made of breathable materials, thick foam at the heel and tongue.Đế đa năng của giày Run Active Grip giúp bạn chạy bộ dễ dàng trên đường phẳng và đường núi nhờ mang lại cảm giác thoải mái và độ bám tốt.</span><br></p>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Phần đế ngoài : 60.0% Cao su – Tổng hợp, Phần đế ngoài : 40.0% Ethylen Vinyl Acetat (EVA) Thân trên : 50.0% Polyester (PES), Thân trên : 50.0% Polyurethan (PU) Lớp lót : 100.0% Polyester (PES)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Nên bảo quản giày tránh ánh nắng trực tiếp (tia cực tím)</td></tr></tbody></table>', '/storage/photos/1/Products/images.jpg', 100, '39,40,41,42,43,44', 'new', 'active', 750000.00, 0.00, 1, 4, NULL, 4, '2022-08-11 21:31:15', '2022-08-11 21:31:15'),
(9, 'Agility 540 artificial turf football boots for adults - Black', 'Agility-540-artificial-turf-football-boots-for-adults-Black', '<div><b>PRODUCT PURPOSE</b></div><div><br></div><div><span style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\">Đôi giày đá bóng cho người lớn này được làm từ chất liệu da nhằm đem lại sự kiểm soát bóng tuyệt vời.Giày nâng cao cảm giác bóng và độ chính xác khi chơiLớp đệm giảm chấn bảo đảm sự thoải mái tuyệt vời.</span><br></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI BỀ MẶT CHƠI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">SÂN CỨNG</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BÁM</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Nhiều đinh nhỏ giúp bạn đặt chân chắc chắn trên các mặt sân cứng (cỏ nhân tạo và các sân cỏ nhân tạo khác).</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CẢM GIÁC BÓNG</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Sau khi quan sát các cầu thủ chơi bóng trên sân, chúng tôi nhận ra các cầu thủ chuyên nghiệp mong muốn có được cảm giác bóng tuyệt vời tại mọi thời điểm khi chơi nhằm cải thiện độ chính xác trong thao tác bóng.Các kỹ sư của chúng tôi đã chọn loại mũi giày mềm mại làm từ da bò để mang đến cảm giác bóng tốt nhất.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">SỰ THOẢI MÁI CHO NGƯỜI CHƠI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Chúng tôi biết rằng một đôi giày thoải mái là yếu tố quan trọng giúp bạn tập trung trong suốt trận đấu.Đó chính là lý do tại sao đội ngũ thiết kế của chúng tôi đã tạo ra mẫu giày Agility 540 HG với đế trong tạo hình trước và đệm PORON ở gót chân cùng bàn chân trước nhằm đem lại sự giảm chấn bền lâu và hỗ trợ cho gót chân.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ GIẢM CHẤN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Các sân bóng thường rất cứng, đó là lý do mà các kỹ sư của chúng tôi đã trang bị cho đế ngoài của giày Agility 540 lớp đệm EVA ở gót chân giúp giảm chấn tốt hơn cho toàn bộ bàn chân bạn.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BỀN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Chúng tôi biết rằng sự mài mòn do tiếp xúc với mặt sân do các chuyển động lặp đi lặp lại trong suốt trận đấu và các buổi tập luyện làm tăng tốc độ hao mòn cho giày của bạn. Đây là lý do mà các kỹ sư của chúng tôi đã chọn sử dụng da bò, chất liệu mang đến sự cân bằng tốt giữa độ thoải mái và bền bỉ. Với phần đế, chúng tôi đã chọn TPU vì độ bền tuyệt vời của nó, bao gồm cả trong các trận bóng khắc nghiệt để đáp ứng các nhu cầu của người chơi mức độ trung cấp.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁ NHÂN HÓA</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bởi vì mỗi cá nhân đều riêng biệt, bạn có thể cá nhân hóa giày đá bóng của mình tại cửa hàng Decathlon địa phương bạn (in tên, họ,...)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">2</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Phần đế ngoài : 60.0% Cao su – Tổng hợp, Phần đế ngoài : 40.0% Ethylen Vinyl Acetat (EVA) Thân trên : 50.0% Polyurethan (PU), Thân trên : 50.0% Da – Bò cái Lớp lót : 100.0% Polyester (PES)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bảo quản ở nơi khô ráo.Để giày ra khỏi túi.</td></tr></tbody></table>', '/storage/photos/1/Products/dhdgdh.png', 100, '39,40,41,42,43,44', 'new', 'active', 800000.00, 5.00, 1, 1, NULL, 4, '2022-08-11 21:45:59', '2022-08-11 21:45:59'),
(10, 'Agility 500 HG Children artificial turf soccer cleats - Blue', 'Agility-500-HG Children-artificial-turf-soccer-cleats - Blue', '<div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><h5 style=\"margin-bottom: 15px; font-weight: 600; font-size: 16px;\">MỤC ĐÍCH SẢN PHẨM</h5><p style=\"margin-bottom: 15px; font-weight: 600; font-size: 16px;\"><br></p><p style=\"margin-bottom: 15px; font-weight: 600; font-size: 16px;\"><span style=\"font-size: 14px; font-weight: 400;\">Chúng tôi đã tạo ra giày Agility 500 HG có độ phù hợp cao với các cầu thủ trẻ trình độ cao đang tập luyện bóng đá với cường độ 3 lần một tuần.Giày đá bóng có quai dán giúp bạn mang giày dễ dàng hơn.Đế giày HG (cho mặt sân cứng) mới mang đến độ bám tuyệt vời trên mặt sân cứng hoặc sân nhân tạo.</span><br></p></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">GIỚI TÍNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">MỌI GIỚI TÍNH</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI ĐINH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thanh giằng ổn định</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI ĐẾ GIÀY</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Định hình sẵn</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI DÂY THẮT</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Quai dán</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CHIỀU CAO GIÀY</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày cổ thấp</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CHẤT LIỆU</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Tổng hợp</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">KIỂU GIÀY</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Mới bắt đầu</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BỘ SƯU TẬP</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Agility</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TRÌNH ĐỘ LUYỆN TẬP</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Trình độ trung bình</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI BỀ MẶT CHƠI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">SÂN CỨNG</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">KÍCH CỠ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Vì sản phẩm được thiết kế đặc biệt cho các cầu thủ trẻ nên chúng tôi đã tạo ra một tỷ lệ cân xứng mới cho mẫu Agility 500 HG này để vừa vặn hơn với bàn chân của trẻ. Gót và mu bàn chân rộng hơn mang lại sự vừa vặn tốt nhất.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">SỰ THOẢI MÁI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Vì sản phẩm hướng tới đối tượng trẻ em, là nhóm người có cơ thể đang trong độ tuổi phát triển mạnh, vậy nên chúng tôi đã trang bị cho mẫu Agility 500 HG một đế trong tạo hình theo khuôn và đệm lót EVA ở gót chân để mang lại sự êm ái và nâng đỡ cho gót chân của trẻ. Nhóm thiết kế của chúng tôi cũng đã nhân đôi phần đệm bảo vệ bên dưới giày để bảo vệ gót chân và giảm sự ma sát nhằm tăng độ thoải mái cho người dùng. Phần thân trên linh hoạt và thoải mái.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BÁM</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Sân bóng đá vẫn đang thay đổi, vậy nên chúng tôi tạo ra Agility 500 với đế HG hoàn hảo cho việc tập luyện trên mặt sân cứng và sân nhân tạo. Đội ngũ thiết kế của chúng tôi đã sáng tạo nên phần đế với các đinh nhỏ để mang đến độ bám tối ưu mà không lo ngại về việc sỏi hoặc cao su bị mắc kẹt trong đế giày.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BUỘC DÂY GIÀY DỄ DÀNG</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Nhóm những người hâm mộ môn bóng đá của chúng tôi đã dàng ngày thứ tư hàng tuần của mình ngoài sân bóng và quan sát thấy nhiều phụ huynh và huấn luyện viên phải buộc lại dây giày cho trẻ trong suốt buổi tập.Chúng tôi vì thế đã sáng tạo ra hệ thống buộc dây giày dễ dàng hơn cho trẻ. Giải pháp thắt dây giày dễ dàng kết hợp các dây giày, quai co giãn, quai dán hai bên, khiến việc này lý tưởng hơn cho các bàn tay nhỏ. Nhờ vậy bạn sẽ có nhiều thời gian luyện tập!Các huấn luyện viên sẽ thích nó</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BỀN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Chất liệu TPU sử dụng để làm giày Agility 500 HG chịu được sự mài mòn tạo ra bởi cả mặt sân và các cầu thủ nhí xuyên suốt mùa giải, bất kể điều kiện chơi bóng.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁ NHÂN HÓA</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Điều gì tốt hơn việc sở hữu một đôi giày độc đáo, mang phong cách cá nhân bạn? Viết tên, họ hay số của bạn và tạo ra một đôi giày của riêng bạn. Xưởng sửa chữa tại cửa hàng Decathlon gần bạn có thể giúp bạn làm việc này.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">2</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thân trên : 100.0% Polyurethan (PU) Lớp lót : 100.0% Polyester (PES) Phần đế ngoài : 60.0% Cao su – Tổng hợp, Phần đế ngoài : 40.0% Ethylen Vinyl Acetat (EVA)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Lấy giày ra khỏi túi sau khi sử dụng. Bảo quản ở nơi khô ráo, thoáng mát.</td></tr></tbody></table>', '/storage/photos/1/Products/s.jpg', 100, '39,40,41,42,43,44', 'hot', 'active', 500000.00, 0.00, 1, 1, NULL, 2, '2022-08-11 21:51:25', '2022-08-11 21:51:25'),
(11, 'Adidas X Speedflow.3 Artificial Grass Soccer Shoe', 'Adidas-X-Speedflow.3 Artificial-Grass-Soccer-Shoe', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">PRODUCT PURPOSE</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p>Đế bằng cao su thiên nhiên mang lại độ bám trụ tuyệt vời.Đôi giày đá bóng dành cho người lớn này rất lý tưởng cho người mới bắt đầu chơi đá bóng.</p></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">GIỚI TÍNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">NGƯỜI LỚN</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI ĐINH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thanh giằng ổn định</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CHIỀU CAO GIÀY</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày cổ thấp</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CHẤT LIỆU</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Tổng hợp</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TRÌNH ĐỘ LUYỆN TẬP</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Mới bắt đầu</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">LOẠI BỀ MẶT CHƠI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Cỏ nhân tạo ngắn</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BÁM</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Các đinh giày phân bố đồng đều dọc đế giày giúp cung cấp lực kéo tốt hơn trên các mặt sân cứng hay sân cỏ nhân tạo.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỘ BỀN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Được làm từ PU nhằm đảm bảo giày sẽ chịu được các yêu cầu của một mùa bóng.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">KIỂM SOÁT BÓNG</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Chất liệu tổng hợp mềm dẻo nâng cao sự kiểm soát bóng.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁ NHÂN HÓA</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bạn có cá nhân hóa bằng cách in tên hay số của mình lên giày.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">2</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Phần đế ngoài : 100.0% Cao su – Tổng hợp Thân trên : 100.0% Polyurethan (PU) Lớp lót : 100.0% Polyester (PES)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bảo quản ở nơi khô ráo.Lấy giày ra khỏi túi của bạn.</td></tr></tbody></table>', '/storage/photos/1/Products/e.jpg', 100, '39,40,41,42,43,44', 'hot', 'active', 395000.00, 0.00, 1, 2, NULL, 1, '2022-08-11 21:56:44', '2022-08-11 21:56:44'),
(12, 'LV Trainer Shoes White Black REP', 'LV-Trainer-Shoes-White-Black-REP', '<p><span style=\"color: rgb(43, 43, 43); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Real photo&nbsp;</span><a href=\"https://duongluxury.com/giay-nam-gucci-ace-hoa-tiet-ke-xanh-la-gngc12/\" data-wpel-link=\"internal\" style=\"color: rgb(218, 0, 0); background-color: rgb(255, 255, 255); transition: all 0.3s ease 0s; font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">Giày nam Gucci Ace họa tiết kẻ xanh lá GNGC12</a><span style=\"color: rgb(43, 43, 43); font-family: &quot;Open Sans&quot;, Helvetica, Arial, sans-serif; font-size: 14px;\">&nbsp;hàng siêu cấp do xưởng sản xuất cung cấp.</span><br></p>', '<table class=\"table\" style=\"caption-side: bottom; --bs-table-bg:transparent; --bs-table-striped-color:#212529; --bs-table-striped-bg:rgba(0, 0, 0, 0.05); --bs-table-active-color:#212529; --bs-table-active-bg:rgba(0, 0, 0, 0.1); --bs-table-hover-color:#212529; --bs-table-hover-bg:rgba(0, 0, 0, 0.075); width: 451px; color: rgb(33, 37, 41); vertical-align: top; border-color: rgb(222, 226, 230); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><tbody style=\"border-style: solid; border-width: 0px; vertical-align: inherit;\"><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Nhãn hiệu:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Agiay</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Tên sản phẩm:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Giày Thể Thao Nam BN0135</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Mã SP:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">BN0135</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Chất liệu mũ:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Vải Lưới - Da PU</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Chất liệu đế:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">PVC</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Màu:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Ghi - Nâu</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Size:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">39 - 44</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Faulty product:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">1 for 1 in 14 days</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Guarantee:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">12 months</td></tr></tbody></table>', '/storage/photos/1/Products/z3474412758704_8642c2540a417045ad083f1382ce0944-300x300.jpg', 200, '39,40,41,42,43,44', 'hot', 'active', 350000.00, 0.00, 1, 2, NULL, 3, '2022-08-12 11:05:06', '2022-08-12 11:05:06'),
(13, 'Men Sports Shoes AG0156', 'Men-Sports-Shoes-AG0156', '<p><br></p><hr style=\"margin: 25px 0px; border-top-color: rgb(245, 246, 246); color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><h5 style=\"margin-bottom: 15px; font-weight: 600; font-size: 16px;\">MỤC ĐÍCH SẢN PHẨM</h5><p>Giày làm bằng chất liệu thông thoáng, phần mút dày ở gót và lưỡi gà.Đế đa năng của giày Run Active Grip giúp bạn chạy bộ dễ dàng trên đường phẳng và đường núi nhờ mang lại cảm giác thoải mái và độ bám tốt.</p></div>', '<h2 class=\"accordion-header\" id=\"flush-headingOne\" style=\"margin-bottom: 0px; font-size: 21px; color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#flush-collapseOne\" aria-expanded=\"true\" aria-controls=\"flush-collapseOne\" style=\"font-size: 1rem; position: relative; display: flex; align-items: center; width: 451px; padding: 1rem 1.25rem; color: rgb(12, 99, 228); background-color: rgb(231, 241, 255); border-width: 0px 0px 1px; border-top-style: solid; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: rgba(0, 0, 0, 0.125); border-right-color: initial; border-bottom-color: rgba(0, 0, 0, 0.125); border-left-color: initial; overflow-anchor: none; transition: color 0.15s ease-in-out 0s, background-color 0.15s ease-in-out 0s, border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s, border-radius 0.15s ease 0s;\">THÔNG TIN SẢN PHẨM</button></h2><div id=\"flush-collapseOne\" class=\"accordion-collapse collapse show\" aria-labelledby=\"flush-headingOne\" data-bs-parent=\"#accordionFlushExample\" style=\"border: 0px solid rgba(0, 0, 0, 0.125); color: rgb(33, 37, 41); font-family: system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;;\"><table class=\"table\" style=\"caption-side: bottom; --bs-table-bg:transparent; --bs-table-striped-color:#212529; --bs-table-striped-bg:rgba(0, 0, 0, 0.05); --bs-table-active-color:#212529; --bs-table-active-bg:rgba(0, 0, 0, 0.1); --bs-table-hover-color:#212529; --bs-table-hover-bg:rgba(0, 0, 0, 0.075); width: 451px; color: rgb(33, 37, 41); vertical-align: top; border-color: rgb(222, 226, 230);\"><tbody style=\"border-style: solid; border-width: 0px; vertical-align: inherit;\"><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Nhãn hiệu:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Agiay</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Tên sản phẩm:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Giày Thể Thao Nam AG0156</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Mã SP:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">AG0156</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Chất liệu mũ:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Da sợi, vải sợi</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Chất liệu đế:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Cao su non</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Màu:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">Black - White</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Size:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">39 - 44</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Faulty product:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">1 for 1 in 14 days</td></tr><tr style=\"border-style: solid; border-width: 0px;\"><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\"><span style=\"font-weight: bolder;\">Bảo hành:</span></td><td style=\"border-color: inherit; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-width: 0px 0px 1px; padding: 0.5rem; background-color: var(--bs-table-bg); background-image: linear-gradient(var(--bs-table-accent-bg),var(--bs-table-accent-bg));\">12 tháng</td></tr></tbody></table></div>', '/storage/photos/1/Products/giay-the-thao-nam-ag0156-2.jpg,/storage/photos/1/Products/giay-the-thao-nam-ag0156-5.jpg,/storage/photos/1/Products/giay-the-thao-nam-ag0156-9.jpg', 100, '39,40,41,42,43,44', 'new', 'active', 850000.00, 0.00, 1, 1, NULL, 3, '2022-08-12 11:12:36', '2022-08-12 11:18:26');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(14, 'Children 1 row Play 5 roller skates - Red/Black', 'Children-1-row-Play-5-roller-skates - Red/Black', '<p><div class=\"product-information\" style=\"box-sizing: border-box; background-color: rgb(255, 255, 255); color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"product-tabs\" style=\"box-sizing: border-box;\"><div class=\"container-fluid\" style=\"box-sizing: border-box; width: 1349px; padding-right: 15px; padding-left: 15px; margin-right: auto; margin-left: auto;\"><div class=\"tabs-header\" style=\"box-sizing: border-box; border-bottom: 1px solid rgb(226, 226, 226); position: sticky; top: 65px; z-index: 1000; background: rgb(255, 255, 255); transition: all 0.2s ease 0s; padding: 5px;\"><span style=\"font-size: 16px; font-weight: 600;\">MỤC ĐÍCH SẢN PHẨM</span><ul style=\"box-sizing: border-box; margin: 0px; padding: 0px; display: flex; list-style: none; font-weight: 600; align-items: center; justify-content: space-around;\"></ul></div></div></div></div></p><div class=\"product-main-content\" style=\"box-sizing: border-box; padding-top: 20px; padding-bottom: 15px; background-color: rgb(255, 255, 255); display: flex; flex-wrap: wrap; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div class=\"right-content\" style=\"box-sizing: border-box; flex-grow: 1; flex-basis: 0%; max-width: 45%; padding-top: 10px; padding-right: 40px;\"><div class=\"made-for\" style=\"box-sizing: border-box;\"><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 14px;\">Dễ dàng sử dụng để trải nghiệm cảm giác trượt lần đầu tiên. Hoàn hảo để có được niềm vui trong khi học trượt.</p></div></div></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÔNG CÁO PHÁP LÝ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Chứng nhận tuân thủ: EN13843, hạng B (tiêu chuẩn trượt patin 1 hàng) Cỡ Thiếu niên 8/10 (nếu có): Tiêu chuẩn EN71 (tiêu chuẩn đồ chơi)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÓ THỂ ĐIỀU CHỈNH THEO 3 CỠ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Dễ dàng điều chỉnh và đơn giản, những đôi giày trượt patin 1 hàng này có thể nới rộng cùng với sự phát triển của con bạn. Có thể điều chỉnh cỡ giày trượt theo cỡ chân con bạn!</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">NÂNG ĐỠ VÀ ĐỘ BỀN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thân ngoài cứng (Hard Boot) giúp bảo vệ lâu dài và nâng đỡ tốt cổ chân cho trẻ. Giày cứng và bền giúp bảo vệ chân hoàn hảo.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BÁNH XE &amp; VÒNG BI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bánh xe nhỏ đường kính 63 mm bằng cao su PU (độ bám tốt, an toàn, dễ xử lý). Vòng bi ABEC 1 cho hiệu quả trượt tốt. Bộ kẹp giữ thăng bằng phù hợp với mọi kích cỡ: giúp trẻ bắt đầu tập chơi với hình dạng \"xe ba bánh\" tạo thăng bằng giúp trẻ có thêm tự tin hơn trong những lần trượt đầu tiên. Có thể dễ dàng chuyển đổi trở lại chế độ trượt patin 1 hàng. (Bộ thăng bằng bán riêng, mẫu số 8282768).</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">DỄ DÀNG ĐI GIÀY VÀ SIẾT CHẶT GIÀY</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Những đôi giày trượt patin 1 hàng này dễ mang vào/tháo ra nhờ khóa gài đơn giản mà hiệu quả. Hai khóa gài giữ chân cố định. Khi chọn đúng chiều dài thì không cần phải điều chỉnh thêm. Bạn có thể an tâm khi biết rằng trẻ sẽ sớm có thể tự trượt patin.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">QUAI XÁCH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Dễ mang giày theo hoặc buộc chung giày lại với nhau bằng dây đeo phía sau thân trong.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO DƯỠNG VÀ SỬA CHỮA</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Có thể thay thế hoặc sửa chữa giày trượt bằng các phụ tùng có tại Xưởng lắp ráp hoặc gian hàng bán giày trượt tại cửa hàng Decathlon gần nhất. Có thể đổi phanh: Có thể lắp phanh bên chân trái hoặc chân phải. (Có bán tại cửa hàng, mẫu số 8110638). Có thể giặt phần thân trong bằng máy giặt ở 30°C: giặt phần thân trong thường xuyên để ngăn không cho vi khuẩn phát triển. Tìm tư vấn và hướng dẫn trên kênh YouTube của chúng tôi: https://www.youtube.com/user/oxelo/videos</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">KHÔNG TỐN KÉM KHÔNG CÓ NGHĨA LÀ GIẢM BỚT AN TOÀN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Oxelo cam kết bảo vệ an toàn cho giày trượt trẻ em theo khả năng chuyên môn của mình. Chúng tôi quyết định lắp phanh và bánh cao su cho tất cả sản phẩm dành cho trẻ em thay vì nhựa PVC, bởi vì an toàn cho trẻ là ưu tiên hàng đầu của chúng tôi. Không như PVC, cao su có độ bám tốt trên mặt sân cứng và bảo vệ trẻ không bị trượt khi bắt đầu chơi cũng như giúp trẻ phanh lại hiệu quả.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày trượt ván : 100.0% Polypropylen (PP) Bánh xe : 50.0% Polyurethan (PU), Bánh xe : 50.0% Polycarbonat (PC) Khung kim loại : 100.0% Polypropylen (PP) Dây quấn : 100.0% Polyetylen Mật độ cao Phần bên trên - Lớp vải chính : 100.0% Polyester (PES) Khóa cài : 50.0% Polyurethan (PU), Locks : 50.0% Polyamid 6.6 (PA6.6) Vòng bi : 100.0% STEEL</td></tr></tbody></table>', '/storage/photos/1/Products/ssksj.png', 100, '39,40,41,42,43,44', 'new', 'active', 400000.00, 5.00, 1, 1, NULL, 2, '2022-08-12 11:16:57', '2022-08-12 11:16:57'),
(15, 'NH100 FACIAL SHOES FOR MEN', 'NH100-FACIAL-SHOES-FOR-MEN', '<p><br></p><hr style=\"margin: 25px 0px; border-top-color: rgb(245, 246, 246); color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><h5 style=\"margin-bottom: 15px; font-weight: 600; font-size: 16px;\">MỤC ĐÍCH SẢN PHẨM</h5><p>Giày cổ lửng NH100 thân thiện với môi trường dành cho những chuyến đi bộ vùng đồng bằng, trong rừng hoặc dọc theo bờ biển, trong thời tiết khô ráo.Động lực của chúng tôi? Thiết kế dòng giày cổ lửng vừa nhẹ vừa thoải mái, bám tốt trên những con đường bằng khó đi. Với mức giá rất hợp lý!</p></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐỊA ĐIỂM LUYỆN TẬP</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Ngoài trời</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐẾ CÓ ĐỘ BÁM CAO TRÊN CÁC ĐỊA HÌNH TỰ NHIÊN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thiết kế đế là kết quả của nghiên cứu tiến hành tại phòng thí nghiệm của chúng tôi trong thời gian dài. Đế giày sử dụng công thức cao su riêng biệt giúp tối ưu độ bám và lực kéo. Vì mỗi khách hàng lại có một nhu cầu khác nhau, chúng tôi luôn tìm kiếm giải pháp tốt nhất cho địa hình đồng bằng tơi mềm như đường rừng và đường ven biển.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">DÀNH CHO CÁC ĐỊA HÌNH VÙNG ĐỒNG BẰNG</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày đi bộ được thiết kế để dùng trên đường địa hình. Thực tế, chúng tôi lựa chọn và kiểm nghiệm các thành phần đế và thân trên để đảm bảo giày hoàn toàn phù hợp để đi bộ trên đường địa hình mềm (đường rừng chưa trải nhựa) hoặc địa hình sỏi đá (đường bờ biển sỏi đá). Sử dụng trên đường phố (đường nhựa) có thể khiến giày bị mòn sớm và gây cảm giác khó chịu. Không phù hợp cho leo núi.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">KIỂM NGHIỆM TRONG PHÒNG THÍ NGHIỆM</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Các kiểm nghiệm khác trong phòng thí nghiệm được thực hiện để kiểm nghiệm các yếu tố sau: gắn mắt xỏ và dây đai, đường may, độc tố, kháng UV, độ mài mòn đế giày và mặt trên, độ bền. Những kiểm nghiệm này cho phép chúng tôi nâng cao chất lượng của sản phẩm và tránh tình trạng giày hiking bị mòn sớm.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁCH CHỌN KÍCH CỠ GIÀY ĐI BỘ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Mang giày với tất dùng cho leo núi dã ngoại và thử đứng lên.Thử nhiều mẫu hoặc kích cỡ nếu cần. Kiểm tra độ thoải mái ở hai điểm sau: - phần gót chân - phần mũi chân khi đi xuống dốc. Tránh không bị ép chân khi mang thử giày. Thử đi lại quanh cửa hàng. Bắt đầu mang giày dần dần trong các chuyến leo núi dã ngoại đầu tiên để giày trở nên thoải mái.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">GIÀY/TẤT ĐÓNG VAI TRÒ QUAN TRỌNG</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Có rất nhiều nguyên nhân gây phồng rộp khi đi hiking: chà xát, tất bị gấp nếp, hơi ẩm, kích cỡ giày quá nhỏ hoặc quá lớn, v.v. Do đó, cần chọn đúng cỡ và đi tất làm từ chất liệu phù hợp.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁCH CHỌN KÍCH CỠ TẤT ĐI BỘ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Bạn cần chọn cỡ tất vừa chân để tất không bị gấp nếp: tất quá rộng có thể tạo ra các nếp gấp khiến có quá nhiều vải quanh chân hay nếu tất quá chật thì vải sẽ bị kéo căng về phía lòng bàn chân.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CÁCH CHỌN CHẤT VẢI CỦA TẤT</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Cần kiểm soát được độ ẩm tốt nhất có thể khi đi bộ: bạn sẽ ra mồ hôi, đó là điều không thể tránh được. Nếu giày của bạn thoáng khí, giày sẽ thoát hơi ẩm khi đổ mồ hôi. Do vậy, bạn cũng cần lựa chọn tất nhẹ và thoáng khí. Nếu giày của bạn chống thấm tương đối, bạn sẽ không lựa chọn như vậy để tránh hơi ẩm của nước mưa: nên mua tất có khả năng thấm hút mồ hôi để giúp chân luôn khô thoáng.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">CHỌN TẤT CHO GIÀY CỔ LỬNG NH100</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Mẫu giày này tương đối thoáng khí, nhưng không đủ để làm thoát toàn bộ hơi ẩm do tiết mồ hôi. Do đó, bạn nên chọn loại tất cổ lửng NH500. Dòng tất này có thành phần bông thấm hút hơi ẩm và có thiết kế bông xù đan ngược phía dưới tất giúp khô thoáng hơi ẩm. Tất đủ cao để bảo vệ mắt cá chân khỏi giày cổ cao. Sự kết hợp tuyệt vời này giảm nguy cơ phồng rộp.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày của chúng tôi được bảo hành 2 năm. Cam kết của chúng tôi? Mang đến những sản phẩm bền chắc cho mọi chuyến đi bộ dã ngoại vùng đồng bằng. Vì sản phẩm tâm huyết của chúng tôi là sản phẩm đồng hành cùng bạn viết tiếp những câu chuyện mới!</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">2</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐƯỢC KIỂM TRA BỞI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Tại chân núi Mont Blanc, Pháp, đội ngũ thiết kế của chúng tôi đã lên ý tưởng và thiết kế các sản phẩm Quechua. Sản phẩm được kiểm nghiệm thực tế cùng những người đi bộ dã ngoại khác để đảm bảo độ thoải mái và tính bền bỉ. Ví dụ như rừng Fontainebleau hoặc ở Brittany. Chúng tôi kiểm nghiệm ở nhiều nơi nhất có thể, trong mọi điều kiện thời tiết. Điều này tạo ra nhiều cơ hội thảo luận để tiếp nhận ý kiến người dùng và lên kế hoạch cho sản phẩm trong tương lai!</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Outsole : 100.0% Rubber - thermoplastic Upper body : 57.1% Polyester (PES), Upper body : 42.9% Polyurethan (PU) Lining : 50.0% Polyester (PES), Lining : 50.0% Ethylen Vinyl Acetat (EVA)</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Store in a dry, dark and well-ventilated place.</td></tr></tbody></table>', '/storage/photos/1/Products/giay-the-thao-nam-ag0156-2.jpg,/storage/photos/1/Products/giay-the-thao-nam-ag0156-5.jpg,/storage/photos/1/Products/giay-the-thao-nam-ag0156-9.jpg,/storage/photos/1/Products/images.png', 100, '39,40,41,42,43,44', 'new', 'active', 600000.00, 10.00, 1, 4, NULL, 4, '2022-08-12 20:56:21', '2022-08-12 20:56:21'),
(16, 'PROTECT BABY SHOES 120', 'PROTECT-BABY-SHOES-120', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">PRODUCT PURPOSE</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p>Chúng tôi thiết kế giày bóng rổ này cho người mới bắt đầu chơi bóng rổ giải trí hoặc trong câu lạc bộ.Giày chơi bóng rổ của Tarmak này có phần đế giảm chấn được làm bằng mút đúc ép (EVA) có bổ sun
g giảm chấn ở gót và thân giày cổ cao có các điểm thông hơi</p></div>', '<table class=\"table\" style=\"width: 935.781px; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><tbody><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">VÌ SAO NÊN CHỌN GIÀY CHƠI BÓNG RỔ PROTECT 120 CỦA TARMAK?</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày chơi bóng rổ có phần cổ cao này giúp nâng đỡ mắt cá chân tốt. Giày có mút đúc éo ở phần gót giúp giảm chấn sau khi nhảy. Nhờ đế ngoài bằng cao su không để lại dấu có độ bám và chịu mài mòn, bạn có thể chơi trong nhà và ngoài trời.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">NGƯỜI THIẾT KẾ SẢN PHẨM GIÀY BÓNG RỔ TARMAK</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">TARMAK là nhóm người chơi bóng rổ, thiết kế các sản phẩm dành riêng bóng rổ. Toàn bộ dòng sản phẩm đều được thiết kế để đáp ứng nhu cầu của cả những cầu thủ bóng rổ khó tính nhất, do đó, bạn có thể tận hưởng các buổi tập luyện và thi đấu.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TẤT CẢ SẢN PHẨM CỦA TARMAK ĐỀU ĐƯỢC KIỂM NGHIỆM TRONG CÁC TÌNH HUỐNG TRẬN ĐẤU THỰC TẾ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Đội ngũ thiết kế đứng sau các sản phẩm Tarmak có văn phòng ở sân vận động Kipstadium ở miền Bắc nước Pháp. Đội ngũ luôn hướng đến mục tiêu cải thiện thành tích và cảm giác thoải mái cho người chơi bóng rổ. Tất cả các sản phẩm của chúng tôi đều được thiết kế bằng những chất liệu mà chúng tôi đã kiểm tra chất lượng về độ ẩm, độ bền,... Mỗi sản phẩm đều được kiểm tra trong nhiều tình huống thực tế bởi các cầu thủ bóng rổ trong nhiều tuần và trải qua những thay đổi dựa trên các đánh giá của bạn.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">XEM TẤT CẢ GỢI Ý CỦA CHÚNG TÔI VỀ VIỆC TẬP LUYỆN VÀ CHỌN TRANG BỊ CHƠI BÓNG RỔ PHÙ HỢP!</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Tarmak hỗ trợ bạn khi chơi bóng rổ dù bạn là người mới bắt đầu chơi, chơi thường xuyên hoặc nâng cao. Tham khảo lời khuyên của chúng tôi về tập luyện, trang bị và thoải mái chơi bóng rổ một mình hay theo nhóm.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">BẢO HÀNH</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">2</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">ĐƯỢC KIỂM TRA BỞI</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Giày Protect 120 đã được kiểm nghiệm trong điều kiện thực tế bởi các cầu thủ bóng rổ trong nhiều tuần.</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">THÀNH PHẦN</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Thân trên : 50.0% Polyester (PES), Thân trên : 50.0% Polyurethan (PU) Lớp lót : 100.0% Polyester (PES) Phần đế ngoài : 100.0% Cao su - Cao su butadien</td></tr><tr><th class=\"text-uppercase\" style=\"padding: 0px 0px 0.5rem; border: none; display: flex;\">TƯ VẤN LƯU TRỮ</th><td style=\"padding: 0px 0px 1rem; border: none; display: flex;\">Lấy khỏi túi thể thao sau mỗi lần sử dụng và bảo quản ở nơi khô ráo.</td></tr></tbody></table>', '/storage/photos/1/Products/a.jpg,/storage/photos/1/Products/nike.jpg', 100, '39,40,41,42,43,44', 'hot', 'active', 500000.00, 0.00, 1, 1, NULL, 5, '2022-08-12 21:23:41', '2022-08-12 21:23:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE IF NOT EXISTS `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'SHOES SHOP SYSTEM KSHOP', 'shsshsggs', '/storage/photos/1/Settings/logo.png', '/storage/photos/1/Settings/footer-logo.png', ' Xuan Phuong Nam Tu Liem Ha Noi', '0845543640', 'admin@gmail.com', NULL, '2022-08-12 09:42:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE IF NOT EXISTS `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Economical Delivery', '15000.00', 'active', '2022-08-11 01:31:15', '2022-08-11 01:31:23'),
(2, 'Fast delivery', '25000.00', 'active', '2022-08-11 01:31:36', '2022-08-11 01:31:36'),
(3, 'Express delivery', '70000.00', 'active', '2022-08-11 01:31:53', '2022-08-11 01:31:53'),
(4, 'VN EXPRESS', '10000.00', 'active', '2022-08-12 20:56:51', '2022-08-12 20:56:51'),
(5, 'Viet Nam POST', '40000.00', 'active', '2022-08-12 21:24:43', '2022-08-12 21:24:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Group 7', 'admin@gmail.com', NULL, '$2y$10$yCebnd1xUvDtcAuo1uLvcu.JR.0Za38Xg7M6JAds/zJejNhFPm1j6', '/storage/photos/1/Users/l3.jpg', 'admin', NULL, NULL, 'active', 'b04f95GMTiaZszksAPirvMVVFiqv6PIIjk1j90oDBvk5ecZe9IqfHtApH3q5', NULL, '2022-08-13 06:52:15'),
(5, 'Ho Thi Lan Huong', 'user@gmail.com', NULL, '$2y$10$qR/ayItxiQJxVxaHLcTqquglO4eFq9RUMAsi7b2YBdWLvy4sbwMt.', NULL, 'user', NULL, NULL, 'active', NULL, '2022-08-12 21:28:18', '2022-08-12 21:28:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

DROP TABLE IF EXISTS `wishlists`;
CREATE TABLE IF NOT EXISTS `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 6, 7, 2, 540000.00, 1, 540000.00, '2022-08-11 05:06:24', '2022-08-11 05:07:21'),
(4, 13, 14, 1, 850000.00, 1, 850000.00, '2022-08-12 11:25:45', '2022-08-12 11:25:48'),
(6, 16, 19, 5, 500000.00, 1, 500000.00, '2022-08-12 21:29:06', '2022-08-12 21:29:12');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
