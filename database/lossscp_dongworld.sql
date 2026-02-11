-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 07 Feb 2026 pada 13.46
-- Versi server: 11.4.5-MariaDB-ubu2204
-- Versi PHP: 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lossscp_dongworld`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:17:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"userAccess\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:12:\"seriesAccess\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:9:\"seriesAdd\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:12:\"seriesUpdate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"seriesDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:13:\"episodeAccess\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:10:\"episodeAdd\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:13:\"episodeUpdate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:13:\"episodeDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:11:\"genreAccess\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:8:\"genreAdd\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:11:\"genreUpdate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"genreDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:12:\"serverAccess\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:9:\"serverAdd\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:12:\"serverUpdate\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:12:\"serverDelete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:2:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"superadmin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:6:\"subber\";s:1:\"c\";s:3:\"web\";}}}', 1770555041);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `series_id` bigint(20) UNSIGNED DEFAULT NULL,
  `episode_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `series_id`, `episode_id`, `name`, `content`, `is_admin`, `created_at`, `updated_at`) VALUES
(4, 3, NULL, 'Losss', 'Halo', 0, '2026-01-29 08:05:44', '2026-01-29 08:05:44'),
(6, NULL, 160, 'BisulkipliTukangPikul', 'Episode apa ini? Sdh kayak sinetron Indosiar.', 0, '2026-02-02 06:10:17', '2026-02-02 06:10:17'),
(7, NULL, 115, 'Akram', 'Nice!', 0, '2026-02-02 11:21:56', '2026-02-02 11:21:56'),
(8, NULL, 293, 'Nik mat', 'Good', 0, '2026-02-05 04:26:23', '2026-02-05 04:26:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `episodes`
--

CREATE TABLE `episodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `series_id` bigint(20) UNSIGNED NOT NULL,
  `episode_number` int(11) DEFAULT NULL,
  `download_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`download_links`)),
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `episodes`
--

