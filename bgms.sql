-- phpMyAdmin SQL Dump
-- version 
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2014 at 09:21 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=160 ;

--
-- Dumping data for table `ek5d2_assets`
--

INSERT INTO `ek5d2_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 490, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":[],"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
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
(18, 1, 93, 94, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 95, 98, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 99, 100, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 101, 102, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 103, 104, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 105, 106, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 107, 108, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 109, 114, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 115, 116, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 20, 49, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 96, 97, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 110, 111, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
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
(57, 25, 112, 113, 2, 'com_weblinks.category.9', 'YOOtheme Links', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(59, 1, 456, 457, 1, 'com_finder', 'com_finder', '{"core.admin":[],"core.manage":[]}'),
(63, 1, 460, 461, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":{"8":1},"core.manage":{"7":1},"core.delete":{"6":1},"core.edit.state":{"6":1,"5":1}}'),
(65, 1, 462, 463, 1, '#__ucm_content.1', '#__ucm_content.1', '[]'),
(66, 1, 464, 465, 1, '#__ucm_content.2', '#__ucm_content.2', '[]'),
(67, 1, 466, 467, 1, '#__ucm_content.3', '#__ucm_content.3', '[]'),
(68, 1, 468, 469, 1, '#__ucm_content.4', '#__ucm_content.4', '[]'),
(69, 1, 470, 471, 1, '#__ucm_content.5', '#__ucm_content.5', '[]'),
(70, 1, 472, 473, 1, '#__ucm_content.6', '#__ucm_content.6', '[]'),
(71, 1, 474, 475, 1, 'com_tags', 'com_tags', '{}'),
(72, 1, 476, 477, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(73, 1, 478, 479, 1, 'com_ajax', 'com_ajax', '{}'),
(74, 1, 480, 481, 1, 'com_postinstall', 'com_postinstall', '{}'),
(75, 18, 94, 95, 2, 'com_modules.module.1', 'Main Menu', ''),
(76, 18, 96, 97, 2, 'com_modules.module.17', 'Breadcrumbs', ''),
(77, 18, 98, 99, 2, 'com_modules.module.19', 'Bottom A', ''),
(78, 18, 100, 101, 2, 'com_modules.module.20', 'Bottom A', ''),
(79, 18, 102, 103, 2, 'com_modules.module.21', 'Bottom A', ''),
(80, 18, 104, 105, 2, 'com_modules.module.22', 'Bottom A', ''),
(81, 18, 106, 107, 2, 'com_modules.module.23', 'Fast and lightweight', ''),
(82, 18, 108, 109, 2, 'com_modules.module.24', 'Responsive design', ''),
(83, 18, 110, 111, 2, 'com_modules.module.25', 'Supported systems', ''),
(84, 18, 112, 113, 2, 'com_modules.module.26', 'Frequent updates', ''),
(85, 18, 114, 115, 2, 'com_modules.module.27', 'Bottom B', ''),
(86, 18, 116, 117, 2, 'com_modules.module.28', 'Bottom B', ''),
(87, 18, 118, 119, 2, 'com_modules.module.29', 'Bottom B', ''),
(88, 18, 120, 121, 2, 'com_modules.module.30', 'Bottom B', ''),
(89, 18, 122, 123, 2, 'com_modules.module.31', 'Footer Menu', ''),
(90, 18, 124, 125, 2, 'com_modules.module.32', 'Footer', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(91, 18, 126, 127, 2, 'com_modules.module.33', 'Headerbar', ''),
(92, 18, 128, 129, 2, 'com_modules.module.34', 'Main Bottom', ''),
(93, 18, 130, 131, 2, 'com_modules.module.35', 'Main Bottom', ''),
(94, 18, 132, 133, 2, 'com_modules.module.36', ' Main Top', ''),
(95, 18, 134, 135, 2, 'com_modules.module.37', 'Main Top', ''),
(96, 18, 136, 137, 2, 'com_modules.module.38', 'Logo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(97, 18, 138, 139, 2, 'com_modules.module.39', 'Login', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(98, 18, 140, 141, 2, 'com_modules.module.40', 'Search', ''),
(99, 18, 142, 143, 2, 'com_modules.module.41', 'Sub Menu', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(100, 18, 144, 145, 2, 'com_modules.module.42', 'Sidebar Menu', ''),
(101, 18, 146, 147, 2, 'com_modules.module.43', 'Sidebar A', ''),
(102, 18, 148, 149, 2, 'com_modules.module.44', 'Sidebar A', ''),
(103, 18, 150, 151, 2, 'com_modules.module.48', 'Latest News', ''),
(104, 18, 152, 153, 2, 'com_modules.module.49', 'Login', ''),
(105, 18, 154, 155, 2, 'com_modules.module.50', 'Download ZOO', ''),
(106, 18, 156, 157, 2, 'com_modules.module.53', 'Warp Framework', ''),
(107, 18, 158, 159, 2, 'com_modules.module.54', 'Joomla & WordPress', ''),
(108, 18, 160, 161, 2, 'com_modules.module.55', 'UIkit', ''),
(109, 18, 162, 163, 2, 'com_modules.module.57', 'Sidebar B', ''),
(110, 18, 164, 165, 2, 'com_modules.module.58', 'Sidebar B', ''),
(111, 18, 166, 167, 2, 'com_modules.module.59', 'Sidebar B', ''),
(112, 18, 168, 169, 2, 'com_modules.module.61', 'Top Menu', ''),
(113, 18, 170, 171, 2, 'com_modules.module.62', 'Top A', ''),
(114, 18, 172, 173, 2, 'com_modules.module.63', 'Top A', ''),
(115, 18, 174, 175, 2, 'com_modules.module.64', 'Top A', ''),
(116, 18, 176, 177, 2, 'com_modules.module.65', 'Top A', ''),
(121, 18, 178, 179, 2, 'com_modules.module.70', 'Home Photo', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(122, 18, 180, 181, 2, 'com_modules.module.71', 'Top B', ''),
(123, 18, 182, 183, 2, 'com_modules.module.72', 'Top B', ''),
(124, 18, 184, 185, 2, 'com_modules.module.73', 'Top B', ''),
(125, 18, 186, 187, 2, 'com_modules.module.74', 'Top B', ''),
(127, 18, 190, 191, 2, 'com_modules.module.76', 'Twitter List', ''),
(128, 18, 192, 193, 2, 'com_modules.module.77', 'Get Widgetkit', ''),
(129, 18, 194, 195, 2, 'com_modules.module.78', 'Twitter Bubbles', ''),
(130, 18, 196, 197, 2, 'com_modules.module.79', 'Twitter Single', ''),
(131, 18, 198, 199, 2, 'com_modules.module.82', 'Finder', ''),
(132, 18, 200, 201, 2, 'com_modules.module.83', 'ZOO Item', ''),
(133, 18, 202, 203, 2, 'com_modules.module.84', 'ZOO Comment', ''),
(134, 18, 204, 205, 2, 'com_modules.module.85', 'ZOO Tag', ''),
(135, 18, 206, 207, 2, 'com_modules.module.86', 'ZOO Category', ''),
(136, 18, 208, 209, 2, 'com_modules.module.88', 'App Bundle', ''),
(141, 18, 210, 211, 2, 'com_modules.module.94', 'Offcanvas Menu', ''),
(142, 18, 212, 213, 2, 'com_modules.module.95', 'Offcanvas', ''),
(143, 18, 214, 215, 2, 'com_modules.module.96', 'Students', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(144, 18, 216, 217, 2, 'com_modules.module.97', 'Grades', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(145, 18, 218, 219, 2, 'com_modules.module.98', 'Reports', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(146, 18, 220, 221, 2, 'com_modules.module.99', 'Features UIkit', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(147, 18, 222, 223, 2, 'com_modules.module.100', 'Social Icons', ''),
(148, 18, 224, 225, 2, 'com_modules.module.101', 'Home features', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(149, 18, 226, 227, 2, 'com_modules.module.102', 'Logo small', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(150, 27, 45, 46, 3, 'com_content.article.13', 'Widgetkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(151, 32, 65, 66, 3, 'com_content.article.24', 'UIkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(152, 1, 482, 483, 1, '#__ucm_content.7', '#__ucm_content.7', '[]'),
(153, 32, 67, 68, 3, 'com_content.article.25', 'Pagekit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(154, 1, 484, 485, 1, '#__ucm_content.8', '#__ucm_content.8', '[]'),
(155, 32, 69, 70, 3, 'com_content.article.23', 'Widgetkit', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(156, 32, 71, 72, 3, 'com_content.article.26', 'Free Halloween Icons', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(157, 1, 486, 487, 1, '#__ucm_content.9', '#__ucm_content.9', '[]'),
(158, 1, 488, 489, 1, 'com_chronoforms5', 'com_chronoforms5', '{}'),
(159, 27, 47, 48, 3, 'com_content.article.27', 'Blank', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `ek5d2_chronoengine_chronoforms`
--

INSERT INTO `ek5d2_chronoengine_chronoforms` (`id`, `title`, `params`, `extras`, `published`, `app`, `form_type`, `content`) VALUES
(1, 'studentForm', '{"description":"Details of each student.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTo0OntzOjY6ImZpZWxkcyI7YToxMzp7aToxO2E6MTg6e3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjI6ImlkIjtzOjQ6Im5hbWUiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo5OiJGdWxsIG5hbWUiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjE6IjEiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aToxMTthOjE4OntzOjQ6Im5hbWUiO3M6MTE6ImRhdGVPZkJpcnRoIjtzOjI6ImlkIjtzOjExOiJkYXRlT2ZCaXJ0aCI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEzOiJEYXRlIG9mIEJpcnRoIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czoyMjoiJ2FsaWFzJyA6ICdkZC9tbS95eXl5JyI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjI7YToxODp7czo0OiJuYW1lIjtzOjM6ImFnZSI7czoyOiJpZCI7czozOiJhZ2UiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czozOiJBZ2UiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czoxOiIxIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MToiMSI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTozO2E6MjA6e3M6NDoibmFtZSI7czozOiJzZXgiO3M6MjoiaWQiO3M6Mzoic2V4IjtzOjc6Im9wdGlvbnMiO3M6MjQ6IkZlbWFsZT1GZW1hbGUNCk1hbGU9TWFsZSI7czo1OiJlbXB0eSI7czowOiIiO3M6NjoidmFsdWVzIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MzoiU2V4IjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjEwO2E6MTg6e3M6NDoibmFtZSI7czoxNToiYWRtaXNzaW9uTnVtYmVyIjtzOjI6ImlkIjtzOjE1OiJhZG1pc3Npb25OdW1iZXIiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiQWRtaXNzaW9uIE5vLiI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6OTthOjE4OntzOjQ6Im5hbWUiO3M6MTA6InN0dWRlbnRVaWQiO3M6MjoiaWQiO3M6MTA6InN0dWRlbnRVaWQiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMDoiU3R1ZGVudCBJRCI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjE6IjEiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjE6IjEiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjg7YToyMDp7czo0OiJuYW1lIjtzOjU6ImNsYXNzIjtzOjI6ImlkIjtzOjU6ImNsYXNzIjtzOjc6Im9wdGlvbnMiO3M6NjA6IjE9SQ0KMj1JSQ0KMz1JSUkNCjQ9SVYNCjU9Vg0KNj1WSQ0KNz1WSUkNCjg9VklJSQ0KOT1JWA0KMTA9WCI7czo1OiJlbXB0eSI7czowOiIiO3M6NjoidmFsdWVzIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6NToiQ2xhc3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjg6Im11bHRpcGxlIjtzOjE6IjAiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6ODoiZHJvcGRvd24iO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjM6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO31zOjEyOiJkeW5hbWljX2RhdGEiO2E6NDp7czo3OiJlbmFibGVkIjtzOjA6IiI7czo5OiJkYXRhX3BhdGgiO3M6MDoiIjtzOjk6InZhbHVlX2tleSI7czowOiIiO3M6ODoidGV4dF9rZXkiO3M6MDoiIjt9czo2OiJldmVudHMiO2E6MTp7aTowO2E6NTp7czo4OiJvcGVyYXRvciI7czoxOiI9IjtzOjU6InN0YXRlIjtzOjA6IiI7czo2OiJhY3Rpb24iO3M6MDoiIjtzOjY6InRhcmdldCI7czowOiIiO3M6Nzoib3B0aW9ucyI7czowOiIiO319fWk6NzthOjIwOntzOjQ6Im5hbWUiO3M6NToiZ3JvdXAiO3M6MjoiaWQiO3M6NToiZ3JvdXAiO3M6Nzoib3B0aW9ucyI7czo1NjoiQXphZD1BemFkDQpCaGFnYXRoPUJoYWdhdGgNClN1Ymhhc2g9U3ViaGFzaA0KVml2ZWs9Vml2ZWsiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjU6Ikdyb3VwIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjQ7YToxODp7czo0OiJuYW1lIjtzOjY6InBhcmVudCI7czoyOiJpZCI7czo2OiJwYXJlbnQiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiUGFyZW50J3MgTmFtZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czoxOiIxIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6NTthOjE4OntzOjQ6Im5hbWUiO3M6ODoiZ3VhcmRpYW4iO3M6MjoiaWQiO3M6ODoiZ3VhcmRpYW4iO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxNToiR3VhcmRpYW4ncyBOYW1lIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjE6IjEiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjA6IiI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTo2O2E6MTg6e3M6NDoibmFtZSI7czo3OiJzcG9uc29yIjtzOjI6ImlkIjtzOjc6InNwb25zb3IiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxNDoiU3BvbnNvcidzIE5hbWUiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MToiMSI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjEzO2E6MTM6e3M6NDoibmFtZSI7czo1OiJwaG90byI7czoyOiJpZCI7czo1OiJwaG90byI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTI6IlVwbG9hZCBQaG90byI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoiZmlsZSI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiaW1hZ2UiO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aToxMjthOjEwOntzOjExOiJyZW5kZXJfdHlwZSI7czo2OiJzdWJtaXQiO3M6NDoibmFtZSI7czoxMzoic3R1ZGVudFN1Ym1pdCI7czoyOiJpZCI7czoxMzoic3R1ZGVudFN1Ym1pdCI7czo0OiJ0eXBlIjtzOjY6InN1Ym1pdCI7czo1OiJ2YWx1ZSI7czo0OiJTYXZlIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjt9fXM6MTQ6ImFjdGlvbnNfY29uZmlnIjthOjU6e2k6MTA7YTo5OntzOjc6ImVuYWJsZWQiO3M6MToiMSI7czo5OiJ0YWJsZW5hbWUiO3M6MTc6ImVrNWQyX3N0dWRlbnRmb3JtIjtzOjEwOiJtdWx0aV9yZWFkIjtzOjE6IjAiO3M6MTg6ImxvYWRfdW5kZXJfbW9kZWxpZCI7czoxOiIwIjtzOjg6Im1vZGVsX2lkIjtzOjQ6IkRhdGEiO3M6NjoiZmllbGRzIjtzOjA6IiI7czo1OiJvcmRlciI7czowOiIiO3M6NToiZ3JvdXAiO3M6MDoiIjtzOjEwOiJjb25kaXRpb25zIjtzOjEyMToiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcmV0dXJuIHNob3dTdHVkZW50Rm9ybVRpdGxlKCk7DQo/PiI7fWk6MDthOjk6e3M6NDoicGFnZSI7czoxOiIxIjtzOjEyOiJzdWJtaXRfZXZlbnQiO3M6Njoic3VibWl0IjtzOjExOiJmb3JtX21ldGhvZCI7czo0OiJmaWxlIjtzOjEwOiJhY3Rpb25fdXJsIjtzOjA6IiI7czoxMDoiZm9ybV9jbGFzcyI7czoxMDoiY2hyb25vZm9ybSI7czoxNToiZm9ybV90YWdfYXR0YWNoIjtzOjA6IiI7czoyNDoicmVxdWlyZWRfbGFiZWxzX2lkZW50aWZ5IjtzOjE6IjEiO3M6MTI6InJlbGF0aXZlX3VybCI7czoxOiIxIjtzOjExOiJhamF4X3N1Ym1pdCI7czoxOiIwIjt9aTo0O2E6NTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6OToidGFibGVuYW1lIjtzOjE3OiJlazVkMl9zdHVkZW50Zm9ybSI7czoxODoic2F2ZV91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6MTA6Im11bHRpX3NhdmUiO3M6MToiMCI7czo4OiJtb2RlbF9pZCI7czo0OiJEYXRhIjt9aTo2O2E6OTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6NToiZmlsZXMiO3M6MTc6InBob3RvOmpwZy1wbmctZ2lmIjtzOjExOiJ1cGxvYWRfcGF0aCI7czowOiIiO3M6ODoibWF4X3NpemUiO3M6MzoiMjAwIjtzOjg6Im1pbl9zaXplIjtzOjE6IjAiO3M6OToibWF4X2Vycm9yIjtzOjU3OiJTb3JyeSwgWW91ciB1cGxvYWRlZCBmaWxlIHNpemUgZXhjZWVkcyB0aGUgYWxsb3dlZCBsaW1pdC4iO3M6OToibWluX2Vycm9yIjtzOjYyOiJTb3JyeSwgWW91ciB1cGxvYWRlZCBmaWxlIHNpemUgaXMgbGVzcyB0aGFuIHRoZSBtaW5pbXVtIGxpbWl0LiI7czoxMDoidHlwZV9lcnJvciI7czo0NjoiU29ycnksIFlvdXIgdXBsb2FkZWQgZmlsZSB0eXBlIGlzIG5vdCBhbGxvd2VkLiI7czoyMDoiZXh0ZW5zaW9uc19zZXBhcmF0b3IiO3M6MToiLSI7fWk6MjthOjE6e3M6NzoiY29udGVudCI7czoxMTc6Ijw/cGhwDQpyZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFIC5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCm1zZ1Bvc3RGb3JtU3VibWl0KCdzdHVkZW50Jyk7DQo/PiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6Mjp7czoxMDoiZGJfcmVhZF8xMCI7czowOiIiO3M6NjoiaHRtbF8wIjtzOjA6IiI7fXM6Njoic3VibWl0IjthOjM6e3M6OToiZGJfc2F2ZV80IjtzOjA6IiI7czoxMzoiZmlsZV91cGxvYWRfNiI7YToyOntzOjc6InN1Y2Nlc3MiO3M6MDoiIjtzOjQ6ImZhaWwiO3M6MDoiIjt9czoxMzoiY3VzdG9tX2NvZGVfMiI7czowOiIiO319czoxNDoiZGJfZmllbGRzX2xpc3QiO2E6MTp7czoxNzoiZWs1ZDJfc3R1ZGVudGZvcm0iO3M6MjQ5OiJpZD1pZA0KY3JlYXRlZD1jcmVhdGVkDQptb2RpZmllZD1tb2RpZmllZA0KbmFtZT1uYW1lDQpkYXRlT2ZCaXJ0aD1kYXRlT2ZCaXJ0aA0KYWdlPWFnZQ0Kc2V4PXNleA0KYWRtaXNzaW9uTnVtYmVyPWFkbWlzc2lvbk51bWJlcg0Kc3R1ZGVudFVpZD1zdHVkZW50VWlkDQpjbGFzcz1jbGFzcw0KZ3JvdXBOYW1lPWdyb3VwTmFtZQ0KcGFyZW50PXBhcmVudA0KZ3VhcmRpYW49Z3VhcmRpYW4NCnNwb25zb3I9c3BvbnNvcg0KcGhvdG89cGhvdG8iO319', 1, '', 1, '<div class="form-group gcore-form-row" id="form-row-2"><label for="name" class="control-label gcore-label-left">Full name</label>\n<div class="gcore-input gcore-display-table" id="fin-name"><input name="name" id="name" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-4"><label for="dateOfBirth" class="control-label gcore-label-left">Date of Birth</label>\n<div class="gcore-input gcore-display-table" id="fin-dateOfBirth"><input name="dateOfBirth" id="dateOfBirth" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;] form-control A" title="" style="" data-inputmask="&#039;alias&#039; : &#039;dd/mm/yyyy&#039;" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-6"><label for="age" class="control-label gcore-label-left">Age</label>\n<div class="gcore-input gcore-display-table" id="fin-age"><input name="age" id="age" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-7"><label for="sex" class="control-label gcore-label-left">Sex</label>\n<div class="gcore-input gcore-display-table" id="fin-sex"><select name="sex" id="sex" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Female">Female</option>\n<option value="Male">Male</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-9"><label for="admissionNumber" class="control-label gcore-label-left">Admission No.</label>\n<div class="gcore-input gcore-display-table" id="fin-admissionNumber"><input name="admissionNumber" id="admissionNumber" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-11"><label for="studentUid" class="control-label gcore-label-left">Student ID</label>\n<div class="gcore-input gcore-display-table" id="fin-studentUid"><input name="studentUid" id="studentUid" value="" placeholder="" maxlength="" size="" class="validate[&#039;required&#039;,&#039;alphanum&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-12"><label for="class" class="control-label gcore-label-left">Class</label>\n<div class="gcore-input gcore-display-table" id="fin-class"><select name="class" id="class" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="1">I</option>\n<option value="2">II</option>\n<option value="3">III</option>\n<option value="4">IV</option>\n<option value="5">V</option>\n<option value="6">VI</option>\n<option value="7">VII</option>\n<option value="8">VIII</option>\n<option value="9">IX</option>\n<option value="10">X</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-13"><label for="group" class="control-label gcore-label-left">Group</label>\n<div class="gcore-input gcore-display-table" id="fin-group"><select name="group" id="group" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Azad">Azad</option>\n<option value="Bhagath">Bhagath</option>\n<option value="Subhash">Subhash</option>\n<option value="Vivek">Vivek</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-15"><label for="parent" class="control-label gcore-label-left">Parent''s Name</label>\n<div class="gcore-input gcore-display-table" id="fin-parent"><input name="parent" id="parent" value="" placeholder="" maxlength="" size="" class="validate[&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-17"><label for="guardian" class="control-label gcore-label-left">Guardian''s Name</label>\n<div class="gcore-input gcore-display-table" id="fin-guardian"><input name="guardian" id="guardian" value="" placeholder="" maxlength="" size="" class="validate[&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-19"><label for="sponsor" class="control-label gcore-label-left">Sponsor''s Name</label>\n<div class="gcore-input gcore-display-table" id="fin-sponsor"><input name="sponsor" id="sponsor" value="" placeholder="" maxlength="" size="" class="validate[&#039;alpha&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-20"><label for="photo" class="control-label gcore-label-left">Upload Photo</label>\n<div class="gcore-input gcore-display-table" id="fin-photo"><input name="photo" id="photo" class="form-control gcore-height-auto A" title="" style="" data-load-state="" data-tooltip="" type="file" /></div></div><div class="form-group gcore-form-row" id="form-row-21"><div class="gcore-input gcore-display-table" id="fin-studentSubmit"><input name="studentSubmit" id="studentSubmit" type="submit" value="Save" class="form-control A" style="" data-load-state="" /></div></div>'),
(2, 'gradesForm', '{"description":"Student grades from a particular exam captured in a single record for all subjects.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTo0OntzOjY6ImZpZWxkcyI7YToxNzp7aToyMTthOjIwOntzOjQ6Im5hbWUiO3M6NToiY2xhc3MiO3M6MjoiaWQiO3M6NToiY2xhc3MiO3M6Nzoib3B0aW9ucyI7czo2MDoiMT1JDQoyPUlJDQozPUlJSQ0KND1JVg0KNT1WDQo2PVZJDQo3PVZJSQ0KOD1WSUlJDQo5PUlYDQoxMD1YIjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo1OiJDbGFzcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToyMjthOjIwOntzOjQ6Im5hbWUiO3M6MTE6InN0dWRlbnROYW1lIjtzOjI6ImlkIjtzOjExOiJzdHVkZW50TmFtZSI7czo3OiJvcHRpb25zIjtzOjA6IiI7czo1OiJlbXB0eSI7czowOiIiO3M6NjoidmFsdWVzIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTI6IlN0dWRlbnQgTmFtZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToyMzthOjc6e3M6NDoibmFtZSI7czo5OiJzdHVkZW50SWQiO3M6MjoiaWQiO3M6OToic3R1ZGVudElkIjtzOjU6InZhbHVlIjtzOjI6Ii0xIjtzOjU6ImxhYmVsIjtzOjEwOiJTdHVkZW50IElEIjtzOjY6InBhcmFtcyI7czowOiIiO3M6NDoidHlwZSI7czo2OiJoaWRkZW4iO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjt9aToxOTthOjIwOntzOjQ6Im5hbWUiO3M6NDoieWVhciI7czoyOiJpZCI7czo0OiJ5ZWFyIjtzOjc6Im9wdGlvbnMiO3M6MzI6IjIwMTQtMTU9MjAxNC0xNQ0KMjAxMy0xND0yMDEzLTE0IjtzOjU6ImVtcHR5IjtzOjA6IiI7czo2OiJ2YWx1ZXMiO3M6MTU6IjIwMTQtMTU9MjAxNC0xNSI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6NDoiWWVhciI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToxNzthOjIwOntzOjQ6Im5hbWUiO3M6ODoiZXhhbVR5cGUiO3M6MjoiaWQiO3M6ODoiZXhhbVR5cGUiO3M6Nzoib3B0aW9ucyI7czoyNDQ6IlRlc3QgMSAoMjUgbWFya3MpPVRlc3QgMSAoMjUgbWFya3MpDQpUZXN0IDIgKDI1IG1hcmtzKT1UZXN0IDIgKDI1IG1hcmtzKQ0KTWlkdGVybSBFeGFtICgxMDAgbWFya3MpPU1pZHRlcm0gRXhhbSAoMTAwIG1hcmtzKQ0KVGVzdCAzICgyNSBtYXJrcyk9VGVzdCAzICgyNSBtYXJrcykNClRlc3QgNCAoMjUgbWFya3MpPVRlc3QgNCAoMjUgbWFya3MpDQpGaW5hbCBFeGFtICgxMDAgbWFya3MpPUZpbmFsIEV4YW0gKDEwMCBtYXJrcykiO3M6NToiZW1wdHkiO3M6MDoiIjtzOjY6InZhbHVlcyI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEwOiJBc3Nlc3NtZW50IjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czo4OiJtdWx0aXBsZSI7czoxOiIwIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjg6ImRyb3Bkb3duIjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YTozOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9czoxMjoiZHluYW1pY19kYXRhIjthOjQ6e3M6NzoiZW5hYmxlZCI7czowOiIiO3M6OToiZGF0YV9wYXRoIjtzOjA6IiI7czo5OiJ2YWx1ZV9rZXkiO3M6MDoiIjtzOjg6InRleHRfa2V5IjtzOjA6IiI7fXM6NjoiZXZlbnRzIjthOjE6e2k6MDthOjU6e3M6ODoib3BlcmF0b3IiO3M6MToiPSI7czo1OiJzdGF0ZSI7czowOiIiO3M6NjoiYWN0aW9uIjtzOjA6IiI7czo2OiJ0YXJnZXQiO3M6MDoiIjtzOjc6Im9wdGlvbnMiO3M6MDoiIjt9fX1pOjI7YToxODp7czo0OiJuYW1lIjtzOjEyOiJrYW5uYWRhTWFya3MiO3M6MjoiaWQiO3M6MTI6Imthbm5hZGFNYXJrcyI7czo1OiJ2YWx1ZSI7czowOiIiO3M6NToibGFiZWwiO2E6Mjp7czo0OiJ0ZXh0IjtzOjEzOiJLYW5uYWRhIE1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MToiMSI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aTozO2E6MTg6e3M6NDoibmFtZSI7czoxMjoiZW5nbGlzaE1hcmtzIjtzOjI6ImlkIjtzOjEyOiJlbmdsaXNoTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMzoiRW5nbGlzaCBNYXJrcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czowOiIiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjE6IjEiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6NDthOjE4OntzOjQ6Im5hbWUiO3M6MTA6ImhpbmRpTWFya3MiO3M6MjoiaWQiO3M6MTA6ImhpbmRpTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMToiSGluZGkgTWFya3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czoxOiIxIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjU7YToxODp7czo0OiJuYW1lIjtzOjk6Im1hdGhNYXJrcyI7czoyOiJpZCI7czo5OiJtYXRoTWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxNzoiTWF0aGVtYXRpY3MgTWFya3MiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czoxNToiOmRhdGEtaW5wdXRtYXNrIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czoxOiIxIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjY7YToxODp7czo0OiJuYW1lIjtzOjE5OiJnZW5lcmFsU2NpZW5jZU1hcmtzIjtzOjI6ImlkIjtzOjE5OiJnZW5lcmFsU2NpZW5jZU1hcmtzIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MjE6IkdlbmVyYWwgU2NpZW5jZSBNYXJrcyI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MDoiIjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjA6IiI7czo0OiJ0eXBlIjtzOjQ6InRleHQiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjEyOntzOjg6InJlcXVpcmVkIjtzOjA6IiI7czo1OiJhbHBoYSI7czowOiIiO3M6ODoiYWxwaGFudW0iO3M6MDoiIjtzOjU6ImRpZ2l0IjtzOjE6IjEiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6NzthOjE4OntzOjQ6Im5hbWUiO3M6MTg6InNvY2lhbFN0dWRpZXNNYXJrcyI7czoyOiJpZCI7czoxODoic29jaWFsU3R1ZGllc01hcmtzIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MjA6IlNvY2lhbCBTdHVkaWVzIE1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjk6Im1heGxlbmd0aCI7czowOiIiO3M6NDoic2l6ZSI7czowOiIiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MToiMSI7czo3OiJub2RpZ2l0IjtzOjA6IiI7czo2OiJudW1iZXIiO3M6MDoiIjtzOjU6ImVtYWlsIjtzOjA6IiI7czo1OiJwaG9uZSI7czowOiIiO3M6MTE6InBob25lX2ludGVyIjtzOjA6IiI7czozOiJ1cmwiO3M6MDoiIjtzOjc6ImNvbmZpcm0iO3M6MDoiIjtzOjY6ImN1c3RvbSI7czowOiIiO319aToxMDthOjE4OntzOjQ6Im5hbWUiO3M6MTU6ImNvbXB1dGVyU2NpZW5jZSI7czoyOiJpZCI7czoxNToiY29tcHV0ZXJTY2llbmNlIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTY6IkNvbXB1dGVyIFNjaWVuY2UiO3M6ODoicG9zaXRpb24iO3M6NDoibGVmdCI7fXM6ODoic3VibGFiZWwiO3M6MDoiIjtzOjExOiJwbGFjZWhvbGRlciI7czowOiIiO3M6OToibWF4bGVuZ3RoIjtzOjA6IiI7czo0OiJzaXplIjtzOjI6IjM3IjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjE1OiI6ZGF0YS1pbnB1dG1hc2siO3M6MDoiIjtzOjY6InBhcmFtcyI7czowOiIiO3M6MTY6IjpkYXRhLWxvYWQtc3RhdGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS10b29sdGlwIjtzOjkxOiJFbnRlciBhIGRlc2NyaXB0aXZlIGFzc2Vzc21lbnQuIEV4YW1wbGUsICJHb29kIHByb2dyZXNzLiBGdXJ0aGVyIGltcHJvdmVtZW50cyBpcyBwb3NzaWJsZS4iIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjExO2E6MTg6e3M6NDoibmFtZSI7czoxNzoicGh5c2ljYWxFZHVjYXRpb24iO3M6MjoiaWQiO3M6MTc6InBoeXNpY2FsRWR1Y2F0aW9uIjtzOjU6InZhbHVlIjtzOjA6IiI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6MTg6IlBoeXNpY2FsIEVkdWNhdGlvbiI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MjoiMzciO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6OTE6IkVudGVyIGEgZGVzY3JpcHRpdmUgYXNzZXNzbWVudC4gRXhhbXBsZSwgIkdvb2QgcHJvZ3Jlc3MuIEZ1cnRoZXIgaW1wcm92ZW1lbnRzIGlzIHBvc3NpYmxlLiIiO3M6NDoidHlwZSI7czo0OiJ0ZXh0IjtzOjEyOiJjb250YWluZXJfaWQiO3M6MToiMCI7czoxMDoidmFsaWRhdGlvbiI7YToxMjp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NToiYWxwaGEiO3M6MDoiIjtzOjg6ImFscGhhbnVtIjtzOjA6IiI7czo1OiJkaWdpdCI7czowOiIiO3M6Nzoibm9kaWdpdCI7czowOiIiO3M6NjoibnVtYmVyIjtzOjA6IiI7czo1OiJlbWFpbCI7czowOiIiO3M6NToicGhvbmUiO3M6MDoiIjtzOjExOiJwaG9uZV9pbnRlciI7czowOiIiO3M6MzoidXJsIjtzOjA6IiI7czo3OiJjb25maXJtIjtzOjA6IiI7czo2OiJjdXN0b20iO3M6MDoiIjt9fWk6MTU7YToyMDp7czo0OiJuYW1lIjtzOjc6ImNvbmR1Y3QiO3M6MjoiaWQiO3M6NzoiY29uZHVjdCI7czo3OiJvcHRpb25zIjtzOjY1OiJFeGNlbGxlbnQ9RXhjZWxsZW50DQpHb29kPUdvb2QNCk5lZWRzIHRvIGltcHJvdmU9TmVlZHMgdG8gaW1wcm92ZSI7czo1OiJlbXB0eSI7czowOiIiO3M6NjoidmFsdWVzIjtzOjk6Ikdvb2Q9R29vZCI7czo1OiJsYWJlbCI7YToyOntzOjQ6InRleHQiO3M6NzoiQ29uZHVjdCI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6ODoibXVsdGlwbGUiO3M6MToiMCI7czo0OiJzaXplIjtzOjA6IiI7czo1OiJjbGFzcyI7czowOiIiO3M6NToidGl0bGUiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMzoiOmRhdGEtdG9vbHRpcCI7czowOiIiO3M6NDoidHlwZSI7czo4OiJkcm9wZG93biI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6Mzp7czo4OiJyZXF1aXJlZCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fXM6MTI6ImR5bmFtaWNfZGF0YSI7YTo0OntzOjc6ImVuYWJsZWQiO3M6MDoiIjtzOjk6ImRhdGFfcGF0aCI7czowOiIiO3M6OToidmFsdWVfa2V5IjtzOjA6IiI7czo4OiJ0ZXh0X2tleSI7czowOiIiO31zOjY6ImV2ZW50cyI7YToxOntpOjA7YTo1OntzOjg6Im9wZXJhdG9yIjtzOjE6Ij0iO3M6NToic3RhdGUiO3M6MDoiIjtzOjY6ImFjdGlvbiI7czowOiIiO3M6NjoidGFyZ2V0IjtzOjA6IiI7czo3OiJvcHRpb25zIjtzOjA6IiI7fX19aToxMzthOjE4OntzOjQ6Im5hbWUiO3M6MTA6ImF0dGVuZGFuY2UiO3M6MjoiaWQiO3M6MTA6ImF0dGVuZGFuY2UiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czoxMDoiQXR0ZW5kYW5jZSI7czo4OiJwb3NpdGlvbiI7czo0OiJsZWZ0Ijt9czo4OiJzdWJsYWJlbCI7czowOiIiO3M6MTE6InBsYWNlaG9sZGVyIjtzOjA6IiI7czo5OiJtYXhsZW5ndGgiO3M6MDoiIjtzOjQ6InNpemUiO3M6MjoiMzciO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InRpdGxlIjtzOjA6IiI7czo1OiJzdHlsZSI7czowOiIiO3M6MTU6IjpkYXRhLWlucHV0bWFzayI7czowOiIiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6ODk6IkVudGVyIGF0dGVuZGVkIGRheXMgYW5kIHRvdGFsIGRheXMuIEV4YW1wbGUsIDI0LzMwIGlmIHN0dWRlbnQgYXR0ZW5kZWQgMjQgZGF5cyBvdXQgb2YgMzAuIjtzOjQ6InR5cGUiO3M6NDoidGV4dCI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO3M6MTA6InZhbGlkYXRpb24iO2E6MTI6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NToiZW1haWwiO3M6MDoiIjtzOjU6InBob25lIjtzOjA6IiI7czoxMToicGhvbmVfaW50ZXIiO3M6MDoiIjtzOjM6InVybCI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjE2O2E6MTg6e3M6NDoibmFtZSI7czo3OiJyZW1hcmtzIjtzOjI6ImlkIjtzOjc6InJlbWFya3MiO3M6NToidmFsdWUiO3M6MDoiIjtzOjU6ImxhYmVsIjthOjI6e3M6NDoidGV4dCI7czo3OiJSZW1hcmtzIjtzOjg6InBvc2l0aW9uIjtzOjQ6ImxlZnQiO31zOjg6InN1YmxhYmVsIjtzOjA6IiI7czoxMToicGxhY2Vob2xkZXIiO3M6MDoiIjtzOjQ6InJvd3MiO3M6MToiMyI7czo0OiJjb2xzIjtzOjI6IjM0IjtzOjU6ImNsYXNzIjtzOjA6IiI7czo1OiJ0aXRsZSI7czowOiIiO3M6NToic3R5bGUiO3M6MDoiIjtzOjEzOiI6ZGF0YS13eXNpd3lnIjtzOjE6IjAiO3M6NjoicGFyYW1zIjtzOjA6IiI7czoxNjoiOmRhdGEtbG9hZC1zdGF0ZSI7czowOiIiO3M6MTM6IjpkYXRhLXRvb2x0aXAiO3M6MDoiIjtzOjQ6InR5cGUiO3M6ODoidGV4dGFyZWEiO3M6MTI6ImNvbnRhaW5lcl9pZCI7czoxOiIwIjtzOjEwOiJ2YWxpZGF0aW9uIjthOjg6e3M6ODoicmVxdWlyZWQiO3M6MDoiIjtzOjU6ImFscGhhIjtzOjA6IiI7czo4OiJhbHBoYW51bSI7czowOiIiO3M6NToiZGlnaXQiO3M6MDoiIjtzOjc6Im5vZGlnaXQiO3M6MDoiIjtzOjY6Im51bWJlciI7czowOiIiO3M6NzoiY29uZmlybSI7czowOiIiO3M6NjoiY3VzdG9tIjtzOjA6IiI7fX1pOjE7YToxMDp7czoxMToicmVuZGVyX3R5cGUiO3M6Njoic3VibWl0IjtzOjQ6Im5hbWUiO3M6MTI6ImdyYWRlc1N1Ym1pdCI7czoyOiJpZCI7czoxMjoiZ3JhZGVzU3VibWl0IjtzOjQ6InR5cGUiO3M6Njoic3VibWl0IjtzOjU6InZhbHVlIjtzOjQ6IlNhdmUiO3M6NToiY2xhc3MiO3M6MDoiIjtzOjU6InN0eWxlIjtzOjA6IiI7czo2OiJwYXJhbXMiO3M6MDoiIjtzOjE2OiI6ZGF0YS1sb2FkLXN0YXRlIjtzOjA6IiI7czoxMjoiY29udGFpbmVyX2lkIjtzOjE6IjAiO319czoxNDoiYWN0aW9uc19jb25maWciO2E6Njp7aToxO2E6OTp7czo3OiJlbmFibGVkIjtzOjE6IjEiO3M6OToidGFibGVuYW1lIjtzOjE2OiJlazVkMl9ncmFkZXNGb3JtIjtzOjEwOiJtdWx0aV9yZWFkIjtzOjE6IjAiO3M6MTg6ImxvYWRfdW5kZXJfbW9kZWxpZCI7czoxOiIwIjtzOjg6Im1vZGVsX2lkIjtzOjQ6IkRhdGEiO3M6NjoiZmllbGRzIjtzOjA6IiI7czo1OiJvcmRlciI7czowOiIiO3M6NToiZ3JvdXAiO3M6MDoiIjtzOjEwOiJjb25kaXRpb25zIjtzOjEyMDoiPD9waHANCiAgcmVxdWlyZV9vbmNlICggSlBBVEhfQkFTRS5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCiAgcmV0dXJuIHNob3dHcmFkZXNGb3JtVGl0bGUoKTsNCj8+Ijt9aTowO2E6OTp7czo0OiJwYWdlIjtzOjE6IjEiO3M6MTI6InN1Ym1pdF9ldmVudCI7czo2OiJzdWJtaXQiO3M6MTE6ImZvcm1fbWV0aG9kIjtzOjQ6InBvc3QiO3M6MTA6ImFjdGlvbl91cmwiO3M6MDoiIjtzOjEwOiJmb3JtX2NsYXNzIjtzOjEwOiJjaHJvbm9mb3JtIjtzOjE1OiJmb3JtX3RhZ19hdHRhY2giO3M6MDoiIjtzOjI0OiJyZXF1aXJlZF9sYWJlbHNfaWRlbnRpZnkiO3M6MToiMSI7czoxMjoicmVsYXRpdmVfdXJsIjtzOjE6IjEiO3M6MTE6ImFqYXhfc3VibWl0IjtzOjE6IjAiO31pOjQ7YToxOntzOjc6ImNvbnRlbnQiO3M6MTE5OiI8P3BocA0KICByZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICBwcmludEN1c3RvbUNvZGVHcmFkZXNGb3JtKCk7DQo/PiI7fWk6ODthOjU6e3M6NzoiZW5hYmxlZCI7czoxOiIxIjtzOjk6InRhYmxlbmFtZSI7czoxNjoiZWs1ZDJfZ3JhZGVzRm9ybSI7czoxODoic2F2ZV91bmRlcl9tb2RlbGlkIjtzOjE6IjAiO3M6MTA6Im11bHRpX3NhdmUiO3M6MToiMCI7czo4OiJtb2RlbF9pZCI7czo0OiJEYXRhIjt9aToxMDthOjE6e3M6NzoiY29udGVudCI7czoxMjA6Ijw/cGhwDQogIHJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UgLkRTLid0ZW1wbGF0ZXMnLkRTLid5b29fbWFzdGVyMicuRFMuJ2JnbXMucGhwJyApOw0KICBtc2dQb3N0Rm9ybVN1Ym1pdCgnZ3JhZGVzJyk7DQo/PiI7fWk6NzthOjI6e3M6NjoiZXZlbnRzIjtzOjEyOiJzdWNjZXNzLGZhaWwiO3M6NzoiY29udGVudCI7czoxMjQ6Ijw/cGhwDQogIHJlcXVpcmVfb25jZSAoIEpQQVRIX0JBU0UuRFMuJ3RlbXBsYXRlcycuRFMuJ3lvb19tYXN0ZXIyJy5EUy4nYmdtcy5waHAnICk7DQogIHJldHVybiB2YWxpZGF0ZUdyYWRlc0Zvcm0oJGZvcm0pOw0KPz4iO319czozOiJETkEiO2E6Mjp7czo0OiJsb2FkIjthOjM6e3M6OToiZGJfcmVhZF8xIjtzOjA6IiI7czo2OiJodG1sXzAiO3M6MDoiIjtzOjEzOiJjdXN0b21fY29kZV80IjtzOjA6IiI7fXM6Njoic3VibWl0IjthOjE6e3M6MTY6ImV2ZW50X3N3aXRjaGVyXzciO2E6Mjp7czo3OiJzdWNjZXNzIjthOjI6e3M6OToiZGJfc2F2ZV84IjtzOjA6IiI7czoxNDoiY3VzdG9tX2NvZGVfMTAiO3M6MDoiIjt9czo0OiJmYWlsIjtzOjA6IiI7fX19czoxNDoiZGJfZmllbGRzX2xpc3QiO2E6MTp7czoxNjoiZWs1ZDJfZ3JhZGVzRm9ybSI7czowOiIiO319', 1, '', 1, '<div class="form-group gcore-form-row" id="form-row-1"><label for="class" class="control-label gcore-label-left">Class</label>\n<div class="gcore-input gcore-display-table" id="fin-class"><select name="class" id="class" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="1">I</option>\n<option value="2">II</option>\n<option value="3">III</option>\n<option value="4">IV</option>\n<option value="5">V</option>\n<option value="6">VI</option>\n<option value="7">VII</option>\n<option value="8">VIII</option>\n<option value="9">IX</option>\n<option value="10">X</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-2"><label for="studentName" class="control-label gcore-label-left">Student Name</label>\n<div class="gcore-input gcore-display-table" id="fin-studentName"><select name="studentName" id="studentName" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n</select></div></div><input name="studentId" id="studentId" value="-1" type="hidden" class="form-control A" /><div class="form-group gcore-form-row" id="form-row-3"><label for="year" class="control-label gcore-label-left">Year</label>\n<div class="gcore-input gcore-display-table" id="fin-year"><select name="year" id="year" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="2014-15">2014-15</option>\n<option value="2013-14">2013-14</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-4"><label for="examType" class="control-label gcore-label-left">Assessment</label>\n<div class="gcore-input gcore-display-table" id="fin-examType"><select name="examType" id="examType" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Test 1 (25 marks)">Test 1 (25 marks)</option>\n<option value="Test 2 (25 marks)">Test 2 (25 marks)</option>\n<option value="Midterm Exam (100 marks)">Midterm Exam (100 marks)</option>\n<option value="Test 3 (25 marks)">Test 3 (25 marks)</option>\n<option value="Test 4 (25 marks)">Test 4 (25 marks)</option>\n<option value="Final Exam (100 marks)">Final Exam (100 marks)</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-6"><label for="kannadaMarks" class="control-label gcore-label-left">Kannada Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-kannadaMarks"><input name="kannadaMarks" id="kannadaMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-8"><label for="englishMarks" class="control-label gcore-label-left">English Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-englishMarks"><input name="englishMarks" id="englishMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-10"><label for="hindiMarks" class="control-label gcore-label-left">Hindi Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-hindiMarks"><input name="hindiMarks" id="hindiMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-12"><label for="mathMarks" class="control-label gcore-label-left">Mathematics Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-mathMarks"><input name="mathMarks" id="mathMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-14"><label for="generalScienceMarks" class="control-label gcore-label-left">General Science Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-generalScienceMarks"><input name="generalScienceMarks" id="generalScienceMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-16"><label for="socialStudiesMarks" class="control-label gcore-label-left">Social Studies Marks</label>\n<div class="gcore-input gcore-display-table" id="fin-socialStudiesMarks"><input name="socialStudiesMarks" id="socialStudiesMarks" value="" placeholder="" maxlength="" size="" class="validate[&#039;digit&#039;] form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-18"><label for="computerScience" class="control-label gcore-label-left">Computer Science</label>\n<div class="gcore-input gcore-display-table" id="fin-computerScience"><input name="computerScience" id="computerScience" value="" placeholder="" maxlength="" size="37" class="form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="Enter a descriptive assessment. Example, &quot;Good progress. Further improvements is possible.&quot;" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-20"><label for="physicalEducation" class="control-label gcore-label-left">Physical Education</label>\n<div class="gcore-input gcore-display-table" id="fin-physicalEducation"><input name="physicalEducation" id="physicalEducation" value="" placeholder="" maxlength="" size="37" class="form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="Enter a descriptive assessment. Example, &quot;Good progress. Further improvements is possible.&quot;" type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-21"><label for="conduct" class="control-label gcore-label-left">Conduct</label>\n<div class="gcore-input gcore-display-table" id="fin-conduct"><select name="conduct" id="conduct" size="" class="form-control A" title="" style="" data-load-state="" data-tooltip="">\n<option value="Excellent">Excellent</option>\n<option value="Good">Good</option>\n<option value="Needs to improve">Needs to improve</option>\n</select></div></div><div class="form-group gcore-form-row" id="form-row-23"><label for="attendance" class="control-label gcore-label-left">Attendance</label>\n<div class="gcore-input gcore-display-table" id="fin-attendance"><input name="attendance" id="attendance" value="" placeholder="" maxlength="" size="37" class="form-control A" title="" style="" data-inputmask="" data-load-state="" data-tooltip="Enter attended days and total days. Example, 24/30 if student attended 24 days out of 30." type="text" /></div></div><div class="form-group gcore-form-row" id="form-row-24"><label for="remarks" class="control-label gcore-label-left">Remarks</label>\n<div class="gcore-input gcore-display-table" id="fin-remarks"><textarea name="remarks" id="remarks" placeholder="" rows="3" cols="34" class="form-control A" title="" style="" data-wysiwyg="0" data-load-state="" data-tooltip=""></textarea></div></div><div class="form-group gcore-form-row" id="form-row-25"><div class="gcore-input gcore-display-table" id="fin-gradesSubmit"><input name="gradesSubmit" id="gradesSubmit" type="submit" value="Save" class="form-control A" style="" data-load-state="" /></div></div>'),
(3, 'studentList', '{"description":"Show a list of students.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjEwOToiPD9waHAgDQpyZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFIC5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCnNob3dTdHVkZW50TGlzdCgpOw0KPz4NCiI7fX1zOjM6IkROQSI7YToyOntzOjQ6ImxvYWQiO2E6MTp7czoxMzoiY3VzdG9tX2NvZGVfMCI7czowOiIiO31zOjY6InN1Ym1pdCI7czowOiIiO319', 1, '', 1, ''),
(4, 'gradesList', '{"description":"Show recent grades of all students.","setup":"0","theme":"bootstrap3","tight_layout":"0"}', 'YTozOntzOjY6ImZpZWxkcyI7YTowOnt9czoxNDoiYWN0aW9uc19jb25maWciO2E6MTp7aTowO2E6MTp7czo3OiJjb250ZW50IjtzOjEwODoiPD9waHAgDQpyZXF1aXJlX29uY2UgKCBKUEFUSF9CQVNFIC5EUy4ndGVtcGxhdGVzJy5EUy4neW9vX21hc3RlcjInLkRTLidiZ21zLnBocCcgKTsNCnNob3dHcmFkZXNMaXN0KCk7DQo/Pg0KIjt9fXM6MzoiRE5BIjthOjI6e3M6NDoibG9hZCI7YToxOntzOjEzOiJjdXN0b21fY29kZV8wIjtzOjA6IiI7fXM6Njoic3VibWl0IjtzOjA6IiI7fX0=', 1, '', 1, '');

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
(7, 39, 'Home', 'home', 'This is an hidden article.', '1398935075', 1, 2, '2011-05-02 11:49:24', 37, '', '2014-04-04 07:46:23', 42, 0, '0000-00-00 00:00:00', '2011-05-02 11:49:24', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 12, 1, '', '', 1, 6714, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
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
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"13.1","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{"mediaversion":"96263c6b87c13040cabf11c191a2e0fc"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
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
-- Table structure for table `ek5d2_gradesForm`
--

DROP TABLE IF EXISTS `ek5d2_gradesForm`;
CREATE TABLE IF NOT EXISTS `ek5d2_gradesForm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniq_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` datetime DEFAULT NULL,
  `studentId` varchar(255) NOT NULL,
  `examType` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
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
  `gradesSubmit` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1720 ;

--
-- Dumping data for table `ek5d2_gradesForm`
--

INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(1, '', 40, '2014-05-01 09:23:11', '2014-05-04 18:44:36', '1', 'Test 3 (25 marks)', '2013-14', '9', '23', '20', '22', '14', '9', 'Can do better.', 'Well done.', 'Good', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(2, '', 40, '2014-05-02 12:10:05', '2014-05-04 18:44:36', '1', 'Test 3 (25 marks)', '2014-15', '23', '24', '9', '17', '9', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(3, '', 40, '2014-05-01 13:45:52', '2014-05-04 18:44:36', '2', 'Test 3 (25 marks)', '2013-14', '8', '12', '11', '13', '17', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(4, '', 40, '2014-05-03 05:24:00', '0000-00-00 00:00:00', '2', 'Test 3 (25 marks)', '2014-15', '17', '10', '12', '12', '23', '8', 'Can do better.', 'Well done.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(5, '', 40, '2014-04-29 05:43:55', '0000-00-00 00:00:00', '3', 'Test 3 (25 marks)', '2013-14', '24', '22', '17', '20', '17', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(6, '', 40, '2014-05-02 23:14:04', '0000-00-00 00:00:00', '3', 'Test 3 (25 marks)', '2014-15', '12', '16', '13', '12', '6', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(7, '', 40, '2014-05-02 12:51:29', '2014-05-04 18:44:36', '4', 'Test 3 (25 marks)', '2013-14', '13', '17', '22', '20', '12', '13', 'Well done.', 'Well done.', 'Excellent', '35/36', 'Need to work independently.', 'Save'),
(8, '', 40, '2014-05-02 22:00:16', '2014-05-04 18:44:36', '5', 'Test 3 (25 marks)', '2013-14', '14', '7', '13', '12', '10', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(9, '', 40, '2014-05-01 12:06:12', '2014-05-04 18:44:36', '6', 'Test 3 (25 marks)', '2013-14', '24', '10', '16', '8', '16', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(10, '', 40, '2014-05-02 06:19:14', '2014-05-04 18:44:36', '6', 'Test 3 (25 marks)', '2014-15', '20', '19', '21', '8', '19', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(11, '', 40, '2014-05-01 12:58:10', '0000-00-00 00:00:00', '7', 'Test 3 (25 marks)', '2013-14', '21', '7', '7', '22', '9', '9', 'Can do better.', 'Well done.', 'Good', '33/36', 'Good work.', 'Save'),
(12, '', 40, '2014-05-01 23:00:12', '2014-05-04 18:44:36', '8', 'Test 3 (25 marks)', '2013-14', '8', '21', '11', '12', '18', '14', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(13, '', 40, '2014-04-29 22:55:58', '0000-00-00 00:00:00', '8', 'Test 3 (25 marks)', '2014-15', '8', '15', '15', '12', '11', '24', 'Can do better.', 'Well done.', 'Excellent', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(14, '', 40, '2014-05-03 02:38:35', '2014-05-04 18:44:36', '9', 'Test 3 (25 marks)', '2013-14', '15', '21', '7', '11', '', '8', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(15, '', 40, '2014-05-01 11:01:45', '2014-05-04 18:44:36', '10', 'Test 3 (25 marks)', '2013-14', '23', '21', '17', '8', '13', '23', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(16, '', 40, '2014-05-03 05:23:53', '2014-05-04 18:44:36', '10', 'Test 3 (25 marks)', '2014-15', '17', '13', '7', '8', '9', '17', 'Can do better.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(17, '', 40, '2014-05-03 08:38:06', '2014-05-04 18:44:36', '11', 'Test 3 (25 marks)', '2013-14', '15', '10', '14', '14', '13', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Good work.', 'Save'),
(18, '', 40, '2014-05-02 06:01:59', '2014-05-04 18:44:36', '11', 'Test 3 (25 marks)', '2014-15', '15', '14', '11', '7', '22', '9', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Can do better.', 'Save'),
(19, '', 40, '2014-05-02 13:32:40', '2014-05-04 18:44:36', '12', 'Test 3 (25 marks)', '2013-14', '17', '6', '7', '8', '8', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(20, '', 40, '2014-05-01 22:58:09', '2014-05-04 18:44:36', '12', 'Test 3 (25 marks)', '2014-15', '8', '6', '20', '7', '24', '14', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(21, '', 40, '2014-05-03 14:40:38', '0000-00-00 00:00:00', '13', 'Test 3 (25 marks)', '2013-14', '8', '21', '9', '22', '17', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(22, '', 40, '2014-05-02 17:58:28', '2014-05-04 18:44:36', '13', 'Test 3 (25 marks)', '2014-15', '11', '6', '15', '14', '21', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Concentrate. Too playful.', 'Save'),
(23, '', 40, '2014-05-04 03:27:24', '2014-05-04 18:44:36', '14', 'Test 3 (25 marks)', '2013-14', '19', '12', '22', '8', '25', '6', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(24, '', 40, '2014-04-30 13:54:55', '2014-05-04 18:44:36', '14', 'Test 3 (25 marks)', '2014-15', '23', '11', '19', '10', '24', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(25, '', 40, '2014-05-03 10:21:26', '2014-05-04 18:44:36', '16', 'Test 3 (25 marks)', '2013-14', '8', '22', '13', '19', '11', '15', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Need to work independently.', 'Save'),
(26, '', 40, '2014-05-02 13:31:25', '2014-05-04 18:44:36', '16', 'Test 3 (25 marks)', '2014-15', '14', '25', '23', '17', '24', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(27, '', 40, '2014-05-01 03:33:02', '2014-05-04 18:44:36', '17', 'Test 3 (25 marks)', '2013-14', '', '19', '17', '21', '24', '23', 'Can do better.', 'Can do better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(28, '', 40, '2014-04-30 03:20:40', '2014-05-04 18:44:36', '17', 'Test 3 (25 marks)', '2014-15', '22', '24', '11', '6', '16', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(29, '', 40, '2014-04-29 07:51:30', '0000-00-00 00:00:00', '18', 'Test 3 (25 marks)', '2013-14', '20', '10', '20', '14', '12', '9', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Need to work hard.', 'Save'),
(30, '', 40, '2014-04-29 03:00:27', '2014-05-04 18:44:36', '18', 'Test 3 (25 marks)', '2014-15', '18', '7', '9', '19', '12', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(31, '', 40, '2014-05-03 04:17:25', '2014-05-04 18:44:36', '19', 'Test 3 (25 marks)', '2013-14', '15', '7', '15', '18', '21', '12', 'Can do better.', 'Can do better.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(32, '', 40, '2014-05-03 14:04:33', '2014-05-04 18:44:36', '19', 'Test 3 (25 marks)', '2014-15', '11', '9', '17', '10', '', '10', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(33, '', 40, '2014-05-01 20:48:35', '0000-00-00 00:00:00', '20', 'Test 3 (25 marks)', '2013-14', '7', '9', '17', '12', '16', '17', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(34, '', 40, '2014-04-29 22:36:54', '2014-05-04 18:44:36', '20', 'Test 3 (25 marks)', '2014-15', '8', '16', '12', '13', '6', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good job in English and Kannada.', 'Save'),
(35, '', 40, '2014-05-01 08:55:33', '2014-05-04 18:44:36', '21', 'Test 3 (25 marks)', '2013-14', '23', '14', '18', '', '17', '16', 'Well done.', 'Can do better.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(36, '', 40, '2014-05-03 05:49:30', '2014-05-04 18:44:36', '22', 'Test 3 (25 marks)', '2013-14', '20', '21', '15', '11', '12', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(37, '', 40, '2014-05-01 09:10:09', '2014-05-04 18:44:36', '22', 'Test 3 (25 marks)', '2014-15', '11', '20', '22', '15', '15', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(38, '', 40, '2014-04-29 17:06:22', '2014-05-04 18:44:36', '23', 'Test 3 (25 marks)', '2013-14', '', '10', '17', '17', '22', '19', 'Can do better.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(39, '', 40, '2014-05-01 03:23:54', '2014-05-04 18:44:36', '23', 'Test 3 (25 marks)', '2014-15', '20', '18', '16', '9', '14', '25', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '31/36', 'Good work.', 'Save'),
(40, '', 40, '2014-04-30 13:10:51', '2014-05-04 18:44:36', '24', 'Test 3 (25 marks)', '2013-14', '10', '10', '7', '21', '21', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(41, '', 40, '2014-05-03 21:38:17', '2014-05-04 18:44:36', '24', 'Test 3 (25 marks)', '2014-15', '20', '11', '9', '24', '8', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '31/36', 'Can do better.', 'Save'),
(42, '', 40, '2014-05-03 19:38:32', '2014-05-04 18:44:36', '26', 'Test 3 (25 marks)', '2013-14', '7', '15', '24', '15', '22', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(43, '', 40, '2014-05-02 13:43:41', '2014-05-04 18:44:36', '26', 'Test 3 (25 marks)', '2014-15', '7', '12', '20', '22', '13', '', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good work.', 'Save'),
(44, '', 40, '2014-05-02 08:49:46', '2014-05-04 18:44:36', '27', 'Test 3 (25 marks)', '2013-14', '12', '13', '10', '18', '11', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(45, '', 40, '2014-05-01 12:37:57', '2014-05-04 18:44:36', '27', 'Test 3 (25 marks)', '2014-15', '23', '19', '15', '18', '20', '12', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(46, '', 40, '2014-05-04 05:15:59', '2014-05-04 18:44:36', '28', 'Test 3 (25 marks)', '2013-14', '22', '25', '22', '22', '23', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(47, '', 40, '2014-05-02 14:59:27', '2014-05-04 18:44:36', '28', 'Test 3 (25 marks)', '2014-15', '25', '22', '14', '18', '10', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Can do better.', 'Save'),
(48, '', 40, '2014-04-29 16:13:53', '0000-00-00 00:00:00', '29', 'Test 3 (25 marks)', '2013-14', '', '11', '8', '16', '23', '7', 'Well done.', 'Well done.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(49, '', 40, '2014-04-30 15:03:24', '2014-05-04 18:44:36', '29', 'Test 3 (25 marks)', '2014-15', '23', '11', '11', '16', '6', '22', 'Well done.', 'Well done.', 'Excellent', '36/36', 'Good work.', 'Save'),
(50, '', 40, '2014-04-30 07:33:38', '2014-05-04 18:44:36', '30', 'Test 3 (25 marks)', '2013-14', '21', '10', '11', '9', '10', '21', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Good work.', 'Save'),
(51, '', 40, '2014-05-03 22:34:44', '2014-05-04 18:44:36', '30', 'Test 3 (25 marks)', '2014-15', '', '', '22', '13', '25', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work independently.', 'Save'),
(52, '', 40, '2014-04-30 15:51:21', '0000-00-00 00:00:00', '31', 'Test 3 (25 marks)', '2013-14', '21', '12', '16', '', '23', '23', 'Can do better.', 'Well done.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(53, '', 40, '2014-05-01 01:35:40', '2014-05-04 18:44:36', '31', 'Test 3 (25 marks)', '2014-15', '21', '8', '20', '', '17', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(54, '', 40, '2014-05-04 04:30:15', '2014-05-04 18:44:36', '32', 'Test 3 (25 marks)', '2013-14', '23', '14', '18', '16', '15', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Concentrate. Too playful.', 'Save'),
(55, '', 40, '2014-05-02 23:29:15', '2014-05-04 18:44:36', '32', 'Test 3 (25 marks)', '2014-15', '7', '18', '20', '13', '11', '8', 'Can do better.', 'Well done.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(56, '', 40, '2014-05-02 05:12:45', '0000-00-00 00:00:00', '33', 'Test 3 (25 marks)', '2014-15', '18', '17', '19', '', '17', '23', 'Well done.', 'Well done.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(57, '', 40, '2014-05-03 07:24:28', '2014-05-04 18:44:36', '34', 'Test 3 (25 marks)', '2013-14', '23', '14', '15', '11', '6', '10', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(58, '', 40, '2014-05-02 05:06:05', '2014-05-04 18:44:36', '34', 'Test 3 (25 marks)', '2014-15', '18', '23', '20', '10', '23', '', 'Well done.', 'Well done.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(59, '', 40, '2014-05-03 16:52:44', '0000-00-00 00:00:00', '35', 'Test 3 (25 marks)', '2013-14', '20', '22', '6', '20', '15', '7', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Concentrate. Too playful.', 'Save'),
(60, '', 40, '2014-04-30 00:31:22', '0000-00-00 00:00:00', '35', 'Test 3 (25 marks)', '2014-15', '16', '10', '6', '24', '14', '', 'Well done.', 'Well done.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(61, '', 40, '2014-04-30 15:42:23', '0000-00-00 00:00:00', '36', 'Test 3 (25 marks)', '2013-14', '21', '23', '21', '15', '22', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(62, '', 40, '2014-04-30 10:05:37', '2014-05-04 18:44:36', '36', 'Test 3 (25 marks)', '2014-15', '10', '11', '24', '14', '12', '6', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Can do better.', 'Save'),
(63, '', 40, '2014-05-03 13:05:19', '0000-00-00 00:00:00', '37', 'Test 3 (25 marks)', '2013-14', '8', '', '7', '7', '10', '15', 'Well done.', 'Well done.', 'Excellent', '30/36', 'Good work.', 'Save'),
(64, '', 40, '2014-05-01 22:57:33', '2014-05-04 18:44:36', '37', 'Test 3 (25 marks)', '2014-15', '20', '8', '12', '12', '9', '10', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(65, '', 40, '2014-04-30 22:26:49', '2014-05-04 18:44:36', '38', 'Test 3 (25 marks)', '2013-14', '23', '11', '', '21', '13', '21', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(66, '', 40, '2014-05-03 18:35:54', '2014-05-04 18:44:36', '38', 'Test 3 (25 marks)', '2014-15', '22', '20', '13', '', '21', '12', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(67, '', 40, '2014-04-30 15:44:09', '2014-05-04 18:44:36', '39', 'Test 3 (25 marks)', '2013-14', '19', '7', '13', '20', '13', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(68, '', 40, '2014-05-02 23:55:21', '2014-05-04 18:44:36', '41', 'Test 3 (25 marks)', '2013-14', '8', '7', '14', '16', '16', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(69, '', 40, '2014-04-29 21:17:53', '2014-05-04 18:44:36', '41', 'Test 3 (25 marks)', '2014-15', '7', '9', '23', '6', '13', '11', 'Well done.', 'Can do better.', 'Excellent', '32/36', 'Can do better.', 'Save'),
(70, '', 40, '2014-05-02 03:42:50', '2014-05-04 18:44:36', '42', 'Test 3 (25 marks)', '2013-14', '14', '14', '10', '23', '13', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(71, '', 40, '2014-04-29 11:52:20', '2014-05-04 18:44:36', '42', 'Test 3 (25 marks)', '2014-15', '12', '', '14', '14', '22', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(72, '', 40, '2014-04-29 22:21:44', '2014-05-04 18:44:36', '43', 'Test 3 (25 marks)', '2013-14', '15', '18', '12', '23', '6', '7', 'Well done.', 'Can do better.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(73, '', 40, '2014-05-01 05:41:58', '0000-00-00 00:00:00', '43', 'Test 3 (25 marks)', '2014-15', '17', '18', '9', '13', '8', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '35/36', 'Need to work hard.', 'Save'),
(74, '', 40, '2014-04-29 23:07:44', '2014-05-04 18:44:36', '44', 'Test 3 (25 marks)', '2014-15', '23', '10', '7', '', '7', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(75, '', 40, '2014-05-04 03:04:55', '2014-05-04 18:44:36', '45', 'Test 3 (25 marks)', '2013-14', '18', '23', '9', '9', '19', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(76, '', 40, '2014-04-29 03:04:05', '2014-05-04 18:44:36', '45', 'Test 3 (25 marks)', '2014-15', '12', '16', '22', '20', '10', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(77, '', 40, '2014-04-30 20:42:55', '2014-05-04 18:44:36', '46', 'Test 3 (25 marks)', '2013-14', '22', '10', '9', '10', '18', '13', 'Can do better.', 'Can do better.', 'Needs to improve', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(78, '', 40, '2014-04-29 06:23:44', '2014-05-04 18:44:36', '46', 'Test 3 (25 marks)', '2014-15', '7', '12', '16', '12', '24', '9', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(79, '', 40, '2014-04-30 10:29:56', '0000-00-00 00:00:00', '47', 'Test 3 (25 marks)', '2013-14', '23', '', '14', '', '20', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(80, '', 40, '2014-04-30 00:38:10', '2014-05-04 18:44:36', '47', 'Test 3 (25 marks)', '2014-15', '9', '', '17', '11', '24', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(81, '', 40, '2014-05-01 22:13:41', '2014-05-04 18:44:36', '48', 'Test 3 (25 marks)', '2013-14', '11', '22', '14', '17', '13', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good job in English and Kannada.', 'Save'),
(82, '', 40, '2014-05-03 02:54:13', '0000-00-00 00:00:00', '48', 'Test 3 (25 marks)', '2014-15', '6', '14', '14', '7', '9', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(83, '', 40, '2014-05-03 12:04:38', '0000-00-00 00:00:00', '49', 'Test 3 (25 marks)', '2013-14', '13', '9', '14', '9', '19', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(84, '', 40, '2014-04-29 17:25:38', '2014-05-04 18:44:36', '49', 'Test 3 (25 marks)', '2014-15', '11', '24', '12', '21', '22', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(85, '', 40, '2014-05-03 17:43:23', '2014-05-04 18:44:36', '50', 'Test 3 (25 marks)', '2013-14', '14', '20', '14', '18', '6', '7', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(86, '', 40, '2014-04-28 21:45:59', '2014-05-04 18:44:36', '50', 'Test 3 (25 marks)', '2014-15', '20', '17', '17', '8', '9', '9', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(87, '', 40, '2014-05-01 09:04:27', '2014-05-04 18:44:36', '51', 'Test 3 (25 marks)', '2013-14', '21', '23', '14', '11', '8', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Can do better.', 'Save'),
(88, '', 40, '2014-04-29 20:31:37', '0000-00-00 00:00:00', '51', 'Test 3 (25 marks)', '2014-15', '6', '25', '8', '22', '8', '19', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(89, '', 40, '2014-05-01 09:19:59', '2014-05-04 18:44:36', '52', 'Test 3 (25 marks)', '2013-14', '15', '10', '13', '14', '', '25', 'Can do better.', 'Can do better.', 'Good', '32/36', 'Need to work hard.', 'Save'),
(90, '', 40, '2014-05-04 05:21:00', '2014-05-04 18:44:36', '52', 'Test 3 (25 marks)', '2014-15', '12', '10', '18', '24', '19', '24', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(91, '', 40, '2014-05-02 07:53:01', '2014-05-04 18:44:36', '53', 'Test 3 (25 marks)', '2013-14', '24', '19', '', '8', '10', '9', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Concentrate. Too playful.', 'Save'),
(92, '', 40, '2014-05-04 01:00:58', '2014-05-04 18:44:36', '53', 'Test 3 (25 marks)', '2014-15', '10', '17', '22', '17', '22', '14', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Good job in English and Kannada.', 'Save'),
(93, '', 40, '2014-05-01 20:34:10', '2014-05-04 18:44:36', '54', 'Test 3 (25 marks)', '2013-14', '9', '19', '16', '11', '8', '14', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(94, '', 40, '2014-04-30 15:30:56', '2014-05-04 18:44:36', '54', 'Test 3 (25 marks)', '2014-15', '21', '', '15', '24', '9', '23', 'Well done.', 'Can do better.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(95, '', 40, '2014-05-01 17:41:34', '0000-00-00 00:00:00', '55', 'Test 3 (25 marks)', '2013-14', '6', '7', '22', '8', '12', '25', 'Well done.', 'Can do better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(96, '', 40, '2014-05-01 07:48:35', '0000-00-00 00:00:00', '55', 'Test 3 (25 marks)', '2014-15', '22', '10', '9', '13', '7', '16', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(97, '', 40, '2014-05-01 02:59:17', '2014-05-04 18:44:36', '56', 'Test 3 (25 marks)', '2013-14', '16', '7', '17', '10', '14', '11', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '28/36', 'Good work.', 'Save'),
(98, '', 40, '2014-05-02 14:03:24', '2014-05-04 18:44:36', '56', 'Test 3 (25 marks)', '2014-15', '21', '', '13', '24', '19', '10', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(99, '', 40, '2014-05-02 22:30:02', '2014-05-04 18:44:36', '57', 'Test 3 (25 marks)', '2013-14', '', '17', '22', '6', '', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(100, '', 40, '2014-05-01 13:15:32', '2014-05-04 18:44:36', '57', 'Test 3 (25 marks)', '2014-15', '9', '15', '9', '19', '23', '21', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(101, '', 40, '2014-04-29 06:17:20', '2014-05-04 18:44:36', '58', 'Test 3 (25 marks)', '2013-14', '11', '23', '14', '24', '18', '6', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(102, '', 40, '2014-04-30 21:44:20', '2014-05-04 18:44:36', '58', 'Test 3 (25 marks)', '2014-15', '17', '13', '21', '16', '20', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Good job in English and Kannada.', 'Save'),
(103, '', 40, '2014-05-01 06:06:27', '2014-05-04 18:44:36', '59', 'Test 3 (25 marks)', '2013-14', '9', '16', '', '22', '14', '21', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Can do better.', 'Save'),
(104, '', 40, '2014-05-02 03:16:06', '2014-05-04 18:44:36', '59', 'Test 3 (25 marks)', '2014-15', '24', '15', '', '25', '16', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(105, '', 40, '2014-04-30 17:50:47', '2014-05-04 18:44:36', '60', 'Test 3 (25 marks)', '2013-14', '20', '15', '18', '11', '10', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(106, '', 40, '2014-04-30 07:39:08', '0000-00-00 00:00:00', '60', 'Test 3 (25 marks)', '2014-15', '15', '20', '13', '23', '19', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(107, '', 40, '2014-05-04 03:20:35', '2014-05-04 18:44:36', '61', 'Test 3 (25 marks)', '2014-15', '15', '13', '10', '7', '23', '9', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Good work.', 'Save'),
(108, '', 40, '2014-04-29 23:36:17', '2014-05-04 18:44:36', '62', 'Test 3 (25 marks)', '2013-14', '', '17', '8', '18', '17', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(109, '', 40, '2014-05-02 05:55:52', '0000-00-00 00:00:00', '62', 'Test 3 (25 marks)', '2014-15', '21', '23', '', '7', '14', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work hard.', 'Save'),
(110, '', 40, '2014-04-29 20:40:01', '2014-05-04 18:44:36', '63', 'Test 3 (25 marks)', '2013-14', '15', '15', '18', '21', '19', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Can do better.', 'Save'),
(111, '', 40, '2014-05-03 11:31:38', '0000-00-00 00:00:00', '63', 'Test 3 (25 marks)', '2014-15', '24', '13', '15', '17', '18', '24', 'Well done.', 'Can do better.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(112, '', 40, '2014-05-03 20:19:42', '2014-05-04 18:44:36', '64', 'Test 3 (25 marks)', '2013-14', '10', '8', '6', '11', '8', '7', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(113, '', 40, '2014-05-04 03:06:24', '0000-00-00 00:00:00', '64', 'Test 3 (25 marks)', '2014-15', '20', '18', '13', '10', '10', '19', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(114, '', 40, '2014-04-30 12:01:10', '0000-00-00 00:00:00', '65', 'Test 3 (25 marks)', '2013-14', '10', '23', '16', '19', '10', '6', 'Well done.', 'Well done.', 'Good', '27/36', 'Can do better.', 'Save'),
(115, '', 40, '2014-05-03 00:46:59', '2014-05-04 18:44:36', '65', 'Test 3 (25 marks)', '2014-15', '16', '9', '20', '23', '22', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(116, '', 40, '2014-04-29 19:36:48', '2014-05-04 18:44:36', '66', 'Test 3 (25 marks)', '2013-14', '', '7', '17', '16', '15', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(117, '', 40, '2014-05-01 12:56:08', '2014-05-04 18:44:36', '66', 'Test 3 (25 marks)', '2014-15', '7', '22', '12', '22', '20', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(118, '', 40, '2014-05-01 14:36:15', '2014-05-04 18:44:36', '67', 'Test 3 (25 marks)', '2013-14', '7', '21', '20', '15', '16', '20', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(119, '', 40, '2014-05-03 16:57:18', '2014-05-04 18:44:36', '67', 'Test 3 (25 marks)', '2014-15', '19', '16', '17', '14', '23', '20', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '34/36', 'Need to work independently.', 'Save'),
(120, '', 40, '2014-05-03 00:37:17', '0000-00-00 00:00:00', '68', 'Test 3 (25 marks)', '2013-14', '', '15', '7', '16', '13', '17', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(121, '', 40, '2014-05-03 14:27:30', '2014-05-04 18:44:36', '69', 'Test 3 (25 marks)', '2013-14', '', '11', '18', '15', '16', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '30/36', 'Concentrate. Too playful.', 'Save'),
(122, '', 40, '2014-05-01 13:14:37', '0000-00-00 00:00:00', '69', 'Test 3 (25 marks)', '2014-15', '18', '9', '21', '14', '24', '15', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(123, '', 40, '2014-05-02 11:12:01', '0000-00-00 00:00:00', '70', 'Test 3 (25 marks)', '2013-14', '10', '24', '6', '18', '16', '23', 'Well done.', 'Can do better.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(124, '', 40, '2014-05-02 17:04:55', '0000-00-00 00:00:00', '70', 'Test 3 (25 marks)', '2014-15', '10', '16', '20', '18', '14', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(125, '', 40, '2014-05-04 02:14:21', '2014-05-04 18:44:36', '71', 'Test 3 (25 marks)', '2013-14', '21', '6', '9', '18', '22', '21', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(126, '', 40, '2014-05-02 19:30:51', '0000-00-00 00:00:00', '71', 'Test 3 (25 marks)', '2014-15', '11', '13', '20', '17', '15', '11', 'Can do better.', 'Can do better.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(127, '', 40, '2014-05-01 16:49:46', '2014-05-04 18:44:36', '72', 'Test 3 (25 marks)', '2013-14', '', '25', '12', '15', '7', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(128, '', 40, '2014-04-29 23:51:49', '2014-05-04 18:44:36', '72', 'Test 3 (25 marks)', '2014-15', '12', '23', '23', '10', '12', '16', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(129, '', 40, '2014-05-03 07:29:33', '2014-05-04 18:44:36', '73', 'Test 3 (25 marks)', '2014-15', '12', '25', '10', '22', '15', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(130, '', 40, '2014-05-03 15:39:10', '2014-05-04 18:44:36', '74', 'Test 3 (25 marks)', '2013-14', '11', '10', '24', '12', '22', '25', 'Well done.', 'Can do better.', 'Excellent', '34/36', 'Need to work independently.', 'Save'),
(131, '', 40, '2014-05-03 08:01:28', '2014-05-04 18:44:36', '74', 'Test 3 (25 marks)', '2014-15', '14', '23', '8', '11', '17', '11', 'Can do better.', 'Can do better.', 'Excellent', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(132, '', 40, '2014-05-03 16:39:13', '2014-05-04 18:44:36', '75', 'Test 3 (25 marks)', '2013-14', '13', '', '24', '22', '6', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(133, '', 40, '2014-04-29 20:38:02', '2014-05-04 18:44:36', '75', 'Test 3 (25 marks)', '2014-15', '12', '25', '8', '21', '13', '23', 'Can do better.', 'Well done.', 'Good', '29/36', 'Good job in English and Kannada.', 'Save'),
(134, '', 40, '2014-04-29 05:39:28', '2014-05-04 18:44:36', '76', 'Test 3 (25 marks)', '2013-14', '', '6', '14', '23', '11', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(135, '', 40, '2014-05-01 09:28:46', '2014-05-04 18:44:36', '77', 'Test 3 (25 marks)', '2013-14', '13', '7', '17', '20', '18', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(136, '', 40, '2014-05-01 16:28:44', '2014-05-04 18:44:36', '77', 'Test 3 (25 marks)', '2014-15', '11', '12', '21', '7', '10', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(137, '', 40, '2014-04-28 22:35:41', '2014-05-04 18:44:36', '78', 'Test 3 (25 marks)', '2013-14', '15', '14', '19', '15', '19', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(138, '', 40, '2014-05-03 03:55:12', '0000-00-00 00:00:00', '78', 'Test 3 (25 marks)', '2014-15', '16', '18', '13', '17', '16', '20', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(139, '', 40, '2014-04-29 03:16:22', '0000-00-00 00:00:00', '79', 'Test 3 (25 marks)', '2013-14', '17', '6', '23', '17', '12', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(140, '', 40, '2014-05-04 00:06:03', '2014-05-04 18:44:36', '79', 'Test 3 (25 marks)', '2014-15', '9', '12', '10', '19', '10', '23', 'Well done.', 'Can do better.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(141, '', 40, '2014-05-02 02:04:11', '2014-05-04 18:44:36', '81', 'Test 3 (25 marks)', '2013-14', '14', '23', '22', '17', '23', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(142, '', 40, '2014-05-01 03:30:08', '2014-05-04 18:44:36', '81', 'Test 3 (25 marks)', '2014-15', '10', '10', '23', '20', '20', '22', 'Well done.', 'Can do better.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(143, '', 40, '2014-05-03 04:39:13', '2014-05-04 18:44:36', '82', 'Test 3 (25 marks)', '2013-14', '10', '9', '24', '8', '21', '11', 'Well done.', 'Can do better.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(144, '', 40, '2014-04-29 04:36:42', '2014-05-04 18:44:36', '82', 'Test 3 (25 marks)', '2014-15', '23', '17', '14', '14', '12', '7', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(145, '', 40, '2014-04-29 00:22:11', '2014-05-04 18:44:36', '83', 'Test 3 (25 marks)', '2013-14', '12', '19', '19', '7', '21', '12', 'Well done.', 'Well done.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(146, '', 40, '2014-05-04 05:03:37', '0000-00-00 00:00:00', '83', 'Test 3 (25 marks)', '2014-15', '20', '7', '18', '11', '21', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(147, '', 40, '2014-05-04 02:22:59', '2014-05-04 18:44:36', '84', 'Test 3 (25 marks)', '2013-14', '16', '24', '12', '15', '18', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(148, '', 40, '2014-05-03 12:42:49', '2014-05-04 18:44:36', '84', 'Test 3 (25 marks)', '2014-15', '12', '7', '23', '12', '19', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(149, '', 40, '2014-05-02 15:39:53', '0000-00-00 00:00:00', '85', 'Test 3 (25 marks)', '2013-14', '24', '15', '12', '11', '18', '9', 'Well done.', 'Can do better.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(150, '', 40, '2014-05-02 23:50:00', '2014-05-04 18:44:36', '85', 'Test 3 (25 marks)', '2014-15', '15', '18', '22', '14', '25', '11', 'Well done.', 'Well done.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(151, '', 40, '2014-05-03 18:37:32', '2014-05-04 18:44:36', '86', 'Test 3 (25 marks)', '2013-14', '9', '10', '', '6', '10', '7', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(152, '', 40, '2014-05-02 00:02:52', '2014-05-04 18:44:36', '86', 'Test 3 (25 marks)', '2014-15', '9', '21', '15', '16', '20', '12', 'Can do better.', 'Well done.', 'Needs to improve', '32/36', 'Need to work hard.', 'Save'),
(153, '', 40, '2014-05-01 15:28:45', '2014-05-04 18:44:36', '87', 'Test 3 (25 marks)', '2013-14', '8', '20', '15', '23', '19', '7', 'Can do better.', 'Can do better.', 'Good', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(154, '', 40, '2014-04-29 17:29:29', '2014-05-04 18:44:36', '87', 'Test 3 (25 marks)', '2014-15', '13', '', '13', '15', '18', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(155, '', 40, '2014-04-29 22:24:16', '2014-05-04 18:44:36', '88', 'Test 3 (25 marks)', '2013-14', '17', '17', '10', '9', '21', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(156, '', 40, '2014-05-01 08:41:27', '0000-00-00 00:00:00', '88', 'Test 3 (25 marks)', '2014-15', '12', '10', '10', '6', '14', '13', 'Well done.', 'Well done.', 'Excellent', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(157, '', 40, '2014-04-29 13:30:42', '0000-00-00 00:00:00', '89', 'Test 3 (25 marks)', '2013-14', '', '7', '21', '20', '10', '8', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '34/36', 'Good work.', 'Save'),
(158, '', 40, '2014-05-03 07:24:47', '2014-05-04 18:44:36', '89', 'Test 3 (25 marks)', '2014-15', '13', '15', '18', '14', '17', '21', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(159, '', 40, '2014-04-29 01:10:30', '2014-05-04 18:44:36', '90', 'Test 3 (25 marks)', '2013-14', '14', '8', '11', '15', '14', '6', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '31/36', 'Good job in English and Kannada.', 'Save'),
(160, '', 40, '2014-05-02 01:01:27', '2014-05-04 18:44:36', '91', 'Test 3 (25 marks)', '2013-14', '10', '7', '8', '21', '8', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Concentrate. Too playful.', 'Save'),
(161, '', 40, '2014-04-29 13:15:15', '2014-05-04 18:44:36', '91', 'Test 3 (25 marks)', '2014-15', '10', '19', '18', '23', '21', '9', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(162, '', 40, '2014-05-02 18:10:07', '0000-00-00 00:00:00', '92', 'Test 3 (25 marks)', '2013-14', '', '10', '8', '14', '13', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '35/36', 'Need to work independently.', 'Save'),
(163, '', 40, '2014-05-02 05:52:35', '2014-05-04 18:44:36', '92', 'Test 3 (25 marks)', '2014-15', '10', '11', '25', '15', '22', '19', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Can do better.', 'Save'),
(164, '', 40, '2014-05-02 21:29:33', '2014-05-04 18:44:36', '93', 'Test 3 (25 marks)', '2013-14', '7', '17', '13', '13', '21', '19', 'Well done.', 'Well done.', 'Excellent', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(165, '', 40, '2014-05-03 15:35:36', '2014-05-04 18:44:36', '93', 'Test 3 (25 marks)', '2014-15', '', '8', '20', '16', '20', '9', 'Can do better.', 'Can do better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(166, '', 40, '2014-05-03 13:50:50', '2014-05-04 18:44:36', '94', 'Test 3 (25 marks)', '2013-14', '17', '8', '20', '', '', '10', 'Well done.', 'Well done.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(167, '', 40, '2014-05-02 19:29:05', '2014-05-04 18:44:36', '94', 'Test 3 (25 marks)', '2014-15', '16', '19', '12', '15', '24', '10', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work hard.', 'Save'),
(168, '', 40, '2014-04-29 23:20:56', '2014-05-04 18:44:36', '95', 'Test 3 (25 marks)', '2014-15', '23', '', '8', '', '7', '', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '33/36', 'Need to work independently.', 'Save'),
(169, '', 40, '2014-04-30 06:11:48', '2014-05-04 18:44:36', '96', 'Test 3 (25 marks)', '2013-14', '17', '15', '18', '10', '7', '22', 'Well done.', 'Well done.', 'Needs to improve', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(170, '', 40, '2014-04-29 03:28:25', '2014-05-04 18:44:36', '96', 'Test 3 (25 marks)', '2014-15', '20', '8', '7', '7', '24', '20', 'Well done.', 'Well done.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(171, '', 40, '2014-05-03 17:15:26', '2014-05-04 18:44:36', '97', 'Test 3 (25 marks)', '2013-14', '14', '24', '20', '7', '13', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(172, '', 40, '2014-04-30 04:08:50', '2014-05-04 18:44:36', '97', 'Test 3 (25 marks)', '2014-15', '6', '17', '7', '21', '12', '15', 'Can do better.', 'Well done.', 'Needs to improve', '33/36', 'Need to work independently.', 'Save'),
(173, '', 40, '2014-05-03 10:34:16', '2014-05-04 18:44:36', '98', 'Test 3 (25 marks)', '2013-14', '8', '11', '18', '11', '6', '10', 'Can do better.', 'Well done.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(174, '', 40, '2014-04-29 12:50:56', '2014-05-04 18:44:36', '98', 'Test 3 (25 marks)', '2014-15', '15', '18', '', '', '17', '', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(175, '', 40, '2014-04-29 21:31:12', '2014-05-04 18:44:36', '99', 'Test 3 (25 marks)', '2013-14', '14', '17', '', '21', '15', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(176, '', 40, '2014-05-01 00:06:20', '2014-05-04 18:44:36', '99', 'Test 3 (25 marks)', '2014-15', '8', '9', '22', '18', '13', '20', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Good job in English and Kannada.', 'Save'),
(177, '', 40, '2014-05-02 05:02:22', '2014-05-04 18:44:36', '100', 'Test 3 (25 marks)', '2013-14', '25', '16', '20', '22', '13', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Can do better.', 'Save'),
(178, '', 40, '2014-04-29 05:02:41', '2014-05-04 18:44:36', '100', 'Test 3 (25 marks)', '2014-15', '17', '24', '13', '15', '6', '21', 'Well done.', 'Well done.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(179, '', 40, '2014-05-03 11:33:24', '2014-05-04 18:44:36', '101', 'Test 3 (25 marks)', '2013-14', '18', '20', '7', '24', '16', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(180, '', 40, '2014-04-29 01:20:59', '0000-00-00 00:00:00', '101', 'Test 3 (25 marks)', '2014-15', '14', '15', '24', '9', '12', '17', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work hard.', 'Save'),
(181, '', 40, '2014-04-30 22:36:48', '2014-05-04 18:44:36', '102', 'Test 3 (25 marks)', '2013-14', '9', '24', '15', '11', '9', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(182, '', 40, '2014-05-02 05:08:39', '2014-05-04 18:44:36', '102', 'Test 3 (25 marks)', '2014-15', '10', '7', '21', '15', '15', '21', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(183, '', 40, '2014-04-29 02:57:16', '2014-05-04 18:44:36', '103', 'Test 3 (25 marks)', '2013-14', '9', '12', '9', '7', '9', '21', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Good work.', 'Save'),
(184, '', 40, '2014-04-30 05:09:27', '2014-05-04 18:44:36', '103', 'Test 3 (25 marks)', '2014-15', '6', '10', '10', '22', '22', '15', 'Can do better.', 'Well done.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(185, '', 40, '2014-04-29 18:04:10', '2014-05-04 18:44:36', '104', 'Test 3 (25 marks)', '2013-14', '10', '9', '22', '11', '7', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Good work.', 'Save'),
(186, '', 40, '2014-05-01 01:05:07', '2014-05-04 18:44:36', '104', 'Test 3 (25 marks)', '2014-15', '10', '7', '9', '22', '21', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(187, '', 40, '2014-04-30 10:12:39', '0000-00-00 00:00:00', '105', 'Test 3 (25 marks)', '2013-14', '8', '12', '7', '13', '22', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(188, '', 40, '2014-05-04 02:50:30', '2014-05-04 18:44:36', '105', 'Test 3 (25 marks)', '2014-15', '18', '24', '22', '23', '13', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(189, '', 40, '2014-05-01 00:00:57', '0000-00-00 00:00:00', '106', 'Test 3 (25 marks)', '2013-14', '7', '', '21', '', '17', '17', 'Well done.', 'Can do better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(190, '', 40, '2014-05-01 18:26:25', '2014-05-04 18:44:36', '106', 'Test 3 (25 marks)', '2014-15', '', '22', '17', '12', '11', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(191, '', 40, '2014-04-30 09:26:56', '2014-05-04 18:44:36', '107', 'Test 3 (25 marks)', '2013-14', '17', '24', '7', '8', '21', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(192, '', 40, '2014-05-04 00:53:36', '0000-00-00 00:00:00', '107', 'Test 3 (25 marks)', '2014-15', '', '21', '16', '23', '15', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(193, '', 40, '2014-05-03 09:56:18', '2014-05-04 18:44:36', '108', 'Test 3 (25 marks)', '2013-14', '6', '11', '15', '7', '24', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(194, '', 40, '2014-05-03 23:09:32', '0000-00-00 00:00:00', '108', 'Test 3 (25 marks)', '2014-15', '8', '13', '8', '16', '21', '23', 'Well done.', 'Well done.', 'Needs to improve', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(195, '', 40, '2014-05-01 01:31:16', '2014-05-04 18:44:36', '109', 'Test 3 (25 marks)', '2014-15', '', '9', '18', '10', '16', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Can do better.', 'Save'),
(196, '', 40, '2014-05-03 20:51:47', '2014-05-04 18:44:36', '110', 'Test 3 (25 marks)', '2013-14', '14', '21', '10', '', '13', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(197, '', 40, '2014-04-28 21:50:33', '2014-05-04 18:44:36', '110', 'Test 3 (25 marks)', '2014-15', '23', '20', '16', '12', '', '17', 'Can do better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(198, '', 40, '2014-04-29 08:32:37', '2014-05-04 18:44:36', '112', 'Test 3 (25 marks)', '2013-14', '12', '13', '17', '12', '11', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Need to work independently.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(199, '', 40, '2014-04-29 21:26:31', '2014-05-04 18:44:36', '112', 'Test 3 (25 marks)', '2014-15', '16', '11', '8', '', '21', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Good job in English and Kannada.', 'Save'),
(200, '', 40, '2014-05-01 20:20:57', '2014-05-04 18:44:36', '113', 'Test 3 (25 marks)', '2013-14', '18', '', '20', '9', '10', '16', 'Well done.', 'Well done.', 'Needs to improve', '34/36', 'Concentrate. Too playful.', 'Save'),
(201, '', 40, '2014-04-30 12:32:16', '2014-05-04 18:44:36', '113', 'Test 3 (25 marks)', '2014-15', '19', '12', '7', '13', '', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '36/36', 'Good job in English and Kannada.', 'Save'),
(202, '', 40, '2014-04-30 15:41:40', '2014-05-04 18:44:36', '114', 'Test 3 (25 marks)', '2013-14', '14', '19', '24', '16', '13', '11', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(203, '', 40, '2014-05-03 13:26:09', '2014-05-04 18:44:36', '114', 'Test 3 (25 marks)', '2014-15', '19', '21', '12', '15', '24', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Can do better.', 'Save'),
(204, '', 40, '2014-04-29 12:29:09', '2014-05-04 18:44:36', '115', 'Test 3 (25 marks)', '2013-14', '25', '18', '12', '', '21', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(205, '', 40, '2014-05-03 07:57:13', '0000-00-00 00:00:00', '115', 'Test 3 (25 marks)', '2014-15', '7', '22', '8', '25', '11', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(206, '', 40, '2014-05-01 01:17:57', '2014-05-04 18:44:36', '116', 'Test 3 (25 marks)', '2013-14', '11', '7', '12', '15', '16', '13', 'Well done.', 'Well done.', 'Good', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(207, '', 40, '2014-04-29 14:29:07', '2014-05-04 18:44:36', '116', 'Test 3 (25 marks)', '2014-15', '20', '19', '16', '8', '11', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(208, '', 40, '2014-05-03 23:05:14', '2014-05-04 18:44:36', '117', 'Test 3 (25 marks)', '2013-14', '15', '20', '', '7', '', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(209, '', 40, '2014-05-01 05:59:37', '2014-05-04 18:44:36', '117', 'Test 3 (25 marks)', '2014-15', '16', '15', '23', '8', '24', '15', 'Can do better.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(210, '', 40, '2014-04-29 05:11:21', '2014-05-04 18:44:36', '118', 'Test 3 (25 marks)', '2013-14', '18', '8', '20', '9', '8', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(211, '', 40, '2014-05-01 00:13:36', '2014-05-04 18:44:36', '118', 'Test 3 (25 marks)', '2014-15', '12', '21', '19', '24', '7', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(212, '', 40, '2014-04-30 03:54:12', '2014-05-04 18:44:36', '119', 'Test 3 (25 marks)', '2014-15', '7', '12', '7', '24', '10', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(213, '', 40, '2014-05-01 07:39:06', '0000-00-00 00:00:00', '120', 'Test 3 (25 marks)', '2013-14', '24', '14', '21', '8', '13', '21', 'Can do better.', 'Well done.', 'Good', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(214, '', 40, '2014-04-29 00:35:11', '2014-05-04 18:44:36', '120', 'Test 3 (25 marks)', '2014-15', '9', '19', '7', '20', '16', '24', 'Can do better.', 'Can do better.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(215, '', 40, '2014-05-03 09:25:53', '2014-05-04 18:44:36', '121', 'Test 3 (25 marks)', '2013-14', '6', '9', '16', '16', '14', '8', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(216, '', 40, '2014-05-01 04:56:51', '0000-00-00 00:00:00', '121', 'Test 3 (25 marks)', '2014-15', '7', '11', '15', '9', '9', '14', 'Can do better.', 'Can do better.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(217, '', 40, '2014-05-01 18:12:37', '0000-00-00 00:00:00', '122', 'Test 3 (25 marks)', '2013-14', '13', '22', '', '10', '24', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(218, '', 40, '2014-04-30 19:40:42', '2014-05-04 18:44:36', '122', 'Test 3 (25 marks)', '2014-15', '19', '6', '17', '18', '18', '18', 'Can do better.', 'Can do better.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(219, '', 40, '2014-05-02 22:57:18', '0000-00-00 00:00:00', '123', 'Test 3 (25 marks)', '2013-14', '14', '6', '15', '21', '8', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(220, '', 40, '2014-05-01 00:31:34', '0000-00-00 00:00:00', '123', 'Test 3 (25 marks)', '2014-15', '24', '22', '17', '18', '16', '20', 'Can do better.', 'Well done.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(221, '', 40, '2014-05-02 09:00:44', '2014-05-04 18:44:36', '124', 'Test 3 (25 marks)', '2013-14', '8', '9', '21', '12', '14', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(222, '', 40, '2014-04-29 04:49:59', '2014-05-04 18:44:36', '124', 'Test 3 (25 marks)', '2014-15', '11', '19', '21', '9', '21', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(223, '', 40, '2014-05-02 02:38:24', '2014-05-04 18:44:36', '125', 'Test 3 (25 marks)', '2013-14', '25', '13', '20', '23', '24', '21', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(224, '', 40, '2014-04-30 18:27:03', '0000-00-00 00:00:00', '125', 'Test 3 (25 marks)', '2014-15', '', '20', '24', '15', '', '22', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Need to work hard.', 'Save'),
(225, '', 40, '2014-05-01 18:34:14', '2014-05-04 18:44:36', '126', 'Test 3 (25 marks)', '2013-14', '20', '13', '', '11', '22', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(226, '', 40, '2014-04-29 10:16:09', '0000-00-00 00:00:00', '126', 'Test 3 (25 marks)', '2014-15', '13', '15', '13', '16', '7', '9', 'Well done.', 'Can do better.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(227, '', 40, '2014-04-30 01:23:54', '2014-05-04 18:44:36', '127', 'Test 3 (25 marks)', '2013-14', '20', '8', '20', '20', '16', '15', 'Well done.', 'Can do better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(228, '', 40, '2014-05-03 12:52:59', '2014-05-04 18:44:36', '128', 'Test 3 (25 marks)', '2013-14', '', '13', '11', '21', '22', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Can do better.', 'Save'),
(229, '', 40, '2014-04-30 08:37:52', '2014-05-04 18:44:36', '128', 'Test 3 (25 marks)', '2014-15', '13', '10', '16', '12', '22', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Good job in English and Kannada.', 'Save'),
(230, '', 40, '2014-05-03 16:24:19', '2014-05-04 18:44:36', '129', 'Test 3 (25 marks)', '2013-14', '16', '11', '20', '23', '19', '18', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(231, '', 40, '2014-05-02 01:22:11', '2014-05-04 18:44:36', '129', 'Test 3 (25 marks)', '2014-15', '13', '6', '8', '19', '23', '17', 'Well done.', 'Well done.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(232, '', 40, '2014-04-30 10:29:15', '0000-00-00 00:00:00', '130', 'Test 3 (25 marks)', '2013-14', '20', '19', '12', '21', '14', '12', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Need to work independently.', 'Save'),
(233, '', 40, '2014-04-30 00:00:04', '2014-05-04 18:44:36', '130', 'Test 3 (25 marks)', '2014-15', '21', '23', '11', '20', '17', '19', 'Well done.', 'Can do better.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(234, '', 40, '2014-04-29 17:11:59', '2014-05-04 18:44:36', '131', 'Test 3 (25 marks)', '2013-14', '10', '8', '8', '10', '14', '18', 'Can do better.', 'Well done.', 'Good', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(235, '', 40, '2014-04-30 18:55:49', '2014-05-04 18:44:36', '131', 'Test 3 (25 marks)', '2014-15', '12', '24', '23', '8', '14', '20', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Good job in English and Kannada.', 'Save'),
(236, '', 40, '2014-04-30 01:08:10', '2014-05-04 18:44:36', '132', 'Test 3 (25 marks)', '2013-14', '20', '19', '7', '7', '7', '10', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(237, '', 40, '2014-05-02 16:49:06', '2014-05-04 18:44:36', '132', 'Test 3 (25 marks)', '2014-15', '7', '8', '', '22', '6', '20', 'Can do better.', 'Can do better.', 'Excellent', '35/36', 'Concentrate. Too playful.', 'Save'),
(238, '', 40, '2014-04-29 08:29:59', '2014-05-04 18:44:36', '133', 'Test 3 (25 marks)', '2013-14', '12', '25', '6', '11', '12', '22', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(239, '', 40, '2014-05-04 01:18:10', '2014-05-04 18:44:36', '133', 'Test 3 (25 marks)', '2014-15', '23', '16', '15', '17', '21', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work hard.', 'Save'),
(240, '', 40, '2014-05-04 05:22:39', '2014-05-04 18:44:36', '134', 'Test 3 (25 marks)', '2013-14', '18', '', '11', '14', '14', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(241, '', 40, '2014-04-30 10:37:04', '2014-05-04 18:44:36', '134', 'Test 3 (25 marks)', '2014-15', '24', '16', '15', '9', '23', '24', 'Well done.', 'Well done.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(242, '', 40, '2014-05-03 14:46:25', '2014-05-04 18:44:36', '135', 'Test 3 (25 marks)', '2014-15', '6', '18', '17', '6', '17', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(243, '', 40, '2014-05-01 20:31:33', '2014-05-04 18:44:36', '136', 'Test 3 (25 marks)', '2014-15', '21', '8', '12', '24', '7', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(244, '', 40, '2014-04-30 02:33:53', '2014-05-04 18:44:36', '137', 'Test 3 (25 marks)', '2013-14', '24', '24', '21', '13', '19', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(245, '', 40, '2014-05-01 05:16:21', '2014-05-04 18:44:36', '137', 'Test 3 (25 marks)', '2014-15', '6', '18', '18', '9', '10', '22', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Can do better.', 'Save'),
(246, '', 40, '2014-04-30 03:40:35', '2014-05-04 18:44:36', '138', 'Test 3 (25 marks)', '2014-15', '', '18', '6', '', '14', '11', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(247, '', 40, '2014-04-29 05:15:41', '2014-05-04 18:44:36', '139', 'Test 3 (25 marks)', '2013-14', '', '18', '', '19', '', '22', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(248, '', 40, '2014-05-03 06:20:31', '0000-00-00 00:00:00', '139', 'Test 3 (25 marks)', '2014-15', '9', '22', '15', '7', '20', '22', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(249, '', 40, '2014-04-30 01:20:04', '2014-05-04 18:44:36', '140', 'Test 3 (25 marks)', '2014-15', '14', '21', '7', '7', '', '14', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Can do better.', 'Save'),
(250, '', 40, '2014-05-01 02:00:21', '2014-05-04 18:44:36', '141', 'Test 3 (25 marks)', '2013-14', '6', '15', '6', '21', '20', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work hard.', 'Save'),
(251, '', 40, '2014-04-30 11:40:28', '2014-05-04 18:44:36', '141', 'Test 3 (25 marks)', '2014-15', '', '15', '24', '14', '8', '14', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(252, '', 40, '2014-05-04 02:26:29', '2014-05-04 18:44:36', '142', 'Test 3 (25 marks)', '2013-14', '7', '13', '12', '8', '24', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(253, '', 40, '2014-05-03 23:54:21', '2014-05-04 18:44:36', '142', 'Test 3 (25 marks)', '2014-15', '24', '18', '20', '12', '18', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(254, '', 40, '2014-05-01 03:50:36', '0000-00-00 00:00:00', '143', 'Test 3 (25 marks)', '2013-14', '25', '25', '7', '24', '10', '11', 'Can do better.', 'Can do better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(255, '', 40, '2014-04-30 12:59:20', '2014-05-04 18:44:36', '143', 'Test 3 (25 marks)', '2014-15', '21', '', '19', '24', '16', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(256, '', 40, '2014-04-29 13:26:43', '2014-05-04 18:44:36', '144', 'Test 3 (25 marks)', '2013-14', '19', '20', '15', '17', '7', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '30/36', 'Good job in English and Kannada.', 'Save'),
(257, '', 40, '2014-04-29 21:04:40', '0000-00-00 00:00:00', '145', 'Test 3 (25 marks)', '2014-15', '19', '24', '22', '7', '16', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(258, '', 40, '2014-04-29 01:43:16', '2014-05-04 18:44:36', '146', 'Test 3 (25 marks)', '2013-14', '19', '8', '22', '16', '19', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(259, '', 40, '2014-05-03 19:50:20', '2014-05-04 18:44:36', '146', 'Test 3 (25 marks)', '2014-15', '24', '9', '24', '8', '13', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(260, '', 40, '2014-05-01 16:05:44', '2014-05-04 18:44:36', '147', 'Test 3 (25 marks)', '2013-14', '22', '12', '12', '6', '7', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Can do better.', 'Save'),
(261, '', 40, '2014-04-28 21:54:35', '0000-00-00 00:00:00', '148', 'Test 3 (25 marks)', '2013-14', '14', '8', '25', '9', '10', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(262, '', 40, '2014-05-03 16:29:19', '0000-00-00 00:00:00', '148', 'Test 3 (25 marks)', '2014-15', '11', '21', '14', '14', '', '8', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(263, '', 40, '2014-05-02 18:49:12', '2014-05-04 18:44:36', '149', 'Test 3 (25 marks)', '2013-14', '18', '12', '21', '18', '16', '12', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(264, '', 40, '2014-04-30 14:06:49', '2014-05-04 18:44:36', '149', 'Test 3 (25 marks)', '2014-15', '17', '16', '9', '23', '11', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(265, '', 40, '2014-04-30 09:25:01', '0000-00-00 00:00:00', '150', 'Test 3 (25 marks)', '2013-14', '23', '18', '19', '13', '6', '22', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(266, '', 40, '2014-05-02 01:51:14', '2014-05-04 18:44:36', '150', 'Test 3 (25 marks)', '2014-15', '16', '9', '20', '6', '17', '18', 'Can do better.', 'Well done.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(267, '', 40, '2014-05-02 21:01:10', '0000-00-00 00:00:00', '151', 'Test 3 (25 marks)', '2014-15', '14', '24', '21', '', '17', '18', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Concentrate. Too playful.', 'Save'),
(268, '', 40, '2014-04-30 16:39:42', '2014-05-04 18:44:36', '152', 'Test 3 (25 marks)', '2013-14', '14', '15', '8', '16', '24', '14', 'Can do better.', 'Well done.', 'Good', '36/36', 'Need to work independently.', 'Save'),
(269, '', 40, '2014-05-01 16:35:06', '2014-05-04 18:44:36', '153', 'Test 3 (25 marks)', '2013-14', '22', '7', '11', '11', '7', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Good work.', 'Save'),
(270, '', 40, '2014-05-01 21:03:26', '2014-05-04 18:44:36', '153', 'Test 3 (25 marks)', '2014-15', '18', '12', '12', '20', '11', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Good work.', 'Save'),
(271, '', 40, '2014-05-03 21:23:10', '2014-05-04 18:44:36', '154', 'Test 3 (25 marks)', '2013-14', '18', '21', '11', '16', '15', '22', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(272, '', 40, '2014-05-04 00:00:02', '0000-00-00 00:00:00', '154', 'Test 3 (25 marks)', '2014-15', '16', '23', '9', '23', '17', '20', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(273, '', 40, '2014-04-30 07:56:19', '2014-05-04 18:44:36', '155', 'Test 3 (25 marks)', '2013-14', '24', '21', '7', '13', '20', '16', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Need to work hard.', 'Save'),
(274, '', 40, '2014-04-29 15:26:11', '2014-05-04 18:44:37', '156', 'Test 3 (25 marks)', '2013-14', '17', '8', '14', '16', '16', '12', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Good work.', 'Save'),
(275, '', 40, '2014-04-30 15:04:54', '2014-05-04 18:44:37', '156', 'Test 3 (25 marks)', '2014-15', '16', '19', '13', '', '15', '17', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(276, '', 40, '2014-04-29 06:14:08', '2014-05-04 18:44:37', '157', 'Test 3 (25 marks)', '2013-14', '14', '10', '24', '17', '11', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(277, '', 40, '2014-05-02 23:56:11', '0000-00-00 00:00:00', '157', 'Test 3 (25 marks)', '2014-15', '10', '21', '6', '12', '16', '9', 'Can do better.', 'Well done.', 'Good', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(278, '', 40, '2014-05-01 06:52:36', '0000-00-00 00:00:00', '158', 'Test 3 (25 marks)', '2013-14', '10', '16', '10', '24', '19', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(279, '', 40, '2014-05-01 17:08:03', '0000-00-00 00:00:00', '158', 'Test 3 (25 marks)', '2014-15', '19', '17', '21', '24', '21', '14', 'Can do better.', 'Can do better.', 'Excellent', '34/36', 'Concentrate. Too playful.', 'Save'),
(280, '', 40, '2014-05-01 13:19:44', '2014-05-04 18:44:37', '159', 'Test 3 (25 marks)', '2013-14', '6', '', '19', '18', '23', '22', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(281, '', 40, '2014-04-29 05:54:15', '2014-05-04 18:44:37', '159', 'Test 3 (25 marks)', '2014-15', '17', '7', '10', '9', '', '7', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(282, '', 40, '2014-04-30 14:59:23', '2014-05-04 18:44:37', '1', 'Test 4 (25 marks)', '2013-14', '19', '7', '17', '17', '10', '10', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '27/36', 'Good work.', 'Save'),
(283, '', 40, '2014-04-30 09:57:08', '2014-05-04 18:44:37', '1', 'Test 4 (25 marks)', '2014-15', '23', '14', '25', '10', '6', '21', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good work.', 'Save'),
(284, '', 40, '2014-05-03 15:46:47', '2014-05-04 18:44:37', '2', 'Test 4 (25 marks)', '2013-14', '20', '7', '14', '9', '14', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Concentrate. Too playful.', 'Save'),
(285, '', 40, '2014-05-01 05:30:30', '2014-05-04 18:44:37', '3', 'Test 4 (25 marks)', '2013-14', '19', '6', '21', '16', '21', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(286, '', 40, '2014-04-30 11:47:11', '0000-00-00 00:00:00', '4', 'Test 4 (25 marks)', '2013-14', '18', '21', '13', '19', '16', '19', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(287, '', 40, '2014-05-03 04:24:52', '2014-05-04 18:44:37', '4', 'Test 4 (25 marks)', '2014-15', '8', '19', '22', '20', '17', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(288, '', 40, '2014-05-01 01:14:24', '2014-05-04 18:44:37', '5', 'Test 4 (25 marks)', '2013-14', '19', '15', '11', '10', '13', '12', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(289, '', 40, '2014-04-30 16:18:18', '0000-00-00 00:00:00', '5', 'Test 4 (25 marks)', '2014-15', '8', '9', '22', '24', '14', '13', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Concentrate. Too playful.', 'Save'),
(290, '', 40, '2014-05-01 22:34:06', '2014-05-04 18:44:37', '6', 'Test 4 (25 marks)', '2013-14', '16', '6', '17', '17', '8', '13', 'Well done.', 'Well done.', 'Good', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(291, '', 40, '2014-04-29 17:11:51', '2014-05-04 18:44:37', '6', 'Test 4 (25 marks)', '2014-15', '6', '19', '8', '18', '7', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(292, '', 40, '2014-05-03 18:17:01', '2014-05-04 18:44:37', '7', 'Test 4 (25 marks)', '2013-14', '23', '10', '21', '15', '24', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(293, '', 40, '2014-05-04 05:01:13', '0000-00-00 00:00:00', '7', 'Test 4 (25 marks)', '2014-15', '22', '7', '13', '15', '17', '22', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(294, '', 40, '2014-05-04 00:49:46', '2014-05-04 18:44:37', '8', 'Test 4 (25 marks)', '2013-14', '15', '', '12', '21', '6', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(295, '', 40, '2014-04-28 22:50:51', '2014-05-04 18:44:37', '8', 'Test 4 (25 marks)', '2014-15', '11', '14', '21', '15', '22', '13', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(296, '', 40, '2014-05-02 10:14:03', '2014-05-04 18:44:37', '9', 'Test 4 (25 marks)', '2013-14', '21', '23', '24', '', '6', '8', 'Can do better.', 'Can do better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(297, '', 40, '2014-05-01 06:04:13', '2014-05-04 18:44:37', '9', 'Test 4 (25 marks)', '2014-15', '12', '8', '9', '8', '10', '', 'Can do better.', 'Can do better.', 'Good', '28/36', 'Good job in English and Kannada.', 'Save'),
(298, '', 40, '2014-05-03 13:20:09', '2014-05-04 18:44:37', '10', 'Test 4 (25 marks)', '2013-14', '12', '12', '13', '20', '24', '7', 'Well done.', 'Well done.', 'Excellent', '26/36', 'Can do better.', 'Save'),
(299, '', 40, '2014-04-30 19:06:18', '2014-05-04 18:44:37', '10', 'Test 4 (25 marks)', '2014-15', '8', '24', '17', '20', '20', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(300, '', 40, '2014-05-02 21:00:52', '2014-05-04 18:44:37', '11', 'Test 4 (25 marks)', '2013-14', '8', '14', '16', '15', '7', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '28/36', 'Need to work independently.', 'Save'),
(301, '', 40, '2014-05-02 08:07:48', '2014-05-04 18:44:37', '11', 'Test 4 (25 marks)', '2014-15', '17', '11', '20', '8', '8', '11', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(302, '', 40, '2014-05-01 00:18:20', '2014-05-04 18:44:37', '12', 'Test 4 (25 marks)', '2013-14', '14', '22', '10', '7', '21', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Can do better.', 'Save'),
(303, '', 40, '2014-05-02 15:30:40', '0000-00-00 00:00:00', '12', 'Test 4 (25 marks)', '2014-15', '8', '23', '14', '11', '19', '12', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(304, '', 40, '2014-05-02 18:31:50', '2014-05-04 18:44:37', '13', 'Test 4 (25 marks)', '2013-14', '12', '', '16', '19', '7', '13', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Good work.', 'Save'),
(305, '', 40, '2014-05-01 13:28:32', '2014-05-04 18:44:37', '13', 'Test 4 (25 marks)', '2014-15', '14', '23', '11', '8', '', '19', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good work.', 'Save'),
(306, '', 40, '2014-05-03 16:15:32', '0000-00-00 00:00:00', '14', 'Test 4 (25 marks)', '2013-14', '18', '14', '13', '20', '11', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work independently.', 'Save'),
(307, '', 40, '2014-05-01 11:22:12', '2014-05-04 18:44:37', '14', 'Test 4 (25 marks)', '2014-15', '10', '22', '23', '10', '23', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Can do better.', 'Save'),
(308, '', 40, '2014-04-29 20:01:26', '0000-00-00 00:00:00', '15', 'Test 4 (25 marks)', '2013-14', '13', '23', '10', '9', '13', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(309, '', 40, '2014-05-03 08:07:12', '2014-05-04 18:44:37', '15', 'Test 4 (25 marks)', '2014-15', '12', '19', '12', '22', '12', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(310, '', 40, '2014-05-01 16:49:54', '2014-05-04 18:44:37', '16', 'Test 4 (25 marks)', '2013-14', '8', '7', '20', '25', '16', '11', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(311, '', 40, '2014-05-01 00:26:26', '0000-00-00 00:00:00', '17', 'Test 4 (25 marks)', '2013-14', '18', '7', '24', '15', '19', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(312, '', 40, '2014-05-02 20:51:56', '2014-05-04 18:44:37', '17', 'Test 4 (25 marks)', '2014-15', '12', '7', '12', '', '8', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '30/36', 'Good work.', 'Save'),
(313, '', 40, '2014-04-30 00:54:58', '0000-00-00 00:00:00', '18', 'Test 4 (25 marks)', '2013-14', '', '8', '9', '25', '', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Good work.', 'Save'),
(314, '', 40, '2014-04-30 10:24:41', '2014-05-04 18:44:37', '18', 'Test 4 (25 marks)', '2014-15', '11', '15', '16', '9', '11', '20', 'Can do better.', 'Can do better.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(315, '', 40, '2014-05-01 12:30:53', '2014-05-04 18:44:37', '19', 'Test 4 (25 marks)', '2013-14', '16', '19', '10', '9', '10', '12', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Good work.', 'Save'),
(316, '', 40, '2014-05-03 13:52:28', '2014-05-04 18:44:37', '19', 'Test 4 (25 marks)', '2014-15', '6', '17', '21', '19', '7', '17', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(317, '', 40, '2014-05-02 08:50:51', '0000-00-00 00:00:00', '20', 'Test 4 (25 marks)', '2013-14', '17', '23', '7', '24', '11', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work hard.', 'Save'),
(318, '', 40, '2014-04-30 15:01:50', '2014-05-04 18:44:37', '20', 'Test 4 (25 marks)', '2014-15', '11', '23', '9', '12', '22', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Good job in English and Kannada.', 'Save'),
(319, '', 40, '2014-04-29 19:55:02', '2014-05-04 18:44:37', '21', 'Test 4 (25 marks)', '2013-14', '18', '18', '16', '', '6', '10', 'Well done.', 'Well done.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(320, '', 40, '2014-04-29 17:33:28', '2014-05-04 18:44:37', '21', 'Test 4 (25 marks)', '2014-15', '18', '15', '21', '11', '23', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(321, '', 40, '2014-05-01 23:21:44', '2014-05-04 18:44:37', '22', 'Test 4 (25 marks)', '2013-14', '10', '12', '16', '21', '13', '6', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Can do better.', 'Save'),
(322, '', 40, '2014-05-04 01:41:24', '2014-05-04 18:44:37', '23', 'Test 4 (25 marks)', '2013-14', '10', '12', '22', '24', '23', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(323, '', 40, '2014-04-30 09:37:57', '0000-00-00 00:00:00', '23', 'Test 4 (25 marks)', '2014-15', '', '24', '13', '10', '8', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(324, '', 40, '2014-05-01 02:09:30', '2014-05-04 18:44:37', '24', 'Test 4 (25 marks)', '2013-14', '19', '8', '7', '21', '', '18', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Good job in English and Kannada.', 'Save'),
(325, '', 40, '2014-04-29 05:35:09', '2014-05-04 18:44:37', '24', 'Test 4 (25 marks)', '2014-15', '8', '10', '7', '24', '', '24', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Need to work independently.', 'Save'),
(326, '', 40, '2014-04-29 20:58:42', '2014-05-04 18:44:37', '25', 'Test 4 (25 marks)', '2013-14', '25', '10', '18', '9', '6', '13', 'Can do better.', 'Well done.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(327, '', 40, '2014-05-02 13:31:21', '2014-05-04 18:44:37', '25', 'Test 4 (25 marks)', '2014-15', '21', '12', '8', '11', '20', '15', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(328, '', 40, '2014-05-03 09:16:52', '0000-00-00 00:00:00', '26', 'Test 4 (25 marks)', '2013-14', '6', '6', '13', '23', '6', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Good work.', 'Save'),
(329, '', 40, '2014-04-29 07:13:42', '0000-00-00 00:00:00', '26', 'Test 4 (25 marks)', '2014-15', '24', '8', '15', '20', '11', '17', 'Can do better.', 'Well done.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(330, '', 40, '2014-04-30 13:54:41', '2014-05-04 18:44:37', '27', 'Test 4 (25 marks)', '2013-14', '14', '13', '24', '7', '19', '7', 'Can do better.', 'Can do better.', 'Excellent', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(331, '', 40, '2014-05-01 03:56:23', '2014-05-04 18:44:37', '27', 'Test 4 (25 marks)', '2014-15', '10', '17', '17', '9', '16', '14', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good job in English and Kannada.', 'Save'),
(332, '', 40, '2014-05-02 23:49:00', '0000-00-00 00:00:00', '28', 'Test 4 (25 marks)', '2013-14', '13', '14', '9', '18', '11', '11', 'Well done.', 'Can do better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(333, '', 40, '2014-04-29 21:04:59', '2014-05-04 18:44:37', '28', 'Test 4 (25 marks)', '2014-15', '17', '18', '21', '10', '', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(334, '', 40, '2014-05-03 22:05:49', '2014-05-04 18:44:37', '29', 'Test 4 (25 marks)', '2013-14', '15', '18', '7', '24', '13', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(335, '', 40, '2014-04-28 22:09:38', '2014-05-04 18:44:37', '29', 'Test 4 (25 marks)', '2014-15', '21', '22', '20', '18', '22', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(336, '', 40, '2014-04-29 04:04:55', '0000-00-00 00:00:00', '30', 'Test 4 (25 marks)', '2013-14', '8', '7', '8', '12', '16', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(337, '', 40, '2014-04-28 21:48:03', '2014-05-04 18:44:37', '30', 'Test 4 (25 marks)', '2014-15', '24', '7', '14', '7', '14', '16', 'Well done.', 'Can do better.', 'Good', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(338, '', 40, '2014-05-02 18:07:12', '2014-05-04 18:44:37', '31', 'Test 4 (25 marks)', '2013-14', '12', '8', '16', '11', '', '22', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(339, '', 40, '2014-04-29 05:27:29', '2014-05-04 18:44:37', '31', 'Test 4 (25 marks)', '2014-15', '23', '10', '8', '20', '7', '7', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(340, '', 40, '2014-05-03 22:59:01', '2014-05-04 18:44:37', '32', 'Test 4 (25 marks)', '2013-14', '12', '23', '', '21', '11', '17', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(341, '', 40, '2014-04-30 23:37:44', '0000-00-00 00:00:00', '32', 'Test 4 (25 marks)', '2014-15', '6', '22', '17', '', '22', '15', 'Can do better.', 'Can do better.', 'Good', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(342, '', 40, '2014-04-29 06:41:40', '2014-05-04 18:44:37', '33', 'Test 4 (25 marks)', '2013-14', '8', '18', '', '8', '20', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Good work.', 'Save'),
(343, '', 40, '2014-05-01 03:07:25', '2014-05-04 18:44:37', '34', 'Test 4 (25 marks)', '2014-15', '11', '25', '12', '15', '12', '9', 'Can do better.', 'Can do better.', 'Needs to improve', '28/36', 'Can do better.', 'Save'),
(344, '', 40, '2014-05-04 01:40:34', '2014-05-04 18:44:37', '35', 'Test 4 (25 marks)', '2013-14', '21', '19', '', '16', '', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '32/36', 'Good job in English and Kannada.', 'Save'),
(345, '', 40, '2014-04-29 22:31:11', '2014-05-04 18:44:37', '35', 'Test 4 (25 marks)', '2014-15', '8', '14', '12', '7', '21', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(346, '', 40, '2014-04-30 17:07:29', '2014-05-04 18:44:37', '36', 'Test 4 (25 marks)', '2013-14', '11', '', '24', '13', '21', '11', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(347, '', 40, '2014-05-02 05:40:57', '2014-05-04 18:44:37', '36', 'Test 4 (25 marks)', '2014-15', '11', '6', '12', '22', '17', '20', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(348, '', 40, '2014-05-01 11:36:25', '0000-00-00 00:00:00', '37', 'Test 4 (25 marks)', '2013-14', '22', '8', '21', '13', '15', '24', 'Well done.', 'Can do better.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(349, '', 40, '2014-04-28 22:26:03', '2014-05-04 18:44:37', '38', 'Test 4 (25 marks)', '2013-14', '', '17', '9', '', '12', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(350, '', 40, '2014-04-30 09:07:50', '0000-00-00 00:00:00', '38', 'Test 4 (25 marks)', '2014-15', '14', '20', '24', '20', '17', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(351, '', 40, '2014-05-02 17:00:17', '2014-05-04 18:44:37', '39', 'Test 4 (25 marks)', '2013-14', '12', '17', '17', '7', '23', '', 'Well done.', 'Well done.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(352, '', 40, '2014-04-29 16:00:43', '0000-00-00 00:00:00', '39', 'Test 4 (25 marks)', '2014-15', '17', '18', '7', '12', '8', '16', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work hard.', 'Save'),
(353, '', 40, '2014-05-02 06:15:54', '2014-05-04 18:44:37', '41', 'Test 4 (25 marks)', '2013-14', '', '19', '7', '15', '', '6', 'Well done.', 'Well done.', 'Excellent', '29/36', 'Good job in English and Kannada.', 'Save'),
(354, '', 40, '2014-05-01 06:46:34', '2014-05-04 18:44:37', '41', 'Test 4 (25 marks)', '2014-15', '14', '19', '16', '17', '16', '23', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(355, '', 40, '2014-05-01 09:36:28', '2014-05-04 18:44:37', '42', 'Test 4 (25 marks)', '2013-14', '14', '16', '11', '13', '', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '32/36', 'Good job in English and Kannada.', 'Save'),
(356, '', 40, '2014-05-02 01:36:25', '2014-05-04 18:44:37', '42', 'Test 4 (25 marks)', '2014-15', '7', '17', '21', '10', '16', '9', 'Well done.', 'Can do better.', 'Excellent', '34/36', 'Good work.', 'Save'),
(357, '', 40, '2014-05-01 11:31:48', '2014-05-04 18:44:37', '43', 'Test 4 (25 marks)', '2013-14', '13', '16', '17', '20', '19', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(358, '', 40, '2014-05-03 06:18:01', '2014-05-04 18:44:37', '43', 'Test 4 (25 marks)', '2014-15', '7', '', '18', '23', '8', '16', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(359, '', 40, '2014-05-03 19:13:38', '2014-05-04 18:44:37', '44', 'Test 4 (25 marks)', '2013-14', '19', '23', '13', '12', '21', '', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(360, '', 40, '2014-05-03 02:21:55', '2014-05-04 18:44:37', '44', 'Test 4 (25 marks)', '2014-15', '20', '13', '7', '7', '15', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(361, '', 40, '2014-04-29 12:55:15', '0000-00-00 00:00:00', '45', 'Test 4 (25 marks)', '2013-14', '9', '21', '14', '', '6', '6', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(362, '', 40, '2014-05-04 03:56:42', '2014-05-04 18:44:37', '45', 'Test 4 (25 marks)', '2014-15', '16', '14', '18', '8', '22', '13', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(363, '', 40, '2014-05-04 05:33:02', '0000-00-00 00:00:00', '46', 'Test 4 (25 marks)', '2013-14', '8', '10', '', '12', '11', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(364, '', 40, '2014-04-30 20:29:06', '2014-05-04 18:44:37', '46', 'Test 4 (25 marks)', '2014-15', '12', '19', '25', '23', '8', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(365, '', 40, '2014-05-01 21:07:26', '2014-05-04 18:44:37', '47', 'Test 4 (25 marks)', '2014-15', '22', '14', '22', '13', '15', '19', 'Well done.', 'Can do better.', 'Good', '26/36', 'Concentrate. Too playful.', 'Save'),
(366, '', 40, '2014-05-01 09:58:29', '2014-05-04 18:44:37', '48', 'Test 4 (25 marks)', '2013-14', '20', '21', '12', '23', '9', '10', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(367, '', 40, '2014-04-29 12:49:03', '2014-05-04 18:44:37', '48', 'Test 4 (25 marks)', '2014-15', '', '', '15', '', '12', '13', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard.', 'Save'),
(368, '', 40, '2014-05-02 03:17:36', '2014-05-04 18:44:37', '49', 'Test 4 (25 marks)', '2013-14', '15', '22', '19', '13', '6', '16', 'Well done.', 'Well done.', 'Excellent', '32/36', 'Need to work independently.', 'Save'),
(369, '', 40, '2014-05-02 13:47:43', '0000-00-00 00:00:00', '49', 'Test 4 (25 marks)', '2014-15', '12', '22', '18', '15', '9', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(370, '', 40, '2014-04-29 02:12:39', '2014-05-04 18:44:37', '50', 'Test 4 (25 marks)', '2013-14', '10', '13', '', '20', '22', '24', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(371, '', 40, '2014-05-01 23:00:19', '2014-05-04 18:44:37', '50', 'Test 4 (25 marks)', '2014-15', '16', '21', '14', '19', '13', '21', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(372, '', 40, '2014-04-30 15:11:58', '2014-05-04 18:44:37', '51', 'Test 4 (25 marks)', '2013-14', '19', '6', '17', '24', '14', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work hard.', 'Save'),
(373, '', 40, '2014-05-03 16:23:27', '2014-05-04 18:44:37', '51', 'Test 4 (25 marks)', '2014-15', '17', '13', '15', '23', '23', '22', 'Well done.', 'Can do better.', 'Good', '32/36', 'Good work.', 'Save'),
(374, '', 40, '2014-04-29 21:42:33', '2014-05-04 18:44:37', '52', 'Test 4 (25 marks)', '2013-14', '18', '15', '17', '19', '23', '23', 'Well done.', 'Well done.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(375, '', 40, '2014-05-03 06:50:35', '2014-05-04 18:44:37', '52', 'Test 4 (25 marks)', '2014-15', '19', '10', '8', '22', '25', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(376, '', 40, '2014-05-01 00:13:16', '2014-05-04 18:44:37', '53', 'Test 4 (25 marks)', '2013-14', '8', '23', '22', '22', '21', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(377, '', 40, '2014-04-30 18:43:57', '0000-00-00 00:00:00', '53', 'Test 4 (25 marks)', '2014-15', '16', '19', '7', '10', '16', '8', 'Well done.', 'Can do better.', 'Good', '29/36', 'Good job in English and Kannada.', 'Save'),
(378, '', 40, '2014-04-30 21:30:16', '2014-05-04 18:44:37', '54', 'Test 4 (25 marks)', '2014-15', '13', '17', '15', '9', '23', '8', 'Well done.', 'Can do better.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(379, '', 40, '2014-04-29 10:12:32', '2014-05-04 18:44:37', '55', 'Test 4 (25 marks)', '2013-14', '22', '', '11', '12', '16', '13', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(380, '', 40, '2014-04-29 00:45:02', '0000-00-00 00:00:00', '55', 'Test 4 (25 marks)', '2014-15', '13', '22', '17', '9', '20', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(381, '', 40, '2014-05-03 08:26:48', '2014-05-04 18:44:37', '56', 'Test 4 (25 marks)', '2013-14', '', '10', '6', '24', '13', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Need to work hard.', 'Save'),
(382, '', 40, '2014-04-29 07:43:35', '2014-05-04 18:44:37', '56', 'Test 4 (25 marks)', '2014-15', '17', '21', '20', '6', '17', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(383, '', 40, '2014-05-01 23:28:13', '2014-05-04 18:44:37', '57', 'Test 4 (25 marks)', '2013-14', '20', '8', '11', '19', '17', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(384, '', 40, '2014-04-29 10:15:42', '2014-05-04 18:44:37', '57', 'Test 4 (25 marks)', '2014-15', '17', '', '16', '25', '19', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(385, '', 40, '2014-05-01 14:13:42', '2014-05-04 18:44:37', '58', 'Test 4 (25 marks)', '2013-14', '13', '10', '9', '22', '9', '20', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(386, '', 40, '2014-04-29 22:04:04', '2014-05-04 18:44:37', '58', 'Test 4 (25 marks)', '2014-15', '24', '9', '9', '19', '12', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(387, '', 40, '2014-05-04 03:40:13', '2014-05-04 18:44:37', '59', 'Test 4 (25 marks)', '2013-14', '12', '', '12', '20', '10', '23', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Need to work hard.', 'Save'),
(388, '', 40, '2014-05-01 15:10:24', '2014-05-04 18:44:37', '60', 'Test 4 (25 marks)', '2013-14', '18', '7', '10', '11', '6', '22', 'Well done.', 'Can do better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(389, '', 40, '2014-05-02 10:33:38', '2014-05-04 18:44:37', '60', 'Test 4 (25 marks)', '2014-15', '16', '19', '6', '20', '', '7', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(390, '', 40, '2014-04-29 22:23:54', '2014-05-04 18:44:37', '61', 'Test 4 (25 marks)', '2013-14', '7', '24', '12', '16', '15', '24', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(391, '', 40, '2014-05-01 14:52:25', '0000-00-00 00:00:00', '61', 'Test 4 (25 marks)', '2014-15', '24', '11', '13', '22', '17', '17', 'Well done.', 'Can do better.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(392, '', 40, '2014-05-01 07:26:15', '2014-05-04 18:44:37', '62', 'Test 4 (25 marks)', '2013-14', '19', '8', '21', '14', '17', '13', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Good work.', 'Save'),
(393, '', 40, '2014-05-01 19:33:15', '2014-05-04 18:44:37', '62', 'Test 4 (25 marks)', '2014-15', '21', '6', '13', '24', '12', '7', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good work.', 'Save'),
(394, '', 40, '2014-04-29 01:31:44', '2014-05-04 18:44:37', '63', 'Test 4 (25 marks)', '2013-14', '19', '14', '19', '6', '21', '24', 'Can do better.', 'Well done.', 'Good', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(395, '', 40, '2014-05-02 11:04:25', '2014-05-04 18:44:37', '63', 'Test 4 (25 marks)', '2014-15', '23', '10', '17', '10', '22', '11', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(396, '', 40, '2014-04-28 22:42:38', '2014-05-04 18:44:37', '64', 'Test 4 (25 marks)', '2013-14', '8', '19', '9', '7', '15', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(397, '', 40, '2014-04-28 22:17:38', '2014-05-04 18:44:37', '64', 'Test 4 (25 marks)', '2014-15', '21', '7', '', '25', '18', '21', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(398, '', 40, '2014-05-01 08:25:06', '2014-05-04 18:44:37', '65', 'Test 4 (25 marks)', '2013-14', '23', '10', '22', '18', '14', '17', 'Well done.', 'Well done.', 'Good', '33/36', 'Good work.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(399, '', 40, '2014-05-03 16:05:33', '2014-05-04 18:44:37', '66', 'Test 4 (25 marks)', '2013-14', '', '24', '18', '18', '12', '16', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(400, '', 40, '2014-05-02 22:01:26', '2014-05-04 18:44:37', '66', 'Test 4 (25 marks)', '2014-15', '14', '', '14', '19', '18', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Good work.', 'Save'),
(401, '', 40, '2014-05-02 04:35:46', '2014-05-04 18:44:37', '67', 'Test 4 (25 marks)', '2013-14', '17', '', '17', '22', '22', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(402, '', 40, '2014-04-29 07:49:29', '2014-05-04 18:44:37', '67', 'Test 4 (25 marks)', '2014-15', '24', '17', '9', '13', '13', '15', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(403, '', 40, '2014-04-30 12:57:07', '2014-05-04 18:44:37', '68', 'Test 4 (25 marks)', '2013-14', '21', '', '24', '9', '21', '12', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(404, '', 40, '2014-04-29 22:21:45', '2014-05-04 18:44:37', '68', 'Test 4 (25 marks)', '2014-15', '21', '20', '14', '21', '6', '10', 'Well done.', 'Well done.', 'Good', '27/36', 'Good job in English and Kannada.', 'Save'),
(405, '', 40, '2014-04-29 12:20:03', '2014-05-04 18:44:37', '69', 'Test 4 (25 marks)', '2013-14', '23', '19', '9', '11', '', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Concentrate. Too playful.', 'Save'),
(406, '', 40, '2014-04-30 00:49:30', '0000-00-00 00:00:00', '69', 'Test 4 (25 marks)', '2014-15', '15', '13', '9', '12', '20', '15', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '30/36', 'Can do better.', 'Save'),
(407, '', 40, '2014-05-01 06:32:02', '0000-00-00 00:00:00', '70', 'Test 4 (25 marks)', '2013-14', '7', '23', '20', '13', '15', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(408, '', 40, '2014-05-03 21:50:13', '2014-05-04 18:44:37', '70', 'Test 4 (25 marks)', '2014-15', '17', '18', '19', '', '24', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(409, '', 40, '2014-04-29 08:07:17', '2014-05-04 18:44:37', '71', 'Test 4 (25 marks)', '2013-14', '11', '12', '23', '24', '20', '12', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(410, '', 40, '2014-05-02 06:59:04', '2014-05-04 18:44:37', '71', 'Test 4 (25 marks)', '2014-15', '14', '19', '23', '21', '11', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Concentrate. Too playful.', 'Save'),
(411, '', 40, '2014-05-02 16:13:35', '2014-05-04 18:44:37', '72', 'Test 4 (25 marks)', '2013-14', '18', '7', '6', '24', '11', '8', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(412, '', 40, '2014-05-03 07:39:07', '2014-05-04 18:44:37', '72', 'Test 4 (25 marks)', '2014-15', '22', '24', '9', '16', '15', '', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(413, '', 40, '2014-05-03 21:44:21', '2014-05-04 18:44:37', '73', 'Test 4 (25 marks)', '2013-14', '21', '25', '19', '22', '19', '', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(414, '', 40, '2014-05-01 02:02:44', '2014-05-04 18:44:37', '73', 'Test 4 (25 marks)', '2014-15', '21', '7', '13', '14', '12', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(415, '', 40, '2014-05-03 04:50:49', '2014-05-04 18:44:37', '74', 'Test 4 (25 marks)', '2013-14', '20', '17', '17', '15', '7', '9', 'Well done.', 'Well done.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(416, '', 40, '2014-04-29 06:05:10', '2014-05-04 18:44:37', '74', 'Test 4 (25 marks)', '2014-15', '21', '10', '22', '19', '11', '7', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(417, '', 40, '2014-04-30 17:57:45', '2014-05-04 18:44:37', '75', 'Test 4 (25 marks)', '2013-14', '10', '20', '24', '20', '13', '9', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard.', 'Save'),
(418, '', 40, '2014-05-01 23:20:52', '2014-05-04 18:44:37', '75', 'Test 4 (25 marks)', '2014-15', '19', '22', '13', '20', '13', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(419, '', 40, '2014-05-03 20:02:07', '2014-05-04 18:44:37', '76', 'Test 4 (25 marks)', '2013-14', '12', '15', '22', '19', '17', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(420, '', 40, '2014-04-30 15:31:48', '2014-05-04 18:44:37', '76', 'Test 4 (25 marks)', '2014-15', '23', '19', '21', '24', '11', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(421, '', 40, '2014-04-30 15:25:58', '2014-05-04 18:44:37', '77', 'Test 4 (25 marks)', '2013-14', '20', '12', '21', '14', '20', '21', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(422, '', 40, '2014-04-28 22:25:04', '2014-05-04 18:44:37', '77', 'Test 4 (25 marks)', '2014-15', '7', '', '22', '', '9', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(423, '', 40, '2014-05-02 13:41:14', '2014-05-04 18:44:37', '78', 'Test 4 (25 marks)', '2013-14', '14', '8', '21', '15', '7', '24', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(424, '', 40, '2014-05-01 08:30:04', '2014-05-04 18:44:37', '78', 'Test 4 (25 marks)', '2014-15', '15', '19', '13', '13', '11', '15', 'Can do better.', 'Can do better.', 'Good', '27/36', 'Can do better.', 'Save'),
(425, '', 40, '2014-04-29 02:01:35', '2014-05-04 18:44:37', '79', 'Test 4 (25 marks)', '2013-14', '22', '7', '7', '19', '19', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(426, '', 40, '2014-04-28 23:06:25', '2014-05-04 18:44:37', '79', 'Test 4 (25 marks)', '2014-15', '10', '18', '11', '15', '13', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(427, '', 40, '2014-05-01 12:56:36', '2014-05-04 18:44:37', '80', 'Test 4 (25 marks)', '2013-14', '11', '7', '24', '19', '16', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(428, '', 40, '2014-04-30 10:19:07', '2014-05-04 18:44:37', '80', 'Test 4 (25 marks)', '2014-15', '24', '15', '16', '8', '14', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(429, '', 40, '2014-05-02 17:19:41', '2014-05-04 18:44:37', '81', 'Test 4 (25 marks)', '2013-14', '8', '22', '20', '12', '17', '14', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(430, '', 40, '2014-04-29 05:24:31', '2014-05-04 18:44:37', '81', 'Test 4 (25 marks)', '2014-15', '14', '16', '6', '12', '', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(431, '', 40, '2014-05-02 23:52:04', '0000-00-00 00:00:00', '82', 'Test 4 (25 marks)', '2013-14', '18', '13', '10', '23', '22', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Good work.', 'Save'),
(432, '', 40, '2014-05-01 20:45:18', '2014-05-04 18:44:37', '82', 'Test 4 (25 marks)', '2014-15', '11', '20', '21', '14', '14', '6', 'Can do better.', 'Can do better.', 'Excellent', '32/36', 'Good work.', 'Save'),
(433, '', 40, '2014-04-29 23:17:18', '0000-00-00 00:00:00', '84', 'Test 4 (25 marks)', '2013-14', '13', '', '12', '16', '8', '10', 'Well done.', 'Well done.', 'Needs to improve', '33/36', 'Good job in English and Kannada.', 'Save'),
(434, '', 40, '2014-05-02 10:38:40', '0000-00-00 00:00:00', '84', 'Test 4 (25 marks)', '2014-15', '16', '23', '19', '11', '10', '20', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(435, '', 40, '2014-04-29 17:47:32', '2014-05-04 18:44:37', '85', 'Test 4 (25 marks)', '2013-14', '12', '8', '17', '7', '10', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Good work.', 'Save'),
(436, '', 40, '2014-05-01 20:44:15', '2014-05-04 18:44:37', '85', 'Test 4 (25 marks)', '2014-15', '17', '10', '8', '6', '', '10', 'Well done.', 'Can do better.', 'Good', '31/36', 'Good work.', 'Save'),
(437, '', 40, '2014-05-02 19:04:23', '2014-05-04 18:44:37', '86', 'Test 4 (25 marks)', '2013-14', '8', '10', '14', '15', '20', '24', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(438, '', 40, '2014-05-02 06:32:15', '2014-05-04 18:44:37', '87', 'Test 4 (25 marks)', '2014-15', '19', '11', '20', '7', '14', '11', 'Can do better.', 'Can do better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(439, '', 40, '2014-05-03 19:39:52', '2014-05-04 18:44:37', '89', 'Test 4 (25 marks)', '2013-14', '7', '18', '7', '14', '11', '9', 'Can do better.', 'Can do better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(440, '', 40, '2014-04-30 11:37:16', '2014-05-04 18:44:37', '89', 'Test 4 (25 marks)', '2014-15', '19', '6', '14', '19', '20', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Good job in English and Kannada.', 'Save'),
(441, '', 40, '2014-05-01 09:25:39', '2014-05-04 18:44:37', '90', 'Test 4 (25 marks)', '2013-14', '11', '7', '16', '10', '', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(442, '', 40, '2014-05-02 11:09:44', '0000-00-00 00:00:00', '90', 'Test 4 (25 marks)', '2014-15', '9', '6', '10', '15', '10', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Good work.', 'Save'),
(443, '', 40, '2014-04-29 10:02:57', '2014-05-04 18:44:37', '91', 'Test 4 (25 marks)', '2013-14', '15', '23', '20', '18', '17', '17', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Good work.', 'Save'),
(444, '', 40, '2014-05-03 15:08:54', '2014-05-04 18:44:37', '91', 'Test 4 (25 marks)', '2014-15', '13', '16', '', '23', '10', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(445, '', 40, '2014-05-03 19:44:02', '2014-05-04 18:44:37', '92', 'Test 4 (25 marks)', '2013-14', '18', '8', '21', '24', '', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(446, '', 40, '2014-05-02 14:50:03', '2014-05-04 18:44:37', '92', 'Test 4 (25 marks)', '2014-15', '11', '13', '17', '20', '16', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(447, '', 40, '2014-05-03 23:59:16', '2014-05-04 18:44:37', '93', 'Test 4 (25 marks)', '2014-15', '23', '8', '20', '8', '14', '18', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(448, '', 40, '2014-05-01 11:59:17', '2014-05-04 18:44:37', '94', 'Test 4 (25 marks)', '2013-14', '15', '7', '22', '17', '17', '11', 'Can do better.', 'Can do better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(449, '', 40, '2014-05-03 08:26:11', '2014-05-04 18:44:37', '94', 'Test 4 (25 marks)', '2014-15', '12', '15', '12', '12', '12', '17', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(450, '', 40, '2014-05-01 16:06:32', '0000-00-00 00:00:00', '95', 'Test 4 (25 marks)', '2013-14', '8', '13', '15', '10', '12', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Can do better.', 'Save'),
(451, '', 40, '2014-05-02 15:02:18', '2014-05-04 18:44:37', '95', 'Test 4 (25 marks)', '2014-15', '24', '', '', '24', '13', '22', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '35/36', 'Good work.', 'Save'),
(452, '', 40, '2014-05-01 18:38:33', '2014-05-04 18:44:37', '96', 'Test 4 (25 marks)', '2014-15', '20', '17', '13', '18', '8', '', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Good work.', 'Save'),
(453, '', 40, '2014-04-30 13:04:37', '2014-05-04 18:44:37', '97', 'Test 4 (25 marks)', '2013-14', '17', '15', '21', '14', '12', '21', 'Well done.', 'Can do better.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(454, '', 40, '2014-05-01 15:07:54', '2014-05-04 18:44:37', '98', 'Test 4 (25 marks)', '2014-15', '24', '17', '22', '10', '10', '9', 'Well done.', 'Well done.', 'Good', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(455, '', 40, '2014-05-03 12:04:12', '2014-05-04 18:44:37', '99', 'Test 4 (25 marks)', '2013-14', '15', '24', '13', '6', '24', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(456, '', 40, '2014-05-02 01:52:46', '2014-05-04 18:44:37', '99', 'Test 4 (25 marks)', '2014-15', '17', '6', '22', '24', '', '6', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(457, '', 40, '2014-04-29 19:16:04', '2014-05-04 18:44:37', '100', 'Test 4 (25 marks)', '2013-14', '21', '20', '15', '9', '15', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Good job in English and Kannada.', 'Save'),
(458, '', 40, '2014-05-01 01:31:43', '2014-05-04 18:44:37', '100', 'Test 4 (25 marks)', '2014-15', '13', '17', '14', '12', '16', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '36/36', 'Good work.', 'Save'),
(459, '', 40, '2014-05-02 17:11:10', '0000-00-00 00:00:00', '101', 'Test 4 (25 marks)', '2014-15', '23', '16', '11', '22', '7', '23', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Good job in English and Kannada.', 'Save'),
(460, '', 40, '2014-05-02 11:21:32', '2014-05-04 18:44:37', '102', 'Test 4 (25 marks)', '2013-14', '7', '6', '8', '10', '', '13', 'Well done.', 'Can do better.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(461, '', 40, '2014-05-03 20:07:19', '2014-05-04 18:44:37', '102', 'Test 4 (25 marks)', '2014-15', '14', '14', '12', '13', '9', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(462, '', 40, '2014-05-02 21:30:59', '2014-05-04 18:44:37', '103', 'Test 4 (25 marks)', '2013-14', '', '7', '6', '22', '17', '23', 'Well done.', 'Can do better.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(463, '', 40, '2014-05-03 10:20:04', '2014-05-04 18:44:37', '104', 'Test 4 (25 marks)', '2013-14', '10', '12', '21', '20', '', '20', 'Well done.', 'Well done.', 'Good', '28/36', 'Good job in English and Kannada.', 'Save'),
(464, '', 40, '2014-05-01 16:11:50', '2014-05-04 18:44:37', '104', 'Test 4 (25 marks)', '2014-15', '14', '14', '', '20', '17', '13', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Concentrate. Too playful.', 'Save'),
(465, '', 40, '2014-05-01 05:47:33', '2014-05-04 18:44:37', '105', 'Test 4 (25 marks)', '2013-14', '', '12', '16', '6', '17', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(466, '', 40, '2014-04-29 12:57:59', '2014-05-04 18:44:37', '105', 'Test 4 (25 marks)', '2014-15', '14', '9', '10', '11', '9', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(467, '', 40, '2014-05-03 13:36:30', '0000-00-00 00:00:00', '106', 'Test 4 (25 marks)', '2013-14', '11', '6', '21', '10', '12', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(468, '', 40, '2014-05-04 02:04:30', '2014-05-04 18:44:37', '106', 'Test 4 (25 marks)', '2014-15', '19', '10', '14', '8', '22', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(469, '', 40, '2014-05-02 15:25:32', '2014-05-04 18:44:37', '107', 'Test 4 (25 marks)', '2013-14', '', '7', '17', '', '13', '7', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(470, '', 40, '2014-05-01 20:35:26', '2014-05-04 18:44:37', '108', 'Test 4 (25 marks)', '2013-14', '20', '13', '23', '21', '9', '8', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(471, '', 40, '2014-04-29 10:45:53', '2014-05-04 18:44:37', '109', 'Test 4 (25 marks)', '2013-14', '9', '9', '22', '9', '15', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good work.', 'Save'),
(472, '', 40, '2014-05-02 07:23:16', '0000-00-00 00:00:00', '109', 'Test 4 (25 marks)', '2014-15', '9', '15', '19', '15', '21', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need to work hard.', 'Save'),
(473, '', 40, '2014-04-29 18:28:34', '2014-05-04 18:44:37', '110', 'Test 4 (25 marks)', '2013-14', '21', '23', '12', '20', '7', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(474, '', 40, '2014-04-29 10:23:24', '2014-05-04 18:44:37', '110', 'Test 4 (25 marks)', '2014-15', '14', '8', '12', '14', '14', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(475, '', 40, '2014-05-01 14:07:57', '2014-05-04 18:44:37', '111', 'Test 4 (25 marks)', '2013-14', '23', '20', '10', '9', '18', '13', 'Well done.', 'Well done.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(476, '', 40, '2014-05-01 11:05:39', '2014-05-04 18:44:37', '111', 'Test 4 (25 marks)', '2014-15', '7', '', '10', '25', '7', '19', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(477, '', 40, '2014-05-02 07:27:54', '0000-00-00 00:00:00', '112', 'Test 4 (25 marks)', '2013-14', '17', '6', '', '12', '10', '20', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(478, '', 40, '2014-04-29 10:17:31', '2014-05-04 18:44:37', '113', 'Test 4 (25 marks)', '2013-14', '12', '7', '15', '7', '24', '8', 'Well done.', 'Well done.', 'Excellent', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(479, '', 40, '2014-05-01 16:59:30', '0000-00-00 00:00:00', '114', 'Test 4 (25 marks)', '2014-15', '24', '9', '13', '10', '22', '12', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(480, '', 40, '2014-05-02 16:14:28', '0000-00-00 00:00:00', '115', 'Test 4 (25 marks)', '2013-14', '16', '13', '23', '18', '15', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(481, '', 40, '2014-05-04 00:19:09', '2014-05-04 18:44:37', '115', 'Test 4 (25 marks)', '2014-15', '', '18', '21', '15', '9', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(482, '', 40, '2014-05-01 22:17:06', '2014-05-04 18:44:37', '116', 'Test 4 (25 marks)', '2013-14', '10', '', '8', '24', '17', '11', 'Can do better.', 'Can do better.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(483, '', 40, '2014-04-30 21:57:27', '2014-05-04 18:44:37', '116', 'Test 4 (25 marks)', '2014-15', '22', '7', '12', '22', '21', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(484, '', 40, '2014-05-02 06:27:47', '0000-00-00 00:00:00', '117', 'Test 4 (25 marks)', '2013-14', '14', '13', '21', '24', '19', '8', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(485, '', 40, '2014-04-30 18:29:06', '2014-05-04 18:44:37', '117', 'Test 4 (25 marks)', '2014-15', '22', '13', '9', '13', '10', '21', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(486, '', 40, '2014-05-04 05:41:54', '2014-05-04 18:44:37', '118', 'Test 4 (25 marks)', '2014-15', '14', '9', '9', '20', '24', '10', 'Can do better.', 'Can do better.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(487, '', 40, '2014-05-02 13:22:10', '2014-05-04 18:44:37', '119', 'Test 4 (25 marks)', '2013-14', '6', '24', '22', '14', '19', '15', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(488, '', 40, '2014-05-02 05:13:19', '2014-05-04 18:44:37', '119', 'Test 4 (25 marks)', '2014-15', '22', '', '22', '23', '', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(489, '', 40, '2014-05-02 10:36:43', '2014-05-04 18:44:37', '120', 'Test 4 (25 marks)', '2013-14', '22', '8', '22', '12', '', '', 'Well done.', 'Well done.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(490, '', 40, '2014-04-30 23:04:55', '2014-05-04 18:44:37', '121', 'Test 4 (25 marks)', '2013-14', '24', '22', '9', '8', '16', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(491, '', 40, '2014-05-03 13:37:21', '0000-00-00 00:00:00', '121', 'Test 4 (25 marks)', '2014-15', '13', '', '10', '21', '', '18', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Can do better.', 'Save'),
(492, '', 40, '2014-05-01 02:35:19', '0000-00-00 00:00:00', '122', 'Test 4 (25 marks)', '2014-15', '16', '16', '15', '11', '11', '8', 'Can do better.', 'Can do better.', 'Good', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(493, '', 40, '2014-05-01 04:30:05', '0000-00-00 00:00:00', '123', 'Test 4 (25 marks)', '2014-15', '11', '10', '19', '7', '8', '19', 'Well done.', 'Well done.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(494, '', 40, '2014-04-29 12:00:40', '2014-05-04 18:44:37', '124', 'Test 4 (25 marks)', '2013-14', '21', '7', '11', '10', '11', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Good job in English and Kannada.', 'Save'),
(495, '', 40, '2014-05-02 07:23:10', '0000-00-00 00:00:00', '125', 'Test 4 (25 marks)', '2013-14', '21', '21', '22', '24', '17', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(496, '', 40, '2014-05-02 01:30:07', '2014-05-04 18:44:37', '125', 'Test 4 (25 marks)', '2014-15', '8', '13', '13', '9', '14', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(497, '', 40, '2014-05-03 13:02:32', '2014-05-04 18:44:37', '126', 'Test 4 (25 marks)', '2013-14', '13', '21', '8', '22', '23', '17', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(498, '', 40, '2014-05-03 10:46:11', '2014-05-04 18:44:37', '126', 'Test 4 (25 marks)', '2014-15', '8', '11', '8', '17', '23', '20', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Can do better.', 'Save'),
(499, '', 40, '2014-04-28 21:32:26', '2014-05-04 18:44:37', '127', 'Test 4 (25 marks)', '2014-15', '20', '11', '12', '18', '12', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(500, '', 40, '2014-05-03 01:55:33', '2014-05-04 18:44:37', '128', 'Test 4 (25 marks)', '2013-14', '22', '16', '20', '', '19', '23', 'Well done.', 'Well done.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(501, '', 40, '2014-05-01 10:59:47', '2014-05-04 18:44:37', '128', 'Test 4 (25 marks)', '2014-15', '18', '17', '24', '20', '19', '20', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need to work hard.', 'Save'),
(502, '', 40, '2014-04-29 02:52:14', '2014-05-04 18:44:37', '129', 'Test 4 (25 marks)', '2013-14', '15', '12', '18', '21', '20', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(503, '', 40, '2014-05-01 07:02:09', '0000-00-00 00:00:00', '129', 'Test 4 (25 marks)', '2014-15', '7', '8', '19', '21', '23', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(504, '', 40, '2014-05-01 01:55:50', '2014-05-04 18:44:37', '130', 'Test 4 (25 marks)', '2013-14', '18', '21', '10', '9', '', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(505, '', 40, '2014-05-01 17:18:34', '2014-05-04 18:44:37', '130', 'Test 4 (25 marks)', '2014-15', '20', '21', '15', '12', '22', '25', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard.', 'Save'),
(506, '', 40, '2014-05-01 07:16:43', '2014-05-04 18:44:37', '131', 'Test 4 (25 marks)', '2013-14', '24', '14', '19', '17', '8', '7', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(507, '', 40, '2014-04-29 04:28:14', '2014-05-04 18:44:37', '131', 'Test 4 (25 marks)', '2014-15', '16', '23', '18', '10', '17', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(508, '', 40, '2014-05-01 17:10:03', '2014-05-04 18:44:37', '132', 'Test 4 (25 marks)', '2014-15', '23', '', '9', '17', '14', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(509, '', 40, '2014-05-03 01:22:55', '2014-05-04 18:44:37', '133', 'Test 4 (25 marks)', '2013-14', '22', '12', '24', '23', '13', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(510, '', 40, '2014-05-02 02:27:42', '0000-00-00 00:00:00', '133', 'Test 4 (25 marks)', '2014-15', '17', '9', '13', '6', '22', '', 'Can do better.', 'Can do better.', 'Needs to improve', '35/36', 'Can do better.', 'Save'),
(511, '', 40, '2014-04-29 05:09:03', '0000-00-00 00:00:00', '134', 'Test 4 (25 marks)', '2013-14', '23', '14', '9', '', '20', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(512, '', 40, '2014-05-01 15:36:09', '2014-05-04 18:44:37', '134', 'Test 4 (25 marks)', '2014-15', '20', '17', '11', '14', '20', '8', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Need to work independently.', 'Save'),
(513, '', 40, '2014-05-03 04:56:48', '2014-05-04 18:44:37', '135', 'Test 4 (25 marks)', '2013-14', '23', '', '10', '', '22', '', 'Well done.', 'Well done.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(514, '', 40, '2014-05-01 23:28:00', '2014-05-04 18:44:37', '135', 'Test 4 (25 marks)', '2014-15', '13', '18', '8', '8', '17', '23', 'Can do better.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard.', 'Save'),
(515, '', 40, '2014-05-02 22:29:20', '2014-05-04 18:44:37', '136', 'Test 4 (25 marks)', '2013-14', '15', '15', '13', '10', '20', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(516, '', 40, '2014-05-03 07:59:18', '0000-00-00 00:00:00', '136', 'Test 4 (25 marks)', '2014-15', '16', '10', '23', '', '12', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(517, '', 40, '2014-04-30 12:57:41', '0000-00-00 00:00:00', '137', 'Test 4 (25 marks)', '2013-14', '17', '13', '13', '20', '', '19', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need to work independently.', 'Save'),
(518, '', 40, '2014-04-29 07:11:51', '2014-05-04 18:44:37', '137', 'Test 4 (25 marks)', '2014-15', '17', '18', '11', '23', '11', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(519, '', 40, '2014-05-01 03:47:41', '2014-05-04 18:44:37', '138', 'Test 4 (25 marks)', '2013-14', '18', '15', '9', '24', '20', '18', 'Well done.', 'Well done.', 'Good', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(520, '', 40, '2014-04-29 07:44:33', '0000-00-00 00:00:00', '138', 'Test 4 (25 marks)', '2014-15', '12', '9', '17', '12', '', '10', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(521, '', 40, '2014-05-02 08:47:26', '2014-05-04 18:44:37', '139', 'Test 4 (25 marks)', '2013-14', '10', '23', '18', '12', '19', '6', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(522, '', 40, '2014-05-04 02:08:20', '2014-05-04 18:44:37', '139', 'Test 4 (25 marks)', '2014-15', '6', '21', '22', '16', '24', '25', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(523, '', 40, '2014-05-02 23:10:14', '2014-05-04 18:44:37', '140', 'Test 4 (25 marks)', '2014-15', '9', '20', '17', '7', '14', '15', 'Well done.', 'Well done.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(524, '', 40, '2014-05-01 22:00:18', '0000-00-00 00:00:00', '141', 'Test 4 (25 marks)', '2013-14', '9', '20', '11', '16', '17', '20', 'Well done.', 'Well done.', 'Needs to improve', '34/36', 'Good job in English and Kannada.', 'Save'),
(525, '', 40, '2014-05-01 05:59:52', '2014-05-04 18:44:37', '141', 'Test 4 (25 marks)', '2014-15', '7', '17', '10', '17', '6', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need to work hard.', 'Save'),
(526, '', 40, '2014-04-30 05:17:54', '2014-05-04 18:44:37', '142', 'Test 4 (25 marks)', '2014-15', '6', '', '13', '8', '19', '8', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(527, '', 40, '2014-05-02 22:51:06', '2014-05-04 18:44:37', '143', 'Test 4 (25 marks)', '2013-14', '25', '18', '', '22', '6', '19', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Concentrate. Too playful.', 'Save'),
(528, '', 40, '2014-05-01 04:26:09', '2014-05-04 18:44:37', '143', 'Test 4 (25 marks)', '2014-15', '20', '24', '23', '', '12', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '31/36', 'Good job in English and Kannada.', 'Save'),
(529, '', 40, '2014-04-30 20:48:40', '2014-05-04 18:44:37', '144', 'Test 4 (25 marks)', '2013-14', '24', '21', '14', '7', '8', '7', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(530, '', 40, '2014-05-02 04:57:27', '2014-05-04 18:44:37', '144', 'Test 4 (25 marks)', '2014-15', '12', '22', '20', '21', '9', '16', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Need to work hard.', 'Save'),
(531, '', 40, '2014-05-03 11:22:49', '0000-00-00 00:00:00', '145', 'Test 4 (25 marks)', '2014-15', '22', '20', '', '21', '', '14', 'Well done.', 'Can do better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(532, '', 40, '2014-05-02 10:22:14', '2014-05-04 18:44:37', '146', 'Test 4 (25 marks)', '2013-14', '19', '16', '22', '15', '25', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Can do better.', 'Save'),
(533, '', 40, '2014-05-03 00:18:39', '0000-00-00 00:00:00', '146', 'Test 4 (25 marks)', '2014-15', '15', '15', '23', '6', '7', '10', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(534, '', 40, '2014-05-02 01:34:20', '2014-05-04 18:44:37', '147', 'Test 4 (25 marks)', '2013-14', '11', '6', '20', '6', '7', '19', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Need to work independently.', 'Save'),
(535, '', 40, '2014-04-29 03:12:00', '0000-00-00 00:00:00', '147', 'Test 4 (25 marks)', '2014-15', '17', '10', '14', '15', '19', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(536, '', 40, '2014-04-30 03:05:19', '0000-00-00 00:00:00', '148', 'Test 4 (25 marks)', '2013-14', '', '16', '22', '23', '7', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(537, '', 40, '2014-04-29 03:23:23', '0000-00-00 00:00:00', '148', 'Test 4 (25 marks)', '2014-15', '15', '18', '9', '14', '17', '11', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(538, '', 40, '2014-05-03 12:26:14', '2014-05-04 18:44:37', '149', 'Test 4 (25 marks)', '2013-14', '12', '7', '12', '6', '17', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(539, '', 40, '2014-05-02 02:41:53', '2014-05-04 18:44:37', '149', 'Test 4 (25 marks)', '2014-15', '21', '22', '19', '16', '17', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Concentrate. Too playful.', 'Save'),
(540, '', 40, '2014-04-30 03:21:23', '2014-05-04 18:44:37', '150', 'Test 4 (25 marks)', '2013-14', '24', '8', '22', '13', '', '15', 'Well done.', 'Well done.', 'Good', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(541, '', 40, '2014-05-02 09:07:03', '2014-05-04 18:44:37', '150', 'Test 4 (25 marks)', '2014-15', '17', '11', '17', '14', '24', '8', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need to work hard.', 'Save'),
(542, '', 40, '2014-05-03 09:29:09', '0000-00-00 00:00:00', '151', 'Test 4 (25 marks)', '2013-14', '10', '18', '12', '13', '25', '25', 'Can do better.', 'Well done.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(543, '', 40, '2014-05-02 02:48:54', '2014-05-04 18:44:37', '151', 'Test 4 (25 marks)', '2014-15', '10', '16', '22', '16', '21', '10', 'Well done.', 'Can do better.', 'Good', '26/36', 'Concentrate. Too playful.', 'Save'),
(544, '', 40, '2014-04-30 20:08:32', '2014-05-04 18:44:37', '152', 'Test 4 (25 marks)', '2014-15', '23', '15', '20', '12', '17', '20', 'Well done.', 'Can do better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(545, '', 40, '2014-05-04 01:34:21', '2014-05-04 18:44:37', '153', 'Test 4 (25 marks)', '2013-14', '20', '11', '', '24', '20', '12', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(546, '', 40, '2014-05-03 04:17:19', '2014-05-04 18:44:37', '153', 'Test 4 (25 marks)', '2014-15', '20', '24', '15', '10', '25', '9', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Need to work hard.', 'Save'),
(547, '', 40, '2014-04-30 18:53:46', '2014-05-04 18:44:37', '154', 'Test 4 (25 marks)', '2013-14', '15', '9', '9', '12', '14', '22', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(548, '', 40, '2014-05-03 12:36:52', '2014-05-04 18:44:37', '154', 'Test 4 (25 marks)', '2014-15', '22', '20', '25', '14', '14', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(549, '', 40, '2014-05-01 08:33:41', '0000-00-00 00:00:00', '155', 'Test 4 (25 marks)', '2013-14', '', '19', '20', '19', '23', '21', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(550, '', 40, '2014-05-01 06:18:50', '2014-05-04 18:44:37', '155', 'Test 4 (25 marks)', '2014-15', '7', '8', '8', '20', '15', '9', 'Well done.', 'Can do better.', 'Excellent', '30/36', 'Good work.', 'Save'),
(551, '', 40, '2014-05-03 13:11:28', '0000-00-00 00:00:00', '156', 'Test 4 (25 marks)', '2013-14', '23', '16', '23', '20', '8', '22', 'Well done.', 'Can do better.', 'Good', '27/36', 'Can do better.', 'Save'),
(552, '', 40, '2014-05-03 06:18:30', '2014-05-04 18:44:37', '156', 'Test 4 (25 marks)', '2014-15', '22', '15', '23', '8', '7', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(553, '', 40, '2014-04-29 19:43:56', '2014-05-04 18:44:37', '157', 'Test 4 (25 marks)', '2013-14', '25', '16', '24', '18', '9', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(554, '', 40, '2014-05-04 02:57:57', '2014-05-04 18:44:37', '158', 'Test 4 (25 marks)', '2013-14', '9', '19', '', '23', '23', '13', 'Well done.', 'Can do better.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(555, '', 40, '2014-05-01 23:31:01', '0000-00-00 00:00:00', '158', 'Test 4 (25 marks)', '2014-15', '7', '9', '21', '25', '23', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(556, '', 40, '2014-05-01 07:19:00', '2014-05-04 18:44:37', '159', 'Test 4 (25 marks)', '2014-15', '13', '15', '7', '12', '9', '22', 'Can do better.', 'Can do better.', 'Good', '32/36', 'Can do better.', 'Save'),
(557, '', 40, '2014-05-03 13:25:03', '2014-05-04 18:44:37', '1', 'Test 1 (25 marks)', '2013-14', '6', '24', '19', '23', '19', '23', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(558, '', 40, '2014-05-02 12:33:41', '2014-05-04 18:44:37', '1', 'Test 1 (25 marks)', '2014-15', '15', '10', '17', '19', '13', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(559, '', 40, '2014-05-01 18:34:39', '2014-05-04 18:44:37', '2', 'Test 1 (25 marks)', '2013-14', '7', '8', '18', '11', '11', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Good job in English and Kannada.', 'Save'),
(560, '', 40, '2014-05-01 22:41:49', '2014-05-04 18:44:37', '2', 'Test 1 (25 marks)', '2014-15', '13', '8', '12', '7', '20', '19', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(561, '', 40, '2014-05-02 18:59:48', '2014-05-04 18:44:37', '3', 'Test 1 (25 marks)', '2013-14', '12', '9', '', '14', '', '11', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(562, '', 40, '2014-05-02 04:04:33', '2014-05-04 18:44:37', '3', 'Test 1 (25 marks)', '2014-15', '8', '6', '13', '6', '11', '18', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(563, '', 40, '2014-05-03 11:30:57', '2014-05-04 18:44:37', '4', 'Test 1 (25 marks)', '2013-14', '20', '18', '16', '15', '15', '20', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(564, '', 40, '2014-05-03 15:56:26', '0000-00-00 00:00:00', '4', 'Test 1 (25 marks)', '2014-15', '', '22', '16', '', '8', '25', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work hard.', 'Save'),
(565, '', 40, '2014-05-02 01:38:28', '2014-05-04 18:44:37', '5', 'Test 1 (25 marks)', '2013-14', '8', '19', '22', '9', '15', '20', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(566, '', 40, '2014-05-01 12:52:27', '2014-05-04 18:44:37', '5', 'Test 1 (25 marks)', '2014-15', '7', '11', '15', '11', '9', '25', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(567, '', 40, '2014-04-29 17:44:26', '2014-05-04 18:44:37', '6', 'Test 1 (25 marks)', '2013-14', '21', '8', '8', '19', '12', '13', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(568, '', 40, '2014-04-29 02:49:42', '2014-05-04 18:44:37', '7', 'Test 1 (25 marks)', '2014-15', '11', '7', '17', '14', '21', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(569, '', 40, '2014-05-04 03:00:00', '2014-05-04 18:44:37', '8', 'Test 1 (25 marks)', '2014-15', '17', '14', '9', '12', '19', '', 'Can do better.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard.', 'Save'),
(570, '', 40, '2014-04-30 09:37:29', '2014-05-04 18:44:37', '9', 'Test 1 (25 marks)', '2013-14', '15', '12', '12', '8', '12', '17', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(571, '', 40, '2014-05-03 15:10:05', '2014-05-04 18:44:37', '10', 'Test 1 (25 marks)', '2013-14', '23', '20', '21', '15', '7', '20', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(572, '', 40, '2014-05-03 12:48:56', '2014-05-04 18:44:37', '10', 'Test 1 (25 marks)', '2014-15', '10', '11', '6', '12', '6', '22', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(573, '', 40, '2014-05-01 16:42:39', '2014-05-04 18:44:37', '11', 'Test 1 (25 marks)', '2013-14', '15', '23', '16', '9', '24', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(574, '', 40, '2014-05-01 19:00:47', '2014-05-04 18:44:37', '11', 'Test 1 (25 marks)', '2014-15', '22', '7', '11', '7', '15', '13', 'Well done.', 'Can do better.', 'Excellent', '30/36', 'Need to work hard.', 'Save'),
(575, '', 40, '2014-05-02 23:12:20', '2014-05-04 18:44:37', '12', 'Test 1 (25 marks)', '2013-14', '14', '24', '24', '13', '8', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(576, '', 40, '2014-05-03 06:31:49', '0000-00-00 00:00:00', '13', 'Test 1 (25 marks)', '2013-14', '8', '15', '21', '12', '8', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(577, '', 40, '2014-05-01 05:19:27', '2014-05-04 18:44:37', '13', 'Test 1 (25 marks)', '2014-15', '14', '22', '15', '19', '13', '14', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(578, '', 40, '2014-04-29 08:35:07', '2014-05-04 18:44:37', '14', 'Test 1 (25 marks)', '2013-14', '22', '18', '10', '17', '16', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(579, '', 40, '2014-05-01 12:55:51', '2014-05-04 18:44:37', '14', 'Test 1 (25 marks)', '2014-15', '8', '17', '17', '15', '12', '', 'Can do better.', 'Well done.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(580, '', 40, '2014-05-01 01:06:26', '2014-05-04 18:44:37', '15', 'Test 1 (25 marks)', '2013-14', '7', '9', '22', '24', '15', '25', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work independently.', 'Save'),
(581, '', 40, '2014-04-29 23:51:57', '2014-05-04 18:44:37', '15', 'Test 1 (25 marks)', '2014-15', '21', '8', '10', '14', '22', '20', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '35/36', 'Need to work hard.', 'Save'),
(582, '', 40, '2014-04-29 07:18:34', '2014-05-04 18:44:37', '16', 'Test 1 (25 marks)', '2013-14', '20', '24', '7', '22', '6', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(583, '', 40, '2014-05-02 17:30:24', '0000-00-00 00:00:00', '16', 'Test 1 (25 marks)', '2014-15', '23', '7', '18', '21', '21', '12', 'Can do better.', 'Well done.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(584, '', 40, '2014-04-29 02:30:09', '2014-05-04 18:44:37', '18', 'Test 1 (25 marks)', '2013-14', '8', '24', '21', '22', '13', '23', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(585, '', 40, '2014-05-01 10:28:31', '2014-05-04 18:44:37', '18', 'Test 1 (25 marks)', '2014-15', '23', '15', '13', '10', '10', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(586, '', 40, '2014-04-29 03:55:41', '0000-00-00 00:00:00', '19', 'Test 1 (25 marks)', '2013-14', '19', '20', '21', '25', '6', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '29/36', 'Can do better.', 'Save'),
(587, '', 40, '2014-05-02 03:48:17', '2014-05-04 18:44:37', '19', 'Test 1 (25 marks)', '2014-15', '13', '25', '21', '22', '20', '18', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Good job in English and Kannada.', 'Save'),
(588, '', 40, '2014-04-29 05:04:43', '2014-05-04 18:44:37', '20', 'Test 1 (25 marks)', '2013-14', '', '10', '7', '23', '15', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(589, '', 40, '2014-05-03 16:33:26', '2014-05-04 18:44:37', '20', 'Test 1 (25 marks)', '2014-15', '10', '24', '23', '11', '16', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Can do better.', 'Save'),
(590, '', 40, '2014-05-02 13:43:13', '2014-05-04 18:44:37', '21', 'Test 1 (25 marks)', '2013-14', '24', '6', '23', '23', '19', '19', 'Well done.', 'Well done.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(591, '', 40, '2014-05-03 22:52:04', '2014-05-04 18:44:37', '21', 'Test 1 (25 marks)', '2014-15', '16', '15', '7', '16', '19', '20', 'Well done.', 'Well done.', 'Good', '28/36', 'Can do better.', 'Save'),
(592, '', 40, '2014-05-01 10:45:37', '2014-05-04 18:44:37', '22', 'Test 1 (25 marks)', '2013-14', '18', '10', '20', '10', '13', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(593, '', 40, '2014-05-02 19:11:32', '2014-05-04 18:44:37', '22', 'Test 1 (25 marks)', '2014-15', '12', '', '7', '13', '15', '21', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Concentrate. Too playful.', 'Save'),
(594, '', 40, '2014-05-01 12:43:18', '2014-05-04 18:44:37', '23', 'Test 1 (25 marks)', '2013-14', '18', '23', '11', '24', '18', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(595, '', 40, '2014-04-29 17:28:19', '0000-00-00 00:00:00', '23', 'Test 1 (25 marks)', '2014-15', '7', '17', '8', '9', '24', '21', 'Well done.', 'Well done.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(596, '', 40, '2014-04-29 16:42:58', '2014-05-04 18:44:37', '24', 'Test 1 (25 marks)', '2013-14', '16', '16', '22', '19', '19', '25', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Congratulations. Potential to do even better.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(597, '', 40, '2014-05-02 00:32:27', '2014-05-04 18:44:37', '24', 'Test 1 (25 marks)', '2014-15', '', '19', '17', '7', '7', '7', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Good work.', 'Save'),
(598, '', 40, '2014-04-30 13:55:43', '2014-05-04 18:44:37', '25', 'Test 1 (25 marks)', '2013-14', '22', '17', '16', '18', '12', '11', 'Well done.', 'Can do better.', 'Good', '33/36', 'Concentrate. Too playful.', 'Save'),
(599, '', 40, '2014-04-29 09:33:02', '2014-05-04 18:44:37', '25', 'Test 1 (25 marks)', '2014-15', '23', '13', '23', '18', '17', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(600, '', 40, '2014-05-03 23:16:57', '2014-05-04 18:44:37', '26', 'Test 1 (25 marks)', '2013-14', '20', '14', '6', '22', '9', '21', 'Well done.', 'Well done.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(601, '', 40, '2014-04-28 22:47:38', '0000-00-00 00:00:00', '26', 'Test 1 (25 marks)', '2014-15', '20', '10', '15', '9', '17', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(602, '', 40, '2014-05-02 20:32:37', '2014-05-04 18:44:37', '27', 'Test 1 (25 marks)', '2013-14', '24', '8', '9', '15', '12', '24', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(603, '', 40, '2014-05-01 10:48:16', '2014-05-04 18:44:37', '27', 'Test 1 (25 marks)', '2014-15', '24', '23', '18', '22', '18', '22', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(604, '', 40, '2014-04-30 04:10:26', '2014-05-04 18:44:37', '28', 'Test 1 (25 marks)', '2013-14', '24', '15', '19', '7', '', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(605, '', 40, '2014-04-29 21:21:28', '2014-05-04 18:44:37', '28', 'Test 1 (25 marks)', '2014-15', '11', '16', '10', '17', '16', '16', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(606, '', 40, '2014-05-02 20:58:40', '2014-05-04 18:44:37', '29', 'Test 1 (25 marks)', '2013-14', '14', '13', '6', '11', '24', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(607, '', 40, '2014-04-29 17:28:00', '2014-05-04 18:44:37', '29', 'Test 1 (25 marks)', '2014-15', '21', '22', '22', '20', '22', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(608, '', 40, '2014-05-02 23:22:51', '0000-00-00 00:00:00', '30', 'Test 1 (25 marks)', '2013-14', '17', '19', '7', '14', '7', '21', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Concentrate. Too playful.', 'Save'),
(609, '', 40, '2014-05-01 01:52:13', '2014-05-04 18:44:37', '30', 'Test 1 (25 marks)', '2014-15', '8', '9', '8', '9', '10', '12', 'Can do better.', 'Well done.', 'Excellent', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(610, '', 40, '2014-05-01 02:12:10', '2014-05-04 18:44:37', '31', 'Test 1 (25 marks)', '2013-14', '12', '17', '10', '10', '15', '15', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(611, '', 40, '2014-04-30 05:57:06', '0000-00-00 00:00:00', '31', 'Test 1 (25 marks)', '2014-15', '9', '23', '12', '7', '15', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(612, '', 40, '2014-04-30 19:21:27', '2014-05-04 18:44:37', '32', 'Test 1 (25 marks)', '2013-14', '11', '12', '20', '21', '12', '13', 'Well done.', 'Well done.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(613, '', 40, '2014-05-03 13:03:28', '2014-05-04 18:44:37', '32', 'Test 1 (25 marks)', '2014-15', '16', '18', '', '9', '14', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Good job in English and Kannada.', 'Save'),
(614, '', 40, '2014-05-03 17:00:10', '2014-05-04 18:44:37', '33', 'Test 1 (25 marks)', '2014-15', '11', '', '9', '21', '12', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Good job in English and Kannada.', 'Save'),
(615, '', 40, '2014-05-02 22:02:52', '2014-05-04 18:44:37', '34', 'Test 1 (25 marks)', '2013-14', '9', '8', '13', '21', '9', '21', 'Can do better.', 'Well done.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(616, '', 40, '2014-04-29 06:25:44', '2014-05-04 18:44:37', '34', 'Test 1 (25 marks)', '2014-15', '', '22', '20', '16', '20', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(617, '', 40, '2014-05-03 00:26:52', '2014-05-04 18:44:37', '35', 'Test 1 (25 marks)', '2013-14', '15', '11', '24', '12', '22', '11', 'Can do better.', 'Well done.', 'Needs to improve', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(618, '', 40, '2014-04-28 23:19:30', '2014-05-04 18:44:37', '35', 'Test 1 (25 marks)', '2014-15', '23', '17', '20', '8', '8', '10', 'Can do better.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(619, '', 40, '2014-05-02 16:59:20', '2014-05-04 18:44:37', '36', 'Test 1 (25 marks)', '2013-14', '25', '18', '20', '13', '23', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(620, '', 40, '2014-04-29 10:27:12', '2014-05-04 18:44:37', '36', 'Test 1 (25 marks)', '2014-15', '', '9', '24', '', '8', '11', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Need to work hard.', 'Save'),
(621, '', 40, '2014-05-01 00:59:47', '0000-00-00 00:00:00', '37', 'Test 1 (25 marks)', '2013-14', '18', '22', '16', '21', '18', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work independently.', 'Save'),
(622, '', 40, '2014-05-03 01:08:59', '2014-05-04 18:44:37', '37', 'Test 1 (25 marks)', '2014-15', '20', '19', '17', '', '19', '', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(623, '', 40, '2014-05-01 16:21:09', '2014-05-04 18:44:37', '38', 'Test 1 (25 marks)', '2013-14', '21', '16', '23', '9', '8', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Can do better.', 'Save'),
(624, '', 40, '2014-05-04 03:58:32', '0000-00-00 00:00:00', '38', 'Test 1 (25 marks)', '2014-15', '21', '18', '20', '18', '10', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(625, '', 40, '2014-04-30 21:45:33', '2014-05-04 18:44:37', '39', 'Test 1 (25 marks)', '2014-15', '15', '9', '20', '20', '19', '16', 'Well done.', 'Well done.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(626, '', 40, '2014-04-30 12:11:16', '2014-05-04 18:44:37', '41', 'Test 1 (25 marks)', '2013-14', '12', '7', '16', '17', '9', '13', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(627, '', 40, '2014-04-30 23:29:08', '0000-00-00 00:00:00', '41', 'Test 1 (25 marks)', '2014-15', '13', '16', '19', '12', '12', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(628, '', 40, '2014-04-29 21:45:31', '0000-00-00 00:00:00', '42', 'Test 1 (25 marks)', '2013-14', '8', '6', '6', '15', '22', '15', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(629, '', 40, '2014-04-30 03:19:02', '2014-05-04 18:44:37', '42', 'Test 1 (25 marks)', '2014-15', '13', '18', '15', '21', '10', '16', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(630, '', 40, '2014-04-30 07:49:56', '0000-00-00 00:00:00', '43', 'Test 1 (25 marks)', '2014-15', '13', '15', '18', '12', '6', '24', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(631, '', 40, '2014-04-29 16:27:30', '2014-05-04 18:44:37', '44', 'Test 1 (25 marks)', '2013-14', '22', '16', '18', '14', '20', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(632, '', 40, '2014-04-29 04:05:15', '2014-05-04 18:44:37', '44', 'Test 1 (25 marks)', '2014-15', '24', '7', '13', '18', '14', '23', 'Well done.', 'Can do better.', 'Needs to improve', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(633, '', 40, '2014-05-02 20:48:24', '0000-00-00 00:00:00', '45', 'Test 1 (25 marks)', '2013-14', '8', '8', '6', '17', '7', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(634, '', 40, '2014-04-30 23:18:39', '0000-00-00 00:00:00', '45', 'Test 1 (25 marks)', '2014-15', '17', '6', '22', '12', '16', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(635, '', 40, '2014-04-29 11:21:35', '2014-05-04 18:44:37', '46', 'Test 1 (25 marks)', '2013-14', '17', '8', '18', '22', '15', '22', 'Well done.', 'Well done.', 'Excellent', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(636, '', 40, '2014-05-03 17:49:16', '2014-05-04 18:44:37', '46', 'Test 1 (25 marks)', '2014-15', '', '7', '', '14', '6', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Good work.', 'Save'),
(637, '', 40, '2014-05-02 09:23:32', '2014-05-04 18:44:37', '47', 'Test 1 (25 marks)', '2013-14', '', '21', '22', '14', '19', '8', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(638, '', 40, '2014-04-30 02:32:17', '0000-00-00 00:00:00', '47', 'Test 1 (25 marks)', '2014-15', '20', '19', '9', '22', '18', '22', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(639, '', 40, '2014-05-04 05:19:04', '0000-00-00 00:00:00', '48', 'Test 1 (25 marks)', '2013-14', '14', '21', '14', '6', '6', '8', 'Well done.', 'Can do better.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(640, '', 40, '2014-05-03 04:59:27', '0000-00-00 00:00:00', '48', 'Test 1 (25 marks)', '2014-15', '12', '14', '8', '12', '22', '20', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(641, '', 40, '2014-04-29 15:39:56', '2014-05-04 18:44:37', '49', 'Test 1 (25 marks)', '2013-14', '22', '10', '24', '7', '16', '12', 'Can do better.', 'Well done.', 'Good', '34/36', 'Good work.', 'Save'),
(642, '', 40, '2014-05-02 11:26:09', '2014-05-04 18:44:37', '49', 'Test 1 (25 marks)', '2014-15', '11', '12', '7', '14', '22', '16', 'Well done.', 'Well done.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(643, '', 40, '2014-05-04 03:48:07', '2014-05-04 18:44:37', '50', 'Test 1 (25 marks)', '2013-14', '25', '18', '', '20', '20', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(644, '', 40, '2014-05-02 22:57:31', '2014-05-04 18:44:37', '50', 'Test 1 (25 marks)', '2014-15', '9', '12', '13', '10', '12', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(645, '', 40, '2014-05-02 11:03:34', '2014-05-04 18:44:37', '51', 'Test 1 (25 marks)', '2013-14', '20', '19', '16', '18', '8', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(646, '', 40, '2014-04-30 10:43:10', '2014-05-04 18:44:37', '51', 'Test 1 (25 marks)', '2014-15', '', '15', '8', '10', '14', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(647, '', 40, '2014-05-01 15:45:04', '2014-05-04 18:44:37', '52', 'Test 1 (25 marks)', '2013-14', '21', '13', '13', '7', '7', '21', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(648, '', 40, '2014-05-02 08:26:19', '2014-05-04 18:44:37', '52', 'Test 1 (25 marks)', '2014-15', '14', '19', '17', '17', '22', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(649, '', 40, '2014-04-29 21:37:01', '2014-05-04 18:44:37', '53', 'Test 1 (25 marks)', '2013-14', '22', '8', '10', '20', '9', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(650, '', 40, '2014-05-01 23:45:27', '2014-05-04 18:44:37', '53', 'Test 1 (25 marks)', '2014-15', '17', '21', '24', '16', '9', '23', 'Can do better.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work independently.', 'Save'),
(651, '', 40, '2014-05-02 23:18:23', '2014-05-04 18:44:37', '54', 'Test 1 (25 marks)', '2013-14', '16', '8', '19', '24', '21', '9', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(652, '', 40, '2014-04-30 04:32:07', '0000-00-00 00:00:00', '54', 'Test 1 (25 marks)', '2014-15', '11', '19', '9', '20', '8', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(653, '', 40, '2014-04-30 21:17:57', '2014-05-04 18:44:37', '55', 'Test 1 (25 marks)', '2013-14', '13', '11', '15', '10', '18', '15', 'Well done.', 'Can do better.', 'Needs to improve', '26/36', 'Good work.', 'Save'),
(654, '', 40, '2014-05-02 02:41:47', '2014-05-04 18:44:37', '55', 'Test 1 (25 marks)', '2014-15', '24', '19', '22', '14', '24', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(655, '', 40, '2014-05-01 03:47:45', '2014-05-04 18:44:37', '56', 'Test 1 (25 marks)', '2013-14', '12', '9', '25', '24', '11', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good job in English and Kannada.', 'Save'),
(656, '', 40, '2014-04-28 22:12:05', '0000-00-00 00:00:00', '56', 'Test 1 (25 marks)', '2014-15', '12', '8', '8', '', '19', '21', 'Can do better.', 'Well done.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(657, '', 40, '2014-05-03 10:42:45', '0000-00-00 00:00:00', '57', 'Test 1 (25 marks)', '2013-14', '23', '10', '', '11', '10', '18', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(658, '', 40, '2014-04-29 23:42:11', '2014-05-04 18:44:37', '57', 'Test 1 (25 marks)', '2014-15', '17', '10', '17', '6', '18', '24', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Good job in English and Kannada.', 'Save'),
(659, '', 40, '2014-04-30 10:58:34', '0000-00-00 00:00:00', '58', 'Test 1 (25 marks)', '2013-14', '21', '16', '14', '10', '14', '24', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(660, '', 40, '2014-05-03 00:40:55', '2014-05-04 18:44:37', '58', 'Test 1 (25 marks)', '2014-15', '', '12', '18', '', '10', '15', 'Well done.', 'Can do better.', 'Needs to improve', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(661, '', 40, '2014-04-29 05:58:35', '2014-05-04 18:44:37', '59', 'Test 1 (25 marks)', '2013-14', '21', '16', '11', '21', '19', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(662, '', 40, '2014-04-30 03:53:00', '0000-00-00 00:00:00', '59', 'Test 1 (25 marks)', '2014-15', '', '', '16', '12', '6', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work independently.', 'Save'),
(663, '', 40, '2014-05-02 14:46:49', '2014-05-04 18:44:37', '60', 'Test 1 (25 marks)', '2013-14', '9', '19', '7', '6', '13', '', 'Well done.', 'Well done.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(664, '', 40, '2014-04-30 11:42:00', '2014-05-04 18:44:37', '60', 'Test 1 (25 marks)', '2014-15', '11', '8', '6', '14', '8', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(665, '', 40, '2014-04-29 19:09:39', '2014-05-04 18:44:37', '61', 'Test 1 (25 marks)', '2013-14', '21', '', '10', '11', '15', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Good job in English and Kannada.', 'Save'),
(666, '', 40, '2014-04-29 17:29:13', '2014-05-04 18:44:37', '61', 'Test 1 (25 marks)', '2014-15', '11', '', '7', '22', '24', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(667, '', 40, '2014-04-30 06:15:39', '0000-00-00 00:00:00', '62', 'Test 1 (25 marks)', '2013-14', '16', '9', '20', '23', '18', '23', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Concentrate. Too playful.', 'Save'),
(668, '', 40, '2014-05-02 15:11:41', '2014-05-04 18:44:37', '62', 'Test 1 (25 marks)', '2014-15', '15', '11', '6', '12', '16', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Concentrate. Too playful.', 'Save'),
(669, '', 40, '2014-05-01 14:53:19', '2014-05-04 18:44:37', '63', 'Test 1 (25 marks)', '2013-14', '18', '10', '', '24', '14', '11', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(670, '', 40, '2014-05-04 04:50:18', '2014-05-04 18:44:37', '63', 'Test 1 (25 marks)', '2014-15', '6', '24', '22', '10', '22', '8', 'Well done.', 'Can do better.', 'Good', '32/36', 'Need to work hard.', 'Save'),
(671, '', 40, '2014-04-29 05:03:25', '2014-05-04 18:44:37', '64', 'Test 1 (25 marks)', '2013-14', '10', '12', '16', '11', '8', '', 'Well done.', 'Can do better.', 'Needs to improve', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(672, '', 40, '2014-04-29 06:47:10', '0000-00-00 00:00:00', '64', 'Test 1 (25 marks)', '2014-15', '17', '6', '14', '21', '11', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(673, '', 40, '2014-04-29 11:50:39', '2014-05-04 18:44:37', '65', 'Test 1 (25 marks)', '2013-14', '15', '9', '15', '20', '8', '13', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Good work.', 'Save'),
(674, '', 40, '2014-05-03 13:42:27', '2014-05-04 18:44:37', '65', 'Test 1 (25 marks)', '2014-15', '17', '22', '12', '19', '14', '24', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(675, '', 40, '2014-04-30 22:46:08', '2014-05-04 18:44:37', '66', 'Test 1 (25 marks)', '2013-14', '12', '23', '', '7', '11', '22', 'Can do better.', 'Well done.', 'Good', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(676, '', 40, '2014-05-02 19:27:21', '2014-05-04 18:44:37', '66', 'Test 1 (25 marks)', '2014-15', '21', '17', '12', '21', '', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '29/36', 'Good work.', 'Save'),
(677, '', 40, '2014-05-02 08:30:14', '2014-05-04 18:44:37', '67', 'Test 1 (25 marks)', '2013-14', '8', '12', '12', '15', '15', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(678, '', 40, '2014-05-04 00:50:01', '2014-05-04 18:44:37', '67', 'Test 1 (25 marks)', '2014-15', '15', '25', '19', '9', '21', '23', 'Well done.', 'Well done.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(679, '', 40, '2014-04-30 10:10:17', '2014-05-04 18:44:37', '68', 'Test 1 (25 marks)', '2013-14', '16', '14', '19', '9', '25', '20', 'Well done.', 'Can do better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(680, '', 40, '2014-04-29 19:50:37', '2014-05-04 18:44:37', '68', 'Test 1 (25 marks)', '2014-15', '23', '22', '11', '11', '8', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(681, '', 40, '2014-05-01 08:56:39', '2014-05-04 18:44:37', '69', 'Test 1 (25 marks)', '2013-14', '14', '22', '17', '13', '7', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(682, '', 40, '2014-04-29 13:01:53', '2014-05-04 18:44:37', '69', 'Test 1 (25 marks)', '2014-15', '13', '24', '18', '12', '16', '9', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Good work.', 'Save'),
(683, '', 40, '2014-05-03 19:09:02', '2014-05-04 18:44:37', '70', 'Test 1 (25 marks)', '2014-15', '20', '7', '17', '', '22', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(684, '', 40, '2014-04-30 15:39:28', '2014-05-04 18:44:37', '71', 'Test 1 (25 marks)', '2013-14', '7', '10', '12', '14', '23', '13', 'Well done.', 'Well done.', 'Needs to improve', '28/36', 'Need to work independently.', 'Save'),
(685, '', 40, '2014-05-02 00:26:50', '0000-00-00 00:00:00', '71', 'Test 1 (25 marks)', '2014-15', '25', '7', '10', '22', '14', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '31/36', 'Concentrate. Too playful.', 'Save'),
(686, '', 40, '2014-05-01 22:20:22', '2014-05-04 18:44:37', '72', 'Test 1 (25 marks)', '2013-14', '14', '10', '24', '14', '10', '11', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good work.', 'Save'),
(687, '', 40, '2014-05-02 04:27:13', '0000-00-00 00:00:00', '72', 'Test 1 (25 marks)', '2014-15', '6', '19', '', '17', '19', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(688, '', 40, '2014-05-02 13:39:04', '2014-05-04 18:44:37', '73', 'Test 1 (25 marks)', '2013-14', '23', '20', '15', '11', '20', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(689, '', 40, '2014-04-29 18:04:53', '0000-00-00 00:00:00', '73', 'Test 1 (25 marks)', '2014-15', '7', '24', '19', '12', '14', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(690, '', 40, '2014-04-30 19:58:34', '2014-05-04 18:44:37', '74', 'Test 1 (25 marks)', '2013-14', '11', '17', '17', '', '7', '21', 'Well done.', 'Well done.', 'Good', '36/36', 'Can do better.', 'Save'),
(691, '', 40, '2014-05-01 02:05:55', '2014-05-04 18:44:37', '74', 'Test 1 (25 marks)', '2014-15', '11', '12', '8', '13', '11', '14', 'Well done.', 'Well done.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(692, '', 40, '2014-05-03 22:24:40', '2014-05-04 18:44:37', '75', 'Test 1 (25 marks)', '2013-14', '6', '21', '12', '14', '17', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need to work hard.', 'Save'),
(693, '', 40, '2014-05-03 01:44:10', '2014-05-04 18:44:37', '75', 'Test 1 (25 marks)', '2014-15', '9', '11', '8', '10', '15', '18', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(694, '', 40, '2014-04-29 06:28:53', '2014-05-04 18:44:37', '76', 'Test 1 (25 marks)', '2013-14', '24', '', '15', '11', '14', '7', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(695, '', 40, '2014-05-02 22:58:24', '2014-05-04 18:44:37', '76', 'Test 1 (25 marks)', '2014-15', '19', '17', '20', '25', '', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(696, '', 40, '2014-05-03 18:59:05', '2014-05-04 18:44:37', '77', 'Test 1 (25 marks)', '2013-14', '8', '24', '13', '24', '8', '20', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Good job in English and Kannada.', 'Save'),
(697, '', 40, '2014-05-01 01:14:09', '2014-05-04 18:44:37', '77', 'Test 1 (25 marks)', '2014-15', '8', '13', '17', '', '12', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Concentrate. Too playful.', 'Save'),
(698, '', 40, '2014-05-01 06:44:17', '2014-05-04 18:44:37', '78', 'Test 1 (25 marks)', '2013-14', '14', '10', '13', '14', '20', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(699, '', 40, '2014-05-01 21:39:13', '0000-00-00 00:00:00', '78', 'Test 1 (25 marks)', '2014-15', '7', '6', '12', '', '19', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(700, '', 40, '2014-05-03 09:43:58', '2014-05-04 18:44:37', '79', 'Test 1 (25 marks)', '2013-14', '6', '18', '9', '23', '20', '20', 'Can do better.', 'Well done.', 'Good', '34/36', 'Need to work independently.', 'Save'),
(701, '', 40, '2014-05-01 22:03:36', '2014-05-04 18:44:37', '79', 'Test 1 (25 marks)', '2014-15', '8', '17', '20', '22', '6', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Can do better.', 'Save'),
(702, '', 40, '2014-05-01 17:12:42', '2014-05-04 18:44:37', '80', 'Test 1 (25 marks)', '2013-14', '18', '12', '13', '19', '16', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '29/36', 'Concentrate. Too playful.', 'Save'),
(703, '', 40, '2014-04-29 16:56:25', '2014-05-04 18:44:37', '80', 'Test 1 (25 marks)', '2014-15', '13', '24', '14', '16', '21', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(704, '', 40, '2014-05-03 22:43:54', '2014-05-04 18:44:37', '81', 'Test 1 (25 marks)', '2013-14', '17', '', '13', '21', '24', '9', 'Well done.', 'Can do better.', 'Good', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(705, '', 40, '2014-05-02 21:05:10', '2014-05-04 18:44:37', '81', 'Test 1 (25 marks)', '2014-15', '', '17', '16', '12', '13', '9', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(706, '', 40, '2014-04-29 04:37:46', '2014-05-04 18:44:37', '82', 'Test 1 (25 marks)', '2013-14', '24', '18', '14', '21', '6', '13', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(707, '', 40, '2014-04-29 09:03:42', '2014-05-04 18:44:37', '82', 'Test 1 (25 marks)', '2014-15', '16', '21', '19', '22', '18', '10', 'Well done.', 'Well done.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(708, '', 40, '2014-05-01 18:02:58', '2014-05-04 18:44:37', '83', 'Test 1 (25 marks)', '2013-14', '8', '24', '14', '11', '23', '', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(709, '', 40, '2014-04-30 11:32:31', '2014-05-04 18:44:37', '83', 'Test 1 (25 marks)', '2014-15', '13', '9', '7', '23', '16', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(710, '', 40, '2014-05-01 20:50:51', '0000-00-00 00:00:00', '84', 'Test 1 (25 marks)', '2013-14', '24', '18', '12', '21', '24', '11', 'Can do better.', 'Can do better.', 'Good', '35/36', 'Can do better.', 'Save'),
(711, '', 40, '2014-05-01 05:31:30', '2014-05-04 18:44:37', '84', 'Test 1 (25 marks)', '2014-15', '11', '15', '17', '18', '13', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(712, '', 40, '2014-05-01 02:21:39', '2014-05-04 18:44:37', '85', 'Test 1 (25 marks)', '2013-14', '22', '', '12', '20', '11', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(713, '', 40, '2014-04-30 04:38:07', '2014-05-04 18:44:37', '85', 'Test 1 (25 marks)', '2014-15', '13', '24', '21', '11', '8', '10', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Good work.', 'Save'),
(714, '', 40, '2014-05-01 19:24:18', '2014-05-04 18:44:37', '86', 'Test 1 (25 marks)', '2013-14', '11', '17', '19', '15', '7', '25', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(715, '', 40, '2014-05-03 13:50:20', '2014-05-04 18:44:37', '87', 'Test 1 (25 marks)', '2013-14', '21', '12', '9', '9', '16', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good job in English and Kannada.', 'Save'),
(716, '', 40, '2014-05-02 18:25:31', '0000-00-00 00:00:00', '87', 'Test 1 (25 marks)', '2014-15', '7', '6', '7', '14', '14', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(717, '', 40, '2014-04-30 11:34:49', '2014-05-04 18:44:37', '88', 'Test 1 (25 marks)', '2013-14', '7', '13', '9', '7', '10', '25', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(718, '', 40, '2014-04-30 05:35:17', '2014-05-04 18:44:37', '88', 'Test 1 (25 marks)', '2014-15', '7', '12', '18', '17', '15', '14', 'Can do better.', 'Can do better.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(719, '', 40, '2014-05-02 07:40:20', '2014-05-04 18:44:37', '89', 'Test 1 (25 marks)', '2013-14', '10', '16', '19', '11', '18', '23', 'Can do better.', 'Can do better.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(720, '', 40, '2014-05-01 09:43:35', '0000-00-00 00:00:00', '89', 'Test 1 (25 marks)', '2014-15', '11', '14', '18', '24', '23', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(721, '', 40, '2014-05-04 04:44:26', '2014-05-04 18:44:37', '90', 'Test 1 (25 marks)', '2013-14', '', '16', '12', '9', '15', '21', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(722, '', 40, '2014-05-01 08:51:10', '2014-05-04 18:44:37', '91', 'Test 1 (25 marks)', '2013-14', '20', '8', '21', '13', '15', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(723, '', 40, '2014-05-01 09:22:29', '2014-05-04 18:44:37', '91', 'Test 1 (25 marks)', '2014-15', '22', '21', '15', '16', '10', '10', 'Can do better.', 'Can do better.', 'Excellent', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(724, '', 40, '2014-04-30 21:41:30', '2014-05-04 18:44:37', '92', 'Test 1 (25 marks)', '2013-14', '19', '19', '9', '14', '23', '16', 'Can do better.', 'Well done.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(725, '', 40, '2014-04-30 06:49:04', '2014-05-04 18:44:37', '92', 'Test 1 (25 marks)', '2014-15', '17', '16', '8', '19', '22', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(726, '', 40, '2014-05-02 02:36:40', '2014-05-04 18:44:37', '93', 'Test 1 (25 marks)', '2013-14', '20', '12', '23', '9', '22', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Good job in English and Kannada.', 'Save'),
(727, '', 40, '2014-05-01 01:54:53', '2014-05-04 18:44:37', '93', 'Test 1 (25 marks)', '2014-15', '20', '6', '23', '', '13', '', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(728, '', 40, '2014-05-02 20:08:06', '2014-05-04 18:44:37', '94', 'Test 1 (25 marks)', '2013-14', '10', '16', '7', '21', '16', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Concentrate. Too playful.', 'Save'),
(729, '', 40, '2014-05-01 07:11:58', '2014-05-04 18:44:37', '94', 'Test 1 (25 marks)', '2014-15', '', '24', '13', '', '22', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Good work.', 'Save'),
(730, '', 40, '2014-05-02 21:06:05', '2014-05-04 18:44:37', '95', 'Test 1 (25 marks)', '2014-15', '13', '14', '12', '23', '10', '16', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Good job in English and Kannada.', 'Save'),
(731, '', 40, '2014-04-29 07:17:48', '0000-00-00 00:00:00', '96', 'Test 1 (25 marks)', '2013-14', '21', '16', '24', '16', '22', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(732, '', 40, '2014-05-02 19:14:45', '2014-05-04 18:44:37', '96', 'Test 1 (25 marks)', '2014-15', '15', '10', '14', '23', '6', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(733, '', 40, '2014-05-01 18:31:51', '2014-05-04 18:44:37', '97', 'Test 1 (25 marks)', '2013-14', '8', '10', '6', '11', '8', '12', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '36/36', 'Good work.', 'Save'),
(734, '', 40, '2014-04-29 07:24:50', '0000-00-00 00:00:00', '97', 'Test 1 (25 marks)', '2014-15', '11', '9', '12', '7', '17', '24', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(735, '', 40, '2014-05-03 16:36:47', '2014-05-04 18:44:37', '98', 'Test 1 (25 marks)', '2013-14', '12', '6', '14', '15', '18', '8', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Need to work independently.', 'Save'),
(736, '', 40, '2014-04-28 23:53:32', '0000-00-00 00:00:00', '98', 'Test 1 (25 marks)', '2014-15', '7', '6', '15', '19', '6', '16', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(737, '', 40, '2014-05-01 03:25:08', '2014-05-04 18:44:37', '99', 'Test 1 (25 marks)', '2013-14', '', '11', '11', '8', '', '15', 'Well done.', 'Well done.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(738, '', 40, '2014-04-30 07:54:29', '0000-00-00 00:00:00', '99', 'Test 1 (25 marks)', '2014-15', '16', '6', '15', '12', '16', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Good job in English and Kannada.', 'Save'),
(739, '', 40, '2014-05-01 04:09:44', '2014-05-04 18:44:37', '100', 'Test 1 (25 marks)', '2013-14', '7', '6', '9', '19', '8', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(740, '', 40, '2014-05-03 19:54:10', '2014-05-04 18:44:37', '100', 'Test 1 (25 marks)', '2014-15', '13', '', '13', '23', '13', '19', 'Can do better.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(741, '', 40, '2014-05-01 01:34:52', '2014-05-04 18:44:37', '101', 'Test 1 (25 marks)', '2013-14', '16', '14', '11', '8', '20', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(742, '', 40, '2014-05-03 02:30:10', '2014-05-04 18:44:37', '101', 'Test 1 (25 marks)', '2014-15', '12', '13', '12', '19', '18', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(743, '', 40, '2014-04-29 05:42:01', '0000-00-00 00:00:00', '102', 'Test 1 (25 marks)', '2013-14', '16', '14', '16', '21', '16', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(744, '', 40, '2014-04-29 22:45:18', '2014-05-04 18:44:37', '103', 'Test 1 (25 marks)', '2013-14', '20', '20', '18', '17', '11', '25', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Concentrate. Too playful.', 'Save'),
(745, '', 40, '2014-04-29 11:18:06', '2014-05-04 18:44:37', '103', 'Test 1 (25 marks)', '2014-15', '', '23', '14', '23', '25', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(746, '', 40, '2014-04-29 19:59:25', '2014-05-04 18:44:37', '104', 'Test 1 (25 marks)', '2013-14', '21', '11', '8', '24', '17', '9', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Need to work independently.', 'Save'),
(747, '', 40, '2014-04-29 01:12:08', '2014-05-04 18:44:37', '104', 'Test 1 (25 marks)', '2014-15', '13', '14', '19', '17', '25', '19', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(748, '', 40, '2014-05-03 01:37:16', '2014-05-04 18:44:37', '105', 'Test 1 (25 marks)', '2013-14', '21', '22', '9', '22', '23', '12', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(749, '', 40, '2014-04-30 01:03:08', '0000-00-00 00:00:00', '105', 'Test 1 (25 marks)', '2014-15', '10', '9', '12', '22', '20', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(750, '', 40, '2014-04-29 08:24:53', '2014-05-04 18:44:37', '106', 'Test 1 (25 marks)', '2013-14', '23', '19', '19', '22', '22', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(751, '', 40, '2014-04-30 09:24:15', '2014-05-04 18:44:37', '106', 'Test 1 (25 marks)', '2014-15', '11', '6', '7', '22', '22', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(752, '', 40, '2014-05-04 05:12:42', '0000-00-00 00:00:00', '107', 'Test 1 (25 marks)', '2013-14', '11', '12', '6', '16', '21', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(753, '', 40, '2014-04-29 13:37:20', '2014-05-04 18:44:37', '107', 'Test 1 (25 marks)', '2014-15', '23', '11', '', '23', '9', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(754, '', 40, '2014-05-03 23:42:40', '2014-05-04 18:44:37', '108', 'Test 1 (25 marks)', '2013-14', '22', '23', '23', '', '9', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(755, '', 40, '2014-04-29 21:38:16', '0000-00-00 00:00:00', '108', 'Test 1 (25 marks)', '2014-15', '12', '21', '6', '18', '11', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(756, '', 40, '2014-04-29 13:57:59', '2014-05-04 18:44:37', '109', 'Test 1 (25 marks)', '2013-14', '6', '18', '18', '15', '21', '13', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(757, '', 40, '2014-04-29 04:49:09', '2014-05-04 18:44:37', '109', 'Test 1 (25 marks)', '2014-15', '15', '24', '21', '9', '17', '13', 'Can do better.', 'Well done.', 'Needs to improve', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(758, '', 40, '2014-05-03 05:47:10', '0000-00-00 00:00:00', '110', 'Test 1 (25 marks)', '2013-14', '21', '20', '22', '15', '20', '12', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Good job in English and Kannada.', 'Save'),
(759, '', 40, '2014-05-02 23:55:07', '0000-00-00 00:00:00', '110', 'Test 1 (25 marks)', '2014-15', '23', '', '18', '23', '11', '9', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(760, '', 40, '2014-05-03 08:43:10', '0000-00-00 00:00:00', '111', 'Test 1 (25 marks)', '2013-14', '22', '22', '25', '24', '18', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(761, '', 40, '2014-05-02 04:15:47', '2014-05-04 18:44:37', '111', 'Test 1 (25 marks)', '2014-15', '17', '12', '14', '22', '21', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(762, '', 40, '2014-05-03 22:57:45', '2014-05-04 18:44:37', '112', 'Test 1 (25 marks)', '2013-14', '8', '9', '6', '20', '7', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(763, '', 40, '2014-04-30 00:37:50', '2014-05-04 18:44:37', '112', 'Test 1 (25 marks)', '2014-15', '9', '', '11', '18', '6', '9', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(764, '', 40, '2014-04-30 13:48:28', '2014-05-04 18:44:37', '113', 'Test 1 (25 marks)', '2013-14', '22', '8', '', '', '17', '20', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Concentrate. Too playful.', 'Save'),
(765, '', 40, '2014-04-28 21:48:58', '2014-05-04 18:44:37', '113', 'Test 1 (25 marks)', '2014-15', '13', '11', '13', '22', '10', '12', 'Well done.', 'Well done.', 'Good', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(766, '', 40, '2014-05-03 22:47:09', '0000-00-00 00:00:00', '114', 'Test 1 (25 marks)', '2013-14', '8', '23', '13', '19', '12', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(767, '', 40, '2014-04-28 21:45:40', '2014-05-04 18:44:37', '114', 'Test 1 (25 marks)', '2014-15', '12', '8', '16', '6', '20', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(768, '', 40, '2014-05-02 10:27:31', '2014-05-04 18:44:37', '115', 'Test 1 (25 marks)', '2013-14', '11', '22', '16', '12', '6', '24', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Can do better.', 'Save'),
(769, '', 40, '2014-04-30 14:16:25', '2014-05-04 18:44:37', '115', 'Test 1 (25 marks)', '2014-15', '10', '17', '23', '23', '20', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(770, '', 40, '2014-05-01 12:59:16', '2014-05-04 18:44:37', '116', 'Test 1 (25 marks)', '2013-14', '21', '14', '21', '17', '6', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Need to work independently.', 'Save'),
(771, '', 40, '2014-05-02 07:24:34', '2014-05-04 18:44:37', '116', 'Test 1 (25 marks)', '2014-15', '11', '13', '8', '15', '9', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Can do better.', 'Save'),
(772, '', 40, '2014-05-03 20:55:06', '2014-05-04 18:44:37', '117', 'Test 1 (25 marks)', '2013-14', '9', '19', '12', '6', '6', '', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(773, '', 40, '2014-04-30 01:46:35', '2014-05-04 18:44:37', '117', 'Test 1 (25 marks)', '2014-15', '14', '13', '12', '23', '14', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Good work.', 'Save'),
(774, '', 40, '2014-05-01 23:58:12', '2014-05-04 18:44:37', '118', 'Test 1 (25 marks)', '2013-14', '7', '23', '13', '10', '18', '16', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work independently.', 'Save'),
(775, '', 40, '2014-05-03 09:34:35', '2014-05-04 18:44:37', '118', 'Test 1 (25 marks)', '2014-15', '22', '13', '16', '11', '13', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Need to work hard.', 'Save'),
(776, '', 40, '2014-05-02 17:32:51', '0000-00-00 00:00:00', '119', 'Test 1 (25 marks)', '2013-14', '14', '16', '6', '10', '19', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(777, '', 40, '2014-04-30 01:09:09', '2014-05-04 18:44:37', '119', 'Test 1 (25 marks)', '2014-15', '11', '', '22', '', '22', '7', 'Can do better.', 'Well done.', 'Needs to improve', '32/36', 'Need to work hard.', 'Save'),
(778, '', 40, '2014-05-04 05:29:57', '2014-05-04 18:44:37', '120', 'Test 1 (25 marks)', '2013-14', '23', '11', '14', '18', '11', '10', 'Can do better.', 'Well done.', 'Needs to improve', '34/36', 'Concentrate. Too playful.', 'Save'),
(779, '', 40, '2014-04-29 00:51:02', '2014-05-04 18:44:37', '120', 'Test 1 (25 marks)', '2014-15', '15', '19', '9', '', '15', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Good work.', 'Save'),
(780, '', 40, '2014-04-29 17:52:47', '0000-00-00 00:00:00', '121', 'Test 1 (25 marks)', '2013-14', '15', '', '21', '15', '12', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(781, '', 40, '2014-05-03 12:23:14', '2014-05-04 18:44:37', '121', 'Test 1 (25 marks)', '2014-15', '15', '17', '16', '11', '7', '13', 'Can do better.', 'Well done.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(782, '', 40, '2014-04-30 04:04:25', '2014-05-04 18:44:37', '122', 'Test 1 (25 marks)', '2014-15', '16', '17', '12', '10', '19', '12', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(783, '', 40, '2014-04-30 14:45:39', '2014-05-04 18:44:37', '123', 'Test 1 (25 marks)', '2013-14', '19', '16', '13', '8', '', '20', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(784, '', 40, '2014-05-01 07:17:25', '2014-05-04 18:44:37', '123', 'Test 1 (25 marks)', '2014-15', '22', '25', '6', '', '7', '18', 'Well done.', 'Can do better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(785, '', 40, '2014-05-02 01:45:17', '2014-05-04 18:44:37', '124', 'Test 1 (25 marks)', '2013-14', '10', '7', '19', '19', '9', '24', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(786, '', 40, '2014-04-30 15:14:37', '2014-05-04 18:44:37', '124', 'Test 1 (25 marks)', '2014-15', '', '16', '24', '24', '20', '7', 'Can do better.', 'Can do better.', 'Good', '27/36', 'Good work.', 'Save'),
(787, '', 40, '2014-04-29 16:38:27', '2014-05-04 18:44:37', '125', 'Test 1 (25 marks)', '2013-14', '19', '10', '19', '22', '21', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(788, '', 40, '2014-05-01 06:13:23', '2014-05-04 18:44:37', '125', 'Test 1 (25 marks)', '2014-15', '20', '21', '23', '14', '17', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(789, '', 40, '2014-05-02 00:08:58', '0000-00-00 00:00:00', '126', 'Test 1 (25 marks)', '2013-14', '6', '22', '16', '24', '10', '7', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(790, '', 40, '2014-05-02 02:58:31', '2014-05-04 18:44:37', '126', 'Test 1 (25 marks)', '2014-15', '19', '', '13', '7', '17', '22', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work hard.', 'Save'),
(791, '', 40, '2014-05-01 08:08:52', '2014-05-04 18:44:37', '127', 'Test 1 (25 marks)', '2013-14', '13', '17', '21', '18', '21', '14', 'Well done.', 'Well done.', 'Good', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(792, '', 40, '2014-05-03 22:36:01', '2014-05-04 18:44:37', '127', 'Test 1 (25 marks)', '2014-15', '10', '11', '19', '18', '8', '12', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(793, '', 40, '2014-04-29 11:24:18', '2014-05-04 18:44:37', '128', 'Test 1 (25 marks)', '2013-14', '15', '19', '20', '17', '22', '15', 'Can do better.', 'Well done.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(794, '', 40, '2014-04-29 20:44:09', '2014-05-04 18:44:37', '128', 'Test 1 (25 marks)', '2014-15', '11', '24', '12', '7', '20', '8', 'Can do better.', 'Well done.', 'Needs to improve', '33/36', 'Can do better.', 'Save'),
(795, '', 40, '2014-05-02 07:08:43', '2014-05-04 18:44:37', '129', 'Test 1 (25 marks)', '2013-14', '16', '23', '7', '21', '20', '20', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(796, '', 40, '2014-05-02 22:19:11', '2014-05-04 18:44:37', '129', 'Test 1 (25 marks)', '2014-15', '', '9', '13', '15', '17', '23', 'Can do better.', 'Can do better.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(797, '', 40, '2014-04-30 22:27:48', '2014-05-04 18:44:37', '130', 'Test 1 (25 marks)', '2013-14', '7', '16', '15', '18', '20', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Good work.', 'Save'),
(798, '', 40, '2014-04-29 11:26:06', '2014-05-04 18:44:37', '130', 'Test 1 (25 marks)', '2014-15', '25', '11', '9', '13', '18', '7', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Can do better.', 'Save'),
(799, '', 40, '2014-05-01 12:41:25', '2014-05-04 18:44:37', '131', 'Test 1 (25 marks)', '2013-14', '16', '21', '11', '6', '13', '24', 'Well done.', 'Can do better.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(800, '', 40, '2014-04-30 22:43:21', '2014-05-04 18:44:37', '131', 'Test 1 (25 marks)', '2014-15', '7', '16', '', '20', '19', '18', 'Can do better.', 'Well done.', 'Needs to improve', '32/36', 'Good work.', 'Save'),
(801, '', 40, '2014-05-03 07:31:21', '2014-05-04 18:44:37', '132', 'Test 1 (25 marks)', '2013-14', '22', '20', '17', '21', '6', '17', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Need to work independently.', 'Save'),
(802, '', 40, '2014-04-29 19:34:34', '2014-05-04 18:44:37', '132', 'Test 1 (25 marks)', '2014-15', '20', '18', '13', '18', '15', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(803, '', 40, '2014-04-29 21:38:18', '2014-05-04 18:44:37', '133', 'Test 1 (25 marks)', '2013-14', '', '21', '8', '9', '15', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(804, '', 40, '2014-05-03 11:29:27', '2014-05-04 18:44:37', '133', 'Test 1 (25 marks)', '2014-15', '21', '22', '17', '6', '8', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(805, '', 40, '2014-05-01 05:46:47', '2014-05-04 18:44:37', '134', 'Test 1 (25 marks)', '2013-14', '17', '17', '18', '23', '8', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(806, '', 40, '2014-04-30 19:25:14', '2014-05-04 18:44:37', '134', 'Test 1 (25 marks)', '2014-15', '8', '8', '6', '18', '12', '16', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(807, '', 40, '2014-04-29 09:00:11', '0000-00-00 00:00:00', '135', 'Test 1 (25 marks)', '2013-14', '11', '13', '10', '13', '15', '22', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(808, '', 40, '2014-04-29 11:35:44', '2014-05-04 18:44:37', '135', 'Test 1 (25 marks)', '2014-15', '17', '16', '', '14', '15', '21', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(809, '', 40, '2014-04-29 11:26:59', '0000-00-00 00:00:00', '136', 'Test 1 (25 marks)', '2013-14', '6', '24', '11', '24', '13', '15', 'Can do better.', 'Well done.', 'Good', '33/36', 'Can do better.', 'Save'),
(810, '', 40, '2014-05-03 00:41:26', '2014-05-04 18:44:37', '136', 'Test 1 (25 marks)', '2014-15', '11', '6', '6', '15', '18', '', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(811, '', 40, '2014-05-02 08:17:45', '2014-05-04 18:44:37', '137', 'Test 1 (25 marks)', '2013-14', '8', '', '12', '13', '19', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Can do better.', 'Save'),
(812, '', 40, '2014-04-29 20:59:23', '2014-05-04 18:44:37', '137', 'Test 1 (25 marks)', '2014-15', '19', '8', '23', '12', '21', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(813, '', 40, '2014-05-01 06:01:29', '0000-00-00 00:00:00', '138', 'Test 1 (25 marks)', '2013-14', '16', '20', '8', '12', '24', '8', 'Well done.', 'Can do better.', 'Needs to improve', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(814, '', 40, '2014-04-28 21:51:52', '2014-05-04 18:44:37', '138', 'Test 1 (25 marks)', '2014-15', '15', '13', '12', '6', '', '14', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Good job in English and Kannada.', 'Save'),
(815, '', 40, '2014-05-01 10:06:45', '2014-05-04 18:44:37', '139', 'Test 1 (25 marks)', '2013-14', '22', '20', '9', '17', '10', '8', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Good job in English and Kannada.', 'Save'),
(816, '', 40, '2014-05-02 06:46:56', '2014-05-04 18:44:37', '139', 'Test 1 (25 marks)', '2014-15', '14', '15', '19', '18', '21', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(817, '', 40, '2014-05-03 23:43:00', '2014-05-04 18:44:37', '140', 'Test 1 (25 marks)', '2013-14', '16', '13', '19', '13', '18', '17', 'Can do better.', 'Can do better.', 'Excellent', '27/36', 'Need to work independently.', 'Save'),
(818, '', 40, '2014-05-03 21:46:48', '2014-05-04 18:44:37', '140', 'Test 1 (25 marks)', '2014-15', '11', '8', '9', '20', '6', '25', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(819, '', 40, '2014-05-02 23:28:57', '2014-05-04 18:44:37', '141', 'Test 1 (25 marks)', '2013-14', '24', '14', '19', '23', '8', '', 'Can do better.', 'Well done.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(820, '', 40, '2014-05-02 08:22:41', '0000-00-00 00:00:00', '141', 'Test 1 (25 marks)', '2014-15', '16', '18', '21', '', '15', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good work.', 'Save'),
(821, '', 40, '2014-05-03 00:48:38', '2014-05-04 18:44:37', '142', 'Test 1 (25 marks)', '2013-14', '21', '21', '23', '11', '', '16', 'Well done.', 'Well done.', 'Good', '29/36', 'Good work.', 'Save'),
(822, '', 40, '2014-05-03 13:48:04', '0000-00-00 00:00:00', '142', 'Test 1 (25 marks)', '2014-15', '22', '21', '22', '12', '11', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(823, '', 40, '2014-05-03 15:10:19', '2014-05-04 18:44:37', '143', 'Test 1 (25 marks)', '2013-14', '18', '15', '21', '17', '10', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(824, '', 40, '2014-05-01 22:53:42', '2014-05-04 18:44:37', '143', 'Test 1 (25 marks)', '2014-15', '23', '19', '', '11', '21', '', 'Can do better.', 'Can do better.', 'Excellent', '27/36', 'Need to work independently.', 'Save'),
(825, '', 40, '2014-05-01 05:33:13', '0000-00-00 00:00:00', '144', 'Test 1 (25 marks)', '2013-14', '20', '17', '19', '22', '21', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(826, '', 40, '2014-05-01 11:42:07', '0000-00-00 00:00:00', '144', 'Test 1 (25 marks)', '2014-15', '11', '6', '9', '9', '6', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(827, '', 40, '2014-04-30 17:50:04', '2014-05-04 18:44:37', '145', 'Test 1 (25 marks)', '2013-14', '8', '20', '17', '12', '16', '16', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(828, '', 40, '2014-04-29 01:08:13', '0000-00-00 00:00:00', '145', 'Test 1 (25 marks)', '2014-15', '22', '20', '8', '17', '14', '12', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(829, '', 40, '2014-05-02 12:18:14', '2014-05-04 18:44:37', '146', 'Test 1 (25 marks)', '2013-14', '17', '15', '21', '8', '', '13', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(830, '', 40, '2014-04-29 09:55:51', '0000-00-00 00:00:00', '146', 'Test 1 (25 marks)', '2014-15', '23', '19', '15', '18', '19', '14', 'Well done.', 'Well done.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(831, '', 40, '2014-04-29 07:55:29', '2014-05-04 18:44:37', '147', 'Test 1 (25 marks)', '2014-15', '9', '15', '9', '21', '17', '13', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(832, '', 40, '2014-04-29 15:21:06', '2014-05-04 18:44:37', '148', 'Test 1 (25 marks)', '2013-14', '24', '', '11', '24', '13', '24', 'Well done.', 'Well done.', 'Good', '26/36', 'Concentrate. Too playful.', 'Save'),
(833, '', 40, '2014-05-02 11:36:41', '0000-00-00 00:00:00', '148', 'Test 1 (25 marks)', '2014-15', '21', '11', '12', '6', '19', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Can do better.', 'Save'),
(834, '', 40, '2014-04-29 16:13:59', '2014-05-04 18:44:37', '149', 'Test 1 (25 marks)', '2013-14', '9', '25', '14', '17', '8', '14', 'Can do better.', 'Well done.', 'Good', '36/36', 'Good job in English and Kannada.', 'Save'),
(835, '', 40, '2014-05-03 15:05:33', '2014-05-04 18:44:37', '149', 'Test 1 (25 marks)', '2014-15', '12', '18', '24', '18', '7', '23', 'Can do better.', 'Can do better.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(836, '', 40, '2014-05-02 04:38:37', '2014-05-04 18:44:37', '150', 'Test 1 (25 marks)', '2014-15', '21', '8', '16', '23', '16', '19', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(837, '', 40, '2014-04-30 03:52:43', '0000-00-00 00:00:00', '151', 'Test 1 (25 marks)', '2013-14', '19', '15', '16', '9', '20', '17', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(838, '', 40, '2014-05-01 13:28:39', '2014-05-04 18:44:37', '151', 'Test 1 (25 marks)', '2014-15', '22', '18', '12', '16', '16', '18', 'Well done.', 'Well done.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(839, '', 40, '2014-05-01 06:06:55', '2014-05-04 18:44:37', '152', 'Test 1 (25 marks)', '2013-14', '14', '20', '8', '13', '20', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(840, '', 40, '2014-05-04 00:24:19', '2014-05-04 18:44:37', '152', 'Test 1 (25 marks)', '2014-15', '14', '19', '15', '18', '7', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(841, '', 40, '2014-04-29 18:03:39', '2014-05-04 18:44:37', '153', 'Test 1 (25 marks)', '2013-14', '', '21', '7', '11', '24', '9', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(842, '', 40, '2014-05-01 22:07:26', '2014-05-04 18:44:37', '153', 'Test 1 (25 marks)', '2014-15', '18', '17', '24', '12', '8', '16', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(843, '', 40, '2014-04-30 20:21:46', '2014-05-04 18:44:37', '154', 'Test 1 (25 marks)', '2014-15', '24', '20', '9', '18', '14', '', 'Can do better.', 'Can do better.', 'Excellent', '30/36', 'Need to work independently.', 'Save'),
(844, '', 40, '2014-05-01 23:01:13', '0000-00-00 00:00:00', '155', 'Test 1 (25 marks)', '2013-14', '16', '17', '18', '17', '17', '20', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(845, '', 40, '2014-04-29 19:03:10', '2014-05-04 18:44:37', '155', 'Test 1 (25 marks)', '2014-15', '6', '20', '12', '15', '11', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(846, '', 40, '2014-04-29 02:24:17', '0000-00-00 00:00:00', '156', 'Test 1 (25 marks)', '2013-14', '20', '24', '16', '8', '24', '15', 'Well done.', 'Well done.', 'Good', '28/36', 'Can do better.', 'Save'),
(847, '', 40, '2014-05-03 08:37:55', '2014-05-04 18:44:37', '157', 'Test 1 (25 marks)', '2013-14', '24', '8', '20', '11', '17', '21', 'Can do better.', 'Well done.', 'Good', '36/36', 'Need to work independently.', 'Save'),
(848, '', 40, '2014-05-03 23:04:53', '2014-05-04 18:44:37', '157', 'Test 1 (25 marks)', '2014-15', '22', '13', '24', '19', '6', '7', 'Well done.', 'Can do better.', 'Good', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(849, '', 40, '2014-05-04 00:48:02', '2014-05-04 18:44:37', '158', 'Test 1 (25 marks)', '2013-14', '12', '14', '14', '19', '7', '9', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Good work.', 'Save'),
(850, '', 40, '2014-05-03 13:43:43', '2014-05-04 18:44:37', '158', 'Test 1 (25 marks)', '2014-15', '17', '23', '13', '', '7', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(851, '', 40, '2014-04-29 15:05:22', '2014-05-04 18:44:37', '159', 'Test 1 (25 marks)', '2013-14', '24', '11', '13', '19', '12', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(852, '', 40, '2014-05-04 03:09:38', '2014-05-04 18:44:37', '159', 'Test 1 (25 marks)', '2014-15', '17', '21', '23', '19', '12', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Concentrate. Too playful.', 'Save'),
(853, '', 40, '2014-05-02 04:31:15', '2014-05-04 18:44:37', '1', 'Final Exam (100 marks)', '2013-14', '68', '63', '43', '40', '39', '91', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(854, '', 40, '2014-05-01 03:52:34', '0000-00-00 00:00:00', '1', 'Final Exam (100 marks)', '2014-15', '', '48', '', '56', '31', '46', 'Can do better.', 'Well done.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(855, '', 40, '2014-05-01 12:52:23', '2014-05-04 18:44:37', '2', 'Final Exam (100 marks)', '2013-14', '36', '56', '54', '53', '55', '86', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(856, '', 40, '2014-04-30 00:42:11', '0000-00-00 00:00:00', '2', 'Final Exam (100 marks)', '2014-15', '59', '45', '88', '98', '94', '82', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(857, '', 40, '2014-05-02 13:20:07', '0000-00-00 00:00:00', '3', 'Final Exam (100 marks)', '2013-14', '68', '94', '54', '92', '61', '90', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Good work.', 'Save'),
(858, '', 40, '2014-05-03 20:44:10', '2014-05-04 18:44:37', '3', 'Final Exam (100 marks)', '2014-15', '73', '83', '50', '26', '43', '44', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Concentrate. Too playful.', 'Save'),
(859, '', 40, '2014-05-03 17:56:19', '2014-05-04 18:44:37', '4', 'Final Exam (100 marks)', '2013-14', '84', '93', '71', '31', '28', '77', 'Can do better.', 'Well done.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(860, '', 40, '2014-05-02 09:23:05', '2014-05-04 18:44:37', '4', 'Final Exam (100 marks)', '2014-15', '63', '97', '30', '95', '85', '63', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(861, '', 40, '2014-04-29 14:56:03', '2014-05-04 18:44:37', '5', 'Final Exam (100 marks)', '2013-14', '', '86', '61', '25', '', '', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(862, '', 40, '2014-05-02 23:34:12', '0000-00-00 00:00:00', '5', 'Final Exam (100 marks)', '2014-15', '74', '55', '35', '74', '86', '65', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(863, '', 40, '2014-04-30 20:56:24', '0000-00-00 00:00:00', '6', 'Final Exam (100 marks)', '2013-14', '83', '', '28', '63', '31', '84', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(864, '', 40, '2014-05-01 21:54:53', '2014-05-04 18:44:37', '7', 'Final Exam (100 marks)', '2013-14', '72', '82', '46', '85', '32', '68', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(865, '', 40, '2014-05-02 14:24:27', '2014-05-04 18:44:37', '7', 'Final Exam (100 marks)', '2014-15', '77', '50', '87', '64', '46', '89', 'Can do better.', 'Can do better.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(866, '', 40, '2014-04-29 15:43:44', '2014-05-04 18:44:37', '8', 'Final Exam (100 marks)', '2013-14', '', '29', '54', '67', '50', '49', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Good work.', 'Save'),
(867, '', 40, '2014-05-02 10:32:17', '2014-05-04 18:44:37', '8', 'Final Exam (100 marks)', '2014-15', '44', '100', '98', '32', '36', '43', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard.', 'Save'),
(868, '', 40, '2014-05-03 10:55:26', '0000-00-00 00:00:00', '9', 'Final Exam (100 marks)', '2013-14', '44', '34', '74', '54', '63', '67', 'Can do better.', 'Well done.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(869, '', 40, '2014-04-30 03:47:10', '2014-05-04 18:44:37', '9', 'Final Exam (100 marks)', '2014-15', '', '65', '94', '42', '48', '29', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(870, '', 40, '2014-05-02 02:09:32', '2014-05-04 18:44:37', '10', 'Final Exam (100 marks)', '2014-15', '28', '65', '48', '86', '35', '35', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need to work independently.', 'Save'),
(871, '', 40, '2014-05-01 00:37:37', '2014-05-04 18:44:37', '12', 'Final Exam (100 marks)', '2013-14', '65', '85', '68', '65', '29', '36', 'Well done.', 'Can do better.', 'Excellent', '30/36', 'Need to work independently.', 'Save'),
(872, '', 40, '2014-05-03 09:14:44', '2014-05-04 18:44:37', '12', 'Final Exam (100 marks)', '2014-15', '80', '', '45', '55', '64', '91', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(873, '', 40, '2014-05-03 14:13:13', '2014-05-04 18:44:37', '13', 'Final Exam (100 marks)', '2013-14', '47', '88', '42', '43', '51', '76', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(874, '', 40, '2014-05-03 22:45:47', '2014-05-04 18:44:37', '13', 'Final Exam (100 marks)', '2014-15', '83', '31', '32', '80', '', '94', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(875, '', 40, '2014-04-29 18:54:43', '2014-05-04 18:44:37', '14', 'Final Exam (100 marks)', '2013-14', '57', '73', '48', '46', '37', '44', 'Well done.', 'Can do better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(876, '', 40, '2014-04-29 23:29:06', '2014-05-04 18:44:37', '14', 'Final Exam (100 marks)', '2014-15', '36', '30', '66', '46', '', '54', 'Well done.', 'Well done.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(877, '', 40, '2014-05-02 12:21:09', '2014-05-04 18:44:37', '15', 'Final Exam (100 marks)', '2013-14', '44', '100', '72', '76', '79', '89', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(878, '', 40, '2014-05-02 23:23:15', '2014-05-04 18:44:37', '15', 'Final Exam (100 marks)', '2014-15', '69', '32', '38', '57', '70', '48', 'Can do better.', 'Well done.', 'Good', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(879, '', 40, '2014-05-01 06:25:17', '0000-00-00 00:00:00', '16', 'Final Exam (100 marks)', '2013-14', '53', '84', '27', '', '70', '82', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Good work.', 'Save'),
(880, '', 40, '2014-05-03 17:03:29', '2014-05-04 18:44:37', '16', 'Final Exam (100 marks)', '2014-15', '98', '81', '58', '80', '92', '52', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(881, '', 40, '2014-05-03 06:41:52', '2014-05-04 18:44:37', '17', 'Final Exam (100 marks)', '2014-15', '49', '56', '91', '29', '72', '59', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(882, '', 40, '2014-04-30 19:12:38', '2014-05-04 18:44:37', '18', 'Final Exam (100 marks)', '2014-15', '', '64', '52', '57', '68', '32', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(883, '', 40, '2014-05-04 01:27:15', '0000-00-00 00:00:00', '19', 'Final Exam (100 marks)', '2013-14', '51', '81', '', '74', '90', '49', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work independently.', 'Save'),
(884, '', 40, '2014-04-30 00:05:08', '2014-05-04 18:44:37', '19', 'Final Exam (100 marks)', '2014-15', '87', '57', '27', '', '83', '56', 'Can do better.', 'Can do better.', 'Needs to improve', '31/36', 'Can do better.', 'Save'),
(885, '', 40, '2014-04-30 00:14:05', '2014-05-04 18:44:37', '20', 'Final Exam (100 marks)', '2013-14', '86', '65', '44', '43', '43', '47', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(886, '', 40, '2014-05-02 14:39:24', '2014-05-04 18:44:37', '20', 'Final Exam (100 marks)', '2014-15', '69', '94', '89', '91', '57', '36', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(887, '', 40, '2014-05-03 15:39:57', '2014-05-04 18:44:37', '21', 'Final Exam (100 marks)', '2014-15', '65', '56', '34', '70', '86', '62', 'Can do better.', 'Well done.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(888, '', 40, '2014-04-30 11:18:36', '2014-05-04 18:44:37', '22', 'Final Exam (100 marks)', '2014-15', '26', '66', '85', '60', '53', '100', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Good job in English and Kannada.', 'Save'),
(889, '', 40, '2014-05-03 20:49:58', '0000-00-00 00:00:00', '23', 'Final Exam (100 marks)', '2013-14', '61', '57', '28', '89', '78', '95', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Concentrate. Too playful.', 'Save'),
(890, '', 40, '2014-04-29 23:56:56', '2014-05-04 18:44:37', '23', 'Final Exam (100 marks)', '2014-15', '94', '98', '52', '67', '100', '39', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Good work.', 'Save'),
(891, '', 40, '2014-04-30 17:17:38', '0000-00-00 00:00:00', '24', 'Final Exam (100 marks)', '2013-14', '95', '43', '61', '', '64', '74', 'Can do better.', 'Well done.', 'Needs to improve', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(892, '', 40, '2014-05-01 00:33:35', '2014-05-04 18:44:37', '25', 'Final Exam (100 marks)', '2013-14', '', '38', '85', '46', '39', '86', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(893, '', 40, '2014-05-02 06:56:13', '2014-05-04 18:44:37', '26', 'Final Exam (100 marks)', '2014-15', '71', '28', '', '68', '43', '73', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Good job in English and Kannada.', 'Save'),
(894, '', 40, '2014-05-02 02:21:13', '0000-00-00 00:00:00', '27', 'Final Exam (100 marks)', '2013-14', '27', '47', '31', '52', '99', '79', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(895, '', 40, '2014-04-30 08:17:16', '0000-00-00 00:00:00', '27', 'Final Exam (100 marks)', '2014-15', '25', '83', '53', '51', '43', '77', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(896, '', 40, '2014-04-30 07:45:54', '0000-00-00 00:00:00', '28', 'Final Exam (100 marks)', '2013-14', '40', '71', '47', '75', '68', '62', 'Can do better.', 'Can do better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(897, '', 40, '2014-04-29 21:27:11', '2014-05-04 18:44:37', '28', 'Final Exam (100 marks)', '2014-15', '89', '28', '68', '54', '59', '25', 'Well done.', 'Can do better.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(898, '', 40, '2014-05-01 09:15:37', '2014-05-04 18:44:37', '29', 'Final Exam (100 marks)', '2013-14', '71', '93', '76', '98', '73', '100', 'Well done.', 'Can do better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(899, '', 40, '2014-05-01 01:52:28', '2014-05-04 18:44:37', '29', 'Final Exam (100 marks)', '2014-15', '89', '', '67', '81', '57', '47', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work hard.', 'Save'),
(900, '', 40, '2014-05-04 01:19:41', '2014-05-04 18:44:37', '30', 'Final Exam (100 marks)', '2013-14', '54', '31', '80', '', '', '48', 'Well done.', 'Well done.', 'Good', '36/36', 'Can do better.', 'Save'),
(901, '', 40, '2014-04-29 17:16:34', '2014-05-04 18:44:37', '31', 'Final Exam (100 marks)', '2013-14', '', '98', '29', '53', '63', '39', 'Well done.', 'Well done.', 'Excellent', '26/36', 'Concentrate. Too playful.', 'Save'),
(902, '', 40, '2014-05-01 05:30:11', '2014-05-04 18:44:37', '31', 'Final Exam (100 marks)', '2014-15', '56', '29', '49', '46', '32', '69', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(903, '', 40, '2014-05-01 19:42:09', '0000-00-00 00:00:00', '32', 'Final Exam (100 marks)', '2013-14', '69', '87', '25', '83', '97', '63', 'Well done.', 'Well done.', 'Needs to improve', '35/36', 'Can do better.', 'Save'),
(904, '', 40, '2014-05-02 05:21:31', '2014-05-04 18:44:37', '32', 'Final Exam (100 marks)', '2014-15', '84', '47', '44', '94', '37', '49', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(905, '', 40, '2014-05-02 16:56:23', '2014-05-04 18:44:37', '33', 'Final Exam (100 marks)', '2013-14', '84', '33', '55', '54', '50', '49', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Good work.', 'Save'),
(906, '', 40, '2014-05-01 15:35:41', '2014-05-04 18:44:37', '33', 'Final Exam (100 marks)', '2014-15', '70', '42', '34', '81', '83', '40', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(907, '', 40, '2014-05-03 10:27:04', '2014-05-04 18:44:37', '34', 'Final Exam (100 marks)', '2013-14', '88', '44', '34', '72', '77', '28', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(908, '', 40, '2014-05-02 09:56:34', '0000-00-00 00:00:00', '34', 'Final Exam (100 marks)', '2014-15', '100', '100', '25', '63', '96', '78', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(909, '', 40, '2014-04-30 13:04:58', '2014-05-04 18:44:37', '35', 'Final Exam (100 marks)', '2013-14', '58', '77', '93', '32', '96', '45', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(910, '', 40, '2014-05-04 05:28:27', '2014-05-04 18:44:37', '35', 'Final Exam (100 marks)', '2014-15', '81', '58', '94', '39', '28', '73', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(911, '', 40, '2014-05-03 07:48:36', '2014-05-04 18:44:37', '36', 'Final Exam (100 marks)', '2013-14', '53', '98', '', '92', '30', '99', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(912, '', 40, '2014-05-03 18:05:13', '0000-00-00 00:00:00', '36', 'Final Exam (100 marks)', '2014-15', '25', '49', '67', '41', '68', '76', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(913, '', 40, '2014-05-02 16:34:15', '2014-05-04 18:44:37', '37', 'Final Exam (100 marks)', '2013-14', '41', '74', '75', '55', '49', '46', 'Can do better.', 'Well done.', 'Good', '33/36', 'Can do better.', 'Save'),
(914, '', 40, '2014-04-30 15:42:20', '2014-05-04 18:44:37', '38', 'Final Exam (100 marks)', '2013-14', '68', '40', '29', '44', '64', '93', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(915, '', 40, '2014-04-30 12:35:21', '2014-05-04 18:44:37', '38', 'Final Exam (100 marks)', '2014-15', '30', '40', '100', '44', '', '49', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(916, '', 40, '2014-04-29 09:12:49', '2014-05-04 18:44:37', '39', 'Final Exam (100 marks)', '2013-14', '40', '26', '89', '', '63', '76', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(917, '', 40, '2014-04-30 13:45:47', '0000-00-00 00:00:00', '39', 'Final Exam (100 marks)', '2014-15', '59', '40', '99', '74', '', '31', 'Well done.', 'Well done.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(918, '', 40, '2014-05-01 08:34:24', '2014-05-04 18:44:37', '41', 'Final Exam (100 marks)', '2013-14', '54', '43', '97', '53', '81', '51', 'Can do better.', 'Well done.', 'Good', '35/36', 'Concentrate. Too playful.', 'Save'),
(919, '', 40, '2014-04-30 06:03:02', '2014-05-04 18:44:37', '41', 'Final Exam (100 marks)', '2014-15', '38', '57', '56', '32', '68', '50', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Good job in English and Kannada.', 'Save'),
(920, '', 40, '2014-04-30 00:52:36', '2014-05-04 18:44:37', '42', 'Final Exam (100 marks)', '2013-14', '28', '46', '73', '70', '74', '47', 'Well done.', 'Well done.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(921, '', 40, '2014-05-02 18:32:19', '2014-05-04 18:44:37', '42', 'Final Exam (100 marks)', '2014-15', '36', '64', '55', '96', '58', '87', 'Well done.', 'Well done.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(922, '', 40, '2014-05-01 10:46:54', '2014-05-04 18:44:37', '43', 'Final Exam (100 marks)', '2013-14', '47', '63', '90', '50', '80', '45', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Good work.', 'Save'),
(923, '', 40, '2014-04-30 22:21:42', '0000-00-00 00:00:00', '43', 'Final Exam (100 marks)', '2014-15', '99', '34', '97', '27', '29', '75', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Can do better.', 'Save'),
(924, '', 40, '2014-04-30 10:14:36', '2014-05-04 18:44:37', '44', 'Final Exam (100 marks)', '2014-15', '94', '100', '55', '35', '98', '81', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(925, '', 40, '2014-04-29 11:32:37', '2014-05-04 18:44:37', '45', 'Final Exam (100 marks)', '2013-14', '91', '54', '30', '96', '51', '66', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard.', 'Save'),
(926, '', 40, '2014-05-01 18:03:27', '2014-05-04 18:44:37', '45', 'Final Exam (100 marks)', '2014-15', '33', '65', '61', '26', '28', '42', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good job in English and Kannada.', 'Save'),
(927, '', 40, '2014-05-03 17:49:31', '2014-05-04 18:44:37', '46', 'Final Exam (100 marks)', '2013-14', '100', '86', '83', '', '67', '66', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(928, '', 40, '2014-04-29 23:14:46', '0000-00-00 00:00:00', '46', 'Final Exam (100 marks)', '2014-15', '97', '45', '56', '95', '58', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(929, '', 40, '2014-04-30 12:39:47', '2014-05-04 18:44:37', '47', 'Final Exam (100 marks)', '2013-14', '57', '65', '91', '59', '94', '62', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(930, '', 40, '2014-04-30 18:48:47', '0000-00-00 00:00:00', '47', 'Final Exam (100 marks)', '2014-15', '87', '40', '93', '35', '46', '83', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Need to work hard.', 'Save'),
(931, '', 40, '2014-04-28 22:21:56', '0000-00-00 00:00:00', '48', 'Final Exam (100 marks)', '2013-14', '91', '28', '89', '80', '42', '26', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Good work.', 'Save'),
(932, '', 40, '2014-05-01 11:58:50', '2014-05-04 18:44:37', '48', 'Final Exam (100 marks)', '2014-15', '96', '26', '95', '70', '99', '77', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Concentrate. Too playful.', 'Save'),
(933, '', 40, '2014-05-03 22:19:10', '0000-00-00 00:00:00', '49', 'Final Exam (100 marks)', '2013-14', '47', '82', '25', '100', '69', '43', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '32/36', 'Good job in English and Kannada.', 'Save'),
(934, '', 40, '2014-04-29 11:41:31', '2014-05-04 18:44:37', '49', 'Final Exam (100 marks)', '2014-15', '59', '74', '96', '64', '70', '72', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '28/36', 'Need to work independently.', 'Save'),
(935, '', 40, '2014-05-03 19:39:11', '2014-05-04 18:44:37', '50', 'Final Exam (100 marks)', '2013-14', '42', '', '82', '73', '', '30', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(936, '', 40, '2014-05-03 12:24:06', '2014-05-04 18:44:37', '51', 'Final Exam (100 marks)', '2014-15', '55', '76', '42', '', '82', '33', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(937, '', 40, '2014-04-29 04:40:29', '2014-05-04 18:44:37', '52', 'Final Exam (100 marks)', '2013-14', '100', '79', '40', '95', '45', '33', 'Well done.', 'Can do better.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(938, '', 40, '2014-05-04 00:42:57', '0000-00-00 00:00:00', '53', 'Final Exam (100 marks)', '2013-14', '', '30', '46', '47', '32', '100', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(939, '', 40, '2014-04-30 02:48:01', '2014-05-04 18:44:37', '54', 'Final Exam (100 marks)', '2013-14', '39', '39', '56', '64', '59', '97', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(940, '', 40, '2014-05-03 22:57:38', '2014-05-04 18:44:37', '54', 'Final Exam (100 marks)', '2014-15', '84', '81', '', '26', '37', '92', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(941, '', 40, '2014-05-03 13:26:25', '2014-05-04 18:44:37', '55', 'Final Exam (100 marks)', '2013-14', '94', '66', '80', '85', '82', '32', 'Can do better.', 'Can do better.', 'Good', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(942, '', 40, '2014-05-01 09:33:11', '2014-05-04 18:44:37', '55', 'Final Exam (100 marks)', '2014-15', '67', '82', '88', '56', '63', '55', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Need to work hard.', 'Save'),
(943, '', 40, '2014-04-30 12:24:13', '2014-05-04 18:44:37', '56', 'Final Exam (100 marks)', '2013-14', '30', '43', '84', '62', '32', '66', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(944, '', 40, '2014-05-01 06:32:21', '2014-05-04 18:44:37', '56', 'Final Exam (100 marks)', '2014-15', '97', '65', '90', '32', '55', '43', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Need to work hard.', 'Save'),
(945, '', 40, '2014-04-30 17:15:30', '0000-00-00 00:00:00', '57', 'Final Exam (100 marks)', '2014-15', '82', '44', '68', '54', '99', '82', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(946, '', 40, '2014-04-30 01:06:39', '2014-05-04 18:44:37', '58', 'Final Exam (100 marks)', '2014-15', '63', '80', '41', '66', '83', '97', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(947, '', 40, '2014-04-30 12:27:18', '2014-05-04 18:44:37', '59', 'Final Exam (100 marks)', '2014-15', '32', '70', '72', '96', '52', '63', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(948, '', 40, '2014-04-29 16:27:45', '2014-05-04 18:44:37', '60', 'Final Exam (100 marks)', '2013-14', '91', '46', '73', '87', '87', '74', 'Can do better.', 'Can do better.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(949, '', 40, '2014-05-04 03:39:05', '0000-00-00 00:00:00', '61', 'Final Exam (100 marks)', '2014-15', '39', '99', '97', '83', '35', '59', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(950, '', 40, '2014-05-02 18:51:58', '2014-05-04 18:44:37', '62', 'Final Exam (100 marks)', '2013-14', '70', '36', '79', '71', '88', '44', 'Well done.', 'Well done.', 'Excellent', '32/36', 'Need to work independently.', 'Save'),
(951, '', 40, '2014-05-01 16:32:34', '2014-05-04 18:44:37', '62', 'Final Exam (100 marks)', '2014-15', '89', '', '27', '28', '38', '97', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Good job in English and Kannada.', 'Save'),
(952, '', 40, '2014-05-03 07:39:37', '2014-05-04 18:44:37', '63', 'Final Exam (100 marks)', '2013-14', '', '82', '82', '25', '91', '47', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(953, '', 40, '2014-04-30 20:20:35', '2014-05-04 18:44:37', '63', 'Final Exam (100 marks)', '2014-15', '46', '82', '83', '96', '61', '76', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(954, '', 40, '2014-04-30 11:24:39', '2014-05-04 18:44:37', '64', 'Final Exam (100 marks)', '2014-15', '79', '76', '70', '29', '30', '77', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Can do better.', 'Save'),
(955, '', 40, '2014-04-30 02:06:29', '0000-00-00 00:00:00', '65', 'Final Exam (100 marks)', '2013-14', '40', '43', '54', '56', '63', '98', 'Well done.', 'Well done.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(956, '', 40, '2014-05-02 00:24:29', '2014-05-04 18:44:37', '66', 'Final Exam (100 marks)', '2013-14', '27', '86', '66', '67', '87', '43', 'Well done.', 'Can do better.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(957, '', 40, '2014-04-29 18:23:32', '2014-05-04 18:44:37', '66', 'Final Exam (100 marks)', '2014-15', '38', '90', '56', '37', '51', '40', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(958, '', 40, '2014-05-02 16:25:53', '2014-05-04 18:44:37', '67', 'Final Exam (100 marks)', '2013-14', '64', '98', '89', '91', '60', '67', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '26/36', 'Concentrate. Too playful.', 'Save'),
(959, '', 40, '2014-05-04 05:11:14', '0000-00-00 00:00:00', '67', 'Final Exam (100 marks)', '2014-15', '73', '38', '70', '76', '92', '26', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(960, '', 40, '2014-04-30 08:24:51', '2014-05-04 18:44:37', '68', 'Final Exam (100 marks)', '2013-14', '51', '91', '52', '73', '60', '53', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Concentrate. Too playful.', 'Save'),
(961, '', 40, '2014-04-30 03:45:59', '2014-05-04 18:44:37', '68', 'Final Exam (100 marks)', '2014-15', '93', '70', '67', '', '38', '37', 'Can do better.', 'Can do better.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(962, '', 40, '2014-05-02 12:22:44', '2014-05-04 18:44:37', '69', 'Final Exam (100 marks)', '2013-14', '95', '71', '62', '41', '37', '32', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Can do better.', 'Save'),
(963, '', 40, '2014-04-30 13:14:56', '2014-05-04 18:44:37', '70', 'Final Exam (100 marks)', '2013-14', '', '', '55', '29', '40', '89', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(964, '', 40, '2014-05-02 09:01:10', '2014-05-04 18:44:37', '70', 'Final Exam (100 marks)', '2014-15', '93', '86', '91', '81', '37', '28', 'Can do better.', 'Can do better.', 'Good', '34/36', 'Good work.', 'Save'),
(965, '', 40, '2014-05-01 21:49:58', '2014-05-04 18:44:37', '71', 'Final Exam (100 marks)', '2013-14', '80', '49', '35', '91', '81', '100', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(966, '', 40, '2014-04-29 07:15:43', '2014-05-04 18:44:37', '71', 'Final Exam (100 marks)', '2014-15', '87', '98', '90', '59', '63', '48', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(967, '', 40, '2014-05-01 07:23:47', '2014-05-04 18:44:37', '72', 'Final Exam (100 marks)', '2013-14', '41', '29', '92', '70', '41', '', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(968, '', 40, '2014-04-30 06:52:25', '2014-05-04 18:44:37', '73', 'Final Exam (100 marks)', '2013-14', '74', '30', '77', '64', '51', '50', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(969, '', 40, '2014-05-01 02:24:01', '2014-05-04 18:44:37', '73', 'Final Exam (100 marks)', '2014-15', '26', '28', '33', '78', '86', '90', 'Can do better.', 'Can do better.', 'Excellent', '32/36', 'Concentrate. Too playful.', 'Save'),
(970, '', 40, '2014-05-03 12:34:29', '2014-05-04 18:44:37', '74', 'Final Exam (100 marks)', '2013-14', '70', '71', '91', '89', '82', '37', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work independently.', 'Save'),
(971, '', 40, '2014-05-01 06:02:28', '0000-00-00 00:00:00', '74', 'Final Exam (100 marks)', '2014-15', '', '64', '72', '80', '55', '', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(972, '', 40, '2014-05-02 01:21:27', '2014-05-04 18:44:37', '75', 'Final Exam (100 marks)', '2013-14', '81', '95', '43', '74', '29', '39', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(973, '', 40, '2014-04-29 03:38:43', '2014-05-04 18:44:37', '75', 'Final Exam (100 marks)', '2014-15', '28', '93', '95', '41', '67', '46', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(974, '', 40, '2014-05-01 09:33:31', '0000-00-00 00:00:00', '76', 'Final Exam (100 marks)', '2013-14', '66', '55', '92', '73', '66', '84', 'Can do better.', 'Well done.', 'Needs to improve', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(975, '', 40, '2014-04-29 02:10:59', '2014-05-04 18:44:37', '76', 'Final Exam (100 marks)', '2014-15', '47', '100', '66', '60', '33', '82', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '35/36', 'Need to work hard.', 'Save'),
(976, '', 40, '2014-05-01 21:34:26', '0000-00-00 00:00:00', '77', 'Final Exam (100 marks)', '2013-14', '56', '48', '34', '68', '26', '80', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Can do better.', 'Save'),
(977, '', 40, '2014-04-30 20:38:55', '2014-05-04 18:44:37', '77', 'Final Exam (100 marks)', '2014-15', '69', '27', '52', '47', '41', '80', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(978, '', 40, '2014-04-29 02:00:32', '2014-05-04 18:44:37', '78', 'Final Exam (100 marks)', '2013-14', '85', '78', '31', '56', '72', '', 'Well done.', 'Well done.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(979, '', 40, '2014-04-29 06:49:32', '2014-05-04 18:44:37', '78', 'Final Exam (100 marks)', '2014-15', '61', '69', '61', '100', '75', '78', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(980, '', 40, '2014-05-03 10:19:05', '2014-05-04 18:44:37', '79', 'Final Exam (100 marks)', '2013-14', '70', '74', '98', '79', '', '50', 'Well done.', 'Can do better.', 'Good', '34/36', 'Concentrate. Too playful.', 'Save'),
(981, '', 40, '2014-05-01 13:29:28', '0000-00-00 00:00:00', '79', 'Final Exam (100 marks)', '2014-15', '41', '82', '59', '39', '37', '78', 'Well done.', 'Can do better.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(982, '', 40, '2014-05-01 01:32:12', '2014-05-04 18:44:37', '80', 'Final Exam (100 marks)', '2013-14', '26', '52', '89', '61', '30', '55', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(983, '', 40, '2014-05-01 10:32:02', '0000-00-00 00:00:00', '80', 'Final Exam (100 marks)', '2014-15', '34', '89', '28', '58', '27', '98', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Need to work hard.', 'Save'),
(984, '', 40, '2014-05-01 18:21:55', '2014-05-04 18:44:37', '81', 'Final Exam (100 marks)', '2013-14', '30', '97', '33', '48', '76', '29', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(985, '', 40, '2014-05-02 18:30:47', '2014-05-04 18:44:37', '81', 'Final Exam (100 marks)', '2014-15', '57', '43', '36', '94', '69', '80', 'Can do better.', 'Well done.', 'Good', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(986, '', 40, '2014-04-30 05:58:16', '2014-05-04 18:44:37', '82', 'Final Exam (100 marks)', '2013-14', '30', '88', '83', '84', '67', '31', 'Well done.', 'Can do better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(987, '', 40, '2014-04-30 14:56:29', '2014-05-04 18:44:37', '82', 'Final Exam (100 marks)', '2014-15', '79', '49', '', '92', '50', '26', 'Well done.', 'Well done.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(988, '', 40, '2014-05-02 16:19:50', '2014-05-04 18:44:37', '83', 'Final Exam (100 marks)', '2013-14', '70', '40', '47', '32', '', '37', 'Well done.', 'Can do better.', 'Good', '27/36', 'Can do better.', 'Save'),
(989, '', 40, '2014-05-01 20:33:47', '2014-05-04 18:44:37', '83', 'Final Exam (100 marks)', '2014-15', '60', '30', '60', '38', '99', '54', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '26/36', 'Good job in English and Kannada.', 'Save'),
(990, '', 40, '2014-04-30 19:32:36', '2014-05-04 18:44:37', '84', 'Final Exam (100 marks)', '2013-14', '', '84', '73', '54', '67', '99', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(991, '', 40, '2014-05-02 16:36:24', '2014-05-04 18:44:37', '84', 'Final Exam (100 marks)', '2014-15', '96', '74', '73', '91', '25', '77', 'Can do better.', 'Can do better.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(992, '', 40, '2014-04-29 20:58:45', '2014-05-04 18:44:37', '85', 'Final Exam (100 marks)', '2013-14', '64', '80', '99', '64', '91', '70', 'Can do better.', 'Well done.', 'Good', '36/36', 'Can do better.', 'Save'),
(993, '', 40, '2014-05-02 01:46:35', '0000-00-00 00:00:00', '85', 'Final Exam (100 marks)', '2014-15', '41', '77', '91', '82', '88', '65', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(994, '', 40, '2014-05-01 01:52:38', '2014-05-04 18:44:37', '86', 'Final Exam (100 marks)', '2014-15', '89', '', '90', '29', '62', '89', 'Well done.', 'Well done.', 'Needs to improve', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(995, '', 40, '2014-04-29 17:02:42', '2014-05-04 18:44:37', '87', 'Final Exam (100 marks)', '2013-14', '92', '42', '95', '69', '94', '63', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Good job in English and Kannada.', 'Save'),
(996, '', 40, '2014-05-01 05:30:22', '2014-05-04 18:44:37', '87', 'Final Exam (100 marks)', '2014-15', '52', '27', '82', '48', '28', '63', 'Well done.', 'Can do better.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(997, '', 40, '2014-04-30 21:11:37', '2014-05-04 18:44:37', '88', 'Final Exam (100 marks)', '2013-14', '81', '26', '53', '54', '75', '81', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '32/36', 'Good work.', 'Save'),
(998, '', 40, '2014-04-29 07:11:59', '2014-05-04 18:44:37', '88', 'Final Exam (100 marks)', '2014-15', '60', '45', '83', '37', '31', '79', 'Can do better.', 'Well done.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(999, '', 40, '2014-05-01 09:51:15', '0000-00-00 00:00:00', '89', 'Final Exam (100 marks)', '2014-15', '92', '83', '80', '28', '', '57', 'Well done.', 'Well done.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(1000, '', 40, '2014-05-04 05:01:43', '2014-05-04 18:44:37', '90', 'Final Exam (100 marks)', '2014-15', '65', '72', '56', '28', '93', '74', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(1001, '', 40, '2014-05-03 15:17:56', '2014-05-04 18:44:37', '91', 'Final Exam (100 marks)', '2013-14', '67', '86', '98', '33', '39', '34', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Good work.', 'Save'),
(1002, '', 40, '2014-04-30 15:01:11', '2014-05-04 18:44:37', '92', 'Final Exam (100 marks)', '2013-14', '40', '63', '83', '73', '31', '67', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1003, '', 40, '2014-05-03 18:42:48', '2014-05-04 18:44:37', '92', 'Final Exam (100 marks)', '2014-15', '91', '87', '27', '', '56', '', 'Well done.', 'Well done.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1004, '', 40, '2014-05-03 14:52:30', '2014-05-04 18:44:37', '93', 'Final Exam (100 marks)', '2013-14', '41', '73', '89', '67', '76', '75', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1005, '', 40, '2014-05-02 03:05:10', '2014-05-04 18:44:37', '94', 'Final Exam (100 marks)', '2013-14', '33', '85', '34', '46', '28', '79', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1006, '', 40, '2014-04-29 23:12:00', '0000-00-00 00:00:00', '94', 'Final Exam (100 marks)', '2014-15', '', '84', '56', '82', '35', '35', 'Can do better.', 'Can do better.', 'Excellent', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1007, '', 40, '2014-05-01 08:13:12', '0000-00-00 00:00:00', '95', 'Final Exam (100 marks)', '2013-14', '61', '41', '81', '98', '99', '89', 'Can do better.', 'Well done.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(1008, '', 40, '2014-05-03 11:35:26', '2014-05-04 18:44:37', '95', 'Final Exam (100 marks)', '2014-15', '92', '73', '43', '30', '35', '94', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Good job in English and Kannada.', 'Save'),
(1009, '', 40, '2014-04-30 18:44:41', '2014-05-04 18:44:37', '96', 'Final Exam (100 marks)', '2013-14', '69', '26', '65', '', '42', '36', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(1010, '', 40, '2014-05-01 23:58:31', '0000-00-00 00:00:00', '96', 'Final Exam (100 marks)', '2014-15', '66', '78', '43', '31', '99', '62', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Need to work hard.', 'Save'),
(1011, '', 40, '2014-04-29 00:34:26', '2014-05-04 18:44:37', '97', 'Final Exam (100 marks)', '2013-14', '54', '57', '26', '47', '66', '54', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Concentrate. Too playful.', 'Save'),
(1012, '', 40, '2014-05-01 08:47:49', '2014-05-04 18:44:37', '97', 'Final Exam (100 marks)', '2014-15', '58', '99', '67', '95', '35', '46', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(1013, '', 40, '2014-05-03 21:13:33', '2014-05-04 18:44:37', '98', 'Final Exam (100 marks)', '2013-14', '67', '48', '37', '52', '49', '28', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1014, '', 40, '2014-05-02 16:03:13', '2014-05-04 18:44:37', '100', 'Final Exam (100 marks)', '2013-14', '', '41', '29', '92', '52', '28', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '31/36', 'Concentrate. Too playful.', 'Save'),
(1015, '', 40, '2014-04-29 22:45:00', '2014-05-04 18:44:37', '100', 'Final Exam (100 marks)', '2014-15', '86', '87', '93', '88', '31', '49', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1016, '', 40, '2014-05-03 01:40:27', '2014-05-04 18:44:37', '101', 'Final Exam (100 marks)', '2013-14', '78', '42', '', '81', '74', '33', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Good job in English and Kannada.', 'Save'),
(1017, '', 40, '2014-04-29 13:35:33', '0000-00-00 00:00:00', '101', 'Final Exam (100 marks)', '2014-15', '28', '93', '63', '74', '66', '84', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(1018, '', 40, '2014-05-03 01:01:21', '2014-05-04 18:44:37', '102', 'Final Exam (100 marks)', '2013-14', '43', '51', '77', '27', '92', '51', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1019, '', 40, '2014-04-29 03:59:45', '2014-05-04 18:44:37', '102', 'Final Exam (100 marks)', '2014-15', '54', '62', '76', '87', '37', '90', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1020, '', 40, '2014-04-30 21:53:39', '0000-00-00 00:00:00', '103', 'Final Exam (100 marks)', '2013-14', '', '42', '88', '63', '', '40', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good job in English and Kannada.', 'Save'),
(1021, '', 40, '2014-05-01 08:11:44', '0000-00-00 00:00:00', '104', 'Final Exam (100 marks)', '2013-14', '90', '41', '35', '99', '81', '49', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1022, '', 40, '2014-04-30 11:13:28', '0000-00-00 00:00:00', '104', 'Final Exam (100 marks)', '2014-15', '73', '84', '57', '76', '92', '100', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1023, '', 40, '2014-05-01 21:52:19', '2014-05-04 18:44:37', '105', 'Final Exam (100 marks)', '2014-15', '29', '49', '64', '66', '49', '60', 'Well done.', 'Well done.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(1024, '', 40, '2014-04-30 06:22:34', '0000-00-00 00:00:00', '106', 'Final Exam (100 marks)', '2013-14', '83', '44', '88', '27', '37', '93', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1025, '', 40, '2014-05-03 10:28:34', '2014-05-04 18:44:37', '106', 'Final Exam (100 marks)', '2014-15', '71', '81', '72', '40', '52', '60', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Need to work hard.', 'Save'),
(1026, '', 40, '2014-05-02 13:57:20', '0000-00-00 00:00:00', '107', 'Final Exam (100 marks)', '2013-14', '28', '94', '60', '71', '72', '55', 'Well done.', 'Well done.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(1027, '', 40, '2014-04-30 13:43:20', '2014-05-04 18:44:37', '107', 'Final Exam (100 marks)', '2014-15', '90', '28', '87', '94', '55', '70', 'Can do better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1028, '', 40, '2014-05-03 12:09:26', '2014-05-04 18:44:37', '108', 'Final Exam (100 marks)', '2013-14', '88', '55', '95', '67', '95', '90', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1029, '', 40, '2014-05-04 05:31:40', '2014-05-04 18:44:37', '109', 'Final Exam (100 marks)', '2013-14', '37', '69', '83', '56', '89', '100', 'Can do better.', 'Well done.', 'Needs to improve', '33/36', 'Need to work hard.', 'Save'),
(1030, '', 40, '2014-05-04 00:45:34', '2014-05-04 18:44:37', '109', 'Final Exam (100 marks)', '2014-15', '73', '43', '86', '49', '100', '50', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(1031, '', 40, '2014-05-03 00:31:58', '2014-05-04 18:44:37', '110', 'Final Exam (100 marks)', '2013-14', '35', '94', '84', '95', '100', '79', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Good work.', 'Save'),
(1032, '', 40, '2014-05-03 23:22:09', '2014-05-04 18:44:37', '111', 'Final Exam (100 marks)', '2013-14', '67', '61', '27', '74', '61', '61', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1033, '', 40, '2014-04-30 20:59:46', '2014-05-04 18:44:37', '111', 'Final Exam (100 marks)', '2014-15', '98', '77', '27', '69', '40', '98', 'Can do better.', 'Well done.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(1034, '', 40, '2014-05-02 14:57:45', '2014-05-04 18:44:37', '112', 'Final Exam (100 marks)', '2013-14', '87', '98', '87', '', '90', '92', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1035, '', 40, '2014-04-29 12:52:26', '2014-05-04 18:44:37', '113', 'Final Exam (100 marks)', '2013-14', '36', '96', '41', '72', '53', '97', 'Well done.', 'Well done.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(1036, '', 40, '2014-04-30 18:38:50', '2014-05-04 18:44:37', '113', 'Final Exam (100 marks)', '2014-15', '77', '60', '78', '34', '74', '71', 'Well done.', 'Well done.', 'Good', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(1037, '', 40, '2014-04-29 23:20:48', '2014-05-04 18:44:37', '114', 'Final Exam (100 marks)', '2013-14', '82', '54', '65', '51', '90', '93', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Can do better.', 'Save'),
(1038, '', 40, '2014-05-03 17:13:26', '2014-05-04 18:44:37', '114', 'Final Exam (100 marks)', '2014-15', '62', '73', '92', '28', '', '29', 'Well done.', 'Can do better.', 'Needs to improve', '26/36', 'Need to work independently.', 'Save'),
(1039, '', 40, '2014-05-03 07:23:52', '2014-05-04 18:44:37', '115', 'Final Exam (100 marks)', '2013-14', '78', '80', '98', '47', '87', '90', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(1040, '', 40, '2014-05-01 19:31:22', '2014-05-04 18:44:37', '115', 'Final Exam (100 marks)', '2014-15', '83', '100', '95', '37', '73', '88', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Can do better.', 'Save'),
(1041, '', 40, '2014-05-03 05:11:12', '2014-05-04 18:44:37', '116', 'Final Exam (100 marks)', '2013-14', '37', '91', '86', '42', '69', '89', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1042, '', 40, '2014-05-03 06:18:35', '2014-05-04 18:44:37', '116', 'Final Exam (100 marks)', '2014-15', '82', '59', '59', '95', '41', '83', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(1043, '', 40, '2014-04-29 20:28:10', '2014-05-04 18:44:37', '117', 'Final Exam (100 marks)', '2013-14', '91', '84', '66', '83', '31', '41', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(1044, '', 40, '2014-04-30 22:32:08', '2014-05-04 18:44:37', '117', 'Final Exam (100 marks)', '2014-15', '89', '', '48', '30', '95', '96', 'Well done.', 'Can do better.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(1045, '', 40, '2014-05-01 09:29:14', '2014-05-04 18:44:37', '118', 'Final Exam (100 marks)', '2013-14', '68', '89', '69', '93', '95', '89', 'Well done.', 'Well done.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1046, '', 40, '2014-04-29 20:33:43', '0000-00-00 00:00:00', '118', 'Final Exam (100 marks)', '2014-15', '74', '66', '35', '67', '96', '38', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Need to work hard.', 'Save'),
(1047, '', 40, '2014-04-30 21:16:08', '2014-05-04 18:44:37', '119', 'Final Exam (100 marks)', '2013-14', '65', '85', '58', '55', '95', '39', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1048, '', 40, '2014-05-02 08:38:19', '2014-05-04 18:44:37', '119', 'Final Exam (100 marks)', '2014-15', '97', '68', '36', '33', '86', '75', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Concentrate. Too playful.', 'Save'),
(1049, '', 40, '2014-05-04 01:31:19', '2014-05-04 18:44:37', '120', 'Final Exam (100 marks)', '2014-15', '57', '51', '32', '27', '87', '64', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(1050, '', 40, '2014-05-02 21:59:17', '0000-00-00 00:00:00', '121', 'Final Exam (100 marks)', '2013-14', '27', '36', '62', '34', '44', '48', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1051, '', 40, '2014-05-03 18:51:27', '2014-05-04 18:44:37', '121', 'Final Exam (100 marks)', '2014-15', '87', '89', '53', '46', '', '79', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(1052, '', 40, '2014-05-01 04:59:20', '0000-00-00 00:00:00', '122', 'Final Exam (100 marks)', '2013-14', '55', '77', '99', '72', '54', '53', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work independently.', 'Save'),
(1053, '', 40, '2014-05-03 11:36:10', '0000-00-00 00:00:00', '122', 'Final Exam (100 marks)', '2014-15', '87', '29', '75', '79', '77', '44', 'Can do better.', 'Well done.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(1054, '', 40, '2014-04-30 09:26:53', '2014-05-04 18:44:37', '123', 'Final Exam (100 marks)', '2013-14', '31', '74', '85', '64', '90', '47', 'Can do better.', 'Well done.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1055, '', 40, '2014-05-01 14:55:51', '2014-05-04 18:44:37', '123', 'Final Exam (100 marks)', '2014-15', '67', '50', '33', '45', '52', '44', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1056, '', 40, '2014-05-03 10:09:01', '2014-05-04 18:44:37', '124', 'Final Exam (100 marks)', '2014-15', '62', '72', '', '92', '93', '40', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(1057, '', 40, '2014-05-03 18:39:52', '2014-05-04 18:44:37', '125', 'Final Exam (100 marks)', '2014-15', '', '82', '60', '51', '74', '55', 'Can do better.', 'Well done.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1058, '', 40, '2014-05-01 17:54:02', '2014-05-04 18:44:37', '126', 'Final Exam (100 marks)', '2013-14', '41', '97', '37', '29', '41', '73', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '32/36', 'Concentrate. Too playful.', 'Save'),
(1059, '', 40, '2014-05-02 06:58:59', '2014-05-04 18:44:37', '126', 'Final Exam (100 marks)', '2014-15', '66', '41', '94', '44', '79', '69', 'Can do better.', 'Can do better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(1060, '', 40, '2014-05-03 19:22:32', '2014-05-04 18:44:37', '127', 'Final Exam (100 marks)', '2013-14', '39', '70', '90', '99', '64', '34', 'Well done.', 'Well done.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(1061, '', 40, '2014-04-30 21:14:58', '2014-05-04 18:44:37', '127', 'Final Exam (100 marks)', '2014-15', '47', '82', '71', '68', '40', '59', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(1062, '', 40, '2014-05-03 04:47:42', '2014-05-04 18:44:37', '128', 'Final Exam (100 marks)', '2014-15', '58', '55', '30', '32', '40', '90', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Good job in English and Kannada.', 'Save'),
(1063, '', 40, '2014-05-03 21:23:56', '2014-05-04 18:44:37', '129', 'Final Exam (100 marks)', '2013-14', '25', '85', '65', '68', '26', '39', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '36/36', 'Good job in English and Kannada.', 'Save'),
(1064, '', 40, '2014-05-02 15:58:13', '0000-00-00 00:00:00', '129', 'Final Exam (100 marks)', '2014-15', '', '36', '63', '50', '98', '26', 'Can do better.', 'Well done.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1065, '', 40, '2014-04-29 05:58:36', '2014-05-04 18:44:37', '130', 'Final Exam (100 marks)', '2013-14', '66', '97', '95', '46', '31', '65', 'Can do better.', 'Well done.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(1066, '', 40, '2014-05-03 08:29:14', '2014-05-04 18:44:37', '130', 'Final Exam (100 marks)', '2014-15', '93', '80', '82', '53', '32', '46', 'Can do better.', 'Can do better.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1067, '', 40, '2014-04-30 11:31:00', '0000-00-00 00:00:00', '131', 'Final Exam (100 marks)', '2013-14', '99', '44', '63', '72', '55', '68', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(1068, '', 40, '2014-05-03 02:07:17', '2014-05-04 18:44:37', '131', 'Final Exam (100 marks)', '2014-15', '', '54', '36', '74', '', '70', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Good work.', 'Save'),
(1069, '', 40, '2014-05-02 00:49:58', '2014-05-04 18:44:37', '132', 'Final Exam (100 marks)', '2013-14', '28', '70', '89', '49', '49', '98', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Good job in English and Kannada.', 'Save'),
(1070, '', 40, '2014-05-02 19:50:00', '2014-05-04 18:44:37', '132', 'Final Exam (100 marks)', '2014-15', '29', '40', '35', '81', '27', '40', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1071, '', 40, '2014-04-29 20:56:06', '2014-05-04 18:44:37', '133', 'Final Exam (100 marks)', '2013-14', '45', '72', '61', '73', '74', '57', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Can do better.', 'Save'),
(1072, '', 40, '2014-04-29 23:51:36', '0000-00-00 00:00:00', '133', 'Final Exam (100 marks)', '2014-15', '56', '98', '71', '88', '71', '73', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Can do better.', 'Save'),
(1073, '', 40, '2014-04-29 05:46:26', '2014-05-04 18:44:37', '134', 'Final Exam (100 marks)', '2013-14', '99', '30', '84', '54', '27', '26', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1074, '', 40, '2014-05-03 18:48:20', '2014-05-04 18:44:37', '135', 'Final Exam (100 marks)', '2013-14', '46', '33', '36', '25', '90', '51', 'Well done.', 'Can do better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1075, '', 40, '2014-05-01 16:42:51', '2014-05-04 18:44:37', '135', 'Final Exam (100 marks)', '2014-15', '61', '31', '81', '74', '70', '29', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(1076, '', 40, '2014-05-03 13:32:10', '2014-05-04 18:44:37', '136', 'Final Exam (100 marks)', '2013-14', '80', '41', '40', '29', '68', '88', 'Well done.', 'Can do better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1077, '', 40, '2014-05-03 09:30:14', '0000-00-00 00:00:00', '136', 'Final Exam (100 marks)', '2014-15', '35', '83', '92', '71', '40', '27', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1078, '', 40, '2014-04-30 03:41:06', '2014-05-04 18:44:37', '137', 'Final Exam (100 marks)', '2013-14', '85', '25', '39', '40', '91', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(1079, '', 40, '2014-04-29 01:06:08', '2014-05-04 18:44:37', '137', 'Final Exam (100 marks)', '2014-15', '93', '90', '', '82', '69', '98', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1080, '', 40, '2014-05-03 06:07:41', '2014-05-04 18:44:37', '138', 'Final Exam (100 marks)', '2013-14', '81', '33', '41', '50', '61', '76', 'Can do better.', 'Can do better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1081, '', 40, '2014-04-29 19:33:37', '2014-05-04 18:44:37', '138', 'Final Exam (100 marks)', '2014-15', '86', '52', '68', '69', '47', '56', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Concentrate. Too playful.', 'Save'),
(1082, '', 40, '2014-05-01 19:58:06', '2014-05-04 18:44:37', '139', 'Final Exam (100 marks)', '2013-14', '36', '95', '30', '61', '62', '62', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need to work independently.', 'Save'),
(1083, '', 40, '2014-04-28 22:06:19', '2014-05-04 18:44:37', '139', 'Final Exam (100 marks)', '2014-15', '60', '63', '45', '67', '29', '69', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Good job in English and Kannada.', 'Save'),
(1084, '', 40, '2014-05-03 09:26:44', '2014-05-04 18:44:37', '140', 'Final Exam (100 marks)', '2013-14', '71', '57', '47', '86', '43', '81', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(1085, '', 40, '2014-05-02 19:53:12', '2014-05-04 18:44:37', '140', 'Final Exam (100 marks)', '2014-15', '87', '46', '40', '63', '27', '25', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(1086, '', 40, '2014-05-03 10:56:05', '2014-05-04 18:44:37', '141', 'Final Exam (100 marks)', '2013-14', '61', '83', '63', '54', '60', '33', 'Well done.', 'Well done.', 'Excellent', '36/36', 'Good work.', 'Save'),
(1087, '', 40, '2014-04-30 12:08:36', '2014-05-04 18:44:37', '141', 'Final Exam (100 marks)', '2014-15', '90', '84', '34', '39', '44', '85', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(1088, '', 40, '2014-05-02 03:59:46', '2014-05-04 18:44:37', '142', 'Final Exam (100 marks)', '2013-14', '86', '', '38', '51', '31', '38', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(1089, '', 40, '2014-04-29 10:58:13', '2014-05-04 18:44:37', '142', 'Final Exam (100 marks)', '2014-15', '34', '95', '26', '27', '26', '87', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1090, '', 40, '2014-04-30 22:58:49', '2014-05-04 18:44:37', '143', 'Final Exam (100 marks)', '2013-14', '88', '30', '62', '49', '89', '28', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(1091, '', 40, '2014-05-01 22:10:37', '0000-00-00 00:00:00', '143', 'Final Exam (100 marks)', '2014-15', '49', '64', '38', '56', '54', '72', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(1092, '', 40, '2014-04-30 05:42:50', '0000-00-00 00:00:00', '144', 'Final Exam (100 marks)', '2013-14', '57', '63', '51', '50', '37', '31', 'Well done.', 'Well done.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(1093, '', 40, '2014-05-03 18:51:25', '0000-00-00 00:00:00', '145', 'Final Exam (100 marks)', '2013-14', '64', '38', '', '73', '99', '54', 'Well done.', 'Well done.', 'Good', '30/36', 'Concentrate. Too playful.', 'Save'),
(1094, '', 40, '2014-05-03 01:33:44', '2014-05-04 18:44:37', '145', 'Final Exam (100 marks)', '2014-15', '56', '77', '91', '93', '73', '47', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(1095, '', 40, '2014-04-30 05:20:43', '2014-05-04 18:44:37', '146', 'Final Exam (100 marks)', '2013-14', '51', '62', '51', '41', '38', '82', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1096, '', 40, '2014-04-30 21:41:10', '2014-05-04 18:44:37', '146', 'Final Exam (100 marks)', '2014-15', '79', '64', '82', '83', '44', '77', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(1097, '', 40, '2014-05-02 11:53:24', '2014-05-04 18:44:37', '147', 'Final Exam (100 marks)', '2013-14', '', '91', '80', '92', '57', '43', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1098, '', 40, '2014-04-30 22:09:26', '2014-05-04 18:44:37', '147', 'Final Exam (100 marks)', '2014-15', '31', '93', '', '56', '32', '69', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1099, '', 40, '2014-05-02 04:13:13', '2014-05-04 18:44:37', '148', 'Final Exam (100 marks)', '2013-14', '42', '71', '34', '89', '62', '88', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work hard.', 'Save'),
(1100, '', 40, '2014-05-01 19:15:32', '2014-05-04 18:44:37', '148', 'Final Exam (100 marks)', '2014-15', '55', '', '64', '32', '89', '74', 'Well done.', 'Well done.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(1101, '', 40, '2014-04-30 08:59:33', '2014-05-04 18:44:37', '149', 'Final Exam (100 marks)', '2013-14', '70', '40', '49', '57', '42', '51', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Good job in English and Kannada.', 'Save'),
(1102, '', 40, '2014-04-30 05:58:42', '2014-05-04 18:44:37', '149', 'Final Exam (100 marks)', '2014-15', '66', '51', '30', '87', '50', '86', 'Well done.', 'Well done.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(1103, '', 40, '2014-05-03 05:12:52', '2014-05-04 18:44:37', '150', 'Final Exam (100 marks)', '2013-14', '26', '26', '49', '29', '81', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work independently.', 'Save'),
(1104, '', 40, '2014-04-29 03:08:49', '2014-05-04 18:44:37', '151', 'Final Exam (100 marks)', '2013-14', '38', '55', '44', '66', '59', '48', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1105, '', 40, '2014-04-29 09:04:49', '0000-00-00 00:00:00', '151', 'Final Exam (100 marks)', '2014-15', '86', '64', '60', '95', '59', '64', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1106, '', 40, '2014-05-03 06:03:57', '2014-05-04 18:44:37', '152', 'Final Exam (100 marks)', '2013-14', '36', '82', '100', '33', '62', '89', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work independently.', 'Save'),
(1107, '', 40, '2014-04-29 23:11:29', '2014-05-04 18:44:37', '152', 'Final Exam (100 marks)', '2014-15', '63', '26', '', '', '32', '96', 'Well done.', 'Well done.', 'Good', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(1108, '', 40, '2014-04-30 00:55:33', '0000-00-00 00:00:00', '153', 'Final Exam (100 marks)', '2013-14', '50', '99', '91', '59', '56', '61', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(1109, '', 40, '2014-04-30 10:57:38', '0000-00-00 00:00:00', '153', 'Final Exam (100 marks)', '2014-15', '53', '94', '54', '26', '69', '53', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1110, '', 40, '2014-05-02 02:15:11', '2014-05-04 18:44:37', '154', 'Final Exam (100 marks)', '2013-14', '38', '54', '83', '43', '59', '62', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1111, '', 40, '2014-05-03 22:00:42', '2014-05-04 18:44:37', '154', 'Final Exam (100 marks)', '2014-15', '100', '77', '90', '95', '47', '', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Need to work independently.', 'Save'),
(1112, '', 40, '2014-05-02 21:48:03', '0000-00-00 00:00:00', '155', 'Final Exam (100 marks)', '2013-14', '95', '48', '68', '89', '47', '26', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(1113, '', 40, '2014-04-30 20:18:38', '2014-05-04 18:44:37', '155', 'Final Exam (100 marks)', '2014-15', '50', '31', '77', '85', '66', '85', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1114, '', 40, '2014-04-29 04:52:40', '2014-05-04 18:44:37', '156', 'Final Exam (100 marks)', '2013-14', '34', '57', '52', '100', '85', '26', 'Can do better.', 'Can do better.', 'Needs to improve', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1115, '', 40, '2014-05-03 05:21:51', '2014-05-04 18:44:37', '156', 'Final Exam (100 marks)', '2014-15', '27', '31', '25', '26', '30', '66', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Concentrate. Too playful.', 'Save'),
(1116, '', 40, '2014-05-02 01:16:48', '2014-05-04 18:44:37', '157', 'Final Exam (100 marks)', '2013-14', '66', '45', '33', '34', '80', '82', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Good job in English and Kannada.', 'Save'),
(1117, '', 40, '2014-04-29 19:17:06', '2014-05-04 18:44:37', '157', 'Final Exam (100 marks)', '2014-15', '30', '39', '72', '86', '34', '57', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Need to work independently.', 'Save'),
(1118, '', 40, '2014-05-03 12:34:17', '2014-05-04 18:44:37', '158', 'Final Exam (100 marks)', '2013-14', '93', '84', '39', '60', '76', '80', 'Well done.', 'Can do better.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(1119, '', 40, '2014-05-03 12:54:11', '2014-05-04 18:44:37', '158', 'Final Exam (100 marks)', '2014-15', '25', '99', '39', '29', '36', '95', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1120, '', 40, '2014-04-29 06:33:42', '0000-00-00 00:00:00', '159', 'Final Exam (100 marks)', '2013-14', '92', '27', '47', '33', '57', '96', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Need to work hard.', 'Save'),
(1121, '', 40, '2014-05-01 00:34:18', '2014-05-04 18:44:37', '159', 'Final Exam (100 marks)', '2014-15', '', '94', '26', '90', '85', '92', 'Can do better.', 'Can do better.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(1122, '', 40, '2014-05-02 04:52:21', '2014-05-04 18:44:37', '1', 'Midterm Exam (100 marks)', '2013-14', '55', '', '69', '95', '86', '31', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1123, '', 40, '2014-04-29 14:44:26', '2014-05-04 18:44:37', '1', 'Midterm Exam (100 marks)', '2014-15', '56', '93', '67', '70', '87', '82', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Concentrate. Too playful.', 'Save'),
(1124, '', 40, '2014-05-03 17:00:59', '2014-05-04 18:44:37', '2', 'Midterm Exam (100 marks)', '2013-14', '55', '79', '49', '60', '71', '', 'Can do better.', 'Can do better.', 'Excellent', '27/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1125, '', 40, '2014-05-01 02:06:24', '2014-05-04 18:44:37', '2', 'Midterm Exam (100 marks)', '2014-15', '25', '33', '84', '73', '86', '69', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1126, '', 40, '2014-05-02 18:54:29', '2014-05-04 18:44:37', '3', 'Midterm Exam (100 marks)', '2014-15', '92', '96', '35', '', '88', '51', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(1127, '', 40, '2014-05-02 08:04:05', '2014-05-04 18:44:37', '4', 'Midterm Exam (100 marks)', '2014-15', '46', '70', '66', '47', '71', '53', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1128, '', 40, '2014-05-02 20:49:10', '0000-00-00 00:00:00', '5', 'Midterm Exam (100 marks)', '2013-14', '82', '64', '71', '83', '', '55', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Concentrate. Too playful.', 'Save'),
(1129, '', 40, '2014-05-04 00:45:25', '2014-05-04 18:44:37', '5', 'Midterm Exam (100 marks)', '2014-15', '', '57', '94', '39', '96', '45', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(1130, '', 40, '2014-05-03 05:34:52', '2014-05-04 18:44:37', '6', 'Midterm Exam (100 marks)', '2013-14', '31', '32', '60', '79', '68', '30', 'Well done.', 'Well done.', 'Excellent', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1131, '', 40, '2014-05-02 03:26:25', '2014-05-04 18:44:37', '6', 'Midterm Exam (100 marks)', '2014-15', '59', '27', '79', '75', '53', '48', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(1132, '', 40, '2014-05-04 00:23:04', '2014-05-04 18:44:37', '7', 'Midterm Exam (100 marks)', '2013-14', '42', '', '62', '73', '70', '36', 'Well done.', 'Can do better.', 'Good', '29/36', 'Can do better.', 'Save'),
(1133, '', 40, '2014-04-29 14:47:28', '2014-05-04 18:44:37', '7', 'Midterm Exam (100 marks)', '2014-15', '28', '40', '40', '91', '92', '34', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1134, '', 40, '2014-04-29 10:27:06', '0000-00-00 00:00:00', '8', 'Midterm Exam (100 marks)', '2013-14', '46', '46', '74', '53', '73', '74', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(1135, '', 40, '2014-05-03 04:17:15', '2014-05-04 18:44:37', '8', 'Midterm Exam (100 marks)', '2014-15', '39', '', '35', '35', '55', '84', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Can do better.', 'Save'),
(1136, '', 40, '2014-04-29 10:11:14', '0000-00-00 00:00:00', '9', 'Midterm Exam (100 marks)', '2013-14', '75', '75', '65', '99', '89', '80', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(1137, '', 40, '2014-05-03 04:28:50', '2014-05-04 18:44:37', '9', 'Midterm Exam (100 marks)', '2014-15', '53', '56', '47', '99', '70', '42', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Good job in English and Kannada.', 'Save'),
(1138, '', 40, '2014-05-02 01:42:35', '2014-05-04 18:44:37', '10', 'Midterm Exam (100 marks)', '2013-14', '72', '62', '98', '76', '73', '42', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1139, '', 40, '2014-05-02 19:43:36', '2014-05-04 18:44:37', '10', 'Midterm Exam (100 marks)', '2014-15', '28', '66', '34', '77', '70', '59', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Good work.', 'Save'),
(1140, '', 40, '2014-05-02 22:02:19', '2014-05-04 18:44:37', '11', 'Midterm Exam (100 marks)', '2013-14', '36', '41', '58', '', '25', '81', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(1141, '', 40, '2014-05-01 03:08:46', '2014-05-04 18:44:37', '11', 'Midterm Exam (100 marks)', '2014-15', '68', '', '50', '94', '46', '30', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(1142, '', 40, '2014-05-02 18:14:16', '2014-05-04 18:44:37', '12', 'Midterm Exam (100 marks)', '2013-14', '36', '50', '73', '47', '81', '80', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(1143, '', 40, '2014-05-02 20:05:52', '2014-05-04 18:44:37', '12', 'Midterm Exam (100 marks)', '2014-15', '81', '81', '64', '66', '25', '87', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1144, '', 40, '2014-05-02 23:13:36', '2014-05-04 18:44:37', '13', 'Midterm Exam (100 marks)', '2013-14', '', '25', '71', '33', '46', '80', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(1145, '', 40, '2014-05-02 08:09:26', '2014-05-04 18:44:37', '13', 'Midterm Exam (100 marks)', '2014-15', '97', '88', '84', '88', '60', '76', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1146, '', 40, '2014-05-03 05:35:21', '2014-05-04 18:44:37', '14', 'Midterm Exam (100 marks)', '2013-14', '62', '76', '99', '27', '57', '37', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Can do better.', 'Save'),
(1147, '', 40, '2014-05-03 23:47:47', '2014-05-04 18:44:37', '14', 'Midterm Exam (100 marks)', '2014-15', '52', '59', '74', '34', '48', '58', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(1148, '', 40, '2014-05-02 09:31:04', '2014-05-04 18:44:37', '15', 'Midterm Exam (100 marks)', '2013-14', '84', '42', '56', '63', '67', '81', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1149, '', 40, '2014-04-29 19:10:06', '2014-05-04 18:44:37', '15', 'Midterm Exam (100 marks)', '2014-15', '67', '55', '68', '88', '35', '76', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1150, '', 40, '2014-05-04 05:44:17', '2014-05-04 18:44:37', '16', 'Midterm Exam (100 marks)', '2013-14', '63', '41', '56', '58', '74', '71', 'Well done.', 'Can do better.', 'Excellent', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1151, '', 40, '2014-04-30 14:45:45', '2014-05-04 18:44:37', '16', 'Midterm Exam (100 marks)', '2014-15', '77', '71', '35', '70', '38', '29', 'Well done.', 'Well done.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(1152, '', 40, '2014-05-01 19:15:10', '2014-05-04 18:44:37', '17', 'Midterm Exam (100 marks)', '2013-14', '92', '47', '90', '48', '92', '', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Can do better.', 'Save'),
(1153, '', 40, '2014-05-03 07:15:56', '2014-05-04 18:44:37', '18', 'Midterm Exam (100 marks)', '2013-14', '99', '26', '87', '', '64', '54', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Concentrate. Too playful.', 'Save'),
(1154, '', 40, '2014-05-03 16:58:47', '0000-00-00 00:00:00', '18', 'Midterm Exam (100 marks)', '2014-15', '26', '80', '95', '93', '38', '', 'Well done.', 'Well done.', 'Good', '29/36', 'Good work.', 'Save'),
(1155, '', 40, '2014-04-30 07:08:47', '2014-05-04 18:44:37', '19', 'Midterm Exam (100 marks)', '2013-14', '67', '70', '71', '38', '89', '68', 'Can do better.', 'Well done.', 'Needs to improve', '31/36', 'Need to work independently.', 'Save'),
(1156, '', 40, '2014-05-01 12:11:55', '2014-05-04 18:44:37', '19', 'Midterm Exam (100 marks)', '2014-15', '70', '93', '34', '96', '81', '43', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1157, '', 40, '2014-04-29 05:34:26', '0000-00-00 00:00:00', '20', 'Midterm Exam (100 marks)', '2014-15', '66', '58', '40', '32', '42', '82', 'Can do better.', 'Well done.', 'Needs to improve', '29/36', 'Good work.', 'Save'),
(1158, '', 40, '2014-04-30 15:13:01', '2014-05-04 18:44:37', '21', 'Midterm Exam (100 marks)', '2013-14', '43', '', '25', '96', '41', '45', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1159, '', 40, '2014-04-30 00:06:24', '0000-00-00 00:00:00', '21', 'Midterm Exam (100 marks)', '2014-15', '81', '79', '64', '34', '63', '88', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(1160, '', 40, '2014-05-02 17:19:40', '2014-05-04 18:44:37', '22', 'Midterm Exam (100 marks)', '2013-14', '68', '85', '69', '80', '43', '67', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(1161, '', 40, '2014-05-02 08:38:20', '2014-05-04 18:44:37', '22', 'Midterm Exam (100 marks)', '2014-15', '90', '', '43', '29', '77', '54', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1162, '', 40, '2014-04-29 18:50:34', '0000-00-00 00:00:00', '23', 'Midterm Exam (100 marks)', '2013-14', '67', '51', '64', '89', '49', '88', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(1163, '', 40, '2014-05-03 12:18:17', '2014-05-04 18:44:37', '23', 'Midterm Exam (100 marks)', '2014-15', '85', '26', '66', '68', '76', '76', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1164, '', 40, '2014-05-03 15:26:13', '2014-05-04 18:44:37', '24', 'Midterm Exam (100 marks)', '2013-14', '25', '41', '98', '42', '72', '89', 'Can do better.', 'Well done.', 'Excellent', '27/36', 'Need to work hard.', 'Save'),
(1165, '', 40, '2014-04-30 19:13:52', '2014-05-04 18:44:37', '25', 'Midterm Exam (100 marks)', '2013-14', '89', '89', '95', '', '90', '27', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1166, '', 40, '2014-05-01 22:18:02', '2014-05-04 18:44:37', '25', 'Midterm Exam (100 marks)', '2014-15', '70', '78', '61', '36', '36', '73', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(1167, '', 40, '2014-04-29 10:54:17', '0000-00-00 00:00:00', '26', 'Midterm Exam (100 marks)', '2014-15', '54', '74', '39', '41', '80', '27', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1168, '', 40, '2014-05-03 05:43:25', '0000-00-00 00:00:00', '27', 'Midterm Exam (100 marks)', '2013-14', '', '96', '56', '82', '39', '74', 'Can do better.', 'Can do better.', 'Needs to improve', '28/36', 'Concentrate. Too playful.', 'Save'),
(1169, '', 40, '2014-05-03 01:35:01', '0000-00-00 00:00:00', '27', 'Midterm Exam (100 marks)', '2014-15', '94', '84', '86', '48', '70', '55', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1170, '', 40, '2014-04-29 05:26:54', '2014-05-04 18:44:37', '28', 'Midterm Exam (100 marks)', '2013-14', '47', '97', '66', '45', '74', '33', 'Well done.', 'Well done.', 'Excellent', '27/36', 'Need to work independently.', 'Save'),
(1171, '', 40, '2014-05-03 10:24:27', '2014-05-04 18:44:37', '28', 'Midterm Exam (100 marks)', '2014-15', '34', '94', '', '', '69', '66', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Can do better.', 'Save'),
(1172, '', 40, '2014-05-03 11:48:46', '0000-00-00 00:00:00', '29', 'Midterm Exam (100 marks)', '2013-14', '61', '75', '34', '45', '31', '74', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1173, '', 40, '2014-04-30 12:40:25', '2014-05-04 18:44:37', '29', 'Midterm Exam (100 marks)', '2014-15', '36', '66', '83', '40', '64', '85', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1174, '', 40, '2014-05-01 14:43:59', '2014-05-04 18:44:37', '30', 'Midterm Exam (100 marks)', '2013-14', '59', '33', '25', '88', '48', '74', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Can do better.', 'Save'),
(1175, '', 40, '2014-05-01 17:39:59', '2014-05-04 18:44:37', '30', 'Midterm Exam (100 marks)', '2014-15', '47', '51', '32', '85', '34', '69', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(1176, '', 40, '2014-05-03 18:11:13', '2014-05-04 18:44:37', '31', 'Midterm Exam (100 marks)', '2013-14', '71', '58', '27', '82', '', '28', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Can do better.', 'Save'),
(1177, '', 40, '2014-05-02 11:46:25', '2014-05-04 18:44:37', '31', 'Midterm Exam (100 marks)', '2014-15', '37', '62', '66', '30', '46', '86', 'Well done.', 'Can do better.', 'Good', '34/36', 'Can do better.', 'Save'),
(1178, '', 40, '2014-04-29 18:26:35', '2014-05-04 18:44:37', '32', 'Midterm Exam (100 marks)', '2013-14', '67', '45', '79', '89', '43', '78', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(1179, '', 40, '2014-04-29 17:26:19', '2014-05-04 18:44:37', '32', 'Midterm Exam (100 marks)', '2014-15', '36', '32', '69', '47', '73', '33', 'Well done.', 'Well done.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(1180, '', 40, '2014-05-03 07:48:23', '2014-05-04 18:44:37', '33', 'Midterm Exam (100 marks)', '2014-15', '75', '66', '100', '86', '59', '75', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(1181, '', 40, '2014-04-29 16:08:29', '0000-00-00 00:00:00', '34', 'Midterm Exam (100 marks)', '2013-14', '49', '76', '46', '42', '50', '92', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(1182, '', 40, '2014-05-02 04:10:00', '2014-05-04 18:44:37', '34', 'Midterm Exam (100 marks)', '2014-15', '80', '37', '83', '63', '95', '85', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1183, '', 40, '2014-05-03 03:06:41', '2014-05-04 18:44:37', '35', 'Midterm Exam (100 marks)', '2013-14', '74', '90', '62', '42', '72', '88', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(1184, '', 40, '2014-04-30 15:45:02', '2014-05-04 18:44:37', '35', 'Midterm Exam (100 marks)', '2014-15', '30', '39', '100', '57', '50', '39', 'Well done.', 'Can do better.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(1185, '', 40, '2014-05-03 22:19:25', '2014-05-04 18:44:37', '36', 'Midterm Exam (100 marks)', '2013-14', '36', '41', '60', '26', '75', '62', 'Well done.', 'Can do better.', 'Needs to improve', '28/36', 'Can do better.', 'Save'),
(1186, '', 40, '2014-05-02 03:03:33', '2014-05-04 18:44:37', '36', 'Midterm Exam (100 marks)', '2014-15', '90', '72', '66', '78', '32', '65', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good work.', 'Save'),
(1187, '', 40, '2014-05-03 16:59:01', '2014-05-04 18:44:37', '37', 'Midterm Exam (100 marks)', '2013-14', '50', '90', '46', '87', '', '46', 'Well done.', 'Well done.', 'Good', '34/36', 'Good job in English and Kannada.', 'Save'),
(1188, '', 40, '2014-05-02 01:50:26', '2014-05-04 18:44:37', '37', 'Midterm Exam (100 marks)', '2014-15', '96', '96', '61', '31', '68', '99', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1189, '', 40, '2014-05-01 11:54:21', '2014-05-04 18:44:37', '38', 'Midterm Exam (100 marks)', '2013-14', '94', '65', '91', '91', '100', '31', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(1190, '', 40, '2014-04-28 21:28:23', '2014-05-04 18:44:37', '38', 'Midterm Exam (100 marks)', '2014-15', '94', '62', '96', '60', '94', '57', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1191, '', 40, '2014-04-29 11:40:02', '2014-05-04 18:44:37', '39', 'Midterm Exam (100 marks)', '2013-14', '51', '57', '66', '73', '82', '61', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good job in English and Kannada.', 'Save'),
(1192, '', 40, '2014-04-29 09:53:06', '0000-00-00 00:00:00', '39', 'Midterm Exam (100 marks)', '2014-15', '51', '', '36', '60', '72', '65', 'Can do better.', 'Can do better.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(1193, '', 40, '2014-05-04 00:08:44', '2014-05-04 18:44:37', '41', 'Midterm Exam (100 marks)', '2013-14', '39', '79', '49', '50', '', '73', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '30/36', 'Need to work independently.', 'Save'),
(1194, '', 40, '2014-04-28 22:43:08', '2014-05-04 18:44:37', '41', 'Midterm Exam (100 marks)', '2014-15', '', '28', '30', '', '90', '31', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Can do better.', 'Save'),
(1195, '', 40, '2014-04-29 15:21:02', '0000-00-00 00:00:00', '42', 'Midterm Exam (100 marks)', '2013-14', '76', '71', '31', '58', '96', '94', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Good job in English and Kannada.', 'Save'),
(1196, '', 40, '2014-04-29 07:36:58', '2014-05-04 18:44:37', '42', 'Midterm Exam (100 marks)', '2014-15', '92', '100', '94', '77', '52', '26', 'Well done.', 'Well done.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1197, '', 40, '2014-04-28 22:33:03', '0000-00-00 00:00:00', '43', 'Midterm Exam (100 marks)', '2014-15', '52', '42', '54', '37', '', '43', 'Can do better.', 'Well done.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(1198, '', 40, '2014-04-29 11:17:53', '0000-00-00 00:00:00', '45', 'Midterm Exam (100 marks)', '2013-14', '45', '66', '27', '68', '80', '68', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1199, '', 40, '2014-04-29 23:49:53', '2014-05-04 18:44:37', '45', 'Midterm Exam (100 marks)', '2014-15', '68', '66', '58', '', '89', '88', 'Can do better.', 'Well done.', 'Excellent', '30/36', 'Can do better.', 'Save'),
(1200, '', 40, '2014-05-01 13:52:45', '2014-05-04 18:44:37', '46', 'Midterm Exam (100 marks)', '2013-14', '62', '85', '54', '66', '75', '50', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(1201, '', 40, '2014-04-30 01:19:47', '2014-05-04 18:44:37', '46', 'Midterm Exam (100 marks)', '2014-15', '86', '33', '', '28', '49', '28', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good work.', 'Save'),
(1202, '', 40, '2014-04-30 22:16:43', '2014-05-04 18:44:37', '47', 'Midterm Exam (100 marks)', '2013-14', '35', '91', '94', '91', '44', '78', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(1203, '', 40, '2014-05-01 05:01:15', '0000-00-00 00:00:00', '47', 'Midterm Exam (100 marks)', '2014-15', '34', '70', '79', '97', '30', '35', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Can do better.', 'Save'),
(1204, '', 40, '2014-04-30 12:18:45', '2014-05-04 18:44:37', '48', 'Midterm Exam (100 marks)', '2013-14', '47', '64', '76', '62', '26', '40', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1205, '', 40, '2014-05-01 13:03:06', '2014-05-04 18:44:37', '48', 'Midterm Exam (100 marks)', '2014-15', '67', '100', '92', '63', '70', '91', 'Can do better.', 'Can do better.', 'Excellent', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1206, '', 40, '2014-05-01 08:24:17', '2014-05-04 18:44:37', '49', 'Midterm Exam (100 marks)', '2013-14', '36', '73', '88', '71', '65', '88', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1207, '', 40, '2014-05-03 13:57:05', '2014-05-04 18:44:37', '49', 'Midterm Exam (100 marks)', '2014-15', '80', '36', '', '', '26', '52', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '26/36', 'Need to work hard.', 'Save'),
(1208, '', 40, '2014-04-30 00:31:32', '2014-05-04 18:44:37', '50', 'Midterm Exam (100 marks)', '2014-15', '80', '55', '58', '', '', '88', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need to work hard.', 'Save'),
(1209, '', 40, '2014-04-29 09:43:53', '0000-00-00 00:00:00', '51', 'Midterm Exam (100 marks)', '2013-14', '56', '67', '36', '', '25', '41', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1210, '', 40, '2014-04-30 03:55:02', '0000-00-00 00:00:00', '51', 'Midterm Exam (100 marks)', '2014-15', '34', '96', '56', '82', '60', '68', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(1211, '', 40, '2014-05-03 17:44:55', '0000-00-00 00:00:00', '52', 'Midterm Exam (100 marks)', '2013-14', '46', '73', '48', '59', '59', '73', 'Well done.', 'Can do better.', 'Excellent', '32/36', 'Good job in English and Kannada.', 'Save'),
(1212, '', 40, '2014-04-29 07:31:50', '2014-05-04 18:44:37', '52', 'Midterm Exam (100 marks)', '2014-15', '51', '89', '36', '60', '67', '79', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1213, '', 40, '2014-05-02 23:55:22', '2014-05-04 18:44:37', '53', 'Midterm Exam (100 marks)', '2013-14', '71', '39', '26', '90', '54', '40', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(1214, '', 40, '2014-04-30 09:41:28', '2014-05-04 18:44:37', '53', 'Midterm Exam (100 marks)', '2014-15', '73', '34', '34', '97', '47', '92', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Concentrate. Too playful.', 'Save'),
(1215, '', 40, '2014-04-29 14:15:43', '0000-00-00 00:00:00', '54', 'Midterm Exam (100 marks)', '2013-14', '93', '88', '38', '30', '50', '82', 'Can do better.', 'Well done.', 'Needs to improve', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1216, '', 40, '2014-05-01 21:50:11', '2014-05-04 18:44:37', '55', 'Midterm Exam (100 marks)', '2013-14', '81', '77', '65', '51', '64', '72', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1217, '', 40, '2014-05-02 23:12:56', '2014-05-04 18:44:37', '55', 'Midterm Exam (100 marks)', '2014-15', '87', '76', '60', '46', '58', '51', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(1218, '', 40, '2014-05-03 03:17:59', '2014-05-04 18:44:37', '56', 'Midterm Exam (100 marks)', '2013-14', '37', '46', '', '76', '48', '93', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Good job in English and Kannada.', 'Save'),
(1219, '', 40, '2014-05-03 14:56:50', '2014-05-04 18:44:37', '56', 'Midterm Exam (100 marks)', '2014-15', '40', '65', '43', '75', '43', '38', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Can do better.', 'Save'),
(1220, '', 40, '2014-04-30 03:23:37', '2014-05-04 18:44:37', '57', 'Midterm Exam (100 marks)', '2013-14', '70', '89', '31', '99', '56', '100', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(1221, '', 40, '2014-05-02 19:53:42', '0000-00-00 00:00:00', '57', 'Midterm Exam (100 marks)', '2014-15', '92', '90', '55', '93', '34', '42', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '31/36', 'Can do better.', 'Save'),
(1222, '', 40, '2014-05-01 19:01:58', '0000-00-00 00:00:00', '58', 'Midterm Exam (100 marks)', '2013-14', '82', '30', '63', '94', '46', '35', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1223, '', 40, '2014-05-03 03:30:15', '0000-00-00 00:00:00', '59', 'Midterm Exam (100 marks)', '2013-14', '56', '68', '68', '57', '96', '78', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1224, '', 40, '2014-05-03 22:46:22', '2014-05-04 18:44:37', '59', 'Midterm Exam (100 marks)', '2014-15', '49', '29', '76', '86', '48', '39', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1225, '', 40, '2014-05-01 04:31:07', '0000-00-00 00:00:00', '60', 'Midterm Exam (100 marks)', '2013-14', '86', '33', '33', '48', '84', '98', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1226, '', 40, '2014-05-01 23:18:26', '2014-05-04 18:44:37', '61', 'Midterm Exam (100 marks)', '2013-14', '80', '96', '48', '63', '51', '26', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1227, '', 40, '2014-05-03 20:52:19', '2014-05-04 18:44:37', '61', 'Midterm Exam (100 marks)', '2014-15', '25', '81', '60', '54', '70', '79', 'Can do better.', 'Can do better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(1228, '', 40, '2014-04-29 03:43:16', '2014-05-04 18:44:37', '62', 'Midterm Exam (100 marks)', '2013-14', '76', '83', '86', '56', '92', '54', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Need to work independently.', 'Save'),
(1229, '', 40, '2014-05-03 17:14:34', '2014-05-04 18:44:37', '62', 'Midterm Exam (100 marks)', '2014-15', '93', '27', '37', '45', '70', '95', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(1230, '', 40, '2014-04-30 02:54:51', '0000-00-00 00:00:00', '63', 'Midterm Exam (100 marks)', '2013-14', '72', '47', '63', '32', '56', '84', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1231, '', 40, '2014-04-29 11:44:09', '2014-05-04 18:44:37', '63', 'Midterm Exam (100 marks)', '2014-15', '51', '36', '45', '31', '76', '64', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(1232, '', 40, '2014-05-03 11:47:24', '2014-05-04 18:44:37', '64', 'Midterm Exam (100 marks)', '2013-14', '56', '67', '88', '25', '66', '48', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good job in English and Kannada.', 'Save'),
(1233, '', 40, '2014-04-29 00:40:57', '2014-05-04 18:44:37', '65', 'Midterm Exam (100 marks)', '2013-14', '42', '31', '', '63', '56', '', 'Can do better.', 'Can do better.', 'Good', '32/36', 'Can do better.', 'Save'),
(1234, '', 40, '2014-05-02 20:22:09', '2014-05-04 18:44:37', '65', 'Midterm Exam (100 marks)', '2014-15', '51', '52', '88', '97', '37', '64', 'Can do better.', 'Well done.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(1235, '', 40, '2014-05-03 11:49:11', '0000-00-00 00:00:00', '66', 'Midterm Exam (100 marks)', '2013-14', '68', '32', '', '90', '89', '44', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1236, '', 40, '2014-05-03 22:08:59', '2014-05-04 18:44:37', '66', 'Midterm Exam (100 marks)', '2014-15', '', '33', '32', '67', '70', '83', 'Can do better.', 'Well done.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(1237, '', 40, '2014-04-30 11:29:38', '2014-05-04 18:44:37', '67', 'Midterm Exam (100 marks)', '2013-14', '86', '74', '36', '44', '83', '45', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(1238, '', 40, '2014-05-01 05:55:44', '2014-05-04 18:44:37', '67', 'Midterm Exam (100 marks)', '2014-15', '88', '30', '48', '91', '55', '83', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Good work.', 'Save'),
(1239, '', 40, '2014-04-29 09:13:47', '2014-05-04 18:44:37', '68', 'Midterm Exam (100 marks)', '2013-14', '70', '49', '71', '74', '28', '86', 'Well done.', 'Well done.', 'Needs to improve', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1240, '', 40, '2014-05-03 18:44:51', '2014-05-04 18:44:37', '68', 'Midterm Exam (100 marks)', '2014-15', '31', '38', '29', '65', '42', '31', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1241, '', 40, '2014-04-30 06:38:53', '2014-05-04 18:44:37', '69', 'Midterm Exam (100 marks)', '2013-14', '88', '95', '95', '48', '85', '86', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1242, '', 40, '2014-04-30 21:29:29', '2014-05-04 18:44:37', '69', 'Midterm Exam (100 marks)', '2014-15', '35', '43', '42', '76', '75', '87', 'Can do better.', 'Well done.', 'Excellent', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(1243, '', 40, '2014-05-02 09:57:50', '0000-00-00 00:00:00', '70', 'Midterm Exam (100 marks)', '2013-14', '77', '48', '77', '81', '84', '92', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Need to work hard.', 'Save'),
(1244, '', 40, '2014-05-01 02:48:33', '2014-05-04 18:44:37', '70', 'Midterm Exam (100 marks)', '2014-15', '48', '61', '62', '60', '81', '68', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Can do better.', 'Save'),
(1245, '', 40, '2014-04-28 23:52:12', '2014-05-04 18:44:37', '71', 'Midterm Exam (100 marks)', '2013-14', '94', '30', '84', '48', '', '76', 'Well done.', 'Well done.', 'Excellent', '27/36', 'Good job in English and Kannada.', 'Save'),
(1246, '', 40, '2014-05-03 22:29:54', '2014-05-04 18:44:37', '71', 'Midterm Exam (100 marks)', '2014-15', '82', '98', '42', '38', '75', '51', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1247, '', 40, '2014-04-30 19:33:35', '2014-05-04 18:44:37', '72', 'Midterm Exam (100 marks)', '2013-14', '', '88', '41', '51', '44', '61', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1248, '', 40, '2014-05-02 09:43:42', '2014-05-04 18:44:37', '72', 'Midterm Exam (100 marks)', '2014-15', '52', '87', '70', '', '68', '51', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1249, '', 40, '2014-04-29 21:15:36', '2014-05-04 18:44:37', '73', 'Midterm Exam (100 marks)', '2013-14', '76', '', '53', '46', '35', '53', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '28/36', 'Can do better.', 'Save'),
(1250, '', 40, '2014-04-29 16:36:38', '2014-05-04 18:44:37', '73', 'Midterm Exam (100 marks)', '2014-15', '96', '58', '90', '94', '42', '37', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1251, '', 40, '2014-04-29 03:46:46', '2014-05-04 18:44:37', '74', 'Midterm Exam (100 marks)', '2013-14', '59', '48', '45', '56', '69', '93', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(1252, '', 40, '2014-05-02 20:26:12', '2014-05-04 18:44:37', '75', 'Midterm Exam (100 marks)', '2013-14', '93', '29', '75', '25', '41', '78', 'Can do better.', 'Well done.', 'Good', '31/36', 'Can do better.', 'Save'),
(1253, '', 40, '2014-05-02 03:41:27', '2014-05-04 18:44:37', '75', 'Midterm Exam (100 marks)', '2014-15', '80', '79', '53', '51', '82', '71', 'Well done.', 'Well done.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(1254, '', 40, '2014-04-29 02:36:24', '2014-05-04 18:44:37', '76', 'Midterm Exam (100 marks)', '2013-14', '68', '37', '26', '88', '77', '60', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1255, '', 40, '2014-05-03 00:57:42', '2014-05-04 18:44:37', '76', 'Midterm Exam (100 marks)', '2014-15', '28', '44', '80', '59', '63', '85', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Good job in English and Kannada.', 'Save'),
(1256, '', 40, '2014-05-02 19:14:07', '0000-00-00 00:00:00', '77', 'Midterm Exam (100 marks)', '2013-14', '43', '66', '99', '', '58', '26', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(1257, '', 40, '2014-04-29 02:27:58', '2014-05-04 18:44:37', '77', 'Midterm Exam (100 marks)', '2014-15', '83', '66', '60', '25', '99', '91', 'Well done.', 'Can do better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1258, '', 40, '2014-04-30 10:34:34', '2014-05-04 18:44:37', '78', 'Midterm Exam (100 marks)', '2013-14', '65', '81', '71', '57', '56', '68', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1259, '', 40, '2014-05-02 16:50:44', '0000-00-00 00:00:00', '78', 'Midterm Exam (100 marks)', '2014-15', '38', '60', '48', '90', '39', '32', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1260, '', 40, '2014-05-03 15:26:48', '2014-05-04 18:44:37', '79', 'Midterm Exam (100 marks)', '2013-14', '46', '75', '28', '52', '95', '79', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1261, '', 40, '2014-05-01 11:52:41', '2014-05-04 18:44:37', '79', 'Midterm Exam (100 marks)', '2014-15', '59', '91', '64', '69', '85', '25', 'Well done.', 'Well done.', 'Good', '29/36', 'Need to work independently.', 'Save'),
(1262, '', 40, '2014-04-30 11:53:18', '2014-05-04 18:44:37', '80', 'Midterm Exam (100 marks)', '2013-14', '92', '79', '66', '95', '81', '83', 'Can do better.', 'Well done.', 'Good', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(1263, '', 40, '2014-04-28 23:57:32', '2014-05-04 18:44:37', '80', 'Midterm Exam (100 marks)', '2014-15', '57', '82', '87', '52', '84', '55', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Good job in English and Kannada.', 'Save'),
(1264, '', 40, '2014-05-03 22:44:22', '2014-05-04 18:44:37', '81', 'Midterm Exam (100 marks)', '2013-14', '62', '46', '25', '52', '87', '44', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '32/36', 'Need to work hard.', 'Save'),
(1265, '', 40, '2014-05-02 17:36:48', '0000-00-00 00:00:00', '81', 'Midterm Exam (100 marks)', '2014-15', '68', '51', '83', '', '67', '41', 'Well done.', 'Can do better.', 'Good', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1266, '', 40, '2014-05-04 05:31:23', '2014-05-04 18:44:37', '82', 'Midterm Exam (100 marks)', '2013-14', '74', '72', '46', '50', '35', '56', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1267, '', 40, '2014-05-01 23:42:28', '2014-05-04 18:44:37', '82', 'Midterm Exam (100 marks)', '2014-15', '39', '46', '57', '49', '', '100', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1268, '', 40, '2014-05-01 15:27:46', '2014-05-04 18:44:37', '83', 'Midterm Exam (100 marks)', '2013-14', '54', '74', '38', '73', '87', '71', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1269, '', 40, '2014-04-30 18:26:12', '2014-05-04 18:44:37', '83', 'Midterm Exam (100 marks)', '2014-15', '74', '50', '70', '94', '33', '86', 'Can do better.', 'Can do better.', 'Needs to improve', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(1270, '', 40, '2014-05-03 07:16:27', '2014-05-04 18:44:37', '84', 'Midterm Exam (100 marks)', '2013-14', '53', '59', '', '54', '74', '65', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(1271, '', 40, '2014-05-02 22:28:39', '2014-05-04 18:44:37', '84', 'Midterm Exam (100 marks)', '2014-15', '83', '58', '74', '84', '45', '43', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '33/36', 'Can do better.', 'Save'),
(1272, '', 40, '2014-05-04 02:36:54', '2014-05-04 18:44:37', '85', 'Midterm Exam (100 marks)', '2013-14', '91', '82', '63', '42', '76', '69', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Concentrate. Too playful.', 'Save'),
(1273, '', 40, '2014-04-29 10:27:23', '2014-05-04 18:44:37', '85', 'Midterm Exam (100 marks)', '2014-15', '60', '89', '94', '36', '25', '25', 'Can do better.', 'Well done.', 'Good', '27/36', 'Good work.', 'Save'),
(1274, '', 40, '2014-05-02 23:05:15', '2014-05-04 18:44:37', '86', 'Midterm Exam (100 marks)', '2013-14', '60', '80', '66', '94', '38', '77', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard.', 'Save'),
(1275, '', 40, '2014-04-28 22:08:34', '2014-05-04 18:44:37', '86', 'Midterm Exam (100 marks)', '2014-15', '33', '50', '51', '29', '47', '58', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Concentrate. Too playful.', 'Save'),
(1276, '', 40, '2014-05-02 19:04:03', '2014-05-04 18:44:37', '87', 'Midterm Exam (100 marks)', '2013-14', '93', '63', '76', '28', '52', '33', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(1277, '', 40, '2014-04-29 07:33:11', '2014-05-04 18:44:37', '87', 'Midterm Exam (100 marks)', '2014-15', '43', '47', '52', '', '37', '75', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Need to work independently.', 'Save'),
(1278, '', 40, '2014-05-02 20:11:40', '2014-05-04 18:44:37', '88', 'Midterm Exam (100 marks)', '2013-14', '', '36', '88', '39', '92', '35', 'Well done.', 'Can do better.', 'Good', '32/36', 'Concentrate. Too playful.', 'Save'),
(1279, '', 40, '2014-05-01 07:59:22', '2014-05-04 18:44:37', '88', 'Midterm Exam (100 marks)', '2014-15', '63', '41', '62', '33', '38', '26', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(1280, '', 40, '2014-05-03 01:56:58', '2014-05-04 18:44:37', '89', 'Midterm Exam (100 marks)', '2013-14', '95', '93', '42', '39', '57', '75', 'Well done.', 'Can do better.', 'Needs to improve', '27/36', 'Good work.', 'Save'),
(1281, '', 40, '2014-04-30 16:05:48', '2014-05-04 18:44:37', '89', 'Midterm Exam (100 marks)', '2014-15', '38', '54', '99', '34', '', '56', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(1282, '', 40, '2014-04-28 23:23:03', '2014-05-04 18:44:37', '90', 'Midterm Exam (100 marks)', '2013-14', '74', '', '48', '85', '43', '64', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1283, '', 40, '2014-04-30 23:00:36', '2014-05-04 18:44:37', '90', 'Midterm Exam (100 marks)', '2014-15', '38', '49', '39', '', '63', '44', 'Well done.', 'Can do better.', 'Excellent', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1284, '', 40, '2014-05-02 16:02:29', '2014-05-04 18:44:37', '91', 'Midterm Exam (100 marks)', '2013-14', '47', '94', '44', '71', '60', '93', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(1285, '', 40, '2014-05-03 09:54:47', '2014-05-04 18:44:37', '91', 'Midterm Exam (100 marks)', '2014-15', '43', '48', '33', '79', '81', '84', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1286, '', 40, '2014-05-01 16:13:21', '2014-05-04 18:44:37', '92', 'Midterm Exam (100 marks)', '2013-14', '79', '73', '95', '50', '83', '35', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(1287, '', 40, '2014-05-01 15:02:15', '2014-05-04 18:44:37', '92', 'Midterm Exam (100 marks)', '2014-15', '69', '97', '92', '45', '100', '34', 'Well done.', 'Can do better.', 'Good', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1288, '', 40, '2014-05-01 00:30:25', '2014-05-04 18:44:37', '93', 'Midterm Exam (100 marks)', '2013-14', '30', '75', '43', '63', '93', '30', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Need to work independently.', 'Save'),
(1289, '', 40, '2014-05-02 00:03:05', '2014-05-04 18:44:37', '95', 'Midterm Exam (100 marks)', '2013-14', '86', '78', '95', '91', '92', '58', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work independently.', 'Save'),
(1290, '', 40, '2014-04-29 10:29:10', '0000-00-00 00:00:00', '95', 'Midterm Exam (100 marks)', '2014-15', '68', '38', '54', '91', '67', '70', 'Well done.', 'Well done.', 'Excellent', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1291, '', 40, '2014-05-01 12:14:12', '0000-00-00 00:00:00', '96', 'Midterm Exam (100 marks)', '2013-14', '91', '92', '', '35', '50', '91', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Need to work independently.', 'Save'),
(1292, '', 40, '2014-05-02 11:05:18', '2014-05-04 18:44:37', '96', 'Midterm Exam (100 marks)', '2014-15', '27', '33', '57', '68', '92', '97', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1293, '', 40, '2014-05-02 04:20:00', '2014-05-04 18:44:37', '97', 'Midterm Exam (100 marks)', '2013-14', '31', '92', '82', '88', '44', '91', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Need to work independently.', 'Save'),
(1294, '', 40, '2014-05-02 06:01:16', '2014-05-04 18:44:37', '98', 'Midterm Exam (100 marks)', '2013-14', '61', '36', '35', '73', '', '64', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1295, '', 40, '2014-05-01 10:23:13', '2014-05-04 18:44:37', '98', 'Midterm Exam (100 marks)', '2014-15', '81', '69', '46', '84', '100', '98', 'Well done.', 'Can do better.', 'Good', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1296, '', 40, '2014-05-04 02:49:23', '0000-00-00 00:00:00', '99', 'Midterm Exam (100 marks)', '2014-15', '97', '34', '68', '36', '100', '98', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1297, '', 40, '2014-05-01 03:12:04', '2014-05-04 18:44:37', '100', 'Midterm Exam (100 marks)', '2013-14', '84', '52', '34', '53', '', '95', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Good job in English and Kannada.', 'Save'),
(1298, '', 40, '2014-05-03 11:52:55', '0000-00-00 00:00:00', '100', 'Midterm Exam (100 marks)', '2014-15', '78', '31', '48', '63', '90', '90', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Concentrate. Too playful.', 'Save'),
(1299, '', 40, '2014-05-02 13:22:25', '0000-00-00 00:00:00', '101', 'Midterm Exam (100 marks)', '2013-14', '84', '45', '69', '49', '30', '83', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Good work.', 'Save'),
(1300, '', 40, '2014-04-30 13:35:37', '2014-05-04 18:44:37', '101', 'Midterm Exam (100 marks)', '2014-15', '57', '38', '35', '95', '39', '56', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1301, '', 40, '2014-04-29 08:13:54', '2014-05-04 18:44:37', '102', 'Midterm Exam (100 marks)', '2013-14', '78', '52', '56', '90', '46', '52', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Need to work independently.', 'Save'),
(1302, '', 40, '2014-04-30 14:00:31', '2014-05-04 18:44:37', '102', 'Midterm Exam (100 marks)', '2014-15', '57', '93', '84', '', '86', '43', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(1303, '', 40, '2014-05-01 01:06:57', '2014-05-04 18:44:37', '103', 'Midterm Exam (100 marks)', '2013-14', '60', '75', '71', '43', '64', '69', 'Well done.', 'Well done.', 'Good', '31/36', 'Can do better.', 'Save'),
(1304, '', 40, '2014-05-02 15:05:29', '2014-05-04 18:44:37', '103', 'Midterm Exam (100 marks)', '2014-15', '95', '68', '30', '100', '90', '53', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1305, '', 40, '2014-05-03 07:14:01', '2014-05-04 18:44:37', '104', 'Midterm Exam (100 marks)', '2013-14', '58', '78', '61', '90', '75', '96', 'Well done.', 'Well done.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1306, '', 40, '2014-04-30 22:12:21', '0000-00-00 00:00:00', '104', 'Midterm Exam (100 marks)', '2014-15', '88', '100', '48', '39', '45', '87', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1307, '', 40, '2014-04-30 20:17:46', '2014-05-04 18:44:37', '105', 'Midterm Exam (100 marks)', '2013-14', '89', '90', '92', '', '76', '78', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(1308, '', 40, '2014-05-03 12:52:57', '2014-05-04 18:44:37', '105', 'Midterm Exam (100 marks)', '2014-15', '50', '98', '42', '70', '30', '42', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Good work.', 'Save'),
(1309, '', 40, '2014-05-02 13:41:09', '2014-05-04 18:44:37', '106', 'Midterm Exam (100 marks)', '2013-14', '28', '', '81', '82', '69', '73', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1310, '', 40, '2014-04-28 22:24:17', '2014-05-04 18:44:37', '106', 'Midterm Exam (100 marks)', '2014-15', '26', '59', '', '29', '32', '40', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1311, '', 40, '2014-04-30 03:10:35', '0000-00-00 00:00:00', '107', 'Midterm Exam (100 marks)', '2013-14', '', '87', '60', '', '', '42', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(1312, '', 40, '2014-04-30 18:14:57', '2014-05-04 18:44:37', '107', 'Midterm Exam (100 marks)', '2014-15', '41', '99', '99', '68', '49', '32', 'Well done.', 'Can do better.', 'Good', '31/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1313, '', 40, '2014-04-30 03:48:43', '2014-05-04 18:44:37', '108', 'Midterm Exam (100 marks)', '2014-15', '31', '44', '41', '91', '80', '42', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Good job in English and Kannada.', 'Save'),
(1314, '', 40, '2014-05-03 18:50:38', '2014-05-04 18:44:37', '109', 'Midterm Exam (100 marks)', '2013-14', '59', '28', '72', '78', '62', '90', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Good job in English and Kannada.', 'Save'),
(1315, '', 40, '2014-04-30 01:11:18', '2014-05-04 18:44:37', '110', 'Midterm Exam (100 marks)', '2013-14', '65', '30', '83', '52', '64', '40', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Good job in English and Kannada.', 'Save'),
(1316, '', 40, '2014-05-02 18:17:30', '0000-00-00 00:00:00', '110', 'Midterm Exam (100 marks)', '2014-15', '54', '46', '92', '31', '67', '72', 'Can do better.', 'Well done.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1317, '', 40, '2014-05-02 08:30:44', '0000-00-00 00:00:00', '111', 'Midterm Exam (100 marks)', '2013-14', '51', '40', '76', '55', '59', '45', 'Well done.', 'Can do better.', 'Good', '27/36', 'Can do better.', 'Save'),
(1318, '', 40, '2014-05-01 15:41:21', '2014-05-04 18:44:37', '111', 'Midterm Exam (100 marks)', '2014-15', '99', '55', '41', '56', '77', '100', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Congratulations. Potential to do even better.', 'Save'),
(1319, '', 40, '2014-05-02 03:15:01', '2014-05-04 18:44:37', '112', 'Midterm Exam (100 marks)', '2014-15', '25', '49', '89', '86', '91', '38', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(1320, '', 40, '2014-05-02 22:34:31', '2014-05-04 18:44:37', '113', 'Midterm Exam (100 marks)', '2013-14', '67', '29', '54', '96', '72', '94', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1321, '', 40, '2014-05-01 05:00:47', '2014-05-04 18:44:37', '113', 'Midterm Exam (100 marks)', '2014-15', '32', '98', '60', '34', '75', '', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Concentrate. Too playful.', 'Save'),
(1322, '', 40, '2014-04-30 07:36:20', '2014-05-04 18:44:37', '114', 'Midterm Exam (100 marks)', '2013-14', '74', '31', '76', '84', '63', '52', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1323, '', 40, '2014-05-02 06:39:14', '2014-05-04 18:44:37', '114', 'Midterm Exam (100 marks)', '2014-15', '44', '87', '51', '71', '86', '70', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1324, '', 40, '2014-05-01 16:05:57', '0000-00-00 00:00:00', '116', 'Midterm Exam (100 marks)', '2013-14', '100', '92', '96', '87', '', '98', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(1325, '', 40, '2014-04-30 09:27:39', '2014-05-04 18:44:37', '116', 'Midterm Exam (100 marks)', '2014-15', '68', '49', '65', '71', '72', '92', 'Well done.', 'Well done.', 'Good', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1326, '', 40, '2014-04-30 10:52:16', '2014-05-04 18:44:37', '118', 'Midterm Exam (100 marks)', '2013-14', '65', '51', '100', '41', '34', '53', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1327, '', 40, '2014-05-01 03:42:35', '2014-05-04 18:44:37', '118', 'Midterm Exam (100 marks)', '2014-15', '39', '60', '30', '25', '87', '92', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Good job in English and Kannada.', 'Save'),
(1328, '', 40, '2014-05-04 03:16:50', '2014-05-04 18:44:37', '119', 'Midterm Exam (100 marks)', '2013-14', '78', '48', '98', '28', '', '34', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Good work.', 'Save'),
(1329, '', 40, '2014-04-29 00:20:31', '0000-00-00 00:00:00', '119', 'Midterm Exam (100 marks)', '2014-15', '99', '97', '28', '25', '65', '58', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '35/36', 'Need to work hard.', 'Save'),
(1330, '', 40, '2014-05-03 03:01:45', '2014-05-04 18:44:37', '120', 'Midterm Exam (100 marks)', '2013-14', '97', '61', '43', '55', '61', '72', 'Well done.', 'Well done.', 'Needs to improve', '33/36', 'Good work.', 'Save'),
(1331, '', 40, '2014-05-03 16:50:56', '2014-05-04 18:44:37', '120', 'Midterm Exam (100 marks)', '2014-15', '95', '55', '65', '38', '68', '44', 'Well done.', 'Can do better.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1332, '', 40, '2014-05-02 16:53:34', '0000-00-00 00:00:00', '121', 'Midterm Exam (100 marks)', '2013-14', '82', '74', '42', '93', '94', '66', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good job in English and Kannada.', 'Save'),
(1333, '', 40, '2014-05-02 17:59:01', '2014-05-04 18:44:37', '122', 'Midterm Exam (100 marks)', '2013-14', '35', '45', '33', '51', '55', '69', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(1334, '', 40, '2014-04-30 11:08:08', '2014-05-04 18:44:37', '122', 'Midterm Exam (100 marks)', '2014-15', '81', '47', '32', '83', '37', '97', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Good job in English and Kannada.', 'Save'),
(1335, '', 40, '2014-05-02 07:47:09', '2014-05-04 18:44:37', '123', 'Midterm Exam (100 marks)', '2013-14', '63', '33', '', '62', '89', '42', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1336, '', 40, '2014-04-30 03:40:27', '2014-05-04 18:44:37', '124', 'Midterm Exam (100 marks)', '2013-14', '78', '75', '59', '98', '34', '50', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1337, '', 40, '2014-05-03 16:03:14', '2014-05-04 18:44:37', '125', 'Midterm Exam (100 marks)', '2013-14', '33', '52', '64', '89', '61', '48', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Can do better.', 'Save'),
(1338, '', 40, '2014-05-03 06:55:38', '2014-05-04 18:44:37', '125', 'Midterm Exam (100 marks)', '2014-15', '58', '48', '65', '94', '87', '55', 'Well done.', 'Well done.', 'Needs to improve', '28/36', 'Need to work independently.', 'Save'),
(1339, '', 40, '2014-04-29 04:45:44', '2014-05-04 18:44:37', '126', 'Midterm Exam (100 marks)', '2013-14', '90', '58', '', '65', '56', '99', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '28/36', 'Need to work independently.', 'Save'),
(1340, '', 40, '2014-05-02 14:48:16', '2014-05-04 18:44:37', '126', 'Midterm Exam (100 marks)', '2014-15', '73', '89', '70', '46', '73', '50', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Can do better.', 'Save'),
(1341, '', 40, '2014-05-02 02:37:27', '2014-05-04 18:44:37', '127', 'Midterm Exam (100 marks)', '2013-14', '99', '60', '41', '67', '71', '31', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1342, '', 40, '2014-04-29 04:08:28', '2014-05-04 18:44:37', '128', 'Midterm Exam (100 marks)', '2013-14', '98', '78', '65', '72', '40', '35', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1343, '', 40, '2014-05-03 10:18:35', '2014-05-04 18:44:37', '129', 'Midterm Exam (100 marks)', '2013-14', '92', '25', '67', '', '49', '76', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need to work hard.', 'Save'),
(1344, '', 40, '2014-05-03 17:33:30', '2014-05-04 18:44:37', '129', 'Midterm Exam (100 marks)', '2014-15', '29', '89', '51', '82', '83', '86', 'Can do better.', 'Well done.', 'Excellent', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1345, '', 40, '2014-04-29 10:24:50', '0000-00-00 00:00:00', '130', 'Midterm Exam (100 marks)', '2013-14', '65', '58', '50', '79', '73', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1346, '', 40, '2014-05-04 01:38:05', '2014-05-04 18:44:37', '130', 'Midterm Exam (100 marks)', '2014-15', '71', '28', '41', '98', '67', '46', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Can do better.', 'Save'),
(1347, '', 40, '2014-05-02 08:26:30', '2014-05-04 18:44:37', '132', 'Midterm Exam (100 marks)', '2013-14', '50', '32', '99', '69', '29', '68', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1348, '', 40, '2014-05-03 10:49:35', '0000-00-00 00:00:00', '132', 'Midterm Exam (100 marks)', '2014-15', '28', '', '37', '88', '98', '32', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1349, '', 40, '2014-04-30 08:38:32', '0000-00-00 00:00:00', '133', 'Midterm Exam (100 marks)', '2013-14', '41', '33', '52', '74', '30', '62', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Concentrate. Too playful.', 'Save'),
(1350, '', 40, '2014-04-29 11:30:24', '2014-05-04 18:44:37', '133', 'Midterm Exam (100 marks)', '2014-15', '31', '66', '55', '', '31', '38', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1351, '', 40, '2014-05-01 16:22:39', '2014-05-04 18:44:37', '134', 'Midterm Exam (100 marks)', '2013-14', '80', '', '57', '31', '97', '29', 'Can do better.', 'Well done.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1352, '', 40, '2014-05-03 23:10:15', '2014-05-04 18:44:37', '135', 'Midterm Exam (100 marks)', '2013-14', '78', '51', '73', '76', '45', '48', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(1353, '', 40, '2014-04-30 14:07:43', '2014-05-04 18:44:37', '135', 'Midterm Exam (100 marks)', '2014-15', '84', '32', '41', '', '50', '51', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Good work.', 'Save'),
(1354, '', 40, '2014-05-02 20:10:03', '0000-00-00 00:00:00', '136', 'Midterm Exam (100 marks)', '2013-14', '43', '42', '99', '54', '31', '77', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Can do better.', 'Save'),
(1355, '', 40, '2014-05-03 03:28:22', '2014-05-04 18:44:37', '136', 'Midterm Exam (100 marks)', '2014-15', '', '69', '65', '82', '26', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1356, '', 40, '2014-05-03 16:12:31', '2014-05-04 18:44:37', '137', 'Midterm Exam (100 marks)', '2013-14', '28', '31', '69', '57', '80', '68', 'Can do better.', 'Well done.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(1357, '', 40, '2014-05-02 09:36:25', '2014-05-04 18:44:37', '137', 'Midterm Exam (100 marks)', '2014-15', '45', '57', '92', '64', '28', '45', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(1358, '', 40, '2014-05-04 02:17:10', '0000-00-00 00:00:00', '138', 'Midterm Exam (100 marks)', '2013-14', '61', '70', '41', '75', '80', '64', 'Well done.', 'Can do better.', 'Good', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1359, '', 40, '2014-05-03 03:22:01', '2014-05-04 18:44:37', '138', 'Midterm Exam (100 marks)', '2014-15', '55', '85', '83', '55', '36', '64', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good work.', 'Save'),
(1360, '', 40, '2014-05-04 05:05:25', '2014-05-04 18:44:37', '139', 'Midterm Exam (100 marks)', '2013-14', '37', '51', '58', '80', '68', '79', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '30/36', 'Good job in English and Kannada.', 'Save'),
(1361, '', 40, '2014-05-02 17:14:46', '2014-05-04 18:44:37', '139', 'Midterm Exam (100 marks)', '2014-15', '67', '41', '88', '', '', '46', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1362, '', 40, '2014-05-02 09:14:58', '2014-05-04 18:44:37', '140', 'Midterm Exam (100 marks)', '2013-14', '95', '31', '34', '68', '95', '42', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1363, '', 40, '2014-04-30 02:37:10', '2014-05-04 18:44:37', '140', 'Midterm Exam (100 marks)', '2014-15', '36', '49', '55', '75', '58', '75', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Concentrate. Too playful.', 'Save'),
(1364, '', 40, '2014-05-01 03:46:11', '2014-05-04 18:44:37', '141', 'Midterm Exam (100 marks)', '2014-15', '64', '', '50', '83', '83', '50', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1365, '', 40, '2014-04-29 21:54:11', '2014-05-04 18:44:37', '142', 'Midterm Exam (100 marks)', '2013-14', '53', '93', '66', '83', '44', '28', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1366, '', 40, '2014-04-30 18:34:34', '2014-05-04 18:44:37', '143', 'Midterm Exam (100 marks)', '2013-14', '55', '46', '31', '54', '76', '56', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Good job in English and Kannada.', 'Save'),
(1367, '', 40, '2014-05-01 09:09:04', '2014-05-04 18:44:37', '143', 'Midterm Exam (100 marks)', '2014-15', '77', '51', '81', '81', '46', '91', 'Well done.', 'Well done.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(1368, '', 40, '2014-05-01 18:26:09', '2014-05-04 18:44:37', '144', 'Midterm Exam (100 marks)', '2013-14', '36', '26', '78', '40', '87', '', 'Can do better.', 'Well done.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1369, '', 40, '2014-05-03 13:55:30', '2014-05-04 18:44:37', '144', 'Midterm Exam (100 marks)', '2014-15', '48', '29', '54', '99', '62', '55', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work hard in Hindi. All the best.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(1370, '', 40, '2014-04-30 07:57:32', '2014-05-04 18:44:37', '145', 'Midterm Exam (100 marks)', '2013-14', '62', '77', '79', '45', '94', '88', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Can do better.', 'Save'),
(1371, '', 40, '2014-04-29 01:44:01', '0000-00-00 00:00:00', '145', 'Midterm Exam (100 marks)', '2014-15', '81', '53', '65', '72', '35', '63', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1372, '', 40, '2014-04-29 01:55:23', '2014-05-04 18:44:37', '146', 'Midterm Exam (100 marks)', '2013-14', '91', '34', '25', '33', '61', '67', 'Can do better.', 'Well done.', 'Needs to improve', '28/36', 'Need to work hard.', 'Save'),
(1373, '', 40, '2014-04-30 03:14:47', '2014-05-04 18:44:37', '146', 'Midterm Exam (100 marks)', '2014-15', '36', '50', '52', '43', '60', '65', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1374, '', 40, '2014-05-03 22:31:04', '2014-05-04 18:44:37', '147', 'Midterm Exam (100 marks)', '2013-14', '', '26', '59', '51', '30', '31', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(1375, '', 40, '2014-05-03 00:43:37', '2014-05-04 18:44:37', '148', 'Midterm Exam (100 marks)', '2013-14', '61', '25', '90', '28', '51', '67', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(1376, '', 40, '2014-04-30 09:45:24', '2014-05-04 18:44:37', '148', 'Midterm Exam (100 marks)', '2014-15', '89', '37', '', '69', '88', '52', 'Well done.', 'Can do better.', 'Good', '32/36', 'Need to work independently.', 'Save'),
(1377, '', 40, '2014-05-01 00:10:16', '2014-05-04 18:44:37', '149', 'Midterm Exam (100 marks)', '2013-14', '60', '42', '56', '59', '81', '27', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Need to work hard.', 'Save'),
(1378, '', 40, '2014-05-02 06:41:04', '0000-00-00 00:00:00', '149', 'Midterm Exam (100 marks)', '2014-15', '80', '75', '45', '79', '59', '38', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Need to work hard.', 'Save'),
(1379, '', 40, '2014-05-01 16:53:16', '2014-05-04 18:44:37', '150', 'Midterm Exam (100 marks)', '2013-14', '99', '77', '', '76', '29', '25', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Can do better.', 'Save'),
(1380, '', 40, '2014-05-02 16:54:41', '2014-05-04 18:44:37', '150', 'Midterm Exam (100 marks)', '2014-15', '47', '77', '45', '27', '82', '68', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1381, '', 40, '2014-04-28 21:52:47', '2014-05-04 18:44:37', '151', 'Midterm Exam (100 marks)', '2014-15', '67', '81', '28', '71', '34', '60', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1382, '', 40, '2014-05-01 17:04:47', '2014-05-04 18:44:37', '152', 'Midterm Exam (100 marks)', '2013-14', '52', '26', '', '92', '53', '67', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Good job in English and Kannada.', 'Save'),
(1383, '', 40, '2014-04-30 12:50:56', '2014-05-04 18:44:37', '152', 'Midterm Exam (100 marks)', '2014-15', '65', '87', '83', '31', '82', '45', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(1384, '', 40, '2014-05-04 01:11:56', '2014-05-04 18:44:37', '153', 'Midterm Exam (100 marks)', '2013-14', '93', '51', '86', '44', '78', '61', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Can do better.', 'Save'),
(1385, '', 40, '2014-04-29 01:27:50', '0000-00-00 00:00:00', '154', 'Midterm Exam (100 marks)', '2013-14', '99', '41', '87', '98', '89', '92', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1386, '', 40, '2014-04-30 23:05:50', '2014-05-04 18:44:37', '154', 'Midterm Exam (100 marks)', '2014-15', '62', '77', '49', '45', '52', '69', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1387, '', 40, '2014-04-29 22:38:03', '0000-00-00 00:00:00', '155', 'Midterm Exam (100 marks)', '2013-14', '94', '57', '67', '82', '72', '77', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Can do better.', 'Save'),
(1388, '', 40, '2014-05-01 10:50:25', '0000-00-00 00:00:00', '155', 'Midterm Exam (100 marks)', '2014-15', '32', '47', '88', '33', '90', '75', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(1389, '', 40, '2014-05-03 20:51:01', '2014-05-04 18:44:37', '156', 'Midterm Exam (100 marks)', '2013-14', '', '38', '59', '61', '35', '81', 'Can do better.', 'Well done.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1390, '', 40, '2014-04-29 08:51:10', '0000-00-00 00:00:00', '156', 'Midterm Exam (100 marks)', '2014-15', '87', '28', '88', '64', '55', '34', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Congratulations. Potential to do even better.', 'Save'),
(1391, '', 40, '2014-05-02 12:00:23', '2014-05-04 18:44:37', '157', 'Midterm Exam (100 marks)', '2013-14', '', '64', '', '59', '78', '84', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1392, '', 40, '2014-05-01 01:17:13', '2014-05-04 18:44:37', '157', 'Midterm Exam (100 marks)', '2014-15', '36', '47', '37', '34', '27', '65', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1393, '', 40, '2014-05-04 05:18:19', '2014-05-04 18:44:37', '158', 'Midterm Exam (100 marks)', '2013-14', '65', '80', '32', '66', '37', '68', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Can do better.', 'Save'),
(1394, '', 40, '2014-04-30 08:45:26', '2014-05-04 18:44:37', '158', 'Midterm Exam (100 marks)', '2014-15', '42', '99', '59', '63', '97', '82', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1395, '', 40, '2014-04-30 12:31:02', '2014-05-04 18:44:37', '159', 'Midterm Exam (100 marks)', '2013-14', '68', '59', '87', '86', '55', '69', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1396, '', 40, '2014-05-03 06:15:06', '2014-05-04 18:44:37', '159', 'Midterm Exam (100 marks)', '2014-15', '86', '40', '58', '44', '76', '83', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Concentrate. Too playful.', 'Save'),
(1397, '', 40, '2014-04-30 00:46:01', '2014-05-04 18:44:37', '1', 'Test 2 (25 marks)', '2014-15', '21', '25', '18', '18', '16', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(1398, '', 40, '2014-05-02 00:54:07', '0000-00-00 00:00:00', '2', 'Test 2 (25 marks)', '2013-14', '13', '12', '21', '', '19', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Need to work independently.', 'Save'),
(1399, '', 40, '2014-05-02 00:26:29', '2014-05-04 18:44:37', '2', 'Test 2 (25 marks)', '2014-15', '21', '21', '16', '16', '17', '21', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work hard.', 'Save'),
(1400, '', 40, '2014-05-03 22:46:01', '0000-00-00 00:00:00', '3', 'Test 2 (25 marks)', '2013-14', '18', '19', '16', '11', '8', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Need to work independently.', 'Save'),
(1401, '', 40, '2014-05-02 19:35:29', '2014-05-04 18:44:37', '3', 'Test 2 (25 marks)', '2014-15', '7', '14', '13', '24', '15', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '26/36', 'Good job in English and Kannada.', 'Save'),
(1402, '', 40, '2014-05-01 23:19:30', '2014-05-04 18:44:37', '4', 'Test 2 (25 marks)', '2013-14', '9', '18', '', '14', '16', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '26/36', 'Can do better.', 'Save'),
(1403, '', 40, '2014-05-01 21:39:38', '2014-05-04 18:44:37', '4', 'Test 2 (25 marks)', '2014-15', '13', '23', '15', '16', '11', '13', 'Can do better.', 'Well done.', 'Needs to improve', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1404, '', 40, '2014-04-28 21:55:32', '0000-00-00 00:00:00', '5', 'Test 2 (25 marks)', '2013-14', '22', '8', '6', '8', '', '7', 'Well done.', 'Can do better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1405, '', 40, '2014-05-03 03:32:01', '2014-05-04 18:44:37', '5', 'Test 2 (25 marks)', '2014-15', '22', '21', '17', '18', '22', '6', 'Can do better.', 'Well done.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1406, '', 40, '2014-04-30 17:10:24', '0000-00-00 00:00:00', '6', 'Test 2 (25 marks)', '2013-14', '22', '15', '17', '20', '10', '19', 'Can do better.', 'Well done.', 'Good', '28/36', 'Need to work hard.', 'Save'),
(1407, '', 40, '2014-04-29 02:01:23', '2014-05-04 18:44:37', '6', 'Test 2 (25 marks)', '2014-15', '23', '', '6', '', '15', '11', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1408, '', 40, '2014-05-02 04:09:11', '2014-05-04 18:44:37', '7', 'Test 2 (25 marks)', '2013-14', '10', '16', '14', '14', '7', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Good job in English and Kannada.', 'Save'),
(1409, '', 40, '2014-05-03 08:46:36', '2014-05-04 18:44:37', '7', 'Test 2 (25 marks)', '2014-15', '24', '6', '21', '13', '14', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1410, '', 40, '2014-05-03 20:13:56', '2014-05-04 18:44:37', '8', 'Test 2 (25 marks)', '2013-14', '24', '24', '17', '24', '16', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Good work.', 'Save'),
(1411, '', 40, '2014-04-29 14:28:52', '2014-05-04 18:44:37', '8', 'Test 2 (25 marks)', '2014-15', '20', '13', '10', '', '19', '23', 'Can do better.', 'Well done.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1412, '', 40, '2014-05-01 04:59:52', '2014-05-04 18:44:37', '9', 'Test 2 (25 marks)', '2013-14', '12', '', '10', '19', '12', '14', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Can do better.', 'Save'),
(1413, '', 40, '2014-05-01 19:27:16', '2014-05-04 18:44:37', '10', 'Test 2 (25 marks)', '2013-14', '24', '8', '', '13', '19', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1414, '', 40, '2014-05-01 09:30:44', '0000-00-00 00:00:00', '10', 'Test 2 (25 marks)', '2014-15', '20', '13', '', '16', '6', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1415, '', 40, '2014-04-29 16:54:56', '0000-00-00 00:00:00', '11', 'Test 2 (25 marks)', '2013-14', '8', '21', '15', '11', '20', '7', 'Well done.', 'Well done.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(1416, '', 40, '2014-05-03 01:52:37', '2014-05-04 18:44:37', '11', 'Test 2 (25 marks)', '2014-15', '17', '14', '24', '20', '10', '14', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Good work.', 'Save'),
(1417, '', 40, '2014-05-01 09:30:32', '0000-00-00 00:00:00', '12', 'Test 2 (25 marks)', '2013-14', '15', '20', '15', '8', '8', '20', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(1418, '', 40, '2014-05-03 03:52:49', '2014-05-04 18:44:37', '12', 'Test 2 (25 marks)', '2014-15', '17', '21', '21', '21', '', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1419, '', 40, '2014-04-30 23:54:47', '2014-05-04 18:44:37', '13', 'Test 2 (25 marks)', '2013-14', '', '20', '9', '21', '14', '16', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Need to work independently.', 'Save'),
(1420, '', 40, '2014-04-30 19:07:35', '2014-05-04 18:44:37', '13', 'Test 2 (25 marks)', '2014-15', '12', '8', '8', '23', '24', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1421, '', 40, '2014-05-03 18:09:54', '2014-05-04 18:44:37', '14', 'Test 2 (25 marks)', '2013-14', '', '23', '15', '23', '9', '11', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(1422, '', 40, '2014-05-02 21:17:00', '2014-05-04 18:44:37', '14', 'Test 2 (25 marks)', '2014-15', '7', '8', '24', '13', '23', '19', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1423, '', 40, '2014-05-02 01:04:17', '2014-05-04 18:44:37', '15', 'Test 2 (25 marks)', '2013-14', '20', '22', '10', '12', '13', '17', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1424, '', 40, '2014-05-02 19:20:01', '2014-05-04 18:44:37', '15', 'Test 2 (25 marks)', '2014-15', '13', '7', '19', '12', '6', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '30/36', 'Need to work independently.', 'Save'),
(1425, '', 40, '2014-04-29 17:38:17', '2014-05-04 18:44:37', '16', 'Test 2 (25 marks)', '2013-14', '7', '13', '21', '16', '24', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(1426, '', 40, '2014-04-29 11:26:56', '2014-05-04 18:44:37', '16', 'Test 2 (25 marks)', '2014-15', '13', '20', '19', '17', '21', '14', 'Can do better.', 'Can do better.', 'Good', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1427, '', 40, '2014-04-30 20:25:37', '0000-00-00 00:00:00', '17', 'Test 2 (25 marks)', '2013-14', '21', '', '20', '13', '18', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '32/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1428, '', 40, '2014-04-29 18:27:06', '2014-05-04 18:44:37', '18', 'Test 2 (25 marks)', '2013-14', '7', '24', '24', '25', '17', '9', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1429, '', 40, '2014-05-01 20:56:30', '2014-05-04 18:44:37', '18', 'Test 2 (25 marks)', '2014-15', '7', '', '23', '20', '17', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1430, '', 40, '2014-04-29 19:12:57', '0000-00-00 00:00:00', '19', 'Test 2 (25 marks)', '2014-15', '10', '21', '17', '17', '6', '6', 'Well done.', 'Well done.', 'Good', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1431, '', 40, '2014-05-02 01:04:58', '2014-05-04 18:44:37', '21', 'Test 2 (25 marks)', '2013-14', '21', '15', '17', '13', '19', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Need to work hard.', 'Save'),
(1432, '', 40, '2014-04-30 08:37:08', '0000-00-00 00:00:00', '21', 'Test 2 (25 marks)', '2014-15', '18', '23', '10', '11', '18', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Well done. Concentrate on maths.', 'Save'),
(1433, '', 40, '2014-05-03 22:00:56', '2014-05-04 18:44:37', '22', 'Test 2 (25 marks)', '2013-14', '', '9', '8', '25', '22', '18', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1434, '', 40, '2014-04-30 00:31:03', '0000-00-00 00:00:00', '22', 'Test 2 (25 marks)', '2014-15', '11', '9', '16', '20', '6', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '26/36', 'Good work.', 'Save'),
(1435, '', 40, '2014-04-30 20:11:56', '2014-05-04 18:44:37', '23', 'Test 2 (25 marks)', '2013-14', '16', '6', '16', '18', '18', '18', 'Can do better.', 'Well done.', 'Needs to improve', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1436, '', 40, '2014-05-03 11:06:37', '2014-05-04 18:44:37', '23', 'Test 2 (25 marks)', '2014-15', '8', '7', '25', '16', '15', '23', 'Well done.', 'Can do better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(1437, '', 40, '2014-04-30 06:15:00', '2014-05-04 18:44:37', '24', 'Test 2 (25 marks)', '2013-14', '14', '6', '23', '18', '22', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Well done. Concentrate on maths.', 'Save'),
(1438, '', 40, '2014-05-02 17:10:21', '2014-05-04 18:44:37', '24', 'Test 2 (25 marks)', '2014-15', '13', '14', '16', '23', '', '14', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(1439, '', 40, '2014-05-01 03:38:03', '2014-05-04 18:44:37', '25', 'Test 2 (25 marks)', '2013-14', '11', '19', '16', '12', '21', '6', 'Well done.', 'Can do better.', 'Excellent', '30/36', 'Good work.', 'Save'),
(1440, '', 40, '2014-05-01 19:05:52', '2014-05-04 18:44:37', '25', 'Test 2 (25 marks)', '2014-15', '6', '9', '12', '7', '20', '19', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1441, '', 40, '2014-04-29 21:50:40', '2014-05-04 18:44:37', '26', 'Test 2 (25 marks)', '2013-14', '20', '18', '21', '11', '19', '25', 'Can do better.', 'Can do better.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(1442, '', 40, '2014-05-04 05:11:57', '2014-05-04 18:44:37', '27', 'Test 2 (25 marks)', '2013-14', '24', '22', '11', '10', '16', '21', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Need to work independently.', 'Save'),
(1443, '', 40, '2014-04-29 22:38:10', '2014-05-04 18:44:37', '27', 'Test 2 (25 marks)', '2014-15', '9', '23', '9', '16', '6', '24', 'Well done.', 'Can do better.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(1444, '', 40, '2014-05-01 00:16:02', '2014-05-04 18:44:37', '28', 'Test 2 (25 marks)', '2013-14', '20', '20', '17', '19', '18', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1445, '', 40, '2014-05-01 03:51:09', '0000-00-00 00:00:00', '28', 'Test 2 (25 marks)', '2014-15', '10', '11', '6', '21', '17', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1446, '', 40, '2014-04-30 11:31:57', '2014-05-04 18:44:37', '29', 'Test 2 (25 marks)', '2013-14', '8', '17', '13', '17', '11', '10', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Concentrate. Too playful.', 'Save'),
(1447, '', 40, '2014-04-30 14:32:41', '2014-05-04 18:44:37', '29', 'Test 2 (25 marks)', '2014-15', '6', '9', '', '22', '19', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Need to work hard.', 'Save'),
(1448, '', 40, '2014-05-04 02:43:21', '0000-00-00 00:00:00', '30', 'Test 2 (25 marks)', '2013-14', '15', '22', '8', '8', '9', '8', 'Can do better.', 'Can do better.', 'Good', '27/36', 'Need to work independently.', 'Save'),
(1449, '', 40, '2014-04-29 04:07:40', '2014-05-04 18:44:37', '30', 'Test 2 (25 marks)', '2014-15', '19', '16', '12', '11', '11', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1450, '', 40, '2014-05-04 00:17:51', '2014-05-04 18:44:37', '31', 'Test 2 (25 marks)', '2013-14', '9', '18', '8', '16', '19', '7', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '26/36', 'Need to work independently.', 'Save'),
(1451, '', 40, '2014-05-01 02:09:32', '2014-05-04 18:44:37', '31', 'Test 2 (25 marks)', '2014-15', '17', '19', '18', '19', '24', '10', 'Well done.', 'Can do better.', 'Excellent', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1452, '', 40, '2014-04-30 16:17:56', '0000-00-00 00:00:00', '32', 'Test 2 (25 marks)', '2013-14', '21', '12', '12', '20', '21', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '26/36', 'Good work.', 'Save'),
(1453, '', 40, '2014-05-01 12:46:51', '0000-00-00 00:00:00', '32', 'Test 2 (25 marks)', '2014-15', '9', '23', '16', '7', '18', '', 'Can do better.', 'Well done.', 'Excellent', '34/36', 'Need to work hard.', 'Save'),
(1454, '', 40, '2014-05-03 08:31:19', '2014-05-04 18:44:37', '33', 'Test 2 (25 marks)', '2013-14', '24', '20', '22', '20', '8', '9', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1455, '', 40, '2014-05-03 02:04:38', '2014-05-04 18:44:37', '33', 'Test 2 (25 marks)', '2014-15', '14', '16', '11', '9', '15', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Need to work independently.', 'Save'),
(1456, '', 40, '2014-04-30 18:15:48', '2014-05-04 18:44:37', '34', 'Test 2 (25 marks)', '2013-14', '14', '18', '13', '17', '14', '13', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '31/36', 'Concentrate. Too playful.', 'Save'),
(1457, '', 40, '2014-04-30 19:08:55', '2014-05-04 18:44:37', '34', 'Test 2 (25 marks)', '2014-15', '12', '9', '21', '20', '8', '16', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1458, '', 40, '2014-04-30 22:14:20', '0000-00-00 00:00:00', '35', 'Test 2 (25 marks)', '2013-14', '', '20', '18', '8', '19', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '30/36', 'Good work.', 'Save'),
(1459, '', 40, '2014-04-29 16:20:36', '0000-00-00 00:00:00', '35', 'Test 2 (25 marks)', '2014-15', '22', '15', '21', '12', '12', '17', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Concentrate. Too playful.', 'Save'),
(1460, '', 40, '2014-05-01 07:47:55', '2014-05-04 18:44:37', '36', 'Test 2 (25 marks)', '2013-14', '19', '19', '7', '14', '20', '13', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '31/36', 'Good work.', 'Save'),
(1461, '', 40, '2014-05-03 10:14:29', '0000-00-00 00:00:00', '36', 'Test 2 (25 marks)', '2014-15', '15', '21', '10', '7', '14', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1462, '', 40, '2014-05-01 18:27:36', '2014-05-04 18:44:37', '37', 'Test 2 (25 marks)', '2013-14', '19', '', '', '9', '23', '9', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(1463, '', 40, '2014-05-02 11:00:37', '2014-05-04 18:44:37', '37', 'Test 2 (25 marks)', '2014-15', '', '8', '15', '23', '18', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work independently.', 'Save'),
(1464, '', 40, '2014-05-02 10:40:30', '2014-05-04 18:44:37', '38', 'Test 2 (25 marks)', '2013-14', '21', '23', '20', '7', '9', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(1465, '', 40, '2014-04-30 06:14:52', '2014-05-04 18:44:37', '38', 'Test 2 (25 marks)', '2014-15', '18', '13', '17', '12', '12', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work independently.', 'Save'),
(1466, '', 40, '2014-05-02 15:17:23', '2014-05-04 18:44:37', '39', 'Test 2 (25 marks)', '2014-15', '15', '11', '19', '13', '14', '9', 'Well done.', 'Can do better.', 'Good', '34/36', 'Good job in English and Kannada.', 'Save'),
(1467, '', 40, '2014-04-30 16:09:55', '2014-05-04 18:44:37', '41', 'Test 2 (25 marks)', '2013-14', '6', '16', '25', '24', '15', '', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Concentrate. Too playful.', 'Save'),
(1468, '', 40, '2014-05-03 19:17:30', '0000-00-00 00:00:00', '42', 'Test 2 (25 marks)', '2013-14', '15', '21', '', '21', '17', '20', 'Well done.', 'Well done.', 'Good', '32/36', 'Good work.', 'Save'),
(1469, '', 40, '2014-05-03 11:54:55', '2014-05-04 18:44:37', '42', 'Test 2 (25 marks)', '2014-15', '13', '10', '23', '7', '7', '20', 'Well done.', 'Can do better.', 'Excellent', '32/36', 'Can do better.', 'Save'),
(1470, '', 40, '2014-05-01 13:12:18', '0000-00-00 00:00:00', '43', 'Test 2 (25 marks)', '2013-14', '10', '8', '16', '10', '20', '20', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '35/36', 'Need to work hard.', 'Save'),
(1471, '', 40, '2014-05-03 17:58:56', '0000-00-00 00:00:00', '43', 'Test 2 (25 marks)', '2014-15', '12', '23', '11', '25', '19', '6', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Need to work independently.', 'Save'),
(1472, '', 40, '2014-05-03 15:22:33', '2014-05-04 18:44:37', '44', 'Test 2 (25 marks)', '2013-14', '8', '19', '12', '7', '24', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(1473, '', 40, '2014-04-30 12:46:23', '2014-05-04 18:44:37', '44', 'Test 2 (25 marks)', '2014-15', '13', '17', '16', '16', '7', '23', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Can do better.', 'Save'),
(1474, '', 40, '2014-04-29 05:19:26', '2014-05-04 18:44:37', '45', 'Test 2 (25 marks)', '2013-14', '22', '12', '11', '23', '8', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '33/36', 'Concentrate. Too playful.', 'Save'),
(1475, '', 40, '2014-05-03 08:51:36', '2014-05-04 18:44:37', '45', 'Test 2 (25 marks)', '2014-15', '10', '17', '7', '18', '18', '11', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1476, '', 40, '2014-04-30 17:47:05', '2014-05-04 18:44:37', '46', 'Test 2 (25 marks)', '2013-14', '12', '20', '16', '18', '21', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1477, '', 40, '2014-05-01 08:25:23', '2014-05-04 18:44:37', '46', 'Test 2 (25 marks)', '2014-15', '16', '22', '12', '11', '25', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1478, '', 40, '2014-04-30 03:51:10', '0000-00-00 00:00:00', '47', 'Test 2 (25 marks)', '2013-14', '12', '8', '17', '9', '12', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Can do better.', 'Save'),
(1479, '', 40, '2014-05-03 02:50:18', '2014-05-04 18:44:37', '47', 'Test 2 (25 marks)', '2014-15', '7', '12', '8', '17', '6', '11', 'Can do better.', 'Well done.', 'Good', '26/36', 'Need to work independently.', 'Save'),
(1480, '', 40, '2014-05-03 03:42:42', '0000-00-00 00:00:00', '48', 'Test 2 (25 marks)', '2013-14', '11', '12', '24', '6', '19', '8', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '27/36', 'Can do better.', 'Save'),
(1481, '', 40, '2014-05-02 13:50:59', '2014-05-04 18:44:37', '48', 'Test 2 (25 marks)', '2014-15', '10', '23', '17', '18', '7', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Can do better.', 'Save'),
(1482, '', 40, '2014-05-02 09:38:26', '2014-05-04 18:44:37', '49', 'Test 2 (25 marks)', '2013-14', '22', '7', '12', '24', '7', '14', 'Can do better.', 'Well done.', 'Good', '28/36', 'Can do better.', 'Save'),
(1483, '', 40, '2014-04-29 11:58:08', '2014-05-04 18:44:37', '49', 'Test 2 (25 marks)', '2014-15', '12', '20', '16', '8', '', '7', 'Can do better.', 'Can do better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1484, '', 40, '2014-04-30 16:33:55', '2014-05-04 18:44:37', '50', 'Test 2 (25 marks)', '2013-14', '8', '7', '11', '14', '16', '10', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '27/36', 'Can do better.', 'Save'),
(1485, '', 40, '2014-05-02 06:48:12', '2014-05-04 18:44:37', '50', 'Test 2 (25 marks)', '2014-15', '', '24', '24', '19', '7', '6', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Good work.', 'Save'),
(1486, '', 40, '2014-04-29 09:46:20', '2014-05-04 18:44:37', '51', 'Test 2 (25 marks)', '2013-14', '7', '21', '24', '8', '15', '16', 'Well done.', 'Can do better.', 'Excellent', '35/36', 'Congratulations. Potential to do even better.', 'Save'),
(1487, '', 40, '2014-05-03 20:59:28', '2014-05-04 18:44:37', '51', 'Test 2 (25 marks)', '2014-15', '22', '9', '20', '16', '20', '14', 'Can do better.', 'Can do better.', 'Good', '29/36', 'Good work.', 'Save'),
(1488, '', 40, '2014-04-30 00:19:32', '2014-05-04 18:44:37', '53', 'Test 2 (25 marks)', '2013-14', '', '18', '14', '11', '19', '14', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Need to work hard.', 'Save'),
(1489, '', 40, '2014-05-01 10:26:27', '2014-05-04 18:44:37', '53', 'Test 2 (25 marks)', '2014-15', '23', '17', '10', '11', '23', '16', 'Well done.', 'Can do better.', 'Needs to improve', '34/36', 'Concentrate. Too playful.', 'Save'),
(1490, '', 40, '2014-05-01 19:31:43', '2014-05-04 18:44:37', '54', 'Test 2 (25 marks)', '2013-14', '6', '19', '6', '6', '8', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Need to work independently.', 'Save'),
(1491, '', 40, '2014-05-03 02:57:55', '0000-00-00 00:00:00', '54', 'Test 2 (25 marks)', '2014-15', '24', '8', '21', '', '', '18', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(1492, '', 40, '2014-05-01 05:04:55', '2014-05-04 18:44:37', '55', 'Test 2 (25 marks)', '2013-14', '17', '24', '', '10', '25', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1493, '', 40, '2014-04-29 03:08:50', '0000-00-00 00:00:00', '55', 'Test 2 (25 marks)', '2014-15', '8', '19', '23', '12', '19', '21', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Good work.', 'Save'),
(1494, '', 40, '2014-05-03 00:42:52', '2014-05-04 18:44:37', '56', 'Test 2 (25 marks)', '2013-14', '18', '17', '25', '20', '11', '9', 'Well done.', 'Can do better.', 'Excellent', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1495, '', 40, '2014-04-30 00:56:49', '2014-05-04 18:44:37', '56', 'Test 2 (25 marks)', '2014-15', '17', '14', '15', '17', '13', '', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Need to work hard.', 'Save'),
(1496, '', 40, '2014-05-01 03:59:49', '2014-05-04 18:44:37', '57', 'Test 2 (25 marks)', '2013-14', '', '', '24', '21', '19', '21', 'Well done.', 'Well done.', 'Needs to improve', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1497, '', 40, '2014-05-02 10:49:20', '2014-05-04 18:44:37', '57', 'Test 2 (25 marks)', '2014-15', '20', '19', '18', '23', '7', '7', 'Well done.', 'Can do better.', 'Needs to improve', '30/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1498, '', 40, '2014-05-02 22:36:33', '0000-00-00 00:00:00', '58', 'Test 2 (25 marks)', '2013-14', '9', '21', '17', '22', '23', '23', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(1499, '', 40, '2014-04-29 00:58:07', '2014-05-04 18:44:37', '58', 'Test 2 (25 marks)', '2014-15', '15', '14', '14', '9', '7', '21', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1500, '', 40, '2014-05-04 01:12:13', '2014-05-04 18:44:37', '59', 'Test 2 (25 marks)', '2013-14', '14', '16', '18', '15', '9', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Concentrate. Too playful.', 'Save'),
(1501, '', 40, '2014-05-03 23:19:01', '0000-00-00 00:00:00', '59', 'Test 2 (25 marks)', '2014-15', '18', '23', '8', '23', '16', '12', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1502, '', 40, '2014-04-30 22:31:38', '0000-00-00 00:00:00', '60', 'Test 2 (25 marks)', '2013-14', '6', '21', '14', '17', '24', '23', 'Can do better.', 'Well done.', 'Needs to improve', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1503, '', 40, '2014-05-03 07:24:27', '2014-05-04 18:44:37', '60', 'Test 2 (25 marks)', '2014-15', '14', '10', '10', '10', '18', '8', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Good work.', 'Save'),
(1504, '', 40, '2014-04-29 02:35:04', '2014-05-04 18:44:37', '61', 'Test 2 (25 marks)', '2014-15', '15', '24', '19', '9', '15', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '27/36', 'Can do better.', 'Save'),
(1505, '', 40, '2014-05-03 09:49:26', '2014-05-04 18:44:37', '62', 'Test 2 (25 marks)', '2013-14', '17', '6', '13', '14', '11', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1506, '', 40, '2014-05-02 23:07:03', '2014-05-04 18:44:37', '62', 'Test 2 (25 marks)', '2014-15', '15', '19', '10', '16', '9', '13', 'Well done.', 'Well done.', 'Needs to improve', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1507, '', 40, '2014-04-29 05:42:43', '2014-05-04 18:44:37', '63', 'Test 2 (25 marks)', '2013-14', '14', '19', '8', '14', '23', '25', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Can do better.', 'Save'),
(1508, '', 40, '2014-04-29 22:04:55', '2014-05-04 18:44:37', '64', 'Test 2 (25 marks)', '2013-14', '19', '24', '14', '12', '', '21', 'Well done.', 'Well done.', 'Good', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1509, '', 40, '2014-05-01 00:09:09', '2014-05-04 18:44:37', '64', 'Test 2 (25 marks)', '2014-15', '6', '19', '10', '18', '8', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(1510, '', 40, '2014-05-01 12:20:50', '2014-05-04 18:44:37', '65', 'Test 2 (25 marks)', '2013-14', '12', '19', '24', '12', '17', '11', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1511, '', 40, '2014-05-03 23:20:28', '2014-05-04 18:44:37', '65', 'Test 2 (25 marks)', '2014-15', '23', '9', '24', '22', '20', '15', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Good work.', 'Save'),
(1512, '', 40, '2014-05-01 05:25:39', '2014-05-04 18:44:37', '66', 'Test 2 (25 marks)', '2013-14', '21', '11', '10', '10', '16', '24', 'Can do better.', 'Well done.', 'Needs to improve', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1513, '', 40, '2014-05-02 01:08:37', '2014-05-04 18:44:37', '66', 'Test 2 (25 marks)', '2014-15', '23', '13', '14', '10', '21', '21', 'Well done.', 'Can do better.', 'Good', '31/36', 'Good work.', 'Save'),
(1514, '', 40, '2014-05-02 00:49:18', '2014-05-04 18:44:37', '67', 'Test 2 (25 marks)', '2013-14', '14', '20', '10', '', '', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1515, '', 40, '2014-05-02 22:42:19', '2014-05-04 18:44:37', '67', 'Test 2 (25 marks)', '2014-15', '12', '21', '', '24', '', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1516, '', 40, '2014-05-01 01:54:47', '0000-00-00 00:00:00', '68', 'Test 2 (25 marks)', '2013-14', '10', '', '9', '8', '14', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1517, '', 40, '2014-04-30 08:27:59', '2014-05-04 18:44:37', '69', 'Test 2 (25 marks)', '2013-14', '24', '23', '19', '15', '23', '10', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1518, '', 40, '2014-05-02 13:09:40', '0000-00-00 00:00:00', '69', 'Test 2 (25 marks)', '2014-15', '23', '9', '11', '17', '24', '12', 'Can do better.', 'Well done.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(1519, '', 40, '2014-05-03 13:44:07', '2014-05-04 18:44:37', '70', 'Test 2 (25 marks)', '2013-14', '11', '11', '17', '17', '19', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1520, '', 40, '2014-05-03 23:01:36', '2014-05-04 18:44:37', '70', 'Test 2 (25 marks)', '2014-15', '24', '8', '22', '9', '9', '18', 'Well done.', 'Can do better.', 'Good', '36/36', 'Need to work hard.', 'Save'),
(1521, '', 40, '2014-05-01 14:58:10', '2014-05-04 18:44:37', '71', 'Test 2 (25 marks)', '2013-14', '22', '20', '10', '20', '24', '21', 'Can do better.', 'Can do better.', 'Needs to improve', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1522, '', 40, '2014-05-03 18:40:22', '2014-05-04 18:44:37', '71', 'Test 2 (25 marks)', '2014-15', '21', '22', '17', '13', '20', '15', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(1523, '', 40, '2014-05-02 15:53:46', '2014-05-04 18:44:37', '72', 'Test 2 (25 marks)', '2013-14', '22', '21', '23', '15', '19', '20', 'Can do better.', 'Well done.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1524, '', 40, '2014-05-01 03:40:14', '2014-05-04 18:44:37', '72', 'Test 2 (25 marks)', '2014-15', '23', '21', '14', '17', '7', '8', 'Well done.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1525, '', 40, '2014-04-30 12:15:09', '0000-00-00 00:00:00', '73', 'Test 2 (25 marks)', '2013-14', '11', '6', '20', '11', '18', '14', 'Well done.', 'Can do better.', 'Needs to improve', '32/36', 'Concentrate. Too playful.', 'Save'),
(1526, '', 40, '2014-04-29 12:53:54', '0000-00-00 00:00:00', '73', 'Test 2 (25 marks)', '2014-15', '16', '', '12', '24', '11', '13', 'Can do better.', 'Well done.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(1527, '', 40, '2014-04-29 22:51:05', '0000-00-00 00:00:00', '74', 'Test 2 (25 marks)', '2013-14', '20', '22', '21', '13', '24', '12', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '34/36', 'Need to work independently.', 'Save'),
(1528, '', 40, '2014-05-03 07:31:59', '2014-05-04 18:44:37', '74', 'Test 2 (25 marks)', '2014-15', '9', '17', '24', '10', '11', '24', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '29/36', 'Can do better.', 'Save'),
(1529, '', 40, '2014-04-30 21:25:30', '0000-00-00 00:00:00', '75', 'Test 2 (25 marks)', '2013-14', '24', '14', '21', '13', '20', '16', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Need to work independently.', 'Save'),
(1530, '', 40, '2014-05-03 05:28:14', '2014-05-04 18:44:37', '75', 'Test 2 (25 marks)', '2014-15', '10', '10', '', '7', '13', '6', 'Can do better.', 'Can do better.', 'Good', '28/36', 'Good work.', 'Save'),
(1531, '', 40, '2014-04-29 14:17:30', '2014-05-04 18:44:37', '76', 'Test 2 (25 marks)', '2014-15', '7', '21', '21', '15', '18', '8', 'Can do better.', 'Well done.', 'Good', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1532, '', 40, '2014-04-29 05:48:03', '0000-00-00 00:00:00', '77', 'Test 2 (25 marks)', '2013-14', '11', '16', '22', '15', '23', '23', 'Well done.', 'Can do better.', 'Good', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1533, '', 40, '2014-05-03 06:26:47', '2014-05-04 18:44:37', '77', 'Test 2 (25 marks)', '2014-15', '14', '17', '8', '10', '17', '15', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '31/36', 'Congratulations. Potential to do even better.', 'Save'),
(1534, '', 40, '2014-05-02 16:01:36', '2014-05-04 18:44:37', '78', 'Test 2 (25 marks)', '2013-14', '21', '9', '12', '20', '9', '', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '32/36', 'Concentrate. Too playful.', 'Save'),
(1535, '', 40, '2014-05-02 22:28:00', '2014-05-04 18:44:37', '78', 'Test 2 (25 marks)', '2014-15', '10', '22', '17', '7', '7', '15', 'Well done.', 'Well done.', 'Excellent', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(1536, '', 40, '2014-05-01 15:39:43', '0000-00-00 00:00:00', '80', 'Test 2 (25 marks)', '2013-14', '23', '7', '17', '23', '22', '8', 'Can do better.', 'Can do better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(1537, '', 40, '2014-04-29 06:03:15', '0000-00-00 00:00:00', '80', 'Test 2 (25 marks)', '2014-15', '', '22', '21', '16', '21', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '31/36', 'Need to work hard.', 'Save'),
(1538, '', 40, '2014-04-30 09:37:54', '2014-05-04 18:44:37', '81', 'Test 2 (25 marks)', '2013-14', '', '', '10', '6', '17', '21', 'Can do better.', 'Can do better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1539, '', 40, '2014-05-03 13:44:23', '2014-05-04 18:44:37', '81', 'Test 2 (25 marks)', '2014-15', '11', '6', '10', '17', '15', '23', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1540, '', 40, '2014-05-02 12:27:46', '2014-05-04 18:44:37', '82', 'Test 2 (25 marks)', '2013-14', '', '13', '24', '18', '14', '8', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1541, '', 40, '2014-04-29 23:23:30', '2014-05-04 18:44:37', '82', 'Test 2 (25 marks)', '2014-15', '23', '20', '18', '17', '21', '20', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1542, '', 40, '2014-04-30 13:54:07', '2014-05-04 18:44:37', '83', 'Test 2 (25 marks)', '2013-14', '7', '16', '16', '23', '23', '10', 'Can do better.', 'Well done.', 'Good', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1543, '', 40, '2014-05-01 11:22:08', '2014-05-04 18:44:37', '83', 'Test 2 (25 marks)', '2014-15', '23', '6', '18', '', '18', '22', 'Well done.', 'Can do better.', 'Good', '32/36', 'Good job in English and Kannada.', 'Save'),
(1544, '', 40, '2014-05-03 11:07:13', '0000-00-00 00:00:00', '84', 'Test 2 (25 marks)', '2013-14', '', '16', '15', '18', '19', '15', 'Can do better.', 'Well done.', 'Needs to improve', '33/36', 'Need to work hard.', 'Save'),
(1545, '', 40, '2014-04-29 02:16:04', '2014-05-04 18:44:37', '84', 'Test 2 (25 marks)', '2014-15', '7', '19', '22', '12', '6', '24', 'Can do better.', 'Can do better.', 'Good', '36/36', 'Good work.', 'Save'),
(1546, '', 40, '2014-05-03 20:33:43', '0000-00-00 00:00:00', '85', 'Test 2 (25 marks)', '2013-14', '24', '14', '18', '22', '13', '17', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1547, '', 40, '2014-05-01 20:42:13', '2014-05-04 18:44:37', '85', 'Test 2 (25 marks)', '2014-15', '12', '19', '12', '23', '8', '11', 'Well done.', 'Can do better.', 'Good', '27/36', 'Good work.', 'Save'),
(1548, '', 40, '2014-04-30 10:47:27', '0000-00-00 00:00:00', '86', 'Test 2 (25 marks)', '2013-14', '12', '20', '23', '19', '8', '24', 'Can do better.', 'Can do better.', 'Excellent', '31/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1549, '', 40, '2014-04-29 19:14:24', '2014-05-04 18:44:37', '86', 'Test 2 (25 marks)', '2014-15', '24', '15', '22', '16', '16', '17', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1550, '', 40, '2014-04-30 01:43:20', '2014-05-04 18:44:37', '87', 'Test 2 (25 marks)', '2013-14', '12', '14', '10', '10', '7', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work independently.', 'Save'),
(1551, '', 40, '2014-04-29 14:25:40', '2014-05-04 18:44:37', '87', 'Test 2 (25 marks)', '2014-15', '16', '11', '19', '14', '16', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1552, '', 40, '2014-05-03 08:56:55', '0000-00-00 00:00:00', '88', 'Test 2 (25 marks)', '2014-15', '13', '19', '12', '20', '14', '16', 'Can do better.', 'Well done.', 'Excellent', '27/36', 'Need to work independently.', 'Save'),
(1553, '', 40, '2014-04-28 22:20:29', '2014-05-04 18:44:37', '90', 'Test 2 (25 marks)', '2013-14', '22', '14', '9', '21', '19', '24', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Good job in English and Kannada.', 'Save'),
(1554, '', 40, '2014-05-01 03:51:58', '2014-05-04 18:44:37', '90', 'Test 2 (25 marks)', '2014-15', '16', '19', '17', '21', '19', '15', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1555, '', 40, '2014-05-04 03:44:16', '2014-05-04 18:44:37', '91', 'Test 2 (25 marks)', '2013-14', '13', '12', '12', '19', '9', '9', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '36/36', 'Concentrate. Too playful.', 'Save'),
(1556, '', 40, '2014-04-29 13:03:27', '2014-05-04 18:44:37', '91', 'Test 2 (25 marks)', '2014-15', '20', '11', '20', '16', '11', '15', 'Can do better.', 'Can do better.', 'Excellent', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1557, '', 40, '2014-05-01 13:51:38', '2014-05-04 18:44:37', '92', 'Test 2 (25 marks)', '2013-14', '17', '15', '22', '17', '22', '8', 'Can do better.', 'Well done.', 'Needs to improve', '30/36', 'Can do better.', 'Save'),
(1558, '', 40, '2014-04-29 23:53:34', '0000-00-00 00:00:00', '92', 'Test 2 (25 marks)', '2014-15', '20', '18', '7', '12', '20', '21', 'Well done.', 'Can do better.', 'Needs to improve', '31/36', 'Need to work hard.', 'Save'),
(1559, '', 40, '2014-05-02 18:12:53', '2014-05-04 18:44:37', '93', 'Test 2 (25 marks)', '2013-14', '9', '8', '8', '8', '20', '12', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Good work.', 'Save'),
(1560, '', 40, '2014-05-02 21:49:26', '2014-05-04 18:44:37', '93', 'Test 2 (25 marks)', '2014-15', '12', '7', '19', '24', '8', '7', 'Well done.', 'Can do better.', 'Excellent', '26/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1561, '', 40, '2014-04-30 12:11:47', '2014-05-04 18:44:37', '94', 'Test 2 (25 marks)', '2013-14', '17', '6', '6', '13', '22', '18', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1562, '', 40, '2014-05-02 11:42:56', '2014-05-04 18:44:37', '94', 'Test 2 (25 marks)', '2014-15', '16', '22', '7', '16', '12', '14', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1563, '', 40, '2014-04-29 04:16:44', '0000-00-00 00:00:00', '95', 'Test 2 (25 marks)', '2013-14', '17', '22', '16', '14', '', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1564, '', 40, '2014-04-30 21:06:58', '2014-05-04 18:44:37', '95', 'Test 2 (25 marks)', '2014-15', '11', '14', '11', '15', '24', '6', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Congratulations. Potential to do even better.', 'Save'),
(1565, '', 40, '2014-04-30 03:40:48', '2014-05-04 18:44:37', '96', 'Test 2 (25 marks)', '2013-14', '6', '21', '11', '12', '21', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(1566, '', 40, '2014-04-29 22:57:15', '2014-05-04 18:44:37', '96', 'Test 2 (25 marks)', '2014-15', '12', '22', '14', '12', '13', '15', 'Well done.', 'Well done.', 'Needs to improve', '34/36', 'Congratulations. Potential to do even better.', 'Save');
INSERT INTO `ek5d2_gradesForm` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `studentId`, `examType`, `year`, `kannadaMarks`, `englishMarks`, `hindiMarks`, `mathMarks`, `generalScienceMarks`, `socialStudiesMarks`, `computerScience`, `physicalEducation`, `conduct`, `attendance`, `remarks`, `gradesSubmit`) VALUES
(1567, '', 40, '2014-05-02 10:00:03', '2014-05-04 18:44:37', '97', 'Test 2 (25 marks)', '2013-14', '17', '17', '18', '13', '24', '20', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1568, '', 40, '2014-04-30 00:54:14', '2014-05-04 18:44:37', '97', 'Test 2 (25 marks)', '2014-15', '9', '13', '17', '13', '13', '', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Need to work independently.', 'Save'),
(1569, '', 40, '2014-05-03 00:53:27', '2014-05-04 18:44:37', '98', 'Test 2 (25 marks)', '2013-14', '16', '10', '19', '17', '16', '7', 'Can do better.', 'Can do better.', 'Excellent', '26/36', 'Need to work hard.', 'Save'),
(1570, '', 40, '2014-05-02 09:19:49', '2014-05-04 18:44:37', '98', 'Test 2 (25 marks)', '2014-15', '17', '13', '7', '23', '15', '23', 'Well done.', 'Can do better.', 'Excellent', '27/36', 'Can do better.', 'Save'),
(1571, '', 40, '2014-04-30 02:06:54', '2014-05-04 18:44:37', '99', 'Test 2 (25 marks)', '2013-14', '15', '12', '16', '', '13', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1572, '', 40, '2014-04-29 10:42:59', '2014-05-04 18:44:37', '99', 'Test 2 (25 marks)', '2014-15', '18', '9', '', '7', '9', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1573, '', 40, '2014-05-04 01:42:05', '2014-05-04 18:44:37', '100', 'Test 2 (25 marks)', '2013-14', '10', '14', '17', '8', '', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Concentrate. Too playful.', 'Save'),
(1574, '', 40, '2014-05-01 16:52:28', '2014-05-04 18:44:37', '100', 'Test 2 (25 marks)', '2014-15', '11', '14', '11', '23', '9', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Concentrate. Too playful.', 'Save'),
(1575, '', 40, '2014-05-02 10:32:27', '2014-05-04 18:44:37', '101', 'Test 2 (25 marks)', '2013-14', '10', '', '20', '25', '14', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '35/36', 'Well done. Concentrate on maths.', 'Save'),
(1576, '', 40, '2014-05-02 13:22:56', '2014-05-04 18:44:37', '101', 'Test 2 (25 marks)', '2014-15', '16', '8', '14', '20', '23', '9', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1577, '', 40, '2014-05-03 11:59:04', '2014-05-04 18:44:37', '102', 'Test 2 (25 marks)', '2013-14', '15', '20', '16', '13', '23', '21', 'Can do better.', 'Can do better.', 'Good', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1578, '', 40, '2014-04-30 10:41:31', '2014-05-04 18:44:37', '102', 'Test 2 (25 marks)', '2014-15', '17', '7', '15', '8', '24', '22', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1579, '', 40, '2014-05-04 00:41:20', '2014-05-04 18:44:37', '103', 'Test 2 (25 marks)', '2013-14', '9', '12', '18', '', '24', '', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Concentrate. Too playful.', 'Save'),
(1580, '', 40, '2014-05-03 17:49:25', '2014-05-04 18:44:37', '103', 'Test 2 (25 marks)', '2014-15', '', '19', '7', '15', '8', '15', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1581, '', 40, '2014-04-30 02:21:44', '2014-05-04 18:44:37', '104', 'Test 2 (25 marks)', '2014-15', '15', '21', '', '22', '14', '7', 'Well done.', 'Well done.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1582, '', 40, '2014-05-03 07:17:01', '0000-00-00 00:00:00', '105', 'Test 2 (25 marks)', '2014-15', '6', '19', '7', '16', '15', '10', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Need to work hard.', 'Save'),
(1583, '', 40, '2014-05-03 13:43:34', '0000-00-00 00:00:00', '106', 'Test 2 (25 marks)', '2014-15', '6', '23', '19', '13', '10', '21', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work independently.', 'Save'),
(1584, '', 40, '2014-05-01 22:16:24', '2014-05-04 18:44:37', '107', 'Test 2 (25 marks)', '2013-14', '6', '17', '19', '18', '24', '', 'Can do better.', 'Well done.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(1585, '', 40, '2014-04-30 02:22:50', '0000-00-00 00:00:00', '107', 'Test 2 (25 marks)', '2014-15', '13', '15', '13', '23', '12', '24', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work independently.', 'Save'),
(1586, '', 40, '2014-04-30 02:45:25', '2014-05-04 18:44:37', '108', 'Test 2 (25 marks)', '2013-14', '9', '9', '20', '6', '', '12', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '26/36', 'Good work.', 'Save'),
(1587, '', 40, '2014-04-30 12:02:53', '2014-05-04 18:44:37', '108', 'Test 2 (25 marks)', '2014-15', '16', '17', '24', '16', '8', '21', 'Well done.', 'Can do better.', 'Good', '29/36', 'Concentrate. Too playful.', 'Save'),
(1588, '', 40, '2014-04-30 10:26:41', '2014-05-04 18:44:37', '109', 'Test 2 (25 marks)', '2013-14', '10', '9', '8', '', '20', '', 'Well done.', 'Well done.', 'Excellent', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1589, '', 40, '2014-05-02 17:40:47', '2014-05-04 18:44:37', '109', 'Test 2 (25 marks)', '2014-15', '21', '13', '15', '21', '17', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '35/36', 'Need to work hard.', 'Save'),
(1590, '', 40, '2014-04-29 13:24:18', '2014-05-04 18:44:37', '110', 'Test 2 (25 marks)', '2013-14', '17', '15', '17', '21', '22', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Well done. Concentrate on maths.', 'Save'),
(1591, '', 40, '2014-05-01 16:06:05', '2014-05-04 18:44:37', '110', 'Test 2 (25 marks)', '2014-15', '18', '9', '22', '18', '12', '23', 'Well done.', 'Congratulations. Potential to do even better.', 'Excellent', '28/36', 'Well done. Concentrate on maths.', 'Save'),
(1592, '', 40, '2014-04-29 13:51:58', '2014-05-04 18:44:37', '111', 'Test 2 (25 marks)', '2013-14', '20', '19', '22', '7', '15', '6', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Can do better.', 'Save'),
(1593, '', 40, '2014-05-01 22:00:28', '2014-05-04 18:44:37', '111', 'Test 2 (25 marks)', '2014-15', '12', '7', '9', '12', '15', '11', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '32/36', 'Good work.', 'Save'),
(1594, '', 40, '2014-05-02 02:19:26', '2014-05-04 18:44:37', '112', 'Test 2 (25 marks)', '2013-14', '6', '15', '23', '11', '23', '13', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1595, '', 40, '2014-05-03 14:10:11', '2014-05-04 18:44:37', '112', 'Test 2 (25 marks)', '2014-15', '22', '24', '24', '8', '9', '21', 'Can do better.', 'Well done.', 'Excellent', '31/36', 'Need to work independently.', 'Save'),
(1596, '', 40, '2014-04-29 11:14:01', '2014-05-04 18:44:37', '113', 'Test 2 (25 marks)', '2013-14', '6', '23', '8', '21', '', '7', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(1597, '', 40, '2014-04-29 23:19:04', '0000-00-00 00:00:00', '113', 'Test 2 (25 marks)', '2014-15', '19', '14', '24', '20', '25', '10', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '31/36', 'Good job in English and Kannada.', 'Save'),
(1598, '', 40, '2014-05-03 23:10:03', '0000-00-00 00:00:00', '114', 'Test 2 (25 marks)', '2013-14', '25', '21', '15', '22', '22', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '26/36', 'Good work.', 'Save'),
(1599, '', 40, '2014-04-29 16:54:04', '2014-05-04 18:44:37', '114', 'Test 2 (25 marks)', '2014-15', '21', '18', '14', '23', '12', '19', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '31/36', 'Concentrate. Too playful.', 'Save'),
(1600, '', 40, '2014-05-02 08:02:13', '0000-00-00 00:00:00', '115', 'Test 2 (25 marks)', '2014-15', '10', '12', '21', '14', '19', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(1601, '', 40, '2014-05-02 03:24:58', '2014-05-04 18:44:37', '116', 'Test 2 (25 marks)', '2013-14', '10', '20', '18', '15', '6', '11', 'Well done.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1602, '', 40, '2014-04-30 17:17:52', '2014-05-04 18:44:37', '116', 'Test 2 (25 marks)', '2014-15', '10', '12', '8', '15', '', '14', 'Can do better.', 'Well done.', 'Needs to improve', '35/36', 'Good work.', 'Save'),
(1603, '', 40, '2014-05-03 11:49:03', '0000-00-00 00:00:00', '117', 'Test 2 (25 marks)', '2013-14', '18', '17', '19', '15', '', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '30/36', 'Good job in English and Kannada.', 'Save'),
(1604, '', 40, '2014-04-30 21:30:28', '2014-05-04 18:44:37', '117', 'Test 2 (25 marks)', '2014-15', '17', '7', '10', '18', '16', '13', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(1605, '', 40, '2014-05-03 19:38:32', '2014-05-04 18:44:37', '118', 'Test 2 (25 marks)', '2013-14', '8', '15', '23', '24', '20', '9', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1606, '', 40, '2014-05-01 22:14:30', '2014-05-04 18:44:37', '118', 'Test 2 (25 marks)', '2014-15', '8', '9', '11', '11', '', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1607, '', 40, '2014-04-29 06:24:48', '0000-00-00 00:00:00', '119', 'Test 2 (25 marks)', '2013-14', '7', '22', '23', '21', '10', '21', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Good job in English and Kannada.', 'Save'),
(1608, '', 40, '2014-05-01 17:15:17', '2014-05-04 18:44:37', '120', 'Test 2 (25 marks)', '2013-14', '12', '12', '22', '23', '16', '21', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1609, '', 40, '2014-04-30 06:58:35', '2014-05-04 18:44:37', '120', 'Test 2 (25 marks)', '2014-15', '21', '11', '25', '', '14', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1610, '', 40, '2014-05-03 04:20:54', '2014-05-04 18:44:37', '121', 'Test 2 (25 marks)', '2013-14', '11', '20', '16', '16', '22', '18', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Congratulations. Potential to do even better.', 'Save'),
(1611, '', 40, '2014-05-03 18:37:48', '2014-05-04 18:44:37', '121', 'Test 2 (25 marks)', '2014-15', '', '9', '10', '15', '14', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1612, '', 40, '2014-04-30 00:04:06', '2014-05-04 18:44:37', '122', 'Test 2 (25 marks)', '2013-14', '16', '8', '17', '19', '14', '10', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '34/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1613, '', 40, '2014-04-29 16:47:36', '2014-05-04 18:44:37', '122', 'Test 2 (25 marks)', '2014-15', '20', '6', '8', '11', '13', '23', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '26/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1614, '', 40, '2014-04-30 08:57:39', '0000-00-00 00:00:00', '123', 'Test 2 (25 marks)', '2013-14', '8', '9', '14', '13', '14', '18', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '27/36', 'Good work.', 'Save'),
(1615, '', 40, '2014-05-02 10:15:03', '2014-05-04 18:44:37', '123', 'Test 2 (25 marks)', '2014-15', '7', '17', '20', '11', '24', '', 'Well done.', 'Well done.', 'Needs to improve', '33/36', 'Can do better.', 'Save'),
(1616, '', 40, '2014-05-01 03:30:14', '2014-05-04 18:44:37', '124', 'Test 2 (25 marks)', '2013-14', '22', '24', '12', '8', '23', '14', 'Can do better.', 'Can do better.', 'Excellent', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1617, '', 40, '2014-04-30 07:28:59', '0000-00-00 00:00:00', '124', 'Test 2 (25 marks)', '2014-15', '15', '24', '8', '13', '6', '19', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1618, '', 40, '2014-05-02 05:56:34', '2014-05-04 18:44:37', '125', 'Test 2 (25 marks)', '2013-14', '16', '20', '17', '9', '6', '7', 'Well done.', 'Well done.', 'Good', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1619, '', 40, '2014-05-02 06:31:09', '2014-05-04 18:44:37', '125', 'Test 2 (25 marks)', '2014-15', '6', '22', '10', '6', '9', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Good work.', 'Save'),
(1620, '', 40, '2014-04-29 05:42:38', '2014-05-04 18:44:37', '126', 'Test 2 (25 marks)', '2014-15', '6', '', '10', '', '12', '24', 'Can do better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1621, '', 40, '2014-05-02 11:46:13', '2014-05-04 18:44:37', '127', 'Test 2 (25 marks)', '2013-14', '15', '18', '21', '', '22', '13', 'Well done.', 'Can do better.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1622, '', 40, '2014-05-02 05:56:34', '2014-05-04 18:44:37', '127', 'Test 2 (25 marks)', '2014-15', '21', '19', '18', '10', '9', '20', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Congratulations. Potential to do even better.', 'Save'),
(1623, '', 40, '2014-05-01 22:29:59', '2014-05-04 18:44:37', '128', 'Test 2 (25 marks)', '2013-14', '21', '23', '', '', '9', '', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1624, '', 40, '2014-05-01 17:49:19', '2014-05-04 18:44:37', '128', 'Test 2 (25 marks)', '2014-15', '24', '7', '22', '14', '16', '15', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1625, '', 40, '2014-05-01 19:01:18', '0000-00-00 00:00:00', '129', 'Test 2 (25 marks)', '2013-14', '14', '18', '22', '', '23', '21', 'Can do better.', 'Can do better.', 'Excellent', '35/36', 'Can do better.', 'Save'),
(1626, '', 40, '2014-05-02 06:32:28', '0000-00-00 00:00:00', '129', 'Test 2 (25 marks)', '2014-15', '21', '22', '24', '15', '10', '17', 'Can do better.', 'Well done.', 'Good', '32/36', 'Need to work hard.', 'Save'),
(1627, '', 40, '2014-05-03 21:10:13', '0000-00-00 00:00:00', '130', 'Test 2 (25 marks)', '2013-14', '14', '11', '20', '7', '14', '23', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '36/36', 'Well done. Concentrate on maths.', 'Save'),
(1628, '', 40, '2014-05-01 18:40:00', '2014-05-04 18:44:37', '130', 'Test 2 (25 marks)', '2014-15', '17', '16', '9', '16', '18', '8', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work independently.', 'Save'),
(1629, '', 40, '2014-04-28 22:44:20', '2014-05-04 18:44:37', '131', 'Test 2 (25 marks)', '2013-14', '11', '12', '18', '', '19', '', 'Well done.', 'Can do better.', 'Good', '33/36', 'Good work.', 'Save'),
(1630, '', 40, '2014-04-30 19:45:49', '2014-05-04 18:44:37', '131', 'Test 2 (25 marks)', '2014-15', '7', '7', '', '13', '21', '24', 'Well done.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Good job in English and Kannada.', 'Save'),
(1631, '', 40, '2014-05-01 01:31:03', '2014-05-04 18:44:37', '132', 'Test 2 (25 marks)', '2013-14', '8', '11', '19', '', '21', '16', 'Can do better.', 'Can do better.', 'Excellent', '26/36', 'Need to work hard.', 'Save'),
(1632, '', 40, '2014-04-29 03:54:54', '2014-05-04 18:44:37', '132', 'Test 2 (25 marks)', '2014-15', '17', '', '', '14', '17', '17', 'Can do better.', 'Can do better.', 'Excellent', '32/36', 'Well done. Concentrate on maths.', 'Save'),
(1633, '', 40, '2014-04-29 16:40:27', '0000-00-00 00:00:00', '133', 'Test 2 (25 marks)', '2013-14', '8', '17', '', '23', '23', '12', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Need to work independently.', 'Save'),
(1634, '', 40, '2014-05-02 01:15:43', '0000-00-00 00:00:00', '133', 'Test 2 (25 marks)', '2014-15', '24', '7', '15', '17', '6', '', 'Well done.', 'Can do better.', 'Excellent', '28/36', 'Can do better.', 'Save'),
(1635, '', 40, '2014-04-29 13:03:44', '0000-00-00 00:00:00', '134', 'Test 2 (25 marks)', '2014-15', '9', '15', '15', '19', '17', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '30/36', 'Good work.', 'Save'),
(1636, '', 40, '2014-05-03 13:09:02', '2014-05-04 18:44:37', '135', 'Test 2 (25 marks)', '2013-14', '12', '20', '18', '', '', '7', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '27/36', 'Need to work hard.', 'Save'),
(1637, '', 40, '2014-05-03 11:30:32', '0000-00-00 00:00:00', '135', 'Test 2 (25 marks)', '2014-15', '11', '17', '24', '17', '12', '13', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '29/36', 'Well done. Concentrate on maths.', 'Save'),
(1638, '', 40, '2014-05-03 18:36:16', '2014-05-04 18:44:37', '136', 'Test 2 (25 marks)', '2013-14', '14', '18', '15', '10', '25', '20', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '30/36', 'Can do better.', 'Save'),
(1639, '', 40, '2014-05-03 23:37:56', '2014-05-04 18:44:37', '136', 'Test 2 (25 marks)', '2014-15', '20', '24', '9', '8', '15', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1640, '', 40, '2014-05-03 02:58:45', '2014-05-04 18:44:37', '137', 'Test 2 (25 marks)', '2013-14', '19', '12', '9', '23', '16', '14', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Congratulations. Potential to do even better.', 'Save'),
(1641, '', 40, '2014-05-02 20:13:00', '2014-05-04 18:44:37', '137', 'Test 2 (25 marks)', '2014-15', '20', '21', '12', '13', '13', '22', 'Well done.', 'Can do better.', 'Needs to improve', '26/36', 'Well done. Concentrate on maths.', 'Save'),
(1642, '', 40, '2014-05-03 18:13:57', '2014-05-04 18:44:37', '138', 'Test 2 (25 marks)', '2013-14', '13', '24', '6', '14', '25', '19', 'Can do better.', 'Can do better.', 'Needs to improve', '36/36', 'Good work.', 'Save'),
(1643, '', 40, '2014-05-03 19:06:11', '0000-00-00 00:00:00', '138', 'Test 2 (25 marks)', '2014-15', '18', '8', '10', '11', '7', '21', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1644, '', 40, '2014-05-03 20:16:22', '2014-05-04 18:44:37', '139', 'Test 2 (25 marks)', '2013-14', '8', '20', '6', '20', '12', '12', 'Can do better.', 'Congratulations. Potential to do even better.', 'Excellent', '35/36', 'Good job in English and Kannada.', 'Save'),
(1645, '', 40, '2014-05-03 17:47:24', '2014-05-04 18:44:37', '139', 'Test 2 (25 marks)', '2014-15', '15', '15', '8', '17', '22', '18', 'Well done.', 'Can do better.', 'Needs to improve', '33/36', 'Good job in English and Kannada.', 'Save'),
(1646, '', 40, '2014-04-29 04:23:08', '0000-00-00 00:00:00', '140', 'Test 2 (25 marks)', '2013-14', '22', '18', '14', '', '23', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '26/36', 'Congratulations. Potential to do even better.', 'Save'),
(1647, '', 40, '2014-04-29 03:55:49', '2014-05-04 18:44:37', '140', 'Test 2 (25 marks)', '2014-15', '16', '7', '10', '12', '16', '14', 'Well done.', 'Well done.', 'Good', '35/36', 'Good work.', 'Save'),
(1648, '', 40, '2014-05-01 10:16:49', '2014-05-04 18:44:37', '141', 'Test 2 (25 marks)', '2014-15', '18', '14', '10', '22', '18', '19', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '32/36', 'Need to work independently.', 'Save'),
(1649, '', 40, '2014-05-01 09:59:23', '2014-05-04 18:44:37', '143', 'Test 2 (25 marks)', '2013-14', '18', '9', '9', '14', '', '22', 'Can do better.', 'Congratulations. Potential to do even better.', 'Good', '33/36', 'Need to work hard.', 'Save'),
(1650, '', 40, '2014-04-29 12:21:37', '2014-05-04 18:44:37', '143', 'Test 2 (25 marks)', '2014-15', '18', '16', '21', '12', '11', '23', 'Can do better.', 'Can do better.', 'Excellent', '36/36', 'Need to work independently.', 'Save'),
(1651, '', 40, '2014-04-29 09:00:44', '2014-05-04 18:44:37', '144', 'Test 2 (25 marks)', '2013-14', '19', '', '22', '8', '10', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Good', '29/36', 'Need to work hard.', 'Save'),
(1652, '', 40, '2014-05-02 09:45:32', '2014-05-04 18:44:37', '144', 'Test 2 (25 marks)', '2014-15', '9', '10', '16', '17', '7', '15', 'Congratulations. Potential to do even better.', 'Can do better.', 'Needs to improve', '29/36', 'Need to work hard.', 'Save'),
(1653, '', 40, '2014-05-03 00:59:30', '2014-05-04 18:44:37', '145', 'Test 2 (25 marks)', '2013-14', '6', '24', '6', '9', '9', '13', 'Well done.', 'Well done.', 'Good', '35/36', 'Need to work independently.', 'Save'),
(1654, '', 40, '2014-04-29 19:30:10', '2014-05-04 18:44:37', '145', 'Test 2 (25 marks)', '2014-15', '14', '8', '7', '17', '21', '22', 'Congratulations. Potential to do even better.', 'Can do better.', 'Excellent', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(1655, '', 40, '2014-05-01 01:51:58', '0000-00-00 00:00:00', '146', 'Test 2 (25 marks)', '2013-14', '24', '10', '13', '7', '10', '18', 'Congratulations. Potential to do even better.', 'Well done.', 'Good', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1656, '', 40, '2014-04-30 18:03:08', '2014-05-04 18:44:37', '146', 'Test 2 (25 marks)', '2014-15', '14', '13', '18', '21', '16', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '36/36', 'Can do better.', 'Save'),
(1657, '', 40, '2014-05-02 16:50:02', '2014-05-04 18:44:37', '147', 'Test 2 (25 marks)', '2013-14', '17', '7', '15', '15', '24', '23', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Good work.', 'Save'),
(1658, '', 40, '2014-05-01 21:40:00', '2014-05-04 18:44:37', '147', 'Test 2 (25 marks)', '2014-15', '23', '7', '15', '17', '15', '7', 'Well done.', 'Well done.', 'Needs to improve', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1659, '', 40, '2014-04-29 01:44:41', '0000-00-00 00:00:00', '148', 'Test 2 (25 marks)', '2013-14', '11', '19', '10', '21', '17', '8', 'Can do better.', 'Can do better.', 'Excellent', '28/36', 'Concentrate. Too playful.', 'Save'),
(1660, '', 40, '2014-05-03 06:21:06', '0000-00-00 00:00:00', '148', 'Test 2 (25 marks)', '2014-15', '', '25', '16', '18', '6', '6', 'Well done.', 'Congratulations. Potential to do even better.', 'Needs to improve', '28/36', 'Good job in English and Kannada.', 'Save'),
(1661, '', 40, '2014-05-03 14:29:35', '0000-00-00 00:00:00', '149', 'Test 2 (25 marks)', '2013-14', '17', '12', '8', '', '', '20', 'Well done.', 'Well done.', 'Good', '28/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1662, '', 40, '2014-05-02 22:40:52', '2014-05-04 18:44:37', '149', 'Test 2 (25 marks)', '2014-15', '9', '18', '6', '23', '21', '17', 'Well done.', 'Can do better.', 'Needs to improve', '34/36', 'Congratulations. Potential to do even better.', 'Save'),
(1663, '', 40, '2014-04-29 10:04:49', '2014-05-04 18:44:37', '150', 'Test 2 (25 marks)', '2013-14', '11', '19', '17', '20', '11', '10', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Needs to improve', '26/36', 'Good work.', 'Save'),
(1664, '', 40, '2014-05-01 19:34:00', '0000-00-00 00:00:00', '151', 'Test 2 (25 marks)', '2013-14', '15', '12', '9', '22', '21', '9', 'Can do better.', 'Well done.', 'Good', '36/36', 'Concentrate. Too playful.', 'Save'),
(1665, '', 40, '2014-05-03 12:53:42', '0000-00-00 00:00:00', '151', 'Test 2 (25 marks)', '2014-15', '19', '24', '10', '23', '20', '11', 'Well done.', 'Well done.', 'Excellent', '31/36', 'Well done. Concentrate on maths.', 'Save'),
(1666, '', 40, '2014-04-30 22:11:33', '2014-05-04 18:44:37', '152', 'Test 2 (25 marks)', '2013-14', '16', '24', '24', '15', '10', '18', 'Can do better.', 'Can do better.', 'Good', '26/36', 'Need to work hard.', 'Save'),
(1667, '', 40, '2014-05-01 18:21:57', '2014-05-04 18:44:37', '153', 'Test 2 (25 marks)', '2013-14', '22', '7', '10', '11', '', '22', 'Well done.', 'Well done.', 'Needs to improve', '32/36', 'Good work.', 'Save'),
(1668, '', 40, '2014-04-30 15:48:36', '2014-05-04 18:44:37', '153', 'Test 2 (25 marks)', '2014-15', '8', '16', '20', '12', '7', '6', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '29/36', 'Need to work hard in Hindi. All the best.', 'Save'),
(1669, '', 40, '2014-04-29 07:52:52', '2014-05-04 18:44:37', '154', 'Test 2 (25 marks)', '2013-14', '7', '16', '20', '17', '19', '24', 'Can do better.', 'Well done.', 'Excellent', '30/36', 'Can do better.', 'Save'),
(1670, '', 40, '2014-05-03 19:04:05', '2014-05-04 18:44:37', '154', 'Test 2 (25 marks)', '2014-15', '6', '19', '11', '14', '6', '6', 'Can do better.', 'Can do better.', 'Needs to improve', '29/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1671, '', 40, '2014-05-01 01:15:43', '2014-05-04 18:44:37', '155', 'Test 2 (25 marks)', '2013-14', '13', '8', '9', '11', '21', '17', 'Congratulations. Potential to do even better.', 'Can do better.', 'Good', '33/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1672, '', 40, '2014-04-29 19:41:39', '0000-00-00 00:00:00', '155', 'Test 2 (25 marks)', '2014-15', '15', '22', '9', '19', '21', '13', 'Well done.', 'Well done.', 'Good', '28/36', 'Congratulations. Potential to do even better.', 'Save'),
(1673, '', 40, '2014-04-30 23:40:20', '2014-05-04 18:44:37', '156', 'Test 2 (25 marks)', '2013-14', '11', '9', '11', '20', '9', '16', 'Congratulations. Potential to do even better.', 'Well done.', 'Needs to improve', '34/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1674, '', 40, '2014-04-30 11:33:39', '2014-05-04 18:44:37', '156', 'Test 2 (25 marks)', '2014-15', '18', '19', '21', '', '15', '18', 'Can do better.', 'Can do better.', 'Excellent', '29/36', 'Need to work hard.', 'Save'),
(1675, '', 40, '2014-04-30 19:34:30', '2014-05-04 18:44:37', '157', 'Test 2 (25 marks)', '2013-14', '', '24', '23', '13', '24', '19', 'Congratulations. Potential to do even better.', 'Congratulations. Potential to do even better.', 'Excellent', '27/36', 'Need assistance in languages. Well done in social.', 'Save'),
(1676, '', 40, '2014-05-03 13:50:39', '2014-05-04 18:44:37', '157', 'Test 2 (25 marks)', '2014-15', '6', '24', '19', '6', '17', '17', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '33/36', 'Well done. Concentrate on maths.', 'Save'),
(1677, '', 40, '2014-04-30 14:51:26', '2014-05-04 18:44:37', '158', 'Test 2 (25 marks)', '2013-14', '15', '9', '11', '11', '13', '19', 'Can do better.', 'Well done.', 'Good', '29/36', 'Good work.', 'Save'),
(1678, '', 40, '2014-05-03 11:33:20', '0000-00-00 00:00:00', '158', 'Test 2 (25 marks)', '2014-15', '', '20', '19', '12', '16', '8', 'Congratulations. Potential to do even better.', 'Well done.', 'Excellent', '32/36', 'Concentrate. Too playful.', 'Save'),
(1679, '', 40, '2014-04-30 22:07:58', '2014-05-04 18:44:37', '159', 'Test 2 (25 marks)', '2013-14', '25', '9', '8', '18', '18', '7', 'Well done.', 'Can do better.', 'Good', '33/36', 'Concentrate. Too playful.', 'Save'),
(1680, '', 40, '2014-05-01 12:11:09', '2014-05-04 18:44:37', '159', 'Test 2 (25 marks)', '2014-15', '22', '13', '13', '24', '25', '13', 'Can do better.', 'Well done.', 'Good', '30/36', 'Need to work hard in Hindi. All the best.', 'Save');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=214 ;

--
-- Dumping data for table `ek5d2_menu`
--

INSERT INTO `ek5d2_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 135, 0, '*', 0),
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
(129, 'mainmenu', 'Login2', 'login2', '', 'login2', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"Login","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 131, 132, 0, '*', 0),
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
(208, 'mainmenu', 'View List', 'view-list', '', 'students/view-list', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 207, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"studentList","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 120, 121, 0, '*', 0),
(209, 'mainmenu', 'Login1', 'login1', '', 'login1', 'index.php?option=com_users&view=login', 'component', -2, 1, 1, 25, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"login_redirect_url":"","logindescription_show":"1","login_description":"","login_image":"","logout_redirect_url":"","logoutdescription_show":"1","logout_description":"","logout_image":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 1, 2, 0, '*', 0),
(210, 'mainmenu', 'View Grades', 'view-grades', '', 'grades/view-grades', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 212, 2, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"gradesList","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 126, 127, 0, '*', 0),
(211, 'mainmenu', 'Add Grades', 'add-grades', '', 'grades/add-grades', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 212, 2, 10027, 0, '0000-00-00 00:00:00', 0, 2, '', 0, '{"chronoform":"gradesForm","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 128, 129, 0, '*', 0),
(212, 'mainmenu', 'Grades', 'grades', '', 'grades', 'index.php?Itemid=', 'alias', 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"aliasoptions":"210","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 125, 130, 0, '*', 0),
(213, 'mainmenu', 'Reports', 'reports', '', 'reports', 'index.php?option=com_chronoforms5&view=form', 'component', 1, 1, 1, 10027, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"chronoform":"gradesForm","event":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 133, 134, 0, '*', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

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
(96, 143, 'Students', '', '<p><a href="index.php/students/view-list"><img src="images/icon-students.png" width="200px"></a></p>\r\n<h3>Students</h3>', 5, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(97, 144, 'Grades', '', '<p><a href="index.php/grades/view-grades"><img src="images/icon-grades.png" width="200px"></a></p>\r\n<h3>Grades</h3>', 6, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(98, 145, 'Reports', '', '<p><a href="index.php/reports"><img src="images/icon-reports.png" width="200px"></a></p>\r\n<h3>Reports</h3>', 7, 'top-b', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(99, 146, 'Features UIkit', '', '<div class="uk-grid" data-uk-grid-margin>\n    <div class="uk-width-medium-1-4 uk-width-large-1-5 uk-text-center">\n        <img src="images/yootheme/features_uikit.svg" alt="Get UIkit" title="Get UIkit" width="180" height="180">\n    </div>\n    <div class="uk-width-medium-3-4 uk-width-large-4-5 uk-text-center-small">\n        <h3 class="uk-panel-title">Built with UIkit</h3>\n        <p>UIkit is a lightweight and modular front-end framework for developing fast and powerful web interfaces. It comes with a wide range of reusable and combinable components. All UIkit classes are namespaced, so they won''t interfere with other frameworks and extensions you might be using. Here''s an overview of the different UIkit components, which you can easily modify using the customizer.</p>\n        <p><a class="uk-button" href="http://www.getuikit.com" target="_blank">Visit Website</a></p>\n    </div>\n</div>', 1, 'top-a', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"1","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(100, 0, 'Social Icons', '', '<div class="uk-margin-top">\n    <a href="#" class="uk-icon-button uk-icon-github"></a>\n    <a href="#" class="uk-icon-button uk-icon-twitter"></a>\n    <a href="#" class="uk-icon-button uk-icon-dribbble"></a>\n    <a href="#" class="uk-icon-button uk-icon-facebook"></a>\n</div>', 1, 'headerbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(101, 148, 'Home features', '', '<div class="uk-grid uk-margin-top uk-margin-bottom">\n    <div class="uk-width-1-2">\n        <h3 class="uk-h1">Customizer</h3>\n        <p class="uk-text-large">Pick colors, select fonts and modify sizes without any CSS coding. See the changes in a real-time preview.</p>\n        <img width="545" height="180" src="images/yootheme/home_customizer.png" alt="Demo">\n    </div>\n    <div class="uk-width-1-2">\n        <h3 class="uk-h1">Mobile menu</h3>\n        <p class="uk-text-large">A modern and beautiful off-canvas navigation to enhance your site on mobile devices.</p>\n        <img width="545" height="180" src="images/yootheme/home_mobilemenu.png" alt="Mobile Menu">\n    </div>\n</div>', 1, 'main-top', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 0, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*'),
(102, 149, 'Logo small', '', '<img src="images/yootheme/logo_small.svg" width="135" height="40" alt="Demo" class="uk-responsive-height">', 1, 'logo-small', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static","module_tag":"div","bootstrap_size":"0","header_tag":"h3","header_class":"","style":"0"}', 0, '*');

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
(102, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

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
(8, 'http://bgms.iedf.in/index.php/students/view-grades?id=7', '', '', '', 1, 0, '2014-05-04 09:47:44', '0000-00-00 00:00:00');

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
('29b72bfe7fa5fea67140a2d8b84afe20', 1, 0, '1399209606', '__default|a:8:{s:15:"session.counter";i:144;s:19:"session.timer.start";i:1399170920;s:18:"session.timer.last";i:1399209305;s:17:"session.timer.now";i:1399209605;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":2:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:5:"en-GB";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}}}s:4:"user";O:5:"JUser":26:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:2:"37";s:4:"name";s:10:"Super User";s:8:"username";s:8:"webadmin";s:5:"email";s:20:"arvindpdmn@gmail.com";s:8:"password";s:34:"$P$DayMKCjvSNqXzbatwx1Nb59YbEiDOq/";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2014-04-29 15:26:07";s:13:"lastvisitDate";s:19:"2014-05-03 18:02:24";s:10:"activation";s:1:"0";s:6:"params";s:0:"";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:5:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:6;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;s:6:"otpKey";s:0:"";s:4:"otep";s:0:"";}s:13:"session.token";s:32:"68f8964ea75f70f61c47137865faeb95";}gcore|a:3:{s:4:"user";a:9:{s:2:"id";s:2:"37";s:4:"name";s:10:"Super User";s:8:"username";s:8:"webadmin";s:5:"email";s:20:"arvindpdmn@gmail.com";s:10:"last_login";s:19:"2014-05-03 18:02:24";s:9:"logged_in";b:1;s:5:"guest";i:0;s:6:"groups";a:1:{i:0;s:1:"8";}s:11:"inheritance";a:2:{i:0;s:1:"1";i:1;s:1:"0";}}s:56:"GCore\\Admin\\Extensions\\Chronoforms\\Chronoforms.Form.page";i:1;s:57:"GCore\\Admin\\Extensions\\Chronoforms\\Chronoforms.Form.limit";i:30;}', 37, 'webadmin'),
('e4e4f4ea60563e7e733d216ee36c32ff', 0, 0, '1399209587', '__default|a:8:{s:15:"session.counter";i:196;s:19:"session.timer.start";i:1399168475;s:18:"session.timer.last";i:1399209534;s:17:"session.timer.now";i:1399209587;s:22:"session.client.browser";s:65:"Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":27:{s:9:"\\0\\0\\0isRoot";b:0;s:2:"id";s:2:"40";s:4:"name";s:6:"arvind";s:8:"username";s:6:"arvind";s:5:"email";s:17:"arvindpdmn@ov.com";s:8:"password";s:34:"$P$D6CcnNttxcRBecoH15AeFprf/2gbWn1";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"0";s:12:"registerDate";s:19:"2014-05-01 06:43:50";s:13:"lastvisitDate";s:19:"2014-05-03 16:48:37";s:10:"activation";s:0:"";s:6:"params";s:2:"{}";s:6:"groups";a:1:{i:2;s:1:"2";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:2;}s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:2;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;s:6:"otpKey";s:0:"";s:4:"otep";s:0:"";s:11:"cookieLogin";b:1;}s:13:"session.token";s:32:"df3fa5f996651279dc529ade4715218c";}gcore|a:1:{s:4:"user";a:9:{s:2:"id";s:2:"40";s:4:"name";s:6:"arvind";s:8:"username";s:6:"arvind";s:5:"email";s:17:"arvindpdmn@ov.com";s:10:"last_login";s:19:"2014-05-03 16:48:37";s:9:"logged_in";b:1;s:5:"guest";i:0;s:6:"groups";a:1:{i:0;s:1:"2";}s:11:"inheritance";a:2:{i:0;s:1:"1";i:1;s:1:"0";}}}', 40, 'arvind');

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
  `age` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `studentUid` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `parent` varchar(255) NOT NULL,
  `guardian` varchar(255) NOT NULL,
  `sponsor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=164 ;

--
-- Dumping data for table `ek5d2_studentform`
--

INSERT INTO `ek5d2_studentform` (`id`, `uniq_id`, `user_id`, `created`, `modified`, `name`, `dateOfBirth`, `age`, `sex`, `admissionNumber`, `studentUid`, `class`, `group`, `parent`, `guardian`, `sponsor`) VALUES
(1, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Stasia Rapier', '10/06/1999', '15', 'Female', '1/13-14', 'A0001', '5', 'Azad', '', 'Derick Pinckard', 'Antionette Zalewski'),
(2, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Silvia Berning', '05/08/1999', '15', 'Female', '2/09-08', 'A0002', '1', 'Azad', 'Gaylord Atienza', '', 'Gaylord Atienza'),
(3, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tasha Mondy', '12/07/2003', '11', 'Male', '3/11-12', 'A0003', '10', 'Bhagath', 'Dusti Mazzola', '', 'Chauncey Devlin'),
(4, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Malcom Bowes', '15/09/2001', '13', 'Female', '4/13-14', 'A0004', '10', 'Vivek', '', 'Kristie Luna', 'Gwenn Balch'),
(5, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Sang Silverman', '10/02/2007', '7', 'Female', '5/13-14', 'A0005', '6', 'Vivek', 'Chauncey Devlin', '', 'Shawanna Mcmahan'),
(6, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kay Lintner', '15/03/2006', '8', 'Female', '6/13-14', 'A0006', '8', 'Bhagath', 'Dusti Mazzola', '', ''),
(7, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Judy Bran', '23/10/2000', '14', 'Male', '7/11-12', 'A0007', '1', 'Vivek', '', 'Aurora Fichter', 'Marla Theurer'),
(8, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Amish Gire', '21/09/2003', '11', 'Male', '8/09-10', 'A0008', '8', 'Bhagath', '', 'Deon Woltz', 'Dasras Murthy'),
(9, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jed Rountree', '20/04/2003', '11', 'Male', '9/13-14', 'A0009', '2', 'Subhash', 'Madonna Foret', '', 'Simona Furlong'),
(10, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Patricia Welsh', '16/08/2004', '10', 'Male', '10/09-10', 'A0010', '2', 'Azad', '', 'Wally Rains', ''),
(11, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Zenaida Dicicco', '05/06/2006', '8', 'Male', '11/13-14', 'A0011', '5', 'Vivek', 'Mathew Basch', '', ''),
(12, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Loan Alongi', '04/05/1998', '16', 'Male', '12/14-15', 'A0012', '4', 'Bhagath', '', 'Russel Fahnestock', 'Gwenn Balch'),
(13, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Bonita Crittendon', '25/12/2003', '11', 'Male', '13/11-12', 'A0013', '1', 'Azad', 'Camille Kniffen', '', ''),
(14, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Lavette Ritacco', '10/05/2005', '9', 'Female', '14/09-08', 'A0014', '4', 'Bhagath', 'Maybell Brannum', '', ''),
(15, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Bobby Yarber', '23/02/2009', '5', 'Male', '15/09-10', 'A0015', '10', 'Azad', 'Adelle Stmartin', '', ''),
(16, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Adelle Stmartin', '19/09/2006', '8', 'Female', '16/09-10', 'A0016', '7', 'Vivek', 'Lavette Ritacco', '', ''),
(17, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Yolando Lightcap', '24/05/2008', '6', 'Female', '17/09-08', 'A0017', '4', 'Azad', '', 'Kacy Klingbeil', ''),
(18, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Adina Ridgeway', '06/08/2009', '5', 'Female', '18/09-08', 'A0018', '5', 'Azad', 'Carolann Kies', '', ''),
(19, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Teofila Nickens', '12/07/2008', '6', 'Male', '19/11-12', 'A0019', '1', 'Azad', '', 'Yessenia Raposo', 'Wally Rains'),
(20, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jarod Pittmon', '14/05/2000', '14', 'Male', '20/09-10', 'A0020', '1', 'Bhagath', 'Sondra Bevis', '', ''),
(21, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Haydee Maranto', '20/02/2007', '7', 'Female', '21/10-11', 'A0021', '4', 'Subhash', '', 'Dalene Fritz', 'Hastin Modi'),
(22, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Brianna Oxford', '12/02/1998', '16', 'Male', '22/09-08', 'A0022', '1', 'Bhagath', '', 'Francis Lamkin', ''),
(23, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Patsy Paras', '10/11/2008', '6', 'Female', '23/13-14', 'A0023', '4', 'Subhash', '', 'Maybell Brannum', ''),
(24, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Chauncey Devlin', '10/12/2008', '6', 'Female', '24/14-15', 'A0024', '1', 'Subhash', '', 'Voncile Davids', ''),
(25, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Cristin Sutter', '28/04/2000', '14', 'Male', '25/09-08', 'A0025', '8', 'Bhagath', 'Porsche Lunn', '', 'Jacinto Gangestad'),
(26, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jacinto Gangestad', '19/07/2000', '14', 'Male', '26/11-12', 'A0026', '1', 'Subhash', 'Joaquina Paulino', '', 'Deon Woltz'),
(27, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kristie Luna', '27/05/2005', '9', 'Male', '27/13-14', 'A0027', '7', 'Azad', '', 'Karla Pierce', 'Katheryn Monteleone'),
(28, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Son Orourke', '23/11/2000', '14', 'Female', '28/11-12', 'A0028', '5', 'Vivek', 'Bud Bartolomeo', '', 'Lenna Kopecky'),
(29, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Ramonita Bardsley', '22/08/2000', '14', 'Male', '29/11-12', 'A0029', '6', 'Bhagath', 'Aurora Fichter', '', ''),
(30, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Evie Mabrey', '15/09/2004', '10', 'Male', '30/13-14', 'A0030', '10', 'Vivek', 'Jamal Haugen', '', ''),
(31, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Bud Bartolomeo', '05/06/2004', '10', 'Male', '31/13-14', 'A0031', '3', 'Bhagath', 'Cristin Sutter', '', 'Keiko Santiago'),
(32, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Wallace Gallion', '16/07/1999', '15', 'Female', '32/14-15', 'A0032', '10', 'Subhash', 'Jimmie Flannery', '', ''),
(33, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Arminda Collington', '12/04/2001', '13', 'Female', '33/11-12', 'A0033', '7', 'Vivek', 'Christal Delrosario', '', ''),
(34, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Maybell Brannum', '15/07/2004', '10', 'Male', '34/13-14', 'A0034', '10', 'Azad', '', 'Norene Ginsburg', 'Stasia Rapier'),
(35, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Cecily Burr', '10/10/2001', '13', 'Female', '35/14-15', 'A0035', '9', 'Azad', 'Dwain Klingbeil', '', 'Peter Atherton'),
(36, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Lupita Kilbourn', '03/03/2000', '14', 'Female', '36/11-12', 'A0036', '7', 'Azad', '', 'Norene Ginsburg', ''),
(37, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Amy Macarthur', '26/11/2006', '8', 'Female', '37/10-11', 'A0037', '3', 'Bhagath', '', 'Teofila Nickens', ''),
(38, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Sari Pouncy', '02/08/2009', '5', 'Male', '38/13-14', 'A0038', '9', 'Subhash', 'Olga Hayashi', '', ''),
(39, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Adena Ricken', '22/05/1998', '16', 'Female', '39/09-10', 'A0039', '10', 'Bhagath', 'Gwenn Balch', '', ''),
(40, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Camille Kniffen', '23/06/2005', '9', 'Female', '40/11-12', 'A0040', '9', 'Subhash', 'Jimmie Flannery', '', ''),
(41, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Talisha Clothier', '28/09/2003', '11', 'Female', '41/09-08', 'A0041', '9', 'Vivek', 'Selene Thayer', '', ''),
(42, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Narcisa Mcsween', '27/01/2003', '11', 'Female', '42/09-10', 'A0042', '3', 'Vivek', '', 'Jannette Ellinger', ''),
(43, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Monet Prioleau', '27/06/2003', '11', 'Male', '43/14-15', 'A0043', '2', 'Azad', '', 'Ardelia Elias', ''),
(44, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Quiana Heacock', '20/04/1998', '16', 'Male', '44/10-11', 'A0044', '3', 'Subhash', '', 'Marla Theurer', 'Yessenia Raposo'),
(45, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Katheryn Monteleone', '23/11/2001', '13', 'Female', '45/10-11', 'A0045', '9', 'Vivek', '', 'Stasia Rapier', 'Tamal Pathak'),
(46, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Halley Shima', '17/02/2000', '14', 'Female', '46/14-15', 'A0046', '4', 'Azad', 'Sherrill Rudisill', '', 'Dhenuka Bhandari'),
(47, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Larraine Valone', '27/08/1999', '15', 'Female', '47/11-12', 'A0047', '1', 'Bhagath', '', 'Stasia Rapier', ''),
(48, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kacy Klingbeil', '27/12/2009', '5', 'Female', '48/10-11', 'A0048', '2', 'Subhash', 'Adelle Stmartin', '', 'Simona Furlong'),
(49, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Johnathon Towns', '15/03/2003', '11', 'Female', '49/09-10', 'A0049', '6', 'Azad', 'Antionette Zalewski', '', 'Haydee Maranto'),
(50, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dasa Balakrishnan', '27/08/2009', '5', 'Female', '50/10-11', 'A0050', '7', 'Vivek', 'Errol Callihan', '', ''),
(51, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Porsche Lunn', '12/03/2009', '5', 'Male', '51/10-11', 'A0051', '8', 'Subhash', '', 'Lupita Kilbourn', ''),
(52, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Alan Causey', '16/02/2006', '8', 'Male', '52/09-08', 'A0052', '2', 'Subhash', 'Lorriane Koontz', '', ''),
(53, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Lenna Kopecky', '26/08/2000', '14', 'Female', '53/10-11', 'A0053', '5', 'Azad', 'Benedict Teasdale', '', 'Gwenn Balch'),
(54, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Joaquina Paulino', '03/01/2004', '10', 'Male', '54/14-15', 'A0054', '9', 'Azad', '', 'Narcisa Mcsween', ''),
(55, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Valentina Belmont', '01/08/1998', '16', 'Female', '55/09-08', 'A0055', '10', 'Azad', '', 'Kristie Luna', 'Loan Alongi'),
(56, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Vivienne Kuchta', '03/09/2003', '11', 'Female', '56/09-10', 'A0056', '6', 'Azad', '', 'Holly Squires', 'Danica Cable'),
(57, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Alena Girton', '27/03/2006', '8', 'Male', '57/09-08', 'A0057', '4', 'Azad', '', 'May Metheny', ''),
(58, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Eboni Falkowski', '04/02/1999', '15', 'Female', '58/09-08', 'A0058', '5', 'Azad', 'Jamal Haugen', '', ''),
(59, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Julius Weide', '27/02/2003', '11', 'Male', '59/09-10', 'A0059', '6', 'Azad', 'Narcisa Mcsween', '', 'Vivienne Kuchta'),
(60, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Carolann Kies', '10/10/2006', '8', 'Female', '60/10-11', 'A0060', '6', 'Azad', 'Danica Cable', '', ''),
(61, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Winnifred Lehmkuhl', '22/01/1999', '15', 'Female', '61/14-15', 'A0061', '1', 'Subhash', 'Joaquina Paulino', '', 'Arturo Baxter'),
(62, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Danica Cable', '28/02/2001', '13', 'Male', '62/09-08', 'A0062', '8', 'Subhash', '', 'Florencia Schurman', 'Tasha Mondy'),
(63, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jaclyn Fernando', '18/12/2008', '6', 'Male', '63/09-10', 'A0063', '6', 'Vivek', '', 'Frankie Hartfield', ''),
(64, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'May Metheny', '09/08/2001', '13', 'Female', '64/14-15', 'A0064', '6', 'Azad', 'Davis Stump', '', 'Marianela Scianna'),
(65, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Marianela Scianna', '05/12/2000', '14', 'Female', '65/09-10', 'A0065', '3', 'Bhagath', '', 'Katheryn Monteleone', ''),
(66, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Derick Pinckard', '13/06/2008', '6', 'Female', '66/14-15', 'A0066', '9', 'Vivek', '', 'Valentina Belmont', 'Cristin Sutter'),
(67, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Marla Theurer', '06/06/2004', '10', 'Female', '67/10-11', 'A0067', '1', 'Subhash', 'Yessenia Raposo', '', ''),
(68, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Mathew Basch', '11/10/2008', '6', 'Female', '68/14-15', 'A0068', '7', 'Subhash', '', 'Ariana Newbill', ''),
(69, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Deon Woltz', '21/09/2001', '13', 'Female', '69/09-10', 'A0069', '2', 'Bhagath', 'Jaclyn Fernando', '', ''),
(70, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Daron Byrns', '24/09/2005', '9', 'Male', '70/09-10', 'A0070', '4', 'Vivek', 'Priscila Bailes', '', ''),
(71, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kritanta Shah', '22/12/2007', '7', 'Female', '71/10-11', 'A0071', '1', 'Subhash', 'Patsy Paras', '', ''),
(72, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jamal Haugen', '08/09/2001', '13', 'Female', '72/09-08', 'A0072', '7', 'Subhash', '', 'Bonita Crittendon', ''),
(73, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Isabella Morriss', '12/10/2000', '14', 'Female', '73/13-14', 'A0073', '7', 'Azad', '', 'Tressie Crews', 'Tressie Crews'),
(74, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Karla Pierce', '10/11/2002', '12', 'Female', '74/14-15', 'A0074', '3', 'Azad', '', 'Marianela Scianna', ''),
(75, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Hillary Petrella', '14/12/1999', '15', 'Male', '75/14-15', 'A0075', '3', 'Subhash', 'Marianela Scianna', '', 'Amada Matis'),
(76, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Selene Thayer', '14/12/2009', '5', 'Female', '76/09-08', 'A0076', '2', 'Vivek', 'Adina Ridgeway', '', 'Shondra Andrada'),
(77, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Sondra Bevis', '08/03/1998', '16', 'Female', '77/14-15', 'A0077', '3', 'Subhash', 'Marla Theurer', '', 'Hillary Petrella'),
(78, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Olene Hauck', '02/02/2003', '11', 'Female', '78/13-14', 'A0078', '2', 'Vivek', 'Yessenia Raposo', '', ''),
(79, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Ariana Newbill', '28/05/2001', '13', 'Female', '79/14-15', 'A0079', '6', 'Subhash', 'Peter Atherton', '', ''),
(80, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Hien Mule', '06/09/2008', '6', 'Male', '80/09-10', 'A0080', '5', 'Azad', 'Kay Lintner', '', 'Olene Hauck'),
(81, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Sherrill Rudisill', '17/08/2008', '6', 'Male', '81/14-15', 'A0081', '1', 'Vivek', '', 'Peter Atherton', 'Halley Shima'),
(82, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Mandi Mcaninch', '22/11/2005', '9', 'Male', '82/09-08', 'A0082', '6', 'Vivek', 'Christal Delrosario', '', ''),
(83, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Russel Fahnestock', '19/12/2002', '12', 'Female', '83/09-08', 'A0083', '2', 'Bhagath', 'Deon Woltz', '', ''),
(84, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Errol Callihan', '08/08/2007', '7', 'Male', '84/09-10', 'A0084', '8', 'Bhagath', 'Priscila Bailes', '', 'Kritanta Shah'),
(85, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Florencia Schurman', '12/07/2002', '12', 'Male', '85/10-11', 'A0085', '8', 'Subhash', 'Patricia Welsh', '', ''),
(86, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tressie Crews', '16/04/2002', '12', 'Female', '86/09-10', 'A0086', '4', 'Subhash', '', 'Winnifred Lehmkuhl', 'Kacy Klingbeil'),
(87, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Aurora Fichter', '25/03/2008', '6', 'Male', '87/11-12', 'A0087', '6', 'Bhagath', 'Monet Prioleau', '', 'Phil Higuchi'),
(88, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Otto Both', '14/05/2005', '9', 'Male', '88/14-15', 'A0088', '2', 'Subhash', '', 'Isabella Morriss', 'Lorrine Mayeda'),
(89, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Shavonne Bradly', '13/03/2006', '8', 'Female', '89/09-08', 'A0089', '9', 'Vivek', 'Kacy Klingbeil', '', ''),
(90, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Thresa Fowles', '12/08/2009', '5', 'Female', '90/10-11', 'A0090', '2', 'Bhagath', 'Tabatha Bale', '', 'Bobby Yarber'),
(91, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dasras Murthy', '28/11/2008', '6', 'Female', '91/11-12', 'A0091', '2', 'Subhash', '', 'Jeromy Faulkner', ''),
(92, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jannette Ellinger', '09/03/1998', '16', 'Female', '92/11-12', 'A0092', '2', 'Bhagath', '', 'Shandra Craner', 'Amish Gire'),
(93, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tena Charest', '09/07/1999', '15', 'Female', '93/10-11', 'A0093', '9', 'Subhash', '', 'Daron Byrns', ''),
(94, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Shawanna Mcmahan', '25/10/2009', '5', 'Female', '94/09-10', 'A0094', '9', 'Azad', 'Loan Alongi', '', 'Teofila Nickens'),
(95, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Holly Squires', '02/02/1998', '16', 'Male', '95/10-11', 'A0095', '4', 'Vivek', 'Phil Higuchi', '', ''),
(96, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Verdell Lingerfelt', '13/05/2003', '11', 'Male', '96/09-10', 'A0096', '5', 'Subhash', '', 'Amish Gire', ''),
(97, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Gwenn Balch', '20/02/2007', '7', 'Female', '97/11-12', 'A0097', '3', 'Subhash', '', 'Graham Velarde', ''),
(98, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tamal Pathak', '13/10/2000', '14', 'Female', '98/09-10', 'A0098', '6', 'Azad', '', 'Olene Hauck', ''),
(99, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Regan Weller', '28/03/2001', '13', 'Male', '99/11-12', 'A0099', '7', 'Vivek', '', 'Halley Shima', 'Johnathon Towns'),
(100, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dhenuka Bhandari', '21/07/2002', '12', 'Male', '100/09-08', 'A0100', '7', 'Bhagath', '', 'Julee Woodring', ''),
(101, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Phil Higuchi', '25/01/2002', '12', 'Male', '101/10-11', 'A0101', '8', 'Azad', '', 'Oda Pinon', 'Priscila Bailes'),
(102, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Ardelia Elias', '20/03/2005', '9', 'Female', '102/11-12', 'A0102', '2', 'Vivek', '', 'Sondra Bevis', ''),
(103, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Delorse Sievers', '16/12/2009', '5', 'Female', '103/14-15', 'A0103', '7', 'Subhash', '', 'Peter Atherton', ''),
(104, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Odell Warburton', '11/05/2002', '12', 'Male', '104/09-10', 'A0104', '7', 'Azad', 'Bud Bartolomeo', '', ''),
(105, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Francis Lamkin', '12/06/1998', '16', 'Female', '105/09-10', 'A0105', '2', 'Bhagath', '', 'Gaylord Atienza', ''),
(106, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Julee Woodring', '05/02/1998', '16', 'Female', '106/09-08', 'A0106', '9', 'Bhagath', 'Lorrine Mayeda', '', ''),
(107, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Priscila Bailes', '17/01/2005', '9', 'Male', '107/13-14', 'A0107', '2', 'Subhash', 'Arturo Baxter', '', 'Shawanna Mcmahan'),
(108, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dusti Mazzola', '16/12/2004', '10', 'Male', '108/10-11', 'A0108', '8', 'Azad', 'Larraine Valone', '', ''),
(109, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Vernell Ekhoff', '07/07/2003', '11', 'Female', '109/11-12', 'A0109', '9', 'Vivek', '', 'Otto Both', ''),
(110, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jimmie Flannery', '01/12/2009', '5', 'Male', '110/13-14', 'A0110', '1', 'Vivek', 'Phil Higuchi', '', ''),
(111, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Eilene Gerstein', '17/09/1998', '16', 'Male', '111/10-11', 'A0111', '3', 'Vivek', '', 'Carolann Kies', ''),
(112, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Simona Furlong', '14/01/2004', '10', 'Male', '112/10-11', 'A0112', '7', 'Azad', '', 'Katheryn Monteleone', 'Graham Velarde'),
(113, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dwayne Lefebre', '14/06/2004', '10', 'Male', '113/13-14', 'A0113', '10', 'Subhash', 'Holly Squires', '', ''),
(114, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kirstin Dineen', '05/11/2009', '5', 'Female', '114/14-15', 'A0114', '4', 'Vivek', 'Aurora Fichter', '', 'Oda Pinon'),
(115, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Oda Pinon', '06/10/2006', '8', 'Female', '115/11-12', 'A0115', '10', 'Subhash', 'Julee Woodring', '', 'Arminda Collington'),
(116, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Alene Vinton', '28/02/1999', '15', 'Female', '116/11-12', 'A0116', '2', 'Azad', '', 'Gaylord Atienza', ''),
(117, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Benedict Teasdale', '02/05/2007', '7', 'Male', '117/13-14', 'A0117', '2', 'Azad', '', 'Wally Rains', ''),
(118, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dalene Fritz', '22/03/1998', '16', 'Male', '118/14-15', 'A0118', '6', 'Vivek', 'Delorse Sievers', '', ''),
(119, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Dwain Klingbeil', '15/08/1998', '16', 'Female', '119/11-12', 'A0119', '2', 'Vivek', 'Odell Warburton', '', ''),
(120, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tabatha Bale', '26/01/1999', '15', 'Female', '120/09-10', 'A0120', '6', 'Azad', '', 'Julius Weide', ''),
(121, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Olga Hayashi', '08/04/2001', '13', 'Female', '121/13-14', 'A0121', '4', 'Subhash', '', 'Valentina Belmont', 'Mandi Mcaninch'),
(122, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Indra Hayer', '09/10/2007', '7', 'Female', '122/09-08', 'A0122', '2', 'Azad', '', 'Wallace Gallion', 'Dwain Klingbeil'),
(123, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Amada Matis', '07/04/2003', '11', 'Female', '123/14-15', 'A0123', '8', 'Vivek', '', 'Jimmie Flannery', ''),
(124, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Norene Ginsburg', '25/05/1998', '16', 'Male', '124/09-08', 'A0124', '10', 'Azad', 'Otto Both', '', ''),
(125, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Yessenia Raposo', '14/04/2009', '5', 'Male', '125/09-10', 'A0125', '2', 'Subhash', 'Marla Theurer', '', 'Amada Matis'),
(126, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Myrl Chenard', '05/06/2002', '12', 'Male', '126/09-10', 'A0126', '8', 'Bhagath', 'Karla Pierce', '', ''),
(127, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Deangelo Brecht', '21/05/2008', '6', 'Female', '127/10-11', 'A0127', '6', 'Subhash', '', 'Tasha Mondy', 'Adina Ridgeway'),
(128, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Velda Sitzes', '18/10/2001', '13', 'Female', '128/09-10', 'A0128', '10', 'Vivek', 'Mandi Mcaninch', '', ''),
(129, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Tyron Hostetter', '01/11/2006', '8', 'Female', '129/13-14', 'A0129', '8', 'Azad', 'Karla Pierce', '', 'Verdell Lingerfelt'),
(130, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Shandra Craner', '08/09/2007', '7', 'Male', '130/11-12', 'A0130', '7', 'Bhagath', 'Arturo Baxter', '', 'Monet Prioleau'),
(131, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Ranae Maly', '01/12/2009', '5', 'Male', '131/11-12', 'A0131', '1', 'Bhagath', '', 'Monet Prioleau', 'Deangelo Brecht'),
(132, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Shondra Andrada', '15/04/2004', '10', 'Male', '132/11-12', 'A0132', '4', 'Bhagath', '', 'Alene Vinton', ''),
(133, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Mesha Mukhopadhyay', '08/12/2003', '11', 'Male', '133/10-11', 'A0133', '1', 'Bhagath', 'Ariana Newbill', '', 'Ramonita Bardsley'),
(134, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Quinn Verhoeven', '03/06/1998', '16', 'Female', '134/09-10', 'A0134', '8', 'Vivek', '', 'Johnathon Towns', ''),
(135, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jen Nath', '08/03/2007', '7', 'Male', '135/11-12', 'A0135', '6', 'Vivek', '', 'Amy Macarthur', 'Benedict Teasdale'),
(136, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Kori Fiqueroa', '22/08/2006', '8', 'Male', '136/09-10', 'A0136', '9', 'Bhagath', 'Judy Bran', '', ''),
(137, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Keiko Santiago', '06/03/2005', '9', 'Female', '137/11-12', 'A0137', '1', 'Bhagath', 'Dusti Mazzola', '', ''),
(138, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Gaylord Atienza', '02/05/2006', '8', 'Female', '138/14-15', 'A0138', '8', 'Vivek', 'Patsy Paras', '', ''),
(139, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Graham Velarde', '18/12/2001', '13', 'Male', '139/11-12', 'A0139', '1', 'Vivek', 'Adina Ridgeway', '', ''),
(140, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Alessandra Shewmaker', '08/04/2006', '8', 'Male', '140/09-10', 'A0140', '4', 'Azad', '', 'Alene Vinton', ''),
(141, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Lorriane Koontz', '22/02/2004', '10', 'Female', '141/13-14', 'A0141', '7', 'Bhagath', '', 'Kacy Klingbeil', ''),
(142, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Chantell Gathers', '15/02/2005', '9', 'Male', '142/14-15', 'A0142', '5', 'Azad', 'Amy Macarthur', '', 'Talisha Clothier'),
(143, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Frankie Hartfield', '24/05/2004', '10', 'Male', '143/09-10', 'A0143', '9', 'Vivek', '', 'Julee Woodring', ''),
(144, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Toby Lebowitz', '03/07/2002', '12', 'Male', '144/09-10', 'A0144', '6', 'Subhash', '', 'Maybell Brannum', 'Terisa Klapp'),
(145, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Louise Muszynski', '23/03/2006', '8', 'Female', '145/14-15', 'A0145', '10', 'Bhagath', 'Isabella Morriss', '', ''),
(146, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Peter Atherton', '22/07/2003', '11', 'Male', '146/09-10', 'A0146', '2', 'Azad', '', 'Benedict Teasdale', 'Julius Weide'),
(147, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Davis Stump', '05/03/1999', '15', 'Female', '147/09-08', 'A0147', '2', 'Vivek', '', 'Simona Furlong', ''),
(148, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Madonna Foret', '24/12/2001', '13', 'Male', '148/13-14', 'A0148', '3', 'Subhash', 'Hien Mule', '', ''),
(149, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Jeromy Faulkner', '06/06/2000', '14', 'Male', '149/11-12', 'A0149', '7', 'Bhagath', 'Alessandra Shewmaker', '', 'Eboni Falkowski'),
(150, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Lorrine Mayeda', '07/08/2001', '13', 'Female', '150/11-12', 'A0150', '4', 'Bhagath', '', 'Jaclyn Fernando', 'Zenaida Dicicco'),
(151, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Hastin Modi', '27/11/2000', '14', 'Male', '151/09-10', 'A0151', '7', 'Bhagath', '', 'Katheryn Monteleone', ''),
(152, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Wally Rains', '06/05/2003', '11', 'Male', '152/14-15', 'A0152', '9', 'Azad', 'Tabatha Bale', '', ''),
(153, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Antionette Zalewski', '15/05/2001', '13', 'Female', '153/14-15', 'A0153', '9', 'Subhash', '', 'Tabatha Bale', 'Frankie Hartfield'),
(154, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Joellen Dalman', '20/10/2004', '10', 'Female', '154/14-15', 'A0154', '5', 'Subhash', 'Sari Pouncy', '', 'Isabella Morriss'),
(155, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Mahakala Mallick', '17/06/2000', '14', 'Female', '155/09-10', 'A0155', '5', 'Bhagath', '', 'Myrl Chenard', 'Patricia Welsh'),
(156, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Arturo Baxter', '15/10/2004', '10', 'Female', '156/09-10', 'A0156', '5', 'Subhash', '', 'Christal Delrosario', ''),
(157, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Voncile Davids', '07/06/2004', '10', 'Female', '157/13-14', 'A0157', '4', 'Vivek', 'Bud Bartolomeo', '', ''),
(158, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Christal Delrosario', '13/09/2004', '10', 'Female', '158/10-11', 'A0158', '2', 'Subhash', '', 'Brianna Oxford', ''),
(159, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Arianne Escudero', '06/05/2009', '5', 'Male', '159/13-14', 'A0159', '3', 'Azad', '', 'Toby Lebowitz', 'Verdell Lingerfelt'),
(160, '', 40, '2014-05-04 18:44:36', '0000-00-00 00:00:00', 'Terisa Klapp', '20/01/2005', '9', 'Male', '160/11-12', 'A0160', '2', 'Azad', '', 'Yolando Lightcap', 'Tabatha Bale');

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
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1399170934, ''),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1399170934, ''),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1399170934, '');

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
(5, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', '', ''),
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
(19, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', '', ''),
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
(30, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', '', ''),
(31, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', '', ''),
(32, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', '', ''),
(33, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', '', ''),
(34, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', '', ''),
(35, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', '', ''),
(36, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', '', ''),
(37, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', '', ''),
(38, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', '', ''),
(39, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.2.0.6', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', '', ''),
(40, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', '', ''),
(41, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', '', ''),
(42, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', '', ''),
(43, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.2.3.3', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', '', ''),
(44, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', '', ''),
(45, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.2.3.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', '', ''),
(46, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.2.3.2', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', '', ''),
(47, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.2.1.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', '', ''),
(48, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.3.0.1', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', '', ''),
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `ek5d2_user_keys`
--

INSERT INTO `ek5d2_user_keys` (`id`, `user_id`, `token`, `series`, `invalid`, `time`, `uastring`) VALUES
(3, 'arvind', '$P$DO5LgOlQHDhJmEAHs2RDPdJHgUR1K71', '5JjAU5EqPPsOLmBnxEgS', 0, '1404144299', '182632cbdd1707b48a338f2002e830a7'),
(4, 'arvind', '$P$Dl5QdDgUr9XCWzsqtvZwZXQzocsQYs0', '7lhwAAES2xSKTXOfUN0o', 0, '1404217009', '8d5e6c037655b5c6fe3a6607b8667621'),
(5, 'arvind', '$P$D89SI27nsYGYrLUJSJsdzOadetKuAT0', 'eBjbRtX5xF2bg7v6S9of', 0, '1404277990', '87ee68311f30a12059030769698a9518'),
(6, 'arvind', '$P$DynCAt9ga74iagetyjYl0eTdjC/aMd/', 'jJSZxAiPS1ZRAHj5CiAA', 0, '1404299233', '0fe98ce63d11a47ae17b3dd228652a71');

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
(37, 'Super User', 'webadmin', 'arvindpdmn@gmail.com', '$P$DayMKCjvSNqXzbatwx1Nb59YbEiDOq/', 0, 1, '2014-04-29 15:26:07', '2014-05-04 02:35:27', '0', '', '0000-00-00 00:00:00', 0, '', ''),
(40, 'arvind', 'arvind', 'arvindpdmn@ov.com', '$P$D6CcnNttxcRBecoH15AeFprf/2gbWn1', 0, 0, '2014-05-01 06:43:50', '2014-05-04 09:20:38', '', '{}', '0000-00-00 00:00:00', 0, '', '');

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
