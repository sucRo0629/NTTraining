-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 
-- サーバのバージョン： 10.4.8-MariaDB
-- PHP のバージョン: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `db_kadai`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `author` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- テーブルの構造 `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `title_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `size` varchar(2) NOT NULL,
  `pages` int(11) NOT NULL,
  `note` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- テーブルのデータのダンプ `books`
--

INSERT INTO `books` (`title_id`, `title`, `size`, `pages`, `note`) VALUES
(1, '新クトゥルフ神話TRPG スターターセット', 'B5', 160, '第7版'),
(2, 'シノビガミ 基本ルールブック', 'B5', 256, NULL),
(3, 'ソード・ワールド2.5 ルールブックI', '文庫', 480, NULL),
(4, 'インセイン 基本ルールブック', '新書', 288, NULL),
(5, '銀剣のステラナイツ', '新書', 352, NULL),
(6, 'パグマイア 基本ルールブック', 'B5', 240, NULL),
(7, '永い後日談のネクロニカ', 'B5', 208, NULL),
(8, 'カオスフレア Second Chapter', 'B5', 278, NULL),
(9, 'パラノイア【トラブルシューターズ】', 'A4', 208, '基本ルールブック'),
(10, 'ダブルクロス The 3rd Edition ルールブック1', '文庫', 382, NULL),
(11, 'モノトーンミュージアム', 'A5', 271, NULL),
(12, 'ゆうやけこやけ', 'B5', 164, NULL),
(13, '新クトゥルフ神話TRPG ルールブック', 'B5', 432, '第7版基本ルールブック'),
(14, 'ビーストバインドトリニティ', 'B5', 287, '第3版基本ルールブック');

-- --------------------------------------------------------

--
-- テーブルの構造 `purchases`
--

DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
  `purchase_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `author` (`author`);

--
-- テーブルのインデックス `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`title_id`);

--
-- テーブルのインデックス `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルのAUTO_INCREMENT `books`
--
ALTER TABLE `books`
  MODIFY `title_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- テーブルのAUTO_INCREMENT `purchases`
--
ALTER TABLE `purchases`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
