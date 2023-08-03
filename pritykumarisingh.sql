-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2023 at 06:38 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pritykumarisingh`
--

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376);

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `cn_number` varchar(191) NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('closed','open') NOT NULL DEFAULT 'closed',
  `recurring` enum('yes','no') NOT NULL DEFAULT 'no',
  `billing_frequency` varchar(191) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_original_name` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_notes`
--

INSERT INTO `credit_notes` (`id`, `company_id`, `project_id`, `cn_number`, `invoice_id`, `issue_date`, `due_date`, `discount`, `discount_type`, `sub_total`, `total`, `currency_id`, `status`, `recurring`, `billing_frequency`, `billing_interval`, `billing_cycle`, `file`, `file_original_name`, `note`, `deleted_at`, `created_at`, `updated_at`, `client_id`) VALUES
(1, 234, 12, '11', 0, '2012-03-22', '0000-00-00', 0, '', 432567.00, 0.00, 0, '', '', '14', 2, 0, 'CN', 'ABB', 'NA', '2026-03-21 18:30:00', '2012-03-21 18:30:00', '2023-04-21 18:30:00', 25),
(2, 132, 18, '71', 0, '2018-07-22', '0000-00-00', 0, '', 432566.00, 0.00, 0, '', '', '16', 4, 0, 'UG', 'KJO', 'NA', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2018-07-21 18:30:00', 5),
(3, 624, 22, '22', 0, '2011-02-22', '0000-00-00', 0, '', 432592.00, 0.00, 0, '', '', '24', 1, 0, 'TB', 'LIP', 'NA', '2022-03-21 18:30:00', '2012-03-21 18:30:00', '2011-02-21 18:30:00', 34),
(4, 242, 82, '31', 0, '2016-06-22', '0000-00-00', 0, '', 432522.00, 0.00, 0, '', '', '42', 12, 0, 'JK', 'HYU', 'NA', '0000-00-00 00:00:00', '2022-07-21 18:30:00', '2016-06-21 18:30:00', 75),
(5, 238, 61, '16', 0, '2012-02-22', '0000-00-00', 0, '', 432554.00, 0.00, 0, '', '', '23', 6, 0, 'QB', 'BHT', 'NA', '2016-04-21 18:30:00', '0000-00-00 00:00:00', '2012-02-21 18:30:00', 42);

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes_invoice`
--

CREATE TABLE `credit_notes_invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credit_notes_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `credit_amount` double(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_notes_invoice`
--

