-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 21 okt 2019 kl 11:30
-- Serverversion: 10.4.8-MariaDB
-- PHP-version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `grouptask_db`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `name`, `address`, `category`, `description`, `created_at`, `updated_at`, `active`, `user_id`) VALUES
(1, 'mcD', 'Klostergatan 6, 123 45 Växjö', 'Family', 'hamburgers!', '2018-03-07 12:28:25', '2019-10-03 12:44:07', 1, 5),
(2, 'Subway', 'Storgatan 57, 658 23, Göteborg', 'Family', 'subs!', '2018-10-16 07:44:39', '2019-08-28 09:19:34', 1, 6),
(3, 'MisoMiso NEW AS FUCK', 'Misovägen, 123 78, Sushitown', 'newCategories', 'no sushi, just shi', '2018-09-04 13:26:23', '2019-10-16 11:47:14', 1, 5),
(5, 'NEW MackeDonk', 'an actual address', 'fries n shit', 'A really good description', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 5),
(6, 'NEW MackeDonk23123123', 'an actual address', 'fries n shit', 'A really good description', '2019-10-16 09:09:32', '0000-00-00 00:00:00', 0, 5),
(7, 'Nilsnils goodFood AB', 'växjövägen', 'Burgers', 'food and drinks', '2019-10-16 09:27:03', '0000-00-00 00:00:00', 1, 3),
(8, 'Burger kings old meat', 'växjövägen', 'Burgers', 'food and drinks', '2019-10-16 11:48:41', '2019-10-16 11:48:41', 1, 3);

-- --------------------------------------------------------

