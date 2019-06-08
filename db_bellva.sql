-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2019 at 09:21 AM
-- Server version: 5.7.23
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bellva`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double NOT NULL DEFAULT '0',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `company_id`, `name`, `number`, `currency_code`, `opening_balance`, `bank_name`, `bank_phone`, `bank_address`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Kas', '1', 'IDR', 0, 'Kas', NULL, NULL, 1, '2019-05-16 22:43:10', '2019-05-16 22:43:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billed_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `vendor_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_histories`
--

CREATE TABLE `bill_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL DEFAULT '0',
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_item_taxes`
--

CREATE TABLE `bill_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `bill_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_statuses`
--

CREATE TABLE `bill_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_statuses`
--

INSERT INTO `bill_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Konsep', 'draft', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(2, 1, 'Diterima', 'received', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(3, 1, 'Sebagian', 'partial', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(4, 1, 'Dibayar', 'paid', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill_totals`
--

CREATE TABLE `bill_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `company_id`, `name`, `type`, `color`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Mentransfer ', 'other', '#605ca8', 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(2, 1, 'Deposit', 'income', '#f39c12', 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(3, 1, 'Penjualan', 'income', '#6da252', 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(4, 1, 'Lain ', 'expense', '#d2d6de', 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(5, 1, 'Umum', 'item', '#00c0ef', 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(6, 1, 'Anker', 'item', '#fc5f5f', 1, '2019-05-16 23:40:15', '2019-05-16 23:40:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `domain`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '', 1, '2019-05-16 22:43:10', '2019-05-16 22:43:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int(11) NOT NULL DEFAULT '1',
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `name`, `code`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `precision`, `symbol`, `symbol_first`, `decimal_mark`, `thousands_separator`) VALUES
(1, 1, 'Dolar Amerika', 'USD', 1.00000000, 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL, '2', '$', 1, '.', ','),
(2, 1, 'Euro', 'EUR', 1.25000000, 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL, '2', '€', 1, ',', '.'),
(3, 1, 'Pound Inggris', 'GBP', 1.60000000, 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL, '2', '£', 1, '.', ','),
(4, 1, 'Lira Turki', 'TRY', 0.80000000, 1, '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL, '2', '₺', 1, ',', '.'),
(5, 1, 'Indonesian Dollar Rupiah', 'IDR', 1.00000000, 1, '2019-05-16 22:49:07', '2019-05-16 23:49:43', NULL, '2', 'Rp', 1, ',', '.');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `company_id`, `user_id`, `name`, `email`, `tax_number`, `phone`, `address`, `website`, `currency_code`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `reference`) VALUES
(1, 1, NULL, 'Jono', 'jono@gmail.com', NULL, NULL, 'Purwokerto', NULL, 'IDR', 1, '2019-05-16 23:41:32', '2019-05-16 23:41:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoiced_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `parent_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `company_id`, `invoice_number`, `order_number`, `invoice_status_code`, `invoiced_at`, `due_at`, `amount`, `currency_code`, `currency_rate`, `customer_id`, `customer_name`, `customer_email`, `customer_tax_number`, `customer_phone`, `customer_address`, `notes`, `created_at`, `updated_at`, `deleted_at`, `category_id`, `parent_id`) VALUES
(1, 1, 'INV-00001', '1', 'paid', '2019-05-17 06:43:20', '2019-05-17 06:43:20', 355500, 'IDR', 1.00000000, 1, 'Jono', 'jono@gmail.com', NULL, NULL, 'Purwokerto', NULL, '2019-05-16 23:43:20', '2019-05-16 23:46:51', NULL, 3, 0),
(2, 1, 'INV-00002', NULL, 'paid', '2019-05-27 07:29:17', '2019-05-27 07:29:17', 395000, 'IDR', 1.00000000, 1, 'Jono', 'jono@gmail.com', NULL, NULL, 'Purwokerto', NULL, '2019-05-27 00:29:17', '2019-05-27 00:29:31', NULL, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_histories`
--

CREATE TABLE `invoice_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `status_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_histories`
--

INSERT INTO `invoice_histories` (`id`, `company_id`, `invoice_id`, `status_code`, `notify`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'draft', 0, 'INV-00001 ditambahkan!', '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(2, 1, 1, 'sent', 0, 'Tandai Dikirim', '2019-05-16 23:44:22', '2019-05-16 23:44:22', NULL),
(3, 1, 1, 'paid', 0, 'Rp355.500,00 Pembayaran ', '2019-05-16 23:46:51', '2019-05-16 23:46:51', NULL),
(4, 1, 2, 'draft', 0, 'INV-00002 ditambahkan!', '2019-05-27 00:29:18', '2019-05-27 00:29:18', NULL),
(5, 1, 2, 'paid', 0, 'Rp395.000,00 Pembayaran ', '2019-05-27 00:29:31', '2019-05-27 00:29:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL DEFAULT '0',
  `tax_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `company_id`, `invoice_id`, `item_id`, `name`, `sku`, `quantity`, `price`, `total`, `tax`, `tax_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 'Anker Beer Bremer 620 ml', 'AB1P', 1.00, 395000, 395000, 0, 0, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(2, 1, 2, 1, 'Anker Beer Bremer 620 ml', 'AB1P', 1.00, 395000, 395000, 0, 0, '2019-05-27 00:29:17', '2019-05-27 00:29:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_item_taxes`
--

CREATE TABLE `invoice_item_taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `invoice_item_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_item_taxes`
--

INSERT INTO `invoice_item_taxes` (`id`, `company_id`, `invoice_id`, `invoice_item_id`, `tax_id`, `name`, `amount`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, 'Bebas pajak', 0, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(2, 1, 2, 2, 1, 'Bebas pajak', 0, '2019-05-27 00:29:17', '2019-05-27 00:29:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `company_id`, `invoice_id`, `account_id`, `paid_at`, `amount`, `currency_code`, `currency_rate`, `description`, `payment_method`, `reference`, `created_at`, `updated_at`, `deleted_at`, `reconciled`) VALUES
(1, 1, 1, 1, '2019-05-17 06:46:51', 355500, 'IDR', 1.00000000, NULL, 'offlinepayment.cash.1', NULL, '2019-05-16 23:46:51', '2019-05-16 23:46:51', NULL, 0),
(2, 1, 2, 1, '2019-05-27 00:00:00', 395000, 'IDR', 1.00000000, NULL, 'offlinepayment.cash.1', NULL, '2019-05-27 00:29:31', '2019-05-27 00:29:31', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_statuses`
--

CREATE TABLE `invoice_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_statuses`
--

INSERT INTO `invoice_statuses` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Konsep', 'draft', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(2, 1, 'Mengirim', 'sent', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(3, 1, 'Lihat', 'viewed', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(4, 1, 'Disetujui', 'approved', '2019-05-16 22:43:11', '2019-05-16 22:43:11', NULL),
(5, 1, 'Sebagian', 'partial', '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL),
(6, 1, 'Dibayar', 'paid', '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_totals`
--

CREATE TABLE `invoice_totals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_totals`
--

INSERT INTO `invoice_totals` (`id`, `company_id`, `invoice_id`, `code`, `name`, `amount`, `sort_order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'sub_total', 'invoices.sub_total', 395000, 1, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(2, 1, 1, 'discount', 'invoices.discount', 39500, 2, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(3, 1, 1, 'tax', 'Bebas pajak', 0, 3, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(4, 1, 1, 'total', 'invoices.total', 355500, 4, '2019-05-16 23:43:20', '2019-05-16 23:43:20', NULL),
(5, 1, 2, 'sub_total', 'invoices.sub_total', 395000, 1, '2019-05-27 00:29:18', '2019-05-27 00:29:18', NULL),
(6, 1, 2, 'tax', 'Bebas pajak', 0, 2, '2019-05-27 00:29:18', '2019-05-27 00:29:18', NULL),
(7, 1, 2, 'total', 'invoices.total', 395000, 3, '2019-05-27 00:29:18', '2019-05-27 00:29:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sale_price` double NOT NULL,
  `purchase_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `company_id`, `name`, `sku`, `description`, `sale_price`, `purchase_price`, `quantity`, `category_id`, `tax_id`, `enabled`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Anker Beer Bremer 620 ml', 'AB1P', NULL, 395000, 390000, 18, 6, NULL, 1, '2019-05-16 23:40:27', '2019-05-27 00:29:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(121) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(28) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `disk`, `directory`, `filename`, `extension`, `mime_type`, `aggregate_type`, `size`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'uploads', '1/settings', 'logo (3)', 'png', 'image/png', 'image', 6510, '2019-05-16 22:47:51', '2019-05-16 22:47:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mediables`
--

CREATE TABLE `mediables` (
  `media_id` int(10) UNSIGNED NOT NULL,
  `mediable_type` varchar(152) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int(10) UNSIGNED NOT NULL,
  `tag` varchar(68) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mediables`
--

INSERT INTO `mediables` (`media_id`, `mediable_type`, `mediable_id`, `tag`, `order`) VALUES
(1, 'App\\Models\\Common\\Company', 1, 'company_logo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2017_09_01_000000_create_accounts_table', 1),
(2, '2017_09_01_000000_create_bills_table', 1),
(3, '2017_09_01_000000_create_categories_table', 1),
(4, '2017_09_01_000000_create_companies_table', 1),
(5, '2017_09_01_000000_create_currencies_table', 1),
(6, '2017_09_01_000000_create_customers_table', 1),
(7, '2017_09_01_000000_create_invoices_table', 1),
(8, '2017_09_01_000000_create_items_table', 1),
(9, '2017_09_01_000000_create_jobs_table', 1),
(10, '2017_09_01_000000_create_modules_table', 1),
(11, '2017_09_01_000000_create_notifications_table', 1),
(12, '2017_09_01_000000_create_password_resets_table', 1),
(13, '2017_09_01_000000_create_payments_table', 1),
(14, '2017_09_01_000000_create_revenues_table', 1),
(15, '2017_09_01_000000_create_roles_table', 1),
(16, '2017_09_01_000000_create_sessions_table', 1),
(17, '2017_09_01_000000_create_settings_table', 1),
(18, '2017_09_01_000000_create_taxes_table', 1),
(19, '2017_09_01_000000_create_transfers_table', 1),
(20, '2017_09_01_000000_create_users_table', 1),
(21, '2017_09_01_000000_create_vendors_table', 1),
(22, '2017_09_19_delete_offline_file', 1),
(23, '2017_10_11_000000_create_bill_totals_table', 1),
(24, '2017_10_11_000000_create_invoice_totals_table', 1),
(25, '2017_11_16_000000_create_failed_jobs_table', 1),
(26, '2017_12_09_000000_add_currency_columns', 1),
(27, '2017_12_30_000000_create_mediable_tables', 1),
(28, '2018_01_03_000000_drop_attachment_column_bill_payments_table', 1),
(29, '2018_01_03_000000_drop_attachment_column_bills_table', 1),
(30, '2018_01_03_000000_drop_attachment_column_invoice_payments_table', 1),
(31, '2018_01_03_000000_drop_attachment_column_invoices_table', 1),
(32, '2018_01_03_000000_drop_attachment_column_payments_table', 1),
(33, '2018_01_03_000000_drop_attachment_column_revenues_table', 1),
(34, '2018_01_03_000000_drop_picture_column_items_table', 1),
(35, '2018_01_03_000000_drop_picture_column_users_table', 1),
(36, '2018_04_23_000000_add_category_column_invoices_bills', 1),
(37, '2018_04_26_000000_create_recurring_table', 1),
(38, '2018_04_30_000000_add_parent_column', 1),
(39, '2018_06_23_000000_modify_email_column', 1),
(40, '2018_06_30_000000_modify_enabled_column', 1),
(41, '2018_07_07_000000_modify_date_column', 1),
(42, '2018_09_26_000000_add_reference_column_customers', 1),
(43, '2018_09_26_000000_add_reference_column_vendors', 1),
(44, '2018_10_22_000000_create_bill_item_taxes_table', 1),
(45, '2018_10_22_000000_create_invoice_item_taxes_table', 1),
(46, '2018_10_27_000000_add_reconciled_column', 1),
(47, '2018_10_27_000000_create_reconciliations_table', 1),
(48, '2018_11_05_000000_add_tax_columns', 1),
(49, '2020_01_01_000000_add_locale_column', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `company_id`, `alias`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'offlinepayment', 1, '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL),
(2, 1, 'paypalstandard', 1, '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_histories`
--

CREATE TABLE `module_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `module_histories`
--

INSERT INTO `module_histories` (`id`, `company_id`, `module_id`, `category`, `version`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'payment-gateways', '1.0.0', 'OfflinePayment terpasang', '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL),
(2, 1, 2, 'payment-gateways', '1.0.0', 'PaypalStandard terpasang', '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `reconciled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'read-admin-panel', 'Read Admin Panel', 'Read Admin Panel', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(2, 'read-api', 'Read Api', 'Read Api', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(3, 'create-auth-users', 'Create Auth Users', 'Create Auth Users', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(4, 'read-auth-users', 'Read Auth Users', 'Read Auth Users', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(5, 'update-auth-users', 'Update Auth Users', 'Update Auth Users', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(6, 'delete-auth-users', 'Delete Auth Users', 'Delete Auth Users', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(7, 'create-auth-roles', 'Create Auth Roles', 'Create Auth Roles', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(8, 'read-auth-roles', 'Read Auth Roles', 'Read Auth Roles', '2019-05-16 22:37:14', '2019-05-16 22:37:14'),
(9, 'update-auth-roles', 'Update Auth Roles', 'Update Auth Roles', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(10, 'delete-auth-roles', 'Delete Auth Roles', 'Delete Auth Roles', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(11, 'create-auth-permissions', 'Create Auth Permissions', 'Create Auth Permissions', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(12, 'read-auth-permissions', 'Read Auth Permissions', 'Read Auth Permissions', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(13, 'update-auth-permissions', 'Update Auth Permissions', 'Update Auth Permissions', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(14, 'delete-auth-permissions', 'Delete Auth Permissions', 'Delete Auth Permissions', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(15, 'read-auth-profile', 'Read Auth Profile', 'Read Auth Profile', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(16, 'update-auth-profile', 'Update Auth Profile', 'Update Auth Profile', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(17, 'create-common-companies', 'Create Common Companies', 'Create Common Companies', '2019-05-16 22:37:15', '2019-05-16 22:37:15'),
(18, 'read-common-companies', 'Read Common Companies', 'Read Common Companies', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(19, 'update-common-companies', 'Update Common Companies', 'Update Common Companies', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(20, 'delete-common-companies', 'Delete Common Companies', 'Delete Common Companies', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(21, 'create-common-import', 'Create Common Import', 'Create Common Import', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(22, 'create-common-items', 'Create Common Items', 'Create Common Items', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(23, 'read-common-items', 'Read Common Items', 'Read Common Items', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(24, 'update-common-items', 'Update Common Items', 'Update Common Items', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(25, 'delete-common-items', 'Delete Common Items', 'Delete Common Items', '2019-05-16 22:37:16', '2019-05-16 22:37:16'),
(26, 'delete-common-uploads', 'Delete Common Uploads', 'Delete Common Uploads', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(27, 'create-common-notifications', 'Create Common Notifications', 'Create Common Notifications', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(28, 'read-common-notifications', 'Read Common Notifications', 'Read Common Notifications', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(29, 'update-common-notifications', 'Update Common Notifications', 'Update Common Notifications', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(30, 'delete-common-notifications', 'Delete Common Notifications', 'Delete Common Notifications', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(31, 'create-incomes-invoices', 'Create Incomes Invoices', 'Create Incomes Invoices', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(32, 'read-incomes-invoices', 'Read Incomes Invoices', 'Read Incomes Invoices', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(33, 'update-incomes-invoices', 'Update Incomes Invoices', 'Update Incomes Invoices', '2019-05-16 22:37:17', '2019-05-16 22:37:17'),
(34, 'delete-incomes-invoices', 'Delete Incomes Invoices', 'Delete Incomes Invoices', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(35, 'create-incomes-revenues', 'Create Incomes Revenues', 'Create Incomes Revenues', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(36, 'read-incomes-revenues', 'Read Incomes Revenues', 'Read Incomes Revenues', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(37, 'update-incomes-revenues', 'Update Incomes Revenues', 'Update Incomes Revenues', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(38, 'delete-incomes-revenues', 'Delete Incomes Revenues', 'Delete Incomes Revenues', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(39, 'create-incomes-customers', 'Create Incomes Customers', 'Create Incomes Customers', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(40, 'read-incomes-customers', 'Read Incomes Customers', 'Read Incomes Customers', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(41, 'update-incomes-customers', 'Update Incomes Customers', 'Update Incomes Customers', '2019-05-16 22:37:18', '2019-05-16 22:37:18'),
(42, 'delete-incomes-customers', 'Delete Incomes Customers', 'Delete Incomes Customers', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(43, 'create-expenses-bills', 'Create Expenses Bills', 'Create Expenses Bills', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(44, 'read-expenses-bills', 'Read Expenses Bills', 'Read Expenses Bills', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(45, 'update-expenses-bills', 'Update Expenses Bills', 'Update Expenses Bills', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(46, 'delete-expenses-bills', 'Delete Expenses Bills', 'Delete Expenses Bills', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(47, 'create-expenses-payments', 'Create Expenses Payments', 'Create Expenses Payments', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(48, 'read-expenses-payments', 'Read Expenses Payments', 'Read Expenses Payments', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(49, 'update-expenses-payments', 'Update Expenses Payments', 'Update Expenses Payments', '2019-05-16 22:37:19', '2019-05-16 22:37:19'),
(50, 'delete-expenses-payments', 'Delete Expenses Payments', 'Delete Expenses Payments', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(51, 'create-expenses-vendors', 'Create Expenses Vendors', 'Create Expenses Vendors', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(52, 'read-expenses-vendors', 'Read Expenses Vendors', 'Read Expenses Vendors', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(53, 'update-expenses-vendors', 'Update Expenses Vendors', 'Update Expenses Vendors', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(54, 'delete-expenses-vendors', 'Delete Expenses Vendors', 'Delete Expenses Vendors', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(55, 'create-banking-accounts', 'Create Banking Accounts', 'Create Banking Accounts', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(56, 'read-banking-accounts', 'Read Banking Accounts', 'Read Banking Accounts', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(57, 'update-banking-accounts', 'Update Banking Accounts', 'Update Banking Accounts', '2019-05-16 22:37:20', '2019-05-16 22:37:20'),
(58, 'delete-banking-accounts', 'Delete Banking Accounts', 'Delete Banking Accounts', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(59, 'create-banking-transfers', 'Create Banking Transfers', 'Create Banking Transfers', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(60, 'read-banking-transfers', 'Read Banking Transfers', 'Read Banking Transfers', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(61, 'update-banking-transfers', 'Update Banking Transfers', 'Update Banking Transfers', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(62, 'delete-banking-transfers', 'Delete Banking Transfers', 'Delete Banking Transfers', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(63, 'read-banking-transactions', 'Read Banking Transactions', 'Read Banking Transactions', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(64, 'create-banking-reconciliations', 'Create Banking Reconciliations', 'Create Banking Reconciliations', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(65, 'read-banking-reconciliations', 'Read Banking Reconciliations', 'Read Banking Reconciliations', '2019-05-16 22:37:21', '2019-05-16 22:37:21'),
(66, 'update-banking-reconciliations', 'Update Banking Reconciliations', 'Update Banking Reconciliations', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(67, 'delete-banking-reconciliations', 'Delete Banking Reconciliations', 'Delete Banking Reconciliations', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(68, 'create-settings-categories', 'Create Settings Categories', 'Create Settings Categories', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(69, 'read-settings-categories', 'Read Settings Categories', 'Read Settings Categories', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(70, 'update-settings-categories', 'Update Settings Categories', 'Update Settings Categories', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(71, 'delete-settings-categories', 'Delete Settings Categories', 'Delete Settings Categories', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(72, 'read-settings-settings', 'Read Settings Settings', 'Read Settings Settings', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(73, 'update-settings-settings', 'Update Settings Settings', 'Update Settings Settings', '2019-05-16 22:37:22', '2019-05-16 22:37:22'),
(74, 'create-settings-taxes', 'Create Settings Taxes', 'Create Settings Taxes', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(75, 'read-settings-taxes', 'Read Settings Taxes', 'Read Settings Taxes', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(76, 'update-settings-taxes', 'Update Settings Taxes', 'Update Settings Taxes', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(77, 'delete-settings-taxes', 'Delete Settings Taxes', 'Delete Settings Taxes', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(78, 'create-settings-currencies', 'Create Settings Currencies', 'Create Settings Currencies', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(79, 'read-settings-currencies', 'Read Settings Currencies', 'Read Settings Currencies', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(80, 'update-settings-currencies', 'Update Settings Currencies', 'Update Settings Currencies', '2019-05-16 22:37:23', '2019-05-16 22:37:23'),
(81, 'delete-settings-currencies', 'Delete Settings Currencies', 'Delete Settings Currencies', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(82, 'read-settings-modules', 'Read Settings Modules', 'Read Settings Modules', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(83, 'update-settings-modules', 'Update Settings Modules', 'Update Settings Modules', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(84, 'read-modules-home', 'Read Modules Home', 'Read Modules Home', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(85, 'read-modules-tiles', 'Read Modules Tiles', 'Read Modules Tiles', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(86, 'create-modules-item', 'Create Modules Item', 'Create Modules Item', '2019-05-16 22:37:24', '2019-05-16 22:37:24'),
(87, 'read-modules-item', 'Read Modules Item', 'Read Modules Item', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(88, 'update-modules-item', 'Update Modules Item', 'Update Modules Item', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(89, 'delete-modules-item', 'Delete Modules Item', 'Delete Modules Item', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(90, 'create-modules-token', 'Create Modules Token', 'Create Modules Token', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(91, 'update-modules-token', 'Update Modules Token', 'Update Modules Token', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(92, 'read-modules-my', 'Read Modules My', 'Read Modules My', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(93, 'read-install-updates', 'Read Install Updates', 'Read Install Updates', '2019-05-16 22:37:25', '2019-05-16 22:37:25'),
(94, 'update-install-updates', 'Update Install Updates', 'Update Install Updates', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(95, 'read-notifications', 'Read Notifications', 'Read Notifications', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(96, 'update-notifications', 'Update Notifications', 'Update Notifications', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(97, 'read-reports-income-summary', 'Read Reports Income Summary', 'Read Reports Income Summary', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(98, 'read-reports-expense-summary', 'Read Reports Expense Summary', 'Read Reports Expense Summary', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(99, 'read-reports-income-expense-summary', 'Read Reports Income Expense Summary', 'Read Reports Income Expense Summary', '2019-05-16 22:37:26', '2019-05-16 22:37:26'),
(100, 'read-reports-profit-loss', 'Read Reports Profit Loss', 'Read Reports Profit Loss', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(101, 'read-reports-tax-summary', 'Read Reports Tax Summary', 'Read Reports Tax Summary', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(102, 'create-wizard-companies', 'Create Wizard Companies', 'Create Wizard Companies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(103, 'read-wizard-companies', 'Read Wizard Companies', 'Read Wizard Companies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(104, 'update-wizard-companies', 'Update Wizard Companies', 'Update Wizard Companies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(105, 'create-wizard-currencies', 'Create Wizard Currencies', 'Create Wizard Currencies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(106, 'read-wizard-currencies', 'Read Wizard Currencies', 'Read Wizard Currencies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(107, 'update-wizard-currencies', 'Update Wizard Currencies', 'Update Wizard Currencies', '2019-05-16 22:37:27', '2019-05-16 22:37:27'),
(108, 'create-wizard-taxes', 'Create Wizard Taxes', 'Create Wizard Taxes', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(109, 'read-wizard-taxes', 'Read Wizard Taxes', 'Read Wizard Taxes', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(110, 'update-wizard-taxes', 'Update Wizard Taxes', 'Update Wizard Taxes', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(111, 'create-wizard-finish', 'Create Wizard Finish', 'Create Wizard Finish', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(112, 'read-wizard-finish', 'Read Wizard Finish', 'Read Wizard Finish', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(113, 'update-wizard-finish', 'Update Wizard Finish', 'Update Wizard Finish', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(114, 'read-customer-panel', 'Read Customer Panel', 'Read Customer Panel', '2019-05-16 22:37:36', '2019-05-16 22:37:36'),
(115, 'read-customers-invoices', 'Read Customers Invoices', 'Read Customers Invoices', '2019-05-16 22:37:36', '2019-05-16 22:37:36'),
(116, 'update-customers-invoices', 'Update Customers Invoices', 'Update Customers Invoices', '2019-05-16 22:37:36', '2019-05-16 22:37:36'),
(117, 'read-customers-payments', 'Read Customers Payments', 'Read Customers Payments', '2019-05-16 22:37:36', '2019-05-16 22:37:36'),
(118, 'update-customers-payments', 'Update Customers Payments', 'Update Customers Payments', '2019-05-16 22:37:36', '2019-05-16 22:37:36'),
(119, 'read-customers-transactions', 'Read Customers Transactions', 'Read Customers Transactions', '2019-05-16 22:37:37', '2019-05-16 22:37:37'),
(120, 'read-customers-profile', 'Read Customers Profile', 'Read Customers Profile', '2019-05-16 22:37:37', '2019-05-16 22:37:37'),
(121, 'update-customers-profile', 'Update Customers Profile', 'Update Customers Profile', '2019-05-16 22:37:37', '2019-05-16 22:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `reconciliations`
--

CREATE TABLE `reconciliations` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double NOT NULL DEFAULT '0',
  `reconciled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurring`
--

CREATE TABLE `recurring` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `recurable_id` int(10) UNSIGNED NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int(11) NOT NULL DEFAULT '1',
  `started_at` datetime NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `category_id` int(11) NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `reconciled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Admin', 'Admin', '2019-05-16 22:37:13', '2019-05-16 22:37:13'),
(2, 'manager', 'Manager', 'Manager', '2019-05-16 22:37:28', '2019-05-16 22:37:28'),
(3, 'customer', 'Customer', 'Customer', '2019-05-16 22:37:36', '2019-05-16 22:37:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`role_id`, `permission_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(2, 15),
(1, 16),
(2, 16),
(1, 17),
(2, 17),
(1, 18),
(2, 18),
(1, 19),
(2, 19),
(1, 20),
(2, 20),
(1, 21),
(2, 21),
(1, 22),
(2, 22),
(1, 23),
(2, 23),
(1, 24),
(2, 24),
(1, 25),
(2, 25),
(1, 26),
(1, 27),
(2, 27),
(1, 28),
(2, 28),
(1, 29),
(2, 29),
(1, 30),
(2, 30),
(1, 31),
(2, 31),
(1, 32),
(2, 32),
(1, 33),
(2, 33),
(1, 34),
(2, 34),
(1, 35),
(2, 35),
(1, 36),
(2, 36),
(1, 37),
(2, 37),
(1, 38),
(2, 38),
(1, 39),
(2, 39),
(1, 40),
(2, 40),
(1, 41),
(2, 41),
(1, 42),
(2, 42),
(1, 43),
(2, 43),
(1, 44),
(2, 44),
(1, 45),
(2, 45),
(1, 46),
(2, 46),
(1, 47),
(2, 47),
(1, 48),
(2, 48),
(1, 49),
(2, 49),
(1, 50),
(2, 50),
(1, 51),
(2, 51),
(1, 52),
(2, 52),
(1, 53),
(2, 53),
(1, 54),
(2, 54),
(1, 55),
(2, 55),
(1, 56),
(2, 56),
(1, 57),
(2, 57),
(1, 58),
(2, 58),
(1, 59),
(2, 59),
(1, 60),
(2, 60),
(1, 61),
(2, 61),
(1, 62),
(2, 62),
(1, 63),
(2, 63),
(1, 64),
(2, 64),
(1, 65),
(2, 65),
(1, 66),
(2, 66),
(1, 67),
(2, 67),
(1, 68),
(2, 68),
(1, 69),
(2, 69),
(1, 70),
(2, 70),
(1, 71),
(2, 71),
(1, 72),
(2, 72),
(1, 73),
(2, 73),
(1, 74),
(2, 74),
(1, 75),
(2, 75),
(1, 76),
(2, 76),
(1, 77),
(2, 77),
(1, 78),
(2, 78),
(1, 79),
(2, 79),
(1, 80),
(2, 80),
(1, 81),
(2, 81),
(1, 82),
(2, 82),
(1, 83),
(2, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(2, 93),
(1, 94),
(2, 94),
(1, 95),
(2, 95),
(1, 96),
(2, 96),
(1, 97),
(2, 97),
(1, 98),
(2, 98),
(1, 99),
(2, 99),
(1, 100),
(2, 100),
(1, 101),
(2, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(3, 114),
(3, 115),
(3, 116),
(3, 117),
(3, 118),
(3, 119),
(3, 120),
(3, 121);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_id`, `key`, `value`) VALUES
(1, 1, 'general.default_account', '1'),
(2, 1, 'general.date_format', 'd M Y'),
(3, 1, 'general.date_separator', 'space'),
(4, 1, 'general.timezone', 'Asia/Jakarta'),
(5, 1, 'general.percent_position', 'after'),
(6, 1, 'general.invoice_number_prefix', 'INV-'),
(7, 1, 'general.invoice_number_digit', '5'),
(8, 1, 'general.invoice_number_next', '3'),
(9, 1, 'general.default_payment_method', 'offlinepayment.cash.1'),
(10, 1, 'general.email_protocol', 'mail'),
(11, 1, 'general.email_sendmail_path', '/usr/sbin/sendmail -bs'),
(12, 1, 'general.send_invoice_reminder', '0'),
(13, 1, 'general.schedule_invoice_days', '1,3,5,10'),
(14, 1, 'general.send_bill_reminder', '0'),
(15, 1, 'general.schedule_bill_days', '10,5,3,1'),
(16, 1, 'general.send_item_reminder', '0'),
(17, 1, 'general.schedule_item_stocks', '3,5,7'),
(18, 1, 'general.schedule_time', '09:00'),
(19, 1, 'general.admin_theme', 'skin-green-light'),
(20, 1, 'general.list_limit', '25'),
(21, 1, 'general.use_gravatar', '0'),
(22, 1, 'general.session_handler', 'file'),
(23, 1, 'general.session_lifetime', '30'),
(24, 1, 'general.file_size', '2'),
(25, 1, 'general.file_types', 'pdf,jpeg,jpg,png'),
(26, 1, 'general.wizard', '1'),
(27, 1, 'general.invoice_item', 'settings.invoice.item'),
(28, 1, 'general.invoice_price', 'settings.invoice.price'),
(29, 1, 'general.invoice_quantity', 'settings.invoice.quantity'),
(30, 1, 'general.company_name', 'Bellva'),
(31, 1, 'general.company_email', 'hi@bellva.com'),
(32, 1, 'general.default_currency', 'IDR'),
(33, 1, 'general.default_locale', 'id-ID'),
(34, 1, 'offlinepayment.methods', '[{\"code\":\"offlinepayment.cash.1\",\"name\":\"Cash\",\"order\":\"1\",\"description\":null},{\"code\":\"offlinepayment.bank_transfer.2\",\"name\":\"Bank Transfer\",\"order\":\"2\",\"description\":null}]'),
(35, 1, 'general.api_token', 'c9135386-a89f-4d55-bcd5-6fb718f1d6bc'),
(38, 1, 'general.company_address', 'Purwokerto'),
(39, 1, 'general.company_logo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `company_id`, `name`, `rate`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `type`) VALUES
(1, 1, 'Bebas pajak', 0, 1, '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL, 'normal'),
(2, 1, 'Pajak normal', 5, 1, '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL, 'normal'),
(3, 1, 'Pajak Penjualan', 15, 1, '2019-05-16 22:43:12', '2019-05-16 22:43:12', NULL, 'normal');

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `revenue_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'id-ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `last_logged_in_at`, `enabled`, `created_at`, `updated_at`, `deleted_at`, `locale`) VALUES
(1, '', 'admin@bellva.com', '$2y$10$CLIXMSJorDRMl394c.VmQecNfX45xtns7ootZJQatdmlIW327inla', 'EjuHA7xDFUYWuUr5uYedaNnxgOXn98shyRjwGuKzkJhhB4TCb1YLH4uBPlcz', '2019-05-27 00:28:12', 1, '2019-05-16 22:43:12', '2019-05-27 00:28:12', NULL, 'id-ID');

-- --------------------------------------------------------

--
-- Table structure for table `user_companies`
--

CREATE TABLE `user_companies` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_companies`
--

INSERT INTO `user_companies` (`user_id`, `company_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `user_permissions`
--

CREATE TABLE `user_permissions` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`, `user_type`) VALUES
(1, 1, 'users');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_company_id_index` (`company_id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bills_company_id_bill_number_deleted_at_unique` (`company_id`,`bill_number`,`deleted_at`),
  ADD KEY `bills_company_id_index` (`company_id`);

--
-- Indexes for table `bill_histories`
--
ALTER TABLE `bill_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_histories_company_id_index` (`company_id`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_items_company_id_index` (`company_id`);

--
-- Indexes for table `bill_item_taxes`
--
ALTER TABLE `bill_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_payments_company_id_index` (`company_id`);

--
-- Indexes for table `bill_statuses`
--
ALTER TABLE `bill_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `bill_totals`
--
ALTER TABLE `bill_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_totals_company_id_index` (`company_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id_index` (`company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  ADD KEY `currencies_company_id_index` (`company_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `customers_company_id_index` (`company_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoices_company_id_invoice_number_deleted_at_unique` (`company_id`,`invoice_number`,`deleted_at`),
  ADD KEY `invoices_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_histories`
--
ALTER TABLE `invoice_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_histories_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_item_taxes`
--
ALTER TABLE `invoice_item_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_item_taxes_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_statuses`
--
ALTER TABLE `invoice_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_statuses_company_id_index` (`company_id`);

--
-- Indexes for table `invoice_totals`
--
ALTER TABLE `invoice_totals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_totals_company_id_index` (`company_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_company_id_sku_deleted_at_unique` (`company_id`,`sku`,`deleted_at`),
  ADD KEY `items_company_id_index` (`company_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  ADD KEY `media_disk_directory_index` (`disk`,`directory`),
  ADD KEY `media_aggregate_type_index` (`aggregate_type`);

--
-- Indexes for table `mediables`
--
ALTER TABLE `mediables`
  ADD PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  ADD KEY `mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  ADD KEY `mediables_tag_index` (`tag`),
  ADD KEY `mediables_order_index` (`order`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  ADD KEY `modules_company_id_index` (`company_id`);

--
-- Indexes for table `module_histories`
--
ALTER TABLE `module_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_histories_company_id_module_id_index` (`company_id`,`module_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_company_id_index` (`company_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `reconciliations`
--
ALTER TABLE `reconciliations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reconciliations_company_id_index` (`company_id`);

--
-- Indexes for table `recurring`
--
ALTER TABLE `recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recurring_recurable_id_recurable_type_index` (`recurable_id`,`recurable_type`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revenues_company_id_index` (`company_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`role_id`,`permission_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_company_id_key_unique` (`company_id`,`key`),
  ADD KEY `settings_company_id_index` (`company_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_index` (`company_id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_company_id_index` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_deleted_at_unique` (`email`,`deleted_at`);

--
-- Indexes for table `user_companies`
--
ALTER TABLE `user_companies`
  ADD PRIMARY KEY (`user_id`,`company_id`,`user_type`);

--
-- Indexes for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  ADD KEY `user_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`,`user_type`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vendors_company_id_email_deleted_at_unique` (`company_id`,`email`,`deleted_at`),
  ADD KEY `vendors_company_id_index` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_histories`
--
ALTER TABLE `bill_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_item_taxes`
--
ALTER TABLE `bill_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_payments`
--
ALTER TABLE `bill_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_statuses`
--
ALTER TABLE `bill_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bill_totals`
--
ALTER TABLE `bill_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_histories`
--
ALTER TABLE `invoice_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_item_taxes`
--
ALTER TABLE `invoice_item_taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_statuses`
--
ALTER TABLE `invoice_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_totals`
--
ALTER TABLE `invoice_totals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_histories`
--
ALTER TABLE `module_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `reconciliations`
--
ALTER TABLE `reconciliations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recurring`
--
ALTER TABLE `recurring`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mediables`
--
ALTER TABLE `mediables`
  ADD CONSTRAINT `mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_permissions`
--
ALTER TABLE `user_permissions`
  ADD CONSTRAINT `user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