INSERT INTO `credit_notes_invoice` (`id`, `credit_notes_id`, `invoice_id`, `date`, `credit_amount`, `created_at`, `updated_at`) VALUES
(11, 245, 345, '2023-04-22 00:00:00', 22000.00, '0000-00-00 00:00:00', '2024-04-21 18:30:00'),
(12, 256, 622, '2008-03-22 00:00:00', 6000.00, '0000-00-00 00:00:00', '2008-03-21 18:30:00'),
(13, 175, 443, '2018-02-22 00:00:00', 2500.00, '0000-00-00 00:00:00', '2018-02-21 18:30:00'),
(14, 231, 213, '2003-07-22 00:00:00', 100000.00, '0000-00-00 00:00:00', '2003-07-21 18:30:00'),
(15, 233, 675, '2006-07-22 00:00:00', 5600.00, '0000-00-00 00:00:00', '2006-07-21 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_items`
--

CREATE TABLE `credit_note_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_note_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `credit_note_items`
--

INSERT INTO `credit_note_items` (`id`, `credit_note_id`, `item_name`, `type`, `quantity`, `unit_price`, `amount`, `taxes`, `created_at`, `updated_at`, `hsn_sac_code`) VALUES
(1, 23, 'HTYU', '', 625, 12.00, 7500.00, '22', '2012-03-21 18:30:00', '2014-04-21 18:30:00', 'A456'),
(2, 34, 'FYUK', '', 246, 56.00, 13776.00, '12', '2027-04-21 18:30:00', '2012-06-21 18:30:00', 'G675'),
(3, 42, 'MJHU', '', 643, 23.00, 14789.00, '6', '2012-03-21 18:30:00', '2006-04-21 18:30:00', 'C563'),
(4, 21, 'BFYJ', '', 567, 34.00, 19278.00, '14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'E342'),
(5, 53, 'KJYU', '', 343, 45.00, 15435.00, '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'B785');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no',
  `usd_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` enum('front','behind') NOT NULL DEFAULT 'front',
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `is_cryptocurrency`, `usd_price`, `created_at`, `updated_at`, `currency_position`, `status`) VALUES
(1, 1, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'front', 'enable'),
(2, 2, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2023-08-01 01:49:58', '2023-08-01 01:49:58', 'front', 'enable'),
(3, 3, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2023-08-01 01:49:58', '2023-08-01 01:49:58', 'front', 'enable'),
(4, 3, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2023-08-01 01:49:58', '2023-08-01 01:49:58', 'front', 'enable'),
(5, 3, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2023-08-01 01:49:58', '2023-08-01 01:49:58', 'behind', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `required` enum('yes','no') NOT NULL DEFAULT 'no',
  `values` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `custom_field_group_id`, `label`, `name`, `type`, `required`, `values`) VALUES
(1, 243, 'B234', 'BHGY', 'A567', 'yes', '675'),
(2, 367, 'J675', 'NJED', 'M754', 'yes', '234'),
(3, 565, 'J678', 'MDKD', 'M763', 'yes', '786'),
(4, 243, 'K765', 'AJDE', 'KO67', 'yes', '876'),
(5, 243, 'L874', 'MXED', 'L869', 'yes', '324');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) DEFAULT NULL,
  `value` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_fields_data`
--

INSERT INTO `custom_fields_data` (`id`, `custom_field_id`, `model_id`, `model`, `value`) VALUES
(1, 786, 654, 'HYU345', 'MK76'),
(2, 234, 732, 'JUG674', 'BH87'),
(3, 987, 243, 'NJH985', 'CF45'),
(4, 564, 163, 'BGY267', 'NH56'),
(5, 10, 987, 'BJY784', 'HU67');

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `model` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `company_id`, `name`, `model`) VALUES
(1, 2, 'Invoice', 'App\\Invoice'),
(2, 3, 'Estimate', 'App\\Estimate'),
(3, 4, 'Employee', 'App\\EmployeeDetails'),
(4, 2, 'Client', 'App\\ClientDetails'),
(5, 6, 'Client', 'App\\EmployeeDetails');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `widget_name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dashboard_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `company_id`, `widget_name`, `status`, `created_at`, `updated_at`, `dashboard_type`) VALUES
(1, 1, 'overdue_tasks', 1, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'admin-dashboard'),
(2, 1, 'client_wise_timelogs', 1, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'admin-client-dashboard'),
(3, 1, 'lead_vs_source', 1, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'admin-client-dashboard'),
(4, 1, 'total_pending_amount', 1, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'admin-finance-dashboard'),
(5, 1, 'invoice_overview', 1, '2023-08-01 01:49:57', '2023-08-01 01:49:57', 'admin-finance-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Team Lead', '2023-08-01 01:50:03', '2023-08-01 01:50:03'),
(2, 2, 'Trainee', '2023-08-01 01:50:03', '2023-08-01 01:50:03'),
(3, 4, 'Senior', '2023-08-01 01:50:10', '2023-08-01 01:50:10'),
(4, 4, 'Junior', '2023-08-01 01:50:10', '2023-08-01 01:50:10'),
(5, 2, 'Project Manager', '2023-08-01 01:50:03', '2023-08-01 01:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_category_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `color` varchar(20) DEFAULT '#232629',
  `user_id` int(10) UNSIGNED NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `best_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `last_reply_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discussions`
--

INSERT INTO `discussions` (`id`, `company_id`, `discussion_category_id`, `project_id`, `title`, `color`, `user_id`, `pinned`, `closed`, `deleted_at`, `last_reply_at`, `created_at`, `updated_at`, `best_answer_id`, `last_reply_by_id`) VALUES
(1, 4536, 34, 564, 'PHP Website Development', 'Blue', 325, 8, 5, '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', 87, 67),
(2, 5674, 32, 786, 'Application Development', 'Red', 654, 3, 9, '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', 32, 56),
(3, 7654, 42, 965, 'Process Automation', 'Green', 987, 5, 4, '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', 34, 65),
(4, 3534, 67, 465, 'Analytical Project', 'Blue', 453, 7, 2, '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', 12, 76),
(5, 8765, 87, 324, '.Net Application', 'Yellow', 243, 2, 8, '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57', 76, 45);

