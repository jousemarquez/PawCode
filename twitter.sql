SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+02:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twitter`
--

CREATE DATABASE `twitter`;
USE `twitter`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` INT NOT NULL,
  `comment` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `comment`, `user_id`, `post_id`, `time`) VALUES
(44, 'Loprem ipsum', 25, 574, '2023-09-01 02:21:10'),
(45, 'No me lo puedo creer!', 2, 712, '2023-09-01 05:31:56');

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

CREATE TABLE `follow` (
  `id` INT NOT NULL,
  `follower_id` INT NOT NULL,
  `following_id` INT NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `follower_id`, `following_id`, `time`) VALUES
(15, 40, 2, '2023-09-19 18:30:06'),
(16, 33, 2, '2023-09-19 18:30:56'),
(41, 37, 2, '2023-09-20 20:19:49'),
(43, 5, 2, '2023-09-20 20:20:32'),
(44, 27, 2, '2023-09-20 20:21:18'),
(45, 34, 2, '2023-09-20 20:22:07'),
(90, 41, 2, '2023-09-25 18:20:22'),
(94, 25, 27, '2023-09-27 07:07:27'),
(98, 42, 2, '2023-09-29 06:30:41'),
(99, 43, 2, '2023-09-29 06:32:50'),
(100, 44, 2, '2023-09-29 18:17:25'),
(101, 2, 25, '2023-09-30 02:16:24'),
(102, 25, 2, '2023-09-30 22:56:21'),
(120, 54, 2, '2023-09-01 06:57:13'),
(121, 55, 2, '2023-09-12 16:18:45'),
(126, 56, 2, '2023-09-12 16:35:31'),
(128, 57, 2, '2023-09-12 18:23:30'),
(129, 58, 2, '2023-09-13 14:52:58');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `post_id` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `post_id`) VALUES
(192, 2, 362),
(209, 25, 573),
(211, 2, 573),
(214, 2, 574),
(224, 25, 635),
(225, 25, 712),
(227, 2, 711);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` INT NOT NULL,
  `notify_for` INT NOT NULL,
  `notify_from` INT NOT NULL,
  `target` INT NOT NULL,
  `type` enum('follow','like','retweet','qoute','comment','reply','mention') COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  `count` INT NOT NULL,
  `status` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notify_for`, `notify_from`, `target`, `type`, `time`, `count`, `status`) VALUES
