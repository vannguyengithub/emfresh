-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th9 11, 2022 lúc 05:40 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `emfresh2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-09-11 06:22:36', '2022-09-11 06:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`, `parent_id`, `order`, `description`) VALUES
(1, 'Chay', 'chay', '2022-09-11 06:22:35', '2022-09-11 08:28:01', NULL, 1, 'Giá chỉ từ 60.000đ/bữa'),
(2, 'Eat Clean', 'eat-clean', '2022-09-11 06:22:35', '2022-09-11 08:28:10', NULL, 2, 'Giá chỉ từ 65.000đ/bữa'),
(3, 'Protein +', 'protein', '2022-09-11 06:22:35', '2022-09-11 08:28:44', NULL, 3, 'Giá chỉ từ 80.000đ/bữa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int DEFAULT NULL,
  `percent_off` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `number_of_use` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, '{}', 2),
(3, 1, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 3),
(4, 1, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(5, 1, 'excerpt', 'text_area', 'excerpt', 0, 0, 1, 1, 1, 1, '{}', 5),
(6, 1, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 6),
(7, 1, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(8, 1, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(9, 1, 'meta_description', 'text_area', 'meta_description', 0, 0, 1, 1, 1, 1, '{}', 9),
(10, 1, 'meta_keywords', 'text_area', 'meta_keywords', 0, 0, 1, 1, 1, 1, '{}', 10),
(11, 1, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(12, 1, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '{}', 12),
(13, 1, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '{}', 13),
(14, 2, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(15, 2, 'author_id', 'text', 'author_id', 1, 0, 0, 0, 0, 0, '\"\"', 2),
(16, 2, 'title', 'text', 'title', 1, 1, 1, 1, 1, 1, '\"\"', 3),
(17, 2, 'excerpt', 'text_area', 'excerpt', 1, 0, 1, 1, 1, 1, '\"\"', 4),
(18, 2, 'body', 'rich_text_box', 'body', 1, 0, 1, 1, 1, 1, '\"\"', 5),
(19, 2, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '\"{\\\"slugify\\\":{\\\"origin\\\":\\\"title\\\"}}\"', 6),
(20, 2, 'meta_description', 'text', 'meta_description', 1, 0, 1, 1, 1, 1, '\"\"', 7),
(21, 2, 'meta_keywords', 'text', 'meta_keywords', 1, 0, 1, 1, 1, 1, '\"\"', 8),
(22, 2, 'status', 'select_dropdown', 'status', 1, 1, 1, 1, 1, 1, '\"{\\\"default\\\":\\\"INACTIVE\\\",\\\"options\\\":{\\\"INACTIVE\\\":\\\"INACTIVE\\\",\\\"ACTIVE\\\":\\\"ACTIVE\\\"}}\"', 9),
(23, 2, 'created_at', 'timestamp', 'created_at', 1, 1, 1, 0, 0, 0, '\"\"', 10),
(24, 2, 'updated_at', 'timestamp', 'updated_at', 1, 0, 0, 0, 0, 0, '\"\"', 11),
(25, 2, 'image', 'image', 'image', 0, 1, 1, 1, 1, 1, '\"\"', 12),
(26, 3, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(27, 3, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"\"', 2),
(28, 3, 'email', 'text', 'email', 1, 1, 1, 1, 1, 1, '\"\"', 3),
(29, 3, 'password', 'password', 'password', 0, 0, 0, 1, 1, 0, '\"\"', 4),
(30, 3, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(31, 3, 'remember_token', 'text', 'remember_token', 0, 0, 0, 0, 0, 0, '\"\"', 5),
(32, 3, 'created_at', 'timestamp', 'created_at', 0, 1, 1, 0, 0, 0, '\"\"', 6),
(33, 3, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 7),
(34, 3, 'avatar', 'image', 'avatar', 0, 1, 1, 1, 1, 1, '\"\"', 8),
(35, 5, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(36, 5, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '\"\"', 2),
(37, 5, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '\"\"', 3),
(38, 5, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 4),
(39, 4, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '{}', 1),
(40, 4, 'parent_id', 'select_dropdown', 'parent_id', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(41, 4, 'order', 'text', 'order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(42, 4, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '{}', 4),
(43, 4, 'slug', 'text', 'slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(44, 4, 'created_at', 'timestamp', 'created_at', 0, 0, 1, 0, 0, 0, '{}', 6),
(45, 4, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '{}', 7),
(46, 6, 'id', 'number', 'id', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(47, 6, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '\"\"', 2),
(48, 6, 'created_at', 'timestamp', 'created_at', 0, 0, 0, 0, 0, 0, '\"\"', 3),
(49, 6, 'updated_at', 'timestamp', 'updated_at', 0, 0, 0, 0, 0, 0, '\"\"', 4),
(50, 6, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, '\"\"', 5),
(51, 1, 'seo_title', 'text', 'seo_title', 0, 1, 1, 1, 1, 1, '{}', 14),
(52, 1, 'featured', 'checkbox', 'featured', 1, 1, 1, 1, 1, 1, '{}', 15),
(53, 3, 'role_id', 'text', 'role_id', 1, 1, 1, 1, 1, 1, '\"\"', 9),
(54, 3, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(55, 7, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 0, '\"\"', 1),
(56, 7, 'name', 'text', 'name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"max:255\"}}', 2),
(57, 7, 'slug', 'text', 'slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 3),
(58, 7, 'details', 'text', 'Short Description', 0, 1, 1, 1, 1, 1, '\"\"', 4),
(59, 7, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{}', 5),
(60, 7, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 1, '\"\"', 6),
(61, 7, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\"}', 7),
(62, 7, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 8),
(63, 7, 'images', 'multiple_images', 'Images', 0, 0, 1, 1, 1, 1, '\"\"', 9),
(64, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 1, 1, '\"\"', 10),
(65, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 1, 1, 1, '\"\"', 11),
(66, 7, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 1, '\"\"', 8),
(67, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 8, 'code', 'text', 'code', 1, 1, 1, 1, 1, 1, '\"\"', 2),
(69, 8, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed Value\",\"percent\":\"Percent Off\"}}', 3),
(70, 8, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '\"{\\\"null\\\":\\\"\\\"}\"', 4),
(71, 8, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, '\"{\\\"null\\\":\\\"\\\"}\"', 5),
(72, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '\"\"', 7),
(73, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '\"\"', 8),
(74, 9, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(75, 9, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(76, 9, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 3),
(77, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 4),
(78, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(79, 10, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '\"\"', 1),
(80, 10, 'product_id', 'number', 'Product Id', 1, 1, 1, 1, 1, 1, '\"\"', 2),
(81, 10, 'category_id', 'number', 'Category Id', 1, 1, 1, 1, 1, 1, '\"\"', 3),
(82, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 4),
(83, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 5),
(84, 11, 'id', 'hidden', 'Id', 1, 1, 1, 0, 0, 0, '\"\"', 1),
(85, 11, 'user_id', 'number', 'User Id', 1, 1, 1, 0, 0, 0, '\"\"', 2),
(86, 11, 'billing_email', 'text', 'Billing Email', 1, 1, 1, 1, 1, 0, '\"\"', 3),
(87, 11, 'billing_name', 'text', 'Billing Name', 1, 1, 1, 1, 1, 0, '\"\"', 4),
(88, 11, 'billing_address', 'text', 'Billing Address', 1, 1, 1, 1, 1, 0, '\"\"', 5),
(89, 11, 'billing_city', 'text', 'Billing City', 1, 1, 1, 1, 1, 0, '\"\"', 6),
(90, 11, 'billing_province', 'text', 'Billing Province', 1, 0, 1, 1, 1, 0, '\"\"', 7),
(91, 11, 'billing_postalcode', 'text', 'Billing Postalcode', 1, 0, 1, 1, 1, 0, '\"\"', 8),
(92, 11, 'billing_phone', 'text', 'Billing Phone', 1, 0, 1, 1, 1, 0, '\"\"', 9),
(93, 11, 'billing_name_on_card', 'text', 'Billing Name On Card', 1, 1, 1, 1, 1, 0, '\"\"', 10),
(94, 11, 'billing_discount', 'number', 'Discount', 1, 1, 1, 0, 0, 0, '\"\"', 11),
(95, 11, 'billing_discount_code', 'text', 'Discount Code', 0, 0, 1, 0, 0, 0, '\"\"', 12),
(96, 11, 'billing_subtotal', 'number', 'Subtotal', 1, 1, 1, 0, 0, 0, '\"\"', 13),
(97, 11, 'billing_tax', 'number', 'Tax', 1, 1, 1, 0, 0, 0, '\"\"', 14),
(98, 11, 'billing_total', 'number', 'Total', 1, 1, 1, 0, 0, 0, '\"\"', 15),
(99, 11, 'payment_gateway', 'text', 'Payment Gateway', 1, 0, 1, 0, 0, 0, '\"\"', 16),
(100, 11, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 1, 0, 0, '\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"', 17),
(101, 11, 'error', 'text', 'Error', 0, 1, 1, 0, 0, 0, '\"\"', 18),
(102, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '\"\"', 19),
(103, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '\"\"', 20),
(104, 9, 'parent_id', 'select_dropdown', 'Parent Id', 0, 1, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 6),
(105, 9, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 7),
(106, 9, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 8),
(107, 8, 'number_of_use', 'number', 'Number Of Use', 1, 1, 1, 1, 1, 1, '{}', 6),
(108, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(109, 14, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(110, 14, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 3),
(111, 14, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(112, 14, 'faq_content', 'text', 'Faq Content', 0, 1, 1, 1, 1, 1, '{}', 5),
(113, 14, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 6),
(114, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(115, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(116, 14, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(135, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(136, 19, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(137, 19, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{\"default\":\"#\"}', 3),
(138, 19, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{}', 4),
(139, 19, 'image', 'media_picker', 'Image', 0, 1, 1, 1, 1, 1, '{}', 5),
(140, 19, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"PUBLISHED\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 6),
(141, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(142, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(143, 19, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 9),
(144, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(145, 20, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 2),
(146, 20, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(147, 20, 'position', 'select_dropdown', 'Position', 0, 1, 1, 1, 1, 1, '{\"default\":\"HOME\",\"options\":{\"HOME\":\"HOME\",\"HOME_SV\":\"D\\u1ecbch v\\u1ee5 Home\",\"HOME_FEATURED\":\"N\\u1ed5i b\\u1eadt\",\"HOME_NEWS\":\"B\\u00e1o ch\\u00ed\",\"HOME_PROMO\":\"Khuy\\u1ebfn m\\u00e3i\",\"HOME_WHY\":\"T\\u1ea1i sao ch\\u1ecdn GVVN\",\"HOME_PROFILE\":\"Nh\\u00e2n s\\u1ef1\"}}', 4),
(148, 20, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"PUBLISHED\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 5),
(149, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(150, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(151, 20, 'deleted_at', 'timestamp', 'Deleted At', 0, 0, 0, 0, 0, 0, '{}', 8),
(152, 19, 'banner_belongsto_slider_relationship', 'relationship', 'sliders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Slider\",\"table\":\"sliders\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(153, 20, 'slider_hasone_banner_relationship', 'relationship', 'banners', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Banner\",\"table\":\"banners\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 06:22:36', '2022-09-11 10:05:43'),
(2, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(3, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '\\App\\Http\\Controllers\\Voyager\\UsersController', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 06:22:36', '2022-09-11 07:00:50'),
(5, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(6, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(7, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, '\\App\\Http\\Controllers\\Voyager\\ProductsController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 06:22:36', '2022-09-11 10:07:27'),
(8, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 06:22:36', '2022-09-11 09:49:29'),
(9, 'category', 'category', 'Category', 'Categories', 'voyager-tag', 'App\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 06:22:36', '2022-09-11 08:27:36'),
(10, 'category-product', 'category-product', 'Category Product', 'Category Products', 'voyager-categories', 'App\\CategoryProduct', NULL, '', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(11, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', NULL, '\\App\\Http\\Controllers\\Voyager\\OrdersController', '', 1, 0, NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(14, 'faqs', 'faqs', 'Faq', 'Faqs', NULL, 'App\\Faq', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-09-11 10:15:58', '2022-09-11 10:15:58'),
(19, 'banners', 'banners', 'Banner', 'Banners', 'voyager-photos', 'App\\Banner', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 10:32:21', '2022-09-11 10:40:35'),
(20, 'sliders', 'sliders', 'Slider', 'Sliders', 'voyager-images', 'App\\Slider', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-09-11 10:34:52', '2022-09-11 10:38:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `faqs`
--

CREATE TABLE `faqs` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, 'main', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(3, 'footer', '2022-09-11 06:22:36', '2022-09-11 06:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-09-11 06:22:36', '2022-09-11 06:22:36', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2022-09-11 06:22:36', '2022-09-11 06:44:57', 'voyager.media.index', NULL),
(3, 1, 'Posts', '', '_self', 'voyager-news', NULL, 26, 2, '2022-09-11 06:22:36', '2022-09-11 06:43:15', 'voyager.posts.index', NULL),
(4, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 5, '2022-09-11 06:22:36', '2022-09-11 06:44:57', 'voyager.users.index', NULL),
(5, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 26, 1, '2022-09-11 06:22:36', '2022-09-11 06:43:15', 'voyager.categories.index', NULL),
(6, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 9, '2022-09-11 06:22:36', '2022-09-11 06:44:57', 'voyager.pages.index', NULL),
(7, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 4, '2022-09-11 06:22:36', '2022-09-11 06:44:57', 'voyager.roles.index', NULL),
(8, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2022-09-11 06:22:36', '2022-09-11 06:44:57', NULL, NULL),
(9, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 8, 1, '2022-09-11 06:22:36', '2022-09-11 06:22:36', 'voyager.menus.index', NULL),
(10, 1, 'Database', '', '_self', 'voyager-data', NULL, 8, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', 'voyager.database.index', NULL),
(11, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 8, 3, '2022-09-11 06:22:36', '2022-09-11 06:22:36', 'voyager.compass.index', NULL),
(12, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 11, '2022-09-11 06:22:36', '2022-09-11 07:02:43', 'voyager.settings.index', NULL),
(13, 1, 'Orders', '/admin/orders', '_self', 'voyager-documentation', NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(14, 1, 'Products', '/admin/products', '_self', 'voyager-bag', NULL, 27, 1, '2022-09-11 06:22:36', '2022-09-11 06:44:53', NULL, NULL),
(15, 1, 'Categories', '/admin/category', '_self', 'voyager-tag', NULL, 27, 2, '2022-09-11 06:22:36', '2022-09-11 06:44:57', NULL, NULL),
(16, 1, 'Coupons', '/admin/coupons', '_self', 'voyager-dollar', NULL, NULL, 3, '2022-09-11 06:22:36', '2022-09-11 06:44:57', NULL, NULL),
(17, 1, 'Category Products', '/admin/category-product', '_self', 'voyager-categories', NULL, 27, 3, '2022-09-11 06:22:36', '2022-09-11 06:44:57', NULL, NULL),
(18, 2, 'Shop', '', '_self', NULL, NULL, NULL, 1, '2022-09-11 06:22:36', '2022-09-11 06:22:36', 'shop.index', NULL),
(19, 2, 'About', '#', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(20, 2, 'Blog', 'https://blog.laravelecommerceexample.ca', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(21, 3, 'Follow Me:', '', '_self', NULL, NULL, NULL, 1, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(22, 3, 'fa-globe', 'http://andremadarang.com', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(23, 3, 'fa-youtube', 'http://youtube.com/drehimself', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(24, 3, 'fa-github', 'http://github.com/drehimself', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(25, 3, 'fa-twitter', 'http://twitter.com/drehimself', '_self', NULL, NULL, NULL, 2, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL, NULL),
(26, 1, 'Posts', '', '_self', 'voyager-file-text', '#000000', NULL, 8, '2022-09-11 06:43:06', '2022-09-11 06:44:57', NULL, ''),
(27, 1, 'Products', '', '_self', 'voyager-archive', '#000000', NULL, 7, '2022-09-11 06:44:42', '2022-09-11 06:44:57', NULL, ''),
(28, 1, 'BREAD', '', '_self', 'voyager-bread', '#000000', 8, 4, '2022-09-11 07:02:32', '2022-09-11 07:02:43', 'voyager.bread.index', NULL),
(29, 1, 'Faqs', '', '_self', 'voyager-question', '#000000', NULL, 12, '2022-09-11 10:15:58', '2022-09-11 10:16:35', 'voyager.faqs.index', 'null'),
(30, 1, 'Banners', '', '_self', 'voyager-photos', '#000000', NULL, 13, '2022-09-11 10:29:18', '2022-09-11 10:39:24', 'voyager.banners.index', 'null'),
(31, 1, 'Sliders', '', '_self', 'voyager-images', '#000000', NULL, 14, '2022-09-11 10:34:52', '2022-09-11 10:39:33', 'voyager.sliders.index', 'null');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_add_permission_group_id_to_permissions_table', 1),
(17, '2017_01_15_000000_create_permission_groups_table', 1),
(18, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(19, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(20, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(21, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(22, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(23, '2017_08_05_000000_add_group_to_settings_table', 1),
(24, '2017_11_26_013050_add_user_role_relationship', 1),
(25, '2017_11_26_015000_create_user_roles_table', 1),
(26, '2017_12_11_054653_create_products_table', 1),
(27, '2018_01_11_060124_create_category_table', 1),
(28, '2018_01_11_060548_create_category_product_table', 1),
(29, '2018_01_14_215535_create_coupons_table', 1),
(30, '2018_02_08_021546_add_image_to_products_table', 1),
(31, '2018_02_08_032544_add_images_to_products_table', 1),
(32, '2018_02_25_005243_create_orders_table', 1),
(33, '2018_02_25_010522_create_order_product_table', 1),
(34, '2018_03_11_000000_add_user_settings', 1),
(35, '2018_03_14_000000_add_details_to_data_types_table', 1),
(36, '2018_03_16_000000_make_settings_value_nullable', 1),
(37, '2018_04_23_011947_add_user_role_relationship_fix', 1),
(38, '2018_04_23_012009_create_user_roles_table_fix', 1),
(39, '2018_06_29_032914_add_quantity_to_products_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int NOT NULL,
  `billing_tax` int NOT NULL,
  `billing_total` int NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_product`
--

CREATE TABLE `order_product` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-09-11 06:22:36', '2022-09-11 06:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1, 'browse_admin', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(2, 'browse_bread', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(3, 'browse_database', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(4, 'browse_media', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(5, 'browse_compass', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(6, 'browse_menus', 'menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(7, 'read_menus', 'menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(8, 'edit_menus', 'menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(9, 'add_menus', 'menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(10, 'delete_menus', 'menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(11, 'browse_pages', 'pages', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(12, 'read_pages', 'pages', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(13, 'edit_pages', 'pages', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(14, 'add_pages', 'pages', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(15, 'delete_pages', 'pages', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(16, 'browse_roles', 'roles', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(17, 'read_roles', 'roles', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(18, 'edit_roles', 'roles', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(19, 'add_roles', 'roles', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(20, 'delete_roles', 'roles', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(21, 'browse_users', 'users', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(22, 'read_users', 'users', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(23, 'edit_users', 'users', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(24, 'add_users', 'users', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(25, 'delete_users', 'users', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(26, 'browse_posts', 'posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(27, 'read_posts', 'posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(28, 'edit_posts', 'posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(29, 'add_posts', 'posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(30, 'delete_posts', 'posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(31, 'browse_categories', 'categories', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(32, 'read_categories', 'categories', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(33, 'edit_categories', 'categories', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(34, 'add_categories', 'categories', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(35, 'delete_categories', 'categories', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(36, 'browse_settings', 'settings', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(37, 'read_settings', 'settings', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(38, 'edit_settings', 'settings', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(39, 'add_settings', 'settings', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(40, 'delete_settings', 'settings', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(41, 'browse_products', 'products', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(42, 'read_products', 'products', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(43, 'edit_products', 'products', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(44, 'add_products', 'products', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(45, 'delete_products', 'products', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(46, 'browse_coupons', 'coupons', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(47, 'read_coupons', 'coupons', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(48, 'edit_coupons', 'coupons', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(49, 'add_coupons', 'coupons', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(50, 'delete_coupons', 'coupons', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(51, 'browse_category', 'category', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(52, 'read_category', 'category', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(53, 'edit_category', 'category', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(54, 'add_category', 'category', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(55, 'delete_category', 'category', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(56, 'browse_category-product', 'category-product', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(57, 'read_category-product', 'category-product', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(58, 'edit_category-product', 'category-product', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(59, 'add_category-product', 'category-product', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(60, 'delete_category-product', 'category-product', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(61, 'browse_orders', 'orders', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(62, 'read_orders', 'orders', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(63, 'edit_orders', 'orders', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(64, 'add_orders', 'orders', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(65, 'delete_orders', 'orders', '2022-09-11 06:22:36', '2022-09-11 06:22:36', NULL),
(66, 'browse_faqs', 'faqs', '2022-09-11 10:15:58', '2022-09-11 10:15:58', NULL),
(67, 'read_faqs', 'faqs', '2022-09-11 10:15:58', '2022-09-11 10:15:58', NULL),
(68, 'edit_faqs', 'faqs', '2022-09-11 10:15:58', '2022-09-11 10:15:58', NULL),
(69, 'add_faqs', 'faqs', '2022-09-11 10:15:58', '2022-09-11 10:15:58', NULL),
(70, 'delete_faqs', 'faqs', '2022-09-11 10:15:58', '2022-09-11 10:15:58', NULL),
(76, 'browse_banners', 'banners', '2022-09-11 10:32:21', '2022-09-11 10:32:21', NULL),
(77, 'read_banners', 'banners', '2022-09-11 10:32:21', '2022-09-11 10:32:21', NULL),
(78, 'edit_banners', 'banners', '2022-09-11 10:32:21', '2022-09-11 10:32:21', NULL),
(79, 'add_banners', 'banners', '2022-09-11 10:32:21', '2022-09-11 10:32:21', NULL),
(80, 'delete_banners', 'banners', '2022-09-11 10:32:21', '2022-09-11 10:32:21', NULL),
(81, 'browse_sliders', 'sliders', '2022-09-11 10:34:52', '2022-09-11 10:34:52', NULL),
(82, 'read_sliders', 'sliders', '2022-09-11 10:34:52', '2022-09-11 10:34:52', NULL),
(83, 'edit_sliders', 'sliders', '2022-09-11 10:34:52', '2022-09-11 10:34:52', NULL),
(84, 'add_sliders', 'sliders', '2022-09-11 10:34:52', '2022-09-11 10:34:52', NULL),
(85, 'delete_sliders', 'sliders', '2022-09-11 10:34:52', '2022-09-11 10:34:52', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 3),
(2, 1),
(2, 3),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(6, 3),
(7, 1),
(7, 3),
(8, 1),
(8, 3),
(9, 1),
(9, 3),
(10, 1),
(11, 1),
(11, 3),
(12, 1),
(12, 3),
(13, 1),
(13, 3),
(14, 1),
(14, 3),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(22, 3),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(26, 3),
(27, 1),
(27, 3),
(28, 1),
(28, 3),
(29, 1),
(29, 3),
(30, 1),
(31, 1),
(31, 3),
(32, 1),
(32, 3),
(33, 1),
(33, 3),
(34, 1),
(34, 3),
(35, 1),
(36, 1),
(36, 3),
(37, 1),
(37, 3),
(38, 1),
(38, 3),
(39, 1),
(39, 3),
(40, 1),
(41, 1),
(41, 3),
(42, 1),
(42, 3),
(43, 1),
(43, 3),
(44, 1),
(44, 3),
(45, 1),
(46, 1),
(46, 3),
(47, 1),
(47, 3),
(48, 1),
(48, 3),
(49, 1),
(49, 3),
(50, 1),
(51, 1),
(51, 3),
(52, 1),
(52, 3),
(53, 1),
(53, 3),
(54, 1),
(54, 3),
(55, 1),
(56, 1),
(56, 3),
(57, 1),
(57, 3),
(58, 1),
(58, 3),
(59, 1),
(59, 3),
(60, 1),
(61, 1),
(61, 3),
(62, 1),
(62, 3),
(63, 1),
(63, 3),
(64, 1),
(64, 3),
(65, 1),
(65, 3),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(5, 1, 1, 'Stir-Fry Chicken and Broccoli with Garlic Sauce', '', '', '', NULL, '', '', '', 'PUBLISHED', 0, '2022-09-11 10:02:01', '2022-09-11 10:02:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int UNSIGNED NOT NULL DEFAULT '10',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `featured`, `quantity`, `image`, `images`, `created_at`, `updated_at`) VALUES
(1, 'Laptop 1', 'laptop-1', '14 inch, 3 TB SSD, 32GB RAM', 173418, 'Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!', 0, 10, 'products/dummy/laptop-1.jpg', '[\"products\\/dummy\\/laptop-2.jpg\",\"products\\/dummy\\/laptop-3.jpg\",\"products\\/dummy\\/laptop-4.jpg\"]', '2022-09-11 06:22:35', '2022-09-11 06:22:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, 'user', 'Normal User', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(3, 'adminweb', 'Admin Web', '2022-09-11 06:22:36', '2022-09-11 06:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Emfresh', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Emfresh', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.stock_threshold', 'Stock Threshold', '5', '', 'text', 6, 'Site');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sliders`
--

CREATE TABLE `sliders` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider_banners`
--

CREATE TABLE `slider_banners` (
  `slider_id` int DEFAULT NULL,
  `banner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider_banners`
--

INSERT INTO `slider_banners` (`slider_id`, `banner_id`) VALUES
(3, 3),
(3, 4),
(4, 5),
(4, 2),
(2, 6),
(2, 7),
(2, 8),
(6, 9),
(6, 10),
(6, 11),
(6, 12),
(7, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 1, 'pt', 'Post', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, 'data_types', 'display_name_singular', 2, 'pt', 'Página', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(3, 'data_types', 'display_name_singular', 3, 'pt', 'Utilizador', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(5, 'data_types', 'display_name_singular', 5, 'pt', 'Menu', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(6, 'data_types', 'display_name_singular', 6, 'pt', 'Função', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(7, 'data_types', 'display_name_plural', 1, 'pt', 'Posts', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(8, 'data_types', 'display_name_plural', 2, 'pt', 'Páginas', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(9, 'data_types', 'display_name_plural', 3, 'pt', 'Utilizadores', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(11, 'data_types', 'display_name_plural', 5, 'pt', 'Menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(12, 'data_types', 'display_name_plural', 6, 'pt', 'Funções', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(22, 'menu_items', 'title', 3, 'pt', 'Publicações', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(23, 'menu_items', 'title', 4, 'pt', 'Utilizadores', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(24, 'menu_items', 'title', 5, 'pt', 'Categorias', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(25, 'menu_items', 'title', 6, 'pt', 'Páginas', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(26, 'menu_items', 'title', 7, 'pt', 'Funções', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(27, 'menu_items', 'title', 8, 'pt', 'Ferramentas', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(28, 'menu_items', 'title', 9, 'pt', 'Menus', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(29, 'menu_items', 'title', 10, 'pt', 'Base de dados', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(30, 'menu_items', 'title', 12, 'pt', 'Configurações', '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(31, 'data_rows', 'display_name', 55, 'en', 'Id', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(32, 'data_rows', 'display_name', 56, 'en', 'name', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(33, 'data_rows', 'display_name', 57, 'en', 'slug', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(34, 'data_rows', 'display_name', 58, 'en', 'Details', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(35, 'data_rows', 'display_name', 59, 'en', 'price', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(36, 'data_rows', 'display_name', 60, 'en', 'Description', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(37, 'data_rows', 'display_name', 61, 'en', 'Featured', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(38, 'data_rows', 'display_name', 66, 'en', 'Quantity', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(39, 'data_rows', 'display_name', 62, 'en', 'Image', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(40, 'data_rows', 'display_name', 63, 'en', 'Images', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(41, 'data_rows', 'display_name', 64, 'en', 'Created At', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(42, 'data_rows', 'display_name', 65, 'en', 'Updated At', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(43, 'data_types', 'display_name_singular', 7, 'en', 'Product', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(44, 'data_types', 'display_name_plural', 7, 'en', 'Products', '2022-09-11 09:04:33', '2022-09-11 09:04:33'),
(45, 'data_rows', 'display_name', 67, 'en', 'Id', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(46, 'data_rows', 'display_name', 68, 'en', 'code', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(47, 'data_rows', 'display_name', 69, 'en', 'Type', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(48, 'data_rows', 'display_name', 70, 'en', 'Value', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(49, 'data_rows', 'display_name', 71, 'en', 'Percent Off', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(50, 'data_rows', 'display_name', 72, 'en', 'Created At', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(51, 'data_rows', 'display_name', 73, 'en', 'Updated At', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(52, 'data_types', 'display_name_singular', 8, 'en', 'Coupon', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(53, 'data_types', 'display_name_plural', 8, 'en', 'Coupons', '2022-09-11 09:46:28', '2022-09-11 09:46:28'),
(54, 'data_rows', 'display_name', 107, 'en', 'Number Of Use', '2022-09-11 09:49:29', '2022-09-11 09:49:29'),
(55, 'data_rows', 'display_name', 1, 'en', 'ID', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(56, 'data_rows', 'display_name', 2, 'en', 'Author', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(57, 'data_rows', 'display_name', 3, 'en', 'Category', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(58, 'data_rows', 'display_name', 4, 'en', 'Title', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(59, 'data_rows', 'display_name', 51, 'en', 'seo_title', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(60, 'data_rows', 'display_name', 5, 'en', 'excerpt', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(61, 'data_rows', 'display_name', 6, 'en', 'Body', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(62, 'data_rows', 'display_name', 7, 'en', 'Post Image', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(63, 'data_rows', 'display_name', 8, 'en', 'slug', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(64, 'data_rows', 'display_name', 9, 'en', 'meta_description', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(65, 'data_rows', 'display_name', 10, 'en', 'meta_keywords', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(66, 'data_rows', 'display_name', 11, 'en', 'status', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(67, 'data_rows', 'display_name', 52, 'en', 'featured', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(68, 'data_rows', 'display_name', 12, 'en', 'created_at', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(69, 'data_rows', 'display_name', 13, 'en', 'updated_at', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(70, 'data_types', 'display_name_singular', 1, 'en', 'Post', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(71, 'data_types', 'display_name_plural', 1, 'en', 'Posts', '2022-09-11 09:55:50', '2022-09-11 09:55:50'),
(72, 'menu_items', 'title', 29, 'en', 'Faqs', '2022-09-11 10:16:35', '2022-09-11 10:16:35'),
(73, 'data_rows', 'display_name', 144, 'en', 'Id', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(74, 'data_rows', 'display_name', 145, 'en', 'Name', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(75, 'data_rows', 'display_name', 146, 'en', 'Description', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(76, 'data_rows', 'display_name', 147, 'en', 'Position', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(77, 'data_rows', 'display_name', 148, 'en', 'Status', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(78, 'data_rows', 'display_name', 149, 'en', 'Created At', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(79, 'data_rows', 'display_name', 150, 'en', 'Updated At', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(80, 'data_rows', 'display_name', 151, 'en', 'Deleted At', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(81, 'data_rows', 'display_name', 153, 'en', 'banners', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(82, 'data_types', 'display_name_singular', 20, 'en', 'Slider', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(83, 'data_types', 'display_name_plural', 20, 'en', 'Sliders', '2022-09-11 10:38:06', '2022-09-11 10:38:06'),
(84, 'data_rows', 'display_name', 135, 'en', 'Id', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(85, 'data_rows', 'display_name', 136, 'en', 'Name', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(86, 'data_rows', 'display_name', 137, 'en', 'Url', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(87, 'data_rows', 'display_name', 138, 'en', 'Description', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(88, 'data_rows', 'display_name', 139, 'en', 'Image', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(89, 'data_rows', 'display_name', 140, 'en', 'Status', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(90, 'data_rows', 'display_name', 141, 'en', 'Created At', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(91, 'data_rows', 'display_name', 142, 'en', 'Updated At', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(92, 'data_rows', 'display_name', 143, 'en', 'Deleted At', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(93, 'data_rows', 'display_name', 152, 'en', 'sliders', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(94, 'data_types', 'display_name_singular', 19, 'en', 'Banner', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(95, 'data_types', 'display_name_plural', 19, 'en', 'Banners', '2022-09-11 10:39:09', '2022-09-11 10:39:09'),
(96, 'menu_items', 'title', 30, 'en', 'Banners', '2022-09-11 10:39:24', '2022-09-11 10:39:24'),
(97, 'menu_items', 'title', 31, 'en', 'Sliders', '2022-09-11 10:39:33', '2022-09-11 10:39:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', '$2y$10$7DsCsD3mYpMQXdiLwdMBDOQePt54XgBmvIAyqd5NHz6P/OJmkGbVa', 'Dowx891mXFt4Bp87OWe459LUBWLzO4ieWOdzlLD2k8NCs5sdpQjR6ld2bUoI', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36'),
(2, 3, 'Admin Web', 'adminweb@adminweb.com', 'users/default.png', '$2y$10$JG.DBsgCHsElZVhOFWkTMOTzu52LoXB7pnlbn2FA3Y4TOfOfGrD9u', 'Eq2B4tIuzS23bsTcBrsFj7inSfvhxaM96nwSBHbGQW7w2G8WntAkkJ94W8EG', NULL, '2022-09-11 06:22:36', '2022-09-11 06:22:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Chỉ mục cho bảng `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Chỉ mục cho bảng `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_groups_name_unique` (`name`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT cho bảng `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT cho bảng `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