-- --------------------------------------------------------

--
-- Table structure for table `discussion_categories`
--

CREATE TABLE `discussion_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) NOT NULL,
  `color` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discussion_categories`
--

INSERT INTO `discussion_categories` (`id`, `company_id`, `order`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 34, 0, 'Ascending', 'Red', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(2, 25, 0, 'Ascending', 'Green', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(3, 56, 0, 'Ascending', 'Yellow', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(4, 23, 0, 'Ascending', 'Blue', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(5, 12, 0, 'Ascending', 'Black', '2023-08-01 01:49:57', '2023-08-01 01:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

CREATE TABLE `discussion_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `discussion_replies`
--

INSERT INTO `discussion_replies` (`id`, `company_id`, `discussion_id`, `user_id`, `body`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 453, 23, 12, 'I agree', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-05-10 01:49:57'),
(2, 332, 33, 22, 'I agree', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(3, 534, 12, 45, 'I agree', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(4, 654, 56, 65, 'I agree', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(5, 675, 21, 67, 'I agree', '2023-08-01 01:49:57', '2023-08-01 01:49:57', '2023-08-01 01:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `email_notification_settings`
--

CREATE TABLE `email_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `setting_name` varchar(191) NOT NULL,
  `send_email` enum('yes','no') NOT NULL DEFAULT 'no',
  `send_slack` enum('yes','no') NOT NULL DEFAULT 'no',
  `send_push` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_notification_settings`
--

INSERT INTO `email_notification_settings` (`id`, `company_id`, `setting_name`, `send_email`, `send_slack`, `send_push`, `created_at`, `updated_at`) VALUES
(1, 1, 'New Notice Published', 'yes', 'no', 'yes', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(2, 1, 'Invoice Create/Update Notification', 'yes', 'no', 'yes', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(3, 1, 'Payment Create/Update Notification', 'yes', 'no', 'yes', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(4, 1, 'Discussion Reply', 'yes', 'no', 'yes', '2023-08-01 01:49:57', '2023-08-01 01:49:57'),
(5, 1, 'New Project/Added by Admin', 'yes', 'no', 'yes', '2023-08-01 01:49:57', '2023-08-01 01:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `slack_username` varchar(191) DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joining_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `company_id`, `user_id`, `employee_id`, `address`, `hourly_rate`, `slack_username`, `department_id`, `designation_id`, `created_at`, `updated_at`, `joining_date`, `last_date`) VALUES
(1, 1, 14, 'EMP0014', '7621 Kayden Keys\nYolandastad, NV 32655', 24, 'sammie88', 2, 3, '2023-08-01 01:50:00', '2023-08-01 01:50:00', '2023-06-08 18:30:00', NULL),
(2, 1, 15, 'EMP0015', '87156 Justice Heights Suite 798\nSouth Hayleychester, OK 76528', 34, 'gunnar78', 1, 4, '2023-08-01 01:50:01', '2023-08-01 01:50:01', '2023-06-30 18:30:00', NULL),
(3, 1, 16, 'EMP0016', '219 Jada Wells Apt. 341\nSaraiview, NM 15368', 36, 'bhuels', 4, 4, '2023-08-01 01:50:01', '2023-08-01 01:50:01', '2023-07-27 18:30:00', NULL),
(4, 1, 17, 'EMP0017', '400 Cicero Ports Suite 140\nKassandrashire, GA 22854', 16, 'hudson.pinkie', 4, 2, '2023-08-01 01:50:01', '2023-08-01 01:50:01', '2022-09-22 18:30:00', NULL),
(5, 1, 18, 'EMP0018', '238 Lenny Manor\nEast Elenabury, WV 04211-1698', 41, 'runolfsdottir.edwina', 1, 1, '2023-08-01 01:50:01', '2023-08-01 01:50:01', '2022-12-08 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE `employee_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `hashname` varchar(200) NOT NULL,
  `size` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_docs`
--

INSERT INTO `employee_docs` (`id`, `company_id`, `user_id`, `name`, `filename`, `hashname`, `size`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 'prity', 'pritytech', 'prity', '45', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(2, 1, 13, 'mahima', 'mahimatech', 'mahima', '12', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(3, 1, 10, 'sapna', 'sapnatech', 'sapna', '87', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(4, 1, 22, 'shreya', 'shreyatech', 'shreya', '54', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(5, 1, 29, 'harsh', 'harshtech', 'harsh', '63', '2023-08-01 03:30:00', '2023-08-01 03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_faqs`
--

CREATE TABLE `employee_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `employee_faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_faqs`
--

INSERT INTO `employee_faqs` (`id`, `company_id`, `title`, `description`, `employee_faq_category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Twitter', 'Twitter’s FAQ help center made a list as it factored in some fascinating personalization, easy-to-use search functionality, and has a positive user experience', 23, '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(2, 1, 'Youtube', 'YouTube’s FAQ page is clean, fresh, simple to use, and provides access to the most commonly asked “help” topics.', 23, '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(3, 1, 'McDonald’s', 'The McDonald’s FAQ page feels informal and sociable, encouraging people to share their FAQ experiences (a rarity).', 23, '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(4, 1, 'Whatsapp', 'The FAQ resource for Whatsapp is bright, easy to use, and categorized effectively for quick desktop or mobile use.', 23, '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(5, 1, 'Wikipedia', 'Wikipedia’s help center is an excellent example of an “old-school” FAQ page.', 23, '2023-08-01 03:30:00', '2023-08-01 03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_faq_categories`
--

CREATE TABLE `employee_faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_faq_categories`
--

INSERT INTO `employee_faq_categories` (`id`, `company_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Twitter', '2006-07-15 03:30:00', '2023-08-01 03:30:00'),
(2, 1, 'Youtube', '2008-08-12 03:30:00', '2023-08-01 03:30:00'),
(3, 1, 'Facebook', '2006-09-26 03:30:00', '2023-08-01 03:30:00'),
(4, 1, 'Whatsapp', '2009-02-01 03:30:00', '2023-08-01 03:30:00'),
(5, 1, 'Telegram', '0000-00-00 00:00:00', '2023-08-01 03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_faq_files`
--

CREATE TABLE `employee_faq_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_faq_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_faq_files`
--

INSERT INTO `employee_faq_files` (`id`, `company_id`, `user_id`, `employee_faq_id`, `filename`, `description`, `google_url`, `hashname`, `size`, `dropbox_link`, `external_link`, `external_link_name`, `created_at`, `updated_at`) VALUES
(1, 1, 23, 231, 'hgyt', 'bhgy ty fxfgy tyghgh', ' ', ' ', '10', ' ', ' ', ' ', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(2, 1, 45, 765, 'bhgh', 'bjh s8yd bs ajjx', ' ', ' ', '76', ' ', ' ', ' ', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(3, 1, 12, 342, 'njhj', 'vnh uuhj nbnhjb nnnnnj', ' ', ' ', '86', ' ', ' ', ' ', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(4, 1, 76, 112, 'njhu', 'bjh khb jhjbnk', ' ', ' ', '17', ' ', ' ', ' ', '2023-08-01 03:30:00', '2023-08-01 03:30:00'),
(5, 1, 43, 275, 'nhhg', 'bjiu jkbj jkijjf hk', ' ', ' ', '87', ' ', ' ', ' ', '2023-08-01 03:30:00', '2023-08-01 03:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_quotas`
--

CREATE TABLE `employee_leave_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `no_of_leaves` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_leave_quotas`
--

INSERT INTO `employee_leave_quotas` (`id`, `company_id`, `user_id`, `leave_type_id`, `no_of_leaves`, `created_at`, `updated_at`) VALUES
(1, 1, 9, 6, 5, '2023-08-01 01:50:00', '2023-08-01 01:50:00'),
(2, 1, 10, 4, 5, '2023-08-01 01:50:00', '2023-08-01 01:50:00'),
(3, 1, 10, 5, 5, '2023-08-01 01:50:00', '2023-08-01 01:50:00'),
(4, 1, 10, 6, 5, '2023-08-01 01:50:00', '2023-08-01 01:50:00'),
(5, 1, 11, 4, 5, '2023-08-01 01:50:00', '2023-08-01 01:50:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_notes_company_id_foreign` (`company_id`),
  ADD KEY `credit_notes_project_id_foreign` (`project_id`),
  ADD KEY `credit_notes_currency_id_foreign` (`currency_id`),
  ADD KEY `credit_notes_client_id_foreign` (`client_id`);

--
-- Indexes for table `credit_notes_invoice`
--
ALTER TABLE `credit_notes_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_note_items_credit_note_id_foreign` (`credit_note_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