(30, 2, 25, 635, 'like', '2023-09-29 05:50:12', 1, 0),
(32, 2, 42, 0, 'follow', '2023-09-29 06:30:41', 1, 0),
(34, 2, 25, 711, 'qoute', '2023-09-29 18:29:24', 1, 0),
(35, 25, 2, 712, 'qoute', '2023-09-29 18:29:55', 1, 0),
(36, 2, 25, 712, 'like', '2023-09-29 18:31:11', 1, 0),
(37, 2, 25, 712, 'retweet', '2023-09-29 18:31:19', 1, 0),
(38, 25, 2, 0, 'follow', '2023-09-30 02:16:24', 1, 0),
(39, 2, 25, 0, 'follow', '2023-09-30 22:56:20', 1, 0),
(53, 2, 25, 574, 'comment', '2023-09-01 02:21:10', 1, 0),
(54, 25, 2, 574, 'reply', '2023-09-01 02:21:51', 1, 0),
(55, 2, 42, 725, 'mention', '2023-09-01 02:25:37', 1, 0),
(58, 25, 2, 711, 'like', '2023-09-01 04:32:36', 1, 0),
(67, 2, 54, 0, 'follow', '2023-09-01 06:57:13', 1, 0),
(68, 2, 55, 0, 'follow', '2023-09-12 16:18:46', 1, 0),
(73, 2, 56, 0, 'follow', '2023-09-12 16:35:31', 1, 0),
(75, 2, 57, 0, 'follow', '2023-09-12 18:23:30', 1, 0),
(76, 2, 58, 0, 'follow', '2023-09-13 14:52:58', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `post_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_on`) VALUES
(362, 2, '2023-09-06 08:31:07'),
(573, 2, '2023-09-02 03:03:39'),
(574, 2, '2023-09-02 03:04:53'),
(635, 2, '2023-09-15 09:03:32'),
(654, 2, '2023-09-25 02:19:45'),
(711, 25, '2023-09-29 18:29:24'),
(712, 2, '2023-09-29 18:29:55');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `reply` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `comment_id`, `user_id`, `reply`, `time`) VALUES
(11, 44, 2, 'ty', '2023-09-01 02:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `retweets`
--

CREATE TABLE `retweets` (
  `post_id` INT NOT NULL,
  `retweet_msg` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `tweet_id` INT DEFAULT NULL,
  `retweet_id` INT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `retweets`
--

INSERT INTO `retweets` (`post_id`, `retweet_msg`, `tweet_id`, `retweet_id`) VALUES
(711, 'good job', 654, NULL),
(712, '&lt;3', NULL, 711);

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `id` INT NOT NULL,
  `hashtag` varchar(140) COLLATE utf16_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`id`, `hashtag`, `created_on`) VALUES
(1, 'php', '2023-09-06 05:57:43'),
(4, 'hi', '2023-09-25 21:42:35'),
(5, 'alex', '2023-09-25 21:42:36'),
(6, '7oda', '2023-09-20 23:40:12'),
(9, 'js', '2023-09-02 03:24:28'),
(12, 'bro', '2023-09-02 03:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `post_id` INT NOT NULL,
  `status` varchar(140) COLLATE utf16_unicode_ci DEFAULT NULL,
  `img` text COLLATE utf16_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`post_id`, `status`, `img`) VALUES
(362,'@jousemarquez hello it\'s Jouse here!',NULL),
(573,'one day!','tweet-60666d6b426a1.jpg'),
(574,'#php is fun',NULL),
(635,'','tweet-6077e54477f73.jpeg'),
(654,'Hoy me siento cansado!',NULL),
(713,'Hello!',NULL),
(714,'Me quiero morir muchísimo',NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` INT NOT NULL,
  `username` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf16_unicode_ci NOT NULL,
  `name` varchar(40) COLLATE utf16_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `imgCover` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT 'cover.png',
  `bio` varchar(140) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf16_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `name`, `img`, `imgCover`, `bio`, `location`, `website`) VALUES
(2,'jousemarquez','jousemarquez@vedruna.es','8e4e9b7ac6fc0df9e06f57f1c366cf8a','Jouse.','jouse.jpg','cover.png','Undergraduate Web Developer.','',''),
(5,'jurado','jurado@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Jurado','jurado.jpg','cover.png','','',''),
(25,'pablo','pablo@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Pablo','pablo.jpg','cover.png','','',''),
(27,'curro','curro@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Curro','curro.jpg','cover.png','','',''),
(33,'maria','maria@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Maria','maria.jpg','cover.png','','',''),
(34,'miguel','miguel@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Miguel','miguel.jpg','cover.png','','',''),
(37,'alberto','alberto@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Alberto','alberto.jpg','cover.png','','',''),
(40,'joaquin','joaquin@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Joaquin','joaquin.jpg','cover.png','','',''),
(41,'carlos','carlos@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Carlos','carlos.jpg','cover.png','','',''),
(42,'noelia','noelia@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Noelia','noelia.jpg','cover.png','','',''),
(43,'natalia','natalia@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Natalia','natalia.jpg','cover.png','','',''),
(44,'alicia','alicia@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Alicia','alicia.jpg','cover.png','','',''),
(54,'juanbe','juanbe@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Juanbe','juanbe.jpg','cover.png','','',''),
(55,'velociraptor','velociraptor@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Velociraptor','velociraptor.jpg','cover.png','','',''),
(56,'jurasico','jurasico@twittt.com','e10adc3949ba59abbe56e057f20f883e','Jurasico','jurasico.jpg','cover.png','','',''),
(57,'alfredo','alfredo@ydar.com','e10adc3949ba59abbe56e057f20f883e','Alfredo','alfredo.jpg','cover.png','','',''),
(58,'loshuevos','loshuevos@vedruna.es','e10adc3949ba59abbe56e057f20f883e','Loshuevos','loshuevos.jpg','cover.png','','',''),
(59,'rafamancina','rafael@vedruna.es','4237b90e60ad6966c0102d479cb1e063','Rafael','rafael.jpg','cover.png','','',''),
(60,'chema','chema@vedruna.es','bc76ab60c185b74d2002ff6b38f2c03b','Chema','chema.jpg','cover.png','','',''),
(61,'quoromtv','quoromtv@gmail.com','5d0a5629f1ebfbfd77aa77fa9034f972','Quorom','quoromtv.jpg','cover.png','','','');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `following_id` (`following_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `likes_ibfk_2` (`post_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_ibfk_1` (`notify_for`),
  ADD KEY `notifications_ibfk_2` (`notify_from`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `retweets`
--
ALTER TABLE `retweets`
  ADD PRIMARY KEY (`post_id`) USING BTREE,
  ADD KEY `retweet_id` (`retweet_id`),
  ADD KEY `retweets_ibfk_2` (`tweet_id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hashtag` (`hashtag`);

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=726;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trends`
--
ALTER TABLE `trends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`notify_for`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`notify_from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `retweets`
--
ALTER TABLE `retweets`
  ADD CONSTRAINT `retweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_2` FOREIGN KEY (`tweet_id`) REFERENCES `tweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `retweets_ibfk_3` FOREIGN KEY (`retweet_id`) REFERENCES `retweets` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tweets`
--
ALTER TABLE `tweets`
  ADD CONSTRAINT `tweets_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
