-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 
-- サーバのバージョン： 10.1.35-MariaDB
-- PHP Version: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nextlunch`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `author`
--

INSERT INTO `author` (`id`, `password`) VALUES
(1, 'admin');

-- --------------------------------------------------------

--
-- テーブルの構造 `delete_request`
--

CREATE TABLE `delete_request` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `reason` int(1) NOT NULL,
  `note` varchar(140) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `genre`
--

INSERT INTO `genre` (`id`, `name`, `group_id`) VALUES
(1, '豚骨', 1),
(2, '醤油', 1),
(3, '味噌', 1),
(4, '塩', 1),
(5, '魚介出汁', 1),
(6, '魚介豚骨', 1),
(7, '辛い', 1),
(8, 'こってり', 1),
(9, 'さっぱり', 1),
(10, '海鮮・魚介', 2),
(11, 'うどん・そば', 2),
(12, 'とんかつ', 2),
(13, '天ぷら', 2),
(14, '鉄板焼き', 2),
(15, '焼き肉', 2),
(16, 'お好み焼き', 2),
(17, '鍋', 2),
(18, 'その他（和食）', 2),
(19, 'カレー', 3),
(20, 'ステーキ', 3),
(21, 'ハンバーグ', 3),
(22, 'パスタ', 3),
(23, 'イタリアン', 3),
(24, 'シーフード', 3),
(25, 'ピザ', 3),
(26, 'その他（洋食）', 3),
(27, '餃子', 4),
(28, '中華', 4),
(29, '韓国', 4),
(30, 'エスニック', 4),
(31, 'おかわり無料', 5),
(32, '大盛り無料', 5);

-- --------------------------------------------------------

--
-- テーブルの構造 `genre_group`
--

CREATE TABLE `genre_group` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `genre_group`
--

INSERT INTO `genre_group` (`id`, `name`) VALUES
(1, 'ラーメン'),
(2, '和食'),
(3, '洋食'),
(4, 'その他の料理'),
(5, '無料サービス');

-- --------------------------------------------------------

--
-- テーブルの構造 `genre_of_restaurant`
--

CREATE TABLE `genre_of_restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `genre_of_restaurant`
--

INSERT INTO `genre_of_restaurant` (`restaurant_id`, `genre_id`) VALUES
(2, 20),
(2, 21),
(2, 31),
(3, 10),
(3, 12),
(3, 17),
(3, 18),
(3, 21),
(4, 7),
(4, 8),
(5, 18),
(6, 1),
(6, 2),
(6, 27),
(7, 18),
(7, 31),
(8, 2),
(8, 27),
(8, 28),
(9, 1),
(9, 7),
(9, 8),
(9, 27),
(10, 12),
(10, 19),
(10, 31),
(11, 18),
(12, 1),
(12, 8),
(12, 31),
(13, 2),
(13, 7),
(13, 27),
(13, 28),
(13, 31),
(14, 15),
(14, 29),
(14, 31),
(15, 19),
(15, 30),
(16, 18),
(17, 1),
(17, 18),
(17, 20),
(17, 21),
(17, 31),
(18, 21),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 27),
(19, 10),
(19, 11),
(19, 15),
(19, 16),
(20, 1),
(20, 6),
(20, 7),
(20, 8),
(20, 32);

-- --------------------------------------------------------

--
-- テーブルの構造 `restaurant`
--

CREATE TABLE `restaurant` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lat` double(8,6) NOT NULL,
  `lng` double(9,6) NOT NULL,
  `distance` int(5) NOT NULL,
  `time` int(2) NOT NULL,
  `use_count` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- テーブルのデータのダンプ `restaurant`
--

INSERT INTO `restaurant` (`id`, `name`, `lat`, `lng`, `distance`, `time`, `use_count`) VALUES
(1, '節骨麺池袋たいぞう　東口店', 35.731540, 139.713604, 301, 6, 3),
(2, 'ペッパーランチ池袋東口店', 35.732880, 139.715895, 92, 2, 2),
(3, '築地食堂源ちゃん　東池袋店', 35.733249, 139.715313, 57, 1, 1),
(4, '元祖ニュータンタン麺', 35.732831, 139.714419, 146, 3, 1),
(5, 'たどん　池袋店', 35.732435, 139.712998, 276, 5, 1),
(6, '餃子の王将　池袋東口店', 35.728394, 139.713580, 618, 11, 1),
(7, '万事快調', 35.733449, 139.715566, 27, 1, 1),
(8, '福しん', 35.732971, 139.715495, 80, 2, 2),
(9, '鶏の穴', 35.732618, 139.714696, 146, 3, 1),
(10, '松のや　東池袋店', 35.732082, 139.713854, 241, 5, 1),
(11, 'とり鉄　東池袋店', 35.731175, 139.715203, 282, 5, 1),
(12, 'とんこつラーメン博多風龍　池袋東口店', 35.731869, 139.714358, 233, 4, 1),
(13, '楽楽', 35.731238, 139.714407, 294, 5, 1),
(14, '焼肉専門店　牛菜', 35.731106, 139.715199, 290, 5, 1),
(15, 'サグーン Sagun', 35.732643, 139.713430, 231, 4, 2),
(16, '吉野家　池袋東口店', 35.731812, 139.713950, 258, 5, 1),
(17, '情熱のすためしどん　池袋東口LABI横店', 35.731750, 139.713888, 267, 5, 2),
(18, 'モスバーガー 池袋東店', 35.732814, 139.715817, 98, 2, 1),
(19, 'テスト', 35.731942, 139.715482, 194, 4, 1),
(20, '俺の空 池袋店', 35.732177, 139.716148, 174, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delete_request`
--
ALTER TABLE `delete_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_group`
--
ALTER TABLE `genre_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delete_request`
--
ALTER TABLE `delete_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `genre_group`
--
ALTER TABLE `genre_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
