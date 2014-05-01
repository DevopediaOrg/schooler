--
-- Table structure for table `#__chronoengine_extensions`
--

CREATE TABLE IF NOT EXISTS `#__chronoengine_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `ordering` int(4) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------