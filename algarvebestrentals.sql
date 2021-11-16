-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 08, 2021 at 04:04 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `algarvebestrentals`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carros`
--

CREATE TABLE `carros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `groupType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `epocaBaixa` int(11) NOT NULL,
  `epocaMedia` int(11) NOT NULL,
  `epocaMediaAlta` int(11) NOT NULL,
  `epocaAlta` int(11) NOT NULL,
  `seguro` int(11) NOT NULL,
  `transmissao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugares` int(11) NOT NULL,
  `bagagemGr` int(11) NOT NULL,
  `bagagemPq` int(11) NOT NULL,
  `combustivel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `arCondicionado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroReservas` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carros`
--

INSERT INTO `carros` (`id`, `groupType`, `marca`, `epocaBaixa`, `epocaMedia`, `epocaMediaAlta`, `epocaAlta`, `seguro`, `transmissao`, `lugares`, `bagagemGr`, `bagagemPq`, `combustivel`, `arCondicionado`, `imagem`, `numeroReservas`, `active`, `user_id`, `company_id`, `created_at`, `updated_at`) VALUES
(1, 'Group A', 'Ex. Seat Ibiza / Opel Corsa / VW Polo', 100, 150, 200, 250, 7, 'AUT', 1, 1, 1, 'P', 'AC', 'public/carros/XM6avbvZ17UoqIYxesaW5DiAGUuNvxa0T9Nd2xJl.png', 13, 1, 1, 1, '2021-03-26 13:51:12', '2021-04-07 20:03:56'),
(2, 'Group B', 'Ex. Chevrolet Spark / Peugeot 107', 10, 15, 20, 25, 7, 'AUT', 1, 1, 1, 'P', 'AC', 'public/carros/Al5RnNE3UDOOZkkALgIscc0n1q2VKhNkXyLL2CNX.png', 50, 1, 1, 1, '2021-04-02 14:32:44', '2021-04-07 20:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `nif` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `phone`, `nif`, `active`, `created_at`, `updated_at`) VALUES
(1, 'av rent a car', 'manel@gmail.com', 926136060, 231516171, 1, '2021-03-26 13:50:55', '2021-03-26 13:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_01_11_220128_create_carros_table', 1),
(5, '2021_01_11_220153_create_quotes_table', 1),
(6, '2021_01_11_220209_create_reservas_table', 1),
(7, '2021_01_11_220227_create_settings_table', 1),
(8, '2021_01_11_220245_create_contacts_table', 1),
(9, '2021_02_13_162511_create_companies_table', 1),
(10, '2021_02_17_123523_create_blogs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pickUpDate` date NOT NULL,
  `dropOffDate` date NOT NULL,
  `age` int(11) NOT NULL,
  `carros` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `days` int(11) DEFAULT NULL,
  `car_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `pickUpDate`, `dropOffDate`, `age`, `carros`, `days`, `car_id`, `created_at`, `updated_at`) VALUES
(1, '2021-03-29', '2021-04-01', 23, 'All Cars', 3, NULL, '2021-03-28 14:32:08', '2021-03-28 14:32:08'),
(2, '2021-03-29', '2021-04-01', 23, 'All Cars', 3, NULL, '2021-03-28 21:12:08', '2021-03-28 21:12:08'),
(3, '2021-04-03', '2021-04-06', 23, 'All Cars', 3, NULL, '2021-04-02 14:23:19', '2021-04-02 14:23:19'),
(4, '2021-04-03', '2021-04-06', 23, 'All Cars', 3, NULL, '2021-04-02 14:32:53', '2021-04-02 14:32:53'),
(5, '2021-04-03', '2021-04-06', 23, 'All Cars', 3, NULL, '2021-04-02 18:05:09', '2021-04-02 18:05:09'),
(6, '2021-04-03', '2021-04-06', 23, 'All Cars', 3, NULL, '2021-04-02 19:39:54', '2021-04-02 19:39:54'),
(7, '2021-04-04', '2021-04-07', 23, 'All Cars', 3, NULL, '2021-04-03 10:12:42', '2021-04-03 10:12:42'),
(8, '2021-04-04', '2021-04-07', 23, 'All Cars', 3, NULL, '2021-04-03 10:15:37', '2021-04-03 10:15:37'),
(9, '2021-04-04', '2021-04-07', 23, 'All Cars', 3, NULL, '2021-04-03 10:16:24', '2021-04-03 10:16:24'),
(10, '2021-04-04', '2021-04-07', 23, 'All Cars', 3, NULL, '2021-04-03 13:07:46', '2021-04-03 13:07:46'),
(11, '2021-04-04', '2021-04-07', 23, '1', 3, 1, '2021-04-03 13:07:49', '2021-04-03 13:07:49'),
(12, '2021-04-04', '2021-04-07', 23, 'All Cars', 3, NULL, '2021-04-03 13:55:08', '2021-04-03 13:55:08'),
(13, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-04 23:18:17', '2021-04-04 23:18:17'),
(14, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-04 23:18:17', '2021-04-04 23:18:17'),
(15, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-04 23:30:07', '2021-04-04 23:30:07'),
(16, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-05 00:02:13', '2021-04-05 00:02:13'),
(17, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-05 00:03:55', '2021-04-05 00:03:55'),
(18, '2021-04-06', '2021-04-09', 23, 'All Cars', 3, NULL, '2021-04-05 00:04:02', '2021-04-05 00:04:02'),
(19, '2021-04-08', '2021-04-11', 23, 'All Cars', 3, NULL, '2021-04-07 19:33:48', '2021-04-07 19:33:48'),
(20, '2021-04-08', '2021-04-11', 23, 'All Cars', 3, NULL, '2021-04-07 19:33:49', '2021-04-07 19:33:49'),
(21, '2021-04-08', '2021-04-11', 23, 'All Cars', 3, NULL, '2021-04-07 19:44:26', '2021-04-07 19:44:26'),
(22, '2021-04-08', '2021-04-11', 23, 'All Cars', 3, NULL, '2021-04-07 20:11:41', '2021-04-07 20:11:41'),
(23, '2021-04-18', '2021-04-21', 23, 'All Cars', 3, NULL, '2021-04-17 13:35:01', '2021-04-17 13:35:01'),
(24, '2021-04-21', '2021-04-24', 23, '2', 3, 2, '2021-04-20 20:58:24', '2021-04-20 20:58:24'),
(25, '2021-04-21', '2021-04-24', 23, '2', 3, 2, '2021-04-20 20:58:28', '2021-04-20 20:58:28'),
(26, '2021-04-21', '2021-04-24', 23, 'All Cars', 3, NULL, '2021-04-20 20:58:32', '2021-04-20 20:58:32'),
(27, '2021-04-21', '2021-04-24', 23, 'All Cars', 3, NULL, '2021-04-20 21:02:05', '2021-04-20 21:02:05'),
(28, '2021-04-21', '2021-04-24', 23, 'All Cars', 3, NULL, '2021-04-20 21:04:18', '2021-04-20 21:04:18'),
(29, '2021-04-21', '2021-04-24', 23, 'All Cars', 3, NULL, '2021-04-20 21:22:46', '2021-04-20 21:22:46'),
(30, '2021-04-21', '2021-04-24', 23, '1', 3, 1, '2021-04-20 21:22:53', '2021-04-20 21:22:53'),
(31, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 14:43:44', '2021-05-08 14:43:44'),
(32, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 14:48:14', '2021-05-08 14:48:14'),
(33, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 14:49:52', '2021-05-08 14:49:52'),
(34, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 14:50:15', '2021-05-08 14:50:15'),
(35, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 14:50:37', '2021-05-08 14:50:37'),
(36, '2021-05-09', '2021-05-12', 23, 'All Cars', 3, NULL, '2021-05-08 15:00:52', '2021-05-08 15:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `visitor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `dateOfbirth` date NOT NULL,
  `drivinglicence` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pickUpPlace` int(11) NOT NULL,
  `pickUpDate` date NOT NULL,
  `pickUpTime` time NOT NULL,
  `dropOffPlace` int(11) NOT NULL,
  `dropOffDate` date NOT NULL,
  `dropOffTime` time NOT NULL,
  `flightNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullInsurance` int(11) DEFAULT NULL,
  `spainInsurance` int(11) DEFAULT NULL,
  `gps` int(11) DEFAULT NULL,
  `extraDriver` int(11) DEFAULT NULL,
  `childTodlerSeats` int(11) DEFAULT NULL,
  `childInfantSeats` int(11) DEFAULT NULL,
  `childBoosterSeats` int(11) DEFAULT NULL,
  `textArea` longtext COLLATE utf8mb4_unicode_ci,
  `age` int(11) NOT NULL,
  `termsAndConditions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` int(11) NOT NULL,
  `commission` int(11) DEFAULT NULL,
  `paymentId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `car_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quote_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `visitor`, `device`, `name`, `email`, `phone`, `dateOfbirth`, `drivinglicence`, `pickUpPlace`, `pickUpDate`, `pickUpTime`, `dropOffPlace`, `dropOffDate`, `dropOffTime`, `flightNumber`, `fullInsurance`, `spainInsurance`, `gps`, `extraDriver`, `childTodlerSeats`, `childInfantSeats`, `childBoosterSeats`, `textArea`, `age`, `termsAndConditions`, `preco`, `commission`, `paymentId`, `car_id`, `quote_id`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:29:57', '2021-04-02 14:29:57'),
(2, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:41:20', '2021-04-02 14:41:20'),
(3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:41:21', '2021-04-02 14:41:21'),
(4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:42:54', '2021-04-02 14:42:54'),
(5, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:43:03', '2021-04-02 14:43:03'),
(6, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 14:47:07', '2021-04-02 14:47:07'),
(7, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:47:32', '2021-04-02 14:47:32'),
(8, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:48:13', '2021-04-02 14:48:13'),
(9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:48:44', '2021-04-02 14:48:44'),
(10, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:49:02', '2021-04-02 14:49:02'),
(11, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:49:20', '2021-04-02 14:49:20'),
(12, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:53:22', '2021-04-02 14:53:22'),
(13, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:53:40', '2021-04-02 14:53:40'),
(14, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:53:57', '2021-04-02 14:53:57'),
(15, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:55:48', '2021-04-02 14:55:48'),
(16, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:58:38', '2021-04-02 14:58:38'),
(17, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:59:07', '2021-04-02 14:59:07'),
(18, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:59:32', '2021-04-02 14:59:32'),
(19, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 14:59:53', '2021-04-02 14:59:53'),
(20, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:03:50', '2021-04-02 15:03:50'),
(21, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:05:33', '2021-04-02 15:05:33'),
(22, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:06:26', '2021-04-02 15:06:26'),
(23, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:06:40', '2021-04-02 15:06:40'),
(24, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:07:24', '2021-04-02 15:07:24'),
(25, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:09:43', '2021-04-02 15:09:43'),
(26, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:10:51', '2021-04-02 15:10:51'),
(27, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:11:09', '2021-04-02 15:11:09'),
(28, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Mobile Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:13:02', '2021-04-02 15:13:02'),
(29, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Mobile Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:13:23', '2021-04-02 15:13:23'),
(30, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:14:35', '2021-04-02 15:14:35'),
(31, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:15:12', '2021-04-02 15:15:12'),
(32, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:16:11', '2021-04-02 15:16:11'),
(33, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:18:26', '2021-04-02 15:18:26'),
(34, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:18:52', '2021-04-02 15:18:52'),
(35, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:19:02', '2021-04-02 15:19:02'),
(36, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:19:21', '2021-04-02 15:19:21'),
(37, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:19:34', '2021-04-02 15:19:34'),
(38, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:19:55', '2021-04-02 15:19:55'),
(39, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:20:06', '2021-04-02 15:20:06'),
(40, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:20:34', '2021-04-02 15:20:34'),
(41, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:22:46', '2021-04-02 15:22:46'),
(42, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-02 15:23:29', '2021-04-02 15:23:29'),
(43, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 80, 0, 0, NULL, 23, 'on', 530, 96, NULL, 1, NULL, '2021-04-02 15:44:08', '2021-04-02 15:44:08'),
(44, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 80, 0, 0, NULL, 23, 'on', 530, 96, NULL, 1, NULL, '2021-04-02 15:44:09', '2021-04-02 15:44:09'),
(45, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 15:44:33', '2021-04-02 15:44:33'),
(46, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-02 18:08:25', '2021-04-02 18:08:25'),
(47, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-02', 'fa sewewqe', 0, '2021-04-03', '11:00:00', 0, '2021-04-06', '11:00:00', NULL, 21, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 471, 85, NULL, 1, NULL, '2021-04-02 19:40:07', '2021-04-02 19:40:07'),
(48, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, 7, '2021-04-03 10:12:55', '2021-04-03 10:12:55'),
(49, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 21, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 471, 85, NULL, 1, NULL, '2021-04-03 13:08:33', '2021-04-03 13:08:33'),
(50, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 450, 81, NULL, 1, NULL, '2021-04-03 13:23:10', '2021-04-03 13:23:10'),
(51, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-03 13:25:48', '2021-04-03 13:25:48'),
(52, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-03 13:31:12', '2021-04-03 13:31:12'),
(53, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 21, 25, 30, 160, 180, 200, 225, NULL, 23, 'on', 886, 160, NULL, 2, NULL, '2021-04-03 14:51:44', '2021-04-03 14:51:44'),
(54, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 21, 25, 30, 160, 180, 200, 225, NULL, 23, 'on', 886, 160, NULL, 2, NULL, '2021-04-03 14:52:57', '2021-04-03 14:52:57'),
(55, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-03 14:53:26', '2021-04-03 14:53:26'),
(56, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 21, 25, 30, 40, 60, 50, 50, NULL, 23, 'on', 321, 58, NULL, 2, NULL, '2021-04-03 14:53:45', '2021-04-03 14:53:45'),
(57, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-03', 'fa sewewqe', 0, '2021-04-04', '11:00:00', 0, '2021-04-07', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-03 14:58:09', '2021-04-03 14:58:09'),
(58, '77.234.46.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 21, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 66, 12, NULL, 2, NULL, '2021-04-04 23:19:22', '2021-04-04 23:19:22'),
(59, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-04 23:45:49', '2021-04-04 23:45:49'),
(60, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, NULL, 2, NULL, '2021-04-04 23:49:36', '2021-04-04 23:49:36'),
(61, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, 'pi_1IcgdTDUU5l8U0qttT37MLVn', 2, NULL, '2021-04-04 23:49:46', '2021-04-04 23:49:47'),
(62, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 21, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 66, 12, 'pi_1IcgpnDUU5l8U0qtw2vFu3r7', 2, NULL, '2021-04-05 00:02:31', '2021-04-05 00:02:32'),
(63, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-04-05', 'fa sewewqe', 0, '2021-04-06', '11:00:00', 0, '2021-04-09', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, 'pi_1IcgrYDUU5l8U0qti3TftGdS', 2, 18, '2021-04-05 00:04:19', '2021-04-05 00:04:20'),
(64, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-05-01', 'fa sewewqe', 0, '2021-05-02', '11:00:00', 0, '2021-05-05', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, 'pi_1Im7EkDUU5l8U0qtkGRR9qyb', 2, NULL, '2021-05-01 00:03:13', '2021-05-01 00:03:14'),
(65, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-05-01', 'fa sewewqe', 0, '2021-05-02', '11:00:00', 0, '2021-05-05', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, 'pi_1Im7FcDUU5l8U0qtY7kn1jIY', 2, NULL, '2021-05-01 00:04:07', '2021-05-01 00:04:08'),
(66, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', 'Joao Oliveira', 'djohnoliver@gmail.com', 926136060, '1998-05-01', 'fa sewewqe', 0, '2021-05-02', '11:00:00', 0, '2021-05-05', '11:00:00', NULL, 0, NULL, NULL, 0, 0, 0, 0, NULL, 23, 'on', 45, 9, 'pi_1Im7H5DUU5l8U0qtValU7b6w', 2, NULL, '2021-05-01 00:05:38', '2021-05-01 00:05:39');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'joaovieira@gmail.com',
  `spainInsurance` int(11) NOT NULL DEFAULT '25',
  `gps` int(11) NOT NULL DEFAULT '30',
  `extraDriver` int(11) NOT NULL DEFAULT '20',
  `todlerSeat` int(11) NOT NULL DEFAULT '20',
  `infantSeat` int(11) NOT NULL DEFAULT '25',
  `boosterSeat` int(11) NOT NULL DEFAULT '25',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `spainInsurance`, `gps`, `extraDriver`, `todlerSeat`, `infantSeat`, `boosterSeat`, `created_at`, `updated_at`) VALUES
(1, 'joaovieira@gmail.com', 25, 30, 20, 20, 25, 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Joao Oliveira', 'djohnoliver@gmail.com', NULL, '$2y$10$Qe8U/ie6HyvGEr9ua25aPO./Bo74NeOOYoYVi6RrDxeIPGXvVM0Iy', NULL, '2021-03-24 17:26:22', '2021-03-24 17:26:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carros_grouptype_unique` (`groupType`),
  ADD KEY `carros_user_id_foreign` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_car_id_foreign` (`car_id`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservas_car_id_foreign` (`car_id`),
  ADD KEY `reservas_quote_id_foreign` (`quote_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carros`
--
ALTER TABLE `carros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carros`
--
ALTER TABLE `carros`
  ADD CONSTRAINT `carros_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `carros` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `carros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservas_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