--
-- Tabellstruktur `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `review_text` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `review`
--

INSERT INTO `review` (`review_id`, `rating`, `review_text`, `created_at`, `updated_at`, `active`, `user_id`, `restaurant_id`) VALUES
(2, '2.0', 'NEWEST WAAAA text', '2019-10-15 07:17:39', '2019-10-18 12:58:34', 1, 7, 1),
(3, '3.5', 'sushi är livet', '2019-10-15 13:15:15', '2019-10-15 00:00:00', 1, 5, 3),
(5, '1.0', 'undefined', '2019-10-16 11:44:40', '2019-10-16 11:44:40', 1, 2, 2),
(6, '1.0', 'The Review Of The BEST RESTAURANT', '2019-10-16 11:45:29', '2019-10-16 11:45:29', 1, 2, 2);

-- --------------------------------------------------------

--
-- Tabellstruktur `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`, `active`) VALUES
(2, 'newUsername', 'newEmail', 'newPassword', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', 1),
(3, 'thisisteste', 'newTEST', 'newPadsadaassword', 1, '2019-10-01 11:08:09', '2019-10-15 12:22:42', 1),
(5, 'fifthWithDate', 'new2123TEST', 'wa', 1, '2019-10-05 08:27:23', '2019-10-16 08:16:46', 1),
(6, 'nejnejnej', '123', 'waaaaaaaaaaaaaaaaaaa', 1, '2019-08-06 07:37:31', '2019-10-16 08:19:33', 1),
(7, 'Tjenafan', 'email@asdads.com', '123213', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', 1),
(8, 'Tjenafan', 'email@asdads.com', '123213', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', 1),
(9, 'Tjenafan', 'email@asdads.com', '123213', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', 1),
(10, 'yourUsername', 'yourEmailAddress', 'yourHashedPassword', 1, '2019-10-16 11:30:49', '2019-10-16 11:30:49', 1),
(11, 'resultsandstuff', '@email.com', '123123', 1, '2019-10-17 07:43:57', '2019-10-17 07:43:57', 1),
(12, 'resultsandstuff', '@email.com', '123123', 1, '2019-10-17 07:44:35', '2019-10-17 07:44:35', 1),
(13, '1111111111111111111111', '@email.com', '123123', 1, '2019-10-18 12:43:34', '2019-10-18 12:43:34', 1),
(14, '1111111111111111111111', '@email.com', '123123', 1, '2019-10-19 12:11:22', '2019-10-19 12:11:22', 1),
(15, '1111111111111111111111', '@email.com', '123123', 0, '2019-10-19 12:11:47', '2019-10-19 12:11:47', 1),
(16, '123', 'simon.nilsson123@gmail.com', '123123', 0, '2019-10-19 12:18:58', '2019-10-19 12:18:58', 1),
(17, 'nils', 'simmm@gmail.com', '123123', 0, '2019-10-19 13:08:49', '2019-10-19 13:08:49', 1),
(18, '123', 'simon.nilsson123@gmail.com', '12312312313', 0, '2019-10-21 06:13:45', '2019-10-21 06:13:45', 1),
(19, '123', 'simon.nilsson123@gmail.com', '12312312313', 0, '2019-10-21 06:13:45', '2019-10-21 06:13:45', 1),
(20, '123', 'simon.nilsson123@gmail.com', '12312312313', 0, '2019-10-21 06:13:47', '2019-10-21 06:13:47', 1),
(21, 'SUUP', 'hejhejhej@hotmail.com', '321', 0, '2019-10-21 06:44:28', '2019-10-21 06:44:28', 1),
(22, 'thisiisauser', 'simon12123@hotmail.com', '321321', 0, '2019-10-21 07:22:22', '2019-10-21 07:22:22', 1),
(23, 'thisiisauser2', 'simon12123222222@hotmail.com', '321321', 0, '2019-10-21 07:29:19', '2019-10-21 07:29:19', 1),
(24, 'thisiisauser1231231231232', 'ENHELTNYANVANDARE12123@hotmail.com', '321321', 0, '2019-10-21 07:29:50', '2019-10-21 07:29:50', 1),
(25, 'thisiisauser2', 'simon12123222222@hotmail.com', '321321', 0, '2019-10-21 07:31:13', '2019-10-21 07:31:13', 1),
(26, 'thisiisauser1231231231232', 'ENHELTNYANVANDARE12123@hotmail.com', '321321', 0, '2019-10-21 07:31:13', '2019-10-21 07:31:13', 1),
(27, 'user1', 'user1@gmail.com', '123', 0, '2019-10-21 07:31:44', '2019-10-21 07:31:44', 1),
(28, 'user1', 'user1@gmail.com', '123', 0, '2019-10-21 07:32:02', '2019-10-21 07:32:02', 1),
(29, 'useruser', 'useruser@hotmail.com', '123', 0, '2019-10-21 07:36:25', '2019-10-21 07:36:25', 1),
(30, 'useruseruser', 'useruseruser@hotmail.com', '123', 0, '2019-10-21 07:37:16', '2019-10-21 07:37:16', 1),
(31, 'useruseruser', 'useruseruser@hotmail.com', '123', 0, '2019-10-21 07:38:23', '2019-10-21 07:38:23', 1),
(32, 'useruser123', 'useruser123@hotmail.com', 'user', 0, '2019-10-21 07:38:34', '2019-10-21 07:38:34', 1),
(33, 'sunb', 'sunb@gmail.com', 'sunb123', 0, '2019-10-21 07:48:09', '2019-10-21 07:48:09', 1),
(34, 'sunb', 'sunb@gmail.com', 'sunb123', 0, '2019-10-21 07:49:39', '2019-10-21 07:49:39', 1),
(35, 'sunb', 'sunb@gmail.com', 'sunb123', 0, '2019-10-21 07:50:48', '2019-10-21 07:50:48', 1),
(36, 'sunb', 'sunb@gmail.com', 'sunb123', 0, '2019-10-21 07:51:56', '2019-10-21 07:51:56', 1),
(37, 'sunb123', 'sunb123@gmail.com', 'sunb123', 0, '2019-10-21 07:56:56', '2019-10-21 07:56:56', 1),
(38, 'kallek', 'kallek@hotmail.com', '123', 0, '2019-10-21 08:01:42', '2019-10-21 08:01:42', 1),
(39, 'simon', 'simon@hotmail.com', 'simon', 0, '2019-10-21 09:27:50', '2019-10-21 09:27:50', 1);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index för tabell `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_to_user` (`user_id`),
  ADD KEY `review_to_restaurant` (`restaurant_id`);

--
-- Index för tabell `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT för tabell `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT för tabell `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Restriktioner för dumpade tabeller
--

--
-- Restriktioner för tabell `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Restriktioner för tabell `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_to_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  ADD CONSTRAINT `review_to_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
