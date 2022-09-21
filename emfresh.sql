-- Adminer 4.8.1 MySQL 8.0.30-0ubuntu0.20.04.2 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1,	NULL,	1,	'Tin tức',	'tin-tuc',	'2022-09-11 06:22:36',	'2022-09-11 10:54:18'),
(2,	NULL,	1,	'Faqs',	'faqs',	'2022-09-11 06:22:36',	'2022-09-11 10:54:49'),
(3,	2,	1,	'Sản phẩm',	'san-pham',	'2022-09-11 10:55:39',	'2022-09-11 10:55:39'),
(4,	2,	2,	'Vận chuyển',	'van-chuyen',	'2022-09-11 10:55:51',	'2022-09-11 10:55:51'),
(5,	2,	3,	'Đơn hàng',	'don-hang',	'2022-09-11 10:56:00',	'2022-09-11 10:56:00'),
(6,	2,	1,	'Thanh toán',	'thanh-toan',	'2022-09-11 10:56:12',	'2022-09-11 10:56:12');

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_name_unique` (`name`),
  UNIQUE KEY `category_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`, `order`, `description`, `price`, `deleted_at`) VALUES
(1,	'Chay',	'chay',	'2022-09-11 06:22:35',	'2022-09-15 16:10:16',	1,	'Giá chỉ từ 60.000đ/bữa',	60,	NULL),
(2,	'Eat Clean',	'eat-clean',	'2022-09-11 06:22:35',	'2022-09-11 08:28:10',	2,	'Giá chỉ từ 65.000đ/bữa',	0,	NULL),
(3,	'Protein +',	'protein',	'2022-09-11 06:22:35',	'2022-09-11 08:28:44',	3,	'Giá chỉ từ 80.000đ/bữa',	0,	NULL);

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int DEFAULT NULL,
  `percent_off` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `number_of_use` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1,	1,	'id',	'number',	'ID',	1,	0,	0,	0,	0,	0,	'{}',	1),
(2,	1,	'author_id',	'text',	'Author',	1,	0,	1,	1,	0,	1,	'{}',	2),
(3,	1,	'category_id',	'text',	'Category',	0,	0,	1,	1,	1,	0,	'{}',	3),
(4,	1,	'title',	'text',	'Title',	1,	1,	1,	1,	1,	1,	'{}',	4),
(5,	1,	'excerpt',	'text_area',	'excerpt',	0,	0,	1,	1,	1,	1,	'{}',	5),
(6,	1,	'body',	'rich_text_box',	'Body',	1,	0,	1,	1,	1,	1,	'{}',	6),
(7,	1,	'image',	'image',	'Post Image',	0,	1,	1,	1,	1,	1,	'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',	7),
(8,	1,	'slug',	'text',	'slug',	1,	0,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',	8),
(9,	1,	'meta_description',	'text_area',	'meta_description',	0,	0,	1,	1,	1,	1,	'{}',	9),
(10,	1,	'meta_keywords',	'text_area',	'meta_keywords',	0,	0,	1,	1,	1,	1,	'{}',	10),
(11,	1,	'status',	'select_dropdown',	'status',	1,	1,	1,	1,	1,	1,	'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',	11),
(12,	1,	'created_at',	'timestamp',	'created_at',	0,	1,	1,	0,	0,	0,	'{}',	12),
(13,	1,	'updated_at',	'timestamp',	'updated_at',	0,	0,	0,	0,	0,	0,	'{}',	13),
(14,	2,	'id',	'number',	'id',	1,	0,	0,	0,	0,	0,	'\"\"',	1),
(15,	2,	'author_id',	'text',	'author_id',	1,	0,	0,	0,	0,	0,	'\"\"',	2),
(16,	2,	'title',	'text',	'title',	1,	1,	1,	1,	1,	1,	'\"\"',	3),
(17,	2,	'excerpt',	'text_area',	'excerpt',	1,	0,	1,	1,	1,	1,	'\"\"',	4),
(18,	2,	'body',	'rich_text_box',	'body',	1,	0,	1,	1,	1,	1,	'\"\"',	5),
(19,	2,	'slug',	'text',	'slug',	1,	0,	1,	1,	1,	1,	'\"{\\\"slugify\\\":{\\\"origin\\\":\\\"title\\\"}}\"',	6),
(20,	2,	'meta_description',	'text',	'meta_description',	1,	0,	1,	1,	1,	1,	'\"\"',	7),
(21,	2,	'meta_keywords',	'text',	'meta_keywords',	1,	0,	1,	1,	1,	1,	'\"\"',	8),
(22,	2,	'status',	'select_dropdown',	'status',	1,	1,	1,	1,	1,	1,	'\"{\\\"default\\\":\\\"INACTIVE\\\",\\\"options\\\":{\\\"INACTIVE\\\":\\\"INACTIVE\\\",\\\"ACTIVE\\\":\\\"ACTIVE\\\"}}\"',	9),
(23,	2,	'created_at',	'timestamp',	'created_at',	1,	1,	1,	0,	0,	0,	'\"\"',	10),
(24,	2,	'updated_at',	'timestamp',	'updated_at',	1,	0,	0,	0,	0,	0,	'\"\"',	11),
(25,	2,	'image',	'image',	'image',	0,	1,	1,	1,	1,	1,	'\"\"',	12),
(26,	3,	'id',	'number',	'id',	1,	0,	0,	0,	0,	0,	'\"\"',	1),
(27,	3,	'name',	'text',	'name',	1,	1,	1,	1,	1,	1,	'\"\"',	2),
(28,	3,	'email',	'text',	'email',	0,	1,	1,	1,	1,	1,	'\"\"',	3),
(29,	3,	'password',	'password',	'password',	1,	0,	0,	1,	1,	0,	'\"\"',	4),
(30,	3,	'user_belongsto_role_relationship',	'relationship',	'Role',	0,	0,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}',	10),
(31,	3,	'remember_token',	'text',	'remember_token',	0,	0,	0,	0,	0,	0,	'\"\"',	5),
(32,	3,	'created_at',	'timestamp',	'created_at',	0,	1,	1,	0,	0,	0,	'\"\"',	6),
(33,	3,	'updated_at',	'timestamp',	'updated_at',	0,	0,	0,	0,	0,	0,	'\"\"',	7),
(34,	3,	'avatar',	'image',	'avatar',	0,	1,	1,	1,	1,	1,	'\"\"',	8),
(35,	5,	'id',	'number',	'id',	1,	0,	0,	0,	0,	0,	'\"\"',	1),
(36,	5,	'name',	'text',	'name',	1,	1,	1,	1,	1,	1,	'\"\"',	2),
(37,	5,	'created_at',	'timestamp',	'created_at',	0,	0,	0,	0,	0,	0,	'\"\"',	3),
(38,	5,	'updated_at',	'timestamp',	'updated_at',	0,	0,	0,	0,	0,	0,	'\"\"',	4),
(39,	4,	'id',	'number',	'id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(40,	4,	'parent_id',	'select_dropdown',	'parent_id',	0,	0,	1,	1,	1,	1,	'{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}',	2),
(41,	4,	'order',	'text',	'order',	1,	1,	1,	1,	1,	1,	'{\"default\":1}',	3),
(42,	4,	'name',	'text',	'name',	1,	1,	1,	1,	1,	1,	'{}',	4),
(43,	4,	'slug',	'text',	'slug',	1,	1,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"name\"}}',	5),
(44,	4,	'created_at',	'timestamp',	'created_at',	0,	0,	1,	0,	0,	0,	'{}',	6),
(45,	4,	'updated_at',	'timestamp',	'updated_at',	0,	0,	0,	0,	0,	0,	'{}',	7),
(46,	6,	'id',	'number',	'id',	1,	0,	0,	0,	0,	0,	'\"\"',	1),
(47,	6,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'\"\"',	2),
(48,	6,	'created_at',	'timestamp',	'created_at',	0,	0,	0,	0,	0,	0,	'\"\"',	3),
(49,	6,	'updated_at',	'timestamp',	'updated_at',	0,	0,	0,	0,	0,	0,	'\"\"',	4),
(50,	6,	'display_name',	'text',	'Display Name',	1,	1,	1,	1,	1,	1,	'\"\"',	5),
(51,	1,	'seo_title',	'text',	'seo_title',	0,	1,	1,	1,	1,	1,	'{}',	14),
(52,	1,	'featured',	'checkbox',	'featured',	1,	1,	1,	1,	1,	1,	'{}',	15),
(53,	3,	'role_id',	'text',	'role_id',	0,	0,	1,	1,	1,	1,	'\"\"',	9),
(54,	3,	'user_belongstomany_role_relationship',	'relationship',	'Roles',	0,	0,	1,	1,	1,	0,	'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',	11),
(55,	7,	'id',	'hidden',	'Id',	1,	1,	1,	1,	1,	0,	'\"\"',	1),
(56,	7,	'name',	'text',	'name',	1,	1,	1,	1,	1,	1,	'{\"validation\":{\"rule\":\"max:255\"}}',	2),
(57,	7,	'slug',	'text',	'slug',	1,	0,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"name\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}',	3),
(58,	7,	'details',	'text',	'Short Description',	0,	1,	1,	1,	1,	1,	'\"\"',	4),
(59,	7,	'price',	'number',	'Price',	1,	0,	0,	0,	0,	1,	'{}',	5),
(60,	7,	'description',	'rich_text_box',	'Nutritional information',	1,	0,	1,	1,	1,	1,	'{\"default\":\"21312321\"}',	10),
(61,	7,	'featured',	'checkbox',	'Featured',	1,	0,	0,	0,	0,	0,	'{\"on\":\"Yes\",\"off\":\"No\"}',	6),
(62,	7,	'image',	'image',	'Image',	0,	1,	1,	1,	1,	1,	'{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}',	7),
(63,	7,	'images',	'multiple_images',	'Images',	0,	0,	0,	0,	0,	0,	'\"\"',	9),
(64,	7,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	'\"\"',	15),
(65,	7,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'\"\"',	16),
(66,	7,	'quantity',	'number',	'Quantity',	1,	0,	0,	0,	0,	0,	'{\"default\":0}',	8),
(67,	8,	'id',	'hidden',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(68,	8,	'code',	'text',	'code',	1,	1,	1,	1,	1,	1,	'\"\"',	2),
(69,	8,	'type',	'select_dropdown',	'Type',	1,	1,	1,	1,	1,	1,	'{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed Value\",\"percent\":\"Percent Off\"}}',	3),
(70,	8,	'value',	'number',	'Value',	0,	1,	1,	1,	1,	1,	'\"{\\\"null\\\":\\\"\\\"}\"',	4),
(71,	8,	'percent_off',	'number',	'Percent Off',	0,	1,	1,	1,	1,	1,	'\"{\\\"null\\\":\\\"\\\"}\"',	5),
(72,	8,	'created_at',	'timestamp',	'Created At',	0,	0,	1,	0,	0,	0,	'\"\"',	7),
(73,	8,	'updated_at',	'timestamp',	'Updated At',	0,	0,	1,	0,	0,	0,	'\"\"',	8),
(74,	9,	'id',	'hidden',	'Id',	1,	1,	1,	0,	0,	0,	'{}',	1),
(75,	9,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(76,	9,	'slug',	'text',	'Slug',	1,	1,	1,	1,	1,	1,	'{\"slugify\":{\"origin\":\"name\"}}',	3),
(77,	9,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	'{}',	4),
(78,	9,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	5),
(79,	10,	'id',	'hidden',	'Id',	1,	0,	0,	0,	0,	0,	'\"\"',	1),
(80,	10,	'product_id',	'number',	'Product Id',	1,	1,	1,	1,	1,	1,	'\"\"',	2),
(81,	10,	'category_id',	'number',	'Category Id',	1,	1,	1,	1,	1,	1,	'\"\"',	3),
(82,	10,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	'\"\"',	4),
(83,	10,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'\"\"',	5),
(84,	11,	'id',	'hidden',	'Id',	1,	1,	1,	0,	0,	0,	'\"\"',	1),
(85,	11,	'user_id',	'number',	'User Id',	1,	1,	1,	0,	0,	0,	'\"\"',	2),
(86,	11,	'billing_email',	'text',	'Billing Email',	1,	1,	1,	1,	1,	0,	'\"\"',	3),
(87,	11,	'billing_name',	'text',	'Billing Name',	1,	1,	1,	1,	1,	0,	'\"\"',	4),
(88,	11,	'billing_address',	'text',	'Billing Address',	1,	1,	1,	1,	1,	0,	'\"\"',	5),
(89,	11,	'billing_city',	'text',	'Billing City',	1,	1,	1,	1,	1,	0,	'\"\"',	6),
(90,	11,	'billing_province',	'text',	'Billing Province',	1,	0,	1,	1,	1,	0,	'\"\"',	7),
(91,	11,	'billing_postalcode',	'text',	'Billing Postalcode',	1,	0,	1,	1,	1,	0,	'\"\"',	8),
(92,	11,	'billing_phone',	'text',	'Billing Phone',	1,	0,	1,	1,	1,	0,	'\"\"',	9),
(93,	11,	'billing_name_on_card',	'text',	'Billing Name On Card',	1,	1,	1,	1,	1,	0,	'\"\"',	10),
(94,	11,	'billing_discount',	'number',	'Discount',	1,	1,	1,	0,	0,	0,	'\"\"',	11),
(95,	11,	'billing_discount_code',	'text',	'Discount Code',	0,	0,	1,	0,	0,	0,	'\"\"',	12),
(96,	11,	'billing_subtotal',	'number',	'Subtotal',	1,	1,	1,	0,	0,	0,	'\"\"',	13),
(97,	11,	'billing_tax',	'number',	'Tax',	1,	1,	1,	0,	0,	0,	'\"\"',	14),
(98,	11,	'billing_total',	'number',	'Total',	1,	1,	1,	0,	0,	0,	'\"\"',	15),
(99,	11,	'payment_gateway',	'text',	'Payment Gateway',	1,	0,	1,	0,	0,	0,	'\"\"',	16),
(100,	11,	'shipped',	'checkbox',	'Shipped',	1,	1,	1,	1,	0,	0,	'\"{\\\"on\\\":\\\"Yes\\\",\\\"off\\\":\\\"No\\\"}\"',	17),
(101,	11,	'error',	'text',	'Error',	0,	1,	1,	0,	0,	0,	'\"\"',	18),
(102,	11,	'created_at',	'timestamp',	'Created At',	0,	0,	0,	0,	0,	0,	'\"\"',	19),
(103,	11,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'\"\"',	20),
(105,	9,	'order',	'text',	'Order',	1,	1,	1,	1,	1,	1,	'{\"default\":1}',	7),
(106,	9,	'description',	'text_area',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	8),
(107,	8,	'number_of_use',	'number',	'Number Of Use',	1,	1,	1,	1,	1,	1,	'{}',	6),
(108,	14,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(109,	14,	'title',	'text',	'Title',	1,	1,	1,	1,	1,	1,	'{}',	2),
(110,	14,	'name',	'text',	'Name',	0,	1,	1,	1,	1,	1,	'{}',	3),
(111,	14,	'phone',	'text',	'Phone',	0,	1,	1,	1,	1,	1,	'{}',	4),
(112,	14,	'faq_content',	'text',	'Faq Content',	0,	1,	1,	1,	1,	1,	'{}',	5),
(113,	14,	'status',	'text',	'Status',	0,	1,	1,	1,	1,	1,	'{}',	6),
(114,	14,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	7),
(115,	14,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	8),
(116,	14,	'deleted_at',	'timestamp',	'Deleted At',	0,	0,	0,	0,	0,	0,	'{}',	9),
(135,	19,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(136,	19,	'name',	'text',	'Name',	0,	1,	1,	1,	1,	1,	'{}',	2),
(137,	19,	'url',	'text',	'Url',	0,	1,	1,	1,	1,	1,	'{\"default\":\"#\"}',	3),
(138,	19,	'description',	'text_area',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	4),
(139,	19,	'image',	'media_picker',	'Image',	0,	1,	1,	1,	1,	1,	'{}',	5),
(140,	19,	'status',	'select_dropdown',	'Status',	0,	1,	1,	1,	1,	1,	'{\"default\":\"PUBLISHED\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',	6),
(141,	19,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	7),
(142,	19,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	8),
(143,	19,	'deleted_at',	'timestamp',	'Deleted At',	0,	0,	0,	0,	0,	0,	'{}',	9),
(144,	20,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(145,	20,	'name',	'text',	'Name',	1,	1,	1,	1,	1,	1,	'{}',	2),
(146,	20,	'description',	'text',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	3),
(147,	20,	'position',	'select_dropdown',	'Position',	0,	1,	1,	1,	1,	1,	'{\"default\":\"HOME\",\"options\":{\"HOME\":\"HOME\",\"HOME_SV\":\"D\\u1ecbch v\\u1ee5 Home\",\"HOME_FEATURED\":\"N\\u1ed5i b\\u1eadt\",\"HOME_NEWS\":\"B\\u00e1o ch\\u00ed\",\"HOME_PROMO\":\"Khuy\\u1ebfn m\\u00e3i\",\"HOME_WHY\":\"T\\u1ea1i sao ch\\u1ecdn GVVN\",\"HOME_PROFILE\":\"Nh\\u00e2n s\\u1ef1\"}}',	4),
(148,	20,	'status',	'select_dropdown',	'Status',	0,	1,	1,	1,	1,	1,	'{\"default\":\"PUBLISHED\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',	5),
(149,	20,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	6),
(150,	20,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	7),
(151,	20,	'deleted_at',	'timestamp',	'Deleted At',	0,	0,	0,	0,	0,	0,	'{}',	8),
(152,	19,	'banner_belongsto_slider_relationship',	'relationship',	'sliders',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Slider\",\"table\":\"sliders\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}',	10),
(153,	20,	'slider_hasone_banner_relationship',	'relationship',	'banners',	0,	1,	1,	1,	1,	1,	'{\"model\":\"App\\\\Banner\",\"table\":\"banners\",\"type\":\"hasOne\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"banners\",\"pivot\":\"0\",\"taggable\":\"0\"}',	9),
(155,	7,	'ingredient',	'rich_text_box',	'Ingredient',	0,	0,	1,	1,	1,	1,	'{}',	11),
(156,	7,	'user_manual',	'rich_text_box',	'User Manual',	0,	0,	1,	1,	1,	1,	'{}',	12),
(157,	21,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(158,	21,	'district',	'text',	'Quận',	0,	1,	1,	1,	1,	1,	'{}',	2),
(159,	21,	'price',	'text',	'Giá ship',	0,	1,	1,	1,	1,	1,	'{}',	3),
(160,	21,	'description',	'text_area',	'Description',	0,	1,	1,	1,	1,	1,	'{}',	4),
(161,	21,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	5),
(162,	21,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	6),
(163,	21,	'deleted_at',	'timestamp',	'Deleted At',	0,	1,	1,	1,	1,	1,	'{}',	7),
(164,	9,	'price',	'number',	'Price',	1,	1,	1,	1,	1,	1,	'{}',	8),
(165,	9,	'deleted_at',	'timestamp',	'Deleted At',	0,	0,	0,	0,	0,	0,	'{}',	9),
(166,	7,	'sale_at',	'timestamp',	'Ngày bán',	0,	1,	1,	1,	1,	1,	'{}',	13),
(167,	7,	'meals',	'select_dropdown',	'Meals',	0,	1,	1,	1,	1,	1,	'{\"default\":\"breakfast\",\"options\":{\"breakfast\":\"B\\u1eefa s\\u00e1ng\",\"lunch\":\"B\\u1eefa tr\\u01b0a\",\"evening\":\"B\\u1eefa t\\u1ed1i\"}}',	14),
(168,	22,	'id',	'text',	'Id',	1,	0,	0,	0,	0,	0,	'{}',	1),
(169,	22,	'name',	'text',	'Name',	0,	1,	1,	1,	1,	1,	'{}',	2),
(170,	22,	'stars',	'radio_btn',	'Stars',	0,	1,	1,	1,	1,	1,	'{\"default\":\"5_start\",\"options\":{\"3\":\"3 Sao\",\"4\":\"4 Sao\",\"5\":\"5 Sao\"}}',	3),
(171,	22,	'message',	'text_area',	'Message',	1,	1,	1,	1,	1,	1,	'{}',	4),
(172,	22,	'status',	'select_dropdown',	'Status',	0,	1,	1,	1,	1,	1,	'{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}',	5),
(173,	22,	'created_at',	'timestamp',	'Created At',	0,	1,	1,	1,	0,	1,	'{}',	6),
(174,	22,	'updated_at',	'timestamp',	'Updated At',	0,	0,	0,	0,	0,	0,	'{}',	7),
(175,	22,	'deleted_at',	'timestamp',	'Deleted At',	0,	0,	0,	0,	0,	0,	'{}',	8),
(176,	22,	'image',	'text',	'Image',	0,	1,	1,	1,	1,	1,	'{}',	9),
(177,	22,	'slug',	'text',	'Slug',	0,	0,	0,	0,	0,	0,	'{}',	10),
(178,	3,	'settings',	'text',	'Settings',	0,	0,	0,	0,	0,	0,	'{}',	8),
(179,	3,	'phone',	'text',	'Phone',	0,	1,	1,	1,	1,	1,	'{}',	11),
(180,	3,	'address',	'text',	'Address',	0,	1,	1,	1,	1,	1,	'{}',	12),
(181,	3,	'email_notify',	'text',	'Email Notify',	0,	1,	1,	1,	1,	1,	'{}',	13),
(182,	3,	'newsletters',	'text',	'Newsletters',	0,	1,	1,	1,	1,	1,	'{}',	14);

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1,	'posts',	'posts',	'Post',	'Posts',	'voyager-news',	'TCG\\Voyager\\Models\\Post',	'TCG\\Voyager\\Policies\\PostPolicy',	NULL,	NULL,	1,	1,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-11 10:05:43'),
(2,	'pages',	'pages',	'Page',	'Pages',	'voyager-file-text',	'TCG\\Voyager\\Models\\Page',	NULL,	'',	'',	1,	0,	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(3,	'users',	'users',	'User',	'Users',	'voyager-person',	'TCG\\Voyager\\Models\\User',	'TCG\\Voyager\\Policies\\UserPolicy',	'\\App\\Http\\Controllers\\Voyager\\UsersController',	NULL,	1,	1,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-16 05:10:05'),
(4,	'categories',	'categories',	'Category',	'Categories',	'voyager-categories',	'TCG\\Voyager\\Models\\Category',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-11 07:00:50'),
(5,	'menus',	'menus',	'Menu',	'Menus',	'voyager-list',	'TCG\\Voyager\\Models\\Menu',	NULL,	'',	'',	1,	0,	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(6,	'roles',	'roles',	'Role',	'Roles',	'voyager-lock',	'TCG\\Voyager\\Models\\Role',	NULL,	'',	'',	1,	0,	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(7,	'products',	'products',	'Product',	'Products',	'voyager-bag',	'App\\Product',	NULL,	'\\App\\Http\\Controllers\\Voyager\\ProductsController',	NULL,	1,	1,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-16 02:48:41'),
(8,	'coupons',	'coupons',	'Coupon',	'Coupons',	'voyager-dollar',	'App\\Coupon',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-11 09:49:29'),
(9,	'category',	'category',	'Category',	'Categories',	'voyager-tag',	'App\\Category',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 06:22:36',	'2022-09-15 16:10:45'),
(10,	'category_product',	'category-product',	'Category Product',	'Category Products',	'voyager-categories',	'App\\CategoryProduct',	NULL,	'',	'',	1,	0,	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(11,	'orders',	'orders',	'Order',	'Orders',	'voyager-documentation',	'App\\Order',	NULL,	'\\App\\Http\\Controllers\\Voyager\\OrdersController',	'',	1,	0,	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(14,	'faqs',	'faqs',	'Faq',	'Faqs',	NULL,	'App\\Faq',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58'),
(19,	'banners',	'banners',	'Banner',	'Banners',	'voyager-photos',	'App\\Banner',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 10:32:21',	'2022-09-11 10:40:35'),
(20,	'sliders',	'sliders',	'Slider',	'Sliders',	'voyager-images',	'App\\Slider',	NULL,	NULL,	NULL,	1,	1,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-11 10:34:52',	'2022-09-11 10:38:06'),
(21,	'shippings',	'shippings',	'Shipping',	'Shippings',	'voyager-ship',	'App\\Shipping',	NULL,	NULL,	NULL,	1,	0,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16'),
(22,	'testimonials',	'testimonials',	'Testimonial',	'Testimonials',	'voyager-chat',	'App\\Testimonial',	NULL,	NULL,	NULL,	1,	1,	'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}',	'2022-09-16 05:00:58',	'2022-09-16 05:01:58');

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE `faqs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faq_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1,	1,	'Dashboard',	'',	'_self',	'voyager-boat',	NULL,	NULL,	1,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	'voyager.dashboard',	NULL),
(2,	1,	'Media',	'',	'_self',	'voyager-images',	NULL,	NULL,	6,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	'voyager.media.index',	NULL),
(3,	1,	'Posts',	'',	'_self',	'voyager-news',	NULL,	26,	2,	'2022-09-11 06:22:36',	'2022-09-11 06:43:15',	'voyager.posts.index',	NULL),
(4,	1,	'Users',	'',	'_self',	'voyager-person',	NULL,	NULL,	5,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	'voyager.users.index',	NULL),
(5,	1,	'Categories',	'',	'_self',	'voyager-categories',	NULL,	26,	1,	'2022-09-11 06:22:36',	'2022-09-11 06:43:15',	'voyager.categories.index',	NULL),
(6,	1,	'Pages',	'',	'_self',	'voyager-file-text',	NULL,	NULL,	9,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	'voyager.pages.index',	NULL),
(7,	1,	'Roles',	'',	'_self',	'voyager-lock',	NULL,	NULL,	4,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	'voyager.roles.index',	NULL),
(8,	1,	'Tools',	'',	'_self',	'voyager-tools',	NULL,	NULL,	10,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	NULL,	NULL),
(9,	1,	'Menu Builder',	'',	'_self',	'voyager-list',	NULL,	8,	1,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	'voyager.menus.index',	NULL),
(10,	1,	'Database',	'',	'_self',	'voyager-data',	NULL,	8,	2,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	'voyager.database.index',	NULL),
(11,	1,	'Compass',	'',	'_self',	'voyager-compass',	NULL,	8,	3,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	'voyager.compass.index',	NULL),
(12,	1,	'Settings',	'',	'_self',	'voyager-settings',	NULL,	NULL,	11,	'2022-09-11 06:22:36',	'2022-09-11 07:02:43',	'voyager.settings.index',	NULL),
(13,	1,	'Orders',	'/admin/orders',	'_self',	'voyager-documentation',	NULL,	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL,	NULL),
(14,	1,	'Products',	'/admin/products',	'_self',	'voyager-bag',	NULL,	27,	1,	'2022-09-11 06:22:36',	'2022-09-11 06:44:53',	NULL,	NULL),
(15,	1,	'Categories',	'/admin/category',	'_self',	'voyager-tag',	NULL,	27,	2,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	NULL,	NULL),
(16,	1,	'Coupons',	'/admin/coupons',	'_self',	'voyager-dollar',	NULL,	NULL,	3,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	NULL,	NULL),
(17,	1,	'Category Products',	'/admin/category-product',	'_self',	'voyager-categories',	NULL,	27,	3,	'2022-09-11 06:22:36',	'2022-09-11 06:44:57',	NULL,	NULL),
(18,	2,	'Trang chủ',	'/',	'_self',	NULL,	'#000000',	NULL,	1,	'2022-09-11 06:22:36',	'2022-09-14 05:35:30',	NULL,	''),
(19,	2,	'Thực đơn',	'/thuc-don',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:40:28',	NULL,	''),
(20,	2,	'Hỏi đáp',	'/hoi-dap',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:40:21',	NULL,	''),
(21,	3,	'Câu hỏi thường gặp',	'#',	'_self',	NULL,	'#000000',	NULL,	1,	'2022-09-11 06:22:36',	'2022-09-14 05:43:52',	NULL,	''),
(22,	3,	'Hướng dẫn đặt hàng',	'#',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:44:07',	NULL,	''),
(23,	3,	'Trả hàng & hoàn tiền',	'#',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:44:24',	NULL,	''),
(24,	3,	'Chứng nhận an toàn',	'#',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:44:37',	NULL,	''),
(25,	3,	'Phương thức vận chuyển',	'#',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-11 06:22:36',	'2022-09-14 05:45:24',	NULL,	''),
(26,	1,	'Posts',	'',	'_self',	'voyager-file-text',	'#000000',	NULL,	8,	'2022-09-11 06:43:06',	'2022-09-11 06:44:57',	NULL,	''),
(27,	1,	'Products',	'',	'_self',	'voyager-archive',	'#000000',	NULL,	7,	'2022-09-11 06:44:42',	'2022-09-11 06:44:57',	NULL,	''),
(28,	1,	'BREAD',	'',	'_self',	'voyager-bread',	'#000000',	8,	4,	'2022-09-11 07:02:32',	'2022-09-11 07:02:43',	'voyager.bread.index',	NULL),
(30,	1,	'Banners',	'',	'_self',	'voyager-photos',	'#000000',	44,	1,	'2022-09-11 10:29:18',	'2022-09-16 05:03:23',	'voyager.banners.index',	'null'),
(31,	1,	'Sliders',	'',	'_self',	'voyager-images',	'#000000',	44,	2,	'2022-09-11 10:34:52',	'2022-09-16 05:03:23',	'voyager.sliders.index',	'null'),
(32,	2,	'Về chúng tôi',	'/about',	'_self',	NULL,	'#000000',	NULL,	15,	'2022-09-14 05:35:12',	'2022-09-14 05:40:11',	NULL,	''),
(33,	3,	'Tài khoản của bạn',	'#',	'_self',	NULL,	'#000000',	NULL,	16,	'2022-09-14 05:45:39',	'2022-09-14 05:45:43',	NULL,	''),
(34,	4,	'Câu chuyện về em.fresh',	'#',	'_self',	NULL,	'#000000',	NULL,	1,	'2022-09-14 05:48:12',	'2022-09-14 06:02:12',	NULL,	''),
(35,	4,	'Tuyển dụng',	'#',	'_self',	NULL,	'#000000',	NULL,	2,	'2022-09-14 05:48:23',	'2022-09-14 06:02:12',	NULL,	''),
(36,	4,	'Quy định chung',	'#',	'_self',	NULL,	'#000000',	NULL,	3,	'2022-09-14 05:48:43',	'2022-09-14 06:02:12',	NULL,	''),
(37,	4,	'Điều khoản sử dụng',	'#',	'_self',	NULL,	'#000000',	NULL,	4,	'2022-09-14 05:48:59',	'2022-09-14 06:02:12',	NULL,	''),
(38,	4,	'Chính sách đổi trả',	'#',	'_self',	NULL,	'#000000',	NULL,	5,	'2022-09-14 05:49:07',	'2022-09-14 06:02:12',	NULL,	''),
(39,	4,	'Chính sách thanh toán',	'#',	'_self',	NULL,	'#000000',	NULL,	6,	'2022-09-14 05:49:20',	'2022-09-14 06:02:12',	NULL,	''),
(40,	4,	'Chính sách vận chuyển',	'#',	'_self',	NULL,	'#000000',	NULL,	7,	'2022-09-14 05:49:28',	'2022-09-14 06:02:12',	NULL,	''),
(41,	4,	'Chính sách bảo mật',	'#',	'_self',	NULL,	'#000000',	NULL,	8,	'2022-09-14 05:49:40',	'2022-09-14 06:02:13',	NULL,	''),
(42,	1,	'Shippings',	'',	'_self',	'voyager-ship',	NULL,	44,	3,	'2022-09-15 15:49:16',	'2022-09-16 05:03:23',	'voyager.shippings.index',	NULL),
(43,	1,	'Testimonials',	'',	'_self',	'voyager-chat',	'#000000',	44,	4,	'2022-09-16 05:00:58',	'2022-09-16 05:03:24',	'voyager.testimonials.index',	'null'),
(44,	1,	'Addons',	'',	'_self',	'voyager-params',	'#000000',	NULL,	13,	'2022-09-16 05:03:13',	'2022-09-16 05:03:23',	NULL,	'');

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(2,	'main',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(3,	'Hỗ trợ khách hàng',	'2022-09-11 06:22:36',	'2022-09-14 05:46:18'),
(4,	'Về em.fresh',	'2022-09-14 05:46:04',	'2022-09-14 05:46:04');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2016_01_01_000000_add_voyager_user_fields',	1),
(4,	'2016_01_01_000000_create_data_types_table',	1),
(5,	'2016_01_01_000000_create_pages_table',	1),
(6,	'2016_01_01_000000_create_posts_table',	1),
(7,	'2016_02_15_204651_create_categories_table',	1),
(8,	'2016_05_19_173453_create_menu_table',	1),
(9,	'2016_10_21_190000_create_roles_table',	1),
(10,	'2016_10_21_190000_create_settings_table',	1),
(11,	'2016_11_30_135954_create_permission_table',	1),
(12,	'2016_11_30_141208_create_permission_role_table',	1),
(13,	'2016_12_26_201236_data_types__add__server_side',	1),
(14,	'2017_01_13_000000_add_route_to_menu_items_table',	1),
(15,	'2017_01_14_005015_create_translations_table',	1),
(16,	'2017_01_15_000000_add_permission_group_id_to_permissions_table',	1),
(17,	'2017_01_15_000000_create_permission_groups_table',	1),
(18,	'2017_01_15_000000_make_table_name_nullable_in_permissions_table',	1),
(19,	'2017_03_06_000000_add_controller_to_data_types_table',	1),
(20,	'2017_04_11_000000_alter_post_nullable_fields_table',	1),
(21,	'2017_04_21_000000_add_order_to_data_rows_table',	1),
(22,	'2017_07_05_210000_add_policyname_to_data_types_table',	1),
(23,	'2017_08_05_000000_add_group_to_settings_table',	1),
(24,	'2017_11_26_013050_add_user_role_relationship',	1),
(25,	'2017_11_26_015000_create_user_roles_table',	1),
(26,	'2017_12_11_054653_create_products_table',	1),
(27,	'2018_01_11_060124_create_category_table',	1),
(28,	'2018_01_11_060548_create_category_product_table',	1),
(29,	'2018_01_14_215535_create_coupons_table',	1),
(30,	'2018_02_08_021546_add_image_to_products_table',	1),
(31,	'2018_02_08_032544_add_images_to_products_table',	1),
(32,	'2018_02_25_005243_create_orders_table',	1),
(33,	'2018_02_25_010522_create_order_product_table',	1),
(34,	'2018_03_11_000000_add_user_settings',	1),
(35,	'2018_03_14_000000_add_details_to_data_types_table',	1),
(36,	'2018_03_16_000000_make_settings_value_nullable',	1),
(37,	'2018_04_23_011947_add_user_role_relationship_fix',	1),
(38,	'2018_04_23_012009_create_user_roles_table_fix',	1),
(39,	'2018_06_29_032914_add_quantity_to_products_table',	1),
(40,	'2022_09_13_163948_create_social_accounts_table',	2);

DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned DEFAULT NULL,
  `product_id` int unsigned DEFAULT NULL,
  `quantity` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_product_order_id_foreign` (`order_id`),
  KEY `order_product_product_id_foreign` (`product_id`),
  CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` int NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int NOT NULL,
  `billing_tax` int NOT NULL,
  `billing_total` int NOT NULL,
  `payment_gateway` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1,	0,	'Hello World',	'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.',	'<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>',	'pages/page1.jpg',	'hello-world',	'Yar Meta Description',	'Keyword1, Keyword2',	'ACTIVE',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36');

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1,	1),
(1,	3),
(2,	1),
(2,	3),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(6,	3),
(7,	1),
(7,	3),
(8,	1),
(8,	3),
(9,	1),
(9,	3),
(10,	1),
(11,	1),
(11,	3),
(12,	1),
(12,	3),
(13,	1),
(13,	3),
(14,	1),
(14,	3),
(15,	1),
(16,	1),
(17,	1),
(18,	1),
(19,	1),
(20,	1),
(21,	1),
(22,	1),
(22,	3),
(23,	1),
(24,	1),
(25,	1),
(26,	1),
(26,	3),
(27,	1),
(27,	3),
(28,	1),
(28,	3),
(29,	1),
(29,	3),
(30,	1),
(31,	1),
(31,	3),
(32,	1),
(32,	3),
(33,	1),
(33,	3),
(34,	1),
(34,	3),
(35,	1),
(36,	1),
(36,	3),
(37,	1),
(37,	3),
(38,	1),
(38,	3),
(39,	1),
(39,	3),
(40,	1),
(41,	1),
(41,	3),
(42,	1),
(42,	3),
(43,	1),
(43,	3),
(44,	1),
(44,	3),
(45,	1),
(46,	1),
(46,	3),
(47,	1),
(47,	3),
(48,	1),
(48,	3),
(49,	1),
(49,	3),
(50,	1),
(51,	1),
(51,	3),
(52,	1),
(52,	3),
(53,	1),
(53,	3),
(54,	1),
(54,	3),
(55,	1),
(56,	1),
(56,	3),
(57,	1),
(57,	3),
(58,	1),
(58,	3),
(59,	1),
(59,	3),
(60,	1),
(61,	1),
(61,	3),
(62,	1),
(62,	3),
(63,	1),
(63,	3),
(64,	1),
(64,	3),
(65,	1),
(65,	3),
(66,	1),
(67,	1),
(68,	1),
(69,	1),
(70,	1),
(76,	1),
(77,	1),
(78,	1),
(79,	1),
(80,	1),
(81,	1),
(82,	1),
(83,	1),
(84,	1),
(85,	1),
(86,	1),
(87,	1),
(88,	1),
(89,	1),
(90,	1),
(91,	1),
(92,	1),
(93,	1),
(94,	1),
(95,	1);

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`, `permission_group_id`) VALUES
(1,	'browse_admin',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(2,	'browse_bread',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(3,	'browse_database',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(4,	'browse_media',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(5,	'browse_compass',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(6,	'browse_menus',	'menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(7,	'read_menus',	'menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(8,	'edit_menus',	'menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(9,	'add_menus',	'menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(10,	'delete_menus',	'menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(11,	'browse_pages',	'pages',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(12,	'read_pages',	'pages',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(13,	'edit_pages',	'pages',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(14,	'add_pages',	'pages',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(15,	'delete_pages',	'pages',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(16,	'browse_roles',	'roles',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(17,	'read_roles',	'roles',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(18,	'edit_roles',	'roles',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(19,	'add_roles',	'roles',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(20,	'delete_roles',	'roles',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(21,	'browse_users',	'users',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(22,	'read_users',	'users',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(23,	'edit_users',	'users',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(24,	'add_users',	'users',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(25,	'delete_users',	'users',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(26,	'browse_posts',	'posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(27,	'read_posts',	'posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(28,	'edit_posts',	'posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(29,	'add_posts',	'posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(30,	'delete_posts',	'posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(31,	'browse_categories',	'categories',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(32,	'read_categories',	'categories',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(33,	'edit_categories',	'categories',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(34,	'add_categories',	'categories',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(35,	'delete_categories',	'categories',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(36,	'browse_settings',	'settings',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(37,	'read_settings',	'settings',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(38,	'edit_settings',	'settings',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(39,	'add_settings',	'settings',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(40,	'delete_settings',	'settings',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(41,	'browse_products',	'products',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(42,	'read_products',	'products',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(43,	'edit_products',	'products',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(44,	'add_products',	'products',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(45,	'delete_products',	'products',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(46,	'browse_coupons',	'coupons',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(47,	'read_coupons',	'coupons',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(48,	'edit_coupons',	'coupons',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(49,	'add_coupons',	'coupons',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(50,	'delete_coupons',	'coupons',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(51,	'browse_category',	'category',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(52,	'read_category',	'category',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(53,	'edit_category',	'category',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(54,	'add_category',	'category',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(55,	'delete_category',	'category',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(56,	'browse_category_product',	'category_product',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(57,	'read_category_product',	'category_product',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(58,	'edit_category_product',	'category_product',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(59,	'add_category_product',	'category_product',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(60,	'delete_category_product',	'category_product',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(61,	'browse_orders',	'orders',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(62,	'read_orders',	'orders',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(63,	'edit_orders',	'orders',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(64,	'add_orders',	'orders',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(65,	'delete_orders',	'orders',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL),
(66,	'browse_faqs',	'faqs',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58',	NULL),
(67,	'read_faqs',	'faqs',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58',	NULL),
(68,	'edit_faqs',	'faqs',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58',	NULL),
(69,	'add_faqs',	'faqs',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58',	NULL),
(70,	'delete_faqs',	'faqs',	'2022-09-11 10:15:58',	'2022-09-11 10:15:58',	NULL),
(76,	'browse_banners',	'banners',	'2022-09-11 10:32:21',	'2022-09-11 10:32:21',	NULL),
(77,	'read_banners',	'banners',	'2022-09-11 10:32:21',	'2022-09-11 10:32:21',	NULL),
(78,	'edit_banners',	'banners',	'2022-09-11 10:32:21',	'2022-09-11 10:32:21',	NULL),
(79,	'add_banners',	'banners',	'2022-09-11 10:32:21',	'2022-09-11 10:32:21',	NULL),
(80,	'delete_banners',	'banners',	'2022-09-11 10:32:21',	'2022-09-11 10:32:21',	NULL),
(81,	'browse_sliders',	'sliders',	'2022-09-11 10:34:52',	'2022-09-11 10:34:52',	NULL),
(82,	'read_sliders',	'sliders',	'2022-09-11 10:34:52',	'2022-09-11 10:34:52',	NULL),
(83,	'edit_sliders',	'sliders',	'2022-09-11 10:34:52',	'2022-09-11 10:34:52',	NULL),
(84,	'add_sliders',	'sliders',	'2022-09-11 10:34:52',	'2022-09-11 10:34:52',	NULL),
(85,	'delete_sliders',	'sliders',	'2022-09-11 10:34:52',	'2022-09-11 10:34:52',	NULL),
(86,	'browse_shippings',	'shippings',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16',	NULL),
(87,	'read_shippings',	'shippings',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16',	NULL),
(88,	'edit_shippings',	'shippings',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16',	NULL),
(89,	'add_shippings',	'shippings',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16',	NULL),
(90,	'delete_shippings',	'shippings',	'2022-09-15 15:49:16',	'2022-09-15 15:49:16',	NULL),
(91,	'browse_testimonials',	'testimonials',	'2022-09-16 05:00:58',	'2022-09-16 05:00:58',	NULL),
(92,	'read_testimonials',	'testimonials',	'2022-09-16 05:00:58',	'2022-09-16 05:00:58',	NULL),
(93,	'edit_testimonials',	'testimonials',	'2022-09-16 05:00:58',	'2022-09-16 05:00:58',	NULL),
(94,	'add_testimonials',	'testimonials',	'2022-09-16 05:00:58',	'2022-09-16 05:00:58',	NULL),
(95,	'delete_testimonials',	'testimonials',	'2022-09-16 05:00:58',	'2022-09-16 05:00:58',	NULL);

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(5,	1,	3,	'Phần ăn giao đến là tươi nóng hay đông lạnh?',	'',	'Phần ăn giao đến là tươi nóng hay đông lạnh?',	'<p>Phần ăn giao đến l&agrave; tươi n&oacute;ng hay đ&ocirc;ng lạnh?</p>',	NULL,	'phan-an-giao-den-la-tuoi-nong-hay-dong-lanh',	'',	'',	'PUBLISHED',	0,	'2022-09-11 10:02:01',	'2022-09-11 10:57:32'),
(6,	3,	3,	'em.fresh là gì?',	NULL,	NULL,	'<p>Dựa tr&ecirc;n nhu cầu của c&aacute;c bạn trẻ bận rộn, kh&ocirc;ng c&oacute; thời gian chuẩn bị đầy đủ cho việc nấu ăn cũng như những người quan t&acirc;m đến lối ăn uống l&agrave;nh mạnh, nhưng kh&ocirc;ng biết bắt đầu từ đ&acirc;u v&agrave; như thế n&agrave;o, em.fresh cung cấp c&aacute;c bữa ăn sạch v&agrave; dinh dưỡng h&agrave;ng tuần/ th&aacute;ng được chuẩn bị sẵn, đồng h&agrave;nh c&ugrave;ng bạn trong phong c&aacute;ch sống c&acirc;n bằng dinh dưỡng v&agrave; khoẻ mạnh.</p>\r\n<p>Tuỳ theo mục đ&iacute;ch ri&ecirc;ng, nhu cầu dinh dưỡng, tập luyện v&agrave; th&oacute;i quen sinh hoạt v&agrave; ăn uống hiện tại, em.fresh sẽ tư vấn cho bạn g&oacute;i ăn ph&ugrave; hợp bởi ti&ecirc;u ch&iacute; của em.fresh l&agrave; mang đến &ldquo;bữa ăn chuẩn dinh dưỡng cho ri&ecirc;ng bạn&rdquo;. C&aacute;c phần ăn của em.fresh kh&ocirc;ng những được t&iacute;nh to&aacute;n đầy đủ dinh dưỡng v&agrave; năng lượng, m&agrave; c&ograve;n được lựa chọn tỉ mỉ từng nguy&ecirc;n liệu tươi ngon v&agrave; c&oacute; gi&aacute; trị cao cho sức khoẻ.</p>\r\n<p>Việc ăn uống với em.fresh kh&ocirc;ng hề nh&agrave;m ch&aacute;n v&agrave; sai như nhiều người vẫn nghĩ (ăn thật nhạt, tuyệt đối kh&ocirc;ng ăn dầu mỡ, ăn thật nhiều thịt, kh&ocirc;ng ăn tinh bột,&hellip;). Với em.fresh sự dinh dưỡng đến từ &ldquo;c&acirc;n bằng&rdquo; v&agrave; được c&aacute; thể ho&aacute; với nhu cầu của từng người, chứ kh&ocirc;ng hề rập khu&ocirc;n 1 c&ocirc;ng thức cho bất cứ ai. V&igrave; mỗi người l&agrave; 1 bản thể kh&aacute;c nhau phải kh&ocirc;ng n&agrave;o?</p>',	NULL,	'em-fresh-la-gi',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:28:05',	'2022-09-14 07:28:05'),
(7,	3,	3,	'Làm sao để tôi đặt hàng?',	NULL,	NULL,	'<p>Để được tư vấn tốt hơn về chọn g&oacute;i ăn v&agrave; giải đ&aacute;p c&aacute;c thắc mắc kh&aacute;c, c&aacute;c bạn li&ecirc;n hệ ch&uacute;ng m&igrave;nh qua facebook <a href=\"https://www.facebook.com/emfreshvietnam\">em.fresh</a>. Sau đ&oacute; c&aacute;c bạn sẽ được hướng dẫn l&agrave;m theo c&aacute;c bước:</p>\r\n<p>- V&agrave;o đường link đặt h&agrave;ng tr&ecirc;n website www.emfresh.vn</p>\r\n<p>- Đăng k&yacute; t&agrave;i khoản</p>\r\n<p>- Chọn g&oacute;i ăn ph&ugrave; hợp, số lượng bữa ăn/ng&agrave;y, số ng&agrave;y ăn trong tuần v&agrave; th&ecirc;m v&agrave;o giỏ c&aacute;c sản phẩm d&ugrave;ng k&egrave;m theo</p>\r\n<p>- Chọn c&aacute;c m&oacute;n ăn y&ecirc;u th&iacute;ch trong số 3 m&oacute;n ăn trong từng ng&agrave;y hoặc để chế độ mặc định (em.fresh đ&atilde; c&acirc;n đối c&aacute;c ng&agrave;y để đảm bảo sự đa dạng dinh dưỡng của c&aacute;c m&oacute;n ăn - đ&acirc;y l&agrave; lựa chọn tốt nhất m&agrave; em.fresh d&agrave;nh cho bạn)</p>\r\n<p>- Điền đầy đủ th&ocirc;ng tin giao h&agrave;ng tr&ecirc;n website, chọn thời gian giao h&agrave;ng thuận tiện v&agrave; lựa chọn h&igrave;nh thức thanh to&aacute;n COD hoặc chuyển khoản</p>\r\n<p>- Nhận email x&aacute;c nhận gửi v&agrave;o email bạn đăng k&yacute; với chi tiết c&aacute;c th&ocirc;ng tin bạn đ&atilde; cung cấp cho em.fresh</p>\r\n<p>Nếu c&oacute; kh&oacute; khăn trong qu&aacute; tr&igrave;nh đặt h&agrave;ng hoặc cần được hướng dẫn cụ thể, đừng ngại gọi ngay đến số hotline em.fresh 091 848 1166 hoặc inbox fanpage <a href=\"https://www.facebook.com/emfreshvietnam\">https://www.facebook.com/emfreshvietnam</a></p>',	NULL,	'lam-sao-de-toi-dat-hang',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:30:55',	'2022-09-14 07:30:55'),
(8,	3,	3,	'Lưu ý gì khi dùng phần ăn của em.fresh?',	NULL,	NULL,	'<p>C&aacute;c phần ăn (2-3 bữa/ ng&agrave;y) sẽ được giao đến bạn c&ugrave;ng 1 l&uacute;c v&agrave;o buổi s&aacute;ng (8h-12h) tất cả c&aacute;c ng&agrave;y trong tuần.</p>\r\n<p>Để đảm bảo vệ sinh an to&agrave;n thực phẩm, em.fresh đảm bảo kh&ocirc;ng sử dụng thức ăn đ&atilde; qua cấp đ&ocirc;ng, c&aacute;c m&oacute;n ăn đều được đảm bảo thời gian tối ưu từ l&uacute;c nấu đến tay kh&aacute;ch h&agrave;ng. C&aacute;c phần ăn l&agrave; phần ăn được giao tươi n&oacute;ng</p>\r\n<p>Phần ăn ho&agrave;n to&agrave;n tự nhi&ecirc;n v&agrave; kh&ocirc;ng c&oacute; chất bảo quản n&ecirc;n rất dễ bị hư thiu trong điều kiện nắng n&oacute;ng. C&aacute;c phần ăn &ldquo;giao n&oacute;ng&rdquo; được ưu ti&ecirc;n hơn cả khi sau khi rời khỏi bếp được đ&oacute;ng hộp v&agrave; ưu ti&ecirc;n giao sớm nhất c&oacute; thể.</p>\r\n<p>Sau khi nhận, cất hộp trữ tủ lạnh hay &iacute;t nhất l&agrave; nhiệt độ ph&ograve;ng lạnh dưới 20 độ C</p>\r\n<p>N&ecirc;n thưởng thức bữa ăn trong v&ograve;ng 8-12h sau khi nhận để bữa ăn c&oacute; chất lượng cao nhất</p>\r\n<p>C&aacute;c bạn kh&ocirc;ng &ldquo;để qu&ecirc;n&rdquo; bữa ăn dưới cốp xe hay tiếp x&uacute;c &aacute;nh nắng mặt trời nh&eacute; l&acirc;u nh&eacute;</p>\r\n<p>Để sử dụng, cho phần ăn hoặc b&agrave;y ra đĩa/t&ocirc; rồi cho v&agrave;o l&ograve; vi s&oacute;ng v&agrave; quay từ 2-4 ph&uacute;t, hộp nhựa đen v&agrave; th&acirc;n hũ sốt trắng của em.fresh l&agrave; nhựa PP an to&agrave;n khi sử dụng l&ograve; vi s&oacute;ng. Tuy nhi&ecirc;n, bạn vui l&ograve;ng bỏ nắp hũ sốt ra nh&eacute; v&igrave; đ&acirc;y l&agrave; loại kh&ocirc;ng d&ugrave;ng được trong l&ograve; vi s&oacute;ng</p>',	NULL,	'luu-y-gi-khi-dung-phan-an-cua-em-fresh',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:32:33',	'2022-09-14 07:33:42'),
(9,	3,	3,	'em.fresh có gì khác biệt trong phần ăn của mình?',	NULL,	NULL,	'<p>Tuỳ theo mục đ&iacute;ch ri&ecirc;ng, nhu cầu dinh dưỡng, tập luyện v&agrave; th&oacute;i quen sinh hoạt v&agrave; ăn uống hiện tại, em.fresh sẽ tư vấn cho bạn g&oacute;i ăn ph&ugrave; hợp bởi ti&ecirc;u ch&iacute; của em.fresh l&agrave; mang đến &ldquo;bữa ăn chuẩn dinh dưỡng cho ri&ecirc;ng bạn&rdquo;. C&aacute;c phần ăn của em.fresh kh&ocirc;ng những được t&iacute;nh to&aacute;n đầy đủ dinh dưỡng v&agrave; năng lượng, m&agrave; c&ograve;n được lựa chọn tỉ mỉ từng nguy&ecirc;n liệu tươi ngon v&agrave; c&oacute; gi&aacute; trị cao cho sức khoẻ</p>\r\n<p>Việc ăn uống với em.fresh kh&ocirc;ng hề nh&agrave;m ch&aacute;n v&agrave; sai lầm như nhiều người vẫn nghĩ (ăn thật nhạt, tuyệt đối kh&ocirc;ng ăn dầu mỡ, ăn thật nhiều thịt, kh&ocirc;ng ăn tinh bột,&hellip;). Với em.fresh sự dinh dưỡng đến từ &ldquo;c&acirc;n bằng&rdquo; v&agrave; được c&aacute; thể ho&aacute; với nhu cầu của từng người, chứ kh&ocirc;ng hề rập khu&ocirc;n 1 c&ocirc;ng thức cho bất cứ ai. V&igrave; mỗi người l&agrave; 1 bản thể kh&aacute;c nhau phải kh&ocirc;ng n&agrave;o? Thực phẩm được lựa chọn hướng tới tỷ lệ tinh bột phức (complex carbohydrate), chất b&eacute;o (lipid) v&agrave; đạm (protein) được x&acirc;y dựng đảm bộ sự &ldquo;c&acirc;n bằng&rdquo; đ&oacute;</p>\r\n<p>Phần ăn của em.fresh kh&ocirc;ng gồm canh v&igrave; lượng gia vị đ&atilde; được c&acirc;n đối chuẩn trong phần ăn nhằm việc tr&aacute;nh sử dụng nhiều gia vị v&agrave; nước canh trong bữa ăn g&acirc;y lo&atilde;ng dịch vị dạ d&agrave;y trong qu&aacute; tr&igrave;nh ti&ecirc;u ho&aacute;</p>\r\n<p>Hũ sốt đi k&egrave;m, kh&aacute;ch h&agrave;ng c&oacute; thể gia giảm nhiều &iacute;t tuỳ theo khẩu vị của bản th&acirc;n</p>',	NULL,	'em-fresh-co-gi-khac-biet-trong-phan-an-cua-minh',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:33:32',	'2022-09-14 07:33:32'),
(10,	3,	3,	'Cách lựa chọn các gói ăn phù hợp?',	NULL,	NULL,	'<p>Hiện tại, em.fresh cung cấp cho bạn c&aacute;c g&oacute;i ăn như sau:</p>\r\n<p>- G&oacute;i giảm c&acirc;n: d&agrave;nh cho người giảm c&acirc;n nhưng vẫn đảm bảo khoẻ mạnh v&agrave; giảm c&acirc;n an to&agrave;n</p>\r\n<p>- G&oacute;i eatclean: d&agrave;nh cho kh&aacute;ch h&agrave;ng muốn duy tr&igrave; v&oacute;c d&aacute;ng v&agrave; thể lực</p>\r\n<p>- G&oacute;i protein+: d&agrave;nh cho kh&aacute;ch h&agrave;ng sử dụng thể lực nhiều (tập gym, lao động tay ch&acirc;n) với lượng protein nhiều gấp đ&ocirc;i so với c&aacute;c phần ăn th&ocirc;ng thường để đảm bảo b&ugrave; đắp lượng thiếu hụt protein v&agrave; duy tr&igrave; sức mạnh cơ bắp</p>\r\n<p>&nbsp;</p>\r\n<p>em.fresh chia c&aacute;c phần ăn th&agrave;nh size M v&agrave; L:</p>\r\n<p>- Phần ăn size M: cung cấp 480-530 kcal/phần</p>\r\n<p>- Phần ăn size L: cung cấp 580-630 kcal/phần</p>',	NULL,	'cach-lua-chon-cac-goi-an-phu-hop',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:35:07',	'2022-09-14 07:35:33'),
(11,	3,	3,	'em.fresh đồng hành cùng lối sống xanh',	NULL,	NULL,	'<p>em.fresh hiểu rằng việc sử dụng nhựa trong c&aacute;c sản phẩm c&oacute; thể g&acirc;y nhiều t&aacute;c động xấu đến m&ocirc;i trường, trong qu&aacute; tr&igrave;nh vận h&agrave;nh em.fresh đ&atilde; đưa ra 1 số c&aacute;ch thức để em.fresh v&agrave; qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; thể c&ugrave;ng nhau gi&uacute;p sức:</p>\r\n<p>- Phần ăn của em.fresh l&agrave; phần ăn kh&ocirc;ng bao gồm khăn lạnh (qu&yacute; kh&aacute;ch sử dụng sẽ tự chọn th&ecirc;m ở mục &ldquo;th&ecirc;m v&agrave;o giỏ&rdquo; khi lựa chọn c&ugrave;ng với g&oacute;i ăn)</p>\r\n<p>- Chế độ chọn phần th&ecirc;m v&agrave;o trong phần ăn của em.fresh, kh&aacute;ch h&agrave;ng c&oacute; thể lựa chọn &ldquo;kh&ocirc;ng lấy dụng cụ ăn uống&rdquo; v&agrave; tự chuẩn bị ri&ecirc;ng 1 bộ bằng gỗ/inox của ri&ecirc;ng m&igrave;nh, vệ sinh v&agrave; t&aacute;i sử dụng sau mỗi lần ăn nhằm giảm thiểu lượng r&aacute;c thải từ nhựa sử dụng 1 lần</p>\r\n<p>- T&uacute;i nylon x&aacute;ch c&oacute; quai của em.fresh l&agrave; t&uacute;i tự huỷ th&acirc;n thiện với m&ocirc;i trường, t&uacute;i sẽ tự huỷ sau 6-9 th&aacute;ng ở ngo&agrave;i m&ocirc;i trường tự nhi&ecirc;n</p>\r\n<p>- C&aacute;c hộp nhựa đen, nắp trắng trong suốt của em.fresh l&agrave; hộp nhựa PP c&oacute; thể t&aacute;i sử dụng, kh&aacute;ch h&agrave;ng c&oacute; thể tận dụng hoặc gửi lại shipper về em.fresh, ch&uacute;ng m&igrave;nh sẽ đại diện c&aacute;c bạn gửi c&aacute;c hộp n&agrave;y đến đơn vị thu gom v&agrave; t&aacute;i chế nhựa</p>',	NULL,	'em-fresh-dong-hanh-cung-loi-song-xanh',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:36:14',	'2022-09-14 07:36:14'),
(12,	3,	3,	'Khi nào thì thấy hiệu quả của việc ăn uống cùng em.fresh?',	NULL,	NULL,	'<p>Việc hướng tới 1 cơ thể khoẻ mạnh kh&ocirc;ng kh&oacute;, nhưng cần sự ki&ecirc;n tr&igrave; v&agrave; phối hợp nhiều yếu tố (mức độ bạn lao động, chế độ tập luyện k&egrave;m theo, th&oacute;i quen sinh hoạt,&hellip;). C&aacute;c ghi nhận phản hồi từ kh&aacute;ch h&agrave;ng của em.fresh cho thấy kết quả đ&aacute;ng ghi nhận từ tuần thứ 3-4 khi bạn duy tr&igrave; chế độ ăn (hoặc được tư vấn để giảm size phần ăn nhằm giảm dần lượng Calories nạp) c&oacute; thể giảm l&ecirc;n đến 2-3kg trong 1 th&aacute;ng.</p>\r\n<p>em.fresh khuyến kh&iacute;ch bạn tập luyện thể lực nhiều hơn bởi &ldquo;ăn uống l&agrave; bản năng nhưng tập luyện l&agrave; bản lĩnh&rdquo;, c&aacute;c bạn c&oacute; thể sử dụng c&aacute;c g&oacute;i nước &eacute;p hoặc sữa hạt em.fresh cung cấp để tuy giảm c&acirc;n hay build cơ vẫn đảm bảo được cung cấp đủ vitamin v&agrave; c&aacute;c chất thiết yếu. em.fresh khuyến kh&iacute;ch bạn khi đạt c&acirc;n nặng mon muốn quay về chế độ ăn th&ocirc;ng thường (tuy nhi&ecirc;n vẫn hạn chế đường đơn, trans fat) v&agrave; duy tr&igrave; chế độ tập luyện</p>',	NULL,	'khi-nao-thi-thay-hieu-qua-cua-viec-an-uong-cung-em-fresh',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:36:48',	'2022-09-14 07:36:48'),
(13,	3,	3,	'Mình có thể huỷ gói hay bảo lưu được không?',	NULL,	NULL,	'<p>Kh&aacute;ch h&agrave;ng c&oacute; thể bảo lưu ng&agrave;y ăn nếu c&oacute; kế hoạch ăn uống kh&aacute;c hay đi xa khỏi địa chỉ giao h&agrave;ng với điều kiện b&aacute;o trước cho em.fresh &iacute;t nhất 12 giờ (tức 8h tối h&ocirc;m trước)</p>\r\n<p>Qu&yacute; kh&aacute;ch c&oacute; thể bảo lưu g&oacute;i ăn trong thời gian tối đa 2 tuần, em.fresh từ chối nhận bảo lưu trong thời gian l&acirc;u hơn. Nếu kh&aacute;ch ngưng thời gian d&agrave;i hơn, em.fresh xin ph&eacute;p t&iacute;nh gi&aacute; c&aacute;c phần kh&aacute;ch đ&atilde; ăn theo gi&aacute; thường v&agrave; phần gi&aacute; trị chưa d&ugrave;ng:</p>\r\n<p>+ &gt;200k em.fresh sẽ ho&agrave;n lại cho kh&aacute;ch h&agrave;ng</p>\r\n<p>+ &lt;200k em.fresh xin ph&eacute;p chuyển phần tiền n&agrave;y th&agrave;nh c&aacute;c sản phẩm kh&aacute;c (b&aacute;nh, protein bar,&hellip;) hay c&aacute;c g&oacute;i kh&aacute;c m&agrave; em.fresh cung cấp (sữa hạt, nước &eacute;p,&hellip;)</p>\r\n<p>Qu&yacute; kh&aacute;ch c&oacute; thể huỷ g&oacute;i v&agrave; được xử l&yacute; như trường hợp bảo lưu d&agrave;i hơn 2 th&aacute;ng ở ph&iacute;a tr&ecirc;n</p>',	NULL,	'minh-co-the-huy-goi-hay-bao-luu-duoc-khong',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:37:33',	'2022-09-14 07:37:33'),
(14,	3,	3,	'Chế độ linh hoạt đổi địa điểm',	NULL,	NULL,	'<p>em.fresh biết c&aacute;c bạn rất bận rộn với lịch tr&igrave;nh của ri&ecirc;ng m&igrave;nh n&ecirc;n để linh hoạt hơn, em.fresh c&oacute; ch&iacute;nh s&aacute;ch hỗ trợ kh&aacute;ch h&agrave;ng đổi địa điểm trước &iacute;t nhất 12h (tức 8h tối h&ocirc;m trước)</p>\r\n<p>Nếu bạn b&aacute;o muộn hơn thời gian n&agrave;y, em.fresh sẽ ưu ti&ecirc;n cho những kh&aacute;ch kh&aacute;c trước v&agrave; cho shipper giao đơn bạn sau c&ugrave;ng. Nếu bạn muốn nhận sớm hơn trong trường hợp n&agrave;y, em.fresh sẽ book giao h&agrave;ng ahamove cho bạn v&agrave; bạn thanh to&aacute;n ph&iacute; ship nhằm đảm bảo tất cả c&aacute;c kh&aacute;ch h&agrave;ng được shipper đi đ&uacute;ng tuyến v&agrave; theo đ&uacute;ng tiến độ giao, bảo đảm giờ nhận h&agrave;ng cho kh&aacute;ch</p>',	NULL,	'che-do-linh-hoat-doi-dia-diem',	NULL,	NULL,	'PUBLISHED',	0,	'2022-09-14 07:37:57',	'2022-09-14 07:37:57');

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int unsigned NOT NULL DEFAULT '10',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ingredient` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_manual` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sale_at` date DEFAULT NULL,
  `meals` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_unique` (`name`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `description`, `featured`, `quantity`, `image`, `images`, `ingredient`, `user_manual`, `created_at`, `updated_at`, `sale_at`, `meals`) VALUES
(1,	'Stir-Fry Chicken and Broccoli with Garlic Sauce',	'stir-fry-chicken-and-broccoli-with-garlic-sauce',	'Stir-Fry Chicken and Broccoli with Garlic Sauce',	173418,	'<p>Lorem 1 ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!</p>\r\n<div class=\"ddict_div\" style=\"top: 36px; max-width: 150px; left: 351.938px;\"><img class=\"ddict_audio\" src=\"chrome-extension://bpggmmljdiliancllaapiggllnkbjocb/img/audio.png\" />\r\n<p class=\"ddict_sentence\">elit</p>\r\n</div>',	0,	10,	'products/dummy/laptop-1.jpg',	'[\"products\\/dummy\\/laptop-2.jpg\",\"products\\/dummy\\/laptop-3.jpg\",\"products\\/dummy\\/laptop-4.jpg\"]',	'<div class=\"raw_components--panel--3IcXg inspect_panels--inspectionPanel--3Wboz\" style=\"margin: 0px; padding: 8px 0px; border-top: 0px; border-right: 0px; border-bottom: 1px solid var(--color-border, #e5e5e5); border-left: 0px; border-image: initial; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 18px; vertical-align: inherit; outline: none; cursor: inherit; user-select: text;\" tabindex=\"-1\">\r\n<div style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: inherit; outline: none; cursor: inherit;\">\r\n<div class=\"inspect_panels--copyableRow--2_PiZ inspect_panels--highlightRow--21P9S\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px; border: 0px; vertical-align: inherit; outline: none; cursor: inherit; position: relative; z-index: 0; flex: 1 1 0%;\">\r\n<div class=\"inspect_panels--propertyRowContent--7Y-mu inspect_panels--copyableRow--2_PiZ inspect_panels--highlightRow--21P9S\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; margin: 0px; padding: 0px 16px; border: 0px; vertical-align: inherit; outline: none; cursor: inherit; position: relative; z-index: 0; flex: 1 1 0%; display: flex; flex-direction: column; justify-content: center; min-height: 24px;\">\r\n<div class=\"inspect_panels--contentProperty--2Z1QI text--fontPos11--RSei3 text--_fontBase--YWDo0 ellipsis--ellipsisAfter8Lines--2rn32 ellipsis--_ellipsisAfterNLines--26JkZ\" dir=\"auto\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; margin: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 16px; vertical-align: inherit; outline: none; cursor: inherit; display: -webkit-inline-box; overflow: hidden; -webkit-box-orient: vertical; -webkit-line-clamp: 8; flex: 0 1 0%; flex-direction: column; justify-content: center; align-items: center;\">\r\n<div class=\"inspect_panels--contentProperty--2Z1QI text--fontPos11--RSei3 text--_fontBase--YWDo0 ellipsis--ellipsisAfter8Lines--2rn32 ellipsis--_ellipsisAfterNLines--26JkZ\" dir=\"auto\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; margin: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 16px; vertical-align: inherit; outline: none; cursor: inherit; display: -webkit-inline-box; overflow: hidden; -webkit-box-orient: vertical; -webkit-line-clamp: 8; flex: 0 1 0%; flex-direction: column; justify-content: center; align-items: center;\">Ingredients: liquid whole eggs (liquid cage free egg), turkey migas mix (turkey sausage [turkey, garlic, spices, salt, olive oil, coconut palm sugar], sweet potatoes, corn tortilla [ground corn, water, lime], zucchini, yellow corn, red bell pepper, green bell pepper, yellow onion, tomatoes, olive oil, water, garlic, sea salt, chili powder, black pepper, apple cider vinegar, ground cumin, garlic powder, allspice, ground coriander, cilantro, cayenne pepper, smoked paprika [paprika and silicon dioxide]), red salsa (tomato, yellow onion, tomato paste, jalapeno pepper, lime juice, sea salt, crushed red pepper), cheddar cheese (pasteurized milk, cheese cultures, salt, enzymes, beta carotene or annatto)</div>\r\n<div class=\"inspect_panels--contentProperty--2Z1QI text--fontPos11--RSei3 text--_fontBase--YWDo0 ellipsis--ellipsisAfter8Lines--2rn32 ellipsis--_ellipsisAfterNLines--26JkZ\" dir=\"auto\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; margin: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 16px; vertical-align: inherit; outline: none; cursor: inherit; display: -webkit-inline-box; overflow: hidden; -webkit-box-orient: vertical; -webkit-line-clamp: 8; flex: 0 1 0%; flex-direction: column; justify-content: center; align-items: center;\">&nbsp;</div>\r\n<div class=\"inspect_panels--contentProperty--2Z1QI text--fontPos11--RSei3 text--_fontBase--YWDo0 ellipsis--ellipsisAfter8Lines--2rn32 ellipsis--_ellipsisAfterNLines--26JkZ\" dir=\"auto\" style=\"font-variant-numeric: inherit; font-variant-east-asian: inherit; margin: 0px; padding: 0px; border: 0px; font-stretch: inherit; line-height: 16px; vertical-align: inherit; outline: none; cursor: inherit; display: -webkit-inline-box; overflow: hidden; -webkit-box-orient: vertical; -webkit-line-clamp: 8; flex: 0 1 0%; flex-direction: column; justify-content: center; align-items: center;\">Contains: egg, milk (cheese)</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>',	'<p>Microwave: Peel a corner of protective film (1/4-1/2 inch). Heat 2-3 minutes. Time may vary depending on microwave.</p>\r\n<p>&nbsp;</p>\r\n<p>Conventional Oven: Transfer meal to oven-safe dish, heat for 7 minutes at 350 F or until desired temperature is reached.</p>\r\n<p>&nbsp;</p>\r\n<p>Stove Top: Transfer to pot, heat to desired temperature.</p>',	'2022-09-11 06:22:00',	'2022-09-11 06:22:00',	NULL,	'');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1,	'admin',	'Administrator',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(2,	'user',	'Normal User',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(3,	'adminweb',	'Admin Web',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36');

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1,	'site.title',	'Site Title',	'Emfresh',	'',	'text',	1,	'Site'),
(2,	'site.description',	'Site Description',	'Emfresh',	'',	'text',	2,	'Site'),
(3,	'site.logo',	'Site Logo',	'settings/September2022/3HbLW7fT1Za0GxGgTuH4.png',	'',	'image',	3,	'Site'),
(4,	'site.google_analytics_tracking_id',	'Google Analytics Tracking ID',	NULL,	'',	'text',	4,	'Site'),
(5,	'admin.bg_image',	'Admin Background Image',	'',	'',	'image',	5,	'Admin'),
(6,	'admin.title',	'Admin Title',	'Voyager',	'',	'text',	1,	'Admin'),
(7,	'admin.description',	'Admin Description',	'Welcome to Voyager. The Missing Admin for Laravel',	'',	'text',	2,	'Admin'),
(8,	'admin.loader',	'Admin Loader',	'',	'',	'image',	3,	'Admin'),
(9,	'admin.icon_image',	'Admin Icon Image',	'',	'',	'image',	4,	'Admin'),
(10,	'admin.google_analytics_client_id',	'Google Analytics Client ID (used for admin dashboard)',	NULL,	'',	'text',	1,	'Admin'),
(11,	'site.stock_threshold',	'Stock Threshold',	'5',	'',	'text',	6,	'Site'),
(12,	'site.address',	'Address',	'999 Nguyễn Văn Đậu, phường 11, quận Bình Thạnh, TP.HCM',	NULL,	'text',	7,	'Site'),
(14,	'site.phone',	'Phone',	'(+84) 91 848 1166',	NULL,	'text',	8,	'Site'),
(15,	'site.Email',	'Email',	'hotro@emfresh.vn',	NULL,	'text',	9,	'Site'),
(16,	'site.info_mst',	'Mã số thuế',	'0313272749 do Sở kế hoạch và đầu tư TPHCM cấp ngày 26/05/2022',	NULL,	'text',	10,	'Site');

DROP TABLE IF EXISTS `shippings`;
CREATE TABLE `shippings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `description` tinytext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `shippings` (`id`, `district`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	'Quận 1',	20000,	NULL,	'2022-09-15 15:50:48',	'2022-09-15 15:50:48',	NULL),
(2,	'Quận 2',	20000,	NULL,	'2022-09-15 15:51:00',	'2022-09-15 15:51:18',	NULL),
(3,	'Quận 3',	20000,	NULL,	'2022-09-15 15:51:12',	'2022-09-15 15:51:12',	NULL),
(4,	'Quận 4',	20000,	NULL,	'2022-09-15 15:51:29',	'2022-09-15 15:51:29',	NULL),
(5,	'Quận 5',	20000,	NULL,	'2022-09-15 15:51:40',	'2022-09-15 15:51:40',	NULL);

DROP TABLE IF EXISTS `slider_banners`;
CREATE TABLE `slider_banners` (
  `slider_id` int DEFAULT NULL,
  `banner_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `slider_banners` (`slider_id`, `banner_id`) VALUES
(3,	3),
(3,	4),
(4,	5),
(4,	2),
(2,	6),
(2,	7),
(2,	8),
(6,	9),
(6,	10),
(6,	11),
(6,	12),
(7,	13);

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `social_accounts`;
CREATE TABLE `social_accounts` (
  `user_id` int NOT NULL,
  `provider_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `social_accounts` (`user_id`, `provider_user_id`, `provider`, `created_at`, `updated_at`) VALUES
(4,	'1434888680338461',	'facebook',	'2022-09-14 04:22:40',	'2022-09-14 04:22:40'),
(4,	'105184996355019822902',	'google',	'2022-09-14 05:07:25',	'2022-09-14 05:07:25');

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stars` int DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `testimonials` (`id`, `name`, `stars`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`, `image`, `slug`) VALUES
(1,	'NGUYEN VAN HUNG',	4,	'Delicious, well balanced, healthy meals. Quality ingredients, good variety and flavors. Makes weeknight eating easy and healthy for us as',	'PUBLISHED',	'2022-09-15 22:18:52',	'2022-09-15 22:18:52',	NULL,	'testimonials/September2022/3Z17ywVW4L32T0cgx3F9.png',	NULL),
(2,	'Lân Nguyễn',	4,	'Delicious, well balanced, healthy meals. Quality ingredients, good variety and flavors. Makes weeknight eating easy and healthy for us as',	'PUBLISHED',	'2022-09-15 22:18:52',	'2022-09-15 22:18:52',	NULL,	'testimonials/September2022/3Z17ywVW4L32T0cgx3F9.png',	NULL);

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1,	'data_types',	'display_name_singular',	1,	'pt',	'Post',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(2,	'data_types',	'display_name_singular',	2,	'pt',	'Página',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(3,	'data_types',	'display_name_singular',	3,	'pt',	'Utilizador',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(4,	'data_types',	'display_name_singular',	4,	'pt',	'Categoria',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(5,	'data_types',	'display_name_singular',	5,	'pt',	'Menu',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(6,	'data_types',	'display_name_singular',	6,	'pt',	'Função',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(7,	'data_types',	'display_name_plural',	1,	'pt',	'Posts',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(8,	'data_types',	'display_name_plural',	2,	'pt',	'Páginas',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(9,	'data_types',	'display_name_plural',	3,	'pt',	'Utilizadores',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(10,	'data_types',	'display_name_plural',	4,	'pt',	'Categorias',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(11,	'data_types',	'display_name_plural',	5,	'pt',	'Menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(12,	'data_types',	'display_name_plural',	6,	'pt',	'Funções',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(13,	'categories',	'slug',	1,	'pt',	'categoria-1',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(14,	'categories',	'name',	1,	'pt',	'Categoria 1',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(15,	'categories',	'slug',	2,	'pt',	'categoria-2',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(16,	'categories',	'name',	2,	'pt',	'Categoria 2',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(17,	'pages',	'title',	1,	'pt',	'Olá Mundo',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(18,	'pages',	'slug',	1,	'pt',	'ola-mundo',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(19,	'pages',	'body',	1,	'pt',	'<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(20,	'menu_items',	'title',	1,	'pt',	'Painel de Controle',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(21,	'menu_items',	'title',	2,	'pt',	'Media',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(22,	'menu_items',	'title',	3,	'pt',	'Publicações',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(23,	'menu_items',	'title',	4,	'pt',	'Utilizadores',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(24,	'menu_items',	'title',	5,	'pt',	'Categorias',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(25,	'menu_items',	'title',	6,	'pt',	'Páginas',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(26,	'menu_items',	'title',	7,	'pt',	'Funções',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(27,	'menu_items',	'title',	8,	'pt',	'Ferramentas',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(28,	'menu_items',	'title',	9,	'pt',	'Menus',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(29,	'menu_items',	'title',	10,	'pt',	'Base de dados',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(30,	'menu_items',	'title',	12,	'pt',	'Configurações',	'2022-09-11 06:22:36',	'2022-09-11 06:22:36'),
(31,	'data_rows',	'display_name',	55,	'en',	'Id',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(32,	'data_rows',	'display_name',	56,	'en',	'name',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(33,	'data_rows',	'display_name',	57,	'en',	'slug',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(34,	'data_rows',	'display_name',	58,	'en',	'Details',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(35,	'data_rows',	'display_name',	59,	'en',	'price',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(36,	'data_rows',	'display_name',	60,	'en',	'Description',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(37,	'data_rows',	'display_name',	61,	'en',	'Featured',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(38,	'data_rows',	'display_name',	66,	'en',	'Quantity',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(39,	'data_rows',	'display_name',	62,	'en',	'Image',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(40,	'data_rows',	'display_name',	63,	'en',	'Images',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(41,	'data_rows',	'display_name',	64,	'en',	'Created At',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(42,	'data_rows',	'display_name',	65,	'en',	'Updated At',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(43,	'data_types',	'display_name_singular',	7,	'en',	'Product',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(44,	'data_types',	'display_name_plural',	7,	'en',	'Products',	'2022-09-11 09:04:33',	'2022-09-11 09:04:33'),
(45,	'data_rows',	'display_name',	67,	'en',	'Id',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(46,	'data_rows',	'display_name',	68,	'en',	'code',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(47,	'data_rows',	'display_name',	69,	'en',	'Type',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(48,	'data_rows',	'display_name',	70,	'en',	'Value',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(49,	'data_rows',	'display_name',	71,	'en',	'Percent Off',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(50,	'data_rows',	'display_name',	72,	'en',	'Created At',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(51,	'data_rows',	'display_name',	73,	'en',	'Updated At',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(52,	'data_types',	'display_name_singular',	8,	'en',	'Coupon',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(53,	'data_types',	'display_name_plural',	8,	'en',	'Coupons',	'2022-09-11 09:46:28',	'2022-09-11 09:46:28'),
(54,	'data_rows',	'display_name',	107,	'en',	'Number Of Use',	'2022-09-11 09:49:29',	'2022-09-11 09:49:29'),
(55,	'data_rows',	'display_name',	1,	'en',	'ID',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(56,	'data_rows',	'display_name',	2,	'en',	'Author',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(57,	'data_rows',	'display_name',	3,	'en',	'Category',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(58,	'data_rows',	'display_name',	4,	'en',	'Title',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(59,	'data_rows',	'display_name',	51,	'en',	'seo_title',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(60,	'data_rows',	'display_name',	5,	'en',	'excerpt',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(61,	'data_rows',	'display_name',	6,	'en',	'Body',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(62,	'data_rows',	'display_name',	7,	'en',	'Post Image',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(63,	'data_rows',	'display_name',	8,	'en',	'slug',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(64,	'data_rows',	'display_name',	9,	'en',	'meta_description',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(65,	'data_rows',	'display_name',	10,	'en',	'meta_keywords',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(66,	'data_rows',	'display_name',	11,	'en',	'status',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(67,	'data_rows',	'display_name',	52,	'en',	'featured',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(68,	'data_rows',	'display_name',	12,	'en',	'created_at',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(69,	'data_rows',	'display_name',	13,	'en',	'updated_at',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(70,	'data_types',	'display_name_singular',	1,	'en',	'Post',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(71,	'data_types',	'display_name_plural',	1,	'en',	'Posts',	'2022-09-11 09:55:50',	'2022-09-11 09:55:50'),
(72,	'menu_items',	'title',	29,	'en',	'Faqs',	'2022-09-11 10:16:35',	'2022-09-11 10:16:35'),
(73,	'data_rows',	'display_name',	144,	'en',	'Id',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(74,	'data_rows',	'display_name',	145,	'en',	'Name',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(75,	'data_rows',	'display_name',	146,	'en',	'Description',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(76,	'data_rows',	'display_name',	147,	'en',	'Position',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(77,	'data_rows',	'display_name',	148,	'en',	'Status',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(78,	'data_rows',	'display_name',	149,	'en',	'Created At',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(79,	'data_rows',	'display_name',	150,	'en',	'Updated At',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(80,	'data_rows',	'display_name',	151,	'en',	'Deleted At',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(81,	'data_rows',	'display_name',	153,	'en',	'banners',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(82,	'data_types',	'display_name_singular',	20,	'en',	'Slider',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(83,	'data_types',	'display_name_plural',	20,	'en',	'Sliders',	'2022-09-11 10:38:06',	'2022-09-11 10:38:06'),
(84,	'data_rows',	'display_name',	135,	'en',	'Id',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(85,	'data_rows',	'display_name',	136,	'en',	'Name',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(86,	'data_rows',	'display_name',	137,	'en',	'Url',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(87,	'data_rows',	'display_name',	138,	'en',	'Description',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(88,	'data_rows',	'display_name',	139,	'en',	'Image',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(89,	'data_rows',	'display_name',	140,	'en',	'Status',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(90,	'data_rows',	'display_name',	141,	'en',	'Created At',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(91,	'data_rows',	'display_name',	142,	'en',	'Updated At',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(92,	'data_rows',	'display_name',	143,	'en',	'Deleted At',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(93,	'data_rows',	'display_name',	152,	'en',	'sliders',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(94,	'data_types',	'display_name_singular',	19,	'en',	'Banner',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(95,	'data_types',	'display_name_plural',	19,	'en',	'Banners',	'2022-09-11 10:39:09',	'2022-09-11 10:39:09'),
(96,	'menu_items',	'title',	30,	'en',	'Banners',	'2022-09-11 10:39:24',	'2022-09-11 10:39:24'),
(97,	'menu_items',	'title',	31,	'en',	'Sliders',	'2022-09-11 10:39:33',	'2022-09-11 10:39:33'),
(98,	'categories',	'name',	1,	'en',	'Category 1',	'2022-09-11 10:54:18',	'2022-09-11 10:54:18'),
(99,	'categories',	'slug',	1,	'en',	'category-1',	'2022-09-11 10:54:18',	'2022-09-11 10:54:18'),
(100,	'categories',	'name',	2,	'en',	'Category 2',	'2022-09-11 10:54:39',	'2022-09-11 10:54:39'),
(101,	'categories',	'slug',	2,	'en',	'category-2',	'2022-09-11 10:54:39',	'2022-09-11 10:54:39'),
(102,	'posts',	'title',	5,	'en',	'Stir-Fry Chicken and Broccoli with Garlic Sauce',	'2022-09-11 10:57:32',	'2022-09-11 10:57:32');

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(3,	2);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_notify` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `newsletters` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `phone`, `address`, `email_notify`, `newsletters`) VALUES
(1,	1,	'Admin',	'admin@admin.com',	'users/default.png',	'$2y$10$7DsCsD3mYpMQXdiLwdMBDOQePt54XgBmvIAyqd5NHz6P/OJmkGbVa',	'b6GtDGrsY4mvY3eDKEyAx6uxVPtLSMqV1JgsuVVnpesJfeufsctg4QdbLdQI',	NULL,	'2022-09-11 06:22:36',	'2022-09-11 06:22:36',	NULL,	NULL,	'Y',	'Y'),
(2,	3,	'Admin Web',	'adminweb@adminweb.com',	'users/default.png',	'$2y$10$7DsCsD3mYpMQXdiLwdMBDOQePt54XgBmvIAyqd5NHz6P/OJmkGbVa',	'bra7fydXyKsxxPOlSY18bB5yHGETrloClSP2kqdlhGJPk7tdn97h08BqoEo7',	'{\"locale\":\"vi\"}',	'2022-09-11 06:22:36',	'2022-09-12 02:24:01',	NULL,	NULL,	'Y',	'Y'),
(3,	3,	'Khánh Linh',	'ntkhanhlinh97@gmail.com',	'users/default.png',	'$2y$10$LwcbKPKbJiUCUzKYVmLyf.Y1BxL9GCn47DWuiXj.zqEMQ/pQaAQy2',	NULL,	'{\"locale\":\"vi\"}',	'2022-09-12 02:44:30',	'2022-09-12 02:49:00',	NULL,	NULL,	'Y',	'Y'),
(4,	2,	'Nguyễn Hùng',	'nguyenhung08021993@gmail.com',	'users/default.png',	'Nguyễn Hùng',	NULL,	NULL,	'2022-09-14 04:22:40',	'2022-09-14 04:22:40',	NULL,	NULL,	'Y',	'Y');

-- 2022-09-16 09:10:45
