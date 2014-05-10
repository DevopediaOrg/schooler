-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 10, 2014 at 06:30 AM
-- Server version: 5.5.32-percona-sure1-log
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `iedf_bgms`
--
CREATE DATABASE IF NOT EXISTS `iedf_bgms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `iedf_bgms`;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_assets`
--

DROP TABLE IF EXISTS `ek5d2_assets`;
CREATE TABLE IF NOT EXISTS `ek5d2_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `ek5d2_assets`
--

INSERT INTO `ek5d2_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 492, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":[],"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 18, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 19, 74, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 75, 76, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 77, 78, 1, 'com_installer', 'com_installer', '{"core.admin":{"7":1},"core.manage":{"7":1},"core.delete":[],"core.edit.state":[]}'),
(11, 1, 79, 80, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 81, 82, 1, 'com_login', 'com_login', '{}'),
(13, 1, 83, 84, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 85, 86, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 87, 88, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 89, 90, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 91, 92, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 93, 96, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 97, 100, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 101, 102, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 103, 104, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 105, 106, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 107, 108, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 109, 110, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 111, 116, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 117, 118, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 49, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 98, 99, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 112, 113, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 8, 50, 73, 2, 'com_content.category.7', 'Blog', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(33, 27, 21, 22, 3, 'com_content.article.1', 'Layouts', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(34, 27, 23, 24, 3, 'com_content.article.2', 'Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(35, 27, 25, 26, 3, 'com_content.article.3', 'ZOO', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(36, 27, 27, 28, 3, 'com_content.article.4', 'UIkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(37, 27, 29, 30, 3, 'com_content.article.5', 'Dummy Content', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(38, 27, 31, 32, 3, 'com_content.article.6', 'Features', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(39, 27, 33, 34, 3, 'com_content.article.7', 'Home', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(40, 32, 51, 52, 3, 'com_content.article.8', 'Joomla Templates', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(41, 32, 53, 54, 3, 'com_content.article.9', 'Beautiful Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(42, 32, 55, 56, 3, 'com_content.article.10', 'Warp Framework', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(43, 32, 57, 58, 3, 'com_content.article.11', 'ZOO Extension', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(56, 7, 16, 17, 2, 'com_contact.category.8', 'Contacts', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(57, 25, 114, 115, 2, 'com_weblinks.category.9', 'YOOtheme Links', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(59, 1, 458, 459, 1, 'com_finder', 'com_finder', '{"core.admin":[],"core.manage":[]}'),
(63, 1, 462, 463, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":{"8":1},"core.manage":{"7":1},"core.delete":{"6":1},"core.edit.state":{"6":1,"5":1}}'),
(65, 1, 464, 465, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(66, 1, 466, 467, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(67, 1, 468, 469, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(68, 1, 470, 471, 1, '#__ucm_content.4', '#__ucm_content.4', '[]'),
(69, 1, 472, 473, 1, '#__ucm_content.5', '#__ucm_content.5', '[]'),
(70, 1, 474, 475, 1, '#__ucm_content.6', '#__ucm_content.6', '[]'),
(71, 1, 476, 477, 1, 'com_tags', 'com_tags', '{}'),
(72, 1, 478, 479, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(73, 1, 480, 481, 1, 'com_ajax', 'com_ajax', '{}'),
(74, 1, 482, 483, 1, 'com_postinstall', 'com_postinstall', '{}'),
(75, 18, 94, 97, 2, 'com_modules.module.1', 'Main Menu', ''),
(76, 18, 98, 99, 2, 'com_modules.module.17', 'Breadcrumbs', ''),
(77, 18, 100, 101, 2, 'com_modules.module.19', 'Bottom A', ''),
(78, 18, 102, 103, 2, 'com_modules.module.20', 'Bottom A', ''),
(79, 18, 104, 105, 2, 'com_modules.module.21', 'Bottom A', ''),
(80, 18, 106, 107, 2, 'com_modules.module.22', 'Bottom A', ''),
(81, 18, 108, 109, 2, 'com_modules.module.23', 'Fast and lightweight', ''),
(82, 18, 110, 111, 2, 'com_modules.module.24', 'Responsive design', ''),
(83, 18, 112, 113, 2, 'com_modules.module.25', 'Supported systems', ''),
(84, 18, 114, 115, 2, 'com_modules.module.26', 'Frequent updates', ''),
(85, 18, 116, 117, 2, 'com_modules.module.27', 'Bottom B', ''),
(86, 18, 118, 119, 2, 'com_modules.module.28', 'Bottom B', ''),
(87, 18, 120, 121, 2, 'com_modules.module.29', 'Bottom B', ''),
(88, 18, 122, 123, 2, 'com_modules.module.30', 'Bottom B', ''),
(89, 18, 124, 125, 2, 'com_modules.module.31', 'Footer Menu', ''),
(90, 18, 126, 127, 2, 'com_modules.module.32', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(91, 18, 128, 129, 2, 'com_modules.module.33', 'Headerbar', ''),
(92, 18, 130, 131, 2, 'com_modules.module.34', 'Main Bottom', ''),
(93, 18, 132, 133, 2, 'com_modules.module.35', 'Main Bottom', ''),
(94, 18, 134, 135, 2, 'com_modules.module.36', ' Main Top', ''),
(95, 18, 136, 137, 2, 'com_modules.module.37', 'Main Top', ''),
(96, 18, 138, 139, 2, 'com_modules.module.38', 'Logo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(97, 18, 140, 141, 2, 'com_modules.module.39', 'Login', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(98, 18, 142, 143, 2, 'com_modules.module.40', 'Search', ''),
(99, 18, 144, 145, 2, 'com_modules.module.41', 'Sub Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(100, 18, 146, 147, 2, 'com_modules.module.42', 'Sidebar Menu', ''),
(101, 18, 148, 149, 2, 'com_modules.module.43', 'Sidebar A', ''),
(102, 18, 150, 151, 2, 'com_modules.module.44', 'Sidebar A', ''),
(103, 18, 152, 153, 2, 'com_modules.module.48', 'Latest News', ''),
(104, 18, 154, 155, 2, 'com_modules.module.49', 'Login', ''),
(105, 18, 156, 157, 2, 'com_modules.module.50', 'Download ZOO', ''),
(106, 18, 158, 159, 2, 'com_modules.module.53', 'Warp Framework', ''),
(107, 18, 160, 161, 2, 'com_modules.module.54', 'Joomla & WordPress', ''),
(108, 18, 162, 163, 2, 'com_modules.module.55', 'UIkit', ''),
(109, 18, 164, 165, 2, 'com_modules.module.57', 'Sidebar B', ''),
(110, 18, 166, 167, 2, 'com_modules.module.58', 'Sidebar B', ''),
(111, 18, 168, 169, 2, 'com_modules.module.59', 'Sidebar B', ''),
(112, 18, 170, 171, 2, 'com_modules.module.61', 'Top Menu', ''),
(113, 18, 172, 173, 2, 'com_modules.module.62', 'Top A', ''),
(114, 18, 174, 175, 2, 'com_modules.module.63', 'Top A', ''),
(115, 18, 176, 177, 2, 'com_modules.module.64', 'Top A', ''),
(116, 18, 178, 179, 2, 'com_modules.module.65', 'Top A', ''),
(121, 18, 180, 181, 2, 'com_modules.module.70', 'Home Photo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(122, 18, 182, 183, 2, 'com_modules.module.71', 'Top B', ''),
(123, 18, 184, 185, 2, 'com_modules.module.72', 'Top B', ''),
(124, 18, 186, 187, 2, 'com_modules.module.73', 'Top B', ''),
(125, 18, 188, 189, 2, 'com_modules.module.74', 'Top B', ''),
(127, 18, 192, 193, 2, 'com_modules.module.76', 'Twitter List', ''),
(128, 18, 194, 195, 2, 'com_modules.module.77', 'Get Widgetkit', ''),
(129, 18, 196, 197, 2, 'com_modules.module.78', 'Twitter Bubbles', ''),
(130, 18, 198, 199, 2, 'com_modules.module.79', 'Twitter Single', ''),
(131, 18, 200, 201, 2, 'com_modules.module.82', 'Finder', ''),
(132, 18, 202, 203, 2, 'com_modules.module.83', 'ZOO Item', ''),
(133, 18, 204, 205, 2, 'com_modules.module.84', 'ZOO Comment', ''),
(134, 18, 206, 207, 2, 'com_modules.module.85', 'ZOO Tag', ''),
(135, 18, 208, 209, 2, 'com_modules.module.86', 'ZOO Category', ''),
(136, 18, 210, 211, 2, 'com_modules.module.88', 'App Bundle', ''),
(141, 18, 212, 213, 2, 'com_modules.module.94', 'Offcanvas Menu', ''),
(142, 18, 214, 215, 2, 'com_modules.module.95', 'Offcanvas', ''),
(143, 18, 216, 217, 2, 'com_modules.module.96', 'Students', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(144, 18, 218, 219, 2, 'com_modules.module.97', 'Grades', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(145, 18, 220, 221, 2, 'com_modules.module.98', 'Sponsors', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(146, 18, 222, 223, 2, 'com_modules.module.99', 'Features UIkit', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(147, 18, 224, 225, 2, 'com_modules.module.100', 'Social Icons', ''),
(148, 18, 226, 227, 2, 'com_modules.module.101', 'Home features', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(149, 18, 228, 229, 2, 'com_modules.module.102', 'Logo small', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(150, 27, 45, 46, 3, 'com_content.article.13', 'Widgetkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(151, 32, 65, 66, 3, 'com_content.article.24', 'UIkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(152, 1, 484, 485, 1, '#__ucm_content.7', '#__ucm_content.7', '[]'),
(153, 32, 67, 68, 3, 'com_content.article.25', 'Pagekit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(154, 1, 486, 487, 1, '#__ucm_content.8', '#__ucm_content.8', '[]'),
(155, 32, 69, 70, 3, 'com_content.article.23', 'Widgetkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(156, 32, 71, 72, 3, 'com_content.article.26', 'Free Halloween Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(157, 1, 488, 489, 1, '#__ucm_content.9', '#__ucm_content.9', '[]'),
(158, 1, 490, 491, 1, 'com_chronoforms5', 'com_chronoforms5', '{}'),
(159, 27, 47, 48, 3, 'com_content.article.27', 'Blank', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(160, 18, 94, 95, 2, 'com_modules.module.103', 'Reports', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_associations`
--

DROP TABLE IF EXISTS `ek5d2_associations`;
CREATE TABLE IF NOT EXISTS `ek5d2_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_banner_clients`
--

DROP TABLE IF EXISTS `ek5d2_banner_clients`;
CREATE TABLE IF NOT EXISTS `ek5d2_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_banner_tracks`
--

DROP TABLE IF EXISTS `ek5d2_banner_tracks`;
CREATE TABLE IF NOT EXISTS `ek5d2_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_banners`
--

DROP TABLE IF EXISTS `ek5d2_banners`;
CREATE TABLE IF NOT EXISTS `ek5d2_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_categories`
--

DROP TABLE IF EXISTS `ek5d2_categories`;
CREATE TABLE IF NOT EXISTS `ek5d2_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned DEFAULT NULL,
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ek5d2_categories`
--

INSERT INTO `ek5d2_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 17, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 37, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 37, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 5, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 37, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 37, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 37, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 37, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'blog', 'com_content', 'Blog', 'blog', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 37, '2011-05-02 11:42:21', 0, '0000-00-00 00:00:00', 170, '*', 1),
(8, 56, 1, 13, 14, 1, 'contacts', 'com_contact', 'Contacts', 'contacts', '', '', 1, 42, '2012-01-23 15:30:29', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 37, '2011-11-18 16:32:10', 42, '2011-11-18 16:32:13', 0, '*', 1),
(9, 57, 1, 15, 16, 1, 'yootheme-links', 'com_weblinks', 'YOOtheme Links', 'yootheme-links', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 37, '2012-01-22 12:45:00', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_chronoengine_chronoforms`
--

DROP TABLE IF EXISTS `ek5d2_chronoengine_chronoforms`;
CREATE TABLE IF NOT EXISTS `ek5d2_chronoengine_chronoforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `extras` longtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `app` varchar(255) NOT NULL DEFAULT '',
  `form_type` int(1) NOT NULL DEFAULT '1',
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `ek5d2_chronoengine_chronoforms`
--

INSERT INTO `ek5d2_chronoengine_chronoforms` (`id`, `title`, `params`, `extras`, `published`, `app`, `form_type`, `content`) VALUES
(1, 'studentForm', '{"description":"Details of each student.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTo0OntzOjY6ImZpZWxkcyI7YToxMTp7aToxO2E6MTg6e3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjI6ImlkIjtzOjQ6Im5hbWUiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo5OiJGdWxsIG5hbWUiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjE6IjEiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aToxMTthOjE4OntzOjQ6Im5hbWUiO3M6MTE6ImRhdGVPZkJpcnRoIjtzOjI6ImlkIjtzOjExOiJkYXRlT2ZCaXJ0aCI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEzOiJEYXRlIG9mIEJpcnRoIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czoyMjoiJ2FsaWFzJyA6ICdkZC9tbS95eXl5JyI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjM7YToyMDp7czo0OiJuYW1lIjtzOjM6InNleCI7czoyOiJpZCI7czozOiJzZXgiO3M6Nzoib3B0aW9ucyI7czoyNDoiRmVtYWxlPUZlbWFsZQ0KTWFsZT1NYWxlIjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czozOiJTZXgiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjg6Im11bHRpcGxlIjtzOjE6IjAiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6ODoiZHJvcGRvd24iO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjM6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO31zOjEyOiJkeW5hbWljX2RhdGEiO2E6NDp7czo3OiJlbmFibGVkIjtzOjA6IiI7czo5OiJkYXRhX3BhdGgiO3M6MDoiIjtzOjk6InZhbHVlX2tleSI7czowOiIiO3M6ODoidGV4dF9rZXkiO3M6MDoiIjt9czo2OiJldmVudHMiO2E6MTp7aTowO2E6NTp7czo4OiJvcGVyYXRvciI7czoxOiI9IjtzOjU6InN0YXRlIjtzOjA6IiI7czo2OiJhY3Rpb24iO3M6MDoiIjtzOjY6InRhcmdldCI7czowOiIiO3M6Nzoib3B0aW9ucyI7czowOiIiO319fWk6OTthOjE4OntzOjQ6Im5hbWUiO3M6MTA6InN0dWRlbnRVaWQiO3M6MjoiaWQiO3M6MTA6InN0dWRlbnRVaWQiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMDoiU3R1ZGVudCBJRCI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjE6IjEiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjEwO2E6MTg6e3M6NDoibmFtZSI7czoxNToiYWRtaXNzaW9uTnVtYmVyIjtzOjI6ImlkIjtzOjE1OiJhZG1pc3Npb25OdW1iZXIiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiQWRtaXNzaW9uIE5vLiI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6ODthOjIwOntzOjQ6Im5hbWUiO3M6NToiY2xhc3MiO3M6MjoiaWQiO3M6NToiY2xhc3MiO3M6Nzoib3B0aW9ucyI7czo3NDoiMT1JDQoyPUlJDQozPUlJSQ0KND1JVg0KNT1WDQo2PVZJDQo3PVZJSQ0KOD1WSUlJDQo5PUlYDQoxMD1YDQoxMT1HcmFkdWF0ZWQiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEzOiJDdXJyZW50IENsYXNzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjc7YToyMDp7czo0OiJuYW1lIjtzOjU6Imdyb3VwIjtzOjI6ImlkIjtzOjU6Imdyb3VwIjtzOjc6Im9wdGlvbnMiO3M6NTY6IkF6YWQ9QXphZA0KQmhhZ2F0aD1CaGFnYXRoDQpTdWJoYXNoPVN1Ymhhc2gNClZpdmVrPVZpdmVrIjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo1OiJHcm91cCI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aTo0O2E6MTg6e3M6NDoibmFtZSI7czo2OiJwYXJlbnQiO3M6MjoiaWQiO3M6NjoicGFyZW50IjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTM6IlBhcmVudCdzIE5hbWUiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MToiMSI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjU7YToxODp7czo0OiJuYW1lIjtzOjg6Imd1YXJkaWFuIjtzOjI6ImlkIjtzOjg6Imd1YXJkaWFuIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTU6Ikd1YXJkaWFuJ3MgTmFtZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czoxOiIxIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MTM7YToxMzp7czo0OiJuYW1lIjtzOjU6InBob3RvIjtzOjI6ImlkIjtzOjU6InBob3RvIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMjoiVXBsb2FkIFBob3RvIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJmaWxlIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJpbWFnZSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjEyO2E6MTA6e3M6MTE6InJlbmRlcl90eXBlIjtzOjY6InN1Ym1pdCI7czo0OiJuYW1lIjtzOjEzOiJzdHVkZW50U3VibWl0IjtzOjI6ImlkIjtzOjEzOiJzdHVkZW50U3VibWl0IjtzOjQ6InR5cGUiO3M6Njoic3VibWl0IjtzOjU6InZhbHVlIjtzOjQ6IlNhdmUiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO319czoxNDoiYWN0aW9uc19jb25maWciO2E6NTp7aToxMDthOjk6e3M6NzoiZW5hYmxlZCI7czoxOiIxIjtzOjk6InRhYmxlbmFtZSI7czoxNzoiZWs1ZDJfc3R1ZGVudGZvcm0iO3M6MTA6Im11bHRpX3JlYWQiO3M6MToiMCI7czoxODoibG9hZF91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6ODoibW9kZWxfaWQiO3M6NDoiRGF0YSI7czo2OiJmaWVsZHMiO3M6MDoiIjtzOjU6Im9yZGVyIjtzOjA6IiI7czo1OiJncm91cCI7czowOiIiO3M6MTA6ImNvbmRpdGlvbnMiO3M6MTIxOiI8P3BocA0KICByZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICByZXR1cm4gc2hvd1N0dWRlbnRGb3JtVGl0bGUoKTsNCj8+Ijt9aTowO2E6OTp7czo0OiJwYWdlIjtzOjE6IjEiO3M6MTI6InN1Ym1pdF9ldmVudCI7czo2OiJzdWJtaXQiO3M6MTE6ImZvcm1fbWV0aG9kIjtzOjQ6ImZpbGUiO3M6MTA6ImFjdGlvbl91cmwiO3M6MDoiIjtzOjEwOiJmb3JtX2NsYXNzIjtzOjEwOiJjaHJvbm9mb3JtIjtzOjE1OiJmb3JtX3RhZ19hdHRhY2giO3M6MDoiIjtzOjI0OiJyZXF1aXJlZF9sYWJlbHNfaWRlbnRpZnkiO3M6MToiMSI7czoxMjoicmVsYXRpdmVfdXJsIjtzOjE6IjEiO3M6MTE6ImFqYXhfc3VibWl0IjtzOjE6IjAiO31pOjQ7YTo1OntzOjc6ImVuYWJsZWQiO3M6MToiMSI7czo5OiJ0YWJsZW5hbWUiO3M6MTc6ImVrNWQyX3N0dWRlbnRmb3JtIjtzOjE4OiJzYXZlX3VuZGVyX21vZGVsaWQiO3M6MToiMCI7czoxMDoibXVsdGlfc2F2ZSI7czoxOiIwIjtzOjg6Im1vZGVsX2lkIjtzOjQ6IkRhdGEiO31pOjY7YTo5OntzOjc6ImVuYWJsZWQiO3M6MToiMSI7czo1OiJmaWxlcyI7czoxNzoicGhvdG86anBnLXBuZy1naWYiO3M6MTE6InVwbG9hZF9wYXRoIjtzOjA6IiI7czo4OiJtYXhfc2l6ZSI7czozOiIyMDAiO3M6ODoibWluX3NpemUiO3M6MToiMCI7czo5OiJtYXhfZXJyb3IiO3M6NTc6IlNvcnJ5LCBZb3VyIHVwbG9hZGVkIGZpbGUgc2l6ZSBleGNlZWRzIHRoZSBhbGxvd2VkIGxpbWl0LiI7czo5OiJtaW5fZXJyb3IiO3M6NjI6IlNvcnJ5LCBZb3VyIHVwbG9hZGVkIGZpbGUgc2l6ZSBpcyBsZXNzIHRoYW4gdGhlIG1pbmltdW0gbGltaXQuIjtzOjEwOiJ0eXBlX2Vycm9yIjtzOjQ2OiJTb3JyeSwgWW91ciB1cGxvYWRlZCBmaWxlIHR5cGUgaXMgbm90IGFsbG93ZWQuIjtzOjIwOiJleHRlbnNpb25zX3NlcGFyYXRvciI7czoxOiItIjt9aToyO2E6MTp7czo3OiJjb250ZW50IjtzOjExNzoiPD9waHANCnJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UgLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KbXNnUG9zdEZvcm1TdWJtaXQoJ3N0dWRlbnQnKTsNCj8+Ijt9fXM6MzoiRE5BIjthOjI6e3M6NDoibG9hZCI7YToyOntzOjEwOiJkYl9yZWFkXzEwIjtzOjA6IiI7czo2OiJodG1sXzAiO3M6MDoiIjt9czo2OiJzdWJtaXQiO2E6Mzp7czo5OiJkYl9zYXZlXzQiO3M6MDoiIjtzOjEzOiJmaWxlX3VwbG9hZF82IjthOjI6e3M6Nzoic3VjY2VzcyI7czowOiIiO3M6NDoiZmFpbCI7czowOiIiO31zOjEzOiJjdXN0b21fY29kZV8yIjtzOjA6IiI7fX1zOjE0OiJkYl9maWVsZHNfbGlzdCI7YToxOntzOjE3OiJlazVkMl9zdHVkZW50Zm9ybSI7czowOiIiO319', 1, '', 1, '<div class="form-group gcore-form-row" id="form-row-2"><label for="name" class="control-label gcore-label-left">Full name</label>\n<div class="gcore-input gcore-display-table" id="fin-name"><input name="name" id="name" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-4"><label for="dateOfBirth" class="control-label gcore-label-left">Date of Birth</label>\n<div class="gcore-input gcore-display-table" id="fin-dateOfBirth"><input name="dateOfBirth" id="dateOfBirth" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;] form-control A" title="" style="" data-inputmask="&#039;alias&#039; : &#039;dd/mm/yyyy&#039;" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-5"><label for="sex" class="control-label gcore-label-left">Sex</label>\n<div class="gcore-input gcore-display-table" id="fin-sex"><select name="sex" id="sex" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Female">Female</option>\n<option value="Male">Male</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-7"><label for="studentUid" class="control-label gcore-label-left">Student ID</label>\n<div class="gcore-input gcore-display-table" id="fin-studentUid"><input name="studentUid" id="studentUid" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alphanum&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-9"><label for="admissionNumber" class="control-label gcore-label-left">Admission No.</label>\n<div class="gcore-input gcore-display-table" id="fin-admissionNumber"><input name="admissionNumber" id="admissionNumber" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-10"><label for="class" class="control-label gcore-label-left">Current Class</label>\n<div class="gcore-input gcore-display-table" id="fin-class"><select name="class" id="class" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="1">I</option>\n<option value="2">II</option>\n<option value="3">III</option>\n<option value="4">IV</option>\n<option value="5">V</option>\n<option value="6">VI</option>\n<option value="7">VII</option>\n<option value="8">VIII</option>\n<option value="9">IX</option>\n<option value="10">X</option>\n<option value="11">Graduated</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-11"><label for="group" class="control-label gcore-label-left">Group</label>\n<div class="gcore-input gcore-display-table" id="fin-group"><select name="group" id="group" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Azad">Azad</option>\n<option value="Bhagath">Bhagath</option>\n<option value="Subhash">Subhash</option>\n<option value="Vivek">Vivek</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-13"><label for="parent" class="control-label gcore-label-left">Parent''s Name</label>\n<div class="gcore-input gcore-display-table" id="fin-parent"><input name="parent" id="parent" value="" placeholder="" maxlength="" size="" class="validate[&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-15"><label for="guardian" class="control-label gcore-label-left">Guardian''s Name</label>\n<div class="gcore-input gcore-display-table" id="fin-guardian"><input name="guardian" id="guardian" value="" placeholder="" maxlength="" size="" class="validate[&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-16"><label for="photo" class="control-label gcore-label-left">Upload Photo</label>\n<div class="gcore-input gcore-display-table" id="fin-photo"><input name="photo" id="photo" class="form-control gcore-height-auto A" title="" style="" data-load-state="" data-tooltip="" type="file" /></div></div><div class="form-group gcore-form-row" id="form-row-17"><div class="gcore-input gcore-display-table" id="fin-studentSubmit"><input name="studentSubmit" id="studentSubmit" type="submit" value="Save" class="form-control A" style="" data-load-state="" /></div></div>'),
(2, 'gradesForm', '{"description":"Student grades from a particular exam captured in a single record for all subjects.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTo0OntzOjY6ImZpZWxkcyI7YToxNzp7aToyMTthOjIwOntzOjQ6Im5hbWUiO3M6NToiY2xhc3MiO3M6MjoiaWQiO3M6NToiY2xhc3MiO3M6Nzoib3B0aW9ucyI7czo2MDoiMT1JDQoyPUlJDQozPUlJSQ0KND1JVg0KNT1WDQo2PVZJDQo3PVZJSQ0KOD1WSUlJDQo5PUlYDQoxMD1YIjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiQ3VycmVudCBDbGFzcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToyMjthOjIwOntzOjQ6Im5hbWUiO3M6MTE6InN0dWRlbnROYW1lIjtzOjI6ImlkIjtzOjExOiJzdHVkZW50TmFtZSI7czo3OiJvcHRpb25zIjtzOjA6IiI7czo1OiJlbXB0eSI7czowOiIiO3M6NjoidmFsdWVzIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTI6IlN0dWRlbnQgTmFtZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToyMzthOjc6e3M6NDoibmFtZSI7czo5OiJzdHVkZW50SWQiO3M6MjoiaWQiO3M6OToic3R1ZGVudElkIjtzOjU6InZhbHVlIjtzOjI6Ii0xIjtzOjU6ImxhYmVsIjtzOjEwOiJTdHVkZW50IElEIjtzOjY6InBhcmFtcyI7czowOiIiO3M6NDoidHlwZSI7czo2OiJoaWRkZW4iO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjt9aToxOTthOjIwOntzOjQ6Im5hbWUiO3M6NDoieWVhciI7czoyOiJpZCI7czo0OiJ5ZWFyIjtzOjc6Im9wdGlvbnMiO3M6MzI6IjIwMTQtMTU9MjAxNC0xNQ0KMjAxMy0xND0yMDEzLTE0IjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MTU6IjIwMTQtMTU9MjAxNC0xNSI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6NDoiWWVhciI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToxNzthOjIwOntzOjQ6Im5hbWUiO3M6ODoiZXhhbVR5cGUiO3M6MjoiaWQiO3M6ODoiZXhhbVR5cGUiO3M6Nzoib3B0aW9ucyI7czoyNDQ6IlRlc3QgMSAoMjUgbWFya3MpPVRlc3QgMSAoMjUgbWFya3MpDQpUZXN0IDIgKDI1IG1hcmtzKT1UZXN0IDIgKDI1IG1hcmtzKQ0KTWlkdGVybSBFeGFtICgxMDAgbWFya3MpPU1pZHRlcm0gRXhhbSAoMTAwIG1hcmtzKQ0KVGVzdCAzICgyNSBtYXJrcyk9VGVzdCAzICgyNSBtYXJrcykNClRlc3QgNCAoMjUgbWFya3MpPVRlc3QgNCAoMjUgbWFya3MpDQpGaW5hbCBFeGFtICgxMDAgbWFya3MpPUZpbmFsIEV4YW0gKDEwMCBtYXJrcykiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEwOiJBc3Nlc3NtZW50IjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjI7YToxODp7czo0OiJuYW1lIjtzOjEyOiJrYW5uYWRhTWFya3MiO3M6MjoiaWQiO3M6MTI6Imthbm5hZGFNYXJrcyI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEzOiJLYW5uYWRhIE1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MToiMSI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTozO2E6MTg6e3M6NDoibmFtZSI7czoxMjoiZW5nbGlzaE1hcmtzIjtzOjI6ImlkIjtzOjEyOiJlbmdsaXNoTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiRW5nbGlzaCBNYXJrcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czowOiIiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjE6IjEiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6NDthOjE4OntzOjQ6Im5hbWUiO3M6MTA6ImhpbmRpTWFya3MiO3M6MjoiaWQiO3M6MTA6ImhpbmRpTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMToiSGluZGkgTWFya3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czoxOiIxIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjU7YToxODp7czo0OiJuYW1lIjtzOjk6Im1hdGhNYXJrcyI7czoyOiJpZCI7czo5OiJtYXRoTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxNzoiTWF0aGVtYXRpY3MgTWFya3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czoxOiIxIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjY7YToxODp7czo0OiJuYW1lIjtzOjE5OiJnZW5lcmFsU2NpZW5jZU1hcmtzIjtzOjI6ImlkIjtzOjE5OiJnZW5lcmFsU2NpZW5jZU1hcmtzIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MjE6IkdlbmVyYWwgU2NpZW5jZSBNYXJrcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czowOiIiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjE6IjEiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6NzthOjE4OntzOjQ6Im5hbWUiO3M6MTg6InNvY2lhbFN0dWRpZXNNYXJrcyI7czoyOiJpZCI7czoxODoic29jaWFsU3R1ZGllc01hcmtzIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MjA6IlNvY2lhbCBTdHVkaWVzIE1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MToiMSI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aToxMDthOjE4OntzOjQ6Im5hbWUiO3M6MjA6ImNvbXB1dGVyU2NpZW5jZU1hcmtzIjtzOjI6ImlkIjtzOjIwOiJjb21wdXRlclNjaWVuY2VNYXJrcyI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjIyOiJDb21wdXRlciBTY2llbmNlIE1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czoyOiIzNyI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MTU7YToyMDp7czo0OiJuYW1lIjtzOjE3OiJwaHlzaWNhbEVkdWNhdGlvbiI7czoyOiJpZCI7czoxNzoicGh5c2ljYWxFZHVjYXRpb24iO3M6Nzoib3B0aW9ucyI7czo2NToiRXhjZWxsZW50PUV4Y2VsbGVudA0KR29vZD1Hb29kDQpOZWVkcyB0byBpbXByb3ZlPU5lZWRzIHRvIGltcHJvdmUiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czo0OiJHb29kIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxODoiUGh5c2ljYWwgRWR1Y2F0aW9uIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjI0O2E6MjA6e3M6NDoibmFtZSI7czo3OiJjb25kdWN0IjtzOjI6ImlkIjtzOjc6ImNvbmR1Y3QiO3M6Nzoib3B0aW9ucyI7czo2NToiRXhjZWxsZW50PUV4Y2VsbGVudA0KR29vZD1Hb29kDQpOZWVkcyB0byBpbXByb3ZlPU5lZWRzIHRvIGltcHJvdmUiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czo0OiJHb29kIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo3OiJDb25kdWN0IjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjEzO2E6MTg6e3M6NDoibmFtZSI7czoxMDoiYXR0ZW5kYW5jZSI7czoyOiJpZCI7czoxMDoiYXR0ZW5kYW5jZSI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEwOiJBdHRlbmRhbmNlIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czoyOiIzNyI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czo4OToiRW50ZXIgYXR0ZW5kZWQgZGF5cyBhbmQgdG90YWwgZGF5cy4gRXhhbXBsZSwgMjQvMzAgaWYgc3R1ZGVudCBhdHRlbmRlZCAyNCBkYXlzIG91dCBvZiAzMC4iO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MTY7YToxODp7czo0OiJuYW1lIjtzOjc6InJlbWFya3MiO3M6MjoiaWQiO3M6NzoicmVtYXJrcyI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjc6IlJlbWFya3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6NDoicm93cyI7czoxOiIzIjtzOjQ6ImNvbHMiO3M6MjoiMzQiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTM6IjpkYXRhLXd5c2l3eWciO3M6MToiMCI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJ0ZXh0YXJlYSI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6ODp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MTthOjEwOntzOjExOiJyZW5kZXJfdHlwZSI7czo2OiJzdWJtaXQiO3M6NDoibmFtZSI7czoxMjoiZ3JhZGVzU3VibWl0IjtzOjI6ImlkIjtzOjEyOiJncmFkZXNTdWJtaXQiO3M6NDoidHlwZSI7czo2OiJzdWJtaXQiO3M6NToidmFsdWUiO3M6NDoiU2F2ZSI7czo1OiJjbGFzcyI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7fX1zOjE0OiJhY3Rpb25zX2NvbmZpZyI7YTo3OntpOjEyO2E6MTp7czo3OiJjb250ZW50IjtzOjExOToiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcHJpbnRDdXN0b21Db2RlR3JhZGVzRm9ybSgpOw0KPz4iO31pOjEzO2E6OTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6OToidGFibGVuYW1lIjtzOjE2OiJlazVkMl9ncmFkZXNmb3JtIjtzOjEwOiJtdWx0aV9yZWFkIjtzOjE6IjAiO3M6MTg6ImxvYWRfdW5kZXJfbW9kZWxpZCI7czoxOiIwIjtzOjg6Im1vZGVsX2lkIjtzOjQ6IkRhdGEiO3M6NjoiZmllbGRzIjtzOjA6IiI7czo1OiJvcmRlciI7czowOiIiO3M6NToiZ3JvdXAiO3M6MDoiIjtzOjEwOiJjb25kaXRpb25zIjtzOjEyMDoiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcmV0dXJuIHNob3dHcmFkZXNGb3JtVGl0bGUoKTsNCj8+Ijt9aToxNDthOjk6e3M6NDoicGFnZSI7czoxOiIxIjtzOjEyOiJzdWJtaXRfZXZlbnQiO3M6Njoic3VibWl0IjtzOjExOiJmb3JtX21ldGhvZCI7czo0OiJwb3N0IjtzOjEwOiJhY3Rpb25fdXJsIjtzOjA6IiI7czoxMDoiZm9ybV9jbGFzcyI7czoxMDoiY2hyb25vZm9ybSI7czoxNToiZm9ybV90YWdfYXR0YWNoIjtzOjA6IiI7czoyNDoicmVxdWlyZWRfbGFiZWxzX2lkZW50aWZ5IjtzOjE6IjEiO3M6MTI6InJlbGF0aXZlX3VybCI7czoxOiIxIjtzOjExOiJhamF4X3N1Ym1pdCI7czoxOiIwIjt9aToxMTthOjI6e3M6NjoiZXZlbnRzIjtzOjEyOiJzdWNjZXNzLGZhaWwiO3M6NzoiY29udGVudCI7czoxMjI6Ijw/cGhwDQogIHJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UuRFMuJ3RlbXBsYXRlcycuRFMuJ3lvb19tYXN0ZXIyJy5EUy4nYmdtcy5waHAnICk7DQogIHJldHVybiBpc0dyYWRlc0Zvcm1Ub0JlU2hvd24oKTsNCj8+Ijt9aTo4O2E6NTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6OToidGFibGVuYW1lIjtzOjE2OiJlazVkMl9ncmFkZXNmb3JtIjtzOjE4OiJzYXZlX3VuZGVyX21vZGVsaWQiO3M6MToiMCI7czoxMDoibXVsdGlfc2F2ZSI7czoxOiIwIjtzOjg6Im1vZGVsX2lkIjtzOjQ6IkRhdGEiO31pOjEwO2E6MTp7czo3OiJjb250ZW50IjtzOjEyMDoiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRSAuRFMuJ3RlbXBsYXRlcycuRFMuJ3lvb19tYXN0ZXIyJy5EUy4nYmdtcy5waHAnICk7DQogIG1zZ1Bvc3RGb3JtU3VibWl0KCdncmFkZXMnKTsNCj8+Ijt9aTo3O2E6Mjp7czo2OiJldmVudHMiO3M6MTI6InN1Y2Nlc3MsZmFpbCI7czo3OiJjb250ZW50IjtzOjEyNDoiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcmV0dXJuIHZhbGlkYXRlR3JhZGVzRm9ybSgkZm9ybSk7DQo/PiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxNzoiZXZlbnRfc3dpdGNoZXJfMTEiO2E6Mjp7czo3OiJzdWNjZXNzIjthOjM6e3M6MTQ6ImN1c3RvbV9jb2RlXzEyIjtzOjA6IiI7czoxMDoiZGJfcmVhZF8xMyI7czowOiIiO3M6NzoiaHRtbF8xNCI7czowOiIiO31zOjQ6ImZhaWwiO3M6MDoiIjt9fXM6Njoic3VibWl0IjthOjE6e3M6MTY6ImV2ZW50X3N3aXRjaGVyXzciO2E6Mjp7czo3OiJzdWNjZXNzIjthOjI6e3M6OToiZGJfc2F2ZV84IjtzOjA6IiI7czoxNDoiY3VzdG9tX2NvZGVfMTAiO3M6MDoiIjt9czo0OiJmYWlsIjtzOjA6IiI7fX19czoxNDoiZGJfZmllbGRzX2xpc3QiO2E6MTp7czoxNjoiZWs1ZDJfZ3JhZGVzZm9ybSI7czowOiIiO319', 1, '', 1, '<div class="form-group gcore-form-row" id="form-row-1"><label for="class" class="control-label gcore-label-left">Current Class</label>\n<div class="gcore-input gcore-display-table" id="fin-class"><select name="class" id="class" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="1">I</option>\n<option value="2">II</option>\n<option value="3">III</option>\n<option value="4">IV</option>\n<option value="5">V</option>\n<option value="6">VI</option>\n<option value="7">VII</option>\n<option value="8">VIII</option>\n<option value="9">IX</option>\n<option value="10">X</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-2"><label for="studentName" class="control-label gcore-label-left">Student Name</label>\n<div class="gcore-input gcore-display-table" id="fin-studentName"><select name="studentName" id="studentName" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n</select></div></div><input name="studentId" id="studentId" value="-1" type="hidden" class="form-control A" /><div class="form-group gcore-form-row" id="form-row-3"><label for="year" class="control-label gcore-label-left">Year</label>\n<div class="gcore-input gcore-display-table" id="fin-year"><select name="year" id="year" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="2014-15">2014-15</option>\n<option value="2013-14">2013-14</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-4"><label for="examType" class="control-label gcore-label-left">Assessment</label>\n<div class="gcore-input gcore-display-table" id="fin-examType"><select name="examType" id="examType" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Test 1 (25 marks)">Test 1 (25 marks)</option>\n<option value="Test 2 (25 marks)">Test 2 (25 marks)</option>\n<option value="Midterm Exam (100 marks)">Midterm Exam (100 marks)</option>\n<option value="Test 3 (25 marks)">Test 3 (25 marks)</option>\n<option value="Test 4 (25 marks)">Test 4 (25 marks)</option>\n<option value="Final Exam (100 marks)">Final Exam (100 marks)</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-6"><label for="kannadaMarks" class="control-label gcore-label-left">Kannada Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-kannadaMarks"><input name="kannadaMarks" id="kannadaMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-8"><label for="englishMarks" class="control-label gcore-label-left">English Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-englishMarks"><input name="englishMarks" id="englishMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-10"><label for="hindiMarks" class="control-label gcore-label-left">Hindi Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-hindiMarks"><input name="hindiMarks" id="hindiMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-12"><label for="mathMarks" class="control-label gcore-label-left">Mathematics Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-mathMarks"><input name="mathMarks" id="mathMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-14"><label for="generalScienceMarks" class="control-label gcore-label-left">General Science Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-generalScienceMarks"><input name="generalScienceMarks" id="generalScienceMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-16"><label for="socialStudiesMarks" class="control-label gcore-label-left">Social Studies Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-socialStudiesMarks"><input name="socialStudiesMarks" id="socialStudiesMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-18"><label for="computerScienceMarks" class="control-label gcore-label-left">Computer Science Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-computerScienceMarks"><input name="computerScienceMarks" id="computerScienceMarks" value="" placeholder="" maxlength="" size="37" class="form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-19"><label for="physicalEducation" class="control-label gcore-label-left">Physical Education</label>\n<div class="gcore-input gcore-display-table" id="fin-physicalEducation"><select name="physicalEducation" id="physicalEducation" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Excellent">Excellent</option>\n<option value="Good" selected="selected">Good</option>\n<option value="Needs to improve">Needs to improve</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-20"><label for="conduct" class="control-label gcore-label-left">Conduct</label>\n<div class="gcore-input gcore-display-table" id="fin-conduct"><select name="conduct" id="conduct" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Excellent">Excellent</option>\n<option value="Good" selected="selected">Good</option>\n<option value="Needs to improve">Needs to improve</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-22"><label for="attendance" class="control-label gcore-label-left">Attendance</label>\n<div class="gcore-input gcore-display-table" id="fin-attendance"><input name="attendance" id="attendance" value="" placeholder="" maxlength="" size="37" class="form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="Enter attended days and total days. Example, 24/30 if student attended 24 days out of 30." type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-23"><label for="remarks" class="control-label gcore-label-left">Remarks</label>\n<div class="gcore-input gcore-display-table" id="fin-remarks"><textarea name="remarks" id="remarks" placeholder="" rows="3" cols="34" class="form-control A" title="" style="" data-wysiwyg="0" data-load-state="" data-tooltip=""></textarea></div></div><div class="form-group gcore-form-row" id="form-row-24"><div class="gcore-input gcore-display-table" id="fin-gradesSubmit"><input name="gradesSubmit" id="gradesSubmit" type="submit" value="Save" class="form-control A" style="" data-load-state="" /></div></div>'),
(3, 'studentList', '{"description":"Show a list of students.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjEwOToiPD9waHAgDQpyZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFIC5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCnNob3dTdHVkZW50TGlzdCgpOw0KPz4NCiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxMzoiY3VzdG9tX2NvZGVfMCI7czowOiIiO31zOjY6InN1Ym1pdCI7czowOiIiO319', 1, '', 1, ''),
(4, 'gradesList', '{"description":"Show recent grades of all students.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjExMjoiPD9waHAgDQogIHJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UgLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICBzaG93R3JhZGVzTGlzdCgpOw0KPz4NCiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxMzoiY3VzdG9tX2NvZGVfMCI7czowOiIiO31zOjY6InN1Ym1pdCI7czowOiIiO319', 1, '', 1, ''),
(5, 'reports', '{"description":"Show recent grades of all students.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjE0MjoiPD9waHAgDQogIHJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UgLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICBzaG93UmVwb3J0cygpOw0KICBwcmludEN1c3RvbUNvZGVSZXBvcnRzRm9ybSgpOw0KPz4NCiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxMzoiY3VzdG9tX2NvZGVfMCI7czowOiIiO31zOjY6InN1Ym1pdCI7czowOiIiO319', 1, '', 1, '');
INSERT INTO `ek5d2_chronoengine_chronoforms` (`id`, `title`, `params`, `extras`, `published`, `app`, `form_type`, `content`) VALUES
(6, 'sponsorForm', '{"description":"Details of each sponsor.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTo0OntzOjY6ImZpZWxkcyI7YTo1OntpOjE7YToxODp7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6MjoiaWQiO3M6NDoibmFtZSI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjk6IkZ1bGwgbmFtZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MToiMSI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjk7YToxODp7czo0OiJuYW1lIjtzOjEwOiJzcG9uc29yVWlkIjtzOjI6ImlkIjtzOjEwOiJzcG9uc29yVWlkIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTA6IlNwb25zb3IgSUQiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czoxOiIxIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTo4O2E6MjA6e3M6NDoibmFtZSI7czoxNToic3BvbnNvcmVkVmFsdWVzIjtzOjI6ImlkIjtzOjE1OiJzcG9uc29yZWRWYWx1ZXMiO3M6Nzoib3B0aW9ucyI7czowOiIiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjExMzoiU3BvbnNvcmVkIFN0dWRlbnRzIChBbHdheXMgdXNlICBDdHJsK0NsaWNrIHRvIHNlbGVjdCBtdWx0aXBsZSBzdHVkZW50cyBhbmQgcHJlc2VydmUgcHJldmlvdXNseSBzYXZlZCBzZWxlY3Rpb25zLikiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjg6Im11bHRpcGxlIjtzOjE6IjEiO3M6NDoic2l6ZSI7czoyOiIxNSI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czo2MToiU3R1ZGVudHMgd2hvIGFscmVhZHkgaGF2ZSB0aHJlZSBzcG9uc29ycyBhcmUgbm90IGxpc3RlZCBoZXJlLiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjEzO2E6Nzp7czo0OiJuYW1lIjtzOjE3OiJzcG9uc29yZWRTdHVkZW50cyI7czoyOiJpZCI7czoxNzoic3BvbnNvcmVkU3R1ZGVudHMiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjtzOjI3OiJTcG9uc29yZWQgU3R1ZGVudHMgKEhpZGRlbikiO3M6NjoicGFyYW1zIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjY6ImhpZGRlbiI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO31pOjEyO2E6MTA6e3M6MTE6InJlbmRlcl90eXBlIjtzOjY6InN1Ym1pdCI7czo0OiJuYW1lIjtzOjEzOiJzcG9uc29yU3VibWl0IjtzOjI6ImlkIjtzOjEzOiJzcG9uc29yU3VibWl0IjtzOjQ6InR5cGUiO3M6Njoic3VibWl0IjtzOjU6InZhbHVlIjtzOjQ6IlNhdmUiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO319czoxNDoiYWN0aW9uc19jb25maWciO2E6NTp7aToxMDthOjk6e3M6NzoiZW5hYmxlZCI7czoxOiIxIjtzOjk6InRhYmxlbmFtZSI7czoxNzoiZWs1ZDJfc3BvbnNvcmZvcm0iO3M6MTA6Im11bHRpX3JlYWQiO3M6MToiMCI7czoxODoibG9hZF91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6ODoibW9kZWxfaWQiO3M6NDoiRGF0YSI7czo2OiJmaWVsZHMiO3M6MDoiIjtzOjU6Im9yZGVyIjtzOjA6IiI7czo1OiJncm91cCI7czowOiIiO3M6MTA6ImNvbmRpdGlvbnMiO3M6MTIxOiI8P3BocA0KICByZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICByZXR1cm4gc2hvd1Nwb25zb3JGb3JtVGl0bGUoKTsNCj8+Ijt9aTowO2E6OTp7czo0OiJwYWdlIjtzOjE6IjEiO3M6MTI6InN1Ym1pdF9ldmVudCI7czo2OiJzdWJtaXQiO3M6MTE6ImZvcm1fbWV0aG9kIjtzOjQ6InBvc3QiO3M6MTA6ImFjdGlvbl91cmwiO3M6MDoiIjtzOjEwOiJmb3JtX2NsYXNzIjtzOjEwOiJjaHJvbm9mb3JtIjtzOjE1OiJmb3JtX3RhZ19hdHRhY2giO3M6MDoiIjtzOjI0OiJyZXF1aXJlZF9sYWJlbHNfaWRlbnRpZnkiO3M6MToiMSI7czoxMjoicmVsYXRpdmVfdXJsIjtzOjE6IjEiO3M6MTE6ImFqYXhfc3VibWl0IjtzOjE6IjAiO31pOjExO2E6MTp7czo3OiJjb250ZW50IjtzOjEyMDoiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcHJpbnRDdXN0b21Db2RlU3BvbnNvckZvcm0oKTsNCj8+Ijt9aTo0O2E6NTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6OToidGFibGVuYW1lIjtzOjE3OiJlazVkMl9zcG9uc29yZm9ybSI7czoxODoic2F2ZV91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6MTA6Im11bHRpX3NhdmUiO3M6MToiMCI7czo4OiJtb2RlbF9pZCI7czo0OiJEYXRhIjt9aToyO2E6MTp7czo3OiJjb250ZW50IjtzOjExNzoiPD9waHANCnJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UgLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KbXNnUG9zdEZvcm1TdWJtaXQoJ3Nwb25zb3InKTsNCj8+Ijt9fXM6MzoiRE5BIjthOjI6e3M6NDoibG9hZCI7YTozOntzOjEwOiJkYl9yZWFkXzEwIjtzOjA6IiI7czo2OiJodG1sXzAiO3M6MDoiIjtzOjE0OiJjdXN0b21fY29kZV8xMSI7czowOiIiO31zOjY6InN1Ym1pdCI7YToyOntzOjk6ImRiX3NhdmVfNCI7czowOiIiO3M6MTM6ImN1c3RvbV9jb2RlXzIiO3M6MDoiIjt9fXM6MTQ6ImRiX2ZpZWxkc19saXN0IjthOjE6e3M6MTc6ImVrNWQyX3Nwb25zb3Jmb3JtIjtzOjA6IiI7fX0=', 1, '', 1, '<div class="form-group gcore-form-row" id="form-row-2"><label for="name" class="control-label gcore-label-left">Full name</label>\n<div class="gcore-input gcore-display-table" id="fin-name"><input name="name" id="name" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-4"><label for="sponsorUid" class="control-label gcore-label-left">Sponsor ID</label>\n<div class="gcore-input gcore-display-table" id="fin-sponsorUid"><input name="sponsorUid" id="sponsorUid" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alphanum&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-5"><label for="sponsoredValues" class="control-label gcore-label-left">Sponsored Students (Always use  Ctrl+Click to select multiple students and preserve previously saved selections.)</label>\n<div class="gcore-input gcore-display-table" id="fin-sponsoredValues"><select name="sponsoredValues" id="sponsoredValues" multiple="1" size="15" class="form-control A" title="" style="" data-load-state="" data-tooltip="Students who already have three sponsors are not listed here.">\n</select></div></div><input name="sponsoredStudents" id="sponsoredStudents" value="" type="hidden" class="form-control A" /><div class="form-group gcore-form-row" id="form-row-6"><div class="gcore-input gcore-display-table" id="fin-sponsorSubmit"><input name="sponsorSubmit" id="sponsorSubmit" type="submit" value="Save" class="form-control A" style="" data-load-state="" /></div></div>'),
(7, 'sponsorList', '{"description":"Show a list of sponsors.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjEwOToiPD9waHAgDQpyZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFIC5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCnNob3dTcG9uc29yTGlzdCgpOw0KPz4NCiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxMzoiY3VzdG9tX2NvZGVfMCI7czowOiIiO31zOjY6InN1Ym1pdCI7czowOiIiO319', 1, '', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_chronoengine_extensions`
--

DROP TABLE IF EXISTS `ek5d2_chronoengine_extensions`;
CREATE TABLE IF NOT EXISTS `ek5d2_chronoengine_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addon_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `ordering` int(4) NOT NULL,
  `settings` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_contact_details`
--

DROP TABLE IF EXISTS `ek5d2_contact_details`;
CREATE TABLE IF NOT EXISTS `ek5d2_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned DEFAULT NULL,
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ek5d2_contact_details`
--

INSERT INTO `ek5d2_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`, `sortname1`, `sortname2`, `sortname3`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `hits`) VALUES
(1, 'John Q. Public', 'john-q-public', 'Chief Information Officer', '1 Infinite Loop', 'Cupertino', 'California', 'USA', '95014', '1-212-555555-1', '1-212-555555-2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.', '', 'email@0.0.0.0', 0, 1, 0, '0000-00-00 00:00:00', 1, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 8, 1, '', '', '', '', '', '*', '2011-11-18 16:33:47', 37, '', '2012-01-23 15:36:01', 42, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
(2, 'Jane Q. Public', 'jane-q-public', 'Chief Information Officer', '1 Infinite Loop', 'Cupertino', 'California', 'USA', '95014', '1-212-555555-1', '1-212-555555-2', 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.', '', 'email@0.0.0.0', 0, 1, 0, '0000-00-00 00:00:00', 2, '{"show_contact_category":"","show_contact_list":"","presentation_style":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_profile":"","show_links":"","linka_name":"","linka":"","linkb_name":"","linkb":"","linkc_name":"","linkc":"","linkd_name":"","linkd":"","linke_name":"","linke":"","contact_layout":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":""}', 0, 8, 1, '', '', '', '', '', '*', '2011-11-18 16:35:05', 37, '', '2012-01-19 16:37:23', 42, '', '', '{"robots":"","rights":""}', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_content`
--

DROP TABLE IF EXISTS `ek5d2_content`;
CREATE TABLE IF NOT EXISTS `ek5d2_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `ek5d2_content`
--

INSERT INTO `ek5d2_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 33, 'Layouts', 'layouts', '<p>Warp comes with a sophisticated layout system to create any kind of sidebar or widget layout. You can easily manage the sidebar''s positions and widths in the theme administration. Widgets can have different styles and be placed in any position offered by this theme. Each position has its own layout. You can align widgets side-by-side, stack them or choose your own grid layout. Show or hide widgets on mobile devices, while the grid adapts perfectly to your layout.</p>\n\n<img src="images/yootheme/features_layouts.svg" width="560" height="320" alt="Warp Layout System" title="Warp Layout System" />', '', -2, 2, '2011-05-02 11:45:23', 37, '', '2013-06-25 15:34:27', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:45:23', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":null,"urlatext":"","targeta":"","urlb":null,"urlbtext":"","targetb":"","urlc":null,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 13, 10, '', '', 1, 448, '{"robots":"","author":"","rights":"","xreference":"","tags":null}', 0, '*', ''),
(2, 34, 'Icons', 'icons', '<p class="uk-article-lead">YOOtheme is a well-known template and extension provider for Joomla and WordPress who helps you to create professional websites. But to make your website or interface design a real eye-catcher there was one thing missing: Icons! Icons are an essential tool to simplify user interfaces and today almost every major website uses icons to highlight important parts in their content.</p>\n\n<ul class="uk-grid uk-grid-width-medium-1-2 uk-grid-width-large-1-3" data-uk-grid-margin>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-1''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_buildings.png" width="600" height="400" alt="Building Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">Building Icons</div>\n        </a>\n    </li>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-2''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_hosting.png" width="600" height="400" alt="Hosting Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">Hosting Icons</div>\n        </a>\n    </li>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-3''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_tools.png" width="600" height="400" alt="Tool Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">Tool Icons</div>\n        </a>\n    </li>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-4''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_shipping.png" width="600" height="400" alt="Shipping Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">Shipping Icons</div>\n        </a>\n    </li>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-5''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_ecommerce.png" width="600" height="400" alt="E-Commerce Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">E-Commerce Icons</div>\n        </a>\n    </li>\n    <li>\n        <a class="uk-thumbnail uk-overlay-toggle" data-uk-modal="{target:''#modal-6''}">\n            <div class="uk-overlay">\n                <img src="images/yootheme/icons_space.png" width="600" height="400" alt="Space Icons">\n                <div class="uk-overlay-area"></div>\n            </div>\n            <div class="uk-thumbnail-caption">Space Icons</div>\n        </a>\n    </li>\n</ul>\n\n<h2 class="uk-h3">Features</h2>\n\n<div class="uk-grid uk-grid-divider" data-uk-grid-margin>\n    <div class="uk-width-medium-1-3">\n       <div class="uk-grid">\n            <div class="uk-width-large-1-6 uk-vertical-align uk-text-center" style="height: 50px;">\n                <div class="uk-vertical-align-middle">\n                    <i class="uk-icon-paste uk-icon-medium uk-text-primary"></i>\n                </div>\n            </div>\n            <div class="uk-width-large-5-6 uk-text-center-small uk-text-center-medium">\n                <h3 class="uk-h4 uk-margin-bottom-remove">PNGs in 8 Sizes</h3>\n                <p class="uk-margin-top-remove">From 16x16 to 512x512 pixels. </p>\n            </div>\n        </div>\n    </div>\n\n    <div class="uk-width-medium-1-3">\n        <div class="uk-grid">\n            <div class="uk-width-large-1-6 uk-vertical-align uk-text-center" style="height: 50px;">\n                <div class="uk-vertical-align-middle">\n                    <i class="uk-icon-sort-amount-asc uk-icon-medium uk-text-primary"></i>\n                </div>\n            </div>\n            <div class="uk-width-large-5-6 uk-text-center-small uk-text-center-medium">\n                <h3 class="uk-h4 uk-margin-bottom-remove">Scalable vector sources</h3>\n                <p class="uk-margin-top-remove">Customizable PDF vector files.</p>\n            </div>\n        </div>\n    </div>\n\n    <div class="uk-width-medium-1-3">\n        <div class="uk-grid">\n            <div class="uk-width-large-1-6 uk-vertical-align uk-text-center" style="height: 50px;">\n                <div class="uk-vertical-align-middle">\n                    <i class="uk-icon-tint uk-icon-medium uk-text-primary"></i>\n                </div>\n            </div>\n            <div class="uk-width-large-5-6 uk-text-center-small uk-text-center-medium">\n                <h3 class="uk-h4 uk-margin-bottom-remove">Pixel perfect design</h3>\n                <p class="uk-margin-top-remove">Handcrafted every size.</p>\n            </div>\n        </div>\n    </div>\n\n    <div class="uk-width-medium-1-1">\n        <div class="uk-panel uk-panel-box uk-text-center">\n            <p><strong>YOOtheme Icons.</strong> Beautiful and handcrafted icons for web and print projects. <a class="uk-button uk-button-primary uk-margin-left" href="http://www.yootheme.com/icons" target="_blank">Visit Website</a></p>\n        </div>\n    </div>\n</div>\n\n<div id="modal-1" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_buildings.png" width="600" height="400" alt="Building Icons">\n    </div>\n</div>\n\n<div id="modal-2" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_hosting.png" width="600" height="400" alt="Hosting Icons">\n    </div>\n</div>\n\n<div id="modal-3" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_tools.png" width="600" height="400" alt="Tool Icons">\n    </div>\n</div>\n\n<div id="modal-4" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_shipping.png" width="600" height="400" alt="Shipping Icons">\n    </div>\n</div>\n\n<div id="modal-5" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_ecommerce.png" width="600" height="400" alt="E-Commerce Icons">\n    </div>\n</div>\n\n<div id="modal-6" class="uk-modal">\n    <div class="uk-modal-dialog uk-modal-dialog-frameless">\n        <a href="" class="uk-modal-close uk-close uk-close-alt"></a>\n        <img src="images/yootheme/icons_space.png" width="600" height="400" alt="Space Icons">\n    </div>\n</div>', '', -2, 2, '2011-05-02 11:47:01', 37, '', '2014-04-02 16:30:04', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:47:01', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 48, 11, '', '', 1, 285, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(3, 35, 'ZOO', 'zoo', '<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-2">\n        <p class="uk-article-lead">ZOO is a flexible and powerful content application builder to manage your content. It provides a much improved Joomla experience.</p>\n        <p>The key feature is the ability to create your very own custom content types. You define what a type is made up of - e.g. text, images or a file download. Any combination is imaginable! You bring the content, ZOO brings the elements to structure it and make it look good!</p>\n        <p><a class="uk-button" href="http://www.yootheme.com/zoo" target="_blank">Visit Website</a></p>\n    </div>\n\n    <div class="uk-width-medium-1-2 uk-text-center-small">\n        <a data-lightbox="width:852;height:480;autoplay:true;" href="http://www.yootheme.com/videos/zoo_video_tour.mp4">\n            <img src="images/yootheme/zoo_video_tour.png" width="500" height="300" alt="Take the video tour on the ZOO!" title="Take the video tour on the ZOO!">\n        </a>\n    </div>\n</div>\n\n<h2>Apps for every Purpose</h2>\n\n<p>ZOO moves from simply being a CCK to an Application Builder. Apps are extensions for ZOO which are optimized for different purposes and types of content catalogs. ZOO offers a wide range of apps to get you started right away. There is a blog, a product catalog, a cookbook, a business directory, a documentation, a download archive and a movie database app!</p>\n\n<h3>Joomla Integration</h3>\n\n<p>By now ZOO has developed a thriving ecosystem, with new ZOO extensions appearing regularly. It also integrates well with many popular Joomla extensions. Besides the ZOO component itself offers additional modules and plugins. They allow a seamless integration into Joomla and provide a richer tool set to create your website.</p>\n\n<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-1">\n        <div class="uk-panel uk-panel-box uk-text-center">\n            <p><strong>Get ZOO.</strong> A flexible and powerful content application builder to manage your content. <a class="uk-button uk-button-primary uk-margin-left" href="http://www.yootheme.com/zoo" target="_blank">Download ZOO</a></p>\n        </div>\n    </div>\n</div>', '', -2, 2, '2011-05-02 11:47:22', 37, '', '2014-04-04 11:27:40', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:47:22', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 12, '', '', 1, 164, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 36, 'UIkit', 'uikit', '        <div class="uk-grid">\n            <div class="uk-width-1-1" data-uk-margin>\n\n                <div class="uk-button-group">\n                    <button class="uk-button">Button</button>\n                    <div data-uk-dropdown="{mode:''click''}">\n                        <button class="uk-button"><i class="uk-icon-caret-down"></i></button>\n                        <div class="uk-dropdown uk-dropdown-width-2">\n\n                            <div class="uk-grid">\n\n                                <div class="uk-width-1-2">\n                                    <ul class="uk-nav uk-nav-dropdown uk-panel">\n                                        <li class="uk-nav-header">Header</li>\n                                        <li><a href="#">Item</a></li>\n                                        <li><a href="#">Item</a></li>\n                                        <li class="uk-nav-divider"></li>\n                                        <li><a href="#">Separated item</a></li>\n                                        <li class="uk-parent">\n                                            <a href="#">Parent</a>\n                                            <ul class="uk-nav-sub">\n                                                <li><a href="#">Sub item</a>\n                                                    <ul>\n                                                        <li><a href="#">Sub item</a></li>\n                                                    </ul>\n                                                </li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </div>\n\n                                <div class="uk-width-1-2">\n                                    <ul class="uk-nav uk-nav-dropdown uk-panel">\n                                        <li class="uk-nav-header">Header</li>\n                                        <li><a href="#">Item</a></li>\n                                        <li><a href="#">Item</a></li>\n                                        <li class="uk-nav-divider"></li>\n                                        <li><a href="#">Separated item</a></li>\n                                        <li class="uk-parent">\n                                            <a href="#">Parent</a>\n                                            <ul class="uk-nav-sub">\n                                                <li><a href="#">Sub item</a>\n                                                    <ul>\n                                                        <li><a href="#">Sub item</a></li>\n                                                    </ul>\n                                                </li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </div>\n\n                            </div>\n\n                        </div>\n                    </div>\n                </div>\n\n                <div class="uk-button-group">\n                    <button class="uk-button uk-button-primary">Primary</button>\n                    <div data-uk-dropdown="{mode:''click''}">\n                        <button class="uk-button uk-button-primary"><i class="uk-icon-caret-down"></i></button>\n                        <div class="uk-dropdown uk-dropdown-small">\n                            <ul class="uk-nav uk-nav-dropdown">\n                                <li class="uk-nav-header">Header</li>\n                                <li><a href="#">Item</a></li>\n                                <li><a href="#">Item</a></li>\n                                <li class="uk-nav-divider"></li>\n                                <li><a href="#">Separated item</a></li>\n                                <li class="uk-parent">\n                                    <a href="#">Parent</a>\n                                    <ul class="uk-nav-sub">\n                                        <li><a href="#">Sub item</a>\n                                            <ul>\n                                                <li><a href="#">Sub item</a></li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </li>\n                            </ul>\n                        </div>\n                    </div>\n                </div>\n\n                <div class="uk-button-group">\n                    <button class="uk-button uk-button-success">Success</button>\n                    <div data-uk-dropdown="{mode:''click''}">\n                        <button class="uk-button uk-button-success"><i class="uk-icon-caret-down"></i></button>\n                        <div class="uk-dropdown">\n                            <ul class="uk-nav uk-nav-dropdown">\n                                <li class="uk-nav-header">Header</li>\n                                <li><a href="#">Item</a></li>\n                                <li><a href="#">Item</a></li>\n                                <li class="uk-nav-divider"></li>\n                                <li><a href="#">Separated item</a></li>\n                                <li class="uk-parent">\n                                    <a href="#">Parent</a>\n                                    <ul class="uk-nav-sub">\n                                        <li><a href="#">Sub item</a>\n                                            <ul>\n                                                <li><a href="#">Sub item</a></li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </li>\n                            </ul>\n                        </div>\n                    </div>\n                </div>\n\n                <div class="uk-button-group">\n                    <button class="uk-button uk-button-danger">Danger</button>\n                    <div data-uk-dropdown="{mode:''click''}">\n                        <button class="uk-button uk-button-danger"><i class="uk-icon-caret-down"></i></button>\n                        <div class="uk-dropdown">\n                            <ul class="uk-nav uk-nav-dropdown">\n                                <li class="uk-nav-header">Header</li>\n                                <li><a href="#">Item</a></li>\n                                <li><a href="#">Item</a></li>\n                                <li class="uk-nav-divider"></li>\n                                <li><a href="#">Separated item</a></li>\n                                <li class="uk-parent">\n                                    <a href="#">Parent</a>\n                                    <ul class="uk-nav-sub">\n                                        <li><a href="#">Sub item</a>\n                                            <ul>\n                                                <li><a href="#">Sub item</a></li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </li>\n                            </ul>\n                        </div>\n                    </div>\n                </div>\n\n                <button class="uk-button" disabled>Disabled</button>\n                <button class="uk-button" data-uk-tooltip title="Bazinga!">Tooltip</button>\n                <button class="uk-button" data-uk-modal="{target:''#modal-1''}">Modal</button>\n                <button class="uk-button" data-uk-offcanvas="{target:''#offcanvas-1''}">Off-canvas</button>\n                <button class="uk-button uk-button-link">Button link</button>\n\n            </div>\n        </div>\n\n        <hr class="uk-grid-divider">\n\n        <div class="uk-grid" data-uk-grid-margin>\n\n            <div class="uk-width-medium-1-2">\n\n                <div class="uk-grid" data-uk-grid-margin>\n\n                    <div class="uk-width-1-1">\n                        <ul class="uk-breadcrumb">\n                            <li><a href="#">Home</a></li>\n                            <li><a href="#">Blog</a></li>\n                            <li><span>Category</span></li>\n                            <li class="uk-active"><span>Post</span></li>\n                        </ul>\n                    </div>\n\n                    <div class="uk-width-1-1">\n\n                        <article class="uk-article">\n\n                            <h1 class="uk-article-title">Article title</h1>\n\n                            <p class="uk-article-meta">Written by Super User on 12 April. Posted in Blog</p>\n\n                            <div class="uk-grid" data-uk-grid-margin>\n                                <div class="uk-width-medium-1-2">\n                                    <a class="uk-thumbnail uk-overlay-toggle" href="#">\n                                        <div class="uk-overlay">\n                                            <img src="images/yootheme/uikit_placeholder.svg" width="300" height="90" alt="">\n                                            <div class="uk-overlay-area"></div>\n                                        </div>\n                                        <div class="uk-thumbnail-caption">Caption</div>\n                                    </a>\n                                </div>\n\n                                <div class="uk-width-medium-1-2">\n                                    <a class="uk-thumbnail uk-overlay-toggle" href="#">\n                                        <div class="uk-overlay">\n                                            <img src="images/yootheme/uikit_placeholder.svg" width="300" height="90" alt="">\n                                            <div class="uk-overlay-caption">Caption</div>\n                                        </div>\n                                    <div class="uk-thumbnail-caption">Caption</div>\n                                    </a>\n                                </div>\n                            </div>\n\n                            <p class="uk-article-lead">Lorem ipsum dolor sit amet.</p>\n                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\n                            <pre><code>&lt;div class="myclass"&gt;...&lt;/div&gt;</code></pre>\n                            <hr class="uk-article-divider">\n                            <div class="uk-grid" data-uk-grid-margin>\n\n                                <div class="uk-width-medium-1-5">\n                                    <span class="uk-text-muted">text-muted</span><br>\n                                    <span class="uk-text-primary">text-primary</span><br>\n                                    <span class="uk-text-success">text-success</span><br>\n                                    <span class="uk-text-warning">text-warning</span><br>\n                                    <span class="uk-text-danger">text-danger</span>\n                                </div>\n\n                                <div class="uk-width-medium-3-10">\n                                    <a href="#">a element</a><br>\n                                    <em>em element</em><br>\n                                    <strong>strong</strong><br>\n                                    <code>code element</code><br>\n                                    <del>del element</del>\n                                </div>\n\n                                <div class="uk-width-medium-2-5">\n                                    <ins>ins element</ins><br>\n                                    <mark>mark element</mark><br>\n                                    <q>q <q>inside</q> a q element </q><br>\n                                    <abbr title="Abbreviation Element">abbr element</abbr><br>\n                                    <dfn title="Defines a definition term">dfn element</dfn>\n                                </div>\n\n                                <div class="uk-width-1-1">\n                                    <p class="uk-text-center">\n                                        <span class="uk-badge">Badge</span>\n                                        <span class="uk-badge uk-badge-notification">1</span>\n                                        <span class="uk-badge uk-badge-success">Success</span>\n                                        <span class="uk-badge uk-badge-success uk-badge-notification">4</span>\n                                        <span class="uk-badge uk-badge-warning">Warning</span>\n                                        <span class="uk-badge uk-badge-warning uk-badge-notification">3</span>\n                                        <span class="uk-badge uk-badge-danger">Danger</span>\n                                        <span class="uk-badge uk-badge-danger uk-badge-notification">4</span>\n                                    </p>\n                                </div>\n\n                                <div class="uk-width-medium-1-2">\n                                    <h1 class="uk-display-inline">h1</h1>\n                                    <h2 class="uk-display-inline">h2</h2>\n                                    <h3 class="uk-display-inline">h3</h3>\n                                    <h4 class="uk-display-inline">h4</h4>\n                                    <h5 class="uk-display-inline">h5</h5>\n                                    <h6 class="uk-display-inline">h6</h6>\n                                </div>\n\n                                <div class="uk-width-medium-1-2">\n                                    <blockquote>\n                                        <p> Lorem ipsum dolor.</p>\n                                        <small>Someone famous</small>\n                                    </blockquote>\n                                </div>\n\n                            </div>\n\n                        </article>\n\n                    </div>\n\n                    <div class="uk-width-1-1">\n                        <ul class="uk-comment-list">\n                            <li>\n                                <article class="uk-comment">\n                                    <header class="uk-comment-header">\n                                        <img class="uk-comment-avatar" src="images/yootheme/uikit_avatar.svg" width="50" height="50" alt="">\n                                        <h4 class="uk-comment-title">Author</h4>\n                                        <p class="uk-comment-meta">May 2, 2090 at 1:55 pm</p>\n                                    </header>\n                                    <div class="uk-comment-body">\n                                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.</p>\n                                    </div>\n                                </article>\n                            </li>\n                        </ul>\n                    </div>\n\n                    <div class="uk-width-1-1">\n                        <ul class="uk-pagination">\n                            <li class="uk-disabled"><span><i class="uk-icon-angle-double-left"></i></span></li>\n                            <li class="uk-active"><span>1</span></li>\n                            <li><a href="#">2</a></li>\n                            <li><a href="#">3</a></li>\n                            <li><a href="#">4</a></li>\n                            <li><span>...</span></li>\n                            <li><a href="#">20</a></li>\n                            <li><a href="#"><i class="uk-icon-angle-double-right"></i></a></li>\n                        </ul>\n                    </div>\n\n                </div>\n\n            </div>\n\n            <div class="uk-width-medium-1-2">\n\n                <div class="uk-grid" data-uk-grid-margin>\n\n                    <div class="uk-width-medium-1-2">\n\n                        <div class="uk-panel">\n                            <ul class="uk-nav uk-nav-side uk-nav-parent-icon" data-uk-nav>\n                                <li class="uk-nav-header">Header</li>\n                                <li class="uk-nav-divider"></li>\n                                <li class="uk-active"><a href="#">Active</a></li>\n                                <li class="uk-parent">\n                                    <a href="#">Parent</a>\n                                    <ul class="uk-nav-sub">\n                                        <li><a href="#">Sub item</a></li>\n                                        <li><a href="#">Sub item</a>\n                                            <ul>\n                                                <li><a href="#">Sub item</a></li>\n                                                <li><a href="#">Sub item</a></li>\n                                            </ul>\n                                        </li>\n                                    </ul>\n                                </li>\n                                <li><a href="#">Item</a></li>\n                            </ul>\n                        </div>\n\n                        <div class="uk-panel uk-panel-divider">\n                            <h3 class="uk-panel-title">Divider</h3>\n                            Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipisicing elit.\n                        </div>\n\n                        <div class="uk-panel uk-panel-header">\n                            <h3 class="uk-panel-title">Header</h3>\n                            Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipisicing elit.\n                        </div>\n\n                    </div>\n\n                    <div class="uk-width-medium-1-2">\n\n                        <div class="uk-panel uk-panel-box">\n                            <h3 class="uk-panel-title">Box</h3>\n                            Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipisicing elit.\n                        </div>\n\n                        <div class="uk-panel uk-panel-box uk-panel-box-primary">\n                            <h3 class="uk-panel-title">Box primary</h3>\n                            Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipisicing elit.\n                        </div>\n\n                        <div class="uk-panel uk-panel-box uk-panel-box-secondary">\n                            <h3 class="uk-panel-title">Box secondary</h3>\n                            Lorem ipsum <a href="#">dolor</a> sit amet, consectetur adipisicing elit.\n                        </div>\n\n                    </div>\n\n                </div>\n\n                <div class="uk-grid" data-uk-grid-margin>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-alert" data-uk-alert>\n                            <a class="uk-alert-close uk-close"></a>\n                            <p>Info message</p>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-alert uk-alert-success" data-uk-alert>\n                            <a class="uk-alert-close uk-close"></a>\n                            <p>Success message</p>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-alert uk-alert-warning" data-uk-alert>\n                            <a class="uk-alert-close uk-close"></a>\n                            <p>Warning message</p>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-alert uk-alert-danger" data-uk-alert>\n                            <a class="uk-alert-close uk-close"></a>\n                            <p>Danger message</p>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-progress">\n                            <div class="uk-progress-bar" style="width: 55%;">55%</div>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-progress uk-progress-success">\n                            <div class="uk-progress-bar" style="width: 55%;">55%</div>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-progress uk-progress-warning">\n                            <div class="uk-progress-bar" style="width: 55%;">55%</div>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <div class="uk-progress uk-progress-danger">\n                            <div class="uk-progress-bar" style="width: 55%;">55%</div>\n                        </div>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <fieldset class="uk-form">\n                            <legend>Form states</legend>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="Text Input" class="uk-width-1-1">\n                            </div>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form-success" value="form-success" class="uk-width-1-1 uk-form-success">\n                            </div>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form-danger" value="form-danger" class="uk-width-1-1 uk-form-danger">\n                            </div>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form disabled" class="uk-width-1-1" disabled>\n                            </div>\n                        </fieldset>\n                    </div>\n\n                    <div class="uk-width-1-2">\n                        <fieldset class="uk-form">\n                            <legend>Form styles</legend>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form-large" class="uk-form-large uk-form-width-small">\n                                <button class="uk-button uk-button-large" type="reset">Large</button>\n                            </div>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form-small" class="uk-form-small uk-form-width-small">\n                                <button class="uk-button uk-button-small" type="reset">Small</button>\n                            </div>\n                            <div class="uk-form-row">\n                                <input type="text" placeholder="form-blank" class="uk-form-width-small uk-form-blank">\n                                <button class="uk-button uk-button-mini" type="reset">Mini</button>\n                            </div>\n                        </fieldset>\n                    </div>\n\n                </div>\n\n            </div>\n\n        </div>\n\n        <hr class="uk-grid-divider">\n\n        <div class="uk-grid" data-uk-grid-margin>\n\n            <div class="uk-width-medium-1-4">\n\n                <ul class="uk-subnav uk-subnav-line">\n                    <li class="uk-active"><a href="#">Active</a></li>\n                    <li><a href="#">Item</a></li>\n                    <li><span>Disabled</span></li>\n                </ul>\n\n            </div>\n            <div class="uk-width-medium-1-4">\n\n                <ul class="uk-subnav uk-subnav-pill">\n                    <li class="uk-active"><a href="#">Active</a></li>\n                    <li><a href="#">Item</a></li>\n                    <li><span>Disabled</span></li>\n                </ul>\n\n            </div>\n            <div class="uk-width-medium-1-4">\n\n                <ul class="uk-tab" data-uk-tab>\n                    <li class="uk-active"><a href="#">Active</a></li>\n                    <li><a href="#">Item</a></li>\n                    <li class="uk-disabled"><a href="#">Disabled</a></li>\n                </ul>\n\n            </div>\n            <div class="uk-width-medium-1-4">\n\n                <a href="#" class="uk-icon-button uk-icon-github"></a>\n                <a href="#" class="uk-icon-button uk-icon-twitter"></a>\n                <a href="#" class="uk-icon-button uk-icon-dribbble"></a>\n                <a href="#" class="uk-icon-button uk-icon-html5"></a>\n\n            </div>\n        </div>\n\n        <hr class="uk-grid-divider">\n\n        <div class="uk-grid uk-grid-divider" data-uk-grid-margin>\n            <div class="uk-width-medium-1-4">\n\n                <ul class="uk-list uk-list-line">\n                    <li>List item 1</li>\n                    <li>List item 2</li>\n                    <li>List item 3</li>\n                </ul>\n\n            </div>\n\n            <div class="uk-width-medium-1-4">\n\n                <ul class="uk-list uk-list-striped">\n                    <li>List item 1</li>\n                    <li>List item 2</li>\n                    <li>List item 3</li>\n                </ul>\n\n            </div>\n            <div class="uk-width-medium-1-4">\n\n                <table class="uk-table uk-table-striped uk-table-condensed uk-table-hover">\n                    <caption>Table caption</caption>\n                    <thead>\n                        <tr>\n                            <th>Table</th>\n                            <th>Heading</th>\n                        </tr>\n                    </thead>\n                    <tbody>\n                        <tr>\n                            <td>Table</td>\n                            <td>Data</td>\n                        </tr>\n                        <tr>\n                            <td>Table</td>\n                            <td>Data</td>\n                        </tr>\n                    </tbody>\n                </table>\n\n            </div>\n            <div class="uk-width-medium-1-4">\n\n                <dl class="uk-description-list uk-description-list-line">\n                    <dt>Description lists</dt>\n                    <dd>Description text.</dd>\n                    <dt>Description lists</dt>\n                    <dd>Description text.</dd>\n                </dl>\n\n            </div>\n        </div>\n\n        <div id="offcanvas-1" class="uk-offcanvas">\n            <div class="uk-offcanvas-bar">\n\n                <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav>\n                    <li><a href="#">Item</a></li>\n                    <li class="uk-active"><a href="#">Active</a></li>\n\n                    <li class="uk-parent">\n                        <a href="#">Parent</a>\n                        <ul class="uk-nav-sub">\n                            <li><a href="#">Sub item</a></li>\n                            <li><a href="#">Sub item</a>\n                                <ul>\n                                    <li><a href="#">Sub item</a></li>\n                                    <li><a href="#">Sub item</a></li>\n                                </ul>\n                            </li>\n                        </ul>\n                    </li>\n\n                    <li class="uk-parent">\n                        <a href="#">Parent</a>\n                        <ul class="uk-nav-sub">\n                            <li><a href="#">Sub item</a></li>\n                            <li><a href="#">Sub item</a></li>\n                        </ul>\n                    </li>\n\n                    <li><a href="#">Item</a></li>\n\n                    <li class="uk-nav-header">Header</li>\n                    <li><a href="#"><i class="uk-icon-star"></i> Item</a></li>\n                    <li><a href="#"><i class="uk-icon-twitter"></i> Item</a></li>\n                    <li class="uk-nav-divider"></li>\n                    <li><a href="#"><i class="uk-icon-rss"></i> Item</a></li>\n                </ul>\n\n                <div class="uk-panel">\n                    <h3 class="uk-panel-title">Title</h3>\n                    Lorem ipsum dolor sit amet, <a href="#">consetetur</a> sadipscing elitr.\n                </div>\n\n                <div class="uk-panel">\n                    <h3 class="uk-panel-title">Title</h3>\n                    Lorem ipsum dolor sit amet, <a href="#">consetetur</a> sadipscing elitr.\n                </div>\n\n            </div>\n        </div>\n\n        <div id="modal-1" class="uk-modal">\n            <div class="uk-modal-dialog">\n                <button type="button" class="uk-modal-close uk-close"></button>\n                <h1>Headline</h1>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n            </div>\n        </div>', '', -2, 2, '2011-05-02 11:47:45', 37, '', '2014-04-03 16:03:37', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:47:45', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 26, 13, '', '', 1, 275, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 37, 'Dummy Content', 'dummy-content', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', -2, 2, '2011-05-02 11:48:08', 37, '', '2011-05-02 13:45:48', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:48:08', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 2, 14, '', '', 1, 28, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');
INSERT INTO `ek5d2_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(6, 38, 'Features', 'features', '<p class="uk-article-lead">This theme is built on the <a href="http://www.warp-framework.com">Warp framework</a>, a well-engineered theme framework for WordPress and Joomla, and utilizes all of its latest features. The user interface is powered by <a href="http://www.getuikit.com">UIkit</a>, a lightweight and modular front-end framework, which provides the theme''s styling. The theme also comes with a wide range of different <a href="index.php?option=com_content&amp;view=article&amp;id=1&amp;Itemid=103">layouts and widget variations</a>.</p>\n\n<div class="uk-grid" data-uk-grid-margin data-uk-grid-match="{target:''.uk-panel''}">\n    <div class="uk-width-medium-1-2">\n        <div class="uk-panel uk-panel-box">\n\n            <div class="uk-grid" data-uk-grid-margin>\n                <div class="uk-width-large-2-6 uk-text-center">\n                    <a class="uk-display-block" href="http://www.warp-framework.com" target="_blank">\n                        <img src="images/yootheme/features_icon_warp.svg" alt="Warp Framework" width="150" height="150">\n                    </a>\n                </div>\n                <div class="uk-width-large-4-6 uk-text-center-medium">\n                    <h2>Warp Framework</h2>\n                    <p>A fast and slick theme framework which is built on the latest web techniques like HTML5, CSS3 and PHP 5.3+</p>\n                    <p><a class="uk-button" href="http://www.warp-framework.com" target="_blank">Visit Website</a></p>\n                </div>\n            </div>\n\n        </div>\n    </div>\n    <div class="uk-width-medium-1-2">\n        <div class="uk-panel uk-panel-box">\n\n            <div class="uk-grid" data-uk-grid-margin>\n                <div class="uk-width-large-2-6 uk-text-center">\n                    <a class="uk-display-block" href="http://www.getuikit.com" target="_blank">\n                        <img src="images/yootheme/features_icon_uikit.svg" alt="UIkit" width="150" height="150">\n                    </a>\n                </div>\n                <div class="uk-width-large-4-6 uk-text-center-medium">\n                    <h2>UIkit</h2>\n                    <p>A lightweight and modular front-end framework for developing fast and powerful web interfaces.</p>\n                    <p><a class="uk-button" href="http://www.getuikit.com" target="_blank">Visit Website</a></p>\n                </div>\n            </div>\n\n        </div>\n    </div>\n</div>\n\n<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-1">\n        <div class="uk-panel uk-panel-box uk-text-center">\n            <p>This theme is available for <img src="images/yootheme/features_icon_joomla.svg" width="25" height="21" alt="Joomla">Joomla and <img src="images/yootheme/features_icon_wordpress.svg" width="23" height="22" alt="Wordpress">WordPress including the same features on each system.</p>\n        </div>\n    </div>\n</div>', '', -2, 2, '2011-05-02 11:48:41', 37, '', '2014-04-03 16:42:50', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:48:41', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 64, 15, '', '', 1, 557, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(7, 39, 'Home', 'home', 'This is an hidden article.', '1399381972', 1, 2, '2011-05-02 11:49:24', 37, '', '2014-04-04 07:46:23', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:49:24', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 1, '', '', 1, 6795, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(8, 40, 'Joomla Templates', 'joomla-templates', '<p><img src="images/yootheme/blog_themes.jpg" width="900" height="300" alt="Joomla Templates and WordPress Themes"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-04-02 11:50:02', 37, '', '2014-04-02 16:17:06', 42, 0, '0000-00-00 00:00:00', '2014-04-02 11:50:02', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"none","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"none","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 59, 1, '', '', 1, 97, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(9, 41, 'Beautiful Icons', 'beautiful-icons', '<p><img src="images/yootheme/blog_icons.jpg" width="900" height="300" alt="Beautiful icons"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-03-15 11:50:30', 37, '', '2014-04-02 16:16:27', 42, 0, '0000-00-00 00:00:00', '2014-03-15 11:50:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 18, 4, '', '', 1, 19, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(10, 42, 'Warp Framework', 'warp-framework', '<p><img src="images/yootheme/blog_warp.jpg" width="900" height="300" alt="Warp Framework"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-03-12 11:50:55', 37, '', '2014-04-02 17:33:18', 42, 0, '0000-00-00 00:00:00', '2014-03-12 11:50:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 5, '', '', 1, 20, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(11, 43, 'ZOO Extension', 'zoo-extension', '<p><img src="images/yootheme/blog_zoo.jpg" width="900" height="300" alt="ZOO Extension"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-02-28 11:51:30', 37, '', '2014-04-02 16:16:43', 42, 0, '0000-00-00 00:00:00', '2014-02-28 11:51:30', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 16, 6, '', '', 1, 7, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(13, 150, 'Widgetkit', 'widgetkit', '<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-2-10 uk-push-8-10 uk-text-center">\n        <img src="images/yootheme/widgetkit_icon.svg" alt="Widgetkit" width="175" height="175">\n    </div>\n    <div class="uk-width-medium-8-10 uk-pull-2-10">\n        <p class="uk-article-lead">Widgetkit is the next generation tool set for Joomla and WordPress. This toolkit is the first of its kind! It provides a simple and user-friendly way to enrich your websites experience with slideshows, galleries, lightboxes and much more.</p>\n        <p>All widgets make use of modern web technologies like HTML5 markup, CSS3 features and jQuery based JavaScripts. Widgetkit is fully responsive and all widgets and their effects adapt perfectly for all device resolutions. It supports touch gestures and makes use of smooth CSS3 animations.</p>\n        <p><a class="uk-button" href="http://www.yootheme.com/widgetkit" target="_blank">Visit Website</a></p>\n    </div>\n</div>\n\n<h2>How it works</h2>\n\n<p>Widgetkit basically acts as a platform for all our widgets. It installs as a single component in Joomla or as a plugin in WordPress. The Widgetkit dashboard presents you an overview of all widgets. You can create, edit or delete all widgets and their content in one place. And after you have created the content for your first widget, you can either use a shortcode or a module to display your widget anywhere on your website. In fact, you can do both. Because once have you created a widget, you are able to display it multiple times and reuse it on different parts of your website.</p>\n\n<h2 class="uk-h3">Features</h2>\n\n<div class="uk-grid" data-uk-grid-margin>\n\n    <div class="uk-width-medium-1-3">\n        <ul class="uk-list uk-list-space">\n          <li><i class="uk-icon uk-icon-check"></i> Available for Joomla and WordPress</li>\n          <li><i class="uk-icon uk-icon-check"></i> All widgets are fully responsive</li>\n          <li><i class="uk-icon uk-icon-check"></i> Use shortcodes to show widgets anywhere</li>\n        </ul>\n    </div>\n\n    <div class="uk-width-medium-1-3">\n        <ul class="uk-list uk-list-space">\n          <li><i class="uk-icon uk-icon-check"></i> Clean and lightweight code</li>\n          <li><i class="uk-icon uk-icon-check"></i> Semantic HTML5 markup</li>\n          <li><i class="uk-icon uk-icon-check"></i> Asset file minification and compression</li>\n        </ul>\n    </div>\n\n    <div class="uk-width-medium-1-3">\n        <ul class="uk-list uk-list-space">\n          <li><i class="uk-icon uk-icon-check"></i> Supports touch gestures for mobile devices</li>\n          <li><i class="uk-icon uk-icon-check"></i> Uses hardware accelerated CSS3 animations</li>\n          <li><i class="uk-icon uk-icon-check"></i> Built with PHP 5.3+ and the latest jQuery version</li>\n        </ul>\n    </div>\n</div>\n\n<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-1">\n        <div class="uk-panel uk-panel-box uk-text-center">\n            <p><strong>Get Widgetkit.</strong> The next generation tool set for Joomla and WordPress. <a class="uk-button uk-button-primary uk-margin-left" href="http://www.yootheme.com/widgetkit" target="_blank">Download Widgetkit</a></p>\n        </div>\n    </div>\n</div>', '', -2, 2, '2011-06-08 11:15:54', 37, '', '2014-04-03 16:46:55', 42, 0, '0000-00-00 00:00:00', '2011-06-08 11:15:54', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 38, 9, '', '', 1, 252, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(23, 155, 'Widgetkit', 'widgetkit-extension', '<p><img src="images/yootheme/blog_widgetkit.jpg" width="900" height="300" alt="Widgetkit" title="Widgetkit"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-02-14 11:50:55', 37, '', '2014-04-02 16:19:31', 42, 0, '0000-00-00 00:00:00', '2014-02-14 11:50:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 18, 7, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(24, 151, 'UIkit', 'uikit', '<p><img src="images/yootheme/blog_uikit.jpg" width="900" height="300" alt="UIkit"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-03-22 11:50:55', 37, '', '2014-04-02 16:16:31', 42, 0, '0000-00-00 00:00:00', '2014-03-22 11:50:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 19, 3, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(25, 153, 'Pagekit', 'pagekit', '<p><img src="images/yootheme/blog_pagekit.jpg" width="900" height="300" alt="Pagekit"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-03-28 15:50:55', 37, '', '2014-04-02 16:18:47', 42, 0, '0000-00-00 00:00:00', '2014-03-28 15:50:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 21, 2, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(26, 156, 'Free Halloween Icons', 'free-halloween-icons', '<p><img src="images/yootheme/blog_halloween_icons.jpg" width="900" height="300" alt="Free Halloween Icons"></p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n', '\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', -2, 7, '2014-01-18 14:50:55', 37, '', '2014-04-04 07:44:41', 42, 0, '0000-00-00 00:00:00', '2014-01-18 14:50:55', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 22, 8, '', '', 1, 5, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(27, 159, 'Blank', 'blank', '', '', -2, 2, '2014-05-01 13:03:16', 37, '', '2014-05-01 13:08:04', 37, 0, '0000-00-00 00:00:00', '2014-05-01 13:03:16', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_tags":"0","show_intro":"0","info_block_position":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"0","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, '', '', 1, 4, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_content_frontpage`
--

DROP TABLE IF EXISTS `ek5d2_content_frontpage`;
CREATE TABLE IF NOT EXISTS `ek5d2_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_content_frontpage`
--

INSERT INTO `ek5d2_content_frontpage` (`content_id`, `ordering`) VALUES
(8, 9),
(9, 8),
(10, 7),
(11, 6),
(12, 5),
(23, 4),
(24, 3),
(25, 2),
(26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_content_rating`
--

DROP TABLE IF EXISTS `ek5d2_content_rating`;
CREATE TABLE IF NOT EXISTS `ek5d2_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_content_types`
--

DROP TABLE IF EXISTS `ek5d2_content_types`;
CREATE TABLE IF NOT EXISTS `ek5d2_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `ek5d2_content_types`
--

INSERT INTO `ek5d2_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special":{"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute', '{"formFile":"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml", "hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(2, 'Weblink', 'com_weblinks.weblink', '{"special":{"dbtable":"#__weblinks","key":"id","type":"Weblink","prefix":"WeblinksTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{}}', 'WeblinksHelperRoute::getWeblinkRoute', '{"formFile":"administrator\\/components\\/com_weblinks\\/models\\/forms\\/weblink.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","featured","images"], "ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"], "convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(3, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute', '{"formFile":"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml","hideFields":["default_con","checked_out","checked_out_time","version","xreference"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"], "displayLookup":[ {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ] }'),
(4, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special":{"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{"formFile":"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml","hideFields":["asset_id","checked_out","checked_out_time","version"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "hits"],"convertToInt":["publish_up", "publish_down", "featured", "ordering"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(5, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{}}', 'UsersHelperRoute::getUserRoute', ''),
(6, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(7, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(8, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(9, 'Weblinks Category', 'com_weblinks.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'WeblinksHelperRoute::getCategoryRoute', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(10, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute', '{"formFile":"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml", "hideFields":["checked_out","checked_out_time","version", "lft", "rgt", "level", "path", "urls", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"],"convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(11, 'Banner', 'com_banners.banner', '{"special":{"dbtable":"#__banners","key":"id","type":"Banner","prefix":"BannersTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"null","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"null", "asset_id":"null"}, "special":{"imptotal":"imptotal", "impmade":"impmade", "clicks":"clicks", "clickurl":"clickurl", "custombannercode":"custombannercode", "cid":"cid", "purchase_type":"purchase_type", "track_impressions":"track_impressions", "track_clicks":"track_clicks"}}', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml", "hideFields":["checked_out","checked_out_time","version", "reset"],"ignoreChanges":["modified_by", "modified", "checked_out", "checked_out_time", "version", "imptotal", "impmade", "reset"], "convertToInt":["publish_up", "publish_down", "ordering"], "displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"cid","targetTable":"#__banner_clients","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"created_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"modified_by","targetTable":"#__users","targetColumn":"id","displayColumn":"name"} ]}'),
(12, 'Banners Category', 'com_banners.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["asset_id","checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}'),
(13, 'Banner Client', 'com_banners.client', '{"special":{"dbtable":"#__banner_clients","key":"id","type":"Client","prefix":"BannersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml", "hideFields":["checked_out","checked_out_time"], "ignoreChanges":["checked_out", "checked_out_time"], "convertToInt":[], "displayLookup":[]}'),
(14, 'User Notes', 'com_users.note', '{"special":{"dbtable":"#__user_notes","key":"id","type":"Note","prefix":"UsersTable"}}', '', '', '', '{"formFile":"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml", "hideFields":["checked_out","checked_out_time", "publish_up", "publish_down"],"ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time"], "convertToInt":["publish_up", "publish_down"],"displayLookup":[{"sourceColumn":"catid","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}, {"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}]}'),
(15, 'User Notes Category', 'com_users.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special":{"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', '', '{"formFile":"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml", "hideFields":["checked_out","checked_out_time","version","lft","rgt","level","path","extension"], "ignoreChanges":["modified_user_id", "modified_time", "checked_out", "checked_out_time", "version", "hits", "path"], "convertToInt":["publish_up", "publish_down"], "displayLookup":[{"sourceColumn":"created_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"}, {"sourceColumn":"access","targetTable":"#__viewlevels","targetColumn":"id","displayColumn":"title"},{"sourceColumn":"modified_user_id","targetTable":"#__users","targetColumn":"id","displayColumn":"name"},{"sourceColumn":"parent_id","targetTable":"#__categories","targetColumn":"id","displayColumn":"title"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_contentitem_tag_map`
--

DROP TABLE IF EXISTS `ek5d2_contentitem_tag_map`;
CREATE TABLE IF NOT EXISTS `ek5d2_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_core_log_searches`
--

DROP TABLE IF EXISTS `ek5d2_core_log_searches`;
CREATE TABLE IF NOT EXISTS `ek5d2_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_extensions`
--

DROP TABLE IF EXISTS `ek5d2_extensions`;
CREATE TABLE IF NOT EXISTS `ek5d2_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned DEFAULT NULL,
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10028 ;

--
-- Dumping data for table `ek5d2_extensions`
--

INSERT INTO `ek5d2_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"contact_layout":"_:default","show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"0","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_items":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_items_cat":"1","show_pagination_limit":"1","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_pagination":"2","show_pagination_results":"1","initial_sort":"ordering","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0","upload_limit":"2","image_formats":"gif,bmp,jpg,jpeg,png","source_formats":"txt,less,ini,xml,js,php,css","font_formats":"woff,ttf,otf","compressed_formats":"zip"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"target":"0","count_clicks":"1","icons":1,"link_icons":"","category_layout":"_:default","show_category_title":"1","show_description":"1","show_description_image":"1","maxLevel":"-1","show_empty_categories":"0","show_subcat_desc":"1","show_cat_num_links":"1","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_links_cat":"1","show_pagination_limit":"1","show_headings":"1","show_link_description":"1","show_link_hits":"1","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"1","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"0","show_email_icon":"0","show_hits":"1","show_noauth":"0","urls_position":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"1","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"right","float_fulltext":"right","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"1","sendpassword":"0","useractivation":"0","mail_to_admin":"0","captcha":"0","frontend_userparams":"0","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","minimum_length":"4","minimum_integers":"0","minimum_symbols":"0","minimum_uppercase":"0","save_history":"0","history_limit":5,"mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"0","show_autosuggest":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","sort_order":"relevance","sort_direction":"desc","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stem":"1","stemmer":"porter_en"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{"updatesource":"sts","customurl":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(30, 'com_contenthistory', 'component', 'com_contenthistory', '', 1, 1, 1, 0, '{"name":"com_contenthistory","type":"component","creationDate":"May 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_CONTENTHISTORY_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(31, 'com_ajax', 'component', 'com_ajax', '', 1, 1, 1, 0, '{"name":"com_ajax","type":"component","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_AJAX_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(32, 'com_postinstall', 'component', 'com_postinstall', '', 1, 1, 1, 1, '{"name":"com_postinstall","type":"component","creationDate":"September 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"COM_POSTINSTALL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2013, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/github.com\\/PHPMailer\\/PHPMailer","version":"5.2.6","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{"mediaversion":"b9e184c83616411f6deda91a5fa8e952"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(105, 'FOF', 'library', 'fof', '', 0, 1, 1, 1, '{"name":"FOF","type":"library","creationDate":"2013-12-14","author":"Nicholas K. Dionysopoulos \\/ Akeeba Ltd","copyright":"(C)2011-2013 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"https:\\/\\/www.akeebabackup.com","version":"2.1.1","description":"LIB_FOF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(106, 'PHPass', 'library', 'phpass', '', 0, 1, 1, 1, '{"name":"PHPass","type":"library","creationDate":"2004-2006","author":"Solar Designer","copyright":"","authorEmail":"solar@openwall.com","authorUrl":"http:\\/\\/www.openwall.com\\/phpass\\/","version":"0.3","description":"LIB_PHPASS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(306, 'mod_online', 'module', 'mod_online', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(403, 'plg_content_contact', 'plugin', 'contact', 'content', 0, 1, 1, 0, '{"name":"plg_content_contact","type":"plugin","creationDate":"January 2014","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.2","description":"PLG_CONTENT_CONTACT_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"none"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 0, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"3.15","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"lineNumbers":"1","lineWrapping":"1","matchTags":"1","matchBrackets":"1","marker-gutter":"1","autoCloseTags":"1","autoCloseBrackets":"1","autoFocus":"1","theme":"default","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com","version":"4.0.18","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","compressed":"0","cleanup_startup":"0","cleanup_save":"2","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":",@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight],@[data-lightbox],@[data-spotlight]","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","safari":"0","custom_plugin":"","custom_button":""}', '', '', 42, '2013-01-07 08:47:05', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0);
INSERT INTO `ek5d2_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 0, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(448, 'plg_twofactorauth_totp', 'plugin', 'totp', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_totp","type":"plugin","creationDate":"August 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(449, 'plg_authentication_cookie', 'plugin', 'cookie', 'authentication', 0, 1, 1, 0, '{"name":"plg_authentication_cookie","type":"plugin","creationDate":"July 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_COOKIE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(450, 'plg_twofactorauth_yubikey', 'plugin', 'yubikey', 'twofactorauth', 0, 0, 1, 0, '{"name":"plg_twofactorauth_yubikey","type":"plugin","creationDate":"Se[ptember 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.0","description":"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.3","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.3","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"March 2014","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.2.3","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'yoo_master2', 'template', 'yoo_master2', '', 0, 1, 1, 0, '{"legacy":false,"name":"yoo_master2","type":"template","creationDate":"April 2014","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"1.0.0","description":"Master theme of the YOOtheme club. It is based on YOOtheme''s Warp theme framework.","group":""}', '{"config":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10025, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10026, 'CEGCore', 'library', 'cegcore', '', 0, 1, 1, 0, '{"name":"CEGCore","type":"library","creationDate":"01.2014","author":"ChronoEngine.com","copyright":"Copyright (C) 2013","authorEmail":"webmaster@chronoengine.com","authorUrl":"www.chronoengine.com","version":"1.0","description":"The GCore framework classes!","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10027, 'com_chronoforms5', 'component', 'com_chronoforms5', '', 1, 1, 0, 0, '{"name":"com_chronoforms5","type":"component","creationDate":"23.March.2014","author":"Chronoman","copyright":"ChronoEngine.com 2014","authorEmail":"webmaster@chronoengine.com","authorUrl":"www.chronoengine.com","version":"5.0 RC5","description":"The ChronoForms V5 component is the ultimate tool for Joomla forms creation, power and simplicity.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_filters`
--

DROP TABLE IF EXISTS `ek5d2_finder_filters`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links`
--

DROP TABLE IF EXISTS `ek5d2_finder_links`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms0`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms1`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms2`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms3`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms4`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms5`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms6`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms7`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms8`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_terms9`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termsa`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termsb`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termsc`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termsd`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termse`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_links_termsf`
--

DROP TABLE IF EXISTS `ek5d2_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_taxonomy`
--

DROP TABLE IF EXISTS `ek5d2_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ek5d2_finder_taxonomy`
--

INSERT INTO `ek5d2_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `ek5d2_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_terms`
--

DROP TABLE IF EXISTS `ek5d2_finder_terms`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_terms_common`
--

DROP TABLE IF EXISTS `ek5d2_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_finder_terms_common`
--

INSERT INTO `ek5d2_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_tokens`
--

DROP TABLE IF EXISTS `ek5d2_finder_tokens`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `ek5d2_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_finder_types`
--

DROP TABLE IF EXISTS `ek5d2_finder_types`;
CREATE TABLE IF NOT EXISTS `ek5d2_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_gradesform`
--

DROP TABLE IF EXISTS `ek5d2_gradesform`;
CREATE TABLE IF NOT EXISTS `ek5d2_gradesform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `studentId` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `examType` varchar(255) NOT NULL,
  `kannadaMarks` varchar(255) NOT NULL,
  `englishMarks` varchar(255) NOT NULL,
  `hindiMarks` varchar(255) NOT NULL,
  `mathMarks` varchar(255) NOT NULL,
  `generalScienceMarks` varchar(255) NOT NULL,
  `socialStudiesMarks` varchar(255) NOT NULL,
  `computerScience` varchar(255) NOT NULL,
  `physicalEducation` varchar(255) NOT NULL,
  `conduct` varchar(255) NOT NULL,
  `attendance` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1715 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_languages`
--

DROP TABLE IF EXISTS `ek5d2_languages`;
CREATE TABLE IF NOT EXISTS `ek5d2_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ek5d2_languages`
--

INSERT INTO `ek5d2_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_menu`
--

DROP TABLE IF EXISTS `ek5d2_menu`;
CREATE TABLE IF NOT EXISTS `ek5d2_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned DEFAULT NULL,
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- Dumping data for table `ek5d2_menu`
--

INSERT INTO `ek5d2_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 141, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 3, 12, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 4, 5, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 6, 7, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 8, 9, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 10, 11, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 53, 58, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 54, 55, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 56, 57, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 59, 64, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 60, 61, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 62, 63, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 65, 70, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 66, 67, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 68, 69, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 79, 80, 0, '*', 1),
(17, 'menu', 'com_search', 'Search', '', 'Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 71, 72, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 73, 78, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 74, 75, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 76, 77, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 33, 34, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 27, 28, 0, '*', 1),
(23, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 31, 32, 0, '', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=7', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 13, 14, 1, '*', 0),
(102, 'mainmenu', 'Features', 'features', '', 'features', 'index.php?option=com_content&view=article&id=6', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 15, 20, 0, '*', 0),
(103, 'mainmenu', 'Layouts', 'layouts', '', 'features/layouts', 'index.php?option=com_content&view=article&id=1', 'component', -2, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 16, 17, 0, '*', 0),
(104, 'mainmenu', 'UIkit', 'uikit', '', 'features/uikit', 'index.php?option=com_content&view=article&id=4', 'component', -2, 102, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_tags":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 18, 19, 0, '*', 0),
(105, 'mainmenu', 'Icons', 'icons', '', 'icons', 'index.php?option=com_content&view=article&id=2', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 25, 26, 0, '*', 0),
(106, 'mainmenu', 'ZOO', 'zoo', '', 'zoo', 'index.php?option=com_content&view=article&id=3', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 0, '*', 0),
(107, 'mainmenu', 'Joomla', 'joomla', '', 'joomla', 'index.php?option=com_content&view=category&layout=blog&id=7', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"1","num_intro_articles":"4","num_columns":"1","num_links":"0","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"order","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 35, 52, 0, '*', 0),
(108, 'topmenu', 'Features', 'features1', '', 'features1', 'index.php?option=com_content&view=article&id=6&Itemid=102', 'url', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 81, 82, 0, '*', 0),
(109, 'topmenu', 'Layouts', 'layouts1', '', 'layouts1', 'index.php?option=com_content&view=article&id=1&Itemid=103', 'url', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 83, 84, 0, '*', 0),
(110, 'topmenu', 'Blog', 'blog', '', 'blog', 'index.php?option=com_content&view=category&layout=blog&id=7&Itemid=107', 'url', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 85, 86, 0, '*', 0),
(111, 'sidebarmenu', 'Sample Levels', 'sample-levels', '', 'sample-levels', 'index.php?option=com_content&view=article&id=5', 'component', 1, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 98, 0, '*', 0),
(112, 'sidebarmenu', 'Level 2', 'level-2', '', 'sample-levels/level-2', 'index.php?option=com_content&view=article&id=5', 'component', 1, 111, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 88, 89, 0, '*', 0),
(113, 'sidebarmenu', 'Level 2', 'level-21', '', 'sample-levels/level-21', 'index.php?option=com_content&view=article&id=5', 'component', 1, 111, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 90, 95, 0, '*', 0),
(114, 'sidebarmenu', 'Level 3', 'level-3', '', 'sample-levels/level-21/level-3', 'index.php?option=com_content&view=article&id=5', 'component', 1, 113, 3, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 94, 0, '*', 0),
(115, 'sidebarmenu', 'Level 4', 'level-4', '', 'sample-levels/level-21/level-3/level-4', 'index.php?option=com_content&view=article&id=5', 'component', 1, 114, 4, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 92, 93, 0, '*', 0),
(116, 'sidebarmenu', 'Level 2', 'level-22', '', 'sample-levels/level-22', 'index.php?option=com_content&view=article&id=5', 'component', 1, 111, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 96, 97, 0, '*', 0),
(117, 'sidebarmenu', 'Accordion A', 'accordion-a', '', 'accordion-a', '', 'separator', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu_image":"","menu_text":1}', 99, 106, 0, '*', 0),
(118, 'sidebarmenu', 'Level 2', 'level-2', '', 'accordion-a/level-2', 'index.php?option=com_content&view=article&id=5', 'component', 1, 117, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 100, 101, 0, '*', 0),
(119, 'sidebarmenu', 'Level 2', 'level-21', '', 'accordion-a/level-21', 'index.php?option=com_content&view=article&id=5', 'component', 1, 117, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 104, 105, 0, '*', 0),
(120, 'sidebarmenu', 'Level 2', 'level-22', '', 'accordion-a/level-22', 'index.php?option=com_content&view=article&id=5', 'component', 1, 117, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 103, 0, '*', 0),
(121, 'sidebarmenu', 'Accordion B', 'accordion-b', '', 'accordion-b', '', 'separator', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu_image":"","menu_text":1}', 107, 112, 0, '*', 0),
(122, 'sidebarmenu', 'Level 2', 'level-2', '', 'accordion-b/level-2', 'index.php?option=com_content&view=article&id=5', 'component', 1, 121, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 108, 109, 0, '*', 0),
(123, 'sidebarmenu', 'Level 2', 'level-21', '', 'accordion-b/level-21', 'index.php?option=com_content&view=article&id=5', 'component', 1, 121, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 110, 111, 0, '*', 0),
(124, 'mainmenu', 'Content views', 'content-views', '', 'joomla/content-views', '', 'heading', -2, 107, 2, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu_image":"","menu_text":1}', 36, 37, 0, '*', 0),
(125, 'mainmenu', 'Other views', 'other-views', '', 'joomla/other-views', '', 'heading', -2, 107, 2, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu_image":"","menu_text":1}', 44, 45, 0, '*', 0),
(126, 'mainmenu', 'Category List', 'category-list', '', 'joomla/category-list', 'index.php?option=com_content&view=category&id=7', 'component', -2, 107, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_category_heading_title":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"Blog","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 42, 43, 0, '*', 0),
(127, 'mainmenu', 'List All Categories', 'list-all-categories', '', 'joomla/list-all-categories', 'index.php?option=com_content&view=categories&id=0', 'component', -2, 107, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_base_description":"","categories_description":"","maxLevelcat":"","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_num_articles_cat":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","num_leading_articles":"1","num_intro_articles":"4","num_columns":"1","num_links":"4","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_pagination_limit":"","filter_field":"","show_headings":"","list_show_date":"","date_format":"","list_show_hits":"","list_show_author":"","display_num":"10","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"Blog","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 40, 41, 0, '*', 0),
(128, 'mainmenu', 'Featured Articles', 'featured-articles', '', 'joomla/featured-articles', 'index.php?option=com_content&view=featured', 'component', -2, 107, 2, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 38, 39, 0, '*', 0),
(129, 'mainmenu', 'Login2', 'login2', '', 'login2', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"Login","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 137, 138, 0, '*', 0),
(132, 'mainmenu', 'Widgetkit', 'widgetkit', '', 'widgetkit', 'index.php?option=com_content&view=article&id=13', 'component', -2, 1, 1, 22, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"0","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"0","link_author":"","show_create_date":"0","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 21, 22, 0, '*', 0),
(151, 'mainmenu', 'Contacts', 'contacts', '', 'joomla/contacts', 'index.php?option=com_contact&view=category&id=8', 'component', -2, 107, 2, 8, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_items":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_position_headings":"","show_email_headings":"","show_telephone_headings":"","show_mobile_headings":"","show_fax_headings":"","show_suburb_headings":"","show_state_headings":"","show_country_headings":"","show_pagination":"","show_pagination_results":"","initial_sort":"","presentation_style":"","show_contact_category":"","show_contact_list":"","show_name":"","show_position":"","show_email":"","show_street_address":"","show_suburb":"","show_state":"","show_postcode":"","show_country":"","show_telephone":"","show_mobile":"","show_fax":"","show_webpage":"","show_misc":"","show_image":"","allow_vcard":"","show_articles":"","show_links":"","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","show_email_form":"","show_email_copy":"","banned_email":"","banned_subject":"","banned_text":"","validate_session":"","custom_reply":"","redirect":"","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 46, 47, 0, '*', 0),
(155, 'mainmenu', 'Web Links', 'web-links', '', 'joomla/web-links', 'index.php?option=com_weblinks&view=categories&id=0', 'component', -2, 107, 2, 21, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_base_description":"","categories_description":"","maxLevelcat":"-1","show_empty_categories_cat":"","show_subcat_desc_cat":"","show_cat_num_links_cat":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_num_links":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_link_description":"","show_link_hits":"","show_pagination":"","show_pagination_results":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"Web Links","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 48, 49, 0, '*', 0),
(186, 'mainmenu', 'Tags', 'tags', '', 'joomla/tags', 'index.php?option=com_tags&view=tags&parent_id=&tag_list_language_filter=', 'component', -2, 107, 2, 29, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"tag_columns":4,"all_tags_description":"","all_tags_show_description_image":"","all_tags_description_image":"","all_tags_orderby":"","all_tags_orderby_direction":"","all_tags_show_tag_image":"","all_tags_show_tag_description":"","all_tags_tag_maximum_characters":0,"all_tags_show_tag_hits":"","maximum":200,"filter_field":"","show_pagination_limit":"","show_pagination":"","show_pagination_results":"","show_feed_link":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 50, 51, 0, '*', 0),
(202, 'main', 'com_postinstall', 'Post-installation messages', '', 'Post-installation messages', 'index.php?option=com_postinstall', 'component', 0, 1, 1, 32, 0, '0000-00-00 00:00:00', 0, 1, 'class:postinstall', 0, '', 23, 24, 0, '*', 1),
(203, 'main', 'COM_CHRONOFORMS5', 'com-chronoforms5', '', 'com-chronoforms5', 'index.php?option=com_chronoforms5', 'component', 0, 1, 1, 10027, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_chronoforms5/CF.png', 0, '', 113, 118, 0, '', 1),
(204, 'main', 'COM_CHRONOFORMS5', 'com-chronoforms5', '', 'com-chronoforms5/com-chronoforms5', 'index.php?option=com_chronoforms5', 'component', 0, 203, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 114, 115, 0, '', 1),
(205, 'main', 'COM_CHRONOFORMS5_VALIDATE', 'com-chronoforms5-validate', '', 'com-chronoforms5/com-chronoforms5-validate', 'index.php?option=com_chronoforms5&act=validateinstall', 'component', 0, 203, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 116, 117, 0, '', 1),
(206, 'mainmenu', 'Add Student', 'add-student', '', 'students/add-student', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 207, 2, 10027, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"chronoform":"studentForm","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 122, 123, 0, '*', 0),
(207, 'mainmenu', 'Students', 'students', '', 'students', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"208","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 119, 124, 0, '*', 0),
(208, 'mainmenu', 'View Students', 'view-students', '', 'students/view-students', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 207, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"studentList","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 120, 121, 0, '*', 0),
(209, 'mainmenu', 'Login1', 'login1', '', 'login1', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 2, 0, '*', 0),
(210, 'mainmenu', 'View Sponsors', 'view-sponsors', '', 'sponsors/view-sponsors', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 212, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"sponsorList","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 132, 133, 0, '*', 0),
(211, 'mainmenu', 'Add Sponsor', 'add-sponsor', '', 'sponsors/add-sponsor', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 212, 2, 10027, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"chronoform":"sponsorForm","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 134, 135, 0, '*', 0),
(212, 'mainmenu', 'Sponsors', 'sponsors', '', 'sponsors', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"210","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 131, 136, 0, '*', 0),
(213, 'mainmenu', 'Reports', 'reports', '', 'reports', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 1, 1, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"reports","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 139, 140, 0, '*', 0),
(214, 'mainmenu', 'Grades', 'grades', '', 'grades', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"215","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 125, 130, 0, '*', 0),
(215, 'mainmenu', 'View Grades', 'view-grades', '', 'grades/view-grades', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 214, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"gradesList","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 126, 127, 0, '*', 0),
(216, 'mainmenu', 'Add Grades', 'add-grades', '', 'grades/add-grades', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 214, 2, 10027, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"chronoform":"gradesForm","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 128, 129, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_menu_types`
--

DROP TABLE IF EXISTS `ek5d2_menu_types`;
CREATE TABLE IF NOT EXISTS `ek5d2_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ek5d2_menu_types`
--

INSERT INTO `ek5d2_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'topmenu', 'Top Menu', ''),
(3, 'sidebarmenu', 'Sidebar Menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_messages`
--

DROP TABLE IF EXISTS `ek5d2_messages`;
CREATE TABLE IF NOT EXISTS `ek5d2_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ek5d2_messages`
--

INSERT INTO `ek5d2_messages` (`message_id`, `user_id_from`, `user_id_to`, `folder_id`, `date_time`, `state`, `priority`, `subject`, `message`) VALUES
(1, 0, 0, 0, '2014-05-01 05:43:04', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: asdasd'),
(2, 0, 0, 0, '2014-05-01 05:48:05', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is: Could not instantiate mail function. The user who attempted to register is: arvind'),
(3, 0, 0, 0, '2014-05-01 05:56:27', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is:  The user who attempted to register is: arvind'),
(4, 0, 0, 0, '2014-05-01 06:00:39', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is:  The user who attempted to register is: arvind'),
(5, 0, 0, 0, '2014-05-01 06:04:20', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is:  The user who attempted to register is: arvind'),
(6, 0, 0, 0, '2014-05-01 06:19:21', 0, 0, 'Error sending email', 'An error was encountered when sending the user registration email. The error is:  The user who attempted to register is: arvind');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_messages_cfg`
--

DROP TABLE IF EXISTS `ek5d2_messages_cfg`;
CREATE TABLE IF NOT EXISTS `ek5d2_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_modules`
--

DROP TABLE IF EXISTS `ek5d2_modules`;
CREATE TABLE IF NOT EXISTS `ek5d2_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned DEFAULT NULL,
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `ek5d2_modules`
--

INSERT INTO `ek5d2_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 0, 'Main Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(2, 0, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 0, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 0, 'Recently Added Articles', '', '', 4, 'cpanel', 42, '2014-03-04 13:29:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(6, 0, 'Unread Messages', '', '', 1, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unread', 3, 1, '', 1, '*'),
(7, 0, 'Online Users', '', '', 2, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_online', 3, 1, '', 1, '*'),
(8, 0, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 0, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 0, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 0, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 0, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 0, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 0, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(17, 0, 'Breadcrumbs', '', '', 1, 'breadcrumbs', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"showHere":"1","showHome":"1","homeText":"Home","showLast":"1","separator":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(19, 0, 'Bottom A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(20, 0, 'Bottom A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 2, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(21, 0, 'Bottom A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 3, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(22, 0, 'Bottom A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 4, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(23, 0, 'Fast and lightweight', '', '<p>Well designed and coded framework providing optimal loading time.</p>', 10, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(24, 0, 'Responsive design', '', '<p>A fully responsive layout that adapts perfectly to all device resolutions.</p>', 11, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(25, 0, 'Supported systems', '', '<p>Available for Joomla and WordPress including all features on both systems.</p>', 12, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(26, 0, 'Frequent updates', '', '<p>Update with ease and get regular improvements and bugfixes.</p>', 13, 'bottom-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(27, 0, 'Bottom B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(28, 0, 'Bottom B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 2, 'bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(29, 0, 'Bottom B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 3, 'bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(30, 0, 'Bottom B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 4, 'bottom-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(31, 0, 'Footer Menu', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"topmenu","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(32, 90, 'Footer', '', '', 2, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(33, 0, 'Headerbar', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'headerbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(34, 0, 'Main Bottom', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'main-bottom', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(35, 0, 'Main Bottom', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 2, 'main-bottom', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(36, 0, ' Main Top', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'main-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(37, 0, 'Main Top', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'main-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(38, 96, 'Logo', '', '<img src="images/bgmsHeader.gif" width="100%" alt="BGMS Image">', 1, 'logo', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(39, 97, 'Login', '', '', 2, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"101","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(40, 0, 'Search', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_search', 1, 1, '{"label":"","width":"20","text":"","button":"","button_pos":"right","imagebutton":"","button_text":"","opensearch":"1","opensearch_title":"","set_itemid":"107","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(41, 99, 'Sub Menu', '', '', 8, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"2","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(42, 0, 'Sidebar Menu', '', '', 1, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"sidebarmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(43, 0, 'Sidebar A', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>', 3, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(44, 0, 'Sidebar A', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>', 2, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(48, 0, 'Latest News', '', '', 16, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_articles_latest', 1, 1, '{"catid":["7"],"count":"5","show_featured":"","ordering":"p_dsc","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(49, 0, 'Login', '', '', 17, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_login', 1, 1, '{"pretext":"","posttext":"","login":"","logout":"","greeting":"1","name":"0","usesecure":"0","usetext":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(50, 0, 'Download ZOO', '', '<a class="uk-display-block uk-text-center" href="http://www.yootheme.com/zoo" target="_blank"><img src="images/yootheme/zoo_icon.svg" alt="A flexible and powerful content application builder to manage your content" title="A flexible and powerful content application builder to manage your content" width="150" height="140"></a>\n\n<p>A flexible and powerful content application builder to manage your content.</p>\n\n<p><a class="uk-button uk-button-primary" href="http://www.yootheme.com/zoo" target="_blank">Download ZOO</a></p>', 10, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(53, 0, 'Warp Framework', '', '<a class="uk-display-block" href="http://www.warp-framework.com" target="_blank"><img src="images/yootheme/warp_icon.svg" alt="Warp is a fast and slick theme framework which provides a rich tool set to develop cross-platform themes" title="Warp is a fast and slick theme framework which provides a rich tool set to develop cross-platform themes" width="150" height="150"></a>\n\n<p>A fast and slick theme framework built on the latest web techniques like HTML5, CSS3 and PHP 5.3+</p>\n\n<p><a class="uk-button" href="http://www.warp-framework.com" target="_blank">Visit Website</a></p>', 4, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(54, 0, 'Joomla & WordPress', '', '<a class="uk-display-block" href="http://www.yootheme.com/themes" target="_blank"><img src="images/yootheme/joomla_wordpress_icon.svg" alt="Available for Joomla and WordPress" title="Available for Joomla and WordPress" width="210" height="120"></a>\n\n<p>This theme is available for Joomla and WordPress including the same features on each system.</p>', 6, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(55, 0, 'UIkit', '', '<a class="uk-display-block" href="http://www.getuikit.com" target="_blank"><img src="images/yootheme/uikit_icon.svg" alt="UIkit is a lightweight and modular front-end framework for developing fast and powerful web interfaces" title="UIkit is a lightweight and modular front-end framework for developing fast and powerful web interfaces" width="150" height="150"></a>\n\n<p>A lightweight and modular front-end framework for developing fast and powerful web interfaces.</p>\n\n<p><a class="uk-button" href="http://www.getuikit.com" target="_blank">Visit Website</a></p>', 5, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(57, 0, 'Sidebar B', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>', 1, 'sidebar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(58, 0, 'Sidebar B', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>', 2, 'sidebar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(59, 0, 'Sidebar B', '', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt.</p>', 3, 'sidebar-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(61, 0, 'Top Menu', '', '', 1, 'toolbar-l', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"topmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(62, 0, 'Top A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(63, 0, 'Top A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 2, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(64, 0, 'Top A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 3, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(65, 0, 'Top A', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 4, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(70, 121, 'Home Photo', '', '<img class="uk-margin-top" width="960" height="420" src="images/yootheme/home_warp_teaser.png" alt="BGMS Photo">\r\n', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(71, 0, 'Top B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 1, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(72, 0, 'Top B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 2, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(73, 0, 'Top B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 3, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(74, 0, 'Top B', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', 4, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(77, 0, 'Get Widgetkit', '', '<a class="uk-display-block uk-text-center" href="http://www.yootheme.com/widgetkit" target="_blank"><img src="images/yootheme/widgetkit_icon.svg" alt="The next generation tool set for Joomla and WordPress" title="The next generation tool set for Joomla and WordPress" width="150" height="150"></a>\n\n<p>The next generation tool set for Joomla and WordPress</p>\n\n<p><a class="uk-button uk-button-primary" href="http://www.yootheme.com/widgetkit" target="_blank">Download Widgetkit</a></p>', 7, 'sidebar-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(80, 0, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(81, 0, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(82, 0, 'Finder', '', '', 1, 'search', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_finder', 1, 1, '{"searchfilter":"","show_autosuggest":"1","show_advanced":"0","layout":"_:default","moduleclass_sfx":"","field_size":25,"alt_label":"","show_label":"1","label_pos":"top","show_button":"0","button_pos":"right","opensearch":"1","opensearch_title":""}', 0, '*'),
(94, 0, 'Offcanvas Menu', '', '', 1, 'offcanvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_menu', 1, 1, '{"menutype":"mainmenu","base":"","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(95, 0, 'Offcanvas', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', 2, 'offcanvas', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(96, 143, 'Students', '', '<p><a href="index.php/students/view-students"><img src="images/icon-students.png" width="200px"></a></p>\r\n<h3>Students</h3>', 5, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(97, 144, 'Grades', '', '<p><a href="index.php/grades/view-grades"><img src="images/icon-grades.png" width="200px"></a></p>\r\n<h3>Grades</h3>', 6, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 145, 'Sponsors', '', '<p><a href="index.php/sponsors/view-sponsors"><img src="images/icon-sponsors.png" width="200px"></a></p>\r\n<h3>Sponsors</h3>', 7, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 146, 'Features UIkit', '', '<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-4 uk-width-large-1-5 uk-text-center">\n        <img src="images/yootheme/features_uikit.svg" alt="Get UIkit" title="Get UIkit" width="180" height="180">\n    </div>\n    <div class="uk-width-medium-3-4 uk-width-large-4-5 uk-text-center-small">\n        <h3 class="uk-panel-title">Built with UIkit</h3>\n        <p>UIkit is a lightweight and modular front-end framework for developing fast and powerful web interfaces. It comes with a wide range of reusable and combinable components. All UIkit classes are namespaced, so they won''t interfere with other frameworks and extensions you might be using. Here''s an overview of the different UIkit components, which you can easily modify using the customizer.</p>\n        <p><a class="uk-button" href="http://www.getuikit.com" target="_blank">Visit Website</a></p>\n    </div>\n</div>', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 0, 'Social Icons', '', '<div class="uk-margin-top">\n    <a href="#" class="uk-icon-button uk-icon-github"></a>\n    <a href="#" class="uk-icon-button uk-icon-twitter"></a>\n    <a href="#" class="uk-icon-button uk-icon-dribbble"></a>\n    <a href="#" class="uk-icon-button uk-icon-facebook"></a>\n</div>', 1, 'headerbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 148, 'Home features', '', '<div class="uk-grid uk-margin-top uk-margin-bottom">\n    <div class="uk-width-1-2">\n        <h3 class="uk-h1">Customizer</h3>\n        <p class="uk-text-large">Pick colors, select fonts and modify sizes without any CSS coding. See the changes in a real-time preview.</p>\n        <img width="545" height="180" src="images/yootheme/home_customizer.png" alt="Demo">\n    </div>\n    <div class="uk-width-1-2">\n        <h3 class="uk-h1">Mobile menu</h3>\n        <p class="uk-text-large">A modern and beautiful off-canvas navigation to enhance your site on mobile devices.</p>\n        <img width="545" height="180" src="images/yootheme/home_mobilemenu.png" alt="Mobile Menu">\n    </div>\n</div>', 1, 'main-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 149, 'Logo small', '', '<img src="images/yootheme/logo_small.svg" width="135" height="40" alt="Demo" class="uk-responsive-height">', 1, 'logo-small', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(103, 160, 'Reports', '', '<span style="text-align:center">\r\n<p><a href="index.php/reports"><img src="images/icon-reports.png" width="200px"></a></p>\r\n<h3>Reports</h3>\r\n</span>', 7, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_modules_menu`
--

DROP TABLE IF EXISTS `ek5d2_modules_menu`;
CREATE TABLE IF NOT EXISTS `ek5d2_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_modules_menu`
--

INSERT INTO `ek5d2_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(17, 0),
(19, 103),
(20, 103),
(21, 103),
(22, 103),
(23, 101),
(24, 101),
(25, 101),
(26, 101),
(27, 103),
(28, 103),
(29, 103),
(30, 103),
(31, 0),
(32, 0),
(33, 103),
(34, 103),
(35, 103),
(36, 103),
(37, 103),
(38, 0),
(39, 0),
(40, 0),
(41, 107),
(41, 124),
(41, 125),
(41, 126),
(41, 127),
(41, 128),
(41, 129),
(41, 133),
(41, 134),
(41, 135),
(41, 140),
(41, 141),
(41, 142),
(41, 143),
(41, 144),
(41, 151),
(41, 155),
(41, 186),
(42, 103),
(42, 108),
(42, 109),
(42, 110),
(42, 111),
(42, 112),
(42, 113),
(42, 114),
(42, 115),
(42, 116),
(42, 117),
(42, 118),
(42, 119),
(42, 120),
(42, 121),
(42, 122),
(42, 123),
(43, 103),
(44, 103),
(48, 107),
(48, 124),
(48, 128),
(49, 107),
(49, 124),
(49, 128),
(50, 106),
(53, 102),
(54, 102),
(55, 102),
(57, 103),
(58, 103),
(59, 103),
(61, 103),
(62, 103),
(63, 103),
(64, 103),
(65, 103),
(70, 101),
(71, 103),
(72, 103),
(73, 103),
(74, 103),
(77, 108),
(77, 109),
(77, 110),
(77, 111),
(77, 112),
(77, 113),
(77, 114),
(77, 115),
(77, 116),
(77, 117),
(77, 118),
(77, 119),
(77, 120),
(77, 121),
(77, 122),
(77, 123),
(77, 132),
(77, 133),
(77, 134),
(77, 135),
(77, 140),
(77, 141),
(77, 142),
(77, 143),
(77, 144),
(80, 0),
(81, 0),
(82, 0),
(94, 0),
(95, 103),
(96, 101),
(97, 101),
(98, 101),
(99, 104),
(100, 101),
(100, 102),
(100, 104),
(100, 105),
(100, 106),
(100, 107),
(100, 108),
(100, 109),
(100, 110),
(100, 111),
(100, 112),
(100, 113),
(100, 114),
(100, 115),
(100, 116),
(100, 117),
(100, 118),
(100, 119),
(100, 120),
(100, 121),
(100, 122),
(100, 123),
(100, 124),
(100, 125),
(100, 126),
(100, 127),
(100, 128),
(100, 129),
(100, 132),
(100, 133),
(100, 134),
(100, 135),
(100, 136),
(100, 140),
(100, 141),
(100, 142),
(100, 143),
(100, 144),
(100, 151),
(100, 155),
(100, 161),
(100, 162),
(100, 163),
(100, 164),
(100, 165),
(100, 166),
(100, 167),
(100, 168),
(100, 185),
(100, 186),
(100, 189),
(100, 190),
(100, 191),
(100, 192),
(100, 193),
(100, 194),
(100, 195),
(100, 196),
(101, 101),
(101, 189),
(101, 190),
(101, 191),
(101, 192),
(101, 193),
(101, 194),
(101, 195),
(101, 196),
(102, 0),
(103, 101);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_newsfeeds`
--

DROP TABLE IF EXISTS `ek5d2_newsfeeds`;
CREATE TABLE IF NOT EXISTS `ek5d2_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_overrider`
--

DROP TABLE IF EXISTS `ek5d2_overrider`;
CREATE TABLE IF NOT EXISTS `ek5d2_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_postinstall_messages`
--

DROP TABLE IF EXISTS `ek5d2_postinstall_messages`;
CREATE TABLE IF NOT EXISTS `ek5d2_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) NOT NULL DEFAULT '',
  `language_extension` varchar(255) NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ek5d2_postinstall_messages`
--

INSERT INTO `ek5d2_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 700, 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY', 'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION', 'plg_twofactorauth_totp', 1, 'action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_action', 'site://plugins/twofactorauth/totp/postinstall/actions.php', 'twofactorauth_postinstall_condition', '3.2.0', 0),
(2, 700, 'COM_CPANEL_MSG_EACCELERATOR_TITLE', 'COM_CPANEL_MSG_EACCELERATOR_BODY', 'COM_CPANEL_MSG_EACCELERATOR_BUTTON', 'com_cpanel', 1, 'action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_action', 'admin://components/com_admin/postinstall/eaccelerator.php', 'admin_postinstall_eaccelerator_condition', '3.2.0', 1),
(3, 700, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 0),
(4, 700, 'COM_CPANEL_MSG_PHPVERSION_TITLE', 'COM_CPANEL_MSG_PHPVERSION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/phpversion.php', 'admin_postinstall_phpversion_condition', '3.2.2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_redirect_links`
--

DROP TABLE IF EXISTS `ek5d2_redirect_links`;
CREATE TABLE IF NOT EXISTS `ek5d2_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `ek5d2_redirect_links`
--

INSERT INTO `ek5d2_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/bgms/index.php/grades/index.php', '', 'http://localhost/bgms/index.php/grades/view-grades', '', 1, 0, '2014-04-30 14:30:20', '0000-00-00 00:00:00'),
(2, 'http://localhost/bgms/index.php/students/index.php', '', 'http://localhost/bgms/index.php/students/view-list', '', 1, 0, '2014-04-30 15:29:21', '0000-00-00 00:00:00'),
(3, 'http://localhost/bgms/index.php/students/1', '', 'http://localhost/bgms/index.php/students/view-list', '', 1, 0, '2014-05-01 14:43:30', '0000-00-00 00:00:00'),
(4, 'http://bgms.iedf.in/index.php/students/Photo-36.png', '', 'http://bgms.iedf.in/index.php/students/view-list?id=36', '', 1, 0, '2014-05-02 17:30:42', '0000-00-00 00:00:00'),
(5, 'http://bgms.iedf.in/index.php/students/Photo-36.jpg/Photo-36.png', '', 'http://bgms.iedf.in/index.php/students/view-list?id=36', '', 1, 0, '2014-05-02 17:33:14', '0000-00-00 00:00:00'),
(6, 'http://bgms.iedf.in/index.php/grades/index.php', '', 'http://bgms.iedf.in/index.php/grades/view-grades', '', 1, 0, '2014-05-03 08:02:08', '0000-00-00 00:00:00'),
(7, 'https://bgms.iedf.in/index.php/grades/images/blank.gif', '', 'https://bgms.iedf.in/index.php/grades/add-grades', '', 1, 0, '2014-05-03 15:39:44', '0000-00-00 00:00:00'),
(8, 'http://bgms.iedf.in/index.php/students/view-grades?id=7', '', '', '', 1, 0, '2014-05-04 09:47:44', '0000-00-00 00:00:00'),
(9, 'http://bgms.iedf.in/index.php/grades/1', '', 'http://bgms.iedf.in/index.php/grades/view-grades?studentId=1', '', 1, 0, '2014-05-04 15:54:55', '0000-00-00 00:00:00'),
(10, 'http://bgms.iedf.in/index.php/grades/view-list?id=1392', '', 'http://bgms.iedf.in/index.php/grades/view-grades?studentId=154', '', 1, 0, '2014-05-04 17:00:44', '0000-00-00 00:00:00'),
(11, 'http://bgms.iedf.in/index.php/grades/view-list?id=8', '', 'http://bgms.iedf.in/index.php/grades/view-grades', '', 1, 0, '2014-05-05 02:41:23', '0000-00-00 00:00:00'),
(12, 'https://bgms.iedf.in/index.php/students/index.php', '', 'https://bgms.iedf.in/index.php/students/view-list?id=81', '', 1, 0, '2014-05-05 08:04:13', '0000-00-00 00:00:00'),
(13, 'http://bgms.iedf.in/index.php/data.csv', '', 'http://bgms.iedf.in/index.php/reports', '', 1, 0, '2014-05-06 15:43:57', '0000-00-00 00:00:00'),
(14, 'http://bgms.iedf.in/index.php//view-grades?id=1254', '', 'http://bgms.iedf.in/index.php/reports?reportType=3&class=1&studentName=109&year=2013-14&examType=Final+Exam+%28100+marks%29', '', 1, 0, '2014-05-07 18:12:08', '0000-00-00 00:00:00'),
(15, 'http://bgms.iedf.in/index.php/view-grades?id=1254', '', 'http://bgms.iedf.in/index.php/reports?reportType=3&class=1&studentName=109&year=2013-14&examType=Final+Exam+%28100+marks%29', '', 1, 0, '2014-05-07 18:12:37', '0000-00-00 00:00:00'),
(16, 'http://bgms.iedf.in/index.php/student/view-list?id=118', '', 'http://bgms.iedf.in/index.php/grades/view-grades?id=1247', '', 1, 0, '2014-05-07 19:16:32', '0000-00-00 00:00:00'),
(17, 'http://bgms.iedf.in/index.php/sponsors', '', 'http://bgms.iedf.in/', '', 1, 0, '2014-05-09 09:12:34', '0000-00-00 00:00:00'),
(18, 'https://bgms.iedf.in/index.php/sponsors/index.php', '', 'https://bgms.iedf.in/index.php/sponsors/add-sponsor?id=19&chronoform=sponsorForm&event=submit', '', 1, 0, '2014-05-09 15:59:48', '0000-00-00 00:00:00'),
(19, 'https://bgms.iedf.in/index.php/sponsors/view-student?action=delete&id=200', '', '', '', 1, 0, '2014-05-09 16:18:40', '0000-00-00 00:00:00'),
(20, 'https://bgms.iedf.in/index.php/students/view-student?action=delete&id=200', '', '', '', 1, 0, '2014-05-09 16:18:53', '0000-00-00 00:00:00'),
(21, 'https://bgms.iedf.in/index.php/sponsors/itemLink?id=130', '', 'https://bgms.iedf.in/index.php/sponsors/view-sponsors?id=20', '', 1, 0, '2014-05-09 16:25:37', '0000-00-00 00:00:00'),
(22, 'http://bgms.iedf.in/index.php/students/view-list', '', 'http://bgms.iedf.in/', '', 1, 0, '2014-05-10 02:14:20', '0000-00-00 00:00:00'),
(23, 'http://bgms.iedf.in/index.php/students/view-sponsors?id=36', '', 'http://bgms.iedf.in/index.php/students/view-students?id=138', '', 1, 0, '2014-05-10 05:58:41', '0000-00-00 00:00:00'),
(24, 'http://bgms.iedf.in/index.php/students/view-sponsors?id=66', '', 'http://bgms.iedf.in/index.php/students/view-students?id=138', '', 1, 0, '2014-05-10 05:58:43', '0000-00-00 00:00:00'),
(25, 'http://bgms.iedf.in/index.php/students/index.php', '', 'http://bgms.iedf.in/index.php/students/view-students?id=138', '', 1, 0, '2014-05-10 06:58:32', '0000-00-00 00:00:00'),
(26, 'http://bgms.iedf.in/index.php/sponsors/index.php', '', 'http://bgms.iedf.in/index.php/sponsors/view-sponsors', '', 1, 0, '2014-05-10 06:59:08', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_schemas`
--

DROP TABLE IF EXISTS `ek5d2_schemas`;
CREATE TABLE IF NOT EXISTS `ek5d2_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_schemas`
--

INSERT INTO `ek5d2_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.2.3-2014-02-20');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_session`
--

DROP TABLE IF EXISTS `ek5d2_session`;
CREATE TABLE IF NOT EXISTS `ek5d2_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_session`
--

INSERT INTO `ek5d2_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('ae0afc1579e644c545793e89bd68ae34', 0, 0, '1399717759', '__default|a:8:{s:15:"session.counter";i:218;s:19:"session.timer.start";i:1399688057;s:18:"session.timer.last";i:1399717744;s:17:"session.timer.now";i:1399717759;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":27:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";s:2:"40";s:4:"name";s:6:"arvind";s:8:"username";s:6:"arvind";s:5:"email";s:17:"arvindpdmn@ov.com";s:8:"password";s:34:"$P$D6CcnNttxcRBecoH15AeFprf/2gbWn1";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"0";s:12:"registerDate";s:19:"2014-05-01 06:43:50";s:13:"lastvisitDate";s:19:"2014-05-09 18:32:26";s:10:"activation";s:0:"";s:6:"params";s:2:"{}";s:6:"groups";a:1:{i:2;s:1:"2";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:2;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;s:6:"otpKey";s:0:"";s:4:"otep";s:0:"";s:11:"cookieLogin";b:1;}s:13:"session.token";s:32:"c257cfaf98069ed1a8f87bdd9676bb14";}gcore|a:1:{s:4:"user";a:9:{s:2:"id";s:2:"40";s:4:"name";s:6:"arvind";s:8:"username";s:6:"arvind";s:5:"email";s:17:"arvindpdmn@ov.com";s:10:"last_login";s:19:"2014-05-09 18:32:26";s:9:"logged_in";b:1;s:5:"guest";i:0;s:6:"groups";a:1:{i:0;s:1:"2";}s:11:"inheritance";a:2:{i:0;s:1:"1";i:1;s:1:"0";}}}', 40, 'arvind');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_sponsorform`
--

DROP TABLE IF EXISTS `ek5d2_sponsorform`;
CREATE TABLE IF NOT EXISTS `ek5d2_sponsorform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sponsorUid` varchar(255) NOT NULL,
  `sponsoredStudents` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_studentform`
--

DROP TABLE IF EXISTS `ek5d2_studentform`;
CREATE TABLE IF NOT EXISTS `ek5d2_studentform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `dateOfBirth` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `studentUid` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `guardian` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=162 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_tags`
--

DROP TABLE IF EXISTS `ek5d2_tags`;
CREATE TABLE IF NOT EXISTS `ek5d2_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ek5d2_tags`
--

INSERT INTO `ek5d2_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '', '', '', '', 37, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_template_styles`
--

DROP TABLE IF EXISTS `ek5d2_template_styles`;
CREATE TABLE IF NOT EXISTS `ek5d2_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `ek5d2_template_styles`
--

INSERT INTO `ek5d2_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default-Fruit Shop', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Matuna Market ","sitedescription":"Fruit Shop Sample Site","navposition":"left","html5":"0"}'),
(7, 'yoo_master2', 0, '1', 'yoo_master2 - Default', '{"config":""}'),
(8, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(9, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(10, 'beez3', 0, '0', 'beez3 - Default', '{"wrapperSmall":53,"wrapperLarge":72,"logo":"","sitetitle":"","sitedescription":"","navposition":"center","bootstrap":"","templatecolor":"nature","headerImage":"","backgroundcolor":"#eee"}');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_ucm_base`
--

DROP TABLE IF EXISTS `ek5d2_ucm_base`;
CREATE TABLE IF NOT EXISTS `ek5d2_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_ucm_content`
--

DROP TABLE IF EXISTS `ek5d2_ucm_content`;
CREATE TABLE IF NOT EXISTS `ek5d2_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_ucm_history`
--

DROP TABLE IF EXISTS `ek5d2_ucm_history`;
CREATE TABLE IF NOT EXISTS `ek5d2_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_update_sites`
--

DROP TABLE IF EXISTS `ek5d2_update_sites`;
CREATE TABLE IF NOT EXISTS `ek5d2_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ek5d2_update_sites`
--

INSERT INTO `ek5d2_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1399689172, ''),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1399689172, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1399689172, '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_update_sites_extensions`
--

DROP TABLE IF EXISTS `ek5d2_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `ek5d2_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `ek5d2_update_sites_extensions`
--

INSERT INTO `ek5d2_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_updates`
--

DROP TABLE IF EXISTS `ek5d2_updates`;
CREATE TABLE IF NOT EXISTS `ek5d2_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  `extra_query` varchar(1000) DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=54 ;

--
-- Dumping data for table `ek5d2_updates`
--

INSERT INTO `ek5d2_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `extra_query`) VALUES
(1, 1, 700, 'Joomla', '', 'joomla', 'file', '', 0, '3.3.0', '', 'http://update.joomla.org/core/sts/extension_sts.xml', '', ''),
(2, 3, 0, 'Malay', '', 'pkg_ms-MY', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/ms-MY_details.xml', '', ''),
(3, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', '', ''),
(4, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', '', ''),
(5, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
(6, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', '', ''),
(7, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', '', ''),
(8, 3, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '3.2.0.1', '', 'http://update.joomla.org/language/details3/el-GR_details.xml', '', ''),
(9, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', '', ''),
(10, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', '', ''),
(11, 3, 0, 'EnglishAU', '', 'pkg_en-AU', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', '', ''),
(12, 3, 0, 'EnglishUS', '', 'pkg_en-US', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', '', ''),
(13, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', '', ''),
(14, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.2.0.1', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', '', ''),
(15, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', '', ''),
(16, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', '', ''),
(17, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', '', ''),
(18, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', '', ''),
(19, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
(20, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', '', ''),
(21, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', '', ''),
(22, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', '', ''),
(23, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', '', ''),
(24, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', '', ''),
(25, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', '', ''),
(26, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', '', ''),
(27, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', '', ''),
(28, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', '', ''),
(29, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.2.2.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', '', ''),
(30, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(31, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(32, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(33, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(34, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(35, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(36, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(37, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(38, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(39, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.2.0.6', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(40, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(41, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(42, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(43, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(44, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(45, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(46, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(47, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(48, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.3.0.2', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
(49, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', '', ''),
(50, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', '', ''),
(51, 3, 0, 'Montenegrin', '', 'pkg_srp-ME', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/srp-ME_details.xml', '', ''),
(52, 3, 0, 'EnglishCA', '', 'pkg_en-CA', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/en-CA_details.xml', '', ''),
(53, 3, 0, 'FrenchCA', '', 'pkg_fr-CA', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/fr-CA_details.xml', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_user_keys`
--

DROP TABLE IF EXISTS `ek5d2_user_keys`;
CREATE TABLE IF NOT EXISTS `ek5d2_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `series` varchar(255) NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) NOT NULL,
  `uastring` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ek5d2_user_keys`
--

INSERT INTO `ek5d2_user_keys` (`id`, `user_id`, `token`, `series`, `invalid`, `time`, `uastring`) VALUES
(3, 'arvind', '$P$DO5LgOlQHDhJmEAHs2RDPdJHgUR1K71', '5JjAU5EqPPsOLmBnxEgS', 0, '1404144299', '182632cbdd1707b48a338f2002e830a7'),
(5, 'arvind', '$P$DQO8G9a/gImXzKMw/lx2zptdshvB3s.', 'eBjbRtX5xF2bg7v6S9of', 0, '1404277990', '87ee68311f30a12059030769698a9518'),
(6, 'arvind', '$P$DynCAt9ga74iagetyjYl0eTdjC/aMd/', 'jJSZxAiPS1ZRAHj5CiAA', 0, '1404299233', '0fe98ce63d11a47ae17b3dd228652a71'),
(8, 'arvind', '$P$DGFGs8oETXRCHugbR7zf9BilqHDS8m0', 'vdncfLFKKAuTvbUghZSx', 0, '1404480845', '314cb5720105bd4127bc39bc3172c753'),
(9, 'arvind', '$P$DgZl.NoADD7icMGAg.Gi1391AFolCu.', 'kds7U67SRnRpjm4d74VT', 0, '1404724215', '8d5e6c037655b5c6fe3a6607b8667621');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_user_notes`
--

DROP TABLE IF EXISTS `ek5d2_user_notes`;
CREATE TABLE IF NOT EXISTS `ek5d2_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_user_profiles`
--

DROP TABLE IF EXISTS `ek5d2_user_profiles`;
CREATE TABLE IF NOT EXISTS `ek5d2_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_user_usergroup_map`
--

DROP TABLE IF EXISTS `ek5d2_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `ek5d2_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ek5d2_user_usergroup_map`
--

INSERT INTO `ek5d2_user_usergroup_map` (`user_id`, `group_id`) VALUES
(37, 8),
(40, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_usergroups`
--

DROP TABLE IF EXISTS `ek5d2_usergroups`;
CREATE TABLE IF NOT EXISTS `ek5d2_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `ek5d2_usergroups`
--

INSERT INTO `ek5d2_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_users`
--

DROP TABLE IF EXISTS `ek5d2_users`;
CREATE TABLE IF NOT EXISTS `ek5d2_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `ek5d2_users`
--

INSERT INTO `ek5d2_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`) VALUES
(37, 'Super User', 'webadmin', 'arvindpdmn@gmail.com', '$P$DayMKCjvSNqXzbatwx1Nb59YbEiDOq/', 0, 1, '2014-04-29 15:26:07', '2014-05-10 02:02:22', '0', '', '0000-00-00 00:00:00', 0, '', ''),
(40, 'arvind', 'arvind', 'arvindpdmn@ov.com', '$P$D6CcnNttxcRBecoH15AeFprf/2gbWn1', 0, 0, '2014-05-01 06:43:50', '2014-05-10 02:14:17', '', '{}', '0000-00-00 00:00:00', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_viewlevels`
--

DROP TABLE IF EXISTS `ek5d2_viewlevels`;
CREATE TABLE IF NOT EXISTS `ek5d2_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ek5d2_viewlevels`
--

INSERT INTO `ek5d2_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]'),
(5, 'Guest', 0, '[9]'),
(6, 'Super Users', 0, '[8]');

-- --------------------------------------------------------

--
-- Table structure for table `ek5d2_weblinks`
--

DROP TABLE IF EXISTS `ek5d2_weblinks`;
CREATE TABLE IF NOT EXISTS `ek5d2_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ek5d2_weblinks`
--

INSERT INTO `ek5d2_weblinks` (`id`, `catid`, `title`, `alias`, `url`, `description`, `hits`, `state`, `checked_out`, `checked_out_time`, `ordering`, `access`, `params`, `language`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `metakey`, `metadesc`, `metadata`, `featured`, `xreference`, `publish_up`, `publish_down`, `version`, `images`) VALUES
(1, 9, 'YOOtheme', 'yootheme', 'http://www.yootheme.com', '', 2, 1, 0, '0000-00-00 00:00:00', 1, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-22 12:45:30', 37, '', '2012-01-22 12:46:11', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, ''),
(2, 9, 'Icons', 'icons', 'http://www.yootheme.com/icons', '', 0, 1, 0, '0000-00-00 00:00:00', 2, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-22 12:45:46', 37, '', '2012-01-22 12:46:06', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, ''),
(3, 9, 'ZOO', 'zoo', 'http://www.yootheme.com/zoo', '', 0, 1, 0, '0000-00-00 00:00:00', 3, 1, '{"target":"","width":"","height":"","count_clicks":""}', '*', '2012-01-22 12:45:58', 37, '', '2012-01-22 12:46:15', 42, '', '', '', 0, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