INSERT INTO `episodes` (`id`, `series_id`, `episode_number`, `download_links`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(51, 3, 125, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11AtWoXiH4Df67652dq8tiR4TIRUFiAtJ\\/view?usp=drivesdk\"]', '6dyfl-renegade-immortal-125', 1, '2026-01-29 07:47:13', '2026-01-29 07:47:13'),
(52, 3, 124, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Y6LP2SFU31D90fIgTugaY0poFApe1u_c\\/view?usp=drivesdk\"]', 'zowxo-renegade-immortal-124', 1, '2026-01-29 07:49:40', '2026-01-29 07:49:40'),
(54, 5, 13, '[]', 'mnaqz-tomb-of-fallen-gods-3rd-season-13', 1, '2026-01-29 08:21:47', '2026-01-29 08:21:47'),
(55, 5, 14, '[]', 'qexoy-tomb-of-fallen-gods-3rd-season-14', 1, '2026-01-29 08:22:20', '2026-01-29 08:22:20'),
(56, 5, 15, '[]', 'qomqx-tomb-of-fallen-gods-3rd-season-15', 1, '2026-01-29 08:22:37', '2026-01-29 08:22:37'),
(57, 5, 16, '[]', 'd6osm-tomb-of-fallen-gods-3rd-season-16', 1, '2026-01-29 08:22:48', '2026-01-29 08:22:48'),
(58, 5, 17, '[]', 'cxutm-tomb-of-fallen-gods-3rd-season-17', 1, '2026-01-29 08:23:05', '2026-01-29 08:23:05'),
(59, 5, 18, '[]', 'uynm2-tomb-of-fallen-gods-3rd-season-18', 1, '2026-01-29 08:23:19', '2026-01-29 08:23:19'),
(60, 5, 19, '[]', 'itztc-tomb-of-fallen-gods-3rd-season-19', 1, '2026-01-29 08:23:33', '2026-01-29 08:23:45'),
(61, 5, 20, '[]', 'l7zg6-tomb-of-fallen-gods-3rd-season-20', 1, '2026-01-29 08:24:50', '2026-01-29 08:24:50'),
(62, 5, 21, '[]', 'ov7d0-tomb-of-fallen-gods-3rd-season-21', 1, '2026-01-29 08:25:29', '2026-01-29 08:25:29'),
(63, 5, 22, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1mFUfUIS3nt-TS_WOp-ylq-TPBVtVOXOo\\/view?usp=drivesdk\"]', '1b0pn-tomb-of-fallen-gods-3rd-season-22', 1, '2026-01-29 08:25:48', '2026-01-29 08:26:20'),
(64, 5, 23, '[]', 'ju4n0-tomb-of-fallen-gods-3rd-season-23', 1, '2026-01-29 08:26:07', '2026-01-29 08:26:07'),
(65, 5, 24, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1z18CtvQS4CSpht0-FK9zs2MdP5kxskTo\\/view?usp=drivesdk\"]', 'hoosv-tomb-of-fallen-gods-3rd-season-24', 1, '2026-01-29 08:26:50', '2026-01-29 08:26:50'),
(66, 5, 25, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1aONXm54FRCxoAglrktgzNyHh4HVTo5wI\\/view?usp=drivesdk\"]', '0tt9s-tomb-of-fallen-gods-3rd-season-25', 1, '2026-01-29 08:27:20', '2026-01-29 08:27:20'),
(67, 5, 26, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Cr5ZUHc2QUWK9crcv_TPRHFDeix14apE\\/view?usp=drivesdk\"]', 't05n9-tomb-of-fallen-gods-3rd-season-26', 1, '2026-01-29 08:27:43', '2026-01-29 08:27:43'),
(68, 9, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1AZmC88o9nz1CQWExetfigQwBzkKCcM9K\\/view?usp=drivesdk\"]', 'v6p56-the-great-ruler-2-6', 1, '2026-01-29 21:27:21', '2026-01-29 21:27:21'),
(69, 7, 148, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1yIFSqxpM65P0TxS6fuNj-pnH-ChPT5Q_\\/view?usp=drivesdk\"]', 'dvdkk-lingwu-continent-148', 1, '2026-01-29 21:28:17', '2026-01-29 21:28:17'),
(70, 5, 27, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11-7mStkFBmFuEEHI58Ytxh6EsU2FMkkJ\\/view?usp=drivesdk\"]', 'h6iy1-tomb-of-fallen-gods-3rd-season-27', 1, '2026-01-29 21:28:54', '2026-01-29 21:28:54'),
(72, 12, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1TzYExwUWzzrTSfnmfFqOs0CscCz-CMBC\\/view?usp=drive_link\"]', 't4bxf-threads-of-fate-a-war-untold-7', 1, '2026-01-29 22:57:16', '2026-01-29 22:57:16'),
(73, 12, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1uU-axkNMh3EcZ6MsfNHoufXsDS4DqhRo\\/view?usp=drivesdk\"]', 'p2njc-threads-of-fate-a-war-untold-6', 1, '2026-01-29 23:28:12', '2026-01-29 23:28:12'),
(74, 12, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1KjW0oAZknBC6vi1qQ_HTG7NJNWBF7XaT\\/view?usp=drivesdk\"]', '2xw1z-threads-of-fate-a-war-untold-5', 1, '2026-01-29 23:29:00', '2026-01-29 23:29:00'),
(75, 12, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1SWvX8urJQPg_bwTFX0-X1HbEX2jUSlE9\\/view?usp=drive_link\"]', 'fdmka-threads-of-fate-a-war-untold-4', 1, '2026-01-29 23:29:18', '2026-01-29 23:29:18'),
(77, 10, 138, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1H8RR75vqj2PPxgRNwYZ354_rooV0Juzr\\/view?usp=drivesdk\"]', 'z82b1-soul-land-2-138', NULL, '2026-01-30 04:02:41', '2026-01-30 04:02:41'),
(78, 11, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1kzAbpsLlVsh7O2S4aAVA1qMWEZVgF5HF\\/view?usp=drivesdk\"]', 'cdwu9-immortality-season-5-9', NULL, '2026-01-30 05:32:38', '2026-01-30 05:32:38'),
(79, 11, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1g6mjURWinhbZknT_kajJjyEIzx0cfQ2P\\/view?usp=drivesdk\"]', '3jwrw-immortality-season-5-8', 1, '2026-01-30 05:34:39', '2026-01-30 05:34:39'),
(80, 6, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1PteJ_qpY8U-lFm4mUZ6bJN4spzE-9KKl\\/view?usp=drivesdk\"]', 'ikrgf-back-as-immortal-lord-1', NULL, '2026-01-30 06:59:09', '2026-01-30 06:59:09'),
(81, 6, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1nhSi08Swdl2ftz8xwi-_MVcojR5WyYqs\\/view?usp=drivesdk\"]', 'kbis0-back-as-immortal-lord-2', NULL, '2026-01-30 07:07:32', '2026-01-30 07:07:32'),
(82, 6, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ZR9wdcmTOizAhpn-h-FOseK0QGnVN0em\\/view?usp=drivesdk\"]', 'gpiyg-back-as-immortal-lord-3', NULL, '2026-01-30 07:37:17', '2026-01-30 07:37:17'),
(83, 6, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1TMoz2mkcvpZsEtEVMnMZkJvG_a2Boiuk\\/view?usp=drivesdk\"]', 'bh00e-back-as-immortal-lord-4', NULL, '2026-01-30 07:59:08', '2026-01-30 07:59:08'),
(84, 8, 13, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zgD_kALHvMguKauCfh_2pjK-tY24Sq82\\/view?usp=drivesdk\"]', 'es3ds-ascendants-of-the-nine-suns-13', NULL, '2026-01-30 08:24:57', '2026-01-30 08:24:57'),
(85, 6, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1s6GA5JjjiV0Jdmha3U4S6p6YUfmQNiuz\\/view?usp=drivesdk\"]', 'elglq-back-as-immortal-lord-5', NULL, '2026-01-30 08:53:45', '2026-01-30 08:53:45'),
(86, 6, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zYPgUhjL1pyyTvX2IMY914_EdByJqqjg\\/view?usp=drivesdk\"]', 'el9ng-back-as-immortal-lord-6', NULL, '2026-01-30 09:22:23', '2026-01-30 09:22:23'),
(87, 6, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Vkk4vCtV3yOQDb8V3uckTKD8Isd1qTCp\\/view?usp=drivesdk\"]', '8sq8j-back-as-immortal-lord-7', NULL, '2026-01-30 09:22:52', '2026-01-30 09:22:52'),
(88, 11, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1tsss_wBs0wkhTqaF8wqjRh_ugowPj4ar\\/view?usp=drivesdk\"]', 'nziu4-immortality-season-5-7', 1, '2026-01-30 09:35:10', '2026-01-30 09:35:10'),
(89, 11, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1_Z1IrhnzfFRUaSuOh70Y0d9rEbulVbqN\\/view?usp=drivesdk\"]', 'jsgyw-immortality-season-5-6', 1, '2026-01-30 09:35:45', '2026-01-30 09:35:45'),
(90, 11, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1fOHnNHAiCkQ3D78KwO3wSrKZusFZnYAR\\/view?usp=drivesdk\"]', 'y9yqh-immortality-season-5-5', 1, '2026-01-30 09:36:21', '2026-01-30 09:36:21'),
(91, 11, 4, '[]', 'eq50n-immortality-season-5-4', 1, '2026-01-30 09:36:47', '2026-01-30 09:36:47'),
(92, 11, 3, '[]', 'gfrlw-immortality-season-5-3', 1, '2026-01-30 09:37:10', '2026-01-30 09:37:10'),
(93, 11, 2, '[]', 'ayibn-immortality-season-5-2', 1, '2026-01-30 09:37:28', '2026-01-30 09:37:28'),
(94, 11, 1, '[]', 'hlqte-immortality-season-5-1', 1, '2026-01-30 09:37:39', '2026-01-30 09:37:39'),
(95, 6, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1f1w9UEZfHayExZv4DzJbRqn-tidYVsu4\\/view?usp=drivesdk\"]', 'ijcaw-back-as-immortal-lord-9', NULL, '2026-01-30 09:52:06', '2026-01-30 09:52:06'),
(96, 6, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/12g7fFRV86zTEaXz0Fud1niKZ0C7efpfd\\/view?usp=drivesdk\"]', 'ozpc8-back-as-immortal-lord-8', NULL, '2026-01-30 10:00:36', '2026-01-30 10:00:36'),
(97, 6, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Iw-CVvoJyMlNvvGl8ONHKHFgly1j4fOy\\/view?usp=drivesdk\"]', 'ujgyt-back-as-immortal-lord-11', NULL, '2026-01-30 10:40:00', '2026-01-30 10:40:00'),
(98, 6, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1cnKbnxAHR_PUryrFZxoqsVTh_5qBonJ3\\/view?usp=drivesdk\"]', 'oomvg-back-as-immortal-lord-10', NULL, '2026-01-30 10:40:27', '2026-01-30 10:40:27'),
(99, 6, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1vRvsO96uLHW26O5mL07PmG8XLUoIhcHb\\/view?usp=drivesdk\"]', '57hfx-back-as-immortal-lord-12', NULL, '2026-01-30 10:44:49', '2026-01-30 10:44:49'),
(100, 6, 13, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1G6RPweooXmnSf_KTGZrFzehvx8tvYmDU\\/view?usp=drivesdk\"]', 'dhuwi-back-as-immortal-lord-13', NULL, '2026-01-30 10:59:14', '2026-01-30 10:59:14'),
(101, 6, 14, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1oatKncLfTcKK2K1m9MkS4hOIgdGrqyYb\\/view?usp=drivesdk\"]', 'csyuc-back-as-immortal-lord-14', NULL, '2026-01-30 11:07:22', '2026-01-30 11:07:22'),
(102, 6, 16, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/16Lm0V8l7nABpNNo6nvTP0zY7BZU7nM87\\/view?usp=drivesdk\"]', 'cfbh9-back-as-immortal-lord-16', NULL, '2026-01-30 11:27:12', '2026-01-30 11:27:12'),
(103, 6, 15, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1pdmamQY5MzsyKyXMlAlQMCJ4BcyTa70f\\/view?usp=drivesdk\"]', '92nvi-back-as-immortal-lord-15', NULL, '2026-01-30 11:44:37', '2026-01-30 11:44:37'),
(104, 13, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Q8Z5lfV0y4MQsSDFBKbZu7ieznbbQdUP\\/view?usp=drivesdk\"]', 'mc7kz-way-of-choices-1', NULL, '2026-01-30 20:13:06', '2026-01-30 20:13:06'),
(105, 13, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1pcvXwl4LiLyL9MmLskWESqXDG8KRTjs5\\/view?usp=drivesdk\"]', 'v8jrf-way-of-choices-2', NULL, '2026-01-30 20:29:54', '2026-01-30 20:29:54'),
(106, 13, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/10oKDL6QJXxExVxVLfokIp2NNJ6r2yrQb\\/view?usp=drivesdk\"]', 'cz7h4-way-of-choices-3', NULL, '2026-01-30 20:45:22', '2026-01-30 20:45:22'),
(107, 14, 183, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1l62zcMRul8NukEwuVupdNPhxpPXvTySn\\/view?usp=drivesdk\"]', 'tzqxi-battle-through-the-heavens-season-5-183', 1, '2026-01-31 03:22:43', '2026-01-31 03:22:43'),
(108, 14, 182, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1yWNQsGbROtKEOdQxZlMNNbyM3IgPbERa\\/view?usp=drivesdk\"]', 'gkn4y-battle-through-the-heavens-season-5-182', 1, '2026-01-31 03:23:16', '2026-01-31 03:23:16'),
(109, 14, 181, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1oh8vLCiDOwOrzR0GggZvKkDYOVAl3p9_\\/view?usp=drivesdk\"]', 'drdit-battle-through-the-heavens-season-5-181', 1, '2026-01-31 03:23:34', '2026-01-31 03:23:34'),
(110, 14, 180, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11P6tWGZTWLIXz-Fr9TpdIij-2E7ziewz\\/view?usp=drivesdk\"]', 'tn2yi-battle-through-the-heavens-season-5-180', 1, '2026-01-31 03:25:44', '2026-01-31 03:25:44'),
(111, 14, 179, '[]', '4zsl5-battle-through-the-heavens-season-5-179', 1, '2026-01-31 03:26:03', '2026-01-31 03:26:03'),
(112, 14, 178, '[]', '1mqge-battle-through-the-heavens-season-5-178', 1, '2026-01-31 03:26:17', '2026-01-31 03:26:17'),
(113, 14, 177, '[]', 'ru9fr-battle-through-the-heavens-season-5-177', 1, '2026-01-31 03:27:33', '2026-01-31 03:27:33'),
(114, 14, 176, '[]', 'di0qr-battle-through-the-heavens-season-5-176', 1, '2026-01-31 03:27:53', '2026-01-31 03:27:53'),
(115, 14, 184, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/13ZaLG97xzmMVPpAwPMVsAQ95-CJl4tEm\\/view?usp=drivesdk\"]', '33pcx-battle-through-the-heavens-season-5-184', NULL, '2026-01-31 03:46:45', '2026-01-31 03:46:45'),
(116, 8, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1-RchatmuKND2jOnjEzb5ifsIiSZhgcXr\\/view?usp=drivesdk\"]', 'su1o1-ascendants-of-the-nine-suns-12', 1, '2026-01-31 10:45:00', '2026-01-31 10:45:00'),
(117, 8, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1q4rJICcGuDDX1BoOZeYLZFGPOM5E04Za\\/view?usp=drivesdk\"]', 'qw2e2-ascendants-of-the-nine-suns-11', 1, '2026-01-31 10:45:23', '2026-01-31 10:45:23'),
(118, 8, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11Wp7M_ufEK_8iRsywnU_fJHe2fKUTwTn\\/view?usp=drivesdk\"]', 'wlf7l-ascendants-of-the-nine-suns-10', 1, '2026-01-31 10:45:47', '2026-01-31 10:45:47'),
(119, 8, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1O2Mhv36and7RxDEYuzu9Ri99V8pn7_QY\\/view?usp=drivesdk\"]', 'ideuj-ascendants-of-the-nine-suns-9', 1, '2026-01-31 10:46:08', '2026-01-31 10:46:08'),
(120, 8, 8, '[]', 'kpx1o-ascendants-of-the-nine-suns-8', 1, '2026-01-31 10:46:25', '2026-01-31 10:46:25'),
(121, 8, 7, '[]', 'ednbn-ascendants-of-the-nine-suns-7', 1, '2026-01-31 10:46:37', '2026-01-31 10:46:37'),
(122, 8, 6, '[]', 'yiagn-ascendants-of-the-nine-suns-6', 1, '2026-01-31 10:47:02', '2026-01-31 10:47:02'),
(123, 8, 5, '[]', 'iojua-ascendants-of-the-nine-suns-5', 1, '2026-01-31 10:47:12', '2026-01-31 10:47:12'),
(124, 15, 144, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ItEFDMZGmFy5zdQuReiuAJpUgyogNPEl\\/view?usp=drivesdk\"]', '80wsk-urban-miracle-doctor-144', 1, '2026-01-31 10:58:44', '2026-01-31 11:18:51'),
(125, 15, 143, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1QFpxhM7FFGgmLa27fstZQ9k2haUVH77F\\/view?usp=drivesdk\"]', 'xjgn4-urban-miracle-doctor-143', 1, '2026-01-31 10:59:15', '2026-01-31 10:59:15'),
(126, 15, 142, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zulHrysM8TYBb_Hu_uQiVruIGmeC-5El\\/view?usp=drivesdk\"]', 'dd501-urban-miracle-doctor-142', 1, '2026-01-31 10:59:37', '2026-01-31 10:59:37'),
(127, 15, 141, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1v9nOqCIyxbVgBU0KJ7u-0eMNI_O3SRA9\\/view?usp=drivesdk\"]', '6vhzt-urban-miracle-doctor-141', 1, '2026-01-31 10:59:59', '2026-01-31 11:00:08'),
(128, 15, 140, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1tv4oRFZqMXTquKxc76dIvec5OoyYARf3\\/view?usp=drivesdk\"]', 'r32ul-urban-miracle-doctor-140', 1, '2026-01-31 11:00:37', '2026-01-31 11:07:09'),
(129, 15, 139, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/15coy6qfl88GkgabjpODdKn4jooYHYlhp\\/view?usp=drivesdk\"]', '3eq7r-urban-miracle-doctor-139', 1, '2026-01-31 11:01:06', '2026-01-31 11:01:06'),
(130, 15, 138, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1uVoIBtUNboy0miaa93FC8MuB79Dn_8pX\\/view?usp=drivesdk\"]', '5jvq6-urban-miracle-doctor-138', 1, '2026-01-31 11:01:25', '2026-01-31 11:01:25'),
(131, 15, 137, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/17ccLKMH2jtqOK_eELXuAu0mrL4shM0P3\\/view?usp=drivesdk\"]', 'tc75h-urban-miracle-doctor-137', 1, '2026-01-31 11:01:54', '2026-01-31 11:01:54'),
(132, 15, 136, '[]', 'eqdeg-urban-miracle-doctor-136', 1, '2026-01-31 11:02:29', '2026-01-31 11:02:29'),
(133, 15, 135, '[]', 'o3fq9-urban-miracle-doctor-135', 1, '2026-01-31 11:02:45', '2026-01-31 11:02:45'),
(134, 15, 134, '[]', 'uufoo-urban-miracle-doctor-134', 1, '2026-01-31 11:03:03', '2026-01-31 11:03:03'),
(135, 15, 133, '[]', '7e6wd-urban-miracle-doctor-133', 1, '2026-01-31 11:03:11', '2026-01-31 11:03:11'),
(136, 15, 132, '[]', 'gqxbg-urban-miracle-doctor-132', 1, '2026-01-31 11:03:26', '2026-01-31 11:03:26'),
(137, 15, 131, '[]', '8pmev-urban-miracle-doctor-131', 1, '2026-01-31 11:03:41', '2026-01-31 11:03:41'),
(138, 15, 130, '[]', 'juexr-urban-miracle-doctor-130', 1, '2026-01-31 11:03:58', '2026-01-31 11:03:58'),
(139, 15, 129, '[]', 'k2tsz-urban-miracle-doctor-129', 1, '2026-01-31 11:04:24', '2026-01-31 11:04:24'),
(140, 15, 128, '[]', 'oqacj-urban-miracle-doctor-128', 1, '2026-01-31 11:04:44', '2026-01-31 11:04:44'),
(142, 4, 1, '[]', 'dde6n-renegade-immortal-battle-of-gods-1', 1, '2026-01-31 17:26:35', '2026-01-31 17:26:35'),
(143, 17, 52, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/15bCxsnkbMY2VLQ2G5Q4uFczWeMNHJM1s\\/view?usp=drivesdk\"]', 'b1xzm-martial-conqueror-of-the-cosmos-52', NULL, '2026-01-31 17:50:01', '2026-01-31 17:50:01'),
(144, 18, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1gDlIC4PBM9M0ZDozOoZFZjnfYn8zL8FY\\/view?usp=drivesdk\"]', 'md284-beyond-times-gaze-6', 1, '2026-01-31 18:54:35', '2026-01-31 18:54:35'),
(145, 18, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1U-7sC-V3AtNUNVO6gYejtGhbi_YWBolf\\/view?usp=drivesdk\"]', 'ynjil-beyond-times-gaze-5', 1, '2026-01-31 18:55:01', '2026-01-31 18:55:01'),
(146, 18, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/14XvB9KEP6PPqWTTWd6tGvZhoW3n_rwJs\\/view?usp=drivesdk\"]', 'ghqqr-beyond-times-gaze-4', 1, '2026-01-31 18:55:25', '2026-01-31 18:55:25'),
(147, 18, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1MgFk5-JtwZ8VZJ6PJopTdlxjKk8FVgrL\\/view?usp=drivesdk\"]', 'xcxk4-beyond-times-gaze-3', 1, '2026-01-31 18:57:14', '2026-01-31 18:57:14'),
(148, 18, 2, '[]', 'kt3xn-beyond-times-gaze-2', 1, '2026-01-31 18:57:43', '2026-01-31 18:57:43'),
(149, 18, 1, '[]', 'u3in3-beyond-times-gaze-1', 1, '2026-01-31 18:57:56', '2026-01-31 18:57:56'),
(150, 18, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/10jw_7_H8sz-ObPUVxs3i_Eogh0pCOHst\\/view?usp=drivesdk\"]', 'swlxr-beyond-times-gaze-7', NULL, '2026-01-31 18:58:12', '2026-01-31 18:58:12'),
(151, 19, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1SSfCZjuYTs_bD-opcu2wbtHdhGg7RF7C\\/view?usp=drivesdk\"]', 'xzswm-the-daily-life-of-the-immortal-king-5-9', NULL, '2026-01-31 19:11:26', '2026-01-31 19:11:26'),
(152, 16, 68, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1pAcLk4E6ciYye_0ym4j9ioLvaJV06T8C\\/view?usp=drivesdk\"]', 'ooibx-tales-of-herding-gods-68', NULL, '2026-01-31 20:42:26', '2026-01-31 20:42:26'),
(153, 3, 126, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ZybaYqJK2e0FSzNJf1gUsaI6L0er6Q4x\\/view?usp=drivesdk\"]', 'mg6zr-renegade-immortal-126', NULL, '2026-02-01 04:18:42', '2026-02-01 04:18:42'),
(154, 7, 149, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1j3zwsCQX4uLv6avgOy9lsPb2uXJJe3UM\\/view?usp=drivesdk\"]', 'cwqmj-lingwu-continent-149', NULL, '2026-02-01 17:47:20', '2026-02-01 17:47:20'),
(155, 8, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1hkNVU8nC5mJHs3SmGmA1m482d9Qy4Dsr\\/view?usp=drivesdk\"]', 'x787g-ascendants-of-the-nine-suns-4', NULL, '2026-02-01 18:08:47', '2026-02-01 18:08:47'),
(156, 8, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1lk3L6ypUp2GjBc9OWJUK09Ys2TvPBKgw\\/view?usp=drivesdk\"]', '6yl20-ascendants-of-the-nine-suns-3', NULL, '2026-02-01 18:12:05', '2026-02-01 18:12:05'),
(157, 8, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1HaM0lmkdT2IBZ1emAThmA1liGdlj3dsu\\/view?usp=drivesdk\"]', 'kgdyn-ascendants-of-the-nine-suns-2', NULL, '2026-02-01 18:15:11', '2026-02-01 18:15:11'),
(158, 8, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1LTa3jUesBiRiidR_F4UkO0AE1akc2ZwE\\/view?usp=drivesdk\"]', 'opexh-ascendants-of-the-nine-suns-1', NULL, '2026-02-01 18:16:27', '2026-02-01 18:16:27'),
(159, 20, 209, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1bdan45Y_W2Nmfpe2n_dxmThQtRyIFhS1\\/view?usp=drivesdk\"]', 'vjyju-swallowed-star-209', NULL, '2026-02-02 04:30:34', '2026-02-02 04:30:34'),
(160, 21, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/13q9sRn4oyEpTiasn2rT5Y4m_m_J0jWMM\\/view?usp=drivesdk\"]', '74smt-apotheosis-season-3-10', 1, '2026-02-02 04:49:18', '2026-02-02 04:49:18'),
(161, 21, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1YAgb9s5BhV7KKx03TwnzYtOAkfTFLX6d\\/view?usp=drivesdk\"]', 'sotk2-apotheosis-season-3-9', 1, '2026-02-02 05:18:59', '2026-02-02 05:18:59'),
(162, 21, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1m1jXZF-A4jsWmXXNzCw-H4TNKgJwsYaD\\/view?usp=drivesdk\"]', 'y8yeu-apotheosis-season-3-8', 1, '2026-02-02 05:19:21', '2026-02-02 05:19:21'),
(163, 21, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1qHvQt6X4lKOJ969DeDz4_dwQ7D0V2kRy\\/view?usp=drivesdk\"]', '3mmi5-apotheosis-season-3-7', 1, '2026-02-02 05:19:51', '2026-02-02 05:19:51'),
(164, 21, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1tKSLmgAQRsuwt9ImO__p4JxoTPAAIHem\\/view?usp=drivesdk\"]', '7anwq-apotheosis-season-3-6', 1, '2026-02-02 05:20:06', '2026-02-02 05:20:06'),
(165, 21, 5, '[]', 'ldipr-apotheosis-season-3-5', 1, '2026-02-02 05:40:07', '2026-02-02 05:40:07'),
(166, 21, 4, '[]', 'jpsfj-apotheosis-season-3-4', 1, '2026-02-02 05:40:19', '2026-02-02 05:40:19'),
(167, 21, 3, '[]', 'rom3s-apotheosis-season-3-3', 1, '2026-02-02 05:40:32', '2026-02-02 05:40:32'),
(168, 21, 2, '[]', '9lo2b-apotheosis-season-3-2', 1, '2026-02-02 05:40:52', '2026-02-02 05:40:52'),
(169, 21, 1, '[]', 'kyjoh-apotheosis-season-3-1', 1, '2026-02-02 05:44:08', '2026-02-02 05:44:08'),
(170, 22, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1YlIsyVD-SIYRuKF33fJmmaqxSQJR0MV-\\/view?usp=drivesdk\"]', 's8jn7-the-alchemists-rise-12', NULL, '2026-02-02 18:44:59', '2026-02-02 18:44:59'),
(171, 23, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1akc0jKF5I9teVNmEZgB49eCDSirNGun4\\/view?usp=drivesdk\"]', 'wsgfh-sword-and-fairy-3-8', NULL, '2026-02-02 18:50:16', '2026-02-02 18:50:16'),
(172, 23, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ohrn2NCoZVRSkVV8IoaQyAgJmrJTsCeR\\/view?usp=drivesdk\"]', 'f6cbt-sword-and-fairy-3-7', 1, '2026-02-03 01:50:34', '2026-02-03 01:50:34'),
(173, 23, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1WUQiqE0WyIin-yPUzi_LSLHrep0u4klx\\/view?usp=drivesdk\"]', 'j6qix-sword-and-fairy-3-6', 1, '2026-02-03 01:50:52', '2026-02-03 01:50:52'),
(174, 23, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1MK6Hkwo8BZnY4KITaXsKANJVJOi6oxi4\\/view?usp=drivesdk\"]', 'qe74b-sword-and-fairy-3-5', 1, '2026-02-03 01:51:11', '2026-02-03 01:51:11'),
(175, 23, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ijEHuNDTAXvNs7RFX6U_A5isma1TDaQL\\/view?usp=drivesdk\"]', '9mobs-sword-and-fairy-3-4', 1, '2026-02-03 01:51:31', '2026-02-03 01:51:31'),
(176, 23, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1y2D_MVbk13RFCbGGnLRnQz_RauN93DcR\\/view?usp=drive_link\"]', 'uc9vc-sword-and-fairy-3-3', 1, '2026-02-03 01:52:06', '2026-02-03 01:52:06'),
(177, 23, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1eMnSbae1QmbcuSrYECjr4Otvbs0DAC3i\\/view?usp=drive_link\"]', 'imfpo-sword-and-fairy-3-2', 1, '2026-02-03 01:52:24', '2026-02-03 01:52:24'),
(178, 23, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1O6xprqPlgx0HgsgUzM8ZZsSyRc3L3uxu\\/view?usp=drive_link\"]', 'cbczx-sword-and-fairy-3-1', 1, '2026-02-03 01:52:44', '2026-02-03 01:52:44'),
(179, 22, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1s26pEyjuyu_FyXHO7KGlSZ5po8X-ee38\\/view?usp=drivesdk\"]', 'bepr8-the-alchemists-rise-11', 1, '2026-02-03 01:53:50', '2026-02-03 01:53:50'),
(180, 22, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1We_3aOog2LnItODA88O_EAMmEwcP-Sbe\\/view?usp=drivesdk\"]', 'lschf-the-alchemists-rise-10', 1, '2026-02-03 01:54:08', '2026-02-03 01:54:08'),
(181, 22, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Uv42icFmr-G3DVPyXyzC8xR7mpKYASEB\\/view?usp=drivesdk\"]', 'qgzwv-the-alchemists-rise-9', 1, '2026-02-03 01:54:24', '2026-02-03 01:54:24'),
(182, 22, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IwoptGPjezHdMRzO108De-3AvW3ChbdY\\/view?usp=drivesdk\"]', 'hncfl-the-alchemists-rise-8', 1, '2026-02-03 01:54:39', '2026-02-03 01:54:39'),
(183, 22, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/19MlpQYwfdPb1VXY3KupIIyJIFR0PBMU0\\/view?usp=drive_link\"]', 'rft4y-the-alchemists-rise-7', 1, '2026-02-03 01:55:24', '2026-02-03 01:55:24'),
(184, 22, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1842DPBURpZ8Qb5FqkQ0cwam93CUQGWfh\\/view?usp=drive_link\"]', 'yaefe-the-alchemists-rise-6', 1, '2026-02-03 01:55:54', '2026-02-03 01:55:54'),
(185, 22, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1w6ts2LUjlGlFPIWJucmcSXGn5SNMB-w5\\/view?usp=drive_link\"]', 'phdxa-the-alchemists-rise-5', 1, '2026-02-03 01:56:15', '2026-02-03 01:56:15'),
(186, 22, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1grpyD6RZkbwmUkEoaJp7DECasrpr66z0\\/view?usp=drive_link\"]', 'sfzkk-the-alchemists-rise-4', 1, '2026-02-03 01:56:33', '2026-02-03 01:56:33'),
(187, 22, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1rVwlDQRaXJE-RVyUOxWzOH5vLYD7xvvw\\/view?usp=drive_link\"]', 'i7ysf-the-alchemists-rise-3', 1, '2026-02-03 01:56:51', '2026-02-03 01:56:51'),
(188, 22, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1aGqrhhOk8mxtjik3fO6wLGE8HohmTk5E\\/view?usp=drive_link\"]', 'q3j9h-the-alchemists-rise-2', 1, '2026-02-03 01:57:09', '2026-02-03 01:57:09'),
(189, 22, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1U10rp0CP7hBL-xg3c8ZNzRuZo67GFyBo\\/view?usp=drive_link\"]', 'mt6tl-the-alchemists-rise-1', 1, '2026-02-03 01:57:28', '2026-02-03 01:57:28'),
(190, 24, 18, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1R72RS2wnSZr8GfWuSa1El9W07ConaZia\\/view?usp=drivesdk\"]', 'ihykn-divine-manifestation-18', NULL, '2026-02-03 03:18:06', '2026-02-03 03:18:06'),
(191, 24, 17, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/12XonEjAnC938Rx1TwsXv_op9TzbvU8x1\\/view?usp=drivesdk\"]', 'fbihx-divine-manifestation-17', 1, '2026-02-03 03:38:58', '2026-02-03 03:38:58'),
(192, 24, 16, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1uSDnOryAnWccpJVX3l8IRDpR2L2x4afc\\/view?usp=drivesdk\"]', 'uoojd-divine-manifestation-16', 1, '2026-02-03 03:39:12', '2026-02-03 03:39:12'),
(193, 24, 15, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1eB6XbdmktjdNtJ1o4FBr6LIW7VGaf60Q\\/view?usp=drivesdk\"]', '0z1go-divine-manifestation-15', 1, '2026-02-03 03:39:27', '2026-02-03 03:39:27'),
(194, 24, 14, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1WCC5zrdga0rSU-84m9lbgz79ga2OCDjZ\\/view?usp=drivesdk\"]', 'wmv5v-divine-manifestation-14', 1, '2026-02-03 03:39:44', '2026-02-03 03:39:44'),
(195, 24, 13, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1lFFlVt2O6adVTS7j2k5MX8Y3OIrQHm8f\\/view?usp=drive_link\"]', 'tpewv-divine-manifestation-13', 1, '2026-02-03 03:40:15', '2026-02-03 03:40:15'),
(196, 24, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1_jCTbrFpDks3TuYRu8k38IN6WZ-wyiYW\\/view?usp=drive_link\"]', 'epnkd-divine-manifestation-12', 1, '2026-02-03 03:40:31', '2026-02-03 03:40:31'),
(197, 24, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1G3GVnbywMYOtfTzcpkV21omeGniLvhvE\\/view?usp=drive_link\"]', 'vgi3j-divine-manifestation-11', 1, '2026-02-03 03:40:50', '2026-02-03 03:40:50'),
(198, 24, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1v9e6btAP44ZKSu0MmJRxKrhji6CsW5Oq\\/view?usp=drive_link\"]', 'rtaql-divine-manifestation-10', 1, '2026-02-03 03:41:14', '2026-02-03 03:41:14'),
(199, 24, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zk0O3gDi852DaxdpbhnmXzckMvP3ksSp\\/view?usp=drive_link\"]', 'alhot-divine-manifestation-9', 1, '2026-02-03 03:41:44', '2026-02-03 03:41:44'),
(200, 24, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1JYXP_jN01F4d7yOTwkRjzzdqY7VtmcJw\\/view?usp=drive_link\"]', 'cadp8-divine-manifestation-7', 1, '2026-02-03 03:42:51', '2026-02-03 03:43:26'),
(201, 24, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1MvMBOwyqPaFpvkZ25meDT7-NGjq5oSo-\\/view?usp=drive_link\"]', '62inx-divine-manifestation-6', 1, '2026-02-03 03:43:11', '2026-02-03 03:43:11'),
(202, 24, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/19qqstLvb1WeBDJV0elQ4Pv5iqnnUQE9T\\/view?usp=drive_link\"]', 'mdieb-divine-manifestation-5', 1, '2026-02-03 03:43:44', '2026-02-03 03:43:44'),
(203, 24, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1WP98xXRynJf9WXeV77-ZEO7wR3GwOSwf\\/view?usp=drive_link\"]', 'iiltf-divine-manifestation-4', 1, '2026-02-03 03:43:59', '2026-02-03 03:43:59'),
(204, 24, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1F61JrQdQIN1anuJ9Yb4a1sAyXZgTqJYl\\/view?usp=drive_link\"]', 'ybrgx-divine-manifestation-3', 1, '2026-02-03 03:44:21', '2026-02-03 03:44:21'),
(205, 24, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1om8VSER90070JW5rJsHggPgpHU_8hR9o\\/view?usp=drive_link\"]', 'vcdbn-divine-manifestation-2', 1, '2026-02-03 03:44:37', '2026-02-03 03:44:37'),
(206, 24, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1079HQNbrXeaEqniCC0_5W9QsJcfSppJC\\/view?usp=drive_link\"]', 'puawp-divine-manifestation-1', 1, '2026-02-03 03:45:01', '2026-02-03 03:45:01'),
(207, 24, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1CjflCetOF39id20VqnVlZzMkjjOy4gnw\\/view?usp=drivesdk\"]', 'cebje-divine-manifestation-8', NULL, '2026-02-03 03:46:45', '2026-02-03 03:46:45'),
(208, 26, 31, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1_YuRcOzaTg5yUa7g-NVpBq_vi1ADILEb\\/view?usp=drivesdk\"]', '7jo8b-purple-river-s2-31', NULL, '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(209, 25, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1soM4YKXwgur1UeVs_Gaue2Arlj0lYgoN\\/view?usp=drivesdk\"]', '7r06y-paw-palaces-12', NULL, '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(210, 25, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1HKY3QUBt_8wBA4L7zhuudqI1Khoxf-rT\\/view?usp=drivesdk\"]', '6zlfs-paw-palaces-11', 1, '2026-02-03 23:55:37', '2026-02-03 23:55:37'),
(211, 25, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1o6Tx02TTyJ41c1hPRmo4vbu-v7kdni6y\\/view?usp=drivesdk\"]', 'w5eko-paw-palaces-10', 1, '2026-02-03 23:55:59', '2026-02-03 23:55:59'),
(212, 25, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1GQmWzh2tK1E04UKuuKfu3oMOL-3omo4D\\/view?usp=drivesdk\"]', 'xldhb-paw-palaces-9', 1, '2026-02-03 23:56:20', '2026-02-03 23:56:20'),
(213, 25, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1FSiGj62hiR8QADIIC5g1Ed9HguwJSjWu\\/view?usp=drivesdk\"]', 'bfo1u-paw-palaces-8', 1, '2026-02-03 23:56:37', '2026-02-03 23:56:37'),
(214, 25, 7, '[]', 'cw4yu-paw-palaces-7', 1, '2026-02-03 23:56:53', '2026-02-03 23:56:53'),
(215, 25, 6, '[]', 'es7bf-paw-palaces-6', 1, '2026-02-03 23:57:07', '2026-02-03 23:57:07'),
(216, 25, 5, '[]', 'sbjh7-paw-palaces-5', 1, '2026-02-03 23:57:20', '2026-02-03 23:57:20'),
(217, 25, 4, '[]', 'qagqr-paw-palaces-4', 1, '2026-02-03 23:57:43', '2026-02-03 23:57:43'),
(218, 25, 3, '[]', '7sk5z-paw-palaces-3', 1, '2026-02-03 23:57:51', '2026-02-03 23:57:51'),
(219, 25, 2, '[]', 'ufvma-paw-palaces-2', 1, '2026-02-03 23:58:03', '2026-02-03 23:58:03'),
(220, 25, 1, '[]', 'h28wz-paw-palaces-1', 1, '2026-02-03 23:58:12', '2026-02-03 23:58:12'),
(221, 27, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11VLTh4QvsVnkaxjKlKjpXtgGW1z76Xik\\/view?usp=drivesdk\"]', 'vkdmj-soul-land-sword-dao-chen-xin-1', NULL, '2026-02-04 00:09:49', '2026-02-04 00:09:49'),
(222, 3, 123, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1HdNtByITzPwvAOy3x8NzbWr0PTn7x9Ra\\/view?usp=drivesdk\"]', 'wyhc0-renegade-immortal-123', 1, '2026-02-04 00:13:58', '2026-02-04 00:13:58'),
(223, 3, 122, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11YpYgV72ZUCp76BBmsBYS7PsItD1JceV\\/view?usp=drivesdk\"]', '7aqvh-renegade-immortal-122', 1, '2026-02-04 00:14:19', '2026-02-04 00:14:19'),
(224, 3, 121, '[]', 't1zgp-renegade-immortal-121', 1, '2026-02-04 00:14:34', '2026-02-04 00:14:34'),
(225, 3, 120, '[]', 'xfp3z-renegade-immortal-120', 1, '2026-02-04 00:14:53', '2026-02-04 00:14:53'),
(226, 3, 119, '[]', 've98r-renegade-immortal-119', 1, '2026-02-04 00:15:08', '2026-02-04 00:15:08'),
(227, 3, 118, '[]', 'sxb3k-renegade-immortal-118', 1, '2026-02-04 00:15:23', '2026-02-04 00:15:23'),
(228, 3, 117, '[]', '13b7m-renegade-immortal-117', 1, '2026-02-04 00:15:37', '2026-02-04 00:15:37'),
(229, 28, 26, '[]', 'yvr6h-eclipse-of-illusion-26', 1, '2026-02-04 00:22:54', '2026-02-04 00:22:54'),
(230, 28, 25, '[]', 'nwzre-eclipse-of-illusion-25', 1, '2026-02-04 00:23:09', '2026-02-04 00:23:09'),
(231, 28, 24, '[]', 'sn54n-eclipse-of-illusion-24', 1, '2026-02-04 00:23:17', '2026-02-04 00:23:17'),
(232, 28, 23, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1eIflGWPe_dEM88ebj5F8vj0fUXHINaK-\\/view?usp=drivesdk\"]', 'e0ixi-eclipse-of-illusion-23', NULL, '2026-02-04 00:27:17', '2026-02-04 00:27:17'),
(233, 28, 22, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1BIeiN-uKcHGDCdxjQqdy1jhx8dyu2-Ek\\/view?usp=drivesdk\"]', 'opplv-eclipse-of-illusion-22', NULL, '2026-02-04 00:28:01', '2026-02-04 00:28:01'),
(234, 28, 21, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1oDZiYv0TJ7Lp6BS9dJaYFUUdQWEYibGH\\/view?usp=drivesdk\"]', '5qg4v-eclipse-of-illusion-21', NULL, '2026-02-04 00:30:23', '2026-02-04 00:30:23'),
(235, 28, 20, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1GzEZQm-zeh8gQdj3Y9KqYlCMWoiOCwk9\\/view?usp=drivesdk\"]', 'sxlf1-eclipse-of-illusion-20', NULL, '2026-02-04 00:30:54', '2026-02-04 00:30:54'),
(236, 28, 19, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Xts-qkCWi9g8Z0iTo5cKEX-yMNuAKMOC\\/view?usp=drivesdk\"]', 'ah0rs-eclipse-of-illusion-19', NULL, '2026-02-04 00:31:32', '2026-02-04 00:31:32'),
(237, 28, 18, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1cPXKOz1Bt95UoWJ43mx1NHFF3ue6BizM\\/view?usp=drivesdk\"]', 'moblf-eclipse-of-illusion-18', NULL, '2026-02-04 00:33:42', '2026-02-04 00:33:42'),
(238, 28, 17, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ebiJmDnP7tSm-9-XP-vsMBnG7ibtSbxC\\/view?usp=drivesdk\"]', 'dbqas-eclipse-of-illusion-17', NULL, '2026-02-04 00:33:51', '2026-02-04 00:33:51'),
(239, 28, 15, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1lHxmISSCIfm9jxQYfQwIh4FlASuej1F1\\/view?usp=drivesdk\"]', 'uzcoz-eclipse-of-illusion-15', NULL, '2026-02-04 00:35:19', '2026-02-04 00:35:19'),
(240, 28, 16, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1NFyIsCfFEbUKYck2GR4gny2GS4goCtAk\\/view?usp=drivesdk\"]', 'gwek3-eclipse-of-illusion-16', NULL, '2026-02-04 00:35:37', '2026-02-04 00:35:37'),
(241, 28, 14, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1BXxXAMTg2QjJ2C6UmfSjPsQUEgrT_qsv\\/view?usp=drivesdk\"]', 'pmjtp-eclipse-of-illusion-14', NULL, '2026-02-04 00:37:03', '2026-02-04 00:37:03'),
(242, 28, 13, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1LdkRt1IpPoJOVx0q2y8O-AboK4xMNgGq\\/view?usp=drivesdk\"]', 'yvhn5-eclipse-of-illusion-13', NULL, '2026-02-04 00:37:12', '2026-02-04 00:37:12'),
(243, 28, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Oo57N6t21QQk9b2XYREKLflOvU2nib-t\\/view?usp=drivesdk\"]', 'mfhi8-eclipse-of-illusion-12', NULL, '2026-02-04 00:40:08', '2026-02-04 00:40:08'),
(244, 28, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1thuuA6gv4OBiZ15WGP9XscTWi-ZB77JD\\/view?usp=drivesdk\"]', 'yoszk-eclipse-of-illusion-11', NULL, '2026-02-04 01:09:15', '2026-02-04 01:09:15'),
(245, 28, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1t_khKfgMLof0g8sChEI3C7jXbpDLQD-f\\/view?usp=drivesdk\"]', '6h51z-eclipse-of-illusion-10', NULL, '2026-02-04 01:09:38', '2026-02-04 01:09:38'),
(246, 28, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1HwjKR8z9qeLZvQF0-cN95v-BQv_k0ztB\\/view?usp=drivesdk\"]', 'tlbim-eclipse-of-illusion-8', NULL, '2026-02-04 01:59:50', '2026-02-04 01:59:50'),
(247, 28, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1AYLCXp7BUYqJ35UHvNY-R3GuPewiRdE9\\/view?usp=drivesdk\"]', 'mu6tk-eclipse-of-illusion-9', NULL, '2026-02-04 02:00:05', '2026-02-04 02:00:05'),
(248, 28, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1FFfj3wYXIycquL0odeZC27edPdb-MH5o\\/view?usp=drivesdk\"]', '3mx75-eclipse-of-illusion-6', NULL, '2026-02-04 02:02:22', '2026-02-04 02:02:22'),
(249, 28, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1kHHBufTrYIqmiaEFGrcWJ4FfUFemUrB1\\/view?usp=drivesdk\"]', 'is5xu-eclipse-of-illusion-7', NULL, '2026-02-04 02:02:32', '2026-02-04 02:02:32'),
(250, 28, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Dc5L6nwUBmJF5EnGw_06U_ZmALpie0gz\\/view?usp=drivesdk\"]', 'e87w5-eclipse-of-illusion-5', NULL, '2026-02-04 02:03:53', '2026-02-04 02:03:53'),
(251, 28, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/10tuHLW1buShIgtShFyPYfUKVru5P0E6Y\\/view?usp=drivesdk\"]', 'njsej-eclipse-of-illusion-4', NULL, '2026-02-04 02:03:59', '2026-02-04 02:03:59'),
(252, 29, 197, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18tbXsagmKSCg8BbcQHcJGz7WtrSH6koi\\/view?usp=drivesdk\"]', '7iejk-throne-of-seal-2nd-season-197', NULL, '2026-02-04 04:35:31', '2026-02-04 04:35:31'),
(254, 3, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/15UBQDr9K49hjNOs3Hm7-rBPp0dlEMgIw\\/view?usp=drivesdk\"]', 'jmzob-renegade-immortal-1', NULL, '2026-02-04 09:29:13', '2026-02-04 09:29:13'),
(255, 3, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1lwwZLWabjQHSal2pX7ELmnL0t_MXM2CD\\/view?usp=drivesdk\"]', 'tezl7-renegade-immortal-2', NULL, '2026-02-04 09:46:23', '2026-02-04 09:46:23'),
(256, 3, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/14R2cjEtZIF02Y4MkU2jxBEWg67QvcT0R\\/view?usp=drivesdk\"]', 'lhpoi-renegade-immortal-3', NULL, '2026-02-04 10:17:13', '2026-02-04 10:17:13'),
(257, 3, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1C59kSeHpjeQsLy0dfvt0oPXQ_wzJaDMr\\/view?usp=drivesdk\"]', 'mqaky-renegade-immortal-4', NULL, '2026-02-04 10:53:25', '2026-02-04 10:53:25'),
(258, 3, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1o03h6PMA-p2jCEbQZ6B3FOFU0Rt43TyG\\/view?usp=drivesdk\"]', 'curgd-renegade-immortal-5', NULL, '2026-02-04 11:22:22', '2026-02-04 11:22:22'),
(259, 3, 6, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1b8fQLpyy2W5dY9jiOs23xQjrTcDE3vWw\\/view?usp=drivesdk\"]', '36ivs-renegade-immortal-6', 1, '2026-02-04 11:51:54', '2026-02-04 17:21:36'),
(260, 3, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1qsIYtY5ZjqPFNCi0xA0dgh1jfqQ2QIJM\\/view?usp=drivesdk\"]', 'nndrg-renegade-immortal-7', 1, '2026-02-04 12:21:38', '2026-02-05 07:16:30'),
(261, 3, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1pt8Aw1v3FwXD4o41m8vVEWyccQdC8cY3\\/view?usp=drivesdk\"]', 'nsv7l-renegade-immortal-8', NULL, '2026-02-04 12:50:59', '2026-02-04 12:50:59'),
(262, 3, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1mFBXRuQJGj8qqYqOO1wjqGjynIKIJqRI\\/view?usp=drivesdk\"]', 'zpxiy-renegade-immortal-9', NULL, '2026-02-04 13:19:02', '2026-02-04 13:19:02'),
(263, 3, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1nXCfQt-KD7BF7T_Q0OJ6Ldcxplst-thq\\/view?usp=drivesdk\"]', 'bte3v-renegade-immortal-10', NULL, '2026-02-04 13:48:45', '2026-02-04 13:48:45'),
(264, 3, 11, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1LoFqdHZt2S68qScFsIHOc558HRPiCUPS\\/view?usp=drivesdk\"]', 'xorqy-renegade-immortal-11', 1, '2026-02-04 14:18:20', '2026-02-06 02:13:51'),
(265, 3, 12, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Lqk2kt3cWr8JvbbmLmL7DLeFjTPEt0iN\\/view?usp=drivesdk\"]', 'iyz78-renegade-immortal-12', 1, '2026-02-04 14:47:15', '2026-02-06 02:14:50'),
(266, 3, 13, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1GtApwxwI2zBGqQhZMmK-4kq_jvZjZ7Lp\\/view?usp=drivesdk\"]', '9vmbn-renegade-immortal-13', 1, '2026-02-04 15:16:22', '2026-02-06 02:15:27'),
(267, 3, 14, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1T4boggA5BLItpCe5OZEs0wOvdnZ0aYVv\\/view?usp=drivesdk\"]', 'yljxc-renegade-immortal-14', NULL, '2026-02-04 15:44:52', '2026-02-04 15:44:52'),
(268, 3, 15, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1i5GAxkXJxj6e21fICtr1ULtVbUA9LeXZ\\/view?usp=drivesdk\"]', 'uhg7j-renegade-immortal-15', 1, '2026-02-04 16:15:16', '2026-02-06 02:16:42'),
(269, 3, 16, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1abryZtLDm7q6ir9q7leyRTHFPO4AuxOn\\/view?usp=drivesdk\"]', 'nzmk1-renegade-immortal-16', 1, '2026-02-04 16:43:17', '2026-02-06 02:17:53'),
(270, 3, 17, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1XfJPgaJ7XxKXRGLiAscMPmgaRPrTHevu\\/view?usp=drivesdk\"]', 'myv9v-renegade-immortal-17', NULL, '2026-02-04 17:12:58', '2026-02-04 17:12:58'),
(271, 17, 53, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1mAevqzycp5QtXoujpSVR2E3akaTEmgYF\\/view?usp=drivesdk\"]', 'wdl8z-martial-conqueror-of-the-cosmos-53', NULL, '2026-02-04 18:20:52', '2026-02-04 18:20:52'),
(272, 30, 9, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zp7ytt34fM_tJ0tjxpgVNRyPdt4PwRUa\\/view?usp=drivesdk\"]', 'th4gk-sword-of-coming-s2-9', NULL, '2026-02-04 18:31:28', '2026-02-04 18:31:28'),
(273, 3, 18, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1yEILe-G3M1CEcBWru7UoyNlNqlTKil7S\\/view?usp=drivesdk\"]', '7vvza-renegade-immortal-18', 1, '2026-02-04 19:19:27', '2026-02-06 02:18:27'),
(274, 3, 19, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1M3UCxISH6xx_RDWi6FCjJeUXffMmuTnr\\/view?usp=drivesdk\"]', 'nolqf-renegade-immortal-19', NULL, '2026-02-04 19:49:26', '2026-02-04 19:49:26'),
(275, 3, 20, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1L5SlhmZ3sDMuL7ikp-e7afXndIQP_vVS\\/view?usp=drivesdk\"]', 'g02ge-renegade-immortal-20', NULL, '2026-02-04 20:21:22', '2026-02-04 20:21:22'),
(276, 3, 21, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ROPxawwZ5hVcA6DN45br3uD6vc9meJTG\\/view?usp=drivesdk\"]', 'wtpom-renegade-immortal-21', NULL, '2026-02-04 20:52:00', '2026-02-04 20:52:00'),
(277, 3, 22, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1EIQphJD0mlWR49Zht_Y8NoZt4nxhLWCH\\/view?usp=drivesdk\"]', '3kh2z-renegade-immortal-22', 1, '2026-02-04 21:23:05', '2026-02-06 02:17:25'),
(278, 3, 23, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1kvWPkASbx8aQXKczhtjl78qz9cPmSbAl\\/view?usp=drivesdk\"]', 'udlii-renegade-immortal-23', NULL, '2026-02-04 21:55:19', '2026-02-04 21:55:19'),
(279, 28, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11qkNPJxyPMuJdgWphXYT45UIzVg4vhSd\\/view?usp=drivesdk\"]', 'dufxp-eclipse-of-illusion-1', NULL, '2026-02-04 22:05:54', '2026-02-04 22:05:54'),
(280, 28, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1OWYvmH2F0im850z9wCTYM9y3WY7pR9dq\\/view?usp=drivesdk\"]', 'gzdm9-eclipse-of-illusion-2', NULL, '2026-02-04 22:06:45', '2026-02-04 22:06:45'),
(281, 28, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1rbwL1jKHUHS3nNL97SCpyH_42urWTV5l\\/view?usp=drivesdk\"]', 'ndvyk-eclipse-of-illusion-3', NULL, '2026-02-04 22:07:38', '2026-02-04 22:07:38'),
(282, 3, 24, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1CjrtKTUVUb_2_LQU7oGjWFzIJBfe9eEA\\/view?usp=drivesdk\"]', 'k34oe-renegade-immortal-24', NULL, '2026-02-04 22:28:02', '2026-02-04 22:28:02'),
(283, 3, 25, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/12wIZFySStKJoTTxEGeG-e-H8-hjx7D5d\\/view?usp=drivesdk\"]', 'jrxqp-renegade-immortal-25', NULL, '2026-02-04 22:58:59', '2026-02-04 22:58:59'),
(284, 3, 26, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1DZREw_khjJQ1--ypY27NWURWr_gvMOZj\\/view?usp=drivesdk\"]', 'ysuel-renegade-immortal-26', NULL, '2026-02-04 23:41:56', '2026-02-04 23:41:56'),
(285, 3, 27, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/16DOBfE-FuMypkYsJ-QQUPZav9vZfMITN\\/view?usp=drivesdk\"]', 'cy0kp-renegade-immortal-27', NULL, '2026-02-05 00:13:03', '2026-02-05 00:13:03'),
(286, 3, 28, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1uRpcR49zMvuorqKpjmi4wL0MwLWYD4DK\\/view?usp=drivesdk\"]', 'lng8l-renegade-immortal-28', NULL, '2026-02-05 00:43:39', '2026-02-05 00:43:39'),
(287, 3, 29, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1SbQdFxetp9k_QycJaB-o8G6SpC8GvM_9\\/view?usp=drivesdk\"]', 'rknz5-renegade-immortal-29', NULL, '2026-02-05 01:16:55', '2026-02-05 01:16:55'),
(288, 3, 30, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Ozcd61dCa0Dasw3dZ2usUpW-rvpVcnnF\\/view?usp=drivesdk\"]', 'oopem-renegade-immortal-30', NULL, '2026-02-05 01:47:18', '2026-02-05 01:47:18'),
(289, 3, 31, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1KDNfJynnS0UxhGC8O_f1DWPm4FNOYb0H\\/view?usp=drivesdk\"]', 'o3ul8-renegade-immortal-31', NULL, '2026-02-05 02:19:02', '2026-02-05 02:19:02'),
(290, 3, 32, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1JfR5SAS34fv7jr4NnFhqo3RCKqF6-LVn\\/view?usp=drivesdk\"]', 'wn6nh-renegade-immortal-32', NULL, '2026-02-05 02:49:43', '2026-02-05 02:49:43'),
(291, 3, 33, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1s4WHIkKaK7k5SXiQCDCxvATBO9VrcGIu\\/view?usp=drivesdk\"]', 'b7uks-renegade-immortal-33', NULL, '2026-02-05 03:20:03', '2026-02-05 03:20:03'),
(292, 3, 34, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1yM6AuD6t8Eamv7ZP2HbKuLFsiiBPQ8dL\\/view?usp=drivesdk\"]', '3bmuu-renegade-immortal-34', NULL, '2026-02-05 03:52:24', '2026-02-05 03:52:24'),
(293, 31, 254, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1GW-9cFTs3zyBu54v-rSkk6dK7xo5Dftd\\/view?usp=drivesdk\"]', 'je2xf-perfect-world-254', NULL, '2026-02-05 04:06:50', '2026-02-05 04:06:50'),
(294, 3, 35, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1z_7LsLnQfcReOmbo5XorouDJfJ9jhKV5\\/view?usp=drivesdk\"]', 'les9l-renegade-immortal-35', NULL, '2026-02-05 04:24:29', '2026-02-05 04:24:29'),
(295, 3, 36, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1iJeQ6OsHpq2Zs0keYP1gp1mZfEUTbqQo\\/view?usp=drivesdk\"]', 'rw4zu-renegade-immortal-36', NULL, '2026-02-05 04:59:17', '2026-02-05 04:59:17'),
(296, 3, 37, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1abFALU1nqSlWka-pxoVq12yV52BleDJk\\/view?usp=drivesdk\"]', 'lbxae-renegade-immortal-37', NULL, '2026-02-05 05:28:43', '2026-02-05 05:28:43'),
(297, 3, 116, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/11i74wpP80lIuqKc0uZbL5msE6Orq-aKB\\/view?usp=drivesdk\"]', 'a2p1f-renegade-immortal-116', NULL, '2026-02-05 05:35:00', '2026-02-05 05:35:00'),
(298, 3, 115, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18LABYYbyCBGPTuptEukA-2a0Np-P79DE\\/view?usp=drivesdk\"]', 'dygkg-renegade-immortal-115', NULL, '2026-02-05 05:37:10', '2026-02-05 05:37:10'),
(299, 3, 114, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18dE4FBQWYCMvz_ZnwMSgc6nDFz1HFN3t\\/view?usp=drivesdk\"]', 'pleih-renegade-immortal-114', NULL, '2026-02-05 05:37:39', '2026-02-05 05:37:39'),
(300, 3, 113, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1iNEUqT4DRFi7T6aXLoNCg0wAoQIeTmXX\\/view?usp=drivesdk\"]', 'gpijy-renegade-immortal-113', NULL, '2026-02-05 05:45:04', '2026-02-05 05:45:04'),
(301, 3, 112, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1TG5Iw4fS80Dvnu9Zn6-MV9YQuo3v7FS8\\/view?usp=drivesdk\"]', 'dgfxw-renegade-immortal-112', NULL, '2026-02-05 05:45:33', '2026-02-05 05:45:33'),
(302, 3, 111, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1eGR3lZmX2VDvr5IhdHl3N3R9Wrlsw5iz\\/view?usp=drivesdk\"]', 'hhitd-renegade-immortal-111', NULL, '2026-02-05 05:52:40', '2026-02-05 05:52:40'),
(303, 3, 110, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Kky2gBlrSoXMIyKGWPrHswCJoGU4b4jQ\\/view?usp=drivesdk\"]', '2epvo-renegade-immortal-110', NULL, '2026-02-05 05:56:36', '2026-02-05 05:56:36'),
(304, 3, 109, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1RflDFlmfOTt-_2hVoyFx7ntw7d3a9Nqe\\/view?usp=drivesdk\"]', '7f4x2-renegade-immortal-109', NULL, '2026-02-05 06:00:33', '2026-02-05 06:00:33'),
(305, 3, 38, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1HtzoG-3mZwI51wjEGuUm1F6gzhqOu_XD\\/view?usp=drivesdk\"]', 'o5bvq-renegade-immortal-38', NULL, '2026-02-05 06:04:00', '2026-02-05 06:04:00'),
(306, 32, 22, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1tWSM1KvDhXZRmMCZsdtaW0PeOcZLwEJS\\/view?usp=drivesdk\"]', 'vhnh1-wind-driver-in-tang-dynasty-22', 1, '2026-02-05 06:12:07', '2026-02-05 06:12:07'),
(307, 3, 39, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1TDocUSFUShOTW6YmZp9aVduTdE78NwyB\\/view?usp=drivesdk\"]', '4gb9z-renegade-immortal-39', NULL, '2026-02-05 06:35:32', '2026-02-05 06:35:32'),
(308, 3, 40, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/17zR5OQiOJeArkINUahEjjww1GXnyvD2J\\/view?usp=drivesdk\"]', 'teqd8-renegade-immortal-40', NULL, '2026-02-05 07:05:56', '2026-02-05 07:05:56'),
(309, 3, 41, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/17zzrtVGLMPdsD42oXn5k1M3Nx5QLr3rv\\/view?usp=drivesdk\"]', 'xahgh-renegade-immortal-41', NULL, '2026-02-05 07:26:03', '2026-02-05 07:26:03'),
(310, 3, 42, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/126ppnwKM030brL8gMb0s--81pFMzFIEO\\/view?usp=drivesdk\"]', 'cg7xe-renegade-immortal-42', NULL, '2026-02-05 07:54:34', '2026-02-05 07:54:34'),
(311, 3, 43, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1g00WdoKvrFFBVdPKrF8L82yH1GyNI1PE\\/view?usp=drivesdk\"]', 'ergaz-renegade-immortal-43', NULL, '2026-02-05 08:24:37', '2026-02-05 08:24:37'),
(312, 3, 44, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1bOnfzktB2La9_16nAV89G7K-NDfMoRtZ\\/view?usp=drivesdk\"]', 'y1odw-renegade-immortal-44', NULL, '2026-02-05 08:56:07', '2026-02-05 08:56:07'),
(313, 3, 45, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1oReGGmTGPn4I-o7DbcnXk661BxSmNDc5\\/view?usp=drivesdk\"]', 'mqkld-renegade-immortal-45', NULL, '2026-02-05 09:24:55', '2026-02-05 09:24:55'),
(314, 3, 46, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IV5N6KUkmi_00mfbQNXjIcfsY0EJrPfI\\/view?usp=drivesdk\"]', 'zla9e-renegade-immortal-46', NULL, '2026-02-05 09:52:39', '2026-02-05 09:52:39'),
(315, 3, 47, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ePKWfq9Uttg4QxRbPzIP2xwwKjM4XWVS\\/view?usp=drivesdk\"]', '9e8rv-renegade-immortal-47', NULL, '2026-02-05 10:21:46', '2026-02-05 10:21:46'),
(316, 3, 48, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1AlOniNDJAsRrU8ta8rYWfRDXUgjdhaKF\\/view?usp=drivesdk\"]', 'dog7o-renegade-immortal-48', NULL, '2026-02-05 10:52:08', '2026-02-05 10:52:08'),
(317, 3, 49, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1MoeeBXZPDR2baflTJn9LhpbzieeX9TbG\\/view?usp=drivesdk\"]', 'mejzd-renegade-immortal-49', NULL, '2026-02-05 11:20:20', '2026-02-05 11:20:20'),
(318, 3, 50, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Y1Sa5px_FabCYDUz8ayewaaeTkZsLoTf\\/view?usp=drivesdk\"]', 'unbyt-renegade-immortal-50', NULL, '2026-02-05 11:50:31', '2026-02-05 11:50:31'),
(319, 3, 51, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1qayboaRhSx0l85BtKF_U870UuzyD-t3m\\/view?usp=drivesdk\"]', 'rm0dr-renegade-immortal-51', NULL, '2026-02-05 12:21:01', '2026-02-05 12:21:01'),
(320, 3, 52, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18d-VMtKlL63edL3oMPZZRwQjSeyGkuhw\\/view?usp=drivesdk\"]', 'mz4kr-renegade-immortal-52', NULL, '2026-02-05 12:52:28', '2026-02-05 12:52:28'),
(321, 3, 53, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1j68HyK9lctcFGhYy8-9G4QrXWgrU2zgB\\/view?usp=drivesdk\"]', 'lqop1-renegade-immortal-53', NULL, '2026-02-05 13:22:05', '2026-02-05 13:22:05'),
(322, 3, 54, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1KdRoFp3qYXBhY0DCEIm8jTR5fXgdK5Lo\\/view?usp=drivesdk\"]', '08uje-renegade-immortal-54', NULL, '2026-02-05 13:50:41', '2026-02-05 13:50:41'),
(323, 3, 55, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1TuWL4_ARfvEpqT-S_sVnj5ZDbE6eKhid\\/view?usp=drivesdk\"]', 'nhx6c-renegade-immortal-55', NULL, '2026-02-05 14:18:26', '2026-02-05 14:18:26'),
(324, 3, 56, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ALAOfZV_ZzXyH4Rr696EfBCbyfdGllKO\\/view?usp=drivesdk\"]', 'xqaso-renegade-immortal-56', NULL, '2026-02-05 14:46:44', '2026-02-05 14:46:44'),
(325, 3, 57, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IpYG4LEGMpa548Mjds6lrhVbnK_J-XIU\\/view?usp=drivesdk\"]', 'ca4x2-renegade-immortal-57', NULL, '2026-02-05 15:16:27', '2026-02-05 15:16:27'),
(326, 3, 58, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1b96so-3usyp_5mLEDU5tb5sAZXXtqLZL\\/view?usp=drivesdk\"]', 'gvsux-renegade-immortal-58', NULL, '2026-02-05 15:46:37', '2026-02-05 15:46:37'),
(327, 3, 59, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1li_UhqzMHmVm2THvLlkGcs-SHrrPtYPI\\/view?usp=drivesdk\"]', 'ri7s2-renegade-immortal-59', NULL, '2026-02-05 16:19:34', '2026-02-05 16:19:34'),
(328, 3, 60, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1MXvzzdWU_4-jxOIeIoDmXRoqLTwgRys2\\/view?usp=drivesdk\"]', '0rjxk-renegade-immortal-60', NULL, '2026-02-05 16:50:01', '2026-02-05 16:50:01'),
(329, 9, 7, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IIX0DslFuBP-PXH3kzA5LARCE1dxzDE0\\/view?usp=drivesdk\"]', 'utysk-the-great-ruler-2-7', NULL, '2026-02-05 17:22:19', '2026-02-05 17:22:19'),
(330, 7, 150, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1vKHWhJA_Rl9o21Ju3n1bpHoElaf08pmE\\/view?usp=drivesdk\"]', 'ibj7l-lingwu-continent-150', NULL, '2026-02-05 17:43:11', '2026-02-05 17:43:11');
INSERT INTO `episodes` (`id`, `series_id`, `episode_number`, `download_links`, `slug`, `user_id`, `created_at`, `updated_at`) VALUES
(331, 3, 61, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/12T-BndKjlQz02ZHb1wz4Q36lqnFTLiXP\\/view?usp=drivesdk\"]', 'apnsv-renegade-immortal-61', NULL, '2026-02-05 18:18:26', '2026-02-05 18:18:26'),
(332, 5, 28, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1M0lQpN9axTisE-hAluBqVMt1yNnVyA9T\\/view?usp=drivesdk\"]', 'dhlzh-tomb-of-fallen-gods-3rd-season-28', NULL, '2026-02-05 19:06:35', '2026-02-05 19:06:35'),
(333, 3, 62, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1-TtYGZUDYjCUsUEAAR-SbhT32ErtUZVf\\/view?usp=drivesdk\"]', 'mtyvl-renegade-immortal-62', NULL, '2026-02-05 19:29:39', '2026-02-05 19:29:39'),
(334, 3, 63, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1mPB_NoirKvWnHjiildKhszMo-4DOP4Mb\\/view?usp=drivesdk\"]', '6bbg2-renegade-immortal-63', NULL, '2026-02-05 19:59:22', '2026-02-05 19:59:22'),
(335, 3, 64, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Tc950I8PdJHWL8e-yCX3VxXl4UOHVB9C\\/view?usp=drivesdk\"]', '1mmp2-renegade-immortal-64', NULL, '2026-02-05 20:31:04', '2026-02-05 20:31:04'),
(336, 3, 65, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1qzcGmULNtVuuRTALKWFBeYz89hlbyDo2\\/view?usp=drivesdk\"]', '6kghv-renegade-immortal-65', NULL, '2026-02-05 21:02:22', '2026-02-05 21:02:22'),
(337, 3, 66, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1XP-Yy9kq7p7li59NjLq0urzWylVSHPhX\\/view?usp=drivesdk\"]', 'zrhbg-renegade-immortal-66', NULL, '2026-02-05 21:32:59', '2026-02-05 21:32:59'),
(338, 3, 67, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1vFaQwwz0Rl3vAvqoE5HL3IbORd3J4-in\\/view?usp=drivesdk\"]', '3q1op-renegade-immortal-67', NULL, '2026-02-05 22:04:26', '2026-02-05 22:04:26'),
(339, 3, 68, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1qV6ENp4sTUlVk9AqUhomn2EBpwp93oaK\\/view?usp=drivesdk\"]', 's6abe-renegade-immortal-68', NULL, '2026-02-05 22:39:14', '2026-02-05 22:39:14'),
(340, 3, 69, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1W3knDR0yd7o27frRH7haBHHZaGlm0aK5\\/view?usp=drivesdk\"]', 'i5ws1-renegade-immortal-69', NULL, '2026-02-05 23:10:59', '2026-02-05 23:10:59'),
(341, 3, 70, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1_na5FgrSDpiK2qZOil-gwLgWdHdrYeiQ\\/view?usp=drivesdk\"]', 'f1z2e-renegade-immortal-70', NULL, '2026-02-05 23:44:46', '2026-02-05 23:44:46'),
(342, 3, 71, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/124o9clh5NlPydLaF8a8mdLjIQdiD3SkB\\/view?usp=drivesdk\"]', '40w7m-renegade-immortal-71', NULL, '2026-02-06 00:20:28', '2026-02-06 00:20:28'),
(343, 3, 72, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1felnOBgtPoMIHIoeacEydpZ6hk1M-e6U\\/view?usp=drivesdk\"]', 'wg7jh-renegade-immortal-72', NULL, '2026-02-06 00:53:09', '2026-02-06 00:53:09'),
(344, 3, 73, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1oKnHL5GnDIx9hwXUPzai9Gk40-VPUoes\\/view?usp=drivesdk\"]', 'y1wwx-renegade-immortal-73', NULL, '2026-02-06 01:27:01', '2026-02-06 01:27:01'),
(345, 3, 74, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1RUX8nFWyIdfID7XHzHdxc6yIUX3oDpQK\\/view?usp=drivesdk\"]', 'sj5hq-renegade-immortal-74', NULL, '2026-02-06 02:00:57', '2026-02-06 02:00:57'),
(346, 3, 75, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/198OUklCPmz_-7O4-2bsvcBGzzm2QN5B6\\/view?usp=drivesdk\"]', 'bwfst-renegade-immortal-75', NULL, '2026-02-06 02:30:14', '2026-02-06 02:30:14'),
(347, 3, 76, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Jo4cl8cWxaxQEEMSjgxpAJEPdm_mgczG\\/view?usp=drivesdk\"]', 'rren6-renegade-immortal-76', NULL, '2026-02-06 03:03:36', '2026-02-06 03:03:36'),
(348, 3, 77, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18Y_g0fi6ZNCrT7oOPjzW29KCcDg3vLic\\/view?usp=drivesdk\"]', 'fpa0w-renegade-immortal-77', NULL, '2026-02-06 03:34:25', '2026-02-06 03:34:25'),
(349, 10, 139, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1DUDJcIEPyjaG8wFp4moMIEJ66bm2re2m\\/view?usp=drivesdk\"]', 'q2rld-soul-land-2-139', 1, '2026-02-06 04:16:27', '2026-02-06 04:26:03'),
(350, 3, 78, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1N_SpB_q6Pzh83u9DDL4a2l6o2hsw0NBj\\/view?usp=drivesdk\"]', 'oqlhu-renegade-immortal-78', NULL, '2026-02-06 04:32:58', '2026-02-06 04:32:58'),
(351, 3, 79, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1yztyDdInIVrNP3u0FSmm5q8-wiZ_BUIN\\/view?usp=drivesdk\"]', 'tmvuw-renegade-immortal-79', NULL, '2026-02-06 05:09:15', '2026-02-06 05:09:15'),
(352, 11, 10, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1NNfDLI7EbpDHkKL8w0kHq0hOVPMenVSd\\/view?usp=drivesdk\"]', 'gegot-immortality-5-10', 1, '2026-02-06 05:17:31', '2026-02-06 05:19:34'),
(353, 3, 80, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1vaoQTizji4_q692xG0B6DfVk152jpjKX\\/view?usp=drivesdk\"]', 'ablge-renegade-immortal-80', NULL, '2026-02-06 05:46:24', '2026-02-06 05:46:24'),
(354, 3, 81, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1jVnLyy63KSFqvG5LMQ_nJX6bGbkcMCvt\\/view?usp=drivesdk\"]', 'zt33e-renegade-immortal-81', NULL, '2026-02-06 06:20:01', '2026-02-06 06:20:01'),
(355, 3, 82, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1zoSYvyalaHjD13RVW2PCdX9GPw05Vbej\\/view?usp=drivesdk\"]', 'nbhmk-renegade-immortal-82', NULL, '2026-02-06 06:51:35', '2026-02-06 06:51:35'),
(356, 3, 83, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/139aJMvYemLqjb01wZZPNjesA15v2Ode4\\/view?usp=drivesdk\"]', 'umzx5-renegade-immortal-83', NULL, '2026-02-06 07:23:20', '2026-02-06 07:23:20'),
(357, 3, 84, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1b6u5ggMaWhH5pR9_NZ3_o_Qwm5-D53Tb\\/view?usp=drivesdk\"]', 'fxbt1-renegade-immortal-84', NULL, '2026-02-06 07:53:42', '2026-02-06 07:53:42'),
(358, 8, 14, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ZEx3U37AhOepnG5-I0GfqdMHQGAtQVFN\\/view?usp=drivesdk\"]', 'aaclp-ascendants-of-the-nine-suns-14', NULL, '2026-02-06 08:20:50', '2026-02-06 08:20:50'),
(359, 3, 85, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1RsNaKdo37UVQFIapwlFRoPqTADQlfLMI\\/view?usp=drivesdk\"]', 'k0bny-renegade-immortal-85', NULL, '2026-02-06 09:05:19', '2026-02-06 09:05:19'),
(360, 3, 86, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1vKi6RjcfPJkyDH8MrO6PoVgxETEDaLUY\\/view?usp=drivesdk\"]', 'sr42x-renegade-immortal-86', NULL, '2026-02-06 09:35:36', '2026-02-06 09:35:36'),
(361, 3, 87, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/19lPTRg5tULCcL64j1geoeuTT5mrk4zsV\\/view?usp=drivesdk\"]', '50qyn-renegade-immortal-87', NULL, '2026-02-06 10:05:45', '2026-02-06 10:05:45'),
(362, 3, 88, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1V4clZuvex52jfWSoEJB_5TOzpF6tpF-Z\\/view?usp=drivesdk\"]', 'xqaep-renegade-immortal-88', NULL, '2026-02-06 10:37:55', '2026-02-06 10:37:55'),
(363, 3, 89, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1DQsTmzOcMllXlT0MJJXG1-Bvb7Ta98eo\\/view?usp=drivesdk\"]', 'g9uuh-renegade-immortal-89', NULL, '2026-02-06 11:09:23', '2026-02-06 11:09:23'),
(364, 3, 90, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18fNiQfOXqsYdjs9-7-NkShOssk1OvzvL\\/view?usp=drivesdk\"]', '5hm3n-renegade-immortal-90', NULL, '2026-02-06 11:41:46', '2026-02-06 11:41:46'),
(365, 3, 91, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IxclFBxTlRyeAWYk3OW-4NlBWAeqRlo5\\/view?usp=drivesdk\"]', 'xtbhw-renegade-immortal-91', NULL, '2026-02-06 12:10:38', '2026-02-06 12:10:38'),
(366, 3, 92, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1-pC7Zu1XDdWQ0RYBTM2Dxby7Oq4GyWD7\\/view?usp=drivesdk\"]', '8flng-renegade-immortal-92', NULL, '2026-02-06 12:44:56', '2026-02-06 12:44:56'),
(367, 13, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/10O8tXKPvj8zf2aykk44tvVSZNi5HJ4xi\\/view?usp=drivesdk\"]', '724xd-way-of-choices-4', NULL, '2026-02-06 17:14:46', '2026-02-06 17:14:46'),
(368, 3, 93, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1s6vrIbhAnVnfFLvrNaj0-ZuyV4RLLqyo\\/view?usp=drivesdk\"]', 'eh9hn-renegade-immortal-93', NULL, '2026-02-06 17:40:33', '2026-02-06 17:40:33'),
(369, 3, 94, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1bK9Sqb8tGCML_H5lBoKUx0QTjRH3LRRQ\\/view?usp=drivesdk\"]', '90xep-renegade-immortal-94', NULL, '2026-02-06 18:10:53', '2026-02-06 18:10:53'),
(370, 9, 5, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1WS8x9Xns8IKWhWHT43RNuuCEcLcqEzQJ\\/view?usp=drivesdk\"]', '9q2ok-the-great-ruler-2-5', 1, '2026-02-06 18:33:12', '2026-02-06 18:33:12'),
(371, 9, 4, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1LAg62ZbNkhYU09rMFx6rd7o7XqbNh16v\\/view?usp=drivesdk\"]', 'h0ebq-the-great-ruler-2-4', 1, '2026-02-06 18:33:28', '2026-02-06 18:33:28'),
(372, 9, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1Uo1_B7sz2vTChxsnNQk8aGtLge_9QNMH\\/view?usp=drivesdk\"]', '5aaf7-the-great-ruler-2-3', 1, '2026-02-06 18:33:49', '2026-02-06 18:33:49'),
(373, 9, 2, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/197YSLd_pa_5wxDdRWy1PU2F3Robi0Axa\\/view?usp=drivesdk\"]', 'cz3he-the-great-ruler-2-2', 1, '2026-02-06 18:34:07', '2026-02-06 18:34:07'),
(374, 12, 8, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1KhGg06qDHMUw1cILnR-RWEwMShWSz8rc\\/view?usp=drivesdk\"]', 'kddbh-threads-of-fate-a-war-untold-8', NULL, '2026-02-06 18:34:16', '2026-02-06 18:34:16'),
(375, 9, 1, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/13jaA0pI6rpSqtpn1kpcNt7ipSsChsDkY\\/view?usp=drivesdk\"]', 'tgji2-the-great-ruler-2-1', 1, '2026-02-06 18:34:29', '2026-02-06 18:34:29'),
(376, 12, 3, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1uPqxG1nomhJDuW3EJpt0bXqdvvWGKDCC\\/view?usp=drivesdk\"]', 'kompg-threads-of-fate-a-war-untold-3', 1, '2026-02-06 18:35:49', '2026-02-06 18:35:49'),
(377, 12, 2, '[]', 'lgccg-threads-of-fate-a-war-untold-2', 1, '2026-02-06 18:36:09', '2026-02-06 18:36:09'),
(378, 12, 1, '[]', 'j0ld0-threads-of-fate-a-war-untold-1', 1, '2026-02-06 18:36:28', '2026-02-06 18:36:28'),
(379, 3, 95, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1wnMmBciKN5YPCzQtiAWBNYkk6j0eGSjX\\/view?usp=drivesdk\"]', 'dn0uh-renegade-immortal-95', NULL, '2026-02-06 18:44:44', '2026-02-06 18:44:44'),
(380, 3, 96, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/151DErSRX08V_vDgnA5mbLkS3EQ3-sxpx\\/view?usp=drivesdk\"]', '67nri-renegade-immortal-96', NULL, '2026-02-06 19:17:58', '2026-02-06 19:17:58'),
(381, 3, 97, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/16dmDa1mcQ6l1JEyDE4sfao1nZ1Ahi7WJ\\/view?usp=drivesdk\"]', 'pl0db-renegade-immortal-97', NULL, '2026-02-06 19:47:40', '2026-02-06 19:47:40'),
(382, 3, 98, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1DmZv4Iau6xLC5kEjm850fGr1Ckp7Oa8h\\/view?usp=drivesdk\"]', 'hoqre-renegade-immortal-98', NULL, '2026-02-06 20:18:55', '2026-02-06 20:18:55'),
(383, 3, 99, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1SkqniRxGaZFjMjk610vpqcEUY0YuV5V9\\/view?usp=drivesdk\"]', 'fbop5-renegade-immortal-99', NULL, '2026-02-06 20:49:18', '2026-02-06 20:49:18'),
(384, 3, 100, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1djTzeR5yoM_b2UtO44hwBsc6tfWolwhq\\/view?usp=drivesdk\"]', 'htzak-renegade-immortal-100', NULL, '2026-02-06 21:20:38', '2026-02-06 21:20:38'),
(385, 3, 101, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1389Bu0lERSnkQLLBPX5NT8XzW1PTQbc0\\/view?usp=drivesdk\"]', 'jxnl0-renegade-immortal-101', NULL, '2026-02-06 21:51:20', '2026-02-06 21:51:20'),
(386, 3, 102, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1ehVTgfhfE_AJS4VF8Qtir5W34j_howx4\\/view?usp=drivesdk\"]', 'tkylv-renegade-immortal-102', NULL, '2026-02-06 22:24:06', '2026-02-06 22:24:06'),
(387, 3, 103, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1THbl0MyFlwfQqNw_6bZmWGeWMgNBMcyg\\/view?usp=drivesdk\"]', 'v8d26-renegade-immortal-103', NULL, '2026-02-06 22:57:24', '2026-02-06 22:57:24'),
(388, 3, 104, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1VgGsQKx-IKs8vcM7aYmzXloHuPlxBBiN\\/view?usp=drivesdk\"]', '4oads-renegade-immortal-104', NULL, '2026-02-06 23:28:08', '2026-02-06 23:28:08'),
(389, 3, 105, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1RIIUOuuk5wHylX2iuCL_2_YLjUajXO0f\\/view?usp=drivesdk\"]', 'zpd6e-renegade-immortal-105', NULL, '2026-02-06 23:57:47', '2026-02-06 23:57:47'),
(390, 3, 106, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1IkZTrj41zWEx3EV8VOjrbbQ10TpPHUOb\\/view?usp=drivesdk\"]', 'mox42-renegade-immortal-106', NULL, '2026-02-07 00:29:10', '2026-02-07 00:29:10'),
(391, 15, 145, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1YV1pyqXtr9V5ad0dvk8J2Xa7pwK2hjDQ\\/view?usp=drivesdk\"]', 'xvxxr-urban-miracle-doctor-145', NULL, '2026-02-07 00:36:10', '2026-02-07 00:36:10'),
(392, 15, 146, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1pWVX6vFTIcxZRYvAv0tCWQxuslKdEBwP\\/view?usp=drivesdk\"]', 'pxxhg-urban-miracle-doctor-146', NULL, '2026-02-07 00:36:40', '2026-02-07 00:36:40'),
(393, 3, 107, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/1AdoTloDJQKgQx-YmrjuAyfFm0JZ2YGFT\\/view?usp=drivesdk\"]', 'cdva8-renegade-immortal-107', NULL, '2026-02-07 00:59:59', '2026-02-07 00:59:59'),
(394, 3, 108, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/17gP3QBsOz_17Tv_RDbuZV4ZpZy43N-61\\/view?usp=drivesdk\"]', 'tso6e-renegade-immortal-108', NULL, '2026-02-07 01:30:12', '2026-02-07 01:30:12'),
(395, 14, 185, '[\"https:\\/\\/drive.google.com\\/file\\/d\\/18cMlMGgTaKpZ1jwiGQLPyiWW465wicnA\\/view?usp=drivesdk\"]', '2rnbf-battle-through-the-heavens-season-5-185', 1, '2026-02-07 03:37:55', '2026-02-07 03:52:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `genres`
--

INSERT INTO `genres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Action', '2026-01-29 07:39:57', '2026-01-29 07:39:57'),
(2, 'Adventure', '2026-01-29 07:44:49', '2026-01-29 07:44:49'),
(3, 'Fantasy', '2026-01-29 07:44:54', '2026-01-29 07:44:54'),
(4, 'Comedy', '2026-01-29 07:44:58', '2026-01-29 07:44:58'),
(5, 'Sci-fi', '2026-01-31 10:50:14', '2026-01-31 10:50:14'),
(6, 'Romance', '2026-02-05 17:17:40', '2026-02-05 17:17:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genre_series`
--

CREATE TABLE `genre_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `series_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `genre_series`
--

INSERT INTO `genre_series` (`id`, `series_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(1, 3, 1, NULL, NULL),
(2, 3, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 4, 2, NULL, NULL),
(6, 4, 3, NULL, NULL),
(7, 5, 1, NULL, NULL),
(8, 5, 2, NULL, NULL),
(9, 5, 3, NULL, NULL),
(10, 6, 1, NULL, NULL),
(11, 6, 2, NULL, NULL),
(12, 6, 3, NULL, NULL),
(13, 7, 1, NULL, NULL),
(14, 7, 2, NULL, NULL),
(15, 7, 3, NULL, NULL),
(16, 8, 1, NULL, NULL),
(17, 8, 2, NULL, NULL),
(18, 8, 3, NULL, NULL),
(19, 9, 1, NULL, NULL),
(20, 9, 2, NULL, NULL),
(21, 9, 3, NULL, NULL),
(22, 10, 1, NULL, NULL),
(23, 10, 2, NULL, NULL),
(24, 10, 3, NULL, NULL),
(25, 11, 1, NULL, NULL),
(26, 11, 2, NULL, NULL),
(27, 11, 3, NULL, NULL),
(28, 12, 1, NULL, NULL),
(29, 12, 2, NULL, NULL),
(30, 12, 3, NULL, NULL),
(31, 13, 1, NULL, NULL),
(32, 13, 2, NULL, NULL),
(33, 13, 3, NULL, NULL),
(34, 14, 1, NULL, NULL),
(35, 14, 2, NULL, NULL),
(36, 14, 3, NULL, NULL),
(37, 15, 1, NULL, NULL),
(38, 15, 2, NULL, NULL),
(39, 15, 3, NULL, NULL),
(40, 15, 5, NULL, NULL),
(41, 16, 1, NULL, NULL),
(42, 16, 2, NULL, NULL),
(43, 16, 3, NULL, NULL),
(44, 17, 1, NULL, NULL),
(45, 17, 2, NULL, NULL),
(46, 17, 3, NULL, NULL),
(47, 18, 1, NULL, NULL),
(48, 18, 2, NULL, NULL),
(49, 18, 3, NULL, NULL),
(50, 19, 2, NULL, NULL),
(51, 19, 4, NULL, NULL),
(52, 19, 3, NULL, NULL),
(53, 20, 1, NULL, NULL),
(54, 20, 2, NULL, NULL),
(55, 20, 3, NULL, NULL),
(56, 20, 5, NULL, NULL),
(57, 21, 1, NULL, NULL),
(58, 21, 2, NULL, NULL),
(59, 21, 3, NULL, NULL),
(60, 22, 1, NULL, NULL),
(61, 22, 2, NULL, NULL),
(62, 22, 3, NULL, NULL),
(63, 23, 1, NULL, NULL),
(64, 23, 2, NULL, NULL),
(65, 23, 3, NULL, NULL),
(66, 24, 1, NULL, NULL),
(67, 24, 2, NULL, NULL),
(68, 24, 3, NULL, NULL),
(69, 25, 1, NULL, NULL),
(70, 25, 2, NULL, NULL),
(71, 26, 1, NULL, NULL),
(72, 26, 2, NULL, NULL),
(73, 26, 3, NULL, NULL),
(74, 27, 1, NULL, NULL),
(75, 27, 2, NULL, NULL),
(76, 27, 3, NULL, NULL),
(77, 28, 1, NULL, NULL),
(78, 28, 3, NULL, NULL),
(79, 29, 1, NULL, NULL),
(80, 29, 2, NULL, NULL),
(81, 29, 3, NULL, NULL),
(82, 30, 1, NULL, NULL),
(83, 30, 2, NULL, NULL),
(84, 30, 3, NULL, NULL),
(85, 31, 1, NULL, NULL),
(86, 31, 2, NULL, NULL),
(87, 31, 3, NULL, NULL),
(88, 32, 1, NULL, NULL),
(89, 32, 2, NULL, NULL),
(90, 32, 3, NULL, NULL),
(91, 9, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `episode_id` bigint(20) UNSIGNED NOT NULL,
  `server_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `links`
--

INSERT INTO `links` (`id`, `episode_id`, `server_id`, `url`, `created_at`, `updated_at`) VALUES
(51, 51, 1, 'https://geo.dailymotion.com/player.html?video=x9yh6sa', '2026-01-29 07:47:13', '2026-01-29 07:47:13'),
(52, 51, 2, 'https://ok.ru/videoembed/11922496424558', '2026-01-29 07:47:13', '2026-01-29 07:47:13'),
(53, 52, 1, 'https://geo.dailymotion.com/player.html?video=x9y09dw', '2026-01-29 07:49:40', '2026-01-29 07:49:40'),
(54, 52, 2, 'https://ok.ru/videoembed/11791673264750', '2026-01-29 07:49:40', '2026-01-29 07:49:40'),
(56, 54, 1, 'https://geo.dailymotion.com/player.html?video=x9sl3ik', '2026-01-29 08:21:47', '2026-01-29 08:21:47'),
(57, 55, 1, 'https://geo.dailymotion.com/player.html?video=x9syr1q', '2026-01-29 08:22:20', '2026-01-29 08:22:20'),
(58, 56, 1, 'https://geo.dailymotion.com/player.html?video=x9tchw8', '2026-01-29 08:22:37', '2026-01-29 08:22:37'),
(59, 57, 1, 'https://geo.dailymotion.com/player.html?video=x9trgn2', '2026-01-29 08:22:48', '2026-01-29 08:22:48'),
(60, 58, 1, 'https://geo.dailymotion.com/player.html?video=x9u5vvo', '2026-01-29 08:23:05', '2026-01-29 08:23:05'),
(61, 59, 1, 'https://geo.dailymotion.com/player.html?video=x9uku2g', '2026-01-29 08:23:19', '2026-01-29 08:23:19'),
(62, 60, 1, 'https://geo.dailymotion.com/player.html?video=x9v329a', '2026-01-29 08:23:33', '2026-01-29 08:23:33'),
(63, 60, 2, 'https://ok.ru/videoembed/11159435479662', '2026-01-29 08:23:45', '2026-01-29 08:23:45'),
(64, 61, 1, 'https://geo.dailymotion.com/player.html?video=x9vjxwa', '2026-01-29 08:24:50', '2026-01-29 08:24:50'),
(65, 61, 2, 'https://ok.ru/videoembed/11244570675822', '2026-01-29 08:24:50', '2026-01-29 08:24:50'),
(66, 62, 1, 'https://geo.dailymotion.com/player.html?video=x9w01am', '2026-01-29 08:25:29', '2026-01-29 08:25:29'),
(67, 62, 2, 'https://ok.ru/videoembed/11337380334190', '2026-01-29 08:25:29', '2026-01-29 08:25:29'),
(68, 63, 1, 'https://geo.dailymotion.com/player.html?video=x9wfi2e', '2026-01-29 08:25:48', '2026-01-29 08:25:48'),
(69, 63, 2, 'https://ok.ru/videoembed/11434824567406', '2026-01-29 08:25:48', '2026-01-29 08:25:48'),
(70, 64, 1, 'https://geo.dailymotion.com/player.html?video=x9wwmxu', '2026-01-29 08:26:07', '2026-01-29 08:26:07'),
(71, 64, 2, 'https://ok.ru/videoembed/11545322719854', '2026-01-29 08:26:07', '2026-01-29 08:26:07'),
(72, 65, 1, 'https://geo.dailymotion.com/player.html?video=x9xe2dk', '2026-01-29 08:26:50', '2026-01-29 08:26:50'),
(73, 65, 2, 'https://ok.ru/videoembed/11640391404142', '2026-01-29 08:26:50', '2026-01-29 08:26:50'),
(74, 66, 1, 'https://geo.dailymotion.com/player.html?video=x9xv9cg', '2026-01-29 08:27:20', '2026-01-29 08:27:20'),
(75, 66, 2, 'https://ok.ru/videoembed/11747718531694', '2026-01-29 08:27:20', '2026-01-29 08:27:20'),
(76, 67, 1, 'https://geo.dailymotion.com/player.html?video=x9ybza0', '2026-01-29 08:27:43', '2026-01-29 08:27:43'),
(77, 67, 2, 'https://ok.ru/videoembed/11877257644654', '2026-01-29 08:27:43', '2026-01-29 08:27:43'),
(78, 68, 1, 'https://geo.dailymotion.com/player.html?video=x9ytqjo', '2026-01-29 21:27:21', '2026-01-29 21:27:21'),
(79, 68, 2, 'https://ok.ru/videoembed/12005019028078', '2026-01-29 21:27:21', '2026-01-29 21:27:21'),
(80, 69, 1, 'https://geo.dailymotion.com/player.html?video=x9ytro0', '2026-01-29 21:28:17', '2026-01-29 21:28:17'),
(81, 69, 2, 'https://ok.ru/videoembed/12005130701422', '2026-01-29 21:28:17', '2026-01-29 21:28:17'),
(82, 70, 1, 'https://geo.dailymotion.com/player.html?video=x9ytw4m', '2026-01-29 21:28:54', '2026-01-29 21:28:54'),
(83, 70, 2, 'https://ok.ru/videoembed/12005579950702', '2026-01-29 21:28:54', '2026-01-29 21:28:54'),
(86, 72, 1, 'https://geo.dailymotion.com/player.html?video=x9yud9y', '2026-01-29 22:57:16', '2026-01-29 22:57:16'),
(87, 72, 2, 'https://ok.ru/videoembed/12009640364654', '2026-01-29 22:57:16', '2026-01-29 22:57:16'),
(88, 73, 1, 'https://geo.dailymotion.com/player.html?video=x9yei3c', '2026-01-29 23:28:12', '2026-01-29 23:28:12'),
(89, 73, 2, 'https://ok.ru/videoembed/11897629117038', '2026-01-29 23:28:12', '2026-01-29 23:28:12'),
(90, 74, 1, 'https://geo.dailymotion.com/player.html?video=x9xxl3w', '2026-01-29 23:29:00', '2026-01-29 23:29:00'),
(91, 74, 2, 'https://ok.ru/videoembed/11766863104622', '2026-01-29 23:29:00', '2026-01-29 23:29:00'),
(92, 75, 1, 'https://geo.dailymotion.com/player.html?video=x9xgyw4', '2026-01-29 23:29:18', '2026-01-29 23:29:18'),
(93, 75, 2, 'https://ok.ru/videoembed/11653765335662', '2026-01-29 23:29:18', '2026-01-29 23:29:18'),
(95, 77, 1, 'https://geo.dailymotion.com/player.html?video=x9yv2f6', '2026-01-30 04:02:41', '2026-01-30 04:02:41'),
(96, 77, 2, 'https://ok.ru/videoembed/12017876273774', '2026-01-30 04:02:41', '2026-01-30 04:02:41'),
(97, 78, 1, 'https://geo.dailymotion.com/player.html?video=x9yv9hg', '2026-01-30 05:32:38', '2026-01-30 05:32:38'),
(98, 78, 2, 'https://ok.ru/videoembed/12019505367662', '2026-01-30 05:32:38', '2026-01-30 05:32:38'),
(99, 79, 1, 'https://geo.dailymotion.com/player.html?video=x9ydh8m', '2026-01-30 05:34:39', '2026-01-30 05:34:39'),
(100, 79, 2, 'https://ok.ru/videoembed/11892228557422', '2026-01-30 05:34:39', '2026-01-30 05:34:39'),
(101, 80, 2, 'https://ok.ru/videoembed/12021004634734', '2026-01-30 06:59:09', '2026-01-30 06:59:09'),
(102, 81, 2, 'https://ok.ru/videoembed/12021158775406', '2026-01-30 07:07:32', '2026-01-30 07:07:32'),
(103, 82, 2, 'https://ok.ru/videoembed/12021671463534', '2026-01-30 07:37:17', '2026-01-30 07:37:17'),
(104, 83, 2, 'https://ok.ru/videoembed/12022044887662', '2026-01-30 07:59:08', '2026-01-30 07:59:08'),
(105, 84, 1, 'https://geo.dailymotion.com/player.html?video=x9yvodc', '2026-01-30 08:24:57', '2026-01-30 08:24:57'),
(106, 84, 2, 'https://ok.ru/videoembed/12022468250222', '2026-01-30 08:24:57', '2026-01-30 08:24:57'),
(107, 85, 2, 'https://ok.ru/videoembed/12022917565038', '2026-01-30 08:53:45', '2026-01-30 08:53:45'),
(108, 86, 2, 'https://ok.ru/videoembed/12023361505902', '2026-01-30 09:22:23', '2026-01-30 09:22:23'),
(109, 87, 2, 'https://ok.ru/videoembed/12023368977006', '2026-01-30 09:22:52', '2026-01-30 09:22:52'),
(110, 88, 1, 'https://geo.dailymotion.com/player.html?video=x9xwhxc', '2026-01-30 09:35:10', '2026-01-30 09:35:10'),
(111, 88, 2, 'https://ok.ru/videoembed/11760891333230', '2026-01-30 09:35:10', '2026-01-30 09:35:10'),
(112, 89, 1, 'https://geo.dailymotion.com/player.html?video=x9xg6au', '2026-01-30 09:35:45', '2026-01-30 09:35:45'),
(113, 89, 2, 'https://ok.ru/videoembed/11650180254318', '2026-01-30 09:35:45', '2026-01-30 09:35:45'),
(114, 90, 2, 'https://ok.ru/videoembed/11552599771758', '2026-01-30 09:36:21', '2026-01-30 09:36:21'),
(115, 91, 1, 'https://geo.dailymotion.com/player.html?video=x9why3e', '2026-01-30 09:36:47', '2026-01-30 09:36:47'),
(116, 91, 2, 'https://ok.ru/videoembed/11452805679726', '2026-01-30 09:36:47', '2026-01-30 09:36:47'),
(117, 92, 1, 'https://geo.dailymotion.com/player.html?video=x9w2wjw', '2026-01-30 09:37:10', '2026-01-30 09:37:10'),
(118, 92, 2, 'https://ok.ru/videoembed/11353027840622', '2026-01-30 09:37:10', '2026-01-30 09:37:10'),
(119, 93, 1, 'https://geo.dailymotion.com/player.html?video=x9w2wke', '2026-01-30 09:37:28', '2026-01-30 09:37:28'),
(120, 93, 2, 'https://ok.ru/videoembed/11353030920814', '2026-01-30 09:37:28', '2026-01-30 09:37:28'),
(121, 94, 2, 'https://ok.ru/videoembed/11353028758126', '2026-01-30 09:37:39', '2026-01-30 09:37:39'),
(122, 95, 2, 'https://ok.ru/videoembed/12023776348782', '2026-01-30 09:52:06', '2026-01-30 09:52:06'),
(123, 96, 2, 'https://ok.ru/videoembed/12023895755374', '2026-01-30 10:00:36', '2026-01-30 10:00:36'),
(124, 97, 2, 'https://ok.ru/videoembed/12024369711726', '2026-01-30 10:40:00', '2026-01-30 10:40:00'),
(125, 98, 2, 'https://ok.ru/videoembed/12024374561390', '2026-01-30 10:40:27', '2026-01-30 10:40:27'),
(126, 99, 2, 'https://ok.ru/videoembed/12024421091950', '2026-01-30 10:44:49', '2026-01-30 10:44:49'),
(127, 100, 2, 'https://ok.ru/videoembed/12024562977390', '2026-01-30 10:59:14', '2026-01-30 10:59:14'),
(128, 101, 2, 'https://ok.ru/videoembed/12024639392366', '2026-01-30 11:07:22', '2026-01-30 11:07:22'),
(129, 102, 2, 'https://ok.ru/videoembed/12024817191534', '2026-01-30 11:27:12', '2026-01-30 11:27:12'),
(130, 103, 2, 'https://ok.ru/videoembed/12024958683758', '2026-01-30 11:44:37', '2026-01-30 11:44:37'),
(131, 104, 1, 'https://geo.dailymotion.com/player.html?video=x9ywvay', '2026-01-30 20:13:06', '2026-01-30 20:13:06'),
(132, 104, 2, 'https://ok.ru/videoembed/12026989185646', '2026-01-30 20:13:06', '2026-01-30 20:13:06'),
(133, 105, 1, 'https://geo.dailymotion.com/player.html?video=x9yww2c', '2026-01-30 20:29:54', '2026-01-30 20:29:54'),
(134, 105, 2, 'https://ok.ru/videoembed/12027143653998', '2026-01-30 20:29:54', '2026-01-30 20:29:54'),
(135, 106, 1, 'https://geo.dailymotion.com/player.html?video=x9ywwqm', '2026-01-30 20:45:22', '2026-01-30 20:45:22'),
(136, 106, 2, 'https://ok.ru/videoembed/12027294190190', '2026-01-30 20:45:22', '2026-01-30 20:45:22'),
(137, 107, 1, 'https://geo.dailymotion.com/player.html?video=x9yf5ra', '2026-01-31 03:22:43', '2026-01-31 03:22:43'),
(138, 107, 2, 'https://ok.ru/videoembed/11903959173742', '2026-01-31 03:22:43', '2026-01-31 03:22:43'),
(139, 108, 2, 'https://ok.ru/videoembed/11773425748590', '2026-01-31 03:23:16', '2026-01-31 03:23:16'),
(140, 109, 2, 'https://ok.ru/videoembed/11659419454062', '2026-01-31 03:23:34', '2026-01-31 03:23:34'),
(141, 110, 2, 'https://ok.ru/videoembed/11561970829934', '2026-01-31 03:25:44', '2026-01-31 03:25:44'),
(142, 111, 2, 'https://ok.ru/videoembed/11457028229742', '2026-01-31 03:26:03', '2026-01-31 03:26:03'),
(143, 112, 2, 'https://ok.ru/videoembed/11355141835374', '2026-01-31 03:26:17', '2026-01-31 03:26:17'),
(144, 113, 2, 'https://ok.ru/videoembed/11264716638830', '2026-01-31 03:27:33', '2026-01-31 03:27:33'),
(145, 114, 2, 'https://ok.ru/videoembed/11177185380974', '2026-01-31 03:27:53', '2026-01-31 03:27:53'),
(146, 115, 1, 'https://geo.dailymotion.com/player.html?video=x9yxjmm', '2026-01-31 03:46:45', '2026-01-31 03:46:45'),
(147, 115, 2, 'https://ok.ru/videoembed/12034109672046', '2026-01-31 03:46:45', '2026-01-31 03:46:45'),
(148, 116, 2, 'https://ok.ru/videoembed/11892926384750', '2026-01-31 10:45:00', '2026-01-31 10:45:00'),
(149, 117, 2, 'https://ok.ru/videoembed/11762924784238', '2026-01-31 10:45:23', '2026-01-31 10:45:23'),
(150, 118, 2, 'https://ok.ru/videoembed/11650017004142', '2026-01-31 10:45:47', '2026-01-31 10:45:47'),
(151, 119, 2, 'https://ok.ru/videoembed/11553497221742', '2026-01-31 10:46:08', '2026-01-31 10:46:08'),
(152, 120, 2, 'https://ok.ru/videoembed/11449745279598', '2026-01-31 10:46:25', '2026-01-31 10:46:25'),
(153, 121, 2, 'https://ok.ru/videoembed/11346807884398', '2026-01-31 10:46:37', '2026-01-31 10:46:37'),
(154, 122, 2, 'https://ok.ru/videoembed/11253309114990', '2026-01-31 10:47:02', '2026-01-31 10:47:02'),
(155, 123, 2, 'https://ok.ru/videoembed/11166632053358', '2026-01-31 10:47:12', '2026-01-31 10:47:12'),
(156, 124, 2, 'https://ok.ru/videoembed/11967472732782', '2026-01-31 10:58:44', '2026-01-31 10:58:44'),
(157, 125, 2, 'https://ok.ru/videoembed/11911717128814', '2026-01-31 10:59:15', '2026-01-31 10:59:15'),
(158, 126, 2, 'https://ok.ru/videoembed/11845247240814', '2026-01-31 10:59:37', '2026-01-31 10:59:37'),
(159, 127, 1, 'https://geo.dailymotion.com/player.html?video=x9xze74', '2026-01-31 10:59:59', '2026-01-31 10:59:59'),
(160, 127, 2, 'https://ok.ru/videoembed/11784454343278', '2026-01-31 10:59:59', '2026-01-31 10:59:59'),
(161, 128, 2, 'https://ok.ru/videoembed/11714122091118', '2026-01-31 11:00:37', '2026-01-31 11:07:09'),
(162, 129, 2, 'https://ok.ru/videoembed/11667234687598', '2026-01-31 11:01:06', '2026-01-31 11:01:06'),
(163, 130, 2, 'https://ok.ru/videoembed/11626765355630', '2026-01-31 11:01:25', '2026-01-31 11:01:25'),
(164, 131, 2, 'https://ok.ru/videoembed/11568523905646', '2026-01-31 11:01:54', '2026-01-31 11:01:54'),
(165, 132, 1, 'https://geo.dailymotion.com/player.html?video=x9wrlm4', '2026-01-31 11:02:29', '2026-01-31 11:02:29'),
(166, 132, 2, 'https://ok.ru/videoembed/11511321725550', '2026-01-31 11:02:29', '2026-01-31 11:02:29'),
(167, 133, 2, 'https://ok.ru/videoembed/11465204435566', '2026-01-31 11:02:45', '2026-01-31 11:02:45'),
(168, 134, 2, 'https://ok.ru/videoembed/11404191402606', '2026-01-31 11:03:03', '2026-01-31 11:03:03'),
(169, 135, 2, 'https://ok.ru/videoembed/11361700416110', '2026-01-31 11:03:11', '2026-01-31 11:03:11'),
(170, 136, 2, 'https://ok.ru/videoembed/11311240841838', '2026-01-31 11:03:26', '2026-01-31 11:03:26'),
(171, 137, 2, 'https://ok.ru/videoembed/11270940789358', '2026-01-31 11:03:41', '2026-01-31 11:03:41'),
(172, 138, 2, 'https://ok.ru/videoembed/11215237810798', '2026-01-31 11:03:58', '2026-01-31 11:03:58'),
(173, 139, 2, 'https://ok.ru/videoembed/11182147439214', '2026-01-31 11:04:24', '2026-01-31 11:04:24'),
(174, 140, 2, 'https://ok.ru/videoembed/11133499935342', '2026-01-31 11:04:44', '2026-01-31 11:04:44'),
(176, 142, 2, 'https://ok.ru/videoembed/12047291452014', '2026-01-31 17:26:35', '2026-01-31 17:26:35'),
(177, 143, 1, 'https://geo.dailymotion.com/player.html?video=x9yyn5e', '2026-01-31 17:50:01', '2026-01-31 17:50:01'),
(178, 143, 2, 'https://ok.ru/videoembed/12047377762926', '2026-01-31 17:50:01', '2026-01-31 17:50:01'),
(179, 144, 2, 'https://ok.ru/videoembed/11912195017326', '2026-01-31 18:54:35', '2026-01-31 18:54:35'),
(180, 145, 1, 'https://geo.dailymotion.com/player.html?video=x9y01y6', '2026-01-31 18:55:01', '2026-01-31 18:55:01'),
(181, 145, 2, 'https://ok.ru/videoembed/11789933218414', '2026-01-31 18:55:01', '2026-01-31 18:55:01'),
(182, 146, 1, 'https://geo.dailymotion.com/player.html?video=x9xj4r6', '2026-01-31 18:55:25', '2026-01-31 18:55:25'),
(183, 146, 2, 'https://ok.ru/videoembed/11667252251246', '2026-01-31 18:55:25', '2026-01-31 18:55:25'),
(184, 147, 2, 'https://ok.ru/videoembed/11568691677806', '2026-01-31 18:57:14', '2026-01-31 18:57:14'),
(185, 148, 2, 'https://ok.ru/videoembed/11465908488814', '2026-01-31 18:57:43', '2026-01-31 18:57:43'),
(186, 149, 2, 'https://ok.ru/videoembed/11465717844590', '2026-01-31 18:57:56', '2026-01-31 18:57:56'),
(187, 150, 1, 'https://geo.dailymotion.com/player.html?video=x9yyp92', '2026-01-31 18:58:12', '2026-01-31 18:58:12'),
(188, 150, 2, 'https://ok.ru/videoembed/12047645018734', '2026-01-31 18:58:12', '2026-01-31 18:58:12'),
(189, 151, 1, 'https://geo.dailymotion.com/player.html?video=x9yypoa', '2026-01-31 19:11:26', '2026-01-31 19:11:26'),
(190, 151, 2, 'https://ok.ru/videoembed/12047711275630', '2026-01-31 19:11:26', '2026-01-31 19:11:26'),
(191, 152, 1, 'https://geo.dailymotion.com/player.html?video=x9yyswg', '2026-01-31 20:42:26', '2026-01-31 20:42:26'),
(192, 152, 2, 'https://ok.ru/videoembed/12048350972526', '2026-01-31 20:42:26', '2026-01-31 20:42:26'),
(193, 153, 1, 'https://geo.dailymotion.com/player.html?video=x9yziaq', '2026-02-01 04:18:42', '2026-02-01 04:18:42'),
(194, 153, 2, 'https://ok.ru/videoembed/12055221963374', '2026-02-01 04:18:42', '2026-02-01 04:18:42'),
(195, 154, 1, 'https://geo.dailymotion.com/player.html?video=x9z0qsi', '2026-02-01 17:47:20', '2026-02-01 17:47:20'),
(196, 154, 2, 'https://ok.ru/videoembed/12062373775982', '2026-02-01 17:47:20', '2026-02-01 17:47:20'),
(197, 155, 2, 'https://ok.ru/videoembed/12062478502510', '2026-02-01 18:08:47', '2026-02-01 18:08:47'),
(198, 156, 2, 'https://ok.ru/videoembed/12062495214190', '2026-02-01 18:12:05', '2026-02-01 18:12:05'),
(199, 157, 2, 'https://ok.ru/videoembed/12062512843374', '2026-02-01 18:15:11', '2026-02-01 18:15:11'),
(200, 158, 2, 'https://ok.ru/videoembed/12062519659118', '2026-02-01 18:16:27', '2026-02-01 18:16:27'),
(201, 159, 1, 'https://geo.dailymotion.com/player.html?video=x9z24vi', '2026-02-02 04:30:34', '2026-02-02 04:30:34'),
(202, 159, 2, 'https://ok.ru/videoembed/12075303373422', '2026-02-02 04:30:34', '2026-02-02 04:30:34'),
(203, 160, 1, 'https://geo.dailymotion.com/player.html?video=x9z25ww', '2026-02-02 04:49:18', '2026-02-02 04:49:18'),
(204, 160, 2, 'https://ok.ru/videoembed/12075581180526', '2026-02-02 04:49:18', '2026-02-02 04:49:18'),
(205, 161, 1, 'https://geo.dailymotion.com/player.html?video=x9yllk8', '2026-02-02 05:18:59', '2026-02-02 05:18:59'),
(206, 161, 2, 'https://ok.ru/videoembed/11955539937902', '2026-02-02 05:18:59', '2026-02-02 05:18:59'),
(207, 162, 1, 'https://geo.dailymotion.com/player.html?video=x9y568m', '2026-02-02 05:19:21', '2026-02-02 05:19:21'),
(208, 162, 2, 'https://ok.ru/videoembed/11828906101358', '2026-02-02 05:19:21', '2026-02-02 05:19:21'),
(209, 163, 1, 'https://geo.dailymotion.com/player.html?video=x9xnp3g', '2026-02-02 05:19:51', '2026-02-02 05:19:51'),
(210, 163, 2, 'https://ok.ru/videoembed/11701754268270', '2026-02-02 05:19:51', '2026-02-02 05:19:51'),
(211, 164, 1, 'https://geo.dailymotion.com/player.html?video=x9x5mea', '2026-02-02 05:20:06', '2026-02-02 05:20:06'),
(212, 164, 2, 'https://ok.ru/videoembed/11598140541550', '2026-02-02 05:20:06', '2026-02-02 05:20:06'),
(213, 165, 2, 'https://ok.ru/videoembed/11496427096686', '2026-02-02 05:40:07', '2026-02-02 05:40:07'),
(214, 166, 1, 'https://geo.dailymotion.com/player.html?video=x9w8piw', '2026-02-02 05:40:19', '2026-02-02 05:40:19'),
(215, 166, 2, 'https://ok.ru/videoembed/11387454622318', '2026-02-02 05:40:19', '2026-02-02 05:40:19'),
(216, 167, 1, 'https://geo.dailymotion.com/player.html?video=x9vs27c', '2026-02-02 05:40:32', '2026-02-02 05:40:32'),
(217, 167, 2, 'https://ok.ru/videoembed/11298867972718', '2026-02-02 05:40:32', '2026-02-02 05:40:32'),
(218, 168, 1, 'https://geo.dailymotion.com/player.html?video=x9vaksi', '2026-02-02 05:40:52', '2026-02-02 05:40:52'),
(219, 168, 2, 'https://ok.ru/videoembed/11206826199662', '2026-02-02 05:40:52', '2026-02-02 05:40:52'),
(220, 169, 1, 'https://geo.dailymotion.com/player.html?video=x9vake8', '2026-02-02 05:44:08', '2026-02-02 05:44:08'),
(221, 169, 2, 'https://ok.ru/videoembed/11206746638958', '2026-02-02 05:44:08', '2026-02-02 05:44:08'),
(222, 170, 1, 'https://geo.dailymotion.com/player.html?video=x9z3nn2', '2026-02-02 18:44:59', '2026-02-02 18:44:59'),
(223, 170, 2, 'https://ok.ru/videoembed/12083492620910', '2026-02-02 18:44:59', '2026-02-02 18:44:59'),
(224, 171, 1, 'https://geo.dailymotion.com/player.html?video=x9z3nx2', '2026-02-02 18:50:16', '2026-02-02 18:50:16'),
(225, 171, 2, 'https://ok.ru/videoembed/12083522833006', '2026-02-02 18:50:16', '2026-02-02 18:50:16'),
(226, 172, 1, 'https://geo.dailymotion.com/player.html?video=x9ykph0', '2026-02-03 01:50:34', '2026-02-03 01:50:34'),
(227, 172, 2, 'https://ok.ru/videoembed/11947250420334', '2026-02-03 01:50:34', '2026-02-03 01:50:34'),
(228, 173, 1, 'https://geo.dailymotion.com/player.html?video=x9y3zz2', '2026-02-03 01:50:52', '2026-02-03 01:50:52'),
(229, 173, 2, 'https://ok.ru/videoembed/11821438470766', '2026-02-03 01:50:52', '2026-02-03 01:50:52'),
(230, 174, 1, 'https://geo.dailymotion.com/player.html?video=x9xmzzy', '2026-02-03 01:51:11', '2026-02-03 01:51:11'),
(231, 174, 2, 'https://ok.ru/videoembed/11695998700142', '2026-02-03 01:51:11', '2026-02-03 01:51:11'),
(232, 175, 1, 'https://geo.dailymotion.com/player.html?video=x9x5e8e', '2026-02-03 01:51:31', '2026-02-03 01:51:31'),
(233, 175, 2, 'https://ok.ru/videoembed/11597346376302', '2026-02-03 01:51:31', '2026-02-03 01:51:31'),
(234, 176, 1, 'https://geo.dailymotion.com/player.html?video=x9wogtg', '2026-02-03 01:52:06', '2026-02-03 01:52:06'),
(235, 176, 2, 'https://ok.ru/videoembed/11495974832750', '2026-02-03 01:52:06', '2026-02-03 01:52:06'),
(236, 177, 1, 'https://geo.dailymotion.com/player.html?video=x9wogci', '2026-02-03 01:52:24', '2026-02-03 01:52:24'),
(237, 177, 2, 'https://ok.ru/videoembed/11495933151854', '2026-02-03 01:52:24', '2026-02-03 01:52:24'),
(238, 178, 1, 'https://geo.dailymotion.com/player.html?video=x9wof94', '2026-02-03 01:52:44', '2026-02-03 01:52:44'),
(239, 178, 2, 'https://ok.ru/videoembed/11495846840942', '2026-02-03 01:52:44', '2026-02-03 01:52:44'),
(240, 179, 1, 'https://geo.dailymotion.com/player.html?video=x9yko98', '2026-02-03 01:53:50', '2026-02-03 01:53:50'),
(241, 179, 2, 'https://ok.ru/videoembed/11947120659054', '2026-02-03 01:53:50', '2026-02-03 01:53:50'),
(242, 180, 1, 'https://geo.dailymotion.com/player.html?video=x9y3yhg', '2026-02-03 01:54:08', '2026-02-03 01:54:08'),
(243, 180, 2, 'https://ok.ru/videoembed/11821288327790', '2026-02-03 01:54:08', '2026-02-03 01:54:08'),
(244, 181, 1, 'https://geo.dailymotion.com/player.html?video=x9xmwm0', '2026-02-03 01:54:24', '2026-02-03 01:54:24'),
(245, 181, 2, 'https://ok.ru/videoembed/11695407958638', '2026-02-03 01:54:24', '2026-02-03 01:54:24'),
(246, 182, 1, 'https://geo.dailymotion.com/player.html?video=x9x5dtu', '2026-02-03 01:54:39', '2026-02-03 01:54:39'),
(247, 182, 2, 'https://ok.ru/videoembed/11597322127982', '2026-02-03 01:54:39', '2026-02-03 01:54:39'),
(248, 183, 1, 'https://geo.dailymotion.com/player.html?video=x9wo7ha', '2026-02-03 01:55:24', '2026-02-03 01:55:24'),
(249, 183, 2, 'https://ok.ru/videoembed/11495316523630', '2026-02-03 01:55:24', '2026-02-03 01:55:24'),
(250, 184, 1, 'https://geo.dailymotion.com/player.html?video=x9w8lxa', '2026-02-03 01:55:54', '2026-02-03 01:55:54'),
(251, 184, 2, 'https://ok.ru/videoembed/11386647546478', '2026-02-03 01:55:54', '2026-02-03 01:55:54'),
(252, 185, 1, 'https://geo.dailymotion.com/player.html?video=x9vs0hw', '2026-02-03 01:56:15', '2026-02-03 01:56:15'),
(253, 185, 2, 'https://ok.ru/videoembed/11298696465006', '2026-02-03 01:56:15', '2026-02-03 01:56:15'),
(254, 186, 1, 'https://geo.dailymotion.com/player.html?video=x9va6z4', '2026-02-03 01:56:33', '2026-02-03 01:56:33'),
(255, 186, 2, 'https://ok.ru/videoembed/11204658072174', '2026-02-03 01:56:33', '2026-02-03 01:56:33'),
(256, 187, 1, 'https://geo.dailymotion.com/player.html?video=x9utpf8', '2026-02-03 01:56:51', '2026-02-03 01:56:51'),
(257, 187, 2, 'https://ok.ru/videoembed/11122905320046', '2026-02-03 01:56:51', '2026-02-03 01:56:51'),
(258, 188, 1, 'https://geo.dailymotion.com/player.html?video=x9utn24', '2026-02-03 01:57:09', '2026-02-03 01:57:09'),
(259, 188, 2, 'https://ok.ru/videoembed/11122798234222', '2026-02-03 01:57:09', '2026-02-03 01:57:09'),
(260, 189, 1, 'https://geo.dailymotion.com/player.html?video=x9utmb2', '2026-02-03 01:57:28', '2026-02-03 01:57:28'),
(261, 189, 2, 'https://ok.ru/videoembed/11122778049134', '2026-02-03 01:57:28', '2026-02-03 01:57:28'),
(262, 190, 1, 'https://geo.dailymotion.com/player.html?video=x9z52k2', '2026-02-03 03:18:06', '2026-02-03 03:18:06'),
(263, 190, 2, 'https://ok.ru/videoembed/12091643267694', '2026-02-03 03:18:06', '2026-02-03 03:18:06'),
(264, 191, 1, 'https://geo.dailymotion.com/player.html?video=x9ylsp6', '2026-02-03 03:38:58', '2026-02-03 03:38:58'),
(265, 191, 2, 'https://ok.ru/videoembed/11957862074990', '2026-02-03 03:38:58', '2026-02-03 03:38:58'),
(266, 192, 1, 'https://geo.dailymotion.com/player.html?video=x9y5596', '2026-02-03 03:39:12', '2026-02-03 03:39:12'),
(267, 192, 2, 'https://ok.ru/videoembed/11828636224110', '2026-02-03 03:39:12', '2026-02-03 03:39:12'),
(268, 193, 1, 'https://geo.dailymotion.com/player.html?video=x9xo1hs', '2026-02-03 03:39:27', '2026-02-03 03:39:27'),
(269, 193, 2, 'https://ok.ru/videoembed/11672705567342', '2026-02-03 03:39:27', '2026-02-03 03:39:27'),
(270, 194, 1, 'https://geo.dailymotion.com/player.html?video=x9x6gsc', '2026-02-03 03:39:44', '2026-02-03 03:39:44'),
(271, 194, 2, 'https://ok.ru/videoembed/11603937266286', '2026-02-03 03:39:44', '2026-02-03 03:39:44'),
(272, 195, 1, 'https://geo.dailymotion.com/player.html?video=x9wq5sy', '2026-02-03 03:40:15', '2026-02-03 03:40:15'),
(273, 195, 2, 'https://ok.ru/videoembed/11502500973166', '2026-02-03 03:40:15', '2026-02-03 03:40:15'),
(274, 196, 1, 'https://geo.dailymotion.com/player.html?video=x9w9jcs', '2026-02-03 03:40:31', '2026-02-03 03:40:31'),
(275, 196, 2, 'https://ok.ru/videoembed/11395848997486', '2026-02-03 03:40:31', '2026-02-03 03:40:31'),
(276, 197, 1, 'https://geo.dailymotion.com/player.html?video=x9vt040', '2026-02-03 03:40:50', '2026-02-03 03:40:50'),
(277, 197, 2, 'https://ok.ru/videoembed/11304493124206', '2026-02-03 03:40:50', '2026-02-03 03:40:50'),
(278, 198, 1, 'https://geo.dailymotion.com/player.html?video=x9vb6j6', '2026-02-03 03:41:14', '2026-02-03 03:41:14'),
(279, 198, 2, 'https://ok.ru/videoembed/11209658731118', '2026-02-03 03:41:14', '2026-02-03 03:41:14'),
(280, 199, 2, 'https://ok.ru/videoembed/11126488369774', '2026-02-03 03:41:44', '2026-02-03 03:41:44'),
(281, 200, 1, 'https://geo.dailymotion.com/player.html?video=x9u0590', '2026-02-03 03:42:51', '2026-02-03 03:42:51'),
(282, 201, 1, 'https://geo.dailymotion.com/player.html?video=x9tl8bm', '2026-02-03 03:43:11', '2026-02-03 03:43:11'),
(283, 202, 1, 'https://geo.dailymotion.com/player.html?video=x9t6kxa', '2026-02-03 03:43:44', '2026-02-03 03:43:44'),
(284, 203, 1, 'https://geo.dailymotion.com/player.html?video=x9stdss', '2026-02-03 03:43:59', '2026-02-03 03:43:59'),
(285, 204, 1, 'https://geo.dailymotion.com/player.html?video=x9st3na', '2026-02-03 03:44:21', '2026-02-03 03:44:21'),
(286, 205, 1, 'https://geo.dailymotion.com/player.html?video=x9st3ra', '2026-02-03 03:44:37', '2026-02-03 03:44:37'),
(287, 206, 1, 'https://geo.dailymotion.com/player.html?video=x9st3qs', '2026-02-03 03:45:01', '2026-02-03 03:45:01'),
(288, 207, 2, 'https://ok.ru/videoembed/12092185053806', '2026-02-03 03:46:45', '2026-02-03 03:46:45'),
(289, 208, 1, 'https://geo.dailymotion.com/player.html?video=x9z74vo', '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(290, 208, 2, 'https://ok.ru/videoembed/12104258816622', '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(291, 209, 1, 'https://geo.dailymotion.com/player.html?video=x9z74vk', '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(292, 209, 2, 'https://ok.ru/videoembed/12104261306990', '2026-02-03 19:23:04', '2026-02-03 19:23:04'),
(293, 210, 2, 'https://ok.ru/videoembed/11967531453038', '2026-02-03 23:55:37', '2026-02-03 23:55:37'),
(294, 211, 2, 'https://ok.ru/videoembed/11840748849774', '2026-02-03 23:55:59', '2026-02-03 23:55:59'),
(295, 212, 2, 'https://ok.ru/videoembed/11714171964014', '2026-02-03 23:56:20', '2026-02-03 23:56:20'),
(296, 213, 2, 'https://ok.ru/videoembed/11612353333870', '2026-02-03 23:56:37', '2026-02-03 23:56:37'),
(297, 214, 2, 'https://ok.ru/videoembed/11511324019310', '2026-02-03 23:56:53', '2026-02-03 23:56:53'),
(298, 215, 2, 'https://ok.ru/videoembed/11404206344814', '2026-02-03 23:57:07', '2026-02-03 23:57:07'),
(299, 216, 2, 'https://ok.ru/videoembed/11310863485550', '2026-02-03 23:57:20', '2026-02-03 23:57:20'),
(300, 217, 2, 'https://ok.ru/videoembed/11310866106990', '2026-02-03 23:57:43', '2026-02-03 23:57:43'),
(301, 218, 2, 'https://ok.ru/videoembed/11310863420014', '2026-02-03 23:57:51', '2026-02-03 23:57:51'),
(302, 219, 2, 'https://ok.ru/videoembed/11310861978222', '2026-02-03 23:58:03', '2026-02-03 23:58:03'),
(303, 220, 2, 'https://ok.ru/videoembed/12108246420078', '2026-02-03 23:58:12', '2026-02-04 00:01:47'),
(304, 221, 2, 'https://ok.ru/videoembed/12108370872942', '2026-02-04 00:09:49', '2026-02-04 00:09:49'),
(305, 222, 1, 'https://geo.dailymotion.com/player.html?video=x9xjqq4', '2026-02-04 00:13:58', '2026-02-04 00:13:58'),
(306, 222, 2, 'https://ok.ru/videoembed/11672705567342', '2026-02-04 00:13:58', '2026-02-04 00:13:58'),
(307, 223, 1, 'https://geo.dailymotion.com/player.html?video=x9x1nk8', '2026-02-04 00:14:19', '2026-02-04 00:14:19'),
(308, 223, 2, 'https://ok.ru/videoembed/11574010579566', '2026-02-04 00:14:19', '2026-02-04 00:14:19'),
(309, 224, 1, 'https://geo.dailymotion.com/player.html?video=x9wkdmk', '2026-02-04 00:14:34', '2026-02-04 00:14:34'),
(310, 224, 2, 'https://ok.ru/videoembed/11471294958190', '2026-02-04 00:14:34', '2026-02-04 00:14:34'),
(311, 225, 1, 'https://geo.dailymotion.com/player.html?video=x9w588y', '2026-02-04 00:14:53', '2026-02-04 00:14:53'),
(312, 225, 2, 'https://ok.ru/videoembed/11366656379502', '2026-02-04 00:14:53', '2026-02-04 00:14:53'),
(313, 226, 1, 'https://geo.dailymotion.com/player.html?video=x9vor2i', '2026-02-04 00:15:08', '2026-02-04 00:15:08'),
(314, 226, 2, 'https://ok.ru/videoembed/11276109417070', '2026-02-04 00:15:08', '2026-02-04 00:15:08'),
(315, 227, 1, 'https://geo.dailymotion.com/player.html?video=x9v6xfw', '2026-02-04 00:15:23', '2026-02-04 00:15:23'),
(316, 227, 2, 'https://ok.ru/videoembed/11186113415790', '2026-02-04 00:15:23', '2026-02-04 00:15:23'),
(317, 228, 1, 'https://geo.dailymotion.com/player.html?video=x9upw7i', '2026-02-04 00:15:37', '2026-02-04 00:15:37'),
(318, 228, 2, 'https://ok.ru/videoembed/11110337284718', '2026-02-04 00:15:37', '2026-02-04 00:15:37'),
(319, 229, 2, 'https://ok.ru/videoembed/11350271593070', '2026-02-04 00:22:54', '2026-02-04 00:22:54'),
(320, 230, 2, 'https://ok.ru/videoembed/11259774765678', '2026-02-04 00:23:09', '2026-02-04 00:23:09'),
(321, 231, 2, 'https://ok.ru/videoembed/11173589420654', '2026-02-04 00:23:17', '2026-02-04 00:23:17'),
(322, 232, 2, 'https://ok.ru/videoembed/12108728044142', '2026-02-04 00:27:17', '2026-02-04 00:27:17'),
(323, 233, 2, 'https://ok.ru/videoembed/12108747442798', '2026-02-04 00:28:01', '2026-02-04 00:28:01'),
(324, 234, 2, 'https://ok.ru/videoembed/12108797577838', '2026-02-04 00:30:23', '2026-02-04 00:30:23'),
(325, 235, 2, 'https://ok.ru/videoembed/12108811340398', '2026-02-04 00:30:54', '2026-02-04 00:30:54'),
(326, 236, 2, 'https://ok.ru/videoembed/12108826610286', '2026-02-04 00:31:32', '2026-02-04 00:31:32'),
(327, 237, 2, 'https://ok.ru/videoembed/12108854004334', '2026-02-04 00:33:42', '2026-02-04 00:33:42'),
(328, 238, 2, 'https://ok.ru/videoembed/12108856035950', '2026-02-04 00:33:51', '2026-02-04 00:33:51'),
(329, 239, 2, 'https://ok.ru/videoembed/12108895292014', '2026-02-04 00:35:19', '2026-02-04 00:35:19'),
(330, 240, 2, 'https://ok.ru/videoembed/12108895423086', '2026-02-04 00:35:37', '2026-02-04 00:35:37'),
(331, 241, 2, 'https://ok.ru/videoembed/12108925766254', '2026-02-04 00:37:03', '2026-02-04 00:37:03'),
(332, 242, 2, 'https://ok.ru/videoembed/12108928453230', '2026-02-04 00:37:12', '2026-02-04 00:37:12'),
(333, 243, 2, 'https://ok.ru/videoembed/12108983241326', '2026-02-04 00:40:08', '2026-02-04 00:40:08'),
(334, 244, 2, 'https://ok.ru/videoembed/12109515000430', '2026-02-04 01:09:15', '2026-02-04 01:09:15'),
(335, 245, 2, 'https://ok.ru/videoembed/12109519653486', '2026-02-04 01:09:38', '2026-02-04 01:09:38'),
(336, 246, 2, 'https://ok.ru/videoembed/12110448167534', '2026-02-04 01:59:50', '2026-02-04 01:59:50'),
(337, 247, 2, 'https://ok.ru/videoembed/12110448167534', '2026-02-04 02:00:05', '2026-02-04 02:00:05'),
(338, 248, 2, 'https://ok.ru/videoembed/12110491945582', '2026-02-04 02:02:22', '2026-02-04 02:02:22'),
(339, 249, 2, 'https://ok.ru/videoembed/12110491945582', '2026-02-04 02:02:32', '2026-02-04 02:02:32'),
(340, 250, 2, 'https://ok.ru/videoembed/12110520126062', '2026-02-04 02:03:53', '2026-02-04 02:03:53'),
(341, 251, 2, 'https://ok.ru/videoembed/12110523992686', '2026-02-04 02:03:59', '2026-02-04 02:03:59'),
(342, 252, 1, 'https://geo.dailymotion.com/player.html?video=x9z8ezm', '2026-02-04 04:35:31', '2026-02-04 04:35:31'),
(343, 252, 2, 'https://ok.ru/videoembed/12113283910254', '2026-02-04 04:35:31', '2026-02-04 04:35:31'),
(345, 254, 2, 'https://ok.ru/videoembed/12118185740910', '2026-02-04 09:29:13', '2026-02-04 09:29:13'),
(346, 255, 2, 'https://ok.ru/videoembed/12118418852462', '2026-02-04 09:46:23', '2026-02-04 09:46:23'),
(347, 256, 2, 'https://ok.ru/videoembed/12118803810926', '2026-02-04 10:17:13', '2026-02-04 10:17:13'),
(348, 257, 2, 'https://ok.ru/videoembed/12119198993006', '2026-02-04 10:53:25', '2026-02-04 10:53:25'),
(349, 258, 2, 'https://ok.ru/videoembed/12119458908782', '2026-02-04 11:22:22', '2026-02-04 11:22:22'),
(352, 261, 2, 'https://ok.ru/videoembed/12119981886062', '2026-02-04 12:50:59', '2026-02-04 12:50:59'),
(353, 262, 2, 'https://ok.ru/videoembed/12120083794542', '2026-02-04 13:19:02', '2026-02-04 13:19:02'),
(354, 263, 2, 'https://ok.ru/videoembed/12120174496366', '2026-02-04 13:48:45', '2026-02-04 13:48:45'),
(358, 267, 2, 'https://ok.ru/videoembed/12120480746094', '2026-02-04 15:44:52', '2026-02-04 15:44:52'),
(361, 270, 2, 'https://ok.ru/videoembed/12121200855662', '2026-02-04 17:12:58', '2026-02-04 17:12:58'),
(362, 271, 1, 'https://geo.dailymotion.com/player.html?video=x9za07s', '2026-02-04 18:20:52', '2026-02-04 18:20:52'),
(363, 271, 2, 'https://ok.ru/videoembed/12122435357294', '2026-02-04 18:20:52', '2026-02-04 18:20:52'),
(364, 272, 1, 'https://geo.dailymotion.com/player.html?video=x9za0nu', '2026-02-04 18:31:28', '2026-02-04 18:31:28'),
(365, 272, 2, 'https://ok.ru/videoembed/12122650839662', '2026-02-04 18:31:28', '2026-02-04 18:31:28'),
(367, 274, 2, 'https://ok.ru/videoembed/12124736391790', '2026-02-04 19:49:26', '2026-02-04 19:49:26'),
(368, 275, 2, 'https://ok.ru/videoembed/12125657434734', '2026-02-04 20:21:22', '2026-02-04 20:21:22'),
(369, 276, 2, 'https://ok.ru/videoembed/12126409919086', '2026-02-04 20:52:00', '2026-02-04 20:52:00'),
(371, 278, 2, 'https://ok.ru/videoembed/12127439161966', '2026-02-04 21:55:19', '2026-02-04 21:55:19'),
(372, 279, 2, 'https://ok.ru/videoembed/12127600511598', '2026-02-04 22:05:54', '2026-02-04 22:05:54'),
(373, 280, 2, 'https://ok.ru/videoembed/12127618599534', '2026-02-04 22:06:45', '2026-02-04 22:06:45'),
(374, 281, 2, 'https://ok.ru/videoembed/12127632951918', '2026-02-04 22:07:38', '2026-02-04 22:07:38'),
(375, 282, 2, 'https://ok.ru/videoembed/12127965416046', '2026-02-04 22:28:02', '2026-02-04 22:28:02'),
(376, 283, 2, 'https://ok.ru/videoembed/12128533678702', '2026-02-04 22:58:59', '2026-02-04 22:58:59'),
(377, 284, 2, 'https://ok.ru/videoembed/12129318341230', '2026-02-04 23:41:56', '2026-02-04 23:41:56'),
(378, 285, 2, 'https://ok.ru/videoembed/12129918388846', '2026-02-05 00:13:03', '2026-02-05 00:13:03'),
(379, 286, 2, 'https://ok.ru/videoembed/12130478000750', '2026-02-05 00:43:39', '2026-02-05 00:43:39'),
(380, 287, 2, 'https://ok.ru/videoembed/12131102427758', '2026-02-05 01:16:55', '2026-02-05 01:16:55'),
(381, 288, 2, 'https://ok.ru/videoembed/12131669510766', '2026-02-05 01:47:18', '2026-02-05 01:47:18'),
(382, 289, 2, 'https://ok.ru/videoembed/12132243475054', '2026-02-05 02:19:02', '2026-02-05 02:19:02'),
(383, 290, 2, 'https://ok.ru/videoembed/12132784999022', '2026-02-05 02:49:43', '2026-02-05 02:49:43'),
(384, 291, 2, 'https://ok.ru/videoembed/12133360929390', '2026-02-05 03:20:03', '2026-02-05 03:20:03'),
(385, 292, 2, 'https://ok.ru/videoembed/12133955734126', '2026-02-05 03:52:24', '2026-02-05 03:52:24'),
(386, 293, 1, 'https://geo.dailymotion.com/player.html?video=x9zb484', '2026-02-05 04:06:50', '2026-02-05 04:06:50'),
(387, 293, 2, 'https://ok.ru/videoembed/12134217288302', '2026-02-05 04:06:50', '2026-02-05 04:06:50'),
(388, 294, 2, 'https://ok.ru/videoembed/12134529763950', '2026-02-05 04:24:29', '2026-02-05 04:24:29'),
(389, 295, 2, 'https://ok.ru/videoembed/12135148948078', '2026-02-05 04:59:17', '2026-02-05 04:59:17'),
(390, 296, 2, 'https://ok.ru/videoembed/12135696829038', '2026-02-05 05:28:43', '2026-02-05 05:28:43'),
(391, 297, 2, 'https://ok.ru/videoembed/12135802931822', '2026-02-05 05:35:00', '2026-02-05 05:35:00'),
(392, 298, 2, 'https://ok.ru/videoembed/12135836551790', '2026-02-05 05:37:10', '2026-02-05 05:37:10'),
(393, 299, 2, 'https://ok.ru/videoembed/12135845005934', '2026-02-05 05:37:39', '2026-02-05 05:37:39'),
(394, 300, 2, 'https://ok.ru/videoembed/12135984138862', '2026-02-05 05:45:04', '2026-02-05 05:45:04'),
(395, 301, 2, 'https://ok.ru/videoembed/12135984990830', '2026-02-05 05:45:33', '2026-02-05 05:45:33'),
(396, 302, 2, 'https://ok.ru/videoembed/12136121764462', '2026-02-05 05:52:40', '2026-02-05 05:52:40'),
(397, 303, 2, 'https://ok.ru/videoembed/12136185989742', '2026-02-05 05:56:36', '2026-02-05 05:56:36'),
(398, 304, 2, 'https://ok.ru/videoembed/12136255588974', '2026-02-05 06:00:33', '2026-02-05 06:00:33'),
(399, 305, 2, 'https://ok.ru/videoembed/12136316144238', '2026-02-05 06:04:00', '2026-02-05 06:04:00'),
(400, 306, 1, 'https://geo.dailymotion.com/player.html?video=x9zbiyu', '2026-02-05 06:12:07', '2026-02-05 06:12:07'),
(401, 306, 2, 'https://ok.ru/videoembed/12136462551662', '2026-02-05 06:12:07', '2026-02-05 06:12:07'),
(402, 307, 2, 'https://ok.ru/videoembed/12136889256558', '2026-02-05 06:35:32', '2026-02-05 06:35:32'),
(403, 308, 2, 'https://ok.ru/videoembed/12137430256238', '2026-02-05 07:05:56', '2026-02-05 07:05:56'),
(406, 309, 2, 'https://ok.ru/videoembed/12137764883054', '2026-02-05 07:26:03', '2026-02-05 07:26:03'),
(408, 310, 2, 'https://ok.ru/videoembed/12138241919598', '2026-02-05 07:54:34', '2026-02-05 07:54:34'),
(409, 311, 2, 'https://ok.ru/videoembed/12138731342446', '2026-02-05 08:24:37', '2026-02-05 08:24:37'),
(410, 312, 2, 'https://ok.ru/videoembed/12139195402862', '2026-02-05 08:56:07', '2026-02-05 08:56:07'),
(411, 313, 2, 'https://ok.ru/videoembed/12139602905710', '2026-02-05 09:24:55', '2026-02-05 09:24:55'),
(412, 314, 2, 'https://ok.ru/videoembed/12139989568110', '2026-02-05 09:52:39', '2026-02-05 09:52:39'),
(413, 315, 2, 'https://ok.ru/videoembed/12140357159534', '2026-02-05 10:21:46', '2026-02-05 10:21:46'),
(414, 316, 2, 'https://ok.ru/videoembed/12140678417006', '2026-02-05 10:52:08', '2026-02-05 10:52:08'),
(415, 317, 2, 'https://ok.ru/videoembed/12140915329646', '2026-02-05 11:20:20', '2026-02-05 11:20:20'),
(416, 318, 2, 'https://ok.ru/videoembed/12141117704814', '2026-02-05 11:50:31', '2026-02-05 11:50:31'),
(417, 319, 2, 'https://ok.ru/videoembed/12141284035182', '2026-02-05 12:21:01', '2026-02-05 12:21:01'),
(418, 320, 2, 'https://ok.ru/videoembed/12141422316142', '2026-02-05 12:52:28', '2026-02-05 12:52:28'),
(419, 321, 2, 'https://ok.ru/videoembed/12141520161390', '2026-02-05 13:22:05', '2026-02-05 13:22:05'),
(420, 322, 2, 'https://ok.ru/videoembed/12141598411374', '2026-02-05 13:50:41', '2026-02-05 13:50:41'),
(421, 323, 2, 'https://ok.ru/videoembed/12141676268142', '2026-02-05 14:18:26', '2026-02-05 14:18:26'),
(422, 324, 2, 'https://ok.ru/videoembed/12141745212014', '2026-02-05 14:46:44', '2026-02-05 14:46:44'),
(423, 325, 2, 'https://ok.ru/videoembed/12141819202158', '2026-02-05 15:16:27', '2026-02-05 15:16:27'),
(424, 326, 2, 'https://ok.ru/videoembed/12141904267886', '2026-02-05 15:46:37', '2026-02-05 15:46:37'),
(425, 327, 2, 'https://ok.ru/videoembed/12142003292782', '2026-02-05 16:19:34', '2026-02-05 16:19:34'),
(426, 328, 2, 'https://ok.ru/videoembed/12142099499630', '2026-02-05 16:50:01', '2026-02-05 16:50:01'),
(427, 329, 1, 'https://geo.dailymotion.com/player.html?video=x9zcl08', '2026-02-05 17:22:19', '2026-02-05 17:22:19'),
(428, 329, 2, 'https://ok.ru/videoembed/12142233848430', '2026-02-05 17:22:19', '2026-02-05 17:22:19'),
(429, 330, 1, 'https://geo.dailymotion.com/player.html?video=x9zclpu', '2026-02-05 17:43:11', '2026-02-05 17:43:11'),
(430, 330, 2, 'https://ok.ru/videoembed/12142330055278', '2026-02-05 17:43:11', '2026-02-05 17:43:11'),
(431, 331, 2, 'https://ok.ru/videoembed/12142509296238', '2026-02-05 18:18:26', '2026-02-05 18:18:26'),
(432, 332, 1, 'https://geo.dailymotion.com/player.html?video=x9zcp9q', '2026-02-05 19:06:35', '2026-02-05 19:06:35'),
(433, 332, 2, 'https://ok.ru/videoembed/12142825572974', '2026-02-05 19:06:35', '2026-02-05 19:06:35'),
(434, 333, 2, 'https://ok.ru/videoembed/12143019362926', '2026-02-05 19:29:39', '2026-02-05 19:29:39'),
(435, 334, 2, 'https://ok.ru/videoembed/12143322401390', '2026-02-05 19:59:22', '2026-02-05 19:59:22'),
(436, 335, 2, 'https://ok.ru/videoembed/12143661484654', '2026-02-05 20:31:04', '2026-02-05 20:31:04'),
(437, 336, 2, 'https://ok.ru/videoembed/12144074951278', '2026-02-05 21:02:22', '2026-02-05 21:02:22'),
(438, 337, 2, 'https://ok.ru/videoembed/12144532982382', '2026-02-05 21:32:59', '2026-02-05 21:32:59'),
(439, 338, 2, 'https://ok.ru/videoembed/12145037150830', '2026-02-05 22:04:26', '2026-02-05 22:04:26'),
(440, 339, 2, 'https://ok.ru/videoembed/12145626909294', '2026-02-05 22:39:14', '2026-02-05 22:39:14'),
(441, 340, 2, 'https://ok.ru/videoembed/12146216405614', '2026-02-05 23:10:59', '2026-02-05 23:10:59'),
(442, 341, 2, 'https://ok.ru/videoembed/12146848762478', '2026-02-05 23:44:46', '2026-02-05 23:44:46'),
(443, 342, 2, 'https://ok.ru/videoembed/12147501435502', '2026-02-06 00:20:28', '2026-02-06 00:20:28'),
(444, 343, 2, 'https://ok.ru/videoembed/12148128090734', '2026-02-06 00:53:09', '2026-02-06 00:53:09'),
(445, 344, 2, 'https://ok.ru/videoembed/12148764641902', '2026-02-06 01:27:01', '2026-02-06 01:27:01'),
(446, 259, 4, 'https://rubyvidhub.com/embed-v7055md2u7rk.html', '2026-02-06 01:39:33', '2026-02-06 01:39:33'),
(447, 345, 2, 'https://ok.ru/videoembed/12149377600110', '2026-02-06 02:00:57', '2026-02-06 02:00:57'),
(448, 260, 4, 'https://rubyvidhub.com/embed-vxa7vd62s3y1.html', '2026-02-06 02:13:09', '2026-02-06 02:13:09'),
(449, 264, 4, 'https://rubyvidhub.com/embed-u6ofaj64jdg8.html', '2026-02-06 02:13:51', '2026-02-06 02:13:51'),
(450, 265, 4, 'https://rubyvidhub.com/embed-qiq5q06rqcav.html', '2026-02-06 02:14:50', '2026-02-06 02:14:50'),
(451, 266, 4, 'https://rubyvidhub.com/embed-4qmuih1mf5k2.html', '2026-02-06 02:15:27', '2026-02-06 02:15:27'),
(452, 268, 4, 'https://rubyvidhub.com/embed-qannc47yauth.html', '2026-02-06 02:16:42', '2026-02-06 02:16:42'),
(453, 277, 4, 'https://rubyvidhub.com/embed-vl65vbrgr9xe.html', '2026-02-06 02:17:25', '2026-02-06 02:17:25'),
(454, 269, 4, 'https://rubyvidhub.com/embed-neajxtz5kuql.html', '2026-02-06 02:17:53', '2026-02-06 02:17:53'),
(455, 273, 4, 'https://rubyvidhub.com/embed-85f1blzpnw2z.html', '2026-02-06 02:18:27', '2026-02-06 02:18:27'),
(456, 346, 2, 'https://ok.ru/videoembed/12149936556654', '2026-02-06 02:30:14', '2026-02-06 02:30:14'),
(457, 347, 2, 'https://ok.ru/videoembed/12150557444718', '2026-02-06 03:03:36', '2026-02-06 03:03:36'),
(458, 348, 2, 'https://ok.ru/videoembed/12151214770798', '2026-02-06 03:34:25', '2026-02-06 03:34:25'),
(459, 349, 2, 'https://ok.ru/videoembed/12152393632366', '2026-02-06 04:16:27', '2026-02-06 04:16:27'),
(460, 349, 1, 'https://geo.dailymotion.com/player.html?video=x9zdqy8', '2026-02-06 04:26:03', '2026-02-06 04:26:03'),
(461, 350, 2, 'https://ok.ru/videoembed/12152998922862', '2026-02-06 04:32:58', '2026-02-06 04:32:58'),
(462, 351, 2, 'https://ok.ru/videoembed/12154307807854', '2026-02-06 05:09:15', '2026-02-06 05:09:15'),
(463, 352, 2, 'https://ok.ru/videoembed/12154568903278', '2026-02-06 05:17:31', '2026-02-06 05:17:31'),
(465, 353, 2, 'https://ok.ru/videoembed/12155586087534', '2026-02-06 05:46:24', '2026-02-06 05:46:24'),
(466, 354, 2, 'https://ok.ru/videoembed/12156792670830', '2026-02-06 06:20:01', '2026-02-06 06:20:01'),
(467, 355, 2, 'https://ok.ru/videoembed/12157827025518', '2026-02-06 06:51:35', '2026-02-06 06:51:35'),
(468, 356, 2, 'https://ok.ru/videoembed/12158868392558', '2026-02-06 07:23:20', '2026-02-06 07:23:20'),
(469, 357, 2, 'https://ok.ru/videoembed/12159595514478', '2026-02-06 07:53:42', '2026-02-06 07:53:42'),
(470, 358, 1, 'https://geo.dailymotion.com/player.html?video=x9ze8pe', '2026-02-06 08:20:50', '2026-02-06 08:20:50'),
(471, 358, 2, 'https://ok.ru/videoembed/12160123341422', '2026-02-06 08:20:50', '2026-02-06 08:20:50'),
(472, 359, 2, 'https://ok.ru/videoembed/12160823200366', '2026-02-06 09:05:19', '2026-02-06 09:05:19'),
(473, 360, 2, 'https://ok.ru/videoembed/12161259276910', '2026-02-06 09:35:36', '2026-02-06 09:35:36'),
(474, 361, 2, 'https://ok.ru/videoembed/12161650592366', '2026-02-06 10:05:45', '2026-02-06 10:05:45'),
(475, 362, 2, 'https://ok.ru/videoembed/12162028997230', '2026-02-06 10:37:55', '2026-02-06 10:37:55'),
(476, 363, 2, 'https://ok.ru/videoembed/12162355759726', '2026-02-06 11:09:23', '2026-02-06 11:09:23'),
(477, 364, 2, 'https://ok.ru/videoembed/12162626161262', '2026-02-06 11:41:46', '2026-02-06 11:41:46'),
(478, 365, 2, 'https://ok.ru/videoembed/12162842036846', '2026-02-06 12:10:38', '2026-02-06 12:10:38'),
(479, 366, 2, 'https://ok.ru/videoembed/12163008825966', '2026-02-06 12:44:56', '2026-02-06 12:44:56'),
(480, 367, 1, 'https://geo.dailymotion.com/player.html?video=x9zey9u', '2026-02-06 17:14:46', '2026-02-06 17:14:46'),
(481, 367, 2, 'https://ok.ru/videoembed/12163783395950', '2026-02-06 17:14:46', '2026-02-06 17:14:46'),
(482, 368, 2, 'https://ok.ru/videoembed/12163872721518', '2026-02-06 17:40:33', '2026-02-06 17:40:33'),
(483, 369, 2, 'https://ok.ru/videoembed/12163985836654', '2026-02-06 18:10:53', '2026-02-06 18:10:53'),
(484, 370, 2, 'https://ok.ru/videoembed/11876579543662', '2026-02-06 18:33:12', '2026-02-06 18:33:12'),
(485, 371, 2, 'https://ok.ru/videoembed/11747188148846', '2026-02-06 18:33:28', '2026-02-06 18:33:28'),
(486, 372, 2, 'https://ok.ru/videoembed/11640173038190', '2026-02-06 18:33:49', '2026-02-06 18:33:49'),
(487, 373, 2, 'https://ok.ru/videoembed/11640136534638', '2026-02-06 18:34:07', '2026-02-06 18:34:07'),
(488, 374, 1, 'https://geo.dailymotion.com/player.html?video=x9zf102', '2026-02-06 18:34:16', '2026-02-06 18:34:16'),
(489, 374, 2, 'https://ok.ru/videoembed/12164091611758', '2026-02-06 18:34:16', '2026-02-06 18:34:16'),
(490, 375, 2, 'https://ok.ru/videoembed/11640108616302', '2026-02-06 18:34:29', '2026-02-06 18:34:29'),
(491, 376, 2, 'https://ok.ru/videoembed/11556908632686', '2026-02-06 18:35:49', '2026-02-06 18:35:49'),
(492, 377, 1, 'https://geo.dailymotion.com/player.html?video=x9whzl6', '2026-02-06 18:36:09', '2026-02-06 18:36:09'),
(493, 377, 2, 'https://ok.ru/videoembed/11453233236590', '2026-02-06 18:36:09', '2026-02-06 18:36:09'),
(494, 378, 1, 'https://geo.dailymotion.com/player.html?video=x9whz3m', '2026-02-06 18:36:28', '2026-02-06 18:36:28'),
(495, 378, 2, 'https://ok.ru/videoembed/11453096200814', '2026-02-06 18:36:28', '2026-02-06 18:36:28'),
(496, 379, 2, 'https://ok.ru/videoembed/12164136897134', '2026-02-06 18:44:44', '2026-02-06 18:44:44'),
(497, 380, 2, 'https://ok.ru/videoembed/12164317448814', '2026-02-06 19:17:58', '2026-02-06 19:17:58'),
(498, 381, 2, 'https://ok.ru/videoembed/12164500687470', '2026-02-06 19:47:40', '2026-02-06 19:47:40'),
(499, 382, 2, 'https://ok.ru/videoembed/12164742253166', '2026-02-06 20:18:55', '2026-02-06 20:18:55'),
(500, 383, 2, 'https://ok.ru/videoembed/12165030546030', '2026-02-06 20:49:18', '2026-02-06 20:49:18'),
(501, 384, 2, 'https://ok.ru/videoembed/12165394926190', '2026-02-06 21:20:38', '2026-02-06 21:20:38'),
(502, 385, 2, 'https://ok.ru/videoembed/12165819337326', '2026-02-06 21:51:20', '2026-02-06 21:51:20'),
(503, 386, 2, 'https://ok.ru/videoembed/12166298667630', '2026-02-06 22:24:06', '2026-02-06 22:24:06'),
(504, 387, 2, 'https://ok.ru/videoembed/12166831344238', '2026-02-06 22:57:24', '2026-02-06 22:57:24'),
(505, 388, 2, 'https://ok.ru/videoembed/12167356484206', '2026-02-06 23:28:08', '2026-02-06 23:28:08'),
(506, 389, 2, 'https://ok.ru/videoembed/12164317448814', '2026-02-06 23:57:47', '2026-02-06 23:57:47'),
(507, 390, 2, 'https://ok.ru/videoembed/12168396802670', '2026-02-07 00:29:10', '2026-02-07 00:29:10'),
(508, 391, 1, 'https://geo.dailymotion.com/player.html?video=x9zfjss', '2026-02-07 00:36:10', '2026-02-07 00:36:10'),
(509, 391, 2, 'https://ok.ru/videoembed/12168524204654', '2026-02-07 00:36:10', '2026-02-07 00:36:10'),
(510, 392, 1, 'https://geo.dailymotion.com/player.html?video=x9zfjuk', '2026-02-07 00:36:40', '2026-02-07 00:36:40'),
(511, 392, 2, 'https://ok.ru/videoembed/12168532920942', '2026-02-07 00:36:40', '2026-02-07 00:36:40'),
(512, 393, 2, 'https://ok.ru/videoembed/12168927709806', '2026-02-07 00:59:59', '2026-02-07 00:59:59'),
(513, 394, 2, 'https://ok.ru/videoembed/12169447869038', '2026-02-07 01:30:12', '2026-02-07 01:30:12'),
(515, 395, 2, 'https://ok.ru/videoembed/12171561929326', '2026-02-07 03:37:55', '2026-02-07 03:37:55'),
(517, 395, 4, 'https://rubyvidhub.com/embed-6lfqg7tjsjab.html', '2026-02-07 04:11:57', '2026-02-07 04:11:57');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_26_201814_create_permission_tables', 1),
(5, '2025_08_26_203317_create_personal_access_tokens_table', 1),
(6, '2025_08_27_152517_create_series_table', 1),
(7, '2025_08_27_173735_create_episodes_table', 1),
(8, '2025_08_27_175700_create_genres_table', 1),
(9, '2025_08_27_175717_create_genre_series_table', 1),
(10, '2025_08_27_181230_create_links_table', 1),
(11, '2025_08_27_181341_create_servers_table', 1),
(12, '2025_11_30_152942_create_comments_table', 1),
(13, '2026_01_26_190104_create_views_table', 1),
(14, '9999_99_99_999999_create_relation_tables', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'userAccess', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(2, 'seriesAccess', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(3, 'seriesAdd', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(4, 'seriesUpdate', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(5, 'seriesDelete', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(6, 'episodeAccess', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(7, 'episodeAdd', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(8, 'episodeUpdate', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(9, 'episodeDelete', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(10, 'genreAccess', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(11, 'genreAdd', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(12, 'genreUpdate', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(13, 'genreDelete', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(14, 'serverAccess', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(15, 'serverAdd', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(16, 'serverUpdate', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(17, 'serverDelete', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(2, 'subber', 'web', '2026-01-29 07:33:20', '2026-01-29 07:33:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(2, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(14, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `series`
--

CREATE TABLE `series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `aliases` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`aliases`)),
  `slug` varchar(255) NOT NULL,
  `synopsis` text DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `total_episodes` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `studios` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `rating` double NOT NULL DEFAULT 4,
  `status` enum('ongoing','complete','dropped') NOT NULL,
  `type` enum('movie','tv','special','ova','pv','ona') NOT NULL DEFAULT 'tv',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `series`
--

INSERT INTO `series` (`id`, `name`, `aliases`, `slug`, `synopsis`, `duration`, `total_episodes`, `thumbnail`, `studios`, `release_date`, `rating`, `status`, `type`, `created_at`, `updated_at`) VALUES
(3, 'Renegade Immortal', '[\"Xian Ni, RI, \\u4ed9\\u9006, Renegade Immortal\"]', 'renegade-immortal', 'Wang Lin adalah anak laki-laki yang sangat cerdas dengan orang tua yang penyayang. Meskipun ia dan orang tuanya dijauhi oleh kerabat lainnya, orang tuanya selalu menaruh harapan besar bahwa suatu hari nanti ia akan mencapai kebesaran. Suatu hari, Wang Lin tiba-tiba mendapat kesempatan untuk menempuh jalan seorang immortal, tetapi ia mendapati bahwa bakatnya hanya biasa-biasa saja. Saksikan Wang Lin saat ia mengatasi keterbatasan bakatnya dan menempuh jalan menuju menjadi seorang immortal sejati!\r\n\r\n(Sumber: Xian Ni Wiki)', 25, 128, 'storage/series/HARF4JXrJWpEUE05WlbOAAYjHBg7KMN3MtoI7UQe.webp', 'BUILD DREAM', '2023-09-25', 8.4, 'ongoing', 'ona', '2026-01-29 07:45:15', '2026-02-07 01:30:12'),
(4, 'Renegade Immortal: Battle of Gods', '[\"Xian Ni Movie: Shenlin Zhi Zhan, Xian Ni Juchang Ban: Shenlin Zhi Zhan, Renegade Immortal Movie, Renegade Immortal: Divine Descent, \\u4ed9\\u9006\\u5267\\u573a\\u7248 \\u795e\\u4e34\\u4e4b\\u6218, Renegade Immortal: Battle of Gods\"]', 'renegade-immortal-battle-of-gods', 'Setelah kedatangan Wang Lin di Tanah Dewa Kuno, Kota Iblis Malam Abadi di Laut Kultivasi Iblis muncul dalam semalam, terus menerus menyerang sekte-sekte di sekitarnya. Selama pertempuran untuk mempertahankan gerbang, Li Muwan diracuni, nyawanya berada di ambang kematian. Setelah mengetahui hal ini, Wang Lin membawanya kembali ke Laut Kultivasi Iblis, mengungkap konspirasi seribu tahun...\r\n\r\n(Sumber: Tencent, diterjemahkan)', 93, 1, 'storage/series/8c2eaeae-0d57-4992-b01a-eca1884760cd.webp', 'BUILD DREAM', '2025-05-30', 7.6, 'complete', 'movie', '2026-01-29 07:45:40', '2026-01-31 17:26:46'),
(5, 'Tomb of Fallen Gods 3rd Season', '[\"Shen Mu: Nian Fan, Shen Mu 3rd Season, \\u795e\\u5893 \\u7b2c\\u4e09\\u5b63, \\u795e\\u5893 \\u5e74\\u756a, Tomb of Fallen Gods 3rd Season\"]', 'tomb-of-fallen-gods-3rd-season', 'Chen Nan, yang telah tertidur selama sepuluh ribu tahun, terbangun di Pemakaman Dewa dan Iblis dan menjadi terkenal setelah serangkaian petualangan. Dengan kedatangan Chen Nan di Kerajaan Yangjin dan pertemuannya dengan Chen Xi, petualangan baru dimulai: pertempuran besar di Kota Kaiyuan, pencarian misteri asal-usulnya di Jurang Maut, dan pertempuran melawan keluarga Ling dalam mengejar keadilan dan kejelasan. Di musim ini, Chen Nan akan melanjutkan petualangannya untuk mengungkap misteri asal-usulnya sambil mencari keberadaan Yu Xin.\r\n\r\n(Sumber: Youku, diterjemahkan)', 20, 52, 'storage/series/7a676332-4746-4d42-930f-b170ac7f3bf7.webp', 'Wonder Cat Animation, Yien Animation Studio', '2025-08-08', 7.3, 'ongoing', 'ona', '2026-01-29 07:46:21', '2026-02-05 19:06:35'),
(6, 'Back as Immortal Lord', '[\"Xian Di Guilai, Return of the Divine Emperor, \\u4ed9\\u5e1d\\u5f52\\u6765, Back as Immortal Lord\"]', 'back-as-immortal-lord', 'Prajurit muda Yun Qingyan menghilang dari dunia tiga tahun lalu, tetapi sebenarnya ia terseret ke dunia peri selama tiga ribu tahun! Dengan bakatnya yang luar biasa, ia menjadi Kaisar Yun, salah satu dari sepuluh kaisar peri agung. Namun, karena lelah dengan intrik di dunia peri dan merindukan keluarganya, ia memutuskan untuk kembali ke dunia manusia dengan segala cara. Setelah kembali ke dunia manusia, orang tua dan saudara perempuannya menghilang secara misterius, dan karena sebuah insiden saat melakukan perjalanan dari dunia peri ke dunia manusia, ia kehilangan senjata sihirnya dan kultivasinya hampir nol. Kekuatan-kekuatan besar memanfaatkan kesempatan ini untuk memburunya. Kaisar peri menjadi sasaran kritik publik, dan keluarganya dalam bahaya! Yun Qingyan mengandalkan bakat kaisar perinya yang luar biasa untuk memurnikan pil dan formasi array, belajar dan berlatih, dan mengalahkan musuh-musuhnya. Ia memulai petualangan untuk menghidupkan kembali keluarganya, menemukan kerabatnya, dan memperbaiki dunia fana.\r\n\r\n(Sumber: Bilibili, diterjemahkan)', 15, 16, 'storage/series/268b6927-4b6b-49e0-9d15-0a7a509a9d6d.webp', 'LX Animation Studio', '2025-10-27', 7, 'complete', 'ona', '2026-01-29 08:32:29', '2026-01-30 11:44:37'),
(7, 'Lingwu Continent', '[\"Ling Wu Dalu\",\"\\u7075\\u6b66\\u5927\\u9646\",\"Lingwu Continent\"]', 'lingwu-continent', 'Benua Lingwu adalah dunia di mana kekuatan spiritual dan semangat bela diri hidup berdampingan. Seorang kultivator spiritual dapat memindahkan gunung dan sungai dengan pikiran, dan seorang seniman bela diri dapat menghancurkan dunia dengan tangan kosong. Chen Tian, ​​​​mantan jenius di Kota Xingchen, kehilangan semangat bela dirinya dan mengeringkan lautan spiritualnya setelah berusia sepuluh tahun.\r\n\r\nSejak saat itu, ia menjadi sampah keluarganya dan dipandang rendah oleh orang lain. Dalam perjuangan hidup dan mati, Chen Tian jatuh dari tebing dan secara tidak sengaja memasuki formasi yang disusun oleh kaisar pedang kuno. Di bawah pengaruh kekuatan kitab surgawi, ia membangkitkan fisik kultivasi ganda spiritual dan bela dirinya. Pada saat yang sama, ia juga memperoleh ingatan aneh dan cincin penyimpanan misterius.\r\n\r\nSejak saat itu, ia bangkit dari kesulitan, menembus reinkarnasi Telapak Dao Surgawi, dan akhirnya melewati belenggu malapetaka kaisar dan bercita-cita menjadi juara Benua Lingwu!\r\n\r\n(Sumber: iQIYI)', 10, NULL, 'storage/series/6895b2c7-2168-40d2-b3ab-dcb50ba87a42.webp', 'Suoyi Technology', '2024-07-26', 6.8, 'ongoing', 'ona', '2026-01-29 08:38:33', '2026-02-05 17:43:11'),
(8, 'Ascendants of the Nine Suns', '[\"Jiu Yang Wushen, Nine Suns Martial God, \\u4e5d\\u9633\\u6b66\\u795e, Ascendants of the Nine Suns\"]', 'ascendants-of-the-nine-suns', 'Di kehidupan sebelumnya, Ye Yunfei diberkahi dengan bakat luar biasa, tetapi urat bela dirinya tiba-tiba tertutup dan ia tidak dapat berlatih bela diri. Ia dicemooh oleh keluarganya, dikhianati oleh tunangannya, dan dikelilingi oleh berbagai keluarga. Ye Yunfei muda ditinggalkan oleh teman-temannya, diintimidasi, ditinggalkan oleh kekasihnya, dan ayahnya meninggal secara tragis dalam pertempuran.\r\n\r\nUntungnya, Penguasa Sejati Suci Ungu yang lewat di Yunyou menerimanya sebagai muridnya. Ye Yunfei tumbuh menjadi kaisar termuda dalam sejarah, tetapi diserang ketika ia sedang melewati malapetaka. Ia terlahir kembali ketika semua urat bela dirinya hilang, tetapi ia juga seorang pemuda yang penuh gairah. Bertemu kembali dengan kerabat, teman, dan kekasih lamanya, menghadapi segala sesuatu yang familiar, Ye Yunfei, seorang kaisar generasi baru, memilih untuk memulai hidup baru.\r\n\r\nMasih ada jejak jiwa kaisar di tubuhnya, sehingga ingatan kehidupan sebelumnya dapat dipertahankan utuh. Ada perselisihan tentang ketenaran dan status di dalam dirinya, dan tanggung jawab atas kehormatan dan aib urat keluarga di luar.  Kebanggaan kekaisaran berkumpul, keempat sekte utama masing-masing memiliki kekuatan sendiri, dan para pahlawan Benua Tianxuan bangkit bersama.\r\n\r\nYe Yunfei memahami aturan yang berlaku di dunia ini, di mana orang-orang kuat dihormati. Dengan bantuan ingatan seribu tahun Kaisar Langit, seni bela diri Ye Yunfei berkembang pesat, dan ia terus tumbuh di dunia seni bela diri, serta memimpin keluarga dan gurunya untuk berkembang dengan cepat. Tidak lama setelah stabilisasi, penjajah asing datang dan menyerang. Ye Yunfei memimpin rakyatnya untuk melawan dan mempertahankan tanah air mereka selamanya.\r\n\r\nUntuk mengejar tingkat seni bela diri yang lebih tinggi, Ye Yunfei meninggalkan kampung halamannya dan memulai perjalanan baru, dan akhirnya menjadi Kaisar Langit generasi berikutnya. Setelah mengalami terlalu banyak penghinaan dan pelecehan, kehidupan ini harus menjadi kehidupan membunuh dewa dan Buddha, dan menunggang kuda dengan pedang, menjalani hidup sesuai dengan masa mudanya.\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 19, 20, 'storage/series/MnUVi7N7ok9pUrS6mNlhq4fw35ICaV8U6JrDCyPj.webp', 'Xing Yi Kai Chen', '2025-11-22', 0, 'ongoing', 'ona', '2026-01-29 08:41:17', '2026-02-06 23:58:30'),
(9, 'The Great Ruler 2', '[\"Da Zhuzai: Nian Fan 2, The Great Ruler 2nd Season, Da Zhuzai (2023) 2nd Season, \\u5927\\u4e3b\\u5bb0 \\u7b2c\\u4e8c\\u5b63, Da Zhuzai 3D 2nd Season, TGR, \\u5927\\u4e3b\\u5bb0 \\u5e74\\u756a2, The Great Ruler 2\"]', 'the-great-ruler-2', 'Second season of Da Zhuzai: Nian Fan.', 22, 52, 'storage/series/UhbOuogInLskYHBJAeLl8u6NiThrrY0R06Ahq136.webp', 'Motion Magic', '2026-01-09', 0, 'ongoing', 'ona', '2026-01-29 08:42:20', '2026-02-06 23:55:49'),
(10, 'Soul Land 2', '[\"Douluo Dalu II: Jueshi Tangmen\",\"The Unrivaled Tang Sect\",\"Combat Continent II\",\"Soul Land 2: Peerless Tang Sect\",\"\\u6597\\u7f57\\u5927\\u96462\\u7edd\\u4e16\\u5510\\u95e8\",\"\\u6597\\u7f57\\u5927\\u9646\\u2161\\u7edd\\u4e16\\u5510\\u95e8\",\"Soul Land 2: The Peerless Tang Clan\"]', 'soul-land-2', 'Sebuah benua aneh di dunia lain.\r\n\r\nTidak ada sihir, tidak ada qi pertempuran, tidak ada seni bela diri, hanya roh bela diri. Sepuluh ribu tahun setelah klan Tang didirikan di benua Douluo, klan Tang telah merosot hingga hampir punah.\r\n\r\nGenerasi baru yang penuh talenta telah lahir. Akankah generasi baru Tujuh Monster Shrek mampu membangun kembali Klan Tang dan menciptakan kisah kejayaan baru bagi Klan Tang yang tak tertandingi?\r\n\r\n(Sumber: IMDB)', 20, 156, 'storage/series/1098602b-9812-40ee-b0df-0b0c15a32708.webp', 'Sparkly Key Animation Studio', '2023-06-24', 8.1, 'ongoing', 'ona', '2026-01-29 08:44:25', '2026-02-06 04:16:27'),
(11, 'Immortality 5', '[\"Yong Sheng: Tai Yuan Xian Fu, Yong Sheng 5th Season, \\u6c38\\u751f \\u7b2c\\u4e94\\u5b63, \\u6c38\\u751f\\u4e4b\\u592a\\u5143\\u4ed9\\u5e9c, Immortality 5th Season\"]', 'immortality-5', 'Fifth season of Immortality.', 20, NULL, 'storage/series/8c4aa1e3-9c12-4550-8f65-72e72f7f58ab.webp', 'Oriental Creative Color', '2025-12-20', 0, 'ongoing', 'ona', '2026-01-29 08:48:09', '2026-02-06 05:17:31'),
(12, 'Threads of Fate: A War Untold', '[\"Shanhai Jing Mima, \\u5c71\\u6d77\\u7ecf\\u5bc6\\u7801, Threads of Fate: A War Untold\"]', 'threads-of-fate-a-war-untold', 'Shang prince Youshen Bupo rescued Jiang Li, disciple of Taiyi Sect, and the two of them traveled together, adventuring across the vast wilderness. They joined a merchant caravan, encountered heavenly tribulations, faced fierce beasts, defeated bandits, and rescued the heroine… Bound together by fate, the two became embroiled in a great war between the Xia and Shang dynasties.\r\n\r\n(Source: Youku)', 22, 13, 'storage/series/hwOJUxaXkPuWShtcH5LWQ2GZTPE6B893YYP5pfpe.webp', 'Qingxiang Culture', '2025-12-27', 0, 'ongoing', 'ona', '2026-01-29 21:41:29', '2026-02-06 23:54:36'),
(13, 'Way of Choices', '[\"Ze Tian Ji (2026), Fighter of the Destiny, Ze Tian Ji 3D, \\u62e9\\u5929\\u8bb0, Way of Choices\"]', 'way-of-choices', 'Di dunia fiksi tempat manusia, iblis, dan monster hidup berdampingan, Chen Changsheng datang ke ibu kota para dewa dengan surat nikah untuk mengubah takdirnya. Bersama sekelompok pahlawan muda, ia berjuang mati-matian melawan kekuatan kegelapan. Pada saat yang sama, ia juga menuai cinta dan memulai perjalanannya untuk bangkit sebagai orang yang kuat di ibu kota para dewa.\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 0, NULL, 'storage/series/lrjqE3idLi9EBWnQwP3vDaj0EeZwZgGAfS11Bqjw.webp', 'Shenman Entertainment', '2026-01-31', 0, 'ongoing', 'ona', '2026-01-30 19:56:54', '2026-02-06 23:57:13'),
(14, 'Battle Through The Heavens Season 5', '[\"Doupo Cangqiong: Nian Fan, BTTH, Battle Through The Heavens 5th, 6th & 7th Seasons, \\u6597\\u7834\\u82cd\\u7a79\\u5e74\\u756a, Battle Through The Heavens Season 5, BTTH\"]', 'battle-through-the-heavens-season-5', 'Fifth season of Doupo Cangqiong.', 24, 209, 'storage/series/Wj8XxAIIotXB3LLunP5akC4F6y474zGWwW1rsgxL.webp', 'Motion Magic', '2022-07-31', 8.4, 'ongoing', 'ona', '2026-01-31 03:21:05', '2026-02-07 03:37:55'),
(15, 'Urban Miracle Doctor', '[\"Du Shi Gu Xian Yi, Urban Miracle Doctor, \\u90fd\\u5e02\\u53e4\\u4ed9\\u533b, Immortal Doctor In Modern City\"]', 'urban-miracle-doctor', 'Ye Bufan, seorang siswa junior, mencoba menipu pengemudi mobil untuk mengumpulkan uang guna membiayai pengobatan ibunya. Tanpa diduga, ia bertemu dengan seorang pengemudi wanita yang tidak menepati aturan. Setelah ditabrak, Ye Bufan secara tidak sengaja ter transported ke dunia fantasi dan mendapatkan warisan pengobatan kuno. Sejak saat itu, ia menguasai keterampilan medis, berlatih bela diri, dan memenangkan hati banyak wanita cantik.\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 11, 150, 'storage/series/fmCK7Ztt9GNL5E3NJRrl7afaalFmOdWNmQgkiKKs.webp', 'Xing Yi Kai Chen', '2024-10-02', 6.7, 'ongoing', 'ona', '2026-01-31 10:50:53', '2026-02-07 00:38:12'),
(16, 'Tales of Herding Gods', '[\"Mushen Ji, Mu Shen Ji, ToHG, \\u7267\\u795e\\u8bb0, Tales of Herding Gods\"]', 'tales-of-herding-gods', 'Di Desa Lansia Penyandang Disabilitas, hiduplah sembilan lansia dengan asal-usul yang tak terduga dan seorang pemuda bernama Qin Mu yang mereka besarkan. Suatu hari, sapi-sapi yang digembalakan Qin Mu mulai berbicara seperti manusia. Sejak saat itu, Qin Mu menjadi lebih menyadari bahaya dan keindahan Daxu, tanah yang ditinggalkan para dewa: iblis turun dengan kegelapan, tulang-tulang ilahi menari di reruntuhan, dan tulang naga melindungi anak-anak mereka, sebuah kapal raksasa yang menyeret matahari... Apa pun bahaya yang dihadapinya, Qin Mu tidak takut. Ia telah mengintegrasikan keterampilan yang diwariskan oleh Sembilan Tetua dan bersumpah untuk menciptakan dunia dengan hegemoni yang tak tertandingi.\r\n\r\n(Sumber: Bilibili, diterjemahkan)', 20, NULL, 'storage/series/4ac8f492-784c-4281-bdd0-31d0201460c0.webp', 'Sparkly Key Animation Studio', '2024-10-27', 8.2, 'ongoing', 'ona', '2026-01-31 10:51:50', '2026-01-31 20:42:26'),
(17, 'Martial Conqueror of the Cosmos', '[\"Wu Sui Xinghe, Martial Shattered Galaxy, \\u6b66\\u788e\\u661f\\u6cb3, Martial Conqueror of the Cosmos\"]', 'martial-conqueror-of-the-cosmos', 'Mencari orang tuanya, pemuda gunung Jiang Han memulai perjalanan kultivasi. Ia secara tidak sengaja mengaktifkan Kuali Binatang Surgawi, warisan dari ibunya, dan membangkitkan kekuatan sihir tertinggi! Sejak saat itu, ia menentang takdir dan mengubah nasibnya! Ia bertempur melawan langit dan bumi! Di medan perang tempat para dewa gugur, ia bertarung dalam pertempuran berdarah melawan berbagai ras, mengukir jalan menuju surga dengan tubuh fana-nya! Ia bersumpah untuk berjuang demi masa depan yang cerah bagi umat manusia!\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 10, NULL, 'storage/series/2c897811-639f-4198-a2c6-48b8a0c999ef.webp', 'Suoyi Technology', '2025-08-17', 0, 'ongoing', 'ona', '2026-01-31 10:54:25', '2026-02-04 18:20:52'),
(18, 'Beyond Time\'s Gaze', '[\"Guangyin Zhi Wai, Outside of Time, Beyond Time, Beyond the Timescape, \\u5149\\u9634\\u4e4b\\u5916, Beyond Time\'s Gaze\"]', 'beyond-times-gaze', 'Dunia adalah tempat tinggal sementara bagi semua makhluk, dan waktu mengalir seperti para pelancong yang lewat. Di tempat langit yang hancur membuka mata mengerikannya, kehidupan binasa dan zona-zona menjadi terlarang. Dalam kiamat, konsekuensi pun terjadi, dan kehidupan muncul dari kematian.\r\n\r\n(Sumber: Youku)', 25, 26, 'storage/series/010d6404-5d8a-4037-a7e5-5c9397e2d6b8.webp', 'Yien Animation Studio, Flying Fish Studio', '2025-12-28', 7.5, 'ongoing', 'ona', '2026-01-31 10:55:21', '2026-01-31 19:08:01'),
(19, 'The Daily Life of the Immortal King 5', '[\"Xian Wang de Richang Shenghuo 5\",\"Xian Wang de Richang Shenghuo 5th Season\",\"The Daily Life of the Immortal King 5th Season\",\"\\u4e0d\\u6b7b\\u8eab\\u306a\\u50d5\\u306e\\u65e5\\u5e38 5\\u671f\",\"\\u4ed9\\u738b\\u7684\\u65e5\\u5e38\\u751f\\u6d3b \\u7b2c\\u4e94\\u5b63\",\"The Daily Life of the Immortal King 5\"]', 'the-daily-life-of-the-immortal-king-5', 'Fifth season of Xian Wang de Richang Shenghuo.', 18, 12, 'storage/series/91f1b370-c152-4567-9c87-0806bddf7077.webp', 'Liyu Culture', '2025-12-14', 7.5, 'ongoing', 'ona', '2026-01-31 10:56:38', '2026-01-31 19:11:26'),
(20, 'Swallowed Star', '[\"Tunshi Xingkong\",\"\\u541e\\u566c\\u661f\\u7a7a\",\"Swallowed Star\"]', 'swallowed-star', 'Suatu hari, virus RR yang tidak dikenal muncul di bumi, dan dunia jatuh ke dalam bencana. Hewan yang terinfeksi bermutasi menjadi monster yang menakutkan dan menyerang secara besar-besaran. Ketika manusia menghadapi kehancuran, mereka membangun tembok dan kota-kota sebagai benteng terakhir umat manusia. Cobaan yang dialami umat manusia selama periode waktu ini disebut', 21, 0, 'storage/series/d7435719-dcec-4c76-93d6-70070fe98059.webp', 'Sparkly Key Animation Studio', '2020-11-29', 8.1, 'complete', 'ona', '2026-02-02 04:15:58', '2026-02-02 04:30:34'),
(21, 'Apotheosis Season 3', '[\"Bai Lian Cheng Shen 3\",\"Bai Lian Cheng Shen 3rd Season\",\"\\u767e\\u70bc\\u6210\\u795e \\u7b2c\\u4e09\\u5b63\",\"Apotheosis Season 3\",\"Apotheosis 3rd Season\",\"\\u767e\\u70bc\\u6210\\u795e3\",\"Apotheosis 3\"]', 'apotheosis-season-3', 'To resurrect his beloved Ning Yudie, Luo Zheng embarks on a heaven-defying path unlike any before. At the Tianyu Realm, he turns against Tianqiong, yet beneath the Shenqi Tower, they fight together. Through blurred lines of love and hatred, and trials that temper flesh and bone, he forges his path to divinity. Now, having ascended to the superior realm, Luo Zheng is determined to break the chains of fate and become the one truly free from destiny\'s grasp... But a deadly threat that exists beyond even heaven\'s will is now closing in.\r\n\r\n(Source: Youku)', 23, 52, 'storage/series/c131368d-0682-47dd-93d0-0f4d6428c966.webp', 'Qingxiang Culture', '2025-12-09', 0, 'ongoing', 'ona', '2026-02-02 04:26:42', '2026-02-02 05:44:08'),
(22, 'The Alchemist\'s Rise', '[\"Aoshi Dan Shen, World Defying Dan God, The Proud God of Alchemy, \\u50b2\\u4e16\\u4e39\\u795e, The Alchemist\'s Rise\"]', 'the-alchemists-rise', 'Terlahir dengan disabilitas, dan mengambil risiko besar, Shen Xiang berkelana ke negeri berbahaya untuk mencari obat guna membuka meridian spiritualnya. Tanpa diduga, ia menyelamatkan dua dewi yang terluka, satu dewi ilahi dan satu dewi iblis, yang kemudian membangkitkan meridian ilahinya sendiri. Melindungi ayah dan keluarganya, ia menjadi seorang alkemis legendaris!\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 20, 12, 'storage/series/dc6757e2-be27-47c7-9e47-198ba694f798.webp', 'Ruo Hong Culture', '2025-12-02', 0, 'complete', 'ona', '2026-02-02 18:37:08', '2026-02-03 01:57:28'),
(23, 'Sword and Fairy 3', '[\"Xian Jian Qi Xia Zhuan San, \\u4ed9\\u5251\\u5947\\u4fa0\\u4f20\\u4e09, Xian Jian Qi Xia Zhuan 3, Chinese Paladin 3, Xian Jian Qi Xia Chuan San, \\u4ed9\\u5251\\u5947\\u4fa0\\u4f20\\u53c1, Sword and Fairy 3\"]', 'sword-and-fairy-3', 'Seribu tahun yang lalu, jenderal ilahi Fei Peng dan Raja Iblis Chong Lou terlibat dalam pertempuran sengit di Alam Abadi Baru. Pedang ilahi \"Zhao Dan\" jatuh ke dunia fana, dan Fei Peng diturunkan ke bumi. Seribu tahun kemudian, Menara Iblis Kunci Gunung Shu bergetar, dan reinkarnasi Fei Peng, Jing Tian, ​​yang memperoleh pedang iblis, memulai petualangan bersama Tang Xuejian, Xu Changqing, dan Zi Xuan untuk mengumpulkan Lima Bola Roh dan menyegel Menara Iblis Kunci.', 22, 26, 'storage/series/4c64c433-3bf0-42c7-ab6d-b1b82e351be9.webp', 'Year Young Culture', '2025-12-30', 0, 'ongoing', 'ona', '2026-02-02 18:40:40', '2026-02-03 01:52:44'),
(24, 'Divine Manifestation', '[\"Tian Xiang, \\u5929\\u76f8, Divine Manifestation\"]', 'divine-manifestation', 'Lima belas tahun yang lalu, Kota Luofeng dilanda bencana aneh, berubah menjadi reruntuhan yang sunyi dan mati dalam semalam. Ding Xiao muda, yang lahir pada usia tujuh tahun, diberi tempat di Divisi Roh Kota. Namun, ia menghancurkan rohnya sendiri dan menjadi pembawa peti mati untuk Suku Gui. Selama lima tahun, ia mengalami pasang surut kehidupan. Tanpa diduga, ia membangkitkan kemampuan fisiknya di tengah kesulitan, unggul dalam penilaian promosi, dan menjadi sosok yang ditakuti di Divisi Roh. Sekarang, roh jahat muncul di segala arah, dan peristiwa aneh tak ada habisnya. Untuk menyembuhkan penyakit adiknya, Ding Ling, yang semakin aneh, Ding Xiao dengan tekad memulai kembali perjalanan kebangkitan spiritualnya, hanya untuk terseret ke dalam pusaran intrik politik yang tak terduga. Kebenaran tersembunyi Kota Luofeng secara bertahap terungkap, dan di balik semua ini, nasib Ding Ling terjalin erat...\r\n\r\n(Sumber: Youku, diterjemahkan)', 21, 26, 'storage/series/7f2a5873-30ae-44cd-a279-9dc6652d49d5.webp', 'Honglu Technology', '2025-10-15', 0, 'ongoing', 'ona', '2026-02-03 02:09:31', '2026-02-03 03:46:45'),
(25, 'Paw & Palaces', '[\"Zi Jin: Yu Miao Fang\",\"Forbidden City: Cat Imperial Study\",\"Paw & Palaces\",\"\\u7d2b\\u7981\\u00b7\\u5fa1\\u55b5\\u623f\",\"Paws & Palaces\"]', 'paw-palaces', 'Di Kota Terlarang, yang memiliki sejarah panjang dan warisan budaya yang mendalam, hiduplah banyak kucing lucu. Dari sudut pandang manusia, mereka menjalani kehidupan yang menyenangkan dan santai. Di antara mereka, enam kucing kerajaan sangat istimewa. Mereka bertanggung jawab untuk melindungi ingatan akan peninggalan budaya \"Wuhua.\" Mereka memasuki dunia Wuhua dan mengalahkan penghancur Burung Hantu Hitam berkali-kali, membawa dunia Wuhua kembali ke jalur yang benar dan dengan demikian melindungi peninggalan budaya tersebut.\r\n\r\nEnam kucing kerajaan tersebut adalah Luban dan Momo dari kelas sastra, dan Shuangmei, Aobai, Pingan, dan Xiaozai dari kelas bela diri. Mereka tidak hanya cerdas dan berani, tetapi juga memiliki pemahaman yang mendalam. Mereka membentuk Ruang Kucing Kerajaan Kota Terlarang, yang melindungi harta nasional dunia.\r\n\r\n(Sumber: iQIYI, diterjemahkan)', 21, 16, 'storage/series/defab6ae-80eb-410e-9ffa-d90d811cfef4.webp', 'Colored Pencil Animation', '2025-12-03', 0, 'ongoing', 'ona', '2026-02-03 19:06:28', '2026-02-03 23:58:12'),
(26, 'Purple River S2', '[\"Zi Chuan 2nd Season\",\"Zichuan 2nd Season\",\"\\u7d2b\\u5ddd \\u7b2c2\\u5b63\",\"Purple River 2nd Season\"]', 'purple-river-s2', 'Untuk menghilangkan kecurigaan, kata-kata adalah pertahanan terlemah. Kekuatan sejati berbicara sendiri! Jenderal Zichuan Xiu, yang pernah seorang diri mengeksekusi seorang pengkhianat klan Zichuan di dalam benteng Klan Iblis, telah bangkit memimpin ratusan ribu pasukan sekutu di Timur Jauh. Didukung oleh Tetua Penjaga Kuil Suci, prajurit ini sekarang naik tahta sebagai penguasa baru tanah Timur: Raja Terang dinobatkan!\r\n\r\n(Sumber: WeTV)', 20, 52, 'storage/series/4076694b-81b2-4f79-aafe-54645e609d19.webp', 'BUILD DREAM', '2025-07-30', 0, 'ongoing', 'ona', '2026-02-03 19:10:14', '2026-02-03 19:23:04'),
(27, 'Soul Land: Sword Dao Chen Xin', '[\"Douluo Dalu: Jiandao Chen Xin, \\u6597\\u7f57\\u5927\\u9646\\u5267\\u573a\\u7248 \\u5251\\u9053\\u5c18\\u5fc3, Soul Land: Sword Master, Soul Land Movie\"]', 'soul-land-sword-dao-chen-xin', 'Dua puluh tahun sebelum pertempuran Douluo terakhir, Aula Roh telah berkonspirasi untuk menyatukan seluruh dunia master roh dan mencaplok semua sekte. Sekte Ubin Berkilau Tujuh Harta Karun adalah yang pertama terkena dampaknya dan jatuh ke dalam bahaya. Bone Douluo membawa tuan muda sekte tersebut, Ning Rongrong yang berusia lima tahun, untuk meminta Sword Douluo menyelamatkan mereka. Maka Sword Douluo Chenxin membawa Rongrong kecil dalam pelarian hidup dan mati. Namun, yang tidak mereka ketahui adalah bahwa di balik jalan ini terdapat konspirasi besar yang akan memengaruhi Benua Douluo...\r\n\r\n(Sumber: Tencent, diterjemahkan oleh Google)', 92, 1, 'storage/series/c8c4cd90-95ac-4ed6-b399-97460c8a4afa.webp', 'Sparkly Key Animation Studio', '2025-07-12', 7.4, 'complete', 'movie', '2026-02-04 00:03:18', '2026-02-04 00:09:49'),
(28, 'Eclipse of Illusion', '[\"Yun Shen Buzhi Meng, Veiled Dreams, \\u4e91\\u6df1\\u4e0d\\u77e5\\u68a6, Eclipse of Illusion\"]', 'eclipse-of-illusion', 'Pernikahan Yun Wangshu seharusnya menjadi hari paling bahagia dalam hidupnya, tetapi sebuah konspirasi brutal mengubahnya menjadi mimpi buruk, membantai seluruh klannya. Setelah lolos dari maut, ia membuat kesepakatan putus asa dengan Pengadilan Senyap. Kini, enam puluh tahun kemudian, terlahir kembali sebagai Xihe yang tanpa ampun, ia siap membuat musuh-musuhnya berdarah atas semua yang telah mereka ambil darinya.\r\n\r\n(Sumber: Youku)', 23, 26, 'storage/series/47481bd0-d61b-4a7a-ae91-a94435786426.webp', 'Yien Animation Studio', '2025-07-05', 7.4, 'complete', 'ona', '2026-02-04 00:20:11', '2026-02-04 22:07:38'),
(29, 'Throne of Seal 2nd Season', '[\"Shen Yin Wangzuo 2nd Season\",\"ToS\",\"\\u795e\\u5370\\u738b\\u5ea7 \\u7b2c\\u4e8c\\u5b63\",\"Throne of Seal 2nd Season\"]', 'throne-of-seal-2nd-season', 'Setelah mengungkapkan dirinya sebagai Ksatria Ganda, Long Hao Chen meraih kemenangan dalam pertandingannya di kuilnya dan melaju ke babak final. Namun sebelum babak final dimulai, pertandingan pemeringkatan diadakan di setiap kuil untuk menentukan yang terkuat di dalamnya. Selama pemeringkatan, Hao Chen terluka, membuat Sheng Cai\'er marah dan mendorongnya untuk membalas dendam atas apa yang terjadi padanya. Tindakannya menyebabkan pertarungan antara Kuil Ksatria dan Kuil Pembunuh, yang akhirnya diredam setelah sebuah pengungkapan mengejutkan—bahwa Sheng Cai\'er adalah seorang Saint yang bereinkarnasi.\r\n\r\nBabak final Kompetisi Tim Pemburu Iblis dimulai dengan pembagian enam puluh peserta yang tersisa menjadi enam kelompok. Enam belas peserta teratas kemudian diadu satu sama lain untuk menentukan tiga teratas. Masing-masing dari tiga teratas akan diberi hadiah berupa tungku spiritual dan hak untuk memilih rekan satu tim mereka.\r\n\r\nUntuk menjadi seorang ksatria yang mampu mengalahkan Raja Iblis, Long Hao Chen harus berusaha untuk menjadi yang pertama dalam kompetisi ini sehingga ia dapat memilih rekan satu tim terbaik untuk memberinya kesempatan bertarung.\r\n\r\n[Ditulis oleh MAL Rewrite]', 20, NULL, 'storage/series/0abceb49-926c-4100-bcb7-8cb689a637c1.webp', 'Shenman Entertainment', '2022-11-10', 8.2, 'ongoing', 'ona', '2026-02-04 03:53:24', '2026-02-04 04:35:31'),
(30, 'Sword of Coming S2', '[\"Jian Lai 2nd Season\",\"The Swords 2nd Season\",\"Sword of Coming 2nd Season\",\"The Sword Comes 2nd Season\",\"\\u5251\\u6765 \\u7b2c\\u4e8c\\u5b63\",\"The Swords 2\"]', 'sword-of-coming-s2', 'Setelah Gua Surga Li Zhu runtuh, Chen Ping\'an memikul tanggung jawab besar untuk mengawal Li Baoping dan yang lainnya ke Great Sui untuk belajar. Perjalanan mereka sangat berbahaya, dengan musuh dan ancaman supernatural di sepanjang jalan, tetapi mereka menerima bantuan dari pendekar pedang misterius A Liang dan tokoh-tokoh kuat lainnya. Melakukan perjalanan jauh dan bertempur dalam banyak pertempuran, pemuda itu menjadi lebih kuat sambil mempelajari beratnya tanggung jawab.\r\n\r\n(Sumber: WeTV)', 30, 26, 'storage/series/f0d48804-f951-45e6-ac9c-691bae665ce2.webp', 'Cloud Art', '2025-12-25', 7.3, 'ongoing', 'ona', '2026-02-04 18:18:49', '2026-02-04 18:31:28'),
(31, 'Perfect World', '[\"Wanmei Shijie\",\"PW\",\"\\u5b8c\\u7f8e\\u4e16\\u754c\",\"Perfect World\"]', 'perfect-world', 'Terlahir di dunia unik di mana desa-desa saling berebut kekuasaan dan kendali, tokoh utama, Shi Hao, adalah seorang jenius yang diberkati surga namun lahir dalam kondisi termiskin.\r\n\r\nNamun, klannya memiliki masa lalu yang misterius. Untuk bangkit dan menjadi jenius seperti yang seharusnya, klan tersebut melakukan segala upaya untuk membantu kultivasinya sambil melawan monster-monster fanatik dan terlibat dalam perebutan kekuasaan dengan klan lain.\r\n\r\nPerjalanannya akan membawanya melalui negeri-negeri yang tidak dikenal hingga ia mampu menjadi seseorang yang benar-benar dapat mengguncang dunia.\r\n\r\n(Sumber: Novel Xianxia & Xuanhuan Wiki)', 19, 286, 'storage/series/4cc9b27a-eb49-408c-b18a-e98025c95350.webp', 'Foch Film', '2021-04-23', 7.9, 'ongoing', 'ona', '2026-02-05 03:56:51', '2026-02-05 04:06:50'),
(32, 'Wind Driver in Tang Dynasty', '[\"Da Tang Chengfeng Lu\",\"Da Tang Cheng Feng Lu\",\"Records of the Tang Dynasty\",\"\\u5927\\u5510\\u4e58\\u98ce\\u5f55\",\"Wind Driver in Tang Dynasty\"]', 'wind-driver-in-tang-dynasty', 'Mu Tianhou, yang terkenal dengan kemampuan luar biasanya, tiba-tiba diserang, menyebabkan kegemparan di dunia bela diri. Dua murid yang jujur, Zheng Dongting dan Zu Beiqiu (dua bersaudara yang tidak berguna), bertemu karena hal ini. Untuk membantu adik mereka, Zu Beiqiu, menemukan istrinya yang sudah sepuluh tahun tidak ia temui, dan juga untuk menemukan pembunuh sebenarnya yang membunuh guru mereka, seorang polisi terkenal dan seorang anak orang kaya generasi kedua secara tidak sengaja bekerja sama untuk menjelajahi dunia dan memulai perjalanan penuh petualangan mengantarkan surat cerai sejauh ribuan mil.\r\n\r\nKeduanya tiba di keluarga Luo di Yangzhou, tetapi malah menemukan pembantaian keluarga Luo dan disalahpahami sebagai pembunuhnya. Mereka disebut \"dua penjahat Dataran Tengah.\" Di antara keduanya, Zheng Dongting memiliki kemampuan bela diri yang tidak dapat ia gunakan, sementara Zu Beiqiu memiliki kemampuan bela diri yang tidak ia ketahui cara menggunakannya. Meskipun kedua bersaudara itu berniat untuk membersihkan nama mereka, kesalahpahaman berbagai faksi di dunia bela diri terus semakin dalam, dan para praktisi bela diri yang menjunjung kebenaran bangkit untuk menyerang mereka. Setelah mengalami banyak situasi berbahaya, keduanya menemukan bahwa ini adalah konspirasi besar yang ditujukan kepada mereka...\r\n\r\n(Sumber: iQIYI, diterjemahkan oleh Google)', 20, 26, 'storage/series/3e9b0658-1f4d-447c-8aca-4bee6bcd3cfb.webp', NULL, '2025-09-25', 0, 'ongoing', 'ona', '2026-02-05 06:07:29', '2026-02-05 06:12:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `servers`
--

CREATE TABLE `servers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `servers`
--

INSERT INTO `servers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dailymotion[ADS]', '2026-01-29 07:33:21', '2026-02-06 03:23:45'),
(2, 'Okru', '2026-01-29 07:33:21', '2026-01-29 07:33:21'),
(4, 'Ruby[ADS]', '2026-02-06 01:38:35', '2026-02-06 01:38:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('azmpeJSK7wJQyNbpoa9ODXx9OK52ekwY31ZGr0u6', 1, '212.85.25.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNHpxUzMzRmdhNW9RR2pqMnY5eFpZdnlqOVE3NnZtcXNScU9uS0ZtRCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozOToiaHR0cHM6Ly9kb25nd29ybGQtYWRtaW4ud2Vic2l0ZWt1LnNwYWNlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHBzOi8vZG9uZ3dvcmxkLWFkbWluLndlYnNpdGVrdS5zcGFjZS9nZW5yZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1770471114);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Losss', 'superadmin', NULL, '$2y$12$QCuEd4JEAc.v7bjncY3OzuTHljIaCiitgaslX0/z/.LofSBFFMVuq', 1, NULL, '2026-01-29 07:33:20', '2026-01-29 07:33:20'),
(2, 'Yunshan', 'yunshan', NULL, '$2y$12$ELsItrr6zZbmvMyzgogJt.3ZAYg6HgKbwfBNAHkL39yxX/fvUb5fe', 1, NULL, '2026-01-29 07:33:21', '2026-01-29 07:33:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `series_id` bigint(20) UNSIGNED NOT NULL,
  `episode_id` bigint(20) UNSIGNED NOT NULL,
  `views` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `views`
--

INSERT INTO `views` (`id`, `series_id`, `episode_id`, `views`, `created_at`, `updated_at`) VALUES
(2, 3, 51, 9, '2026-01-28 16:00:00', '2026-01-29 07:52:42'),
(3, 3, 52, 7, '2026-01-28 16:00:00', '2026-01-29 07:52:44'),
(4, 5, 56, 3, '2026-01-28 16:00:00', '2026-01-29 08:29:21'),
(5, 5, 57, 4, '2026-01-28 16:00:00', '2026-01-29 08:29:31'),
(6, 5, 58, 1, '2026-01-28 16:00:00', '2026-01-29 08:29:33'),
(7, 5, 59, 1, '2026-01-28 16:00:00', '2026-01-29 08:29:34'),
(8, 5, 60, 1, '2026-01-28 16:00:00', '2026-01-29 08:29:35'),
(9, 5, 61, 1, '2026-01-28 16:00:00', '2026-01-29 08:29:36'),
(10, 5, 67, 1, '2026-01-28 16:00:00', '2026-01-29 08:55:22'),
(11, 5, 70, 12, '2026-01-29 16:00:00', '2026-01-29 21:29:05'),
(12, 5, 67, 1, '2026-01-29 16:00:00', '2026-01-29 21:33:59'),
(14, 12, 72, 38, '2026-01-29 16:00:00', '2026-01-29 22:57:28'),
(15, 12, 73, 4, '2026-01-29 16:00:00', '2026-01-29 23:28:17'),
(17, 10, 77, 24, '2026-01-29 16:00:00', '2026-01-30 04:04:32'),
(18, 11, 78, 26, '2026-01-29 16:00:00', '2026-01-30 05:32:47'),
(19, 11, 79, 3, '2026-01-29 16:00:00', '2026-01-30 05:35:48'),
(20, 9, 68, 1, '2026-01-29 16:00:00', '2026-01-30 05:57:05'),
(21, 5, 54, 3, '2026-01-29 16:00:00', '2026-01-30 06:24:28'),
(22, 6, 81, 3, '2026-01-29 16:00:00', '2026-01-30 07:07:33'),
(23, 6, 80, 1, '2026-01-29 16:00:00', '2026-01-30 07:07:56'),
(24, 12, 74, 1, '2026-01-29 16:00:00', '2026-01-30 07:12:49'),
(25, 6, 82, 1, '2026-01-29 16:00:00', '2026-01-30 07:37:18'),
(26, 6, 83, 2, '2026-01-29 16:00:00', '2026-01-30 07:59:09'),
(27, 8, 84, 20, '2026-01-29 16:00:00', '2026-01-30 08:25:13'),
(28, 6, 85, 1, '2026-01-29 16:00:00', '2026-01-30 08:53:46'),
(29, 6, 86, 1, '2026-01-29 16:00:00', '2026-01-30 09:22:24'),
(30, 6, 87, 1, '2026-01-29 16:00:00', '2026-01-30 09:22:53'),
(31, 11, 93, 2, '2026-01-29 16:00:00', '2026-01-30 09:51:36'),
(32, 6, 95, 1, '2026-01-29 16:00:00', '2026-01-30 09:52:07'),
(33, 6, 96, 1, '2026-01-29 16:00:00', '2026-01-30 10:00:37'),
(34, 6, 97, 1, '2026-01-29 16:00:00', '2026-01-30 10:40:02'),
(35, 6, 98, 1, '2026-01-29 16:00:00', '2026-01-30 10:40:28'),
(36, 6, 99, 1, '2026-01-29 16:00:00', '2026-01-30 10:44:52'),
(37, 6, 100, 1, '2026-01-29 16:00:00', '2026-01-30 10:59:16'),
(38, 6, 101, 1, '2026-01-29 16:00:00', '2026-01-30 11:07:23'),
(39, 6, 102, 3, '2026-01-29 16:00:00', '2026-01-30 11:27:13'),
(40, 6, 103, 1, '2026-01-29 16:00:00', '2026-01-30 11:44:38'),
(41, 11, 78, 9, '2026-01-30 16:00:00', '2026-01-30 16:12:40'),
(42, 12, 72, 7, '2026-01-30 16:00:00', '2026-01-30 16:31:02'),
(43, 8, 84, 21, '2026-01-30 16:00:00', '2026-01-30 16:42:31'),
(44, 10, 77, 11, '2026-01-30 16:00:00', '2026-01-30 18:27:10'),
(45, 13, 104, 25, '2026-01-30 16:00:00', '2026-01-30 20:13:24'),
(46, 13, 105, 18, '2026-01-30 16:00:00', '2026-01-30 20:30:42'),
(47, 13, 106, 16, '2026-01-30 16:00:00', '2026-01-30 20:45:36'),
(48, 6, 102, 4, '2026-01-30 16:00:00', '2026-01-30 23:06:42'),
(49, 14, 114, 4, '2026-01-30 16:00:00', '2026-01-31 03:28:05'),
(50, 14, 115, 55, '2026-01-30 16:00:00', '2026-01-31 03:47:12'),
(51, 14, 107, 3, '2026-01-30 16:00:00', '2026-01-31 04:37:06'),
(52, 5, 63, 7, '2026-01-30 16:00:00', '2026-01-31 04:59:32'),
(53, 5, 64, 4, '2026-01-30 16:00:00', '2026-01-31 04:59:44'),
(54, 5, 62, 6, '2026-01-30 16:00:00', '2026-01-31 04:59:46'),
(55, 5, 61, 3, '2026-01-30 16:00:00', '2026-01-31 05:01:22'),
(56, 5, 65, 4, '2026-01-30 16:00:00', '2026-01-31 05:20:08'),
(57, 5, 66, 3, '2026-01-30 16:00:00', '2026-01-31 05:33:07'),
(58, 5, 67, 3, '2026-01-30 16:00:00', '2026-01-31 05:34:56'),
(59, 5, 70, 4, '2026-01-30 16:00:00', '2026-01-31 05:45:09'),
(60, 9, 68, 2, '2026-01-30 16:00:00', '2026-01-31 07:15:34'),
(61, 7, 69, 2, '2026-01-30 16:00:00', '2026-01-31 07:16:10'),
(62, 12, 75, 3, '2026-01-30 16:00:00', '2026-01-31 07:18:32'),
(63, 12, 74, 3, '2026-01-30 16:00:00', '2026-01-31 07:19:53'),
(64, 6, 95, 2, '2026-01-30 16:00:00', '2026-01-31 07:28:36'),
(65, 6, 81, 2, '2026-01-30 16:00:00', '2026-01-31 07:28:47'),
(66, 6, 87, 2, '2026-01-30 16:00:00', '2026-01-31 07:29:28'),
(67, 6, 101, 2, '2026-01-30 16:00:00', '2026-01-31 07:29:37'),
(68, 6, 82, 2, '2026-01-30 16:00:00', '2026-01-31 07:29:47'),
(69, 6, 86, 2, '2026-01-30 16:00:00', '2026-01-31 07:29:59'),
(70, 6, 99, 2, '2026-01-30 16:00:00', '2026-01-31 07:30:09'),
(71, 6, 103, 2, '2026-01-30 16:00:00', '2026-01-31 07:30:18'),
(72, 6, 97, 2, '2026-01-30 16:00:00', '2026-01-31 07:30:54'),
(73, 14, 109, 2, '2026-01-30 16:00:00', '2026-01-31 07:32:44'),
(74, 14, 108, 2, '2026-01-30 16:00:00', '2026-01-31 07:33:02'),
(75, 14, 110, 2, '2026-01-30 16:00:00', '2026-01-31 07:33:23'),
(76, 14, 112, 2, '2026-01-30 16:00:00', '2026-01-31 07:33:44'),
(77, 5, 58, 2, '2026-01-30 16:00:00', '2026-01-31 07:33:54'),
(78, 5, 57, 3, '2026-01-30 16:00:00', '2026-01-31 07:34:23'),
(79, 5, 59, 2, '2026-01-30 16:00:00', '2026-01-31 07:34:32'),
(80, 14, 111, 2, '2026-01-30 16:00:00', '2026-01-31 07:34:42'),
(81, 5, 55, 3, '2026-01-30 16:00:00', '2026-01-31 07:34:55'),
(82, 3, 52, 2, '2026-01-30 16:00:00', '2026-01-31 08:59:31'),
(83, 3, 51, 2, '2026-01-30 16:00:00', '2026-01-31 08:59:40'),
(84, 6, 98, 2, '2026-01-30 16:00:00', '2026-01-31 08:59:51'),
(85, 6, 96, 2, '2026-01-30 16:00:00', '2026-01-31 09:00:00'),
(86, 6, 83, 2, '2026-01-30 16:00:00', '2026-01-31 09:00:42'),
(87, 6, 85, 2, '2026-01-30 16:00:00', '2026-01-31 09:01:45'),
(88, 11, 79, 2, '2026-01-30 16:00:00', '2026-01-31 09:01:57'),
(89, 11, 88, 2, '2026-01-30 16:00:00', '2026-01-31 09:02:38'),
(90, 11, 90, 2, '2026-01-30 16:00:00', '2026-01-31 09:03:06'),
(91, 12, 73, 3, '2026-01-30 16:00:00', '2026-01-31 09:03:50'),
(92, 14, 113, 2, '2026-01-30 16:00:00', '2026-01-31 09:04:24'),
(93, 5, 56, 3, '2026-01-30 16:00:00', '2026-01-31 09:05:47'),
(94, 6, 80, 2, '2026-01-30 16:00:00', '2026-01-31 09:19:32'),
(95, 6, 100, 2, '2026-01-30 16:00:00', '2026-01-31 09:20:44'),
(96, 5, 54, 2, '2026-01-30 16:00:00', '2026-01-31 09:21:27'),
(97, 5, 60, 3, '2026-01-30 16:00:00', '2026-01-31 09:26:03'),
(98, 8, 123, 1, '2026-01-30 16:00:00', '2026-01-31 10:47:53'),
(99, 8, 122, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:00'),
(100, 8, 121, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:01'),
(101, 8, 120, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:03'),
(102, 8, 119, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:05'),
(103, 8, 118, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:07'),
(104, 8, 117, 1, '2026-01-30 16:00:00', '2026-01-31 10:48:09'),
(105, 8, 116, 3, '2026-01-30 16:00:00', '2026-01-31 10:48:11'),
(106, 11, 91, 2, '2026-01-30 16:00:00', '2026-01-31 10:54:04'),
(107, 11, 93, 2, '2026-01-30 16:00:00', '2026-01-31 10:54:13'),
(108, 11, 92, 2, '2026-01-30 16:00:00', '2026-01-31 10:54:35'),
(109, 11, 89, 2, '2026-01-30 16:00:00', '2026-01-31 10:54:45'),
(110, 11, 94, 2, '2026-01-30 16:00:00', '2026-01-31 10:55:43'),
(111, 15, 127, 2, '2026-01-30 16:00:00', '2026-01-31 11:05:06'),
(112, 15, 128, 2, '2026-01-30 16:00:00', '2026-01-31 11:05:09'),
(113, 15, 129, 1, '2026-01-30 16:00:00', '2026-01-31 11:07:36'),
(114, 15, 130, 3, '2026-01-30 16:00:00', '2026-01-31 11:07:38'),
(115, 15, 131, 3, '2026-01-30 16:00:00', '2026-01-31 11:07:40'),
(116, 15, 132, 1, '2026-01-30 16:00:00', '2026-01-31 11:07:53'),
(117, 15, 133, 1, '2026-01-30 16:00:00', '2026-01-31 11:07:56'),
(118, 15, 134, 1, '2026-01-30 16:00:00', '2026-01-31 11:07:58'),
(119, 15, 135, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:00'),
(120, 15, 136, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:02'),
(121, 15, 137, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:04'),
(122, 15, 138, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:06'),
(123, 15, 139, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:08'),
(124, 15, 140, 1, '2026-01-30 16:00:00', '2026-01-31 11:08:11'),
(125, 15, 124, 6, '2026-01-30 16:00:00', '2026-01-31 11:18:10'),
(127, 4, 142, 13, '2026-01-31 16:00:00', '2026-01-31 17:26:58'),
(128, 17, 143, 19, '2026-01-31 16:00:00', '2026-01-31 17:50:38'),
(129, 13, 106, 16, '2026-01-31 16:00:00', '2026-01-31 18:16:39'),
(130, 14, 115, 20, '2026-01-31 16:00:00', '2026-01-31 18:53:01'),
(131, 18, 150, 57, '2026-01-31 16:00:00', '2026-01-31 18:59:38'),
(132, 5, 59, 11, '2026-01-31 16:00:00', '2026-01-31 19:08:36'),
(133, 19, 151, 16, '2026-01-31 16:00:00', '2026-01-31 19:41:29'),
(134, 11, 78, 12, '2026-01-31 16:00:00', '2026-01-31 20:06:33'),
(135, 12, 75, 4, '2026-01-31 16:00:00', '2026-01-31 20:13:05'),
(136, 12, 74, 3, '2026-01-31 16:00:00', '2026-01-31 20:13:05'),
(137, 12, 73, 2, '2026-01-31 16:00:00', '2026-01-31 20:13:06'),
(138, 12, 72, 4, '2026-01-31 16:00:00', '2026-01-31 20:13:06'),
(139, 7, 69, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:18'),
(140, 18, 149, 12, '2026-01-31 16:00:00', '2026-01-31 20:13:24'),
(141, 18, 148, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:25'),
(142, 18, 147, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:25'),
(143, 18, 146, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:26'),
(144, 18, 145, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:27'),
(145, 18, 144, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:27'),
(146, 15, 140, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:29'),
(147, 15, 139, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:30'),
(148, 15, 138, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:30'),
(149, 15, 137, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:31'),
(150, 15, 136, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:31'),
(151, 15, 135, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:32'),
(152, 15, 134, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:33'),
(153, 15, 133, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:33'),
(154, 15, 132, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:34'),
(155, 15, 131, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:34'),
(156, 15, 130, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:35'),
(157, 15, 129, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:35'),
(158, 15, 128, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:36'),
(159, 15, 127, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:36'),
(160, 15, 126, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:37'),
(161, 15, 125, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:38'),
(162, 15, 124, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:38'),
(163, 14, 114, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:39'),
(164, 14, 113, 12, '2026-01-31 16:00:00', '2026-01-31 20:13:39'),
(165, 14, 112, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:40'),
(166, 14, 111, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:40'),
(167, 14, 110, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:41'),
(168, 14, 109, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:41'),
(169, 14, 108, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:42'),
(170, 14, 107, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:42'),
(171, 8, 123, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:44'),
(172, 8, 122, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:44'),
(173, 8, 121, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:45'),
(174, 8, 120, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:45'),
(175, 8, 119, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:46'),
(176, 8, 118, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:46'),
(177, 8, 117, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:47'),
(178, 8, 116, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:47'),
(179, 8, 84, 11, '2026-01-31 16:00:00', '2026-01-31 20:13:48'),
(180, 13, 104, 15, '2026-01-31 16:00:00', '2026-01-31 20:13:48'),
(181, 13, 105, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:49'),
(182, 6, 80, 56, '2026-01-31 16:00:00', '2026-01-31 20:13:50'),
(183, 6, 81, 20, '2026-01-31 16:00:00', '2026-01-31 20:13:50'),
(184, 6, 82, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:51'),
(185, 6, 83, 15, '2026-01-31 16:00:00', '2026-01-31 20:13:51'),
(186, 6, 85, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:52'),
(187, 6, 86, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:53'),
(188, 6, 87, 14, '2026-01-31 16:00:00', '2026-01-31 20:13:53'),
(189, 6, 96, 15, '2026-01-31 16:00:00', '2026-01-31 20:13:54'),
(190, 6, 95, 17, '2026-01-31 16:00:00', '2026-01-31 20:13:54'),
(191, 6, 98, 15, '2026-01-31 16:00:00', '2026-01-31 20:13:55'),
(192, 6, 97, 15, '2026-01-31 16:00:00', '2026-01-31 20:13:55'),
(193, 6, 99, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:56'),
(194, 6, 100, 16, '2026-01-31 16:00:00', '2026-01-31 20:13:56'),
(195, 6, 101, 20, '2026-01-31 16:00:00', '2026-01-31 20:13:57'),
(196, 6, 103, 25, '2026-01-31 16:00:00', '2026-01-31 20:13:57'),
(197, 6, 102, 51, '2026-01-31 16:00:00', '2026-01-31 20:13:58'),
(198, 5, 54, 12, '2026-01-31 16:00:00', '2026-01-31 20:13:59'),
(199, 5, 55, 10, '2026-01-31 16:00:00', '2026-01-31 20:13:59'),
(200, 5, 56, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:00'),
(201, 5, 57, 11, '2026-01-31 16:00:00', '2026-01-31 20:14:00'),
(202, 5, 58, 11, '2026-01-31 16:00:00', '2026-01-31 20:14:01'),
(203, 5, 60, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:02'),
(204, 5, 61, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:03'),
(205, 5, 62, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:03'),
(206, 5, 63, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:04'),
(207, 5, 64, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:04'),
(208, 5, 65, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:05'),
(209, 5, 66, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:05'),
(210, 5, 67, 11, '2026-01-31 16:00:00', '2026-01-31 20:14:06'),
(211, 5, 70, 12, '2026-01-31 16:00:00', '2026-01-31 20:14:06'),
(212, 11, 94, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:07'),
(213, 11, 93, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:07'),
(214, 11, 92, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:08'),
(215, 11, 91, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:09'),
(216, 11, 90, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:09'),
(217, 11, 89, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:10'),
(218, 11, 88, 11, '2026-01-31 16:00:00', '2026-01-31 20:14:10'),
(219, 11, 79, 11, '2026-01-31 16:00:00', '2026-01-31 20:14:11'),
(220, 3, 52, 12, '2026-01-31 16:00:00', '2026-01-31 20:14:12'),
(221, 3, 51, 29, '2026-01-31 16:00:00', '2026-01-31 20:14:12'),
(222, 9, 68, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:25'),
(223, 10, 77, 10, '2026-01-31 16:00:00', '2026-01-31 20:14:25'),
(224, 16, 152, 43, '2026-01-31 16:00:00', '2026-01-31 20:43:05'),
(225, 3, 153, 111, '2026-01-31 16:00:00', '2026-02-01 04:19:41'),
(226, 6, 102, 12, '2026-02-01 16:00:00', '2026-02-01 16:11:02'),
(227, 14, 115, 8, '2026-02-01 16:00:00', '2026-02-01 16:42:22'),
(228, 7, 154, 11, '2026-02-01 16:00:00', '2026-02-01 17:48:14'),
(229, 8, 155, 4, '2026-02-01 16:00:00', '2026-02-01 18:08:48'),
(230, 8, 156, 3, '2026-02-01 16:00:00', '2026-02-01 18:12:06'),
(231, 8, 157, 4, '2026-02-01 16:00:00', '2026-02-01 18:15:13'),
(232, 8, 158, 3, '2026-02-01 16:00:00', '2026-02-01 18:16:28'),
(233, 4, 142, 5, '2026-02-01 16:00:00', '2026-02-01 18:57:56'),
(234, 3, 153, 20, '2026-02-01 16:00:00', '2026-02-01 20:35:20'),
(235, 8, 84, 3, '2026-02-01 16:00:00', '2026-02-01 21:34:00'),
(236, 6, 96, 3, '2026-02-01 16:00:00', '2026-02-01 21:34:44'),
(237, 18, 150, 3, '2026-02-01 16:00:00', '2026-02-01 21:47:23'),
(238, 6, 80, 13, '2026-02-01 16:00:00', '2026-02-01 21:52:34'),
(239, 6, 95, 4, '2026-02-01 16:00:00', '2026-02-01 21:53:35'),
(240, 3, 51, 3, '2026-02-01 16:00:00', '2026-02-01 22:37:05'),
(241, 16, 152, 9, '2026-02-01 16:00:00', '2026-02-01 22:58:23'),
(242, 3, 52, 3, '2026-02-01 16:00:00', '2026-02-01 23:35:45'),
(243, 18, 145, 2, '2026-02-01 16:00:00', '2026-02-01 23:35:56'),
(244, 8, 122, 2, '2026-02-01 16:00:00', '2026-02-01 23:36:07'),
(245, 19, 151, 2, '2026-02-01 16:00:00', '2026-02-01 23:36:19'),
(246, 15, 125, 2, '2026-02-01 16:00:00', '2026-02-01 23:36:30'),
(247, 18, 147, 2, '2026-02-01 16:00:00', '2026-02-01 23:36:41'),
(248, 8, 118, 2, '2026-02-01 16:00:00', '2026-02-01 23:37:04'),
(249, 15, 134, 2, '2026-02-01 16:00:00', '2026-02-01 23:37:16'),
(250, 6, 97, 3, '2026-02-01 16:00:00', '2026-02-01 23:37:27'),
(251, 18, 149, 2, '2026-02-01 16:00:00', '2026-02-01 23:37:39'),
(252, 14, 107, 3, '2026-02-01 16:00:00', '2026-02-01 23:37:50'),
(253, 14, 110, 2, '2026-02-01 16:00:00', '2026-02-01 23:38:01'),
(254, 15, 131, 2, '2026-02-01 16:00:00', '2026-02-01 23:38:13'),
(255, 8, 116, 2, '2026-02-01 16:00:00', '2026-02-01 23:38:35'),
(256, 14, 113, 2, '2026-02-01 16:00:00', '2026-02-01 23:38:47'),
(257, 15, 128, 2, '2026-02-01 16:00:00', '2026-02-01 23:38:58'),
(258, 8, 117, 2, '2026-02-01 16:00:00', '2026-02-01 23:39:10'),
(259, 15, 140, 3, '2026-02-01 16:00:00', '2026-02-01 23:39:33'),
(260, 6, 98, 3, '2026-02-01 16:00:00', '2026-02-01 23:39:56'),
(261, 15, 133, 2, '2026-02-01 16:00:00', '2026-02-01 23:40:19'),
(262, 18, 144, 2, '2026-02-01 16:00:00', '2026-02-01 23:40:41'),
(263, 18, 148, 2, '2026-02-01 16:00:00', '2026-02-01 23:40:53'),
(264, 8, 120, 2, '2026-02-01 16:00:00', '2026-02-01 23:41:04'),
(265, 6, 81, 2, '2026-02-01 16:00:00', '2026-02-01 23:41:27'),
(266, 15, 139, 2, '2026-02-01 16:00:00', '2026-02-01 23:41:39'),
(267, 15, 138, 2, '2026-02-01 16:00:00', '2026-02-01 23:41:50'),
(268, 8, 123, 2, '2026-02-01 16:00:00', '2026-02-01 23:42:01'),
(269, 8, 119, 2, '2026-02-01 16:00:00', '2026-02-01 23:42:36'),
(270, 15, 136, 2, '2026-02-01 16:00:00', '2026-02-01 23:42:48'),
(271, 6, 82, 2, '2026-02-01 16:00:00', '2026-02-01 23:42:59'),
(272, 14, 108, 2, '2026-02-01 16:00:00', '2026-02-01 23:43:11'),
(273, 18, 146, 2, '2026-02-01 16:00:00', '2026-02-01 23:43:22'),
(274, 15, 132, 2, '2026-02-01 16:00:00', '2026-02-01 23:43:45'),
(275, 6, 85, 2, '2026-02-01 16:00:00', '2026-02-01 23:43:56'),
(276, 6, 86, 2, '2026-02-01 16:00:00', '2026-02-01 23:44:08'),
(277, 8, 121, 2, '2026-02-01 16:00:00', '2026-02-01 23:44:19'),
(278, 7, 69, 2, '2026-02-01 16:00:00', '2026-02-01 23:44:31'),
(279, 14, 109, 2, '2026-02-01 16:00:00', '2026-02-01 23:44:43'),
(280, 14, 114, 2, '2026-02-01 16:00:00', '2026-02-01 23:44:54'),
(281, 6, 100, 2, '2026-02-01 16:00:00', '2026-02-01 23:45:05'),
(282, 15, 126, 2, '2026-02-01 16:00:00', '2026-02-01 23:45:28'),
(283, 6, 101, 2, '2026-02-01 16:00:00', '2026-02-01 23:45:51'),
(284, 6, 83, 2, '2026-02-01 16:00:00', '2026-02-01 23:46:15'),
(285, 17, 143, 1, '2026-02-01 16:00:00', '2026-02-01 23:46:26'),
(286, 6, 103, 2, '2026-02-01 16:00:00', '2026-02-01 23:46:38'),
(287, 6, 87, 2, '2026-02-01 16:00:00', '2026-02-01 23:46:49'),
(288, 14, 111, 2, '2026-02-01 16:00:00', '2026-02-01 23:47:12'),
(289, 15, 137, 2, '2026-02-01 16:00:00', '2026-02-02 00:41:30'),
(290, 15, 124, 2, '2026-02-01 16:00:00', '2026-02-02 00:41:42'),
(291, 6, 99, 2, '2026-02-01 16:00:00', '2026-02-02 00:41:53'),
(292, 15, 135, 2, '2026-02-01 16:00:00', '2026-02-02 00:42:05'),
(293, 15, 127, 2, '2026-02-01 16:00:00', '2026-02-02 00:42:16'),
(294, 15, 130, 2, '2026-02-01 16:00:00', '2026-02-02 00:42:39'),
(295, 15, 129, 2, '2026-02-01 16:00:00', '2026-02-02 00:42:51'),
(296, 14, 112, 2, '2026-02-01 16:00:00', '2026-02-02 00:43:14'),
(297, 5, 62, 2, '2026-02-01 16:00:00', '2026-02-02 01:14:24'),
(298, 5, 66, 2, '2026-02-01 16:00:00', '2026-02-02 01:14:47'),
(299, 5, 63, 2, '2026-02-01 16:00:00', '2026-02-02 01:14:58'),
(300, 5, 58, 2, '2026-02-01 16:00:00', '2026-02-02 01:15:10'),
(301, 5, 57, 1, '2026-02-01 16:00:00', '2026-02-02 01:15:21'),
(302, 5, 59, 2, '2026-02-01 16:00:00', '2026-02-02 01:15:32'),
(303, 5, 67, 1, '2026-02-01 16:00:00', '2026-02-02 01:15:44'),
(304, 5, 70, 2, '2026-02-01 16:00:00', '2026-02-02 01:15:55'),
(305, 5, 56, 2, '2026-02-01 16:00:00', '2026-02-02 01:16:07'),
(306, 5, 65, 2, '2026-02-01 16:00:00', '2026-02-02 01:16:18'),
(307, 5, 60, 2, '2026-02-01 16:00:00', '2026-02-02 01:16:29'),
(308, 5, 55, 2, '2026-02-01 16:00:00', '2026-02-02 01:16:41'),
(309, 5, 64, 2, '2026-02-01 16:00:00', '2026-02-02 01:16:52'),
(310, 5, 61, 2, '2026-02-01 16:00:00', '2026-02-02 01:17:04'),
(311, 5, 54, 2, '2026-02-01 16:00:00', '2026-02-02 01:17:15'),
(312, 11, 89, 1, '2026-02-01 16:00:00', '2026-02-02 01:17:38'),
(313, 11, 94, 1, '2026-02-01 16:00:00', '2026-02-02 01:17:48'),
(314, 11, 92, 1, '2026-02-01 16:00:00', '2026-02-02 01:17:59'),
(315, 11, 91, 1, '2026-02-01 16:00:00', '2026-02-02 01:18:09'),
(316, 9, 68, 1, '2026-02-01 16:00:00', '2026-02-02 01:18:20'),
(317, 11, 90, 2, '2026-02-01 16:00:00', '2026-02-02 01:18:52'),
(318, 10, 77, 1, '2026-02-01 16:00:00', '2026-02-02 01:18:52'),
(319, 11, 78, 1, '2026-02-01 16:00:00', '2026-02-02 01:19:02'),
(320, 11, 93, 1, '2026-02-01 16:00:00', '2026-02-02 01:19:12'),
(321, 11, 79, 1, '2026-02-01 16:00:00', '2026-02-02 01:19:23'),
(322, 11, 88, 1, '2026-02-01 16:00:00', '2026-02-02 01:19:44'),
(323, 12, 74, 2, '2026-02-01 16:00:00', '2026-02-02 01:47:16'),
(324, 13, 106, 3, '2026-02-01 16:00:00', '2026-02-02 01:47:27'),
(325, 12, 75, 2, '2026-02-01 16:00:00', '2026-02-02 01:47:37'),
(326, 13, 104, 2, '2026-02-01 16:00:00', '2026-02-02 01:47:48'),
(327, 12, 73, 2, '2026-02-01 16:00:00', '2026-02-02 01:47:58'),
(328, 12, 72, 3, '2026-02-01 16:00:00', '2026-02-02 01:48:08'),
(329, 13, 105, 1, '2026-02-01 16:00:00', '2026-02-02 01:48:19'),
(330, 20, 159, 13, '2026-02-01 16:00:00', '2026-02-02 04:34:33'),
(331, 21, 160, 19, '2026-02-01 16:00:00', '2026-02-02 04:50:00'),
(332, 21, 161, 4, '2026-02-01 16:00:00', '2026-02-02 06:01:03'),
(333, 21, 163, 3, '2026-02-01 16:00:00', '2026-02-02 06:01:05'),
(334, 21, 162, 3, '2026-02-01 16:00:00', '2026-02-02 06:01:06'),
(335, 21, 164, 2, '2026-02-01 16:00:00', '2026-02-02 06:01:19'),
(336, 21, 165, 1, '2026-02-01 16:00:00', '2026-02-02 06:01:23'),
(337, 21, 166, 2, '2026-02-01 16:00:00', '2026-02-02 06:01:24'),
(338, 21, 167, 2, '2026-02-01 16:00:00', '2026-02-02 06:01:28'),
(339, 21, 168, 2, '2026-02-01 16:00:00', '2026-02-02 06:01:29'),
(340, 21, 169, 3, '2026-02-01 16:00:00', '2026-02-02 06:01:30'),
(341, 21, 160, 6, '2026-02-02 16:00:00', '2026-02-02 16:03:46'),
(342, 21, 163, 1, '2026-02-02 16:00:00', '2026-02-02 16:09:00'),
(343, 11, 90, 1, '2026-02-02 16:00:00', '2026-02-02 16:16:18'),
(344, 11, 88, 1, '2026-02-02 16:00:00', '2026-02-02 16:34:27'),
(345, 11, 89, 1, '2026-02-02 16:00:00', '2026-02-02 16:50:38'),
(346, 11, 94, 1, '2026-02-02 16:00:00', '2026-02-02 17:07:33'),
(347, 11, 92, 1, '2026-02-02 16:00:00', '2026-02-02 17:23:04'),
(348, 11, 91, 1, '2026-02-02 16:00:00', '2026-02-02 17:30:55'),
(349, 11, 78, 1, '2026-02-02 16:00:00', '2026-02-02 17:38:58'),
(350, 11, 93, 1, '2026-02-02 16:00:00', '2026-02-02 17:47:28'),
(351, 6, 99, 3, '2026-02-02 16:00:00', '2026-02-02 17:48:32'),
(352, 11, 79, 1, '2026-02-02 16:00:00', '2026-02-02 17:54:30'),
(353, 10, 77, 1, '2026-02-02 16:00:00', '2026-02-02 17:58:23'),
(354, 9, 68, 1, '2026-02-02 16:00:00', '2026-02-02 18:02:16'),
(355, 3, 153, 11, '2026-02-02 16:00:00', '2026-02-02 18:13:16'),
(356, 6, 100, 2, '2026-02-02 16:00:00', '2026-02-02 18:33:32'),
(357, 13, 105, 1, '2026-02-02 16:00:00', '2026-02-02 18:34:16'),
(358, 6, 97, 2, '2026-02-02 16:00:00', '2026-02-02 18:44:00'),
(359, 22, 170, 17, '2026-02-02 16:00:00', '2026-02-02 18:46:01'),
(360, 23, 171, 10, '2026-02-02 16:00:00', '2026-02-02 18:52:27'),
(361, 13, 104, 6, '2026-02-02 16:00:00', '2026-02-02 19:09:51'),
(362, 6, 101, 2, '2026-02-02 16:00:00', '2026-02-02 19:14:13'),
(363, 6, 103, 3, '2026-02-02 16:00:00', '2026-02-02 19:20:41'),
(364, 6, 102, 6, '2026-02-02 16:00:00', '2026-02-02 19:27:03'),
(365, 6, 80, 1, '2026-02-02 16:00:00', '2026-02-02 19:40:09'),
(366, 13, 106, 2, '2026-02-02 16:00:00', '2026-02-02 19:44:13'),
(367, 16, 152, 1, '2026-02-02 16:00:00', '2026-02-02 21:07:55'),
(368, 19, 151, 2, '2026-02-02 16:00:00', '2026-02-02 22:22:55'),
(369, 3, 51, 1, '2026-02-02 16:00:00', '2026-02-02 23:24:15'),
(370, 5, 62, 1, '2026-02-02 16:00:00', '2026-02-02 23:53:52'),
(371, 5, 67, 1, '2026-02-02 16:00:00', '2026-02-02 23:54:43'),
(372, 14, 115, 5, '2026-02-02 16:00:00', '2026-02-03 01:43:12'),
(373, 22, 189, 1, '2026-02-02 16:00:00', '2026-02-03 01:57:32'),
(374, 22, 188, 2, '2026-02-02 16:00:00', '2026-02-03 01:57:36'),
(375, 22, 187, 3, '2026-02-02 16:00:00', '2026-02-03 01:57:37'),
(376, 22, 186, 5, '2026-02-02 16:00:00', '2026-02-03 01:57:39'),
(377, 22, 185, 3, '2026-02-02 16:00:00', '2026-02-03 01:57:42'),
(378, 22, 184, 3, '2026-02-02 16:00:00', '2026-02-03 01:57:45'),
(379, 22, 183, 2, '2026-02-02 16:00:00', '2026-02-03 01:57:54'),
(380, 22, 182, 3, '2026-02-02 16:00:00', '2026-02-03 01:57:56'),
(381, 22, 181, 4, '2026-02-02 16:00:00', '2026-02-03 01:58:00'),
(382, 22, 180, 1, '2026-02-02 16:00:00', '2026-02-03 01:58:02'),
(383, 22, 179, 1, '2026-02-02 16:00:00', '2026-02-03 01:58:04'),
(384, 24, 190, 15, '2026-02-02 16:00:00', '2026-02-03 03:21:21'),
(385, 20, 159, 3, '2026-02-02 16:00:00', '2026-02-03 03:25:44'),
(386, 24, 207, 2, '2026-02-02 16:00:00', '2026-02-03 03:46:47'),
(387, 14, 113, 1, '2026-02-02 16:00:00', '2026-02-03 03:51:07'),
(388, 3, 52, 3, '2026-02-02 16:00:00', '2026-02-03 04:54:08'),
(389, 8, 158, 1, '2026-02-02 16:00:00', '2026-02-03 07:23:43'),
(390, 8, 157, 1, '2026-02-02 16:00:00', '2026-02-03 07:49:57'),
(391, 8, 156, 1, '2026-02-02 16:00:00', '2026-02-03 08:01:59'),
(392, 8, 155, 1, '2026-02-02 16:00:00', '2026-02-03 08:07:19'),
(393, 8, 123, 1, '2026-02-02 16:00:00', '2026-02-03 08:16:02'),
(394, 8, 122, 1, '2026-02-02 16:00:00', '2026-02-03 10:07:49'),
(395, 8, 121, 1, '2026-02-02 16:00:00', '2026-02-03 10:17:55'),
(396, 8, 120, 1, '2026-02-02 16:00:00', '2026-02-03 10:23:52'),
(397, 8, 119, 1, '2026-02-02 16:00:00', '2026-02-03 10:30:19'),
(398, 8, 118, 1, '2026-02-02 16:00:00', '2026-02-03 10:37:07'),
(399, 8, 117, 1, '2026-02-02 16:00:00', '2026-02-03 10:39:57'),
(400, 24, 191, 2, '2026-02-02 16:00:00', '2026-02-03 13:40:39'),
(401, 24, 192, 2, '2026-02-02 16:00:00', '2026-02-03 13:40:44'),
(402, 24, 193, 1, '2026-02-02 16:00:00', '2026-02-03 13:40:49'),
(403, 24, 190, 8, '2026-02-03 16:00:00', '2026-02-03 16:14:39'),
(404, 20, 159, 3, '2026-02-03 16:00:00', '2026-02-03 16:45:08'),
(405, 3, 153, 10, '2026-02-03 16:00:00', '2026-02-03 16:45:46'),
(406, 3, 51, 2, '2026-02-03 16:00:00', '2026-02-03 16:45:49'),
(407, 3, 52, 2, '2026-02-03 16:00:00', '2026-02-03 16:45:51'),
(408, 7, 154, 3, '2026-02-03 16:00:00', '2026-02-03 16:46:13'),
(409, 7, 69, 2, '2026-02-03 16:00:00', '2026-02-03 16:46:17'),
(410, 13, 105, 2, '2026-02-03 16:00:00', '2026-02-03 18:02:48'),
(411, 26, 208, 7, '2026-02-03 16:00:00', '2026-02-03 22:01:27'),
(412, 25, 220, 4, '2026-02-03 16:00:00', '2026-02-03 23:58:24'),
(413, 25, 219, 3, '2026-02-03 16:00:00', '2026-02-03 23:58:35'),
(414, 25, 218, 3, '2026-02-03 16:00:00', '2026-02-03 23:58:37'),
(415, 25, 217, 3, '2026-02-03 16:00:00', '2026-02-03 23:58:39'),
(416, 25, 216, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:01'),
(417, 25, 215, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:03'),
(418, 25, 214, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:05'),
(419, 25, 213, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:07'),
(420, 25, 212, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:09'),
(421, 25, 211, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:12'),
(422, 25, 210, 2, '2026-02-03 16:00:00', '2026-02-04 00:02:14'),
(423, 25, 209, 5, '2026-02-03 16:00:00', '2026-02-04 00:02:15'),
(424, 27, 221, 4, '2026-02-03 16:00:00', '2026-02-04 00:09:50'),
(425, 28, 232, 3, '2026-02-03 16:00:00', '2026-02-04 00:27:18'),
(426, 28, 233, 3, '2026-02-03 16:00:00', '2026-02-04 00:28:03'),
(427, 28, 234, 3, '2026-02-03 16:00:00', '2026-02-04 00:30:24'),
(428, 28, 235, 4, '2026-02-03 16:00:00', '2026-02-04 00:30:55'),
(429, 28, 236, 2, '2026-02-03 16:00:00', '2026-02-04 00:31:33'),
(430, 28, 237, 2, '2026-02-03 16:00:00', '2026-02-04 00:33:43'),
(431, 28, 238, 4, '2026-02-03 16:00:00', '2026-02-04 00:33:52'),
(432, 28, 239, 5, '2026-02-03 16:00:00', '2026-02-04 00:35:20'),
(433, 28, 240, 4, '2026-02-03 16:00:00', '2026-02-04 00:35:38'),
(434, 28, 241, 5, '2026-02-03 16:00:00', '2026-02-04 00:37:04'),
(435, 28, 242, 4, '2026-02-03 16:00:00', '2026-02-04 00:37:13'),
(436, 28, 229, 3, '2026-02-03 16:00:00', '2026-02-04 00:37:44'),
(437, 28, 230, 3, '2026-02-03 16:00:00', '2026-02-04 00:37:48'),
(438, 28, 231, 3, '2026-02-03 16:00:00', '2026-02-04 00:37:53'),
(439, 28, 243, 4, '2026-02-03 16:00:00', '2026-02-04 00:40:09'),
(440, 28, 244, 3, '2026-02-03 16:00:00', '2026-02-04 01:09:16'),
(441, 28, 245, 3, '2026-02-03 16:00:00', '2026-02-04 01:09:39'),
(442, 22, 170, 2, '2026-02-03 16:00:00', '2026-02-04 01:51:26'),
(443, 19, 151, 2, '2026-02-03 16:00:00', '2026-02-04 01:52:16'),
(444, 18, 150, 2, '2026-02-03 16:00:00', '2026-02-04 01:52:31'),
(445, 28, 246, 2, '2026-02-03 16:00:00', '2026-02-04 01:59:51'),
(446, 28, 247, 2, '2026-02-03 16:00:00', '2026-02-04 02:00:06'),
(447, 28, 248, 3, '2026-02-03 16:00:00', '2026-02-04 02:02:23'),
(448, 28, 249, 3, '2026-02-03 16:00:00', '2026-02-04 02:02:33'),
(449, 28, 250, 3, '2026-02-03 16:00:00', '2026-02-04 02:03:55'),
(450, 28, 251, 4, '2026-02-03 16:00:00', '2026-02-04 02:04:00'),
(451, 23, 171, 7, '2026-02-03 16:00:00', '2026-02-04 02:07:15'),
(452, 5, 70, 2, '2026-02-03 16:00:00', '2026-02-04 02:29:52'),
(453, 22, 189, 2, '2026-02-03 16:00:00', '2026-02-04 03:54:39'),
(454, 21, 160, 3, '2026-02-03 16:00:00', '2026-02-04 04:26:41'),
(455, 3, 228, 4, '2026-02-03 16:00:00', '2026-02-04 04:40:04'),
(456, 29, 252, 14, '2026-02-03 16:00:00', '2026-02-04 04:41:20'),
(457, 6, 80, 2, '2026-02-03 16:00:00', '2026-02-04 05:15:24'),
(458, 22, 188, 2, '2026-02-03 16:00:00', '2026-02-04 05:20:16'),
(459, 6, 81, 2, '2026-02-03 16:00:00', '2026-02-04 05:31:43'),
(460, 24, 191, 2, '2026-02-03 16:00:00', '2026-02-04 05:38:34'),
(461, 6, 82, 2, '2026-02-03 16:00:00', '2026-02-04 05:47:17'),
(462, 6, 83, 2, '2026-02-03 16:00:00', '2026-02-04 06:02:29'),
(463, 16, 152, 2, '2026-02-03 16:00:00', '2026-02-04 06:10:08'),
(464, 6, 85, 2, '2026-02-03 16:00:00', '2026-02-04 06:23:16'),
(465, 6, 86, 2, '2026-02-03 16:00:00', '2026-02-04 06:38:49'),
(466, 6, 102, 2, '2026-02-03 16:00:00', '2026-02-04 06:45:02'),
(467, 6, 87, 2, '2026-02-03 16:00:00', '2026-02-04 06:48:29'),
(468, 6, 96, 3, '2026-02-03 16:00:00', '2026-02-04 07:00:29'),
(469, 23, 174, 1, '2026-02-03 16:00:00', '2026-02-04 07:41:29'),
(470, 23, 175, 1, '2026-02-03 16:00:00', '2026-02-04 07:41:51'),
(471, 4, 142, 1, '2026-02-03 16:00:00', '2026-02-04 07:42:01'),
(472, 23, 177, 1, '2026-02-03 16:00:00', '2026-02-04 07:42:11'),
(473, 14, 109, 1, '2026-02-03 16:00:00', '2026-02-04 07:42:33'),
(474, 14, 107, 1, '2026-02-03 16:00:00', '2026-02-04 07:42:44'),
(475, 14, 113, 1, '2026-02-03 16:00:00', '2026-02-04 07:42:54'),
(476, 14, 114, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:05'),
(477, 14, 108, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:16'),
(478, 14, 110, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:26'),
(479, 14, 112, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:36'),
(480, 14, 115, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:47'),
(481, 14, 111, 1, '2026-02-03 16:00:00', '2026-02-04 07:43:58'),
(482, 5, 57, 1, '2026-02-03 16:00:00', '2026-02-04 07:44:08'),
(483, 5, 63, 1, '2026-02-03 16:00:00', '2026-02-04 07:44:18'),
(484, 5, 62, 1, '2026-02-03 16:00:00', '2026-02-04 07:44:29'),
(485, 5, 66, 1, '2026-02-03 16:00:00', '2026-02-04 07:44:39'),
(486, 5, 59, 1, '2026-02-03 16:00:00', '2026-02-04 07:44:50'),
(487, 5, 67, 1, '2026-02-03 16:00:00', '2026-02-04 07:45:00'),
(488, 5, 64, 1, '2026-02-03 16:00:00', '2026-02-04 07:45:21'),
(489, 5, 61, 1, '2026-02-03 16:00:00', '2026-02-04 07:45:32'),
(490, 5, 58, 1, '2026-02-03 16:00:00', '2026-02-04 07:45:42'),
(491, 5, 55, 1, '2026-02-03 16:00:00', '2026-02-04 07:45:53'),
(492, 5, 54, 1, '2026-02-03 16:00:00', '2026-02-04 07:46:04'),
(493, 5, 56, 1, '2026-02-03 16:00:00', '2026-02-04 07:46:14'),
(494, 5, 60, 1, '2026-02-03 16:00:00', '2026-02-04 07:46:24'),
(495, 5, 65, 1, '2026-02-03 16:00:00', '2026-02-04 07:46:35'),
(496, 23, 172, 1, '2026-02-03 16:00:00', '2026-02-04 07:46:56'),
(497, 23, 176, 1, '2026-02-03 16:00:00', '2026-02-04 07:47:07'),
(498, 23, 178, 1, '2026-02-03 16:00:00', '2026-02-04 07:47:17'),
(499, 23, 173, 1, '2026-02-03 16:00:00', '2026-02-04 07:47:27'),
(500, 6, 99, 1, '2026-02-03 16:00:00', '2026-02-04 07:49:56'),
(501, 6, 103, 1, '2026-02-03 16:00:00', '2026-02-04 07:50:06'),
(502, 6, 95, 1, '2026-02-03 16:00:00', '2026-02-04 07:51:20'),
(503, 6, 100, 1, '2026-02-03 16:00:00', '2026-02-04 07:51:31'),
(504, 6, 101, 1, '2026-02-03 16:00:00', '2026-02-04 07:51:41'),
(505, 6, 98, 1, '2026-02-03 16:00:00', '2026-02-04 07:51:52'),
(506, 6, 97, 1, '2026-02-03 16:00:00', '2026-02-04 07:52:03'),
(507, 15, 130, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:00'),
(508, 15, 126, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:10'),
(509, 15, 125, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:20'),
(510, 15, 124, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:31'),
(511, 15, 133, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:42'),
(512, 15, 139, 1, '2026-02-03 16:00:00', '2026-02-04 07:55:52'),
(513, 15, 137, 1, '2026-02-03 16:00:00', '2026-02-04 07:56:02'),
(514, 15, 127, 1, '2026-02-03 16:00:00', '2026-02-04 07:56:23'),
(515, 15, 129, 1, '2026-02-03 16:00:00', '2026-02-04 07:56:34'),
(516, 15, 128, 1, '2026-02-03 16:00:00', '2026-02-04 07:56:45'),
(517, 15, 135, 1, '2026-02-03 16:00:00', '2026-02-04 07:56:55'),
(518, 15, 131, 1, '2026-02-03 16:00:00', '2026-02-04 07:57:05'),
(519, 24, 193, 1, '2026-02-03 16:00:00', '2026-02-04 07:57:47'),
(520, 21, 168, 1, '2026-02-03 16:00:00', '2026-02-04 07:58:19'),
(521, 21, 163, 1, '2026-02-03 16:00:00', '2026-02-04 07:58:29'),
(522, 3, 225, 1, '2026-02-03 16:00:00', '2026-02-04 07:59:12'),
(523, 3, 226, 1, '2026-02-03 16:00:00', '2026-02-04 07:59:22'),
(524, 3, 227, 1, '2026-02-03 16:00:00', '2026-02-04 07:59:33'),
(525, 3, 222, 1, '2026-02-03 16:00:00', '2026-02-04 07:59:53'),
(526, 3, 223, 1, '2026-02-03 16:00:00', '2026-02-04 08:00:14'),
(527, 3, 224, 1, '2026-02-03 16:00:00', '2026-02-04 08:00:24'),
(528, 15, 136, 1, '2026-02-03 16:00:00', '2026-02-04 08:00:35'),
(529, 15, 132, 1, '2026-02-03 16:00:00', '2026-02-04 08:00:45'),
(530, 15, 138, 1, '2026-02-03 16:00:00', '2026-02-04 08:00:56'),
(531, 15, 140, 1, '2026-02-03 16:00:00', '2026-02-04 08:01:07'),
(532, 24, 194, 1, '2026-02-03 16:00:00', '2026-02-04 08:01:48'),
(533, 24, 197, 1, '2026-02-03 16:00:00', '2026-02-04 08:02:20'),
(534, 24, 198, 1, '2026-02-03 16:00:00', '2026-02-04 08:02:48'),
(535, 24, 195, 1, '2026-02-03 16:00:00', '2026-02-04 08:03:13'),
(536, 24, 192, 1, '2026-02-03 16:00:00', '2026-02-04 08:03:55'),
(537, 24, 196, 1, '2026-02-03 16:00:00', '2026-02-04 08:04:31'),
(538, 22, 186, 1, '2026-02-03 16:00:00', '2026-02-04 08:06:15'),
(539, 22, 185, 1, '2026-02-03 16:00:00', '2026-02-04 08:06:26'),
(540, 22, 181, 1, '2026-02-03 16:00:00', '2026-02-04 08:06:37'),
(541, 22, 182, 1, '2026-02-03 16:00:00', '2026-02-04 08:06:48'),
(542, 22, 184, 1, '2026-02-03 16:00:00', '2026-02-04 08:07:09'),
(543, 22, 179, 1, '2026-02-03 16:00:00', '2026-02-04 08:07:19'),
(544, 21, 167, 1, '2026-02-03 16:00:00', '2026-02-04 08:08:33'),
(545, 21, 164, 1, '2026-02-03 16:00:00', '2026-02-04 08:08:43'),
(546, 21, 162, 1, '2026-02-03 16:00:00', '2026-02-04 08:09:04'),
(547, 21, 161, 1, '2026-02-03 16:00:00', '2026-02-04 08:09:15'),
(548, 22, 180, 1, '2026-02-03 16:00:00', '2026-02-04 08:09:47'),
(549, 21, 169, 1, '2026-02-03 16:00:00', '2026-02-04 08:10:09'),
(550, 21, 166, 1, '2026-02-03 16:00:00', '2026-02-04 08:10:19'),
(551, 21, 165, 1, '2026-02-03 16:00:00', '2026-02-04 08:10:30'),
(552, 22, 187, 1, '2026-02-03 16:00:00', '2026-02-04 08:10:51'),
(553, 22, 183, 1, '2026-02-03 16:00:00', '2026-02-04 08:11:01'),
(554, 24, 204, 1, '2026-02-03 16:00:00', '2026-02-04 08:11:32'),
(555, 24, 206, 1, '2026-02-03 16:00:00', '2026-02-04 08:11:43'),
(556, 24, 205, 1, '2026-02-03 16:00:00', '2026-02-04 08:11:53'),
(557, 24, 199, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:03'),
(558, 24, 203, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:14'),
(559, 24, 202, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:24'),
(560, 24, 207, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:35'),
(561, 24, 201, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:46'),
(562, 24, 200, 1, '2026-02-03 16:00:00', '2026-02-04 08:12:56'),
(563, 8, 122, 1, '2026-02-03 16:00:00', '2026-02-04 08:20:16'),
(564, 8, 156, 1, '2026-02-03 16:00:00', '2026-02-04 08:20:27'),
(565, 8, 155, 1, '2026-02-03 16:00:00', '2026-02-04 08:20:38'),
(566, 8, 117, 1, '2026-02-03 16:00:00', '2026-02-04 08:20:59'),
(567, 8, 116, 1, '2026-02-03 16:00:00', '2026-02-04 08:21:09'),
(568, 8, 157, 1, '2026-02-03 16:00:00', '2026-02-04 08:21:20'),
(569, 8, 158, 1, '2026-02-03 16:00:00', '2026-02-04 08:21:31'),
(570, 8, 119, 1, '2026-02-03 16:00:00', '2026-02-04 08:21:41'),
(571, 8, 123, 1, '2026-02-03 16:00:00', '2026-02-04 08:21:51'),
(572, 8, 121, 1, '2026-02-03 16:00:00', '2026-02-04 08:22:02'),
(573, 8, 84, 1, '2026-02-03 16:00:00', '2026-02-04 08:22:13'),
(574, 8, 118, 1, '2026-02-03 16:00:00', '2026-02-04 08:22:23'),
(575, 8, 120, 1, '2026-02-03 16:00:00', '2026-02-04 08:22:33'),
(576, 11, 89, 1, '2026-02-03 16:00:00', '2026-02-04 08:24:28'),
(577, 11, 91, 1, '2026-02-03 16:00:00', '2026-02-04 08:24:38'),
(578, 10, 77, 1, '2026-02-03 16:00:00', '2026-02-04 08:24:49'),
(579, 9, 68, 1, '2026-02-03 16:00:00', '2026-02-04 08:25:00'),
(580, 11, 79, 1, '2026-02-03 16:00:00', '2026-02-04 08:25:21'),
(581, 11, 90, 1, '2026-02-03 16:00:00', '2026-02-04 08:25:31'),
(582, 11, 78, 1, '2026-02-03 16:00:00', '2026-02-04 08:25:41'),
(583, 11, 88, 1, '2026-02-03 16:00:00', '2026-02-04 08:25:51'),
(584, 11, 93, 1, '2026-02-03 16:00:00', '2026-02-04 08:26:02'),
(585, 11, 94, 1, '2026-02-03 16:00:00', '2026-02-04 08:26:12'),
(586, 11, 92, 1, '2026-02-03 16:00:00', '2026-02-04 08:26:22'),
(587, 12, 75, 1, '2026-02-03 16:00:00', '2026-02-04 08:27:04'),
(588, 12, 73, 1, '2026-02-03 16:00:00', '2026-02-04 08:27:15'),
(589, 12, 74, 1, '2026-02-03 16:00:00', '2026-02-04 08:27:25'),
(590, 12, 72, 1, '2026-02-03 16:00:00', '2026-02-04 08:27:36'),
(591, 13, 104, 1, '2026-02-03 16:00:00', '2026-02-04 08:28:28'),
(592, 13, 106, 1, '2026-02-03 16:00:00', '2026-02-04 08:28:59'),
(593, 17, 143, 1, '2026-02-03 16:00:00', '2026-02-04 08:30:35'),
(594, 18, 144, 1, '2026-02-03 16:00:00', '2026-02-04 08:31:17'),
(595, 18, 147, 1, '2026-02-03 16:00:00', '2026-02-04 08:31:37'),
(596, 18, 145, 1, '2026-02-03 16:00:00', '2026-02-04 08:31:48'),
(597, 18, 146, 1, '2026-02-03 16:00:00', '2026-02-04 08:31:58'),
(598, 18, 148, 1, '2026-02-03 16:00:00', '2026-02-04 08:32:09'),
(599, 18, 149, 1, '2026-02-03 16:00:00', '2026-02-04 08:32:20'),
(601, 3, 254, 3, '2026-02-03 16:00:00', '2026-02-04 09:29:14'),
(602, 3, 255, 3, '2026-02-03 16:00:00', '2026-02-04 09:46:24'),
(603, 3, 256, 4, '2026-02-03 16:00:00', '2026-02-04 10:17:15'),
(604, 3, 257, 3, '2026-02-03 16:00:00', '2026-02-04 10:53:26'),
(605, 3, 258, 4, '2026-02-03 16:00:00', '2026-02-04 11:22:23'),
(606, 3, 259, 6, '2026-02-03 16:00:00', '2026-02-04 11:51:55'),
(607, 3, 260, 2, '2026-02-03 16:00:00', '2026-02-04 12:21:39'),
(608, 3, 261, 1, '2026-02-03 16:00:00', '2026-02-04 12:51:01'),
(609, 3, 262, 1, '2026-02-03 16:00:00', '2026-02-04 13:19:03'),
(610, 3, 263, 1, '2026-02-03 16:00:00', '2026-02-04 13:48:46'),
(611, 3, 264, 1, '2026-02-03 16:00:00', '2026-02-04 14:18:22'),
(612, 3, 265, 1, '2026-02-03 16:00:00', '2026-02-04 14:47:16'),
(613, 3, 266, 2, '2026-02-03 16:00:00', '2026-02-04 15:16:23'),
(614, 3, 267, 1, '2026-02-03 16:00:00', '2026-02-04 15:44:53'),
(615, 29, 252, 8, '2026-02-04 16:00:00', '2026-02-04 16:05:39'),
(616, 25, 209, 4, '2026-02-04 16:00:00', '2026-02-04 16:06:15'),
(617, 26, 208, 4, '2026-02-04 16:00:00', '2026-02-04 16:06:23'),
(618, 24, 190, 4, '2026-02-04 16:00:00', '2026-02-04 16:06:36'),
(619, 23, 171, 2, '2026-02-04 16:00:00', '2026-02-04 16:07:09'),
(620, 3, 268, 5, '2026-02-04 16:00:00', '2026-02-04 16:15:17'),
(621, 3, 269, 6, '2026-02-04 16:00:00', '2026-02-04 16:43:18'),
(622, 3, 270, 6, '2026-02-04 16:00:00', '2026-02-04 17:12:59'),
(623, 22, 170, 4, '2026-02-04 16:00:00', '2026-02-04 17:13:06'),
(624, 3, 267, 4, '2026-02-04 16:00:00', '2026-02-04 17:18:55'),
(625, 3, 266, 4, '2026-02-04 16:00:00', '2026-02-04 17:18:56'),
(626, 3, 265, 4, '2026-02-04 16:00:00', '2026-02-04 17:18:58'),
(627, 3, 264, 8, '2026-02-04 16:00:00', '2026-02-04 17:18:59'),
(628, 3, 263, 4, '2026-02-04 16:00:00', '2026-02-04 17:19:00'),
(629, 3, 262, 4, '2026-02-04 16:00:00', '2026-02-04 17:19:02'),
(630, 3, 261, 7, '2026-02-04 16:00:00', '2026-02-04 17:19:03'),
(631, 3, 260, 11, '2026-02-04 16:00:00', '2026-02-04 17:19:04'),
(632, 3, 259, 18, '2026-02-04 16:00:00', '2026-02-04 17:19:05'),
(633, 3, 258, 7, '2026-02-04 16:00:00', '2026-02-04 17:19:06'),
(634, 3, 257, 6, '2026-02-04 16:00:00', '2026-02-04 17:19:08'),
(635, 3, 256, 7, '2026-02-04 16:00:00', '2026-02-04 17:19:09'),
(636, 3, 255, 5, '2026-02-04 16:00:00', '2026-02-04 17:19:10'),
(637, 3, 254, 3, '2026-02-04 16:00:00', '2026-02-04 17:20:57'),
(638, 6, 80, 4, '2026-02-04 16:00:00', '2026-02-04 18:13:11'),
(639, 21, 160, 5, '2026-02-04 16:00:00', '2026-02-04 18:14:24'),
(640, 6, 81, 2, '2026-02-04 16:00:00', '2026-02-04 18:14:50'),
(641, 6, 82, 3, '2026-02-04 16:00:00', '2026-02-04 18:15:17'),
(642, 6, 83, 3, '2026-02-04 16:00:00', '2026-02-04 18:17:23'),
(643, 6, 85, 3, '2026-02-04 16:00:00', '2026-02-04 18:17:51'),
(644, 17, 271, 7, '2026-02-04 16:00:00', '2026-02-04 18:23:49'),
(645, 6, 86, 3, '2026-02-04 16:00:00', '2026-02-04 19:02:19'),
(646, 6, 87, 3, '2026-02-04 16:00:00', '2026-02-04 19:02:56'),
(647, 6, 96, 2, '2026-02-04 16:00:00', '2026-02-04 19:03:29'),
(648, 6, 95, 2, '2026-02-04 16:00:00', '2026-02-04 19:03:54'),
(649, 6, 98, 2, '2026-02-04 16:00:00', '2026-02-04 19:04:22'),
(650, 6, 97, 2, '2026-02-04 16:00:00', '2026-02-04 19:04:47'),
(651, 6, 99, 3, '2026-02-04 16:00:00', '2026-02-04 19:05:29'),
(652, 6, 100, 3, '2026-02-04 16:00:00', '2026-02-04 19:05:51'),
(653, 6, 101, 3, '2026-02-04 16:00:00', '2026-02-04 19:06:32'),
(654, 6, 103, 2, '2026-02-04 16:00:00', '2026-02-04 19:06:51'),
(655, 6, 102, 5, '2026-02-04 16:00:00', '2026-02-04 19:07:14'),
(656, 17, 143, 3, '2026-02-04 16:00:00', '2026-02-04 19:14:46'),
(657, 3, 273, 5, '2026-02-04 16:00:00', '2026-02-04 19:19:28'),
(658, 3, 274, 5, '2026-02-04 16:00:00', '2026-02-04 19:49:27'),
(659, 30, 272, 23, '2026-02-04 16:00:00', '2026-02-04 19:50:56'),
(660, 3, 275, 5, '2026-02-04 16:00:00', '2026-02-04 20:21:23'),
(661, 3, 276, 4, '2026-02-04 16:00:00', '2026-02-04 20:52:02'),
(662, 3, 277, 4, '2026-02-04 16:00:00', '2026-02-04 21:23:07'),
(663, 3, 226, 2, '2026-02-04 16:00:00', '2026-02-04 21:25:23'),
(664, 3, 153, 10, '2026-02-04 16:00:00', '2026-02-04 21:25:28'),
(665, 3, 51, 2, '2026-02-04 16:00:00', '2026-02-04 21:25:38'),
(666, 3, 52, 1, '2026-02-04 16:00:00', '2026-02-04 21:25:42'),
(667, 3, 222, 1, '2026-02-04 16:00:00', '2026-02-04 21:25:46'),
(668, 3, 223, 1, '2026-02-04 16:00:00', '2026-02-04 21:25:50'),
(669, 3, 224, 2, '2026-02-04 16:00:00', '2026-02-04 21:25:54'),
(670, 3, 225, 1, '2026-02-04 16:00:00', '2026-02-04 21:25:58'),
(671, 3, 227, 2, '2026-02-04 16:00:00', '2026-02-04 21:26:14'),
(672, 3, 228, 2, '2026-02-04 16:00:00', '2026-02-04 21:26:18'),
(673, 3, 278, 4, '2026-02-04 16:00:00', '2026-02-04 21:55:21'),
(674, 28, 279, 4, '2026-02-04 16:00:00', '2026-02-04 22:05:55'),
(675, 28, 280, 4, '2026-02-04 16:00:00', '2026-02-04 22:06:47'),
(676, 28, 281, 4, '2026-02-04 16:00:00', '2026-02-04 22:07:39'),
(677, 3, 282, 3, '2026-02-04 16:00:00', '2026-02-04 22:28:03'),
(678, 3, 283, 4, '2026-02-04 16:00:00', '2026-02-04 22:59:00'),
(679, 3, 284, 10, '2026-02-04 16:00:00', '2026-02-04 23:41:58'),
(680, 3, 285, 4, '2026-02-04 16:00:00', '2026-02-05 00:13:05'),
(681, 3, 286, 4, '2026-02-04 16:00:00', '2026-02-05 00:43:41'),
(682, 3, 287, 4, '2026-02-04 16:00:00', '2026-02-05 01:16:57'),
(683, 3, 288, 3, '2026-02-04 16:00:00', '2026-02-05 01:47:19'),
(684, 3, 289, 10, '2026-02-04 16:00:00', '2026-02-05 02:19:04'),
(685, 3, 290, 2, '2026-02-04 16:00:00', '2026-02-05 02:49:45'),
(686, 3, 291, 5, '2026-02-04 16:00:00', '2026-02-05 03:20:04'),
(687, 3, 292, 2, '2026-02-04 16:00:00', '2026-02-05 03:52:25'),
(688, 31, 293, 25, '2026-02-04 16:00:00', '2026-02-05 04:07:22'),
(689, 16, 152, 1, '2026-02-04 16:00:00', '2026-02-05 04:09:58'),
(690, 3, 294, 3, '2026-02-04 16:00:00', '2026-02-05 04:24:30'),
(691, 3, 295, 3, '2026-02-04 16:00:00', '2026-02-05 04:59:19'),
(692, 21, 169, 2, '2026-02-04 16:00:00', '2026-02-05 05:10:57'),
(693, 3, 296, 3, '2026-02-04 16:00:00', '2026-02-05 05:28:44'),
(694, 27, 221, 3, '2026-02-04 16:00:00', '2026-02-05 05:28:50'),
(695, 4, 142, 3, '2026-02-04 16:00:00', '2026-02-05 05:29:15'),
(696, 3, 297, 2, '2026-02-04 16:00:00', '2026-02-05 05:35:01'),
(697, 3, 298, 2, '2026-02-04 16:00:00', '2026-02-05 05:37:12'),
(698, 3, 299, 2, '2026-02-04 16:00:00', '2026-02-05 05:37:40'),
(699, 3, 300, 2, '2026-02-04 16:00:00', '2026-02-05 05:45:06'),
(700, 3, 301, 2, '2026-02-04 16:00:00', '2026-02-05 05:45:34'),
(701, 22, 184, 2, '2026-02-04 16:00:00', '2026-02-05 05:47:23'),
(702, 3, 302, 3, '2026-02-04 16:00:00', '2026-02-05 05:52:44'),
(703, 3, 303, 2, '2026-02-04 16:00:00', '2026-02-05 05:56:37'),
(704, 22, 186, 2, '2026-02-04 16:00:00', '2026-02-05 05:57:25'),
(705, 3, 304, 3, '2026-02-04 16:00:00', '2026-02-05 06:00:36'),
(706, 3, 305, 3, '2026-02-04 16:00:00', '2026-02-05 06:04:02'),
(707, 13, 106, 2, '2026-02-04 16:00:00', '2026-02-05 06:10:59'),
(708, 32, 306, 11, '2026-02-04 16:00:00', '2026-02-05 06:12:18'),
(709, 22, 183, 1, '2026-02-04 16:00:00', '2026-02-05 06:33:55'),
(710, 3, 307, 2, '2026-02-04 16:00:00', '2026-02-05 06:35:34'),
(711, 22, 181, 1, '2026-02-04 16:00:00', '2026-02-05 06:44:35'),
(712, 28, 235, 2, '2026-02-04 16:00:00', '2026-02-05 06:56:07'),
(713, 3, 308, 3, '2026-02-04 16:00:00', '2026-02-05 07:05:57'),
(714, 3, 309, 2, '2026-02-04 16:00:00', '2026-02-05 07:26:04'),
(715, 14, 113, 2, '2026-02-04 16:00:00', '2026-02-05 07:36:37'),
(716, 24, 192, 1, '2026-02-04 16:00:00', '2026-02-05 07:45:54'),
(717, 3, 310, 3, '2026-02-04 16:00:00', '2026-02-05 07:54:35'),
(718, 24, 203, 1, '2026-02-04 16:00:00', '2026-02-05 08:04:21'),
(719, 3, 311, 2, '2026-02-04 16:00:00', '2026-02-05 08:24:39'),
(720, 24, 191, 2, '2026-02-04 16:00:00', '2026-02-05 08:37:32'),
(721, 24, 196, 2, '2026-02-04 16:00:00', '2026-02-05 08:53:02'),
(722, 3, 312, 2, '2026-02-04 16:00:00', '2026-02-05 08:56:08'),
(723, 24, 200, 1, '2026-02-04 16:00:00', '2026-02-05 09:08:45'),
(724, 24, 199, 1, '2026-02-04 16:00:00', '2026-02-05 09:22:42'),
(725, 3, 313, 2, '2026-02-04 16:00:00', '2026-02-05 09:24:56'),
(726, 24, 201, 2, '2026-02-04 16:00:00', '2026-02-05 09:36:59'),
(727, 7, 154, 2, '2026-02-04 16:00:00', '2026-02-05 09:46:15'),
(728, 7, 69, 3, '2026-02-04 16:00:00', '2026-02-05 09:46:39'),
(729, 3, 314, 2, '2026-02-04 16:00:00', '2026-02-05 09:52:41'),
(730, 24, 204, 1, '2026-02-04 16:00:00', '2026-02-05 09:53:43'),
(731, 24, 207, 2, '2026-02-04 16:00:00', '2026-02-05 10:08:04'),
(732, 3, 315, 2, '2026-02-04 16:00:00', '2026-02-05 10:21:47'),
(733, 24, 193, 1, '2026-02-04 16:00:00', '2026-02-05 10:22:58'),
(734, 28, 231, 2, '2026-02-04 16:00:00', '2026-02-05 10:37:08'),
(735, 28, 241, 3, '2026-02-04 16:00:00', '2026-02-05 10:51:28'),
(736, 3, 316, 2, '2026-02-04 16:00:00', '2026-02-05 10:52:09'),
(737, 28, 233, 2, '2026-02-04 16:00:00', '2026-02-05 11:05:50'),
(738, 3, 317, 2, '2026-02-04 16:00:00', '2026-02-05 11:20:21'),
(739, 22, 188, 1, '2026-02-04 16:00:00', '2026-02-05 11:37:18'),
(740, 3, 318, 2, '2026-02-04 16:00:00', '2026-02-05 11:50:33'),
(741, 22, 185, 2, '2026-02-04 16:00:00', '2026-02-05 11:54:03'),
(742, 22, 189, 1, '2026-02-04 16:00:00', '2026-02-05 12:09:49'),
(743, 3, 319, 2, '2026-02-04 16:00:00', '2026-02-05 12:21:02'),
(744, 22, 180, 2, '2026-02-04 16:00:00', '2026-02-05 12:25:58'),
(745, 22, 187, 2, '2026-02-04 16:00:00', '2026-02-05 12:42:24'),
(746, 3, 320, 2, '2026-02-04 16:00:00', '2026-02-05 12:52:29'),
(747, 22, 182, 1, '2026-02-04 16:00:00', '2026-02-05 12:58:01'),
(748, 22, 179, 1, '2026-02-04 16:00:00', '2026-02-05 13:14:19'),
(749, 3, 321, 2, '2026-02-04 16:00:00', '2026-02-05 13:22:06'),
(750, 24, 194, 2, '2026-02-04 16:00:00', '2026-02-05 13:29:54'),
(751, 24, 197, 1, '2026-02-04 16:00:00', '2026-02-05 13:48:23'),
(752, 28, 234, 2, '2026-02-04 16:00:00', '2026-02-05 13:50:23'),
(753, 28, 230, 1, '2026-02-04 16:00:00', '2026-02-05 13:50:34'),
(754, 14, 109, 2, '2026-02-04 16:00:00', '2026-02-05 13:50:34'),
(755, 3, 322, 2, '2026-02-04 16:00:00', '2026-02-05 13:50:43'),
(756, 28, 238, 1, '2026-02-04 16:00:00', '2026-02-05 13:50:44'),
(757, 14, 112, 2, '2026-02-04 16:00:00', '2026-02-05 13:50:44'),
(758, 14, 114, 2, '2026-02-04 16:00:00', '2026-02-05 13:50:55'),
(759, 14, 111, 2, '2026-02-04 16:00:00', '2026-02-05 13:51:06'),
(760, 18, 144, 2, '2026-02-04 16:00:00', '2026-02-05 13:51:38'),
(761, 28, 244, 1, '2026-02-04 16:00:00', '2026-02-05 13:52:18'),
(762, 28, 237, 2, '2026-02-04 16:00:00', '2026-02-05 13:52:29'),
(763, 28, 239, 1, '2026-02-04 16:00:00', '2026-02-05 13:52:39'),
(764, 14, 108, 1, '2026-02-04 16:00:00', '2026-02-05 13:53:00'),
(765, 14, 110, 1, '2026-02-04 16:00:00', '2026-02-05 13:53:42'),
(766, 28, 248, 2, '2026-02-04 16:00:00', '2026-02-05 13:54:13'),
(767, 28, 245, 1, '2026-02-04 16:00:00', '2026-02-05 13:55:17'),
(768, 18, 150, 2, '2026-02-04 16:00:00', '2026-02-05 13:55:59'),
(769, 28, 240, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:09'),
(770, 18, 145, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:10'),
(771, 28, 236, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:19'),
(772, 18, 146, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:20'),
(773, 28, 242, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:30'),
(774, 28, 243, 2, '2026-02-04 16:00:00', '2026-02-05 13:56:41'),
(775, 28, 229, 1, '2026-02-04 16:00:00', '2026-02-05 13:57:02'),
(776, 28, 232, 1, '2026-02-04 16:00:00', '2026-02-05 13:57:12'),
(777, 28, 246, 2, '2026-02-04 16:00:00', '2026-02-05 13:57:22'),
(778, 5, 66, 2, '2026-02-04 16:00:00', '2026-02-05 13:57:34'),
(779, 5, 57, 1, '2026-02-04 16:00:00', '2026-02-05 13:57:44'),
(780, 5, 63, 1, '2026-02-04 16:00:00', '2026-02-05 13:57:54'),
(781, 5, 62, 2, '2026-02-04 16:00:00', '2026-02-05 13:58:05'),
(782, 5, 64, 1, '2026-02-04 16:00:00', '2026-02-05 13:58:15'),
(783, 5, 61, 2, '2026-02-04 16:00:00', '2026-02-05 13:58:25'),
(784, 28, 247, 2, '2026-02-04 16:00:00', '2026-02-05 13:58:36'),
(785, 18, 147, 1, '2026-02-04 16:00:00', '2026-02-05 14:01:02'),
(786, 5, 67, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:24'),
(787, 15, 138, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:33'),
(788, 5, 70, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:35'),
(789, 15, 134, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:44'),
(790, 5, 55, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:45'),
(791, 15, 140, 1, '2026-02-04 16:00:00', '2026-02-05 14:01:55'),
(792, 5, 56, 2, '2026-02-04 16:00:00', '2026-02-05 14:01:56'),
(793, 15, 126, 2, '2026-02-04 16:00:00', '2026-02-05 14:02:06'),
(794, 5, 65, 2, '2026-02-04 16:00:00', '2026-02-05 14:02:07'),
(795, 15, 136, 1, '2026-02-04 16:00:00', '2026-02-05 14:02:47'),
(796, 15, 131, 2, '2026-02-04 16:00:00', '2026-02-05 14:02:58'),
(797, 15, 135, 2, '2026-02-04 16:00:00', '2026-02-05 14:03:09'),
(798, 15, 128, 1, '2026-02-04 16:00:00', '2026-02-05 14:03:19'),
(799, 15, 129, 1, '2026-02-04 16:00:00', '2026-02-05 14:03:30'),
(800, 15, 132, 1, '2026-02-04 16:00:00', '2026-02-05 14:03:40'),
(801, 15, 125, 1, '2026-02-04 16:00:00', '2026-02-05 14:03:51'),
(802, 15, 133, 1, '2026-02-04 16:00:00', '2026-02-05 14:04:02'),
(803, 15, 139, 2, '2026-02-04 16:00:00', '2026-02-05 14:04:12'),
(804, 15, 124, 2, '2026-02-04 16:00:00', '2026-02-05 14:04:22'),
(805, 15, 130, 2, '2026-02-04 16:00:00', '2026-02-05 14:04:32'),
(806, 18, 149, 1, '2026-02-04 16:00:00', '2026-02-05 14:05:14');
INSERT INTO `views` (`id`, `series_id`, `episode_id`, `views`, `created_at`, `updated_at`) VALUES
(807, 15, 137, 2, '2026-02-04 16:00:00', '2026-02-05 14:05:47'),
(808, 14, 107, 1, '2026-02-04 16:00:00', '2026-02-05 14:05:57'),
(809, 24, 205, 2, '2026-02-04 16:00:00', '2026-02-05 14:06:43'),
(810, 28, 249, 1, '2026-02-04 16:00:00', '2026-02-05 14:07:20'),
(811, 14, 115, 1, '2026-02-04 16:00:00', '2026-02-05 14:08:24'),
(812, 5, 60, 1, '2026-02-04 16:00:00', '2026-02-05 14:09:05'),
(813, 5, 54, 1, '2026-02-04 16:00:00', '2026-02-05 14:09:36'),
(814, 18, 148, 1, '2026-02-04 16:00:00', '2026-02-05 14:09:47'),
(815, 5, 59, 1, '2026-02-04 16:00:00', '2026-02-05 14:10:09'),
(816, 8, 156, 1, '2026-02-04 16:00:00', '2026-02-05 14:10:51'),
(817, 8, 117, 1, '2026-02-04 16:00:00', '2026-02-05 14:11:01'),
(818, 8, 157, 1, '2026-02-04 16:00:00', '2026-02-05 14:11:12'),
(819, 8, 158, 1, '2026-02-04 16:00:00', '2026-02-05 14:11:22'),
(820, 8, 118, 1, '2026-02-04 16:00:00', '2026-02-05 14:11:33'),
(821, 25, 219, 2, '2026-02-04 16:00:00', '2026-02-05 14:12:03'),
(822, 25, 212, 1, '2026-02-04 16:00:00', '2026-02-05 14:12:14'),
(823, 25, 217, 2, '2026-02-04 16:00:00', '2026-02-05 14:12:24'),
(824, 25, 214, 2, '2026-02-04 16:00:00', '2026-02-05 14:12:35'),
(825, 25, 211, 1, '2026-02-04 16:00:00', '2026-02-05 14:12:45'),
(826, 25, 210, 2, '2026-02-04 16:00:00', '2026-02-05 14:12:56'),
(827, 24, 198, 2, '2026-02-04 16:00:00', '2026-02-05 14:12:56'),
(828, 24, 206, 2, '2026-02-04 16:00:00', '2026-02-05 14:13:16'),
(829, 15, 127, 1, '2026-02-04 16:00:00', '2026-02-05 14:13:27'),
(830, 28, 251, 1, '2026-02-04 16:00:00', '2026-02-05 14:13:47'),
(831, 5, 58, 1, '2026-02-04 16:00:00', '2026-02-05 14:13:57'),
(832, 28, 250, 1, '2026-02-04 16:00:00', '2026-02-05 14:14:29'),
(833, 25, 213, 2, '2026-02-04 16:00:00', '2026-02-05 14:14:50'),
(834, 25, 216, 1, '2026-02-04 16:00:00', '2026-02-05 14:15:11'),
(835, 25, 218, 1, '2026-02-04 16:00:00', '2026-02-05 14:15:22'),
(836, 25, 220, 2, '2026-02-04 16:00:00', '2026-02-05 14:15:33'),
(837, 25, 215, 1, '2026-02-04 16:00:00', '2026-02-05 14:15:53'),
(838, 13, 104, 1, '2026-02-04 16:00:00', '2026-02-05 14:16:38'),
(839, 13, 105, 1, '2026-02-04 16:00:00', '2026-02-05 14:16:49'),
(840, 23, 174, 1, '2026-02-04 16:00:00', '2026-02-05 14:17:00'),
(841, 21, 168, 1, '2026-02-04 16:00:00', '2026-02-05 14:17:21'),
(842, 23, 178, 1, '2026-02-04 16:00:00', '2026-02-05 14:17:54'),
(843, 23, 172, 1, '2026-02-04 16:00:00', '2026-02-05 14:18:04'),
(844, 3, 323, 2, '2026-02-04 16:00:00', '2026-02-05 14:18:27'),
(845, 21, 167, 1, '2026-02-04 16:00:00', '2026-02-05 14:18:58'),
(846, 21, 162, 1, '2026-02-04 16:00:00', '2026-02-05 14:19:09'),
(847, 21, 161, 1, '2026-02-04 16:00:00', '2026-02-05 14:19:19'),
(848, 19, 151, 1, '2026-02-04 16:00:00', '2026-02-05 14:19:29'),
(849, 21, 166, 1, '2026-02-04 16:00:00', '2026-02-05 14:20:01'),
(850, 20, 159, 1, '2026-02-04 16:00:00', '2026-02-05 14:22:29'),
(851, 24, 195, 1, '2026-02-04 16:00:00', '2026-02-05 14:23:24'),
(852, 3, 324, 1, '2026-02-04 16:00:00', '2026-02-05 14:46:46'),
(853, 3, 325, 1, '2026-02-04 16:00:00', '2026-02-05 15:16:28'),
(854, 3, 326, 1, '2026-02-04 16:00:00', '2026-02-05 15:46:38'),
(855, 28, 244, 2, '2026-02-05 16:00:00', '2026-02-05 16:00:28'),
(856, 3, 325, 2, '2026-02-05 16:00:00', '2026-02-05 16:14:32'),
(857, 3, 327, 2, '2026-02-05 16:00:00', '2026-02-05 16:19:36'),
(858, 28, 239, 1, '2026-02-05 16:00:00', '2026-02-05 16:33:12'),
(859, 29, 252, 9, '2026-02-05 16:00:00', '2026-02-05 16:43:40'),
(860, 3, 328, 2, '2026-02-05 16:00:00', '2026-02-05 16:50:02'),
(861, 3, 326, 1, '2026-02-05 16:00:00', '2026-02-05 16:50:55'),
(862, 3, 324, 1, '2026-02-05 16:00:00', '2026-02-05 16:50:57'),
(863, 3, 323, 1, '2026-02-05 16:00:00', '2026-02-05 16:50:58'),
(864, 3, 322, 1, '2026-02-05 16:00:00', '2026-02-05 16:51:00'),
(865, 3, 321, 1, '2026-02-05 16:00:00', '2026-02-05 16:51:01'),
(866, 28, 246, 2, '2026-02-05 16:00:00', '2026-02-05 17:06:04'),
(867, 32, 306, 5, '2026-02-05 16:00:00', '2026-02-05 17:07:06'),
(868, 31, 293, 12, '2026-02-05 16:00:00', '2026-02-05 17:11:23'),
(869, 3, 259, 7, '2026-02-05 16:00:00', '2026-02-05 17:15:50'),
(870, 9, 329, 12, '2026-02-05 16:00:00', '2026-02-05 17:22:28'),
(871, 28, 230, 1, '2026-02-05 16:00:00', '2026-02-05 17:37:41'),
(872, 7, 330, 7, '2026-02-05 16:00:00', '2026-02-05 18:10:43'),
(873, 28, 251, 1, '2026-02-05 16:00:00', '2026-02-05 18:13:16'),
(874, 3, 331, 1, '2026-02-05 16:00:00', '2026-02-05 18:18:27'),
(875, 28, 247, 3, '2026-02-05 16:00:00', '2026-02-05 18:43:59'),
(876, 5, 332, 27, '2026-02-05 16:00:00', '2026-02-05 19:07:16'),
(877, 28, 237, 1, '2026-02-05 16:00:00', '2026-02-05 19:14:44'),
(878, 28, 236, 1, '2026-02-05 16:00:00', '2026-02-05 19:17:07'),
(879, 3, 333, 2, '2026-02-05 16:00:00', '2026-02-05 19:29:40'),
(880, 5, 70, 3, '2026-02-05 16:00:00', '2026-02-05 19:34:31'),
(881, 3, 312, 1, '2026-02-05 16:00:00', '2026-02-05 19:36:08'),
(882, 28, 243, 1, '2026-02-05 16:00:00', '2026-02-05 19:45:48'),
(883, 3, 334, 2, '2026-02-05 16:00:00', '2026-02-05 19:59:24'),
(884, 5, 54, 2, '2026-02-05 16:00:00', '2026-02-05 20:13:04'),
(885, 5, 55, 1, '2026-02-05 16:00:00', '2026-02-05 20:13:09'),
(886, 5, 56, 1, '2026-02-05 16:00:00', '2026-02-05 20:13:13'),
(887, 5, 57, 1, '2026-02-05 16:00:00', '2026-02-05 20:13:16'),
(888, 6, 80, 2, '2026-02-05 16:00:00', '2026-02-05 20:15:45'),
(889, 3, 335, 2, '2026-02-05 16:00:00', '2026-02-05 20:31:05'),
(890, 28, 249, 2, '2026-02-05 16:00:00', '2026-02-05 20:57:59'),
(891, 3, 336, 1, '2026-02-05 16:00:00', '2026-02-05 21:02:23'),
(892, 28, 280, 1, '2026-02-05 16:00:00', '2026-02-05 21:14:17'),
(893, 3, 337, 1, '2026-02-05 16:00:00', '2026-02-05 21:33:01'),
(894, 30, 272, 65, '2026-02-05 16:00:00', '2026-02-05 21:39:20'),
(895, 28, 248, 1, '2026-02-05 16:00:00', '2026-02-05 21:47:07'),
(896, 3, 338, 1, '2026-02-05 16:00:00', '2026-02-05 22:04:27'),
(897, 28, 250, 1, '2026-02-05 16:00:00', '2026-02-05 22:22:29'),
(898, 3, 339, 1, '2026-02-05 16:00:00', '2026-02-05 22:39:15'),
(899, 5, 65, 1, '2026-02-05 16:00:00', '2026-02-05 22:47:33'),
(900, 28, 232, 1, '2026-02-05 16:00:00', '2026-02-05 22:55:23'),
(901, 3, 340, 1, '2026-02-05 16:00:00', '2026-02-05 23:11:01'),
(902, 28, 279, 2, '2026-02-05 16:00:00', '2026-02-05 23:28:34'),
(903, 3, 341, 3, '2026-02-05 16:00:00', '2026-02-05 23:44:48'),
(904, 3, 260, 5, '2026-02-05 16:00:00', '2026-02-06 00:12:47'),
(905, 3, 342, 1, '2026-02-05 16:00:00', '2026-02-06 00:20:29'),
(906, 5, 67, 2, '2026-02-05 16:00:00', '2026-02-06 00:27:22'),
(907, 3, 343, 2, '2026-02-05 16:00:00', '2026-02-06 00:53:10'),
(908, 3, 344, 1, '2026-02-05 16:00:00', '2026-02-06 01:27:02'),
(909, 3, 345, 1, '2026-02-05 16:00:00', '2026-02-06 02:00:59'),
(910, 3, 261, 1, '2026-02-05 16:00:00', '2026-02-06 02:07:40'),
(911, 3, 262, 2, '2026-02-05 16:00:00', '2026-02-06 02:07:45'),
(912, 3, 263, 2, '2026-02-05 16:00:00', '2026-02-06 02:07:47'),
(913, 3, 264, 2, '2026-02-05 16:00:00', '2026-02-06 02:07:48'),
(914, 3, 265, 2, '2026-02-05 16:00:00', '2026-02-06 02:08:14'),
(915, 3, 266, 4, '2026-02-05 16:00:00', '2026-02-06 02:09:02'),
(916, 3, 267, 1, '2026-02-05 16:00:00', '2026-02-06 02:09:20'),
(917, 3, 268, 3, '2026-02-05 16:00:00', '2026-02-06 02:09:24'),
(918, 3, 269, 2, '2026-02-05 16:00:00', '2026-02-06 02:10:18'),
(919, 3, 270, 2, '2026-02-05 16:00:00', '2026-02-06 02:10:53'),
(920, 3, 273, 1, '2026-02-05 16:00:00', '2026-02-06 02:10:57'),
(921, 3, 274, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:15'),
(922, 3, 275, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:17'),
(923, 3, 276, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:18'),
(924, 3, 277, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:20'),
(925, 3, 278, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:45'),
(926, 3, 282, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:46'),
(927, 3, 283, 3, '2026-02-05 16:00:00', '2026-02-06 02:11:48'),
(928, 3, 284, 3, '2026-02-05 16:00:00', '2026-02-06 02:11:49'),
(929, 3, 285, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:51'),
(930, 3, 286, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:52'),
(931, 3, 287, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:54'),
(932, 3, 288, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:55'),
(933, 3, 289, 1, '2026-02-05 16:00:00', '2026-02-06 02:11:56'),
(934, 3, 346, 1, '2026-02-05 16:00:00', '2026-02-06 02:30:15'),
(935, 3, 347, 1, '2026-02-05 16:00:00', '2026-02-06 03:03:38'),
(936, 28, 281, 1, '2026-02-05 16:00:00', '2026-02-06 03:21:17'),
(937, 3, 348, 1, '2026-02-05 16:00:00', '2026-02-06 03:34:26'),
(938, 3, 153, 4, '2026-02-05 16:00:00', '2026-02-06 04:04:11'),
(939, 10, 349, 14, '2026-02-05 16:00:00', '2026-02-06 04:17:13'),
(940, 3, 350, 1, '2026-02-05 16:00:00', '2026-02-06 04:33:00'),
(941, 12, 72, 1, '2026-02-05 16:00:00', '2026-02-06 05:06:16'),
(942, 3, 351, 2, '2026-02-05 16:00:00', '2026-02-06 05:09:17'),
(943, 11, 352, 31, '2026-02-05 16:00:00', '2026-02-06 05:17:41'),
(944, 11, 78, 5, '2026-02-05 16:00:00', '2026-02-06 05:20:40'),
(945, 11, 90, 2, '2026-02-05 16:00:00', '2026-02-06 05:20:53'),
(946, 11, 89, 1, '2026-02-05 16:00:00', '2026-02-06 05:21:02'),
(947, 11, 94, 1, '2026-02-05 16:00:00', '2026-02-06 05:23:13'),
(948, 11, 79, 1, '2026-02-05 16:00:00', '2026-02-06 05:23:17'),
(949, 3, 353, 1, '2026-02-05 16:00:00', '2026-02-06 05:46:25'),
(950, 3, 51, 1, '2026-02-05 16:00:00', '2026-02-06 06:16:20'),
(951, 3, 354, 1, '2026-02-05 16:00:00', '2026-02-06 06:20:03'),
(952, 3, 355, 1, '2026-02-05 16:00:00', '2026-02-06 06:51:37'),
(953, 3, 356, 1, '2026-02-05 16:00:00', '2026-02-06 07:23:21'),
(954, 3, 357, 1, '2026-02-05 16:00:00', '2026-02-06 07:53:44'),
(955, 8, 358, 22, '2026-02-05 16:00:00', '2026-02-06 08:29:39'),
(956, 8, 84, 2, '2026-02-05 16:00:00', '2026-02-06 08:45:06'),
(957, 3, 359, 1, '2026-02-05 16:00:00', '2026-02-06 09:05:21'),
(958, 3, 360, 1, '2026-02-05 16:00:00', '2026-02-06 09:35:37'),
(959, 3, 361, 1, '2026-02-05 16:00:00', '2026-02-06 10:05:46'),
(960, 7, 69, 1, '2026-02-05 16:00:00', '2026-02-06 10:14:10'),
(961, 3, 254, 1, '2026-02-05 16:00:00', '2026-02-06 10:17:15'),
(962, 10, 77, 4, '2026-02-05 16:00:00', '2026-02-06 10:30:18'),
(963, 3, 362, 1, '2026-02-05 16:00:00', '2026-02-06 10:37:57'),
(964, 3, 363, 1, '2026-02-05 16:00:00', '2026-02-06 11:09:24'),
(965, 3, 364, 1, '2026-02-05 16:00:00', '2026-02-06 11:41:47'),
(966, 6, 102, 3, '2026-02-05 16:00:00', '2026-02-06 11:47:49'),
(967, 6, 103, 1, '2026-02-05 16:00:00', '2026-02-06 11:48:11'),
(968, 8, 121, 2, '2026-02-05 16:00:00', '2026-02-06 11:49:10'),
(969, 22, 170, 1, '2026-02-05 16:00:00', '2026-02-06 11:50:38'),
(970, 27, 221, 1, '2026-02-05 16:00:00', '2026-02-06 11:51:09'),
(971, 3, 365, 1, '2026-02-05 16:00:00', '2026-02-06 12:10:40'),
(972, 3, 366, 1, '2026-02-05 16:00:00', '2026-02-06 12:44:57'),
(973, 6, 101, 1, '2026-02-05 16:00:00', '2026-02-06 15:21:05'),
(974, 3, 255, 1, '2026-02-05 16:00:00', '2026-02-06 15:21:28'),
(975, 7, 330, 2, '2026-02-06 16:00:00', '2026-02-06 16:41:49'),
(976, 22, 188, 1, '2026-02-06 16:00:00', '2026-02-06 16:43:02'),
(977, 13, 105, 2, '2026-02-06 16:00:00', '2026-02-06 16:45:04'),
(978, 8, 158, 9, '2026-02-06 16:00:00', '2026-02-06 16:46:04'),
(979, 3, 366, 1, '2026-02-06 16:00:00', '2026-02-06 16:52:55'),
(980, 3, 304, 5, '2026-02-06 16:00:00', '2026-02-06 16:52:59'),
(981, 6, 102, 3, '2026-02-06 16:00:00', '2026-02-06 17:10:51'),
(982, 6, 95, 4, '2026-02-06 16:00:00', '2026-02-06 17:11:02'),
(983, 6, 81, 5, '2026-02-06 16:00:00', '2026-02-06 17:11:13'),
(984, 13, 367, 19, '2026-02-06 16:00:00', '2026-02-06 17:22:16'),
(985, 3, 368, 1, '2026-02-06 16:00:00', '2026-02-06 17:40:35'),
(986, 3, 369, 1, '2026-02-06 16:00:00', '2026-02-06 18:10:54'),
(987, 6, 83, 4, '2026-02-06 16:00:00', '2026-02-06 18:29:54'),
(988, 14, 109, 2, '2026-02-06 16:00:00', '2026-02-06 18:30:05'),
(989, 3, 283, 15, '2026-02-06 16:00:00', '2026-02-06 18:30:16'),
(990, 9, 375, 2, '2026-02-06 16:00:00', '2026-02-06 18:34:36'),
(991, 9, 373, 1, '2026-02-06 16:00:00', '2026-02-06 18:34:39'),
(992, 9, 372, 1, '2026-02-06 16:00:00', '2026-02-06 18:34:45'),
(993, 9, 371, 1, '2026-02-06 16:00:00', '2026-02-06 18:34:48'),
(994, 9, 370, 1, '2026-02-06 16:00:00', '2026-02-06 18:34:50'),
(995, 9, 68, 2, '2026-02-06 16:00:00', '2026-02-06 18:34:51'),
(996, 12, 374, 20, '2026-02-06 16:00:00', '2026-02-06 18:35:05'),
(997, 12, 378, 3, '2026-02-06 16:00:00', '2026-02-06 18:36:31'),
(998, 12, 377, 3, '2026-02-06 16:00:00', '2026-02-06 18:36:35'),
(999, 12, 376, 1, '2026-02-06 16:00:00', '2026-02-06 18:36:36'),
(1000, 3, 379, 1, '2026-02-06 16:00:00', '2026-02-06 18:44:46'),
(1001, 5, 332, 2, '2026-02-06 16:00:00', '2026-02-06 18:54:35'),
(1002, 11, 352, 4, '2026-02-06 16:00:00', '2026-02-06 19:07:31'),
(1003, 3, 380, 1, '2026-02-06 16:00:00', '2026-02-06 19:18:00'),
(1004, 10, 349, 3, '2026-02-06 16:00:00', '2026-02-06 19:20:25'),
(1005, 3, 381, 1, '2026-02-06 16:00:00', '2026-02-06 19:47:41'),
(1006, 6, 80, 6, '2026-02-06 16:00:00', '2026-02-06 19:48:15'),
(1007, 6, 86, 4, '2026-02-06 16:00:00', '2026-02-06 19:48:27'),
(1008, 3, 257, 6, '2026-02-06 16:00:00', '2026-02-06 19:48:38'),
(1009, 30, 272, 1, '2026-02-06 16:00:00', '2026-02-06 19:48:50'),
(1010, 8, 358, 7, '2026-02-06 16:00:00', '2026-02-06 19:56:51'),
(1011, 6, 101, 4, '2026-02-06 16:00:00', '2026-02-06 20:11:22'),
(1012, 3, 382, 1, '2026-02-06 16:00:00', '2026-02-06 20:18:56'),
(1013, 3, 383, 1, '2026-02-06 16:00:00', '2026-02-06 20:49:20'),
(1014, 17, 143, 1, '2026-02-06 16:00:00', '2026-02-06 21:11:56'),
(1015, 14, 114, 3, '2026-02-06 16:00:00', '2026-02-06 21:12:09'),
(1016, 3, 256, 7, '2026-02-06 16:00:00', '2026-02-06 21:12:23'),
(1017, 3, 384, 1, '2026-02-06 16:00:00', '2026-02-06 21:20:39'),
(1018, 3, 52, 4, '2026-02-06 16:00:00', '2026-02-06 21:50:47'),
(1019, 3, 385, 1, '2026-02-06 16:00:00', '2026-02-06 21:51:21'),
(1020, 3, 386, 1, '2026-02-06 16:00:00', '2026-02-06 22:24:07'),
(1021, 12, 72, 3, '2026-02-06 16:00:00', '2026-02-06 22:33:23'),
(1022, 3, 387, 4, '2026-02-06 16:00:00', '2026-02-06 22:57:25'),
(1023, 9, 329, 3, '2026-02-06 16:00:00', '2026-02-06 23:01:33'),
(1024, 3, 303, 1, '2026-02-06 16:00:00', '2026-02-06 23:15:29'),
(1025, 3, 388, 1, '2026-02-06 16:00:00', '2026-02-06 23:28:09'),
(1026, 7, 154, 1, '2026-02-06 16:00:00', '2026-02-06 23:50:29'),
(1027, 3, 259, 7, '2026-02-06 16:00:00', '2026-02-06 23:53:13'),
(1028, 3, 389, 1, '2026-02-06 16:00:00', '2026-02-06 23:57:49'),
(1029, 3, 278, 3, '2026-02-06 16:00:00', '2026-02-07 00:11:16'),
(1030, 3, 276, 2, '2026-02-06 16:00:00', '2026-02-07 00:11:16'),
(1031, 3, 270, 2, '2026-02-06 16:00:00', '2026-02-07 00:11:16'),
(1032, 3, 260, 1, '2026-02-06 16:00:00', '2026-02-07 00:11:17'),
(1033, 3, 275, 2, '2026-02-06 16:00:00', '2026-02-07 00:11:18'),
(1034, 3, 266, 3, '2026-02-06 16:00:00', '2026-02-07 00:11:18'),
(1035, 3, 274, 2, '2026-02-06 16:00:00', '2026-02-07 00:11:19'),
(1036, 3, 254, 39, '2026-02-06 16:00:00', '2026-02-07 00:11:20'),
(1037, 3, 255, 10, '2026-02-06 16:00:00', '2026-02-07 00:11:21'),
(1038, 8, 118, 4, '2026-02-06 16:00:00', '2026-02-07 00:12:13'),
(1039, 8, 120, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:13'),
(1040, 8, 119, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:14'),
(1041, 8, 116, 4, '2026-02-06 16:00:00', '2026-02-07 00:12:14'),
(1042, 8, 117, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:15'),
(1043, 8, 123, 2, '2026-02-06 16:00:00', '2026-02-07 00:12:15'),
(1044, 8, 121, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:16'),
(1045, 8, 157, 6, '2026-02-06 16:00:00', '2026-02-07 00:12:16'),
(1046, 8, 155, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:17'),
(1047, 8, 122, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:18'),
(1048, 8, 84, 2, '2026-02-06 16:00:00', '2026-02-07 00:12:19'),
(1049, 8, 156, 3, '2026-02-06 16:00:00', '2026-02-07 00:12:20'),
(1050, 3, 282, 3, '2026-02-06 16:00:00', '2026-02-07 00:13:10'),
(1051, 3, 153, 84, '2026-02-06 16:00:00', '2026-02-07 00:15:30'),
(1052, 3, 262, 2, '2026-02-06 16:00:00', '2026-02-07 00:15:45'),
(1053, 3, 268, 3, '2026-02-06 16:00:00', '2026-02-07 00:15:45'),
(1054, 3, 264, 4, '2026-02-06 16:00:00', '2026-02-07 00:15:47'),
(1055, 6, 98, 3, '2026-02-06 16:00:00', '2026-02-07 00:16:39'),
(1056, 6, 82, 3, '2026-02-06 16:00:00', '2026-02-07 00:16:39'),
(1057, 6, 87, 3, '2026-02-06 16:00:00', '2026-02-07 00:16:40'),
(1058, 6, 99, 3, '2026-02-06 16:00:00', '2026-02-07 00:16:42'),
(1059, 6, 103, 4, '2026-02-06 16:00:00', '2026-02-07 00:16:43'),
(1060, 3, 51, 12, '2026-02-06 16:00:00', '2026-02-07 00:17:02'),
(1061, 6, 85, 4, '2026-02-06 16:00:00', '2026-02-07 00:19:10'),
(1062, 6, 96, 3, '2026-02-06 16:00:00', '2026-02-07 00:19:48'),
(1063, 6, 97, 2, '2026-02-06 16:00:00', '2026-02-07 00:19:50'),
(1064, 6, 100, 4, '2026-02-06 16:00:00', '2026-02-07 00:21:37'),
(1065, 3, 390, 1, '2026-02-06 16:00:00', '2026-02-07 00:29:12'),
(1066, 15, 391, 6, '2026-02-06 16:00:00', '2026-02-07 00:36:25'),
(1067, 15, 392, 7, '2026-02-06 16:00:00', '2026-02-07 00:36:45'),
(1068, 3, 393, 1, '2026-02-06 16:00:00', '2026-02-07 01:00:01'),
(1069, 3, 394, 2, '2026-02-06 16:00:00', '2026-02-07 01:30:13'),
(1070, 3, 284, 4, '2026-02-06 16:00:00', '2026-02-07 01:36:43'),
(1071, 3, 285, 3, '2026-02-06 16:00:00', '2026-02-07 01:36:44'),
(1072, 3, 286, 3, '2026-02-06 16:00:00', '2026-02-07 01:36:45'),
(1073, 3, 287, 3, '2026-02-06 16:00:00', '2026-02-07 01:36:52'),
(1074, 14, 115, 12, '2026-02-06 16:00:00', '2026-02-07 01:41:41'),
(1075, 4, 142, 1, '2026-02-06 16:00:00', '2026-02-07 01:43:14'),
(1076, 3, 258, 4, '2026-02-06 16:00:00', '2026-02-07 01:49:10'),
(1077, 3, 346, 1, '2026-02-06 16:00:00', '2026-02-07 02:03:57'),
(1078, 14, 110, 2, '2026-02-06 16:00:00', '2026-02-07 02:26:41'),
(1079, 3, 288, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:17'),
(1080, 3, 289, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:17'),
(1081, 3, 290, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:18'),
(1082, 3, 291, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:19'),
(1083, 3, 292, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:19'),
(1084, 3, 294, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:20'),
(1085, 3, 295, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:21'),
(1086, 3, 296, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:21'),
(1087, 3, 305, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:25'),
(1088, 3, 307, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:25'),
(1089, 3, 308, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:30'),
(1090, 3, 309, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:31'),
(1091, 3, 310, 1, '2026-02-06 16:00:00', '2026-02-07 03:30:32'),
(1092, 14, 395, 59, '2026-02-06 16:00:00', '2026-02-07 03:38:44'),
(1093, 32, 306, 3, '2026-02-06 16:00:00', '2026-02-07 04:17:05'),
(1094, 5, 62, 5, '2026-02-06 16:00:00', '2026-02-07 04:47:56'),
(1095, 5, 57, 4, '2026-02-06 16:00:00', '2026-02-07 04:48:33'),
(1096, 3, 263, 2, '2026-02-06 16:00:00', '2026-02-07 04:49:06'),
(1097, 7, 69, 1, '2026-02-06 16:00:00', '2026-02-07 04:49:51'),
(1098, 5, 65, 2, '2026-02-06 16:00:00', '2026-02-07 04:49:52'),
(1099, 5, 58, 4, '2026-02-06 16:00:00', '2026-02-07 04:50:32'),
(1100, 5, 67, 2, '2026-02-06 16:00:00', '2026-02-07 04:50:33'),
(1101, 5, 70, 3, '2026-02-06 16:00:00', '2026-02-07 04:51:16'),
(1102, 5, 61, 3, '2026-02-06 16:00:00', '2026-02-07 04:52:39'),
(1103, 5, 60, 2, '2026-02-06 16:00:00', '2026-02-07 04:52:40'),
(1104, 5, 54, 4, '2026-02-06 16:00:00', '2026-02-07 04:53:19'),
(1105, 5, 55, 3, '2026-02-06 16:00:00', '2026-02-07 04:53:54'),
(1106, 5, 63, 2, '2026-02-06 16:00:00', '2026-02-07 04:54:35'),
(1107, 5, 66, 4, '2026-02-06 16:00:00', '2026-02-07 04:54:35'),
(1108, 12, 74, 1, '2026-02-06 16:00:00', '2026-02-07 04:55:19'),
(1109, 5, 56, 2, '2026-02-06 16:00:00', '2026-02-07 04:55:21'),
(1110, 5, 59, 4, '2026-02-06 16:00:00', '2026-02-07 04:56:01'),
(1111, 12, 73, 1, '2026-02-06 16:00:00', '2026-02-07 04:56:02'),
(1112, 14, 108, 1, '2026-02-06 16:00:00', '2026-02-07 04:56:02'),
(1113, 14, 112, 1, '2026-02-06 16:00:00', '2026-02-07 04:56:47'),
(1114, 5, 64, 2, '2026-02-06 16:00:00', '2026-02-07 04:56:47'),
(1115, 10, 77, 1, '2026-02-06 16:00:00', '2026-02-07 04:57:28'),
(1116, 12, 75, 1, '2026-02-06 16:00:00', '2026-02-07 04:58:09'),
(1117, 11, 92, 1, '2026-02-06 16:00:00', '2026-02-07 04:58:10'),
(1118, 11, 79, 1, '2026-02-06 16:00:00', '2026-02-07 04:58:50'),
(1119, 13, 106, 1, '2026-02-06 16:00:00', '2026-02-07 04:59:30'),
(1120, 11, 88, 1, '2026-02-06 16:00:00', '2026-02-07 05:00:09'),
(1121, 11, 93, 1, '2026-02-06 16:00:00', '2026-02-07 05:00:10'),
(1122, 11, 78, 1, '2026-02-06 16:00:00', '2026-02-07 05:00:57'),
(1123, 11, 94, 1, '2026-02-06 16:00:00', '2026-02-07 05:01:37'),
(1124, 11, 90, 1, '2026-02-06 16:00:00', '2026-02-07 05:02:24'),
(1125, 11, 89, 1, '2026-02-06 16:00:00', '2026-02-07 05:02:24'),
(1126, 13, 104, 1, '2026-02-06 16:00:00', '2026-02-07 05:03:03'),
(1127, 11, 91, 1, '2026-02-06 16:00:00', '2026-02-07 05:03:05'),
(1128, 14, 113, 1, '2026-02-06 16:00:00', '2026-02-07 05:03:05'),
(1129, 14, 107, 1, '2026-02-06 16:00:00', '2026-02-07 05:04:26'),
(1130, 14, 111, 1, '2026-02-06 16:00:00', '2026-02-07 05:04:27'),
(1131, 3, 342, 1, '2026-02-06 16:00:00', '2026-02-07 05:11:07'),
(1132, 3, 265, 3, '2026-02-06 16:00:00', '2026-02-07 05:24:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_series_id_foreign` (`series_id`),
  ADD KEY `comments_episode_id_foreign` (`episode_id`);

--
-- Indeks untuk tabel `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `episodes_slug_unique` (`slug`),
  ADD KEY `episodes_series_id_foreign` (`series_id`),
  ADD KEY `episodes_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `genre_series`
--
ALTER TABLE `genre_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_series_series_id_foreign` (`series_id`),
  ADD KEY `genre_series_genre_id_foreign` (`genre_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `links_episode_id_foreign` (`episode_id`),
  ADD KEY `links_server_id_foreign` (`server_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indeks untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indeks untuk tabel `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series_slug_unique` (`slug`);

--
-- Indeks untuk tabel `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indeks untuk tabel `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `views_series_id_foreign` (`series_id`),
  ADD KEY `views_episode_id_foreign` (`episode_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `genre_series`
--
ALTER TABLE `genre_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `series`
--
ALTER TABLE `series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `servers`
--
ALTER TABLE `servers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1133;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `episodes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `genre_series`
--
ALTER TABLE `genre_series`
  ADD CONSTRAINT `genre_series_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genre_series_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `links_server_id_foreign` FOREIGN KEY (`server_id`) REFERENCES `servers` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_episode_id_foreign` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_series_id_foreign` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
