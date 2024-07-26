-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 26, 2024 at 12:20 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbcoreframework_8231aa`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT (NULL),
  `type` varchar(255) DEFAULT (NULL),
  `label` varchar(255) DEFAULT (NULL),
  `citizenid` varchar(11) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(2, 'apartment54443', 'apartment5', 'Fantastic Plaza 4443', 'MYL11018'),
(3, 'apartment51024', 'apartment4', 'Tinsel Towers', 'ZSR82681'),
(4, 'apartment14371', 'apartment1', 'South Rockford Drive 4371', 'MDO58279'),
(6, 'apartment26160', 'apartment2', 'Morningwood Blvd 6160', 'ZNA26206'),
(7, 'apartment52749', 'apartment5', 'Fantastic Plaza', 'CYE23861'),
(8, 'apartment12755', 'apartment1', 'South Rockford Drive 2755', 'NHQ38420'),
(9, 'apartment28012', 'apartment2', 'Morningwood Blvd 8012', 'GOF52094'),
(10, 'apartment18264', 'apartment1', 'South Rockford Drive 8264', 'NQT87908'),
(11, 'apartment1548', 'apartment1', 'South Rockford Drive 548', 'MFK74931');

-- --------------------------------------------------------

--
-- Table structure for table `banking_users`
--

DROP TABLE IF EXISTS `banking_users`;
CREATE TABLE IF NOT EXISTS `banking_users` (
  `identifier` varchar(80) NOT NULL,
  `bank_number` varchar(8) NOT NULL,
  `last_transactions` longtext,
  `last_transfers` longtext,
  `stats` longtext,
  `totals` longtext,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `account_name` varchar(50) DEFAULT (NULL),
  `account_balance` int NOT NULL DEFAULT '0',
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT (_utf8mb4'[]'),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`) VALUES
(1, NULL, 'police', 0, 'job', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `account_name` varchar(50) DEFAULT (_utf8mb4'checking'),
  `amount` int DEFAULT (NULL),
  `reason` varchar(50) DEFAULT (NULL),
  `statement_type` enum('deposit','withdraw') DEFAULT (NULL),
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_statements`
--

INSERT INTO `bank_statements` (`id`, `citizenid`, `account_name`, `amount`, `reason`, `statement_type`, `date`) VALUES
(1, 'PJW24003', 'gays', 5000, 'Initial deposit', 'deposit', '2024-06-25 19:14:33'),
(2, 'PJW24003', 'checking', 5000, 'Initial deposit for gays', 'withdraw', '2024-06-25 19:14:33'),
(3, NULL, 'gays', 600, 'External Withdrawal', 'withdraw', '2024-06-25 19:16:41'),
(4, 'PJW24003', 'checking', 600, 'SPEEDING', 'deposit', '2024-06-25 19:16:41'),
(5, NULL, 'gays', 4000, 'External Withdrawal', 'withdraw', '2024-06-25 19:17:10'),
(6, 'PJW24003', 'checking', 4000, 'Internal transfer', 'deposit', '2024-06-25 19:17:10'),
(7, NULL, 'gays', 400, 'External Withdrawal', 'withdraw', '2024-06-25 19:17:44'),
(8, 'PJW24003', 'gays', 400, 'Bank Withdrawal', 'withdraw', '2024-06-25 19:17:44'),
(9, 'PJW24003', 'gays', 0, 'Initial deposit', 'deposit', '2024-06-25 19:18:15'),
(10, 'PJW24003', 'checking', 0, 'Initial deposit for gays', 'withdraw', '2024-06-25 19:18:15'),
(11, 'PJW24003', 'checking', 900, 'Bank Deposit', 'deposit', '2024-06-25 19:18:30'),
(12, 'ZSR82681', 'ran and me', 0, 'Initial deposit', 'deposit', '2024-06-29 12:32:46'),
(13, 'ZSR82681', 'checking', 0, 'Initial deposit for ran and me', 'withdraw', '2024-06-29 12:32:46'),
(14, NULL, 'ran and me', 2147483647, 'External Deposit', 'deposit', '2024-07-01 10:25:16'),
(15, 'ZSR82681', 'checking', 2147483647, 'Internal transfer', 'withdraw', '2024-07-01 10:25:16'),
(16, NULL, 'ran and me', 2147483647, 'External Withdrawal', 'withdraw', '2024-07-01 10:30:38'),
(17, 'CYE23861', 'ran and me', 2147483647, 'Bank Withdrawal', 'withdraw', '2024-07-01 10:30:38'),
(18, NULL, 'ran and me', 2147483647, 'External Withdrawal', 'withdraw', '2024-07-01 10:40:03'),
(19, 'CYE23861', 'ran and me', 2147483647, 'Bank Withdrawal', 'withdraw', '2024-07-01 10:40:03'),
(20, NULL, 'ran and me', 2147483647, 'External Withdrawal', 'withdraw', '2024-07-01 10:40:41'),
(21, 'CYE23861', 'ran and me', 2147483647, 'Bank Withdrawal', 'withdraw', '2024-07-01 10:40:41'),
(22, NULL, 'ran and me', 2147483647, 'External Withdrawal', 'withdraw', '2024-07-01 10:41:21'),
(23, 'CYE23861', 'ran and me', 2147483647, 'Bank Withdrawal', 'withdraw', '2024-07-01 10:41:21'),
(24, NULL, 'ran and me', 1000, 'External Deposit', 'deposit', '2024-07-02 16:04:40'),
(25, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:05:10'),
(26, NULL, 'ran and me', 100, 'External Deposit', 'deposit', '2024-07-02 16:05:46'),
(27, 'ZSR82681', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:07:13'),
(28, 'ZSR82681', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:07:24'),
(29, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:07:31'),
(30, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:07:40'),
(31, 'CYE23861', 'checking', 1000000000, 'Bank Deposit', 'deposit', '2024-07-02 16:07:49'),
(32, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:08:03'),
(33, 'CYE23861', 'checking', 100000000, 'Bank Deposit', 'deposit', '2024-07-02 16:08:19'),
(34, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:08:27'),
(35, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:08:36'),
(36, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:08:43'),
(37, 'CYE23861', 'checking', 100000000, 'Bank Deposit', 'deposit', '2024-07-02 16:08:49'),
(38, 'CYE23861', 'checking', 100000000, 'Bank Deposit', 'deposit', '2024-07-02 16:08:57'),
(39, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:09:06'),
(40, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:09:11'),
(41, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:09:20'),
(42, 'ZSR82681', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:09:58'),
(43, 'CYE23861', 'checking', 89815400, 'Bank Deposit', 'deposit', '2024-07-02 16:10:04'),
(44, 'CYE23861', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:10:21'),
(45, 'ZSR82681', 'checking', 2147483647, 'Bank Deposit', 'deposit', '2024-07-02 16:10:29'),
(46, 'CYE23861', 'checking', 1000, 'Bank Withdrawal', 'withdraw', '2024-07-04 11:14:26'),
(47, 'CYE23861', 'checking', 4000, 'Bank Withdrawal', 'withdraw', '2024-07-04 11:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT (NULL),
  `license` varchar(50) DEFAULT (NULL),
  `discord` varchar(50) DEFAULT (NULL),
  `ip` varchar(50) DEFAULT (NULL),
  `reason` text DEFAULT (NULL),
  `expire` int DEFAULT (NULL),
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

DROP TABLE IF EXISTS `crypto`;
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int NOT NULL DEFAULT '0',
  `history` text DEFAULT (NULL),
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 1033, '[{\"PreviousWorth\":1035,\"NewWorth\":1035},{\"PreviousWorth\":1035,\"NewWorth\":1035},{\"PreviousWorth\":1035,\"NewWorth\":1035},{\"NewWorth\":1033,\"PreviousWorth\":1035}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `title` varchar(50) DEFAULT (NULL),
  `message` varchar(50) DEFAULT (NULL),
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crypto_transactions`
--

INSERT INTO `crypto_transactions` (`id`, `citizenid`, `title`, `message`, `date`) VALUES
(1, 'ZSR82681', 'Credit', 'You have purchased 1000000000 Qbit(s)!', '2024-07-12 11:42:58'),
(2, 'ZSR82681', 'Debit', 'You have sold 100000000 Qbit(s)!', '2024-07-12 11:44:05'),
(3, 'ZSR82681', 'Debit', 'You have sold 90000000 Qbit(s)!', '2024-07-12 11:44:37'),
(4, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:05'),
(5, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:09'),
(6, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:12'),
(7, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:15'),
(8, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:18'),
(9, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:20'),
(10, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:23'),
(11, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:24'),
(12, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:26'),
(13, 'ZSR82681', 'Debit', 'You have sold 9000000 Qbit(s)!', '2024-07-12 11:45:28'),
(14, 'ZSR82681', 'Debit', 'You have sold 720000000 Qbit(s)!', '2024-07-12 11:45:44'),
(15, 'ZSR82681', 'Credit', 'You have purchased 1000000000000000 Qbit(s)!', '2024-07-15 08:30:08'),
(16, 'ZSR82681', 'Debit', 'You have sold 100000000000000 Qbit(s)!', '2024-07-15 08:30:46'),
(17, 'ZSR82681', 'Debit', 'You have sold 100000000000000 Qbit(s)!', '2024-07-15 08:30:50'),
(18, 'ZSR82681', 'Debit', 'You have sold 80000000000000 Qbit(s)!', '2024-07-15 08:31:05'),
(19, 'ZSR82681', 'Debit', 'You have sold 72000000000000 Qbit(s)!', '2024-07-15 08:31:16'),
(20, 'ZSR82681', 'Debit', 'You have sold 648000000000000 Qbit(s)!', '2024-07-15 08:31:51'),
(21, 'ZSR82681', 'Credit', 'You have purchased 2e+40 Qbit(s)!', '2024-07-15 08:33:02'),
(22, 'ZSR82681', 'Credit', 'You have purchased 1e+21 Qbit(s)!', '2024-07-15 08:34:43'),
(23, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:35'),
(24, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:42'),
(25, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:45'),
(26, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:50'),
(27, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:52'),
(28, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:54'),
(29, 'ZSR82681', 'Debit', 'You have sold 1e+21 Qbit(s)!', '2024-07-15 08:35:57'),
(30, 'ZSR82681', 'Debit', 'You have sold 2e+40 Qbit(s)!', '2024-07-15 08:38:18'),
(31, 'ZSR82681', 'Credit', 'You have purchased 1000000000000 Qbit(s)!', '2024-07-16 09:03:23'),
(32, 'ZSR82681', 'Credit', 'You have purchased 148.32082996 Qbit(s)!', '2024-07-16 09:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT (NULL),
  `time` longtext DEFAULT (NULL),
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dpkeybinds`
--

DROP TABLE IF EXISTS `dpkeybinds`;
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
('license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('license:42a8a9911830d96df94355c9a46092c0b34a80e3', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin`
--

DROP TABLE IF EXISTS `ethicalpixel_admin`;
CREATE TABLE IF NOT EXISTS `ethicalpixel_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `favorite` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  KEY `id` (`id`)
) ;

--
-- Dumping data for table `ethicalpixel_admin`
--

INSERT INTO `ethicalpixel_admin` (`id`, `cid`, `favorite`) VALUES
(4, 'WAC28700', '[{\"name\":\"changemodel\"},{\"name\":\"ban\"},{\"name\":\"bring\"},{\"name\":\"csay\"},{\"name\":\"fixvehicle\"},{\"name\":\"givecash\"},{\"name\":\"godmode\"},{\"name\":\"noclip\"},{\"name\":\"clothes\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin_banned`
--

DROP TABLE IF EXISTS `ethicalpixel_admin_banned`;
CREATE TABLE IF NOT EXISTS `ethicalpixel_admin_banned` (
  `id` int NOT NULL AUTO_INCREMENT,
  `steam` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `length` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `DisplayName` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ethicalpixel_admin_log`
--

DROP TABLE IF EXISTS `ethicalpixel_admin_log`;
CREATE TABLE IF NOT EXISTS `ethicalpixel_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Identifier` varchar(50) DEFAULT NULL,
  `log` longtext,
  `name` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `financedata`
--

DROP TABLE IF EXISTS `financedata`;
CREATE TABLE IF NOT EXISTS `financedata` (
  `identifier` varchar(64) DEFAULT NULL,
  `max` int DEFAULT NULL,
  `financed` longtext,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fireac_admin`
--

DROP TABLE IF EXISTS `fireac_admin`;
CREATE TABLE IF NOT EXISTS `fireac_admin` (
  `id` int NOT NULL DEFAULT '1',
  `identifier` longtext COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `fireac_banlist`
--

DROP TABLE IF EXISTS `fireac_banlist`;
CREATE TABLE IF NOT EXISTS `fireac_banlist` (
  `id` int NOT NULL DEFAULT '1',
  `STEAM` longtext COLLATE utf8mb3_bin NOT NULL,
  `DISCORD` longtext COLLATE utf8mb3_bin NOT NULL,
  `LICENSE` longtext COLLATE utf8mb3_bin NOT NULL,
  `LIVE` longtext COLLATE utf8mb3_bin NOT NULL,
  `XBL` longtext COLLATE utf8mb3_bin NOT NULL,
  `IP` longtext COLLATE utf8mb3_bin NOT NULL,
  `TOKENS` longtext COLLATE utf8mb3_bin NOT NULL,
  `BANID` longtext COLLATE utf8mb3_bin NOT NULL,
  `REASON` longtext COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `fireac_unban`
--

DROP TABLE IF EXISTS `fireac_unban`;
CREATE TABLE IF NOT EXISTS `fireac_unban` (
  `id` int NOT NULL DEFAULT '1',
  `identifier` longtext COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `fireac_whitelist`
--

DROP TABLE IF EXISTS `fireac_whitelist`;
CREATE TABLE IF NOT EXISTS `fireac_whitelist` (
  `id` int NOT NULL DEFAULT '1',
  `identifier` longtext COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

DROP TABLE IF EXISTS `gloveboxitems`;
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gloveboxitems`
--

INSERT INTO `gloveboxitems` (`id`, `plate`, `items`) VALUES
(16, '4KX336RJ', '[]'),
(17, '5AF207UP', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitemsnew`
--

DROP TABLE IF EXISTS `gloveboxitemsnew`;
CREATE TABLE IF NOT EXISTS `gloveboxitemsnew` (
  `id` int NOT NULL,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT (NULL),
  `label` varchar(255) DEFAULT (NULL),
  `coords` text DEFAULT (NULL),
  `owned` tinyint(1) DEFAULT (NULL),
  `price` int DEFAULT (NULL),
  `tier` tinyint DEFAULT (NULL),
  `garage` text DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT (NULL),
  `stage` int DEFAULT '1',
  `sort` varchar(50) DEFAULT (NULL),
  `gender` varchar(50) DEFAULT (NULL),
  `food` int DEFAULT '100',
  `health` int DEFAULT '100',
  `progress` int DEFAULT '0',
  `coords` text DEFAULT (NULL),
  `plantid` varchar(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT (NULL),
  `checkpoints` text DEFAULT (NULL),
  `records` text DEFAULT (NULL),
  `creator` varchar(50) DEFAULT (NULL),
  `distance` int DEFAULT (NULL),
  `raceid` varchar(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bolos`
--

DROP TABLE IF EXISTS `mdt_bolos`;
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text,
  `tags` text,
  `gallery` text,
  `officersinvolved` text,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bulletin`
--

DROP TABLE IF EXISTS `mdt_bulletin`;
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_clocking`
--

DROP TABLE IF EXISTS `mdt_clocking`;
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_time` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mdt_clocking`
--

INSERT INTO `mdt_clocking` (`id`, `user_id`, `firstname`, `lastname`, `clock_in_time`, `clock_out_time`, `total_time`) VALUES
(7, 'ZSR82681', 'Donald', 'Tramp', '2024-07-05 17:51:34', '2024-07-23 13:19:19', 1538865);

-- --------------------------------------------------------

--
-- Table structure for table `mdt_convictions`
--

DROP TABLE IF EXISTS `mdt_convictions`;
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int NOT NULL DEFAULT '0',
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `jailtime` int DEFAULT NULL,
  `fine` int DEFAULT NULL,
  `points` int DEFAULT NULL,
  `details` text,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_data`
--

DROP TABLE IF EXISTS `mdt_data`;
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) DEFAULT NULL,
  `information` mediumtext,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mdt_data`
--

INSERT INTO `mdt_data` (`id`, `cid`, `information`, `tags`, `gallery`, `jobtype`, `pfp`, `fingerprint`) VALUES
(1, 'PJW24003', '', '[]', '[]', 'police', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_impound`
--

DROP TABLE IF EXISTS `mdt_impound`;
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicleid` int NOT NULL,
  `linkedreport` int NOT NULL,
  `fee` int DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_incidents`
--

DROP TABLE IF EXISTS `mdt_incidents`;
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` longtext NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mdt_incidents`
--

INSERT INTO `mdt_incidents` (`id`, `author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES
(1, 'Donald Tramp', 'Name - killing - 7/15/2024', '\n      <div style=\"color: white;\">\n          <p><strong>📝 Summary:</strong></p>\n          <p><em>killed 3 pepole</em></p>\n          <p>&nbsp;</p>\n          <p><strong>🗄️ Evidence Location:</strong> Stash 1 | Drawer 3</p>\n          <p>&nbsp;</p>\n          <p><strong>🔪 Weapons/Items Confiscated:</strong></p>\n          <p><em>· pistol</em></p>\n          <p>&nbsp;</p>\n          <p>-----</p>\n          <p><strong style=\"background-color: var(--color-1);\">💸 Fine: 0</strong></p>\n          <p>&nbsp;</p>\n          <p><strong>⌚ Sentence: 500</strong></p>\n          <p>-----</p>\n      </div>\n  ', '[]', '[\"(221) Donald Tramp\"]', '[\"dav dav\"]', '[]', '1721034919135', 'police');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_logs`
--

DROP TABLE IF EXISTS `mdt_logs`;
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mdt_logs`
--

INSERT INTO `mdt_logs` (`id`, `text`, `time`, `jobtype`) VALUES
(1, 'A weapon with the serial number () failed to be added to the weapon information database by ddddddddddd dddddddddddd', '1719341622000', 'police'),
(2, 'ddddddddddd dddddddddddd tryed to delete a Weapon Info with the ID (1)', '1719341631000', 'police'),
(3, 'Bulletin with Title: undefined was deleted by ddddddddddd dddddddddddd.', '1719341673000', 'police'),
(4, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719342586000', 'police'),
(5, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719342594000', 'police'),
(6, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719342667000', 'police'),
(7, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719342672000', 'police'),
(8, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719343326000', 'police'),
(9, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $250. (ID: 0)', '1719343391000', 'police'),
(10, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $4. (ID: 0)', '1719343446000', 'police'),
(11, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $5675. (ID: 0)', '1719343520000', 'police'),
(12, 'A Fine was writen by (megafish) ddddddddddd dddddddddddd and was sent to ddddddddddd dddddddddddd, the Amount was $3. (ID: 0)', '1719343590000', 'police'),
(13, 'A Weapon Info was deleted by Donald Tramp with the ID (2)', '1719493477000', 'police'),
(14, 'A Fine was writen by (NO CALLSIGN) Donald Tramp and was sent to Ran Lampert, the Amount was $249. (ID: 0)', '1719580837000', 'police'),
(15, 'A Fine was writen by (NO CALLSIGN) Donald Tramp and was sent to Ran Lampert, the Amount was $250. (ID: 0)', '1719831893000', 'police'),
(16, 'Bulletin with Title: undefined was deleted by Donald Tramp.', '1720094941000', 'police');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text,
  `tags` text,
  `officersinvolved` text,
  `civsinvolved` text,
  `gallery` text,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_vehicleinfo`
--

DROP TABLE IF EXISTS `mdt_vehicleinfo`;
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL,
  `stolen` tinyint(1) NOT NULL DEFAULT '0',
  `code5` tinyint(1) NOT NULL DEFAULT '0',
  `image` text NOT NULL,
  `points` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_weaponinfo`
--

DROP TABLE IF EXISTS `mdt_weaponinfo`;
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL,
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mdt_weaponinfo`
--

INSERT INTO `mdt_weaponinfo` (`id`, `serial`, `owner`, `information`, `weapClass`, `weapModel`, `image`) VALUES
(1, '', '', '', '', 'pistol', 'img/not-found.webp');

-- --------------------------------------------------------

--
-- Table structure for table `movableshops`
--

DROP TABLE IF EXISTS `movableshops`;
CREATE TABLE IF NOT EXISTS `movableshops` (
  `identifier` varchar(100) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` longtext,
  `items` longtext,
  `plate` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `shopname` varchar(64) DEFAULT NULL,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT (NULL),
  `price` int DEFAULT (NULL),
  `description` longtext DEFAULT (NULL),
  `plate` varchar(50) DEFAULT (NULL),
  `model` varchar(50) DEFAULT (NULL),
  `mods` text DEFAULT (NULL),
  `occasionid` varchar(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ox_inventory`
--

DROP TABLE IF EXISTS `ox_inventory`;
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext,
  `lastupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_accounts`
--

DROP TABLE IF EXISTS `pefcl_accounts`;
CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT '0',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int DEFAULT '25000',
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pefcl_accounts`
--

INSERT INTO `pefcl_accounts` (`id`, `number`, `accountName`, `isDefault`, `ownerIdentifier`, `role`, `balance`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, '920,4351-1832-1445', 'Personal account', 1, 'ZSR82681', 'owner', -2147483378, 'personal', '2024-07-12 19:42:49', '2024-07-23 10:16:53', NULL),
(2, '920,8813-0601-0412', 'Los Santos Police', 1, 'police', 'owner', 500, 'shared', '2024-07-12 19:42:49', '2024-07-12 19:42:49', NULL),
(3, '920,1587-1700-2105', 'Personal account', 1, 'NQT87908', 'owner', 5000, 'personal', '2024-07-14 11:17:38', '2024-07-14 11:17:38', NULL),
(4, '920,8727-2547-0607', 'Personal account', 1, 'MFK74931', 'owner', 5075, 'personal', '2024-07-15 08:43:49', '2024-07-15 09:02:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_cash`
--

DROP TABLE IF EXISTS `pefcl_cash`;
CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int DEFAULT '2000',
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_external_accounts`
--

DROP TABLE IF EXISTS `pefcl_external_accounts`;
CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_invoices`
--

DROP TABLE IF EXISTS `pefcl_invoices`;
CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT '0',
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_shared_accounts`
--

DROP TABLE IF EXISTS `pefcl_shared_accounts`;
CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pefcl_shared_accounts`
--

INSERT INTO `pefcl_shared_accounts` (`id`, `userIdentifier`, `name`, `role`, `createdAt`, `updatedAt`, `deletedAt`, `accountId`) VALUES
(1, 'ZSR82681', 'Donald Tramp', 'admin', '2024-07-12 19:42:49', '2024-07-12 19:42:49', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pefcl_transactions`
--

DROP TABLE IF EXISTS `pefcl_transactions`;
CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT '0',
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int DEFAULT NULL,
  `fromAccountId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pefcl_transactions`
--

INSERT INTO `pefcl_transactions` (`id`, `message`, `amount`, `type`, `createdAt`, `updatedAt`, `toAccountId`, `fromAccountId`) VALUES
(1, 'lspd-fine #1', 250, 'Outgoing', '2024-07-12 19:47:54', '2024-07-12 19:47:54', NULL, 1),
(2, 'lspd-fine #2', 250, 'Outgoing', '2024-07-12 19:48:27', '2024-07-12 19:48:27', NULL, 1),
(3, 'paycheck #3', 150, 'Incoming', '2024-07-14 10:29:25', '2024-07-14 10:29:25', 1, NULL),
(4, 'paycheck #4', 150, 'Incoming', '2024-07-14 10:44:13', '2024-07-14 10:44:13', 1, NULL),
(5, 'lspd-fine #5', 200, 'Outgoing', '2024-07-15 07:50:04', '2024-07-15 07:50:04', NULL, 1),
(6, 'lspd-fine #6', 200, 'Outgoing', '2024-07-15 07:50:18', '2024-07-15 07:50:18', NULL, 1),
(7, 'paycheck #7', 150, 'Incoming', '2024-07-15 07:52:42', '2024-07-15 07:52:42', 1, NULL),
(8, 'paycheck #8', 150, 'Incoming', '2024-07-15 08:02:42', '2024-07-15 08:02:42', 1, NULL),
(9, 'paycheck #9', 150, 'Incoming', '2024-07-15 08:12:42', '2024-07-15 08:12:42', 1, NULL),
(10, 'paycheck #10', 150, 'Incoming', '2024-07-15 08:22:42', '2024-07-15 08:22:42', 1, NULL),
(11, 'bought crypto #11', 2147483647, 'Outgoing', '2024-07-15 08:30:08', '2024-07-15 08:30:08', NULL, 1),
(12, 'sold crypto #12', 2147483647, 'Incoming', '2024-07-15 08:30:46', '2024-07-15 08:30:46', 1, NULL),
(13, 'sold crypto #13', 2147483647, 'Incoming', '2024-07-15 08:30:50', '2024-07-15 08:30:50', 1, NULL),
(14, 'sold crypto #14', 2147483647, 'Incoming', '2024-07-15 08:31:05', '2024-07-15 08:31:05', 1, NULL),
(15, 'sold crypto #15', 2147483647, 'Incoming', '2024-07-15 08:31:16', '2024-07-15 08:31:16', 1, NULL),
(16, 'sold crypto #16', 2147483647, 'Incoming', '2024-07-15 08:31:51', '2024-07-15 08:31:51', 1, NULL),
(17, 'paycheck #17', 150, 'Incoming', '2024-07-15 08:32:42', '2024-07-15 08:32:42', 1, NULL),
(18, 'bought crypto #18', 2147483647, 'Outgoing', '2024-07-15 08:33:02', '2024-07-15 08:33:02', NULL, 1),
(19, 'bought crypto #19', 2147483647, 'Outgoing', '2024-07-15 08:34:43', '2024-07-15 08:34:43', NULL, 1),
(20, 'sold crypto #20', 2147483647, 'Incoming', '2024-07-15 08:35:35', '2024-07-15 08:35:35', 1, NULL),
(21, 'sold crypto #21', 2147483647, 'Incoming', '2024-07-15 08:35:42', '2024-07-15 08:35:42', 1, NULL),
(22, 'sold crypto #22', 2147483647, 'Incoming', '2024-07-15 08:35:45', '2024-07-15 08:35:45', 1, NULL),
(23, 'sold crypto #23', 2147483647, 'Incoming', '2024-07-15 08:35:50', '2024-07-15 08:35:50', 1, NULL),
(24, 'sold crypto #24', 2147483647, 'Incoming', '2024-07-15 08:35:52', '2024-07-15 08:35:52', 1, NULL),
(25, 'sold crypto #25', 2147483647, 'Incoming', '2024-07-15 08:35:54', '2024-07-15 08:35:54', 1, NULL),
(26, 'sold crypto #26', 2147483647, 'Incoming', '2024-07-15 08:35:57', '2024-07-15 08:35:57', 1, NULL),
(27, 'sold crypto #27', 2147483647, 'Incoming', '2024-07-15 08:38:18', '2024-07-15 08:38:18', 1, NULL),
(28, 'paycheck #28', 150, 'Incoming', '2024-07-15 08:42:42', '2024-07-15 08:42:42', 1, NULL),
(29, 'paycheck #29', 150, 'Incoming', '2024-07-15 08:52:42', '2024-07-15 08:52:42', 1, NULL),
(30, 'paycheck #30', 75, 'Incoming', '2024-07-15 09:02:42', '2024-07-15 09:02:42', 4, NULL),
(31, 'paycheck #31', 150, 'Incoming', '2024-07-15 09:02:42', '2024-07-15 09:02:42', 1, NULL),
(32, 'lspd-fine #32', 200, 'Outgoing', '2024-07-15 09:06:55', '2024-07-15 09:06:55', NULL, 1),
(33, 'paid-invoice #33', 5000, 'Outgoing', '2024-07-15 09:09:13', '2024-07-15 09:09:13', NULL, 1),
(34, 'paid-invoice #34', 5000, 'Outgoing', '2024-07-15 09:09:20', '2024-07-15 09:09:20', NULL, 1),
(35, 'paid-invoice #35', 5000, 'Outgoing', '2024-07-15 09:09:22', '2024-07-15 09:09:22', NULL, 1),
(36, 'paid-invoice #36', 5000, 'Outgoing', '2024-07-15 09:09:23', '2024-07-15 09:09:23', NULL, 1),
(37, 'paid-invoice #37', 5000, 'Outgoing', '2024-07-15 09:09:23', '2024-07-15 09:09:23', NULL, 1),
(38, 'paid-invoice #38', 5000, 'Outgoing', '2024-07-15 09:09:23', '2024-07-15 09:09:23', NULL, 1),
(39, 'paid-invoice #39', 5000, 'Outgoing', '2024-07-15 09:09:24', '2024-07-15 09:09:24', NULL, 1),
(40, 'paid-invoice #40', 5000, 'Outgoing', '2024-07-15 09:09:24', '2024-07-15 09:09:24', NULL, 1),
(41, 'paid-invoice #41', 5000, 'Outgoing', '2024-07-15 09:09:24', '2024-07-15 09:09:24', NULL, 1),
(42, 'paycheck #42', 150, 'Incoming', '2024-07-15 09:12:42', '2024-07-15 09:12:42', 1, NULL),
(43, 'paycheck #43', 150, 'Incoming', '2024-07-15 09:22:42', '2024-07-15 09:22:42', 1, NULL),
(44, 'paycheck #44', 150, 'Incoming', '2024-07-15 09:32:42', '2024-07-15 09:32:42', 1, NULL),
(45, 'paycheck #45', 150, 'Incoming', '2024-07-15 09:42:42', '2024-07-15 09:42:42', 1, NULL),
(46, 'paycheck #46', 150, 'Incoming', '2024-07-15 09:59:54', '2024-07-15 09:59:54', 1, NULL),
(47, 'paycheck #47', 150, 'Incoming', '2024-07-15 10:19:45', '2024-07-15 10:19:45', 1, NULL),
(48, 'paycheck #48', 150, 'Incoming', '2024-07-15 10:41:31', '2024-07-15 10:41:31', 1, NULL),
(49, 'paycheck #49', 150, 'Incoming', '2024-07-15 10:51:31', '2024-07-15 10:51:31', 1, NULL),
(50, 'paycheck #50', 150, 'Incoming', '2024-07-15 11:01:31', '2024-07-15 11:01:31', 1, NULL),
(51, 'paycheck #51', 150, 'Incoming', '2024-07-15 11:11:32', '2024-07-15 11:11:32', 1, NULL),
(52, 'paycheck #52', 150, 'Incoming', '2024-07-15 11:21:32', '2024-07-15 11:21:32', 1, NULL),
(53, 'paycheck #53', 150, 'Incoming', '2024-07-15 11:31:32', '2024-07-15 11:31:32', 1, NULL),
(54, 'paycheck #54', 150, 'Incoming', '2024-07-15 11:41:32', '2024-07-15 11:41:32', 1, NULL),
(55, 'paycheck #55', 150, 'Incoming', '2024-07-15 11:51:32', '2024-07-15 11:51:32', 1, NULL),
(56, 'paycheck #56', 150, 'Incoming', '2024-07-15 12:01:32', '2024-07-15 12:01:32', 1, NULL),
(57, 'paycheck #57', 150, 'Incoming', '2024-07-15 20:19:51', '2024-07-15 20:19:51', 1, NULL),
(58, 'paycheck #58', 150, 'Incoming', '2024-07-15 20:29:51', '2024-07-15 20:29:51', 1, NULL),
(59, 'paycheck #59', 150, 'Incoming', '2024-07-15 20:39:51', '2024-07-15 20:39:51', 1, NULL),
(60, 'paycheck #60', 150, 'Incoming', '2024-07-15 20:49:51', '2024-07-15 20:49:51', 1, NULL),
(61, 'paycheck #61', 150, 'Incoming', '2024-07-15 20:59:51', '2024-07-15 20:59:51', 1, NULL),
(62, 'paycheck #62', 50, 'Incoming', '2024-07-15 21:28:51', '2024-07-15 21:28:51', 1, NULL),
(63, 'paycheck #63', 50, 'Incoming', '2024-07-15 21:38:51', '2024-07-15 21:38:51', 1, NULL),
(64, 'paycheck #64', 50, 'Incoming', '2024-07-16 08:13:12', '2024-07-16 08:13:12', 1, NULL),
(65, 'paycheck #65', 50, 'Incoming', '2024-07-16 08:23:12', '2024-07-16 08:23:12', 1, NULL),
(66, 'paycheck #66', 150, 'Incoming', '2024-07-16 08:33:12', '2024-07-16 08:33:12', 1, NULL),
(67, 'paycheck #67', 150, 'Incoming', '2024-07-16 08:43:12', '2024-07-16 08:43:12', 1, NULL),
(68, 'paycheck #68', 150, 'Incoming', '2024-07-16 08:53:12', '2024-07-16 08:53:12', 1, NULL),
(69, 'bought crypto #69', 2147483647, 'Outgoing', '2024-07-16 09:03:23', '2024-07-16 09:03:23', NULL, 1),
(70, 'paid-invoice #70', 5000, 'Outgoing', '2024-07-16 09:05:40', '2024-07-16 09:05:40', NULL, 1),
(71, 'paid-invoice #71', 5000, 'Outgoing', '2024-07-16 09:05:40', '2024-07-16 09:05:40', NULL, 1),
(72, 'paid-invoice #72', 5000, 'Outgoing', '2024-07-16 09:05:40', '2024-07-16 09:05:40', NULL, 1),
(73, 'paid-invoice #73', 5000, 'Outgoing', '2024-07-16 09:05:40', '2024-07-16 09:05:40', NULL, 1),
(74, 'paid-invoice #74', 5000, 'Outgoing', '2024-07-16 09:05:41', '2024-07-16 09:05:41', NULL, 1),
(75, 'paid-invoice #75', 5000, 'Outgoing', '2024-07-16 09:05:41', '2024-07-16 09:05:41', NULL, 1),
(76, 'paid-invoice #76', 5000, 'Outgoing', '2024-07-16 09:05:41', '2024-07-16 09:05:41', NULL, 1),
(77, 'bought crypto #77', 150545, 'Outgoing', '2024-07-16 09:06:04', '2024-07-16 09:06:04', NULL, 1),
(78, 'paycheck #78', 150, 'Incoming', '2024-07-16 09:18:41', '2024-07-16 09:18:41', 1, NULL),
(79, 'paycheck #79', 150, 'Incoming', '2024-07-16 09:28:41', '2024-07-16 09:28:41', 1, NULL),
(80, 'paycheck #80', 150, 'Incoming', '2024-07-17 08:33:39', '2024-07-17 08:33:39', 1, NULL),
(81, 'paycheck #81', 10, 'Incoming', '2024-07-17 08:43:39', '2024-07-17 08:43:39', 1, NULL),
(82, 'paycheck #82', 75, 'Incoming', '2024-07-17 08:53:39', '2024-07-17 08:53:39', 1, NULL),
(83, 'paycheck #83', 75, 'Incoming', '2024-07-17 09:03:39', '2024-07-17 09:03:39', 1, NULL),
(84, 'paycheck #84', 75, 'Incoming', '2024-07-17 09:13:39', '2024-07-17 09:13:39', 1, NULL),
(85, 'paycheck #85', 75, 'Incoming', '2024-07-17 09:23:39', '2024-07-17 09:23:39', 1, NULL),
(86, 'unknown #86', 2, 'Outgoing', '2024-07-18 10:54:12', '2024-07-18 10:54:13', NULL, 1),
(87, 'unknown #87', 20, 'Outgoing', '2024-07-18 10:55:13', '2024-07-18 10:55:13', NULL, 1),
(88, 'unknown #88', 300, 'Outgoing', '2024-07-18 10:55:29', '2024-07-18 10:55:29', NULL, 1),
(89, 'unknown #89', 4, 'Outgoing', '2024-07-18 10:55:54', '2024-07-18 10:55:54', NULL, 1),
(90, 'unknown #90', 2, 'Outgoing', '2024-07-18 10:56:12', '2024-07-18 10:56:12', NULL, 1),
(91, 'unknown #91', 100, 'Outgoing', '2024-07-18 10:56:12', '2024-07-18 10:56:12', NULL, 1),
(92, 'unknown #92', 2, 'Outgoing', '2024-07-18 10:56:12', '2024-07-18 10:56:12', NULL, 1),
(93, 'unknown #93', 2, 'Outgoing', '2024-07-18 10:56:12', '2024-07-18 10:56:12', NULL, 1),
(94, 'unknown #94', 2, 'Outgoing', '2024-07-18 10:56:22', '2024-07-18 10:56:22', NULL, 1),
(95, 'unknown #95', 2, 'Outgoing', '2024-07-18 10:56:22', '2024-07-18 10:56:22', NULL, 1),
(96, 'unknown #96', 2, 'Outgoing', '2024-07-18 10:56:22', '2024-07-18 10:56:22', NULL, 1),
(97, 'unknown #97', 100, 'Outgoing', '2024-07-18 10:56:22', '2024-07-18 10:56:22', NULL, 1),
(98, 'unknown #98', 2, 'Outgoing', '2024-07-18 10:56:29', '2024-07-18 10:56:29', NULL, 1),
(99, 'unknown #99', 2, 'Outgoing', '2024-07-18 10:56:29', '2024-07-18 10:56:29', NULL, 1),
(100, 'unknown #100', 2, 'Outgoing', '2024-07-18 10:56:29', '2024-07-18 10:56:29', NULL, 1),
(101, 'unknown #101', 100, 'Outgoing', '2024-07-18 10:56:29', '2024-07-18 10:56:29', NULL, 1),
(102, 'paycheck #102', 75, 'Incoming', '2024-07-23 09:11:19', '2024-07-23 09:11:19', 1, NULL),
(103, 'unknown #103', 50, 'Outgoing', '2024-07-23 09:13:55', '2024-07-23 09:13:55', NULL, 1),
(104, 'paycheck #104', 75, 'Incoming', '2024-07-23 09:21:19', '2024-07-23 09:21:19', 1, NULL),
(105, 'paycheck #105', 75, 'Incoming', '2024-07-23 09:31:19', '2024-07-23 09:31:19', 1, NULL),
(106, 'vehicle-bought-in-showroom #106', 45000, 'Outgoing', '2024-07-23 09:33:49', '2024-07-23 09:33:49', NULL, 1),
(107, 'paycheck #107', 75, 'Incoming', '2024-07-23 09:41:19', '2024-07-23 09:41:19', 1, NULL),
(108, 'paycheck #108', 75, 'Incoming', '2024-07-23 09:51:19', '2024-07-23 09:51:19', 1, NULL),
(109, 'paycheck #109', 75, 'Incoming', '2024-07-23 10:01:19', '2024-07-23 10:01:19', 1, NULL),
(110, 'pd-vehicle #110', 10, 'Outgoing', '2024-07-23 10:10:21', '2024-07-23 10:10:21', NULL, 1),
(111, 'paycheck #111', 75, 'Incoming', '2024-07-23 10:11:19', '2024-07-23 10:11:19', 1, NULL),
(112, 'pd-vehicle #112', 10, 'Outgoing', '2024-07-23 10:16:33', '2024-07-23 10:16:33', NULL, 1),
(113, 'pd-vehicle #113', 10, 'Outgoing', '2024-07-23 10:16:53', '2024-07-23 10:16:53', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phone_business`
--

DROP TABLE IF EXISTS `phone_business`;
CREATE TABLE IF NOT EXISTS `phone_business` (
  `job` varchar(50) NOT NULL,
  `motd` varchar(255) NOT NULL,
  `motdchanged` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_calls`
--

DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `receiver` varchar(10) NOT NULL,
  `num` varchar(10) NOT NULL,
  `time` varchar(50) NOT NULL,
  `accepts` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `phone_contacts`
--

DROP TABLE IF EXISTS `phone_contacts`;
CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL,
  `favourite` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

DROP TABLE IF EXISTS `phone_gallery`;
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_gallery`
--

INSERT INTO `phone_gallery` (`citizenid`, `image`, `date`) VALUES
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261285937808412773/screenshot.jpg?ex=66926791&is=66911611&hm=0590e452bf6e78263b061e0f9c94be87cea45fabc255317fdaa1439a50cd6b50&', '2024-07-12 11:40:00'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261285941642002543/screenshot.jpg?ex=66926792&is=66911612&hm=e2b4fd699adec9703d8d2055feb61358fee350e3f239a97ad96f7a3fd7386503&', '2024-07-12 11:40:01'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261285943529312337/screenshot.jpg?ex=66926792&is=66911612&hm=7fc66effc578ff1a0a8477d6373ec2a94c6e3fa306cef3f5412779da8d5c2e3d&', '2024-07-12 11:40:01'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261991642760745070/screenshot.jpg?ex=6694f8ce&is=6693a74e&hm=56c98541df204786279cdec314be1973d50b8af494ba420c6f7f0d1b23b3d6e0&', '2024-07-14 10:24:13'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261991645616803890/screenshot.jpg?ex=6694f8ce&is=6693a74e&hm=ac14f70a825f97a6bca0186e6dc00b7e9503386c827543ab0c8cf0892d3a5e63&', '2024-07-14 10:24:13'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261991648007815220/screenshot.jpg?ex=6694f8cf&is=6693a74f&hm=34ab1fa33ac7862ca0870d6c34f8e50d417b40361ad8178274094b2765397068&', '2024-07-14 10:24:14'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261991649521963058/screenshot.jpg?ex=6694f8cf&is=6693a74f&hm=b056bc9263270d1389e294ed76e5568066887ccbab8a03505ca7dc4ac389a31a&', '2024-07-14 10:24:14'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261991651988213763/screenshot.jpg?ex=6694f8d0&is=6693a750&hm=d516123399a2ac768cf210862138a7f57978a56f064c7e85ad9cda724fadc0d9&', '2024-07-14 10:24:15'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261992038128291920/screenshot.jpg?ex=6694f92c&is=6693a7ac&hm=3fc019c0128b225ddb4fb43dd32d661b7f277b68407fedf9490e27ae9b43a5ea&', '2024-07-14 10:25:47'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261992041248854016/screenshot.jpg?ex=6694f92d&is=6693a7ad&hm=d09d91f1c6a84363f2a7677e75c636835e4b21d982b972bc81fa03dee2972f5d&', '2024-07-14 10:25:48'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261992042356150302/screenshot.jpg?ex=6694f92d&is=6693a7ad&hm=316b2d2f5ec4ee1f6dfaa32f2df21405765825f8f9fbf3fd1f886a45a8e3cdca&', '2024-07-14 10:25:48'),
('ZSR82681', 'https://media.discordapp.net/attachments/1072103535556173854/1261992042695884850/screenshot.jpg?ex=6694f92d&is=6693a7ad&hm=398a6132ad135764b2ae41ed13ff90a618477c0c5789a5985cf19a0ba069c339&', '2024-07-14 10:25:48');

-- --------------------------------------------------------

--
-- Table structure for table `phone_information`
--

DROP TABLE IF EXISTS `phone_information`;
CREATE TABLE IF NOT EXISTS `phone_information` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `wallpaper` varchar(255) NOT NULL DEFAULT 'https://cdn.discordapp.com/attachments/717040110641741894/802176415269257236/bright.png',
  `darkmode` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `amount` int NOT NULL DEFAULT '0',
  `society` tinytext DEFAULT (NULL),
  `sender` varchar(50) DEFAULT (NULL),
  `sendercitizenid` varchar(50) DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `number` varchar(50) DEFAULT (NULL),
  `messages` text DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_messages`
--

INSERT INTO `phone_messages` (`id`, `citizenid`, `number`, `messages`) VALUES
(1, 'ZSR82681', '2063079364', '[{\"date\":\"2-6-2024\",\"messages\":[{\"message\":\"אני צריך עזרההההההה\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"13:45\",\"type\":\"message\"},{\"message\":\"דחוף\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"13:45\",\"type\":\"message\"}]},{\"date\":\"3-6-2024\",\"messages\":[{\"message\":\"Aleutian\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:26\",\"type\":\"message\"},{\"message\":\"depot\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:27\",\"type\":\"message\"},{\"message\":\"😭\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:28\",\"type\":\"message\"}]},{\"date\":\"4-6-2024\",\"messages\":[{\"message\":\"/createrace 5000\",\"sender\":\"ZSR82681\",\"data\":[],\"time\":\"15:11\",\"type\":\"message\"}]}]'),
(2, 'CYE23861', '5518161286', '[{\"date\":\"2-6-2024\",\"messages\":[{\"message\":\"אני צריך עזרההההההה\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"13:45\",\"type\":\"message\"},{\"message\":\"דחוף\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"13:45\",\"type\":\"message\"}]},{\"date\":\"3-6-2024\",\"messages\":[{\"message\":\"Aleutian\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:26\",\"type\":\"message\"},{\"message\":\"depot\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:27\",\"type\":\"message\"},{\"message\":\"😭\",\"sender\":\"CYE23861\",\"data\":[],\"time\":\"17:28\",\"type\":\"message\"}]},{\"date\":\"4-6-2024\",\"messages\":[{\"message\":\"/createrace 5000\",\"sender\":\"ZSR82681\",\"data\":[],\"time\":\"15:11\",\"type\":\"message\"}]}]');

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `firstName` varchar(25) DEFAULT (NULL),
  `lastName` varchar(25) DEFAULT (NULL),
  `message` text DEFAULT (NULL),
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `url` text DEFAULT (NULL),
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `phone_tweets`
--

INSERT INTO `phone_tweets` (`id`, `citizenid`, `firstName`, `lastName`, `message`, `date`, `url`, `picture`, `tweetId`) VALUES
(1, 'ZSR82681', 'Donald', 'Tramp', 'ddddddddd', '2024-06-28 10:46:57', '[]', 'camera-profilepicture', 'TWEET-89695657'),
(2, 'ZSR82681', 'Donald', 'Tramp', 'hiiiiiiiiiiiii', '2024-07-12 11:40:18', 'https://media.discordapp.net/attachments/1072103535556173854/1261285941642002543/screenshot.jpg?ex=66926792&is=66911612&hm=e2b4fd699adec9703d8d2055feb61358fee350e3f239a97ad96f7a3fd7386503&', 'camera-profilepicture', 'TWEET-18688207'),
(3, 'ZSR82681', 'Donald', 'Tramp', 'hiiiiiiii', '2024-07-14 10:24:19', 'https://media.discordapp.net/attachments/1072103535556173854/1261991642760745070/screenshot.jpg?ex=6694f8ce&is=6693a74e&hm=56c98541df204786279cdec314be1973d50b8af494ba420c6f7f0d1b23b3d6e0&', 'camera-profilepicture', 'TWEET-33315148'),
(4, 'ZSR82681', 'Donald', 'Tramp', 'hiiiiiiiiiiiii', '2024-07-14 10:25:53', 'https://media.discordapp.net/attachments/1072103535556173854/1261992038128291920/screenshot.jpg?ex=6694f92c&is=6693a7ac&hm=3fc019c0128b225ddb4fb43dd32d661b7f277b68407fedf9490e27ae9b43a5ea&', 'https://cdn.discordapp.com/attachments/1072103535556173854/1261991651988213763/screenshot.jpg?ex=6694f8d0&is=6693a750&hm=d516123399a2ac768cf210862138a7f57978a56f064c7e85ad9cda724fadc0d9&', 'TWEET-73503758');

-- --------------------------------------------------------

--
-- Table structure for table `phone_twitter_accounts`
--

DROP TABLE IF EXISTS `phone_twitter_accounts`;
CREATE TABLE IF NOT EXISTS `phone_twitter_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `userid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(2555) NOT NULL DEFAULT 'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_twitter_likes`
--

DROP TABLE IF EXISTS `phone_twitter_likes`;
CREATE TABLE IF NOT EXISTS `phone_twitter_likes` (
  `identifier` varchar(50) DEFAULT NULL,
  `liked` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_twitter_messages`
--

DROP TABLE IF EXISTS `phone_twitter_messages`;
CREATE TABLE IF NOT EXISTS `phone_twitter_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '0',
  `userid` varchar(50) NOT NULL DEFAULT '0',
  `avatar` varchar(2555) NOT NULL DEFAULT '0',
  `date` varchar(50) NOT NULL DEFAULT '0',
  `message` varchar(50) NOT NULL DEFAULT '0',
  `imageurl` varchar(266) NOT NULL DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playerammo`
--

DROP TABLE IF EXISTS `playerammo`;
CREATE TABLE IF NOT EXISTS `playerammo` (
  `id` int NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `ammo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `playeritems`
--

DROP TABLE IF EXISTS `playeritems`;
CREATE TABLE IF NOT EXISTS `playeritems` (
  `id` int NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `info` text,
  `type` varchar(255) NOT NULL,
  `slot` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int DEFAULT (NULL),
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT (NULL),
  `job` text NOT NULL,
  `gang` text DEFAULT (NULL),
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT (NULL),
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `phone_number`) VALUES
(188, 'CYE23861', 2, 'license:42a8a9911830d96df94355c9a46092c0b34a80e3', 'Ran', '{\"bank\":5600,\"cash\":0,\"crypto\":0}', '{\"account\":\"US02QBCore1759123577\",\"lastname\":\"Lampert\",\"firstname\":\"Ran\",\"phone\":\"2063079364\",\"gender\":0,\"nationality\":\"Ethiopia\",\"birthdate\":\"2024-06-28\",\"cid\":2}', '{\"name\":\"unemployed\",\"type\":\"none\",\"grade\":{\"isboss\":false,\"name\":\"No Grades\",\"payment\":30,\"level\":0},\"onduty\":true,\"label\":\"Civilian\",\"payment\":10,\"isboss\":false}', '{\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang Affiliation\",\"grade\":{\"level\":0,\"name\":\"none\"}}', '{\"x\":389.6571350097656,\"y\":-948.2901000976563,\"z\":29.4146728515625}', '{\"isdead\":false,\"fingerprint\":\"lz882X84iCS2431\",\"phonedata\":{\"SerialNumber\":19277821,\"InstalledApps\":[]},\"tracker\":false,\"thirst\":88.60000000000001,\"armor\":0,\"criminalrecord\":{\"date\":{\"year\":2024,\"sec\":3,\"isdst\":true,\"day\":4,\"yday\":186,\"month\":7,\"hour\":15,\"wday\":5,\"min\":33},\"hasRecord\":true},\"rep\":[],\"status\":[],\"bloodtype\":\"A-\",\"inside\":{\"apartment\":[]},\"hunger\":87.39999999999999,\"ishandcuffed\":false,\"inlaststand\":false,\"stress\":0,\"licences\":{\"driver\":true,\"weapon\":false,\"business\":false},\"callsign\":\"NO CALLSIGN\",\"phone\":[],\"injail\":0,\"jailitems\":[],\"walletid\":\"QB-40508301\"}', '[{\"name\":\"phone\",\"amount\":1,\"type\":\"item\",\"slot\":1,\"info\":[]}', '2024-07-12 07:19:37', NULL),
(129, 'MDO58279', 1, 'license:ad8f053e3277ce12031bf10403617889fbed1204', 'mega shmega', '{\"cash\":0,\"bank\":5600,\"crypto\":0}', '{\"lastname\":\"dav\",\"gender\":0,\"firstname\":\"dav\",\"phone\":\"2978058387\",\"nationality\":\"Andorra\",\"account\":\"US07QBCore9018290496\",\"birthdate\":\"2024-06-27\",\"cid\":1}', '{\"type\":\"leo\",\"onduty\":true,\"label\":\"Law Enforcement\",\"isboss\":false,\"name\":\"police\",\"grade\":{\"isboss\":false,\"level\":1,\"name\":\"Officer\",\"payment\":75}}', '{\"name\":\"none\",\"isboss\":false,\"label\":\"No Gang Affiliation\",\"grade\":{\"name\":\"none\",\"level\":0}}', '{\"x\":-1576.7471923828126,\"y\":-2440.1669921875,\"z\":7.240234375}', '{\"status\":[],\"jailitems\":[],\"tracker\":false,\"armor\":0,\"phone\":[],\"inside\":{\"apartment\":[]},\"stress\":0,\"fingerprint\":\"rj002E52EdX3198\",\"inlaststand\":false,\"bloodtype\":\"A+\",\"criminalrecord\":{\"hasRecord\":false},\"currentapartment\":\"apartment14371\",\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":56604909},\"hunger\":95.8,\"callsign\":\"NO CALLSIGN\",\"thirst\":96.2,\"licences\":{\"business\":false,\"weapon\":false,\"driver\":true},\"isdead\":false,\"rep\":[],\"walletid\":\"QB-94072988\",\"injail\":0,\"ishandcuffed\":false}', '[]', '2024-07-01 05:02:45', NULL),
(1199, 'MFK74931', 1, 'license:e527b3f7d88eaede27a24aa54d7afe843b4369ec', 'SOS', '{\"cash\":495,\"crypto\":0,\"bank\":5075}', '{\"lastname\":\"LIL\",\"firstname\":\"ZX\",\"gender\":0,\"isNew\":true,\"phone\":\"3409263691\",\"account\":\"US01QBCore5323198888\",\"cid\":\"1\",\"birthdate\":\"0003-12-03\",\"nationality\":\"1235\"}', '{\"type\":\"leo\",\"grade\":{\"isboss\":false,\"payment\":75,\"level\":1,\"name\":\"Officer\"},\"name\":\"police\",\"isboss\":false,\"onduty\":true,\"label\":\"Police\"}', '{\"isboss\":false,\"grade\":{\"name\":\"none\",\"level\":0},\"name\":\"none\",\"label\":\"No Gang Affiliation\"}', '{\"x\":-3045.876953125,\"y\":583.8461303710938,\"z\":7.8974609375}', '{\"walletid\":\"QB-26656733\",\"jailitems\":[],\"fingerprint\":\"ov378E87Zpj1383\",\"rep\":[],\"armor\":0,\"ishandcuffed\":false,\"status\":[],\"licences\":{\"driver\":true,\"business\":false,\"weapon\":false},\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"stress\":6,\"hunger\":91.6,\"isdead\":false,\"bloodtype\":\"AB-\",\"inside\":{\"apartment\":[]},\"inlaststand\":false,\"phone\":[],\"phonedata\":{\"SerialNumber\":78185449,\"InstalledApps\":[]},\"injail\":0,\"callsign\":\"NO CALLSIGN\",\"thirst\":92.4}', '[{\"info\":{\"quality\":100,\"birthdate\":\"0003-12-03\",\"lastname\":\"LIL\",\"type\":\"Class C Driver License\",\"firstname\":\"ZX\"},\"type\":\"item\",\"amount\":1,\"slot\":1,\"name\":\"driver_license\",\"created\":1721033030},{\"info\":{\"quality\":100,\"citizenid\":\"MFK74931\",\"birthdate\":\"0003-12-03\",\"gender\":0,\"nationality\":\"1235\",\"lastname\":\"LIL\",\"firstname\":\"ZX\"},\"type\":\"item\",\"amount\":1,\"slot\":2,\"name\":\"id_card\",\"created\":1721033030},{\"info\":{\"serie\":\"31NRf1AS260CkuV\",\"quality\":86.7999999999995,\"ammo\":21},\"type\":\"weapon\",\"amount\":1,\"slot\":3,\"name\":\"weapon_pistol\",\"created\":1721033576},{\"info\":{\"quality\":100},\"type\":\"item\",\"amount\":1,\"slot\":4,\"name\":\"phone\",\"created\":1721033030},{\"info\":{\"quality\":100},\"type\":\"item\",\"amount\":50,\"slot\":19,\"name\":\"pistol_ammo\",\"created\":1721033596}]', '2024-07-15 09:03:53', NULL),
(1180, 'NQT87908', 2, 'license:bcebc91cd656078ac4d6e770e566462f1d0689ee', 'djfjch367', '{\"crypto\":0,\"bank\":5000,\"cash\":500}', '{\"phone\":\"2419081586\",\"birthdate\":\"2222-02-02\",\"cid\":\"2\",\"account\":\"US02QBCore9643228031\",\"gender\":0,\"isNew\":true,\"firstname\":\"222\",\"nationality\":\"22\",\"lastname\":\"222\"}', '{\"label\":\"Civilian\",\"name\":\"unemployed\",\"type\":\"none\",\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"onduty\":false,\"isboss\":false,\"payment\":10}', '{\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliation\",\"name\":\"none\",\"isboss\":false}', '{\"x\":-664.0615234375,\"y\":-1103.208740234375,\"z\":-14.3106689453125}', '{\"phone\":[],\"stress\":0,\"isdead\":false,\"callsign\":\"NO CALLSIGN\",\"tracker\":false,\"armor\":0,\"rep\":[],\"hunger\":95.8,\"currentapartment\":\"apartment18264\",\"bloodtype\":\"O-\",\"injail\":0,\"walletid\":\"QB-28496374\",\"inside\":{\"apartment\":{\"apartmentType\":\"apartment1\",\"apartmentId\":\"apartment18264\"}},\"thirst\":96.2,\"licences\":{\"driver\":true,\"weapon\":false,\"business\":false},\"criminalrecord\":{\"hasRecord\":false},\"jailitems\":[],\"status\":[],\"inlaststand\":false,\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":79174284},\"ishandcuffed\":false,\"fingerprint\":\"lB989U63IFz3592\"}', '[{\"info\":{\"type\":\"Class C Driver License\",\"lastname\":\"222\",\"firstname\":\"222\",\"quality\":100,\"birthdate\":\"2222-02-02\"},\"amount\":1,\"slot\":1,\"name\":\"driver_license\",\"created\":1720955859,\"type\":\"item\"},{\"info\":{\"quality\":100},\"amount\":1,\"slot\":2,\"name\":\"phone\",\"created\":1720955859,\"type\":\"item\"},{\"info\":{\"gender\":0,\"lastname\":\"222\",\"firstname\":\"222\",\"nationality\":\"22\",\"quality\":100,\"birthdate\":\"2222-02-02\",\"citizenid\":\"NQT87908\"},\"amount\":1,\"slot\":3,\"name\":\"id_card\",\"created\":1720955859,\"type\":\"item\"}]', '2024-07-14 11:19:24', NULL),
(116, 'ZSR82681', 1, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'yuval', '{\"cash\":12,\"bank\":1.2216650682e145,\"crypto\":1000000000148.3208}', '{\"birthdate\":\"2100-04-22\",\"nationality\":\"United States\",\"lastname\":\"Tramp\",\"account\":\"US04QBCore6108325341\",\"gender\":0,\"firstname\":\"Donald\",\"phone\":\"5518161286\",\"cid\":1}', '{\"grade\":{\"name\":\"Officer\",\"payment\":75,\"isboss\":false,\"level\":1},\"label\":\"Police\",\"onduty\":true,\"isboss\":false,\"payment\":10,\"name\":\"police\",\"type\":\"leo\"}', '{\"grade\":{\"name\":\"none\",\"level\":0},\"label\":\"No Gang Affiliation\",\"isboss\":false,\"name\":\"none\"}', '{\"x\":556.984619140625,\"y\":-1450.2197265625,\"z\":29.060791015625}', '{\"phonedata\":{\"SerialNumber\":52561240,\"InstalledApps\":[]},\"rep\":[],\"walletid\":\"QB-23090396\",\"status\":[],\"fingerprint\":\"mu218o79WPd1894\",\"armor\":0,\"criminalrecord\":{\"hasRecord\":false},\"stress\":43,\"thirst\":62.00000000000003,\"licences\":{\"weapon\":true,\"business\":false,\"driver\":true},\"bloodtype\":\"B-\",\"jailitems\":[],\"inside\":{\"apartment\":[]},\"inlaststand\":false,\"injail\":0,\"tracker\":false,\"isdead\":false,\"ishandcuffed\":false,\"hunger\":57.99999999999997,\"phone\":{\"profilepicture\":\"https://cdn.discordapp.com/attachments/1072103535556173854/1261991651988213763/screenshot.jpg?ex=6694f8d0&is=6693a750&hm=d516123399a2ac768cf210862138a7f57978a56f064c7e85ad9cda724fadc0d9&\"},\"callsign\":\"221\"}', '[{\"slot\":1,\"name\":\"weapon_pistol\",\"type\":\"weapon\",\"amount\":1,\"info\":{\"quality\":0,\"ammo\":26,\"serie\":\"11QSv4Cx861FqxP\"},\"created\":1720787535},{\"slot\":2,\"name\":\"pistol_ammo\",\"type\":\"item\",\"amount\":52,\"info\":{\"quality\":100},\"created\":1720787978},{\"slot\":3,\"name\":\"rifle_ammo\",\"type\":\"item\",\"amount\":5,\"info\":{\"quality\":100},\"created\":1721728271},{\"slot\":4,\"name\":\"lockpick\",\"type\":\"item\",\"amount\":67,\"info\":{\"quality\":100},\"created\":1720616335},{\"slot\":5,\"name\":\"radio\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1721032059},{\"slot\":6,\"name\":\"ziptie\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1720439181},{\"slot\":7,\"name\":\"goldbar\",\"type\":\"item\",\"amount\":4,\"info\":{\"quality\":100},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":8,\"name\":\"markedbills\",\"type\":\"item\",\"amount\":3,\"info\":{\"worth\":2582,\"quality\":100},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":9,\"name\":\"drill\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1721206300},{\"slot\":10,\"name\":\"twerks_candy\",\"type\":\"item\",\"amount\":14,\"info\":{\"quality\":100},\"created\":1721300052},{\"slot\":11,\"name\":\"bandage\",\"type\":\"item\",\"amount\":6,\"info\":{\"quality\":100},\"created\":1721300129},{\"slot\":12,\"name\":\"sandwich\",\"type\":\"item\",\"amount\":5,\"info\":{\"quality\":100},\"created\":1721300153},{\"slot\":13,\"name\":\"water_bottle\",\"type\":\"item\",\"amount\":5,\"info\":{\"quality\":100},\"created\":1720535897},{\"slot\":14,\"name\":\"weapon_sniperrifle\",\"type\":\"weapon\",\"amount\":1,\"info\":{\"quality\":99.85,\"ammo\":0,\"serie\":\"44stf8CP080kNTX\"},\"created\":1721728247},{\"slot\":15,\"name\":\"rolex\",\"type\":\"item\",\"amount\":6,\"info\":{\"quality\":100},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":18,\"name\":\"markedbills\",\"type\":\"item\",\"amount\":1,\"info\":{\"worth\":20541,\"quality\":100},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":19,\"name\":\"weaponlicense\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1720785020},{\"slot\":20,\"name\":\"weapon_dagger\",\"type\":\"weapon\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"38CTF7PA585IrBE\"},\"created\":1720791021},{\"slot\":22,\"name\":\"binoculars\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1721726035},{\"slot\":24,\"name\":\"camera\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1720614920},{\"slot\":25,\"name\":\"electronickit\",\"type\":\"item\",\"amount\":42,\"info\":{\"quality\":100},\"created\":1721205444},{\"slot\":27,\"name\":\"cryptostick\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100,\"crypto\":1},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":28,\"name\":\"phone\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1720762540},{\"slot\":31,\"name\":\"weapon_heavypistol\",\"type\":\"weapon\",\"amount\":1,\"info\":{\"quality\":69.24999999999884,\"ammo\":24,\"serie\":\"13bfZ2wN516wXkx\"},\"created\":1720787973},{\"slot\":36,\"name\":\"trojan_usb\",\"type\":\"item\",\"amount\":44,\"info\":{\"quality\":100},\"created\":1721041698},{\"slot\":37,\"name\":\"markedbills\",\"type\":\"item\",\"amount\":3,\"info\":{\"worth\":19194,\"quality\":100},\"created\":\"qb-bankrobbery:server:recieveItem\"},{\"slot\":38,\"name\":\"weaponlicense\",\"type\":\"item\",\"amount\":1,\"info\":{\"quality\":100},\"created\":1721038346}]', '2024-07-23 10:19:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(5, 'MYL11018', '1464257942', '{\"nose_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"watch\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"face2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"moles\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"eye_opening\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_4\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eye_color\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"nose_0\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"arms\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"cheek_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"cheek_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"chimp_hole\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"facemix\":{\"skinMix\":0,\"shapeMix\":0,\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0},\"hair\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"shoes\":{\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0,\"item\":1},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"beard\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"hat\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"eyebrown_forward\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"ageing\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"eyebrown_high\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"jaw_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"torso2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"lips_thickness\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"accessory\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"decals\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"t-shirt\":{\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0,\"item\":1},\"neck_thikness\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"face\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"pants\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"cheek_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"vest\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"glass\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"bracelet\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"lipstick\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"ear\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"mask\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"bag\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_5\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"makeup\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"blush\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"eyebrows\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1}}', 1),
(9, 'MDO58279', '1885233650', '{\"accessory\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":133},\"neck_thikness\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"nose_5\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"watch\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1},\"lipstick\":{\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1,\"item\":-1},\"makeup\":{\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1,\"item\":-1},\"nose_3\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"ageing\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1},\"t-shirt\":{\"defaultItem\":1,\"texture\":0,\"defaultTexture\":0,\"item\":15},\"jaw_bone_width\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"glass\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"decals\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"chimp_bone_lowering\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"nose_1\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"cheek_1\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"bag\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"arms\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":172},\"torso2\":{\"defaultItem\":0,\"texture\":3,\"defaultTexture\":0,\"item\":336},\"bracelet\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1},\"eyebrows\":{\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1,\"item\":-1},\"chimp_bone_lenght\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"moles\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1},\"face\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"chimp_hole\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"blush\":{\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1,\"item\":-1},\"beard\":{\"defaultItem\":-1,\"texture\":1,\"defaultTexture\":1,\"item\":-1},\"lips_thickness\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"face2\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"nose_4\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"eyebrown_forward\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"hair\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"jaw_bone_back_lenght\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"mask\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":52},\"facemix\":{\"defaultSkinMix\":0.0,\"skinMix\":0,\"defaultShapeMix\":0.0,\"shapeMix\":0},\"cheek_2\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"eye_opening\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"eyebrown_high\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"chimp_bone_width\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"ear\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1},\"nose_0\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"vest\":{\"defaultItem\":0,\"texture\":2,\"defaultTexture\":0,\"item\":15},\"cheek_3\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"hat\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":150},\"shoes\":{\"defaultItem\":1,\"texture\":0,\"defaultTexture\":0,\"item\":24},\"pants\":{\"defaultItem\":0,\"texture\":1,\"defaultTexture\":0,\"item\":130},\"nose_2\":{\"defaultItem\":0,\"texture\":0,\"defaultTexture\":0,\"item\":0},\"eye_color\":{\"defaultItem\":-1,\"texture\":0,\"defaultTexture\":0,\"item\":-1}}', 1),
(22, 'CYE23861', '1885233650', '{\"facemix\":{\"shapeMix\":0,\"defaultShapeMix\":0.0,\"defaultSkinMix\":0.0,\"skinMix\":0},\"bracelet\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"hat\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"watch\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"neck_thikness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"bag\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"ear\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"ageing\":{\"texture\":0,\"defaultItem\":-1,\"item\":5,\"defaultTexture\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_hole\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"decals\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"hair\":{\"texture\":33,\"defaultItem\":0,\"item\":14,\"defaultTexture\":0},\"nose_4\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"cheek_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"lips_thickness\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"t-shirt\":{\"texture\":0,\"defaultItem\":1,\"item\":94,\"defaultTexture\":0},\"eyebrows\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"shoes\":{\"texture\":0,\"defaultItem\":1,\"item\":6,\"defaultTexture\":0},\"vest\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"makeup\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"nose_5\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"cheek_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"mask\":{\"texture\":6,\"defaultItem\":0,\"item\":51,\"defaultTexture\":0},\"nose_0\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_2\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"moles\":{\"texture\":0,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":0},\"cheek_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"face\":{\"texture\":15,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"nose_1\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"arms\":{\"texture\":0,\"defaultItem\":0,\"item\":2,\"defaultTexture\":0},\"torso2\":{\"texture\":0,\"defaultItem\":0,\"item\":330,\"defaultTexture\":0},\"pants\":{\"texture\":4,\"defaultItem\":0,\"item\":77,\"defaultTexture\":0},\"blush\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"chimp_bone_lenght\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_opening\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"beard\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"eyebrown_high\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"lipstick\":{\"texture\":1,\"defaultItem\":-1,\"item\":-1,\"defaultTexture\":1},\"nose_3\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"eye_color\":{\"texture\":0,\"defaultItem\":-1,\"item\":0,\"defaultTexture\":0},\"glass\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0},\"accessory\":{\"texture\":0,\"defaultItem\":0,\"item\":0,\"defaultTexture\":0}}', 1),
(30, 'GOF52094', '-1868718465', '{\"nose_0\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"vest\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"nose_5\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"nose_2\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"neck_thikness\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"ear\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"pants\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"cheek_2\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"hat\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"face\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"t-shirt\":{\"texture\":0,\"item\":1,\"defaultItem\":1,\"defaultTexture\":0},\"eyebrows\":{\"texture\":1,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1},\"accessory\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"arms\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"lipstick\":{\"texture\":1,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1},\"chimp_hole\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"decals\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"chimp_bone_lowering\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"cheek_1\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"cheek_3\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"bag\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"chimp_bone_lenght\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"eyebrown_forward\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"chimp_bone_width\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"bracelet\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"eye_opening\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"glass\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"jaw_bone_width\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"shoes\":{\"texture\":0,\"item\":1,\"defaultItem\":1,\"defaultTexture\":0},\"face2\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"eye_color\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"nose_3\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"watch\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"blush\":{\"texture\":1,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1},\"facemix\":{\"skinMix\":0,\"defaultShapeMix\":0.0,\"defaultSkinMix\":0.0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"nose_4\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"ageing\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0},\"hair\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"beard\":{\"texture\":1,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1},\"lips_thickness\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"nose_1\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"torso2\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"eyebrown_high\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"makeup\":{\"texture\":1,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":1},\"mask\":{\"texture\":0,\"item\":0,\"defaultItem\":0,\"defaultTexture\":0},\"moles\":{\"texture\":0,\"item\":-1,\"defaultItem\":-1,\"defaultTexture\":0}}', 1),
(31, 'MFK74931', '-424905564', '{\"accessory\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"mask\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"face\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_4\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"jaw_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"t-shirt\":{\"item\":1,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0},\"blush\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"nose_1\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"watch\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"hair\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"vest\":{\"item\":2,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"beard\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"makeup\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"shoes\":{\"item\":1,\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0},\"cheek_1\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_5\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eye_opening\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"torso2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"neck_thikness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"facemix\":{\"skinMix\":0,\"shapeMix\":0,\"defaultShapeMix\":0.0,\"defaultSkinMix\":0.0},\"chimp_hole\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_width\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"decals\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"chimp_bone_lowering\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"ear\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"jaw_bone_back_lenght\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eyebrown_forward\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"glass\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"hat\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"eyebrown_high\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"cheek_2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"lips_thickness\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"lipstick\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"eye_color\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"nose_0\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"moles\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"face2\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"nose_3\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"pants\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"bracelet\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0},\"arms\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"bag\":{\"item\":0,\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0},\"eyebrows\":{\"item\":-1,\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1},\"ageing\":{\"item\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0}}', 1),
(34, 'ZSR82681', '1885233650', '{\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"item\":24,\"defaultItem\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"item\":20,\"defaultItem\":0},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"facemix\":{\"skinMix\":0,\"defaultShapeMix\":0.0,\"shapeMix\":0,\"defaultSkinMix\":0.0},\"hat\":{\"texture\":-1,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"item\":317,\"defaultItem\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"item\":58,\"defaultItem\":1},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"item\":51,\"defaultItem\":1},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `name` varchar(50) DEFAULT (NULL),
  `number` varchar(50) DEFAULT (NULL),
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_contacts`
--

INSERT INTO `player_contacts` (`id`, `citizenid`, `name`, `number`, `iban`) VALUES
(1, 'CYE23861', 'Donald Tramp', '5518161286', 'US04QBCore6108325341'),
(2, 'CYE23861', 'Donald Tramp', '5518161286', 'US04QBCore6108325341'),
(3, 'CYE23861', 'Donald Tramp', '5518161286', 'US04QBCore6108325341'),
(5, 'ZSR82681', 'Ran', '2063079364', ''),
(6, 'ZSR82681', '911', '911', '');

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT (NULL),
  `citizenid` varchar(11) DEFAULT (NULL),
  `keyholders` text DEFAULT (NULL),
  `decorations` text DEFAULT (NULL),
  `stash` text DEFAULT (NULL),
  `outfit` text DEFAULT (NULL),
  `logout` text DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `sender` varchar(50) DEFAULT (NULL),
  `subject` varchar(50) DEFAULT (NULL),
  `message` text DEFAULT (NULL),
  `read` tinyint DEFAULT '0',
  `mailid` int DEFAULT (NULL),
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `button` text DEFAULT (NULL),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_mails`
--

INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
(2, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Ran Lampert<br />Phone Number: <strong>2063079364</strong><br><br>Kind regards,<br>Township Los Santos', 0, 897634, '2024-07-02 10:14:07', '[]'),
(3, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Ran Lampert<br />Phone Number: <strong>2063079364</strong><br><br>Kind regards,<br>Township Los Santos', 0, 324389, '2024-07-02 10:14:07', '[]'),
(4, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Ran Lampert<br />Phone Number: <strong>2063079364</strong><br><br>Kind regards,<br>Township Los Santos', 0, 186855, '2024-07-02 10:14:07', '[]'),
(5, 'ZSR82681', 'Pawn Shop', 'Melting Items', 'We finished melting your items. You can come pick them up at any time.', 0, 687929, '2024-07-03 12:33:37', '[]'),
(6, 'ZSR82681', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. Tramp, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!', 0, 845835, '2024-07-08 12:07:22', '[]'),
(8, 'ZSR82681', NULL, NULL, NULL, 0, 965713, '2024-07-15 09:09:13', NULL),
(9, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 774553, '2024-07-15 09:09:13', NULL),
(10, 'ZSR82681', NULL, NULL, NULL, 0, 520366, '2024-07-15 09:09:20', NULL),
(11, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 120379, '2024-07-15 09:09:20', NULL),
(12, 'ZSR82681', NULL, NULL, NULL, 0, 369998, '2024-07-15 09:09:22', NULL),
(13, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 966872, '2024-07-15 09:09:22', NULL),
(14, 'ZSR82681', NULL, NULL, NULL, 0, 263311, '2024-07-15 09:09:23', NULL),
(15, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 659395, '2024-07-15 09:09:23', NULL),
(17, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 188670, '2024-07-15 09:09:23', NULL),
(19, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 830690, '2024-07-15 09:09:23', NULL),
(21, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 665916, '2024-07-15 09:09:24', NULL),
(25, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 737015, '2024-07-15 09:09:24', NULL),
(26, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 928761, '2024-07-15 21:29:28', '[]'),
(27, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 777279, '2024-07-15 21:29:28', '[]'),
(28, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 857750, '2024-07-15 21:29:28', '[]'),
(29, 'DJD56142', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 314776, '2024-07-15 21:29:40', '[]'),
(30, 'DXT09752', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 225034, '2024-07-15 21:29:40', '[]'),
(31, 'SRI85140', 'Township', 'Driving lessons request', 'Hello,<br><br>We have just received a message that someone wants to take driving lessons.<br>If you are willing to teach, please contact them:<br>Name: <strong>Donald Tramp<br />Phone Number: <strong>5518161286</strong><br><br>Kind regards,<br>Township Los Santos', 0, 387182, '2024-07-15 21:29:40', '[]'),
(32, 'ZSR82681', NULL, NULL, NULL, 0, 757490, '2024-07-16 09:05:40', NULL),
(33, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 114676, '2024-07-16 09:05:40', NULL),
(34, 'ZSR82681', NULL, NULL, NULL, 0, 485558, '2024-07-16 09:05:40', NULL),
(35, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 253788, '2024-07-16 09:05:40', NULL),
(36, 'ZSR82681', NULL, NULL, NULL, 0, 221652, '2024-07-16 09:05:40', NULL),
(37, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 722289, '2024-07-16 09:05:40', NULL),
(38, 'ZSR82681', NULL, NULL, NULL, 0, 868136, '2024-07-16 09:05:40', NULL),
(39, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 737063, '2024-07-16 09:05:40', NULL),
(40, 'ZSR82681', NULL, NULL, NULL, 0, 285723, '2024-07-16 09:05:41', NULL),
(41, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 658377, '2024-07-16 09:05:41', NULL),
(42, 'ZSR82681', NULL, NULL, NULL, 0, 164875, '2024-07-16 09:05:41', NULL),
(43, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 959085, '2024-07-16 09:05:41', NULL),
(44, 'ZSR82681', NULL, NULL, NULL, 0, 181627, '2024-07-16 09:05:41', NULL),
(45, 'ZSR82681', 'Billing Department', 'Invoice Paid', 'Invoice Has Been Paid From Donald Tramp In The Amount Of $5000', 0, 920638, '2024-07-16 09:05:41', NULL),
(46, 'ZSR82681', 'Billing Department', 'Invoice Declined', 'Invoice Has Been Declined From Donald Tramp In The Amount Of $5000', 0, 888940, '2024-07-16 09:05:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT (NULL),
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT (NULL),
  `skin` text DEFAULT (NULL),
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_outfits`
--

INSERT INTO `player_outfits` (`id`, `citizenid`, `outfitname`, `model`, `skin`, `outfitId`) VALUES
(1, 'ZSR82681', 'short', '1885233650', '{\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":51},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":19},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":24},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":55},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":58},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0}}', 'outfit-4-6400'),
(2, 'ZSR82681', 'long', '1885233650', '{\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":51},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":20},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":24},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":317},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":-1,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":58},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0}}', 'outfit-5-9249'),
(3, 'ZSR82681', 'trooper', '1885233650', '{\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":51},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":20},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":24},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":3,\"defaultTexture\":0,\"defaultItem\":0,\"item\":317},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":58},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":58},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0}}', 'outfit-1-6294'),
(4, 'ZSR82681', 'trooper black', '1885233650', '{\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":51},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":20},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":24},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":8,\"defaultTexture\":0,\"defaultItem\":0,\"item\":317},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":3,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":58},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":58},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0}}', 'outfit-2-7901'),
(5, 'ZSR82681', 'swat', '1885233650', '{\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":24},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"facemix\":{\"defaultSkinMix\":0.0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"shapeMix\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":52},\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":-1},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":172},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"pants\":{\"texture\":1,\"defaultTexture\":0,\"defaultItem\":0,\"item\":130},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"torso2\":{\"texture\":3,\"defaultTexture\":0,\"defaultItem\":0,\"item\":336},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":133},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1,\"item\":150},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1,\"item\":-1},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"vest\":{\"texture\":2,\"defaultTexture\":0,\"defaultItem\":0,\"item\":15},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1,\"item\":15},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0,\"item\":0}}', 'outfit-2-5420');

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT (NULL),
  `citizenid` varchar(11) DEFAULT (NULL),
  `vehicle` varchar(50) DEFAULT (NULL),
  `hash` varchar(50) DEFAULT (NULL),
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT (NULL),
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT (NULL),
  `garage` varchar(50) DEFAULT (NULL),
  `fuel` int DEFAULT '100',
  `engine` float DEFAULT '1000',
  `body` float DEFAULT '1000',
  `state` int DEFAULT '1',
  `depotprice` int NOT NULL DEFAULT '0',
  `drivingdistance` int DEFAULT (NULL),
  `status` text DEFAULT (NULL),
  `balance` int NOT NULL DEFAULT '0',
  `paymentamount` int NOT NULL DEFAULT '0',
  `paymentsleft` int NOT NULL DEFAULT '0',
  `financetime` int NOT NULL DEFAULT '0',
  `glovebox` longtext,
  `trunk` longtext,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player_vehicles`
--

INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `glovebox`, `trunk`) VALUES
(14, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'bati', '-114291515', '{\"tireHealth\":{\"1\":1000.0,\"2\":0.0,\"3\":0.0,\"0\":1000.0},\"modLivery\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"tyreSmokeColor\":[255,255,255],\"interiorColor\":0,\"modSmokeEnabled\":false,\"modSpoilers\":-1,\"liveryRoof\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modTransmission\":-1,\"wheelSize\":0.0,\"modFrame\":-1,\"modStruts\":-1,\"modSeats\":-1,\"modAerials\":-1,\"modSpeakers\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"xenonColor\":255,\"dirtLevel\":7.14895411251853,\"modEngineBlock\":-1,\"modFrontWheels\":-1,\"wheels\":6,\"modHood\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"modSuspension\":-1,\"engineHealth\":1000.0592475178704,\"modArchCover\":-1,\"plateIndex\":0,\"modAirFilter\":-1,\"wheelWidth\":0.0,\"model\":-114291515,\"modEngine\":-1,\"modArmor\":-1,\"neonEnabled\":[false,false,false,false],\"modKit47\":-1,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"modTrimB\":-1,\"bodyHealth\":1000.0592475178704,\"tankHealth\":1000.0592475178704,\"modRoof\":-1,\"modKit49\":-1,\"modKit21\":-1,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":false,\"0\":false},\"modRearBumper\":-1,\"fuelLevel\":100.08535757525947,\"modShifterLeavers\":-1,\"modBrakes\":-1,\"modFender\":-1,\"modRightFender\":-1,\"modSteeringWheel\":-1,\"oilLevel\":4.76596940834568,\"modFrontBumper\":-1,\"color1\":5,\"modDoorSpeaker\":-1,\"wheelColor\":156,\"extras\":[],\"plate\":\"8NZ378SP\",\"pearlescentColor\":111,\"modHorns\":-1,\"modTurbo\":false,\"modCustomTiresF\":false,\"modHydrolic\":-1,\"neonColor\":[255,0,255],\"modTrimA\":-1,\"windowTint\":-1,\"modDial\":-1,\"modXenon\":false,\"modAPlate\":-1,\"modKit17\":-1,\"modExhaust\":-1,\"dashboardColor\":0,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modWindows\":-1,\"color2\":41,\"modGrille\":-1,\"modCustomTiresR\":false,\"modKit19\":-1,\"modTrunk\":-1}', '8NZ378SP', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"clutch\":100,\"axle\":98,\"brakes\":100,\"fuel\":98,\"radiator\":100}', 0, 0, 0, 0, NULL, NULL),
(15, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'zeno', '655665811', '{\"modEngineBlock\":-1,\"neonColor\":[255,0,255],\"modSuspension\":-1,\"modDial\":-1,\"wheelSize\":1.0,\"modWindows\":-1,\"modSmokeEnabled\":false,\"plate\":\"2MW158UE\",\"modAirFilter\":-1,\"modStruts\":-1,\"modArchCover\":-1,\"modDashboard\":-1,\"modKit19\":-1,\"modBrakes\":-1,\"engineHealth\":1000.0592475178704,\"dashboardColor\":134,\"modAPlate\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit47\":-1,\"modArmor\":-1,\"wheelWidth\":1.0,\"modExhaust\":-1,\"modSteeringWheel\":-1,\"modSpoilers\":-1,\"modTransmission\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTurbo\":false,\"xenonColor\":255,\"modAerials\":-1,\"modTrimA\":-1,\"plateIndex\":0,\"modTrunk\":-1,\"windowTint\":-1,\"tankHealth\":1000.0592475178704,\"modKit17\":-1,\"liveryRoof\":-1,\"modCustomTiresR\":false,\"model\":655665811,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modFrame\":-1,\"modGrille\":-1,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modFrontWheels\":-1,\"modLivery\":-1,\"color2\":0,\"modHydrolic\":-1,\"modXenon\":false,\"modShifterLeavers\":-1,\"modRearBumper\":-1,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"modEngine\":-1,\"color1\":111,\"modTank\":-1,\"modTrimB\":-1,\"modSeats\":-1,\"modFender\":-1,\"neonEnabled\":[false,false,false,false],\"bodyHealth\":1000.0592475178704,\"modOrnaments\":-1,\"modDoorSpeaker\":-1,\"wheels\":7,\"dirtLevel\":6.35462587779425,\"modSpeakers\":-1,\"modKit49\":-1,\"fuelLevel\":99.29102934053518,\"modHood\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modPlateHolder\":-1,\"modHorns\":-1,\"wheelColor\":0,\"extras\":[],\"pearlescentColor\":111,\"modKit21\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"oilLevel\":4.76596940834568,\"interiorColor\":93,\"modRoof\":-1,\"modCustomTiresF\":false,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}}', '2MW158UE', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"fuel\":100,\"clutch\":100,\"radiator\":100,\"brakes\":100,\"axle\":100}', 0, 0, 0, 0, NULL, NULL),
(16, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'ignus', '-1444114309', '{\"model\":-1444114309,\"modBackWheels\":-1,\"pearlescentColor\":73,\"plate\":\"8AS758FR\",\"modStruts\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"xenonColor\":255,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"oilLevel\":4.76596940834568,\"modKit21\":-1,\"modArmor\":-1,\"modDial\":-1,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modKit49\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"engineHealth\":1000.0592475178704,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modShifterLeavers\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"modTrunk\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"wheelWidth\":0.0,\"modKit47\":-1,\"modSteeringWheel\":-1,\"modKit19\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"bodyHealth\":1000.0592475178704,\"modHorns\":-1,\"wheels\":7,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modWindows\":-1,\"color2\":55,\"windowTint\":-1,\"wheelColor\":2,\"modFender\":-1,\"plateIndex\":0,\"modLivery\":-1,\"liveryRoof\":-1,\"tankHealth\":1000.0592475178704,\"modTrimB\":-1,\"modAirFilter\":-1,\"modTransmission\":-1,\"fuelLevel\":100.08535757525947,\"extras\":[],\"modRearBumper\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"wheelSize\":0.0,\"modTurbo\":false,\"modVanityPlate\":-1,\"modKit17\":-1,\"modTrimA\":-1,\"modHydrolic\":-1,\"modSuspension\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"interiorColor\":17,\"modRightFender\":-1,\"modPlateHolder\":-1,\"dirtLevel\":7.94328234724281,\"modFrame\":-1,\"modAerials\":-1,\"modSideSkirt\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"color1\":117,\"modExhaust\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dashboardColor\":156,\"modCustomTiresR\":false}', '8AS758FR', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"fuel\":100,\"axle\":100,\"clutch\":100,\"brakes\":100,\"radiator\":100}', 0, 0, 0, 0, NULL, NULL),
(17, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'ignus', '-1444114309', '{\"model\":-1444114309,\"modBackWheels\":-1,\"pearlescentColor\":62,\"plate\":\"2XM332FI\",\"modStruts\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"xenonColor\":255,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"oilLevel\":4.76596940834568,\"modKit21\":-1,\"modArmor\":-1,\"modDial\":-1,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modKit49\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"engineHealth\":1000.0592475178704,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modShifterLeavers\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"modTrunk\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"wheelWidth\":0.0,\"modKit47\":-1,\"modSteeringWheel\":-1,\"modKit19\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"bodyHealth\":1000.0592475178704,\"modHorns\":-1,\"wheels\":7,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modWindows\":-1,\"color2\":27,\"windowTint\":-1,\"wheelColor\":6,\"modFender\":-1,\"plateIndex\":0,\"modLivery\":-1,\"liveryRoof\":-1,\"tankHealth\":1000.0592475178704,\"modTrimB\":-1,\"modAirFilter\":-1,\"modTransmission\":-1,\"fuelLevel\":100.08535757525947,\"extras\":[],\"modRearBumper\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"wheelSize\":0.0,\"modTurbo\":false,\"modVanityPlate\":-1,\"modKit17\":-1,\"modTrimA\":-1,\"modHydrolic\":-1,\"modSuspension\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"interiorColor\":8,\"modRightFender\":-1,\"modPlateHolder\":-1,\"dirtLevel\":8.73761058196709,\"modFrame\":-1,\"modAerials\":-1,\"modSideSkirt\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"color1\":9,\"modExhaust\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dashboardColor\":156,\"modCustomTiresR\":false}', '2XM332FI', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(19, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'ignus', '-1444114309', '{\"model\":-1444114309,\"modBackWheels\":-1,\"pearlescentColor\":73,\"plate\":\"2KG173SV\",\"modStruts\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"xenonColor\":255,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"oilLevel\":4.76596940834568,\"modKit21\":-1,\"modArmor\":-1,\"modDial\":-1,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modKit49\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"engineHealth\":1000.0592475178704,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modShifterLeavers\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"modTrunk\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"wheelWidth\":0.0,\"modKit47\":-1,\"modSteeringWheel\":-1,\"modKit19\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"bodyHealth\":1000.0592475178704,\"modHorns\":-1,\"wheels\":7,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modWindows\":-1,\"color2\":55,\"windowTint\":-1,\"wheelColor\":2,\"modFender\":-1,\"plateIndex\":0,\"modLivery\":-1,\"liveryRoof\":-1,\"tankHealth\":1000.0592475178704,\"modTrimB\":-1,\"modAirFilter\":-1,\"modTransmission\":-1,\"fuelLevel\":100.08535757525947,\"extras\":[],\"modRearBumper\":-1,\"modGrille\":-1,\"modSmokeEnabled\":false,\"modEngineBlock\":-1,\"wheelSize\":0.0,\"modTurbo\":false,\"modVanityPlate\":-1,\"modKit17\":-1,\"modTrimA\":-1,\"modHydrolic\":-1,\"modSuspension\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"interiorColor\":17,\"modRightFender\":-1,\"modPlateHolder\":-1,\"dirtLevel\":3.17731293889712,\"modFrame\":-1,\"modAerials\":-1,\"modSideSkirt\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"color1\":117,\"modExhaust\":-1,\"modSeats\":-1,\"modFrontWheels\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dashboardColor\":156,\"modCustomTiresR\":false}', '2KG173SV', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"fuel\":100,\"clutch\":99,\"radiator\":100,\"brakes\":100,\"axle\":99}', 0, 0, 0, 0, NULL, NULL),
(20, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'coquette', '108773431', '{\"model\":108773431,\"modAerials\":-1,\"pearlescentColor\":111,\"modExhaust\":-1,\"modStruts\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"xenonColor\":255,\"modBrakes\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"oilLevel\":6.35462587779425,\"modKit21\":-1,\"modArmor\":-1,\"modTrimA\":-1,\"modAPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modKit49\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"engineHealth\":1000.0592475178704,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modShifterLeavers\":-1,\"modArchCover\":-1,\"modRoof\":-1,\"modKit17\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"color1\":6,\"modKit47\":-1,\"modSteeringWheel\":-1,\"modKit19\":-1,\"modXenon\":false,\"modDoorSpeaker\":-1,\"modSpoilers\":-1,\"bodyHealth\":1000.0592475178704,\"modHorns\":-1,\"wheels\":0,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modWindows\":-1,\"color2\":0,\"windowTint\":-1,\"wheelColor\":156,\"modFender\":-1,\"plateIndex\":0,\"modLivery\":-1,\"liveryRoof\":-1,\"tankHealth\":1000.0592475178704,\"modEngineBlock\":-1,\"modAirFilter\":-1,\"modTransmission\":-1,\"modTrimB\":-1,\"dirtLevel\":7.14895411251853,\"wheelSize\":0.0,\"modGrille\":-1,\"plate\":\"1QR879XE\",\"modPlateHolder\":-1,\"modSmokeEnabled\":false,\"modTurbo\":false,\"modVanityPlate\":-1,\"wheelWidth\":0.0,\"interiorColor\":0,\"modHydrolic\":-1,\"modSuspension\":-1,\"modTrunk\":-1,\"extras\":{\"11\":false,\"10\":false,\"1\":false,\"2\":true},\"modRightFender\":-1,\"neonEnabled\":[false,false,false,false],\"modCustomTiresR\":false,\"modFrame\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modFrontBumper\":-1,\"modDial\":-1,\"modBackWheels\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modSeats\":-1,\"modFrontWheels\":-1,\"fuelLevel\":100.08535757525947,\"dashboardColor\":0,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}}', '1QR879XE', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(21, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'ardent', '159274291', '{\"modTrimA\":-1,\"modKit47\":-1,\"interiorColor\":93,\"modKit17\":-1,\"modCustomTiresR\":false,\"modOrnaments\":-1,\"dashboardColor\":93,\"modFrontBumper\":-1,\"extras\":[],\"modDashboard\":-1,\"modKit19\":-1,\"modEngineBlock\":-1,\"modTurbo\":false,\"modArmor\":-1,\"wheelWidth\":0.0,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modTrunk\":-1,\"modAirFilter\":-1,\"modSpoilers\":-1,\"dirtLevel\":7.14895411251853,\"modSeats\":-1,\"plateIndex\":0,\"modGrille\":-1,\"modBrakes\":-1,\"modKit21\":-1,\"modDial\":-1,\"wheelSize\":0.0,\"modSideSkirt\":-1,\"modDoorSpeaker\":-1,\"modRightFender\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modAPlate\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheelColor\":112,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"color1\":88,\"xenonColor\":255,\"oilLevel\":6.35462587779425,\"liveryRoof\":-1,\"modKit49\":-1,\"plate\":\"5NK410EE\",\"neonColor\":[255,0,255],\"modExhaust\":-1,\"tankHealth\":1000.0592475178704,\"fuelLevel\":100.08535757525947,\"modEngine\":-1,\"modTank\":-1,\"modSteeringWheel\":-1,\"modSuspension\":-1,\"modTransmission\":-1,\"modLivery\":-1,\"engineHealth\":1000.0592475178704,\"pearlescentColor\":87,\"color2\":0,\"modRoof\":-1,\"modXenon\":false,\"bodyHealth\":1000.0592475178704,\"modAerials\":-1,\"modBackWheels\":-1,\"modShifterLeavers\":-1,\"modFrame\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modWindows\":-1,\"wheels\":1,\"modFender\":-1,\"model\":159274291,\"modTrimB\":-1,\"modStruts\":-1,\"modCustomTiresF\":false,\"modRearBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modPlateHolder\":-1,\"modSpeakers\":-1,\"modHorns\":-1,\"modHood\":-1,\"windowTint\":-1,\"modSmokeEnabled\":false,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modHydrolic\":-1}', '5NK410EE', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"clutch\":100,\"axle\":100,\"radiator\":98,\"fuel\":100,\"brakes\":100}', 0, 0, 0, 0, NULL, NULL),
(24, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'zeno', '655665811', '{\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modKit19\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modHydrolic\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modRightFender\":-1,\"wheelSize\":0.0,\"modKit17\":-1,\"xenonColor\":255,\"modBackWheels\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"modHorns\":-1,\"modVanityPlate\":-1,\"extras\":[],\"interiorColor\":93,\"modRoof\":-1,\"modKit49\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"tankHealth\":1000.0592475178704,\"modExhaust\":-1,\"neonEnabled\":[false,false,false,false],\"dashboardColor\":134,\"modArmor\":-1,\"modTurbo\":false,\"modFender\":-1,\"color2\":0,\"modKit47\":-1,\"modShifterLeavers\":-1,\"modAPlate\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modSideSkirt\":-1,\"modSuspension\":-1,\"modCustomTiresR\":false,\"modDoorSpeaker\":-1,\"dirtLevel\":0.0,\"model\":655665811,\"windowTint\":-1,\"modDial\":-1,\"modFrame\":-1,\"modSpoilers\":-1,\"modTrimA\":-1,\"oilLevel\":4.76596940834568,\"wheels\":7,\"modHood\":-1,\"modWindows\":-1,\"wheelColor\":0,\"fuelLevel\":100.08535757525947,\"modSeats\":-1,\"modAirFilter\":-1,\"bodyHealth\":1000.0592475178704,\"wheelWidth\":0.0,\"modDashboard\":-1,\"modGrille\":-1,\"color1\":111,\"modSpeakers\":-1,\"modFrontWheels\":-1,\"modLivery\":-1,\"tyreSmokeColor\":[255,255,255],\"pearlescentColor\":111,\"modCustomTiresF\":false,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTransmission\":-1,\"plateIndex\":0,\"modOrnaments\":-1,\"modFrontBumper\":-1,\"engineHealth\":1000.0592475178704,\"modXenon\":false,\"neonColor\":[255,0,255],\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modArchCover\":-1,\"modStruts\":-1,\"liveryRoof\":-1,\"modKit21\":-1,\"modAerials\":-1,\"plate\":\"7CQ898PE\"}', '7CQ898PE', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"radiator\":100,\"clutch\":98,\"axle\":100,\"brakes\":100,\"fuel\":100}', 0, 0, 0, 0, NULL, NULL),
(25, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'inductor', '-897824023', '{\"neonEnabled\":[false,false,false,false],\"modKit47\":-1,\"modSteeringWheel\":-1,\"modLivery\":-1,\"modEngineBlock\":-1,\"modTrimB\":-1,\"modSmokeEnabled\":false,\"modRoof\":-1,\"modSuspension\":-1,\"modXenon\":false,\"model\":-897824023,\"modTurbo\":false,\"plate\":\"3ES152HK\",\"modTank\":-1,\"wheels\":6,\"modVanityPlate\":-1,\"wheelWidth\":0.0,\"modEngine\":-1,\"xenonColor\":255,\"modCustomTiresR\":false,\"modAirFilter\":-1,\"modFrontWheels\":-1,\"dirtLevel\":7.14895411251853,\"modKit49\":-1,\"color2\":0,\"modOrnaments\":-1,\"fuelLevel\":100.08535757525947,\"modKit21\":-1,\"modFrontBumper\":-1,\"plateIndex\":0,\"modWindows\":-1,\"modHydrolic\":-1,\"modFrame\":-1,\"modGrille\":-1,\"modPlateHolder\":-1,\"pearlescentColor\":111,\"modStruts\":-1,\"modSeats\":-1,\"modHorns\":-1,\"modKit17\":-1,\"modRearBumper\":-1,\"windowTint\":-1,\"wheelSize\":0.0,\"wheelColor\":0,\"modTrimA\":-1,\"modRightFender\":-1,\"modKit19\":-1,\"modDoorSpeaker\":-1,\"modAerials\":-1,\"extras\":[],\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"modArchCover\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modDashboard\":-1,\"bodyHealth\":1000.0592475178704,\"interiorColor\":93,\"tyreSmokeColor\":[255,255,255],\"modSpoilers\":-1,\"oilLevel\":0.0,\"liveryRoof\":-1,\"modDial\":-1,\"modTrunk\":-1,\"modHood\":-1,\"engineHealth\":1000.0592475178704,\"modBackWheels\":-1,\"modExhaust\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":0.0,\"3\":0.0,\"0\":1000.0},\"dashboardColor\":134,\"color1\":111,\"modArmor\":-1,\"modFender\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"modTransmission\":-1,\"modSideSkirt\":-1,\"modCustomTiresF\":false,\"modAPlate\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modShifterLeavers\":-1,\"tankHealth\":1000.0592475178704,\"modBrakes\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}}', '3ES152HK', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(31, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'jester', '-1297672541', '{\"modTank\":-1,\"modSmokeEnabled\":false,\"modTrimA\":-1,\"xenonColor\":255,\"modStruts\":-1,\"extras\":[],\"modArchCover\":-1,\"modDashboard\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":86.58177758494668,\"modHorns\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTransmission\":2,\"color2\":89,\"modEngine\":3,\"liveryRoof\":-1,\"modSuspension\":3,\"modKit19\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modGrille\":-1,\"modCustomTiresF\":false,\"wheelSize\":0.67799997329711,\"modWindows\":-1,\"modSeats\":-1,\"modRoof\":0,\"engineHealth\":1000.0592475178704,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"47RTR238\",\"color1\":54,\"neonColor\":[255,0,255],\"tankHealth\":1000.0592475178704,\"modRearBumper\":1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modArmor\":4,\"neonEnabled\":[false,false,false,false],\"modDial\":-1,\"interiorColor\":0,\"modXenon\":false,\"modTrimB\":-1,\"modSpeakers\":-1,\"windowTint\":0,\"modCustomTiresR\":false,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":0.0,\"modFrame\":1,\"modFender\":-1,\"dashboardColor\":0,\"modKit47\":-1,\"modBackWheels\":-1,\"bodyHealth\":1000.0592475178704,\"modKit17\":-1,\"modKit49\":-1,\"modEngineBlock\":-1,\"pearlescentColor\":0,\"modSteeringWheel\":-1,\"wheels\":7,\"modAerials\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modFrontWheels\":15,\"modBrakes\":2,\"modExhaust\":2,\"plateIndex\":0,\"modAPlate\":-1,\"modKit21\":-1,\"modTurbo\":1,\"modHood\":-1,\"modPlateHolder\":-1,\"modSpoilers\":3,\"modVanityPlate\":-1,\"oilLevel\":4.76596940834568,\"model\":-1297672541,\"modAirFilter\":-1,\"modHydrolic\":-1,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modTrunk\":-1,\"wheelWidth\":0.5439977645874,\"modOrnaments\":-1,\"wheelColor\":89,\"modSideSkirt\":2,\"modFrontBumper\":2}', '47RTR239', NULL, 'pillboxgarage', 87, 1000, 1000, 1, 0, NULL, '{\"radiator\":100,\"axle\":100,\"brakes\":100,\"fuel\":100,\"clutch\":100}', 0, 0, 0, 0, NULL, NULL),
(36, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'italirsx', '-1149725334', '{\"modKit17\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modHydrolic\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modXenon\":false,\"windowTint\":-1,\"modFrontWheels\":-1,\"tankHealth\":1000.0592475178704,\"modHorns\":-1,\"liveryRoof\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":0.0,\"modHood\":-1,\"color1\":9,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modEngine\":-1,\"modFender\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modBrakes\":-1,\"modKit19\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"oilLevel\":4.76596940834568,\"modWindows\":-1,\"engineHealth\":1000.0592475178704,\"modKit49\":-1,\"color2\":91,\"wheelWidth\":1.0,\"modVanityPlate\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"69WIQ351\",\"neonColor\":[255,0,255],\"bodyHealth\":1000.0592475178704,\"interiorColor\":8,\"modShifterLeavers\":-1,\"fuelLevel\":99.29102934053518,\"modOrnaments\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheels\":7,\"modKit21\":-1,\"plateIndex\":0,\"modTransmission\":-1,\"wheelColor\":0,\"modCustomTiresF\":false,\"modTrimA\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modAPlate\":-1,\"modKit47\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modCustomTiresR\":false,\"modDial\":-1,\"modSuspension\":-1,\"modArchCover\":-1,\"pearlescentColor\":6,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"model\":-1149725334,\"modRearBumper\":-1,\"modRoof\":-1,\"modStruts\":-1,\"dashboardColor\":156,\"extras\":[],\"wheelSize\":1.0,\"modRightFender\":-1,\"xenonColor\":255,\"modDashboard\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modAirFilter\":-1}', '69WIQ351', NULL, 'pillboxgarage', 99, 1000, 1000, 1, 0, NULL, '{\"brakes\":100,\"axle\":100,\"fuel\":100,\"radiator\":100,\"clutch\":100}', 0, 0, 0, 0, NULL, NULL),
(40, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'jester', '-1297672541', '{\"oilLevel\":4.76596940834568,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"wheelSize\":0.67799997329711,\"modSuspension\":0,\"modWindows\":-1,\"liveryRoof\":-1,\"modHorns\":-1,\"plate\":\"81XPX423\",\"modSeats\":-1,\"modCustomTiresR\":false,\"modAerials\":-1,\"modTrunk\":-1,\"color1\":54,\"neonColor\":[255,0,255],\"modRoof\":0,\"modAirFilter\":-1,\"windowTint\":0,\"modAPlate\":-1,\"modFrontBumper\":2,\"wheels\":7,\"modKit47\":-1,\"neonEnabled\":[false,false,false,false],\"dashboardColor\":0,\"modTransmission\":-1,\"tankHealth\":1000.0592475178704,\"extras\":[],\"pearlescentColor\":0,\"modHood\":-1,\"modTank\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":false,\"modRearBumper\":1,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"plateIndex\":0,\"modFrame\":1,\"xenonColor\":255,\"modTrimA\":-1,\"modGrille\":-1,\"modArchCover\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modKit49\":-1,\"modSpoilers\":3,\"modBrakes\":-1,\"modStruts\":-1,\"modXenon\":false,\"modDial\":-1,\"model\":-1297672541,\"modTurbo\":false,\"modFender\":-1,\"engineHealth\":1000.0592475178704,\"modOrnaments\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modExhaust\":2,\"modRightFender\":-1,\"modKit17\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modShifterLeavers\":-1,\"wheelColor\":89,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modFrontWheels\":15,\"fuelLevel\":100.08535757525947,\"tyreSmokeColor\":[255,255,255],\"modDashboard\":-1,\"dirtLevel\":0.0,\"modDoorSpeaker\":-1,\"color2\":89,\"modKit19\":-1,\"modPlateHolder\":-1,\"interiorColor\":0,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modArmor\":-1,\"modLivery\":-1,\"modEngine\":-1,\"wheelWidth\":0.5439977645874,\"bodyHealth\":1000.0592475178704,\"modVanityPlate\":-1,\"modTrimB\":-1,\"modKit21\":-1,\"modSideSkirt\":2}', '81XPX423', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{\"radiator\":100,\"axle\":100,\"fuel\":100,\"brakes\":100,\"clutch\":100}', 0, 0, 0, 0, NULL, NULL),
(41, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'nimbus', '-1295027632', '{\"modGrille\":-1,\"wheelWidth\":0.0,\"modVanityPlate\":-1,\"modBrakes\":-1,\"modSuspension\":-1,\"modTransmission\":-1,\"modCustomTiresR\":false,\"modKit19\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"liveryRoof\":-1,\"modDoorSpeaker\":-1,\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modHydrolic\":-1,\"interiorColor\":0,\"modKit21\":-1,\"modOrnaments\":-1,\"modBackWheels\":-1,\"modArchCover\":-1,\"modDial\":-1,\"modHorns\":-1,\"tyreSmokeColor\":[255,255,255],\"modAirFilter\":-1,\"modExhaust\":-1,\"windowTint\":-1,\"oilLevel\":4.76596940834568,\"fuelLevel\":100.08535757525947,\"modRightFender\":-1,\"modPlateHolder\":-1,\"modShifterLeavers\":-1,\"plateIndex\":4,\"modKit17\":-1,\"modSpeakers\":-1,\"modSmokeEnabled\":false,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modLivery\":-1,\"modWindows\":-1,\"dashboardColor\":0,\"modFrontWheels\":-1,\"modTank\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modTrimB\":-1,\"tankHealth\":1000.0592475178704,\"color1\":111,\"neonEnabled\":[false,false,false,false],\"modFender\":-1,\"modArmor\":-1,\"modTrimA\":-1,\"engineHealth\":1000.0592475178704,\"xenonColor\":255,\"modKit49\":-1,\"dirtLevel\":3.17731293889712,\"wheelColor\":90,\"modXenon\":false,\"modTrunk\":-1,\"modTurbo\":false,\"wheels\":0,\"modEngine\":-1,\"model\":-1295027632,\"neonColor\":[255,0,255],\"modFrontBumper\":-1,\"modFrame\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"modSideSkirt\":-1,\"bodyHealth\":1000.0592475178704,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modStruts\":-1,\"color2\":126,\"modKit47\":-1,\"modHood\":-1,\"extras\":[],\"plate\":\"6RU634ZK\",\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modEngineBlock\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheelSize\":0.0,\"modSpoilers\":-1,\"modAerials\":-1,\"pearlescentColor\":0,\"modCustomTiresF\":false}', '6RU634ZK', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(42, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'fbi', '1127131465', '{}', '3BQ995ZF', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(43, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'rhino', '782665360', '{\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"bodyHealth\":997.6762628136975,\"modWindows\":-1,\"modHood\":-1,\"modTransmission\":-1,\"modHorns\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modDoorSpeaker\":-1,\"neonColor\":[255,0,255],\"color1\":131,\"modEngine\":-1,\"modSpoilers\":-1,\"wheels\":0,\"dashboardColor\":0,\"modSteeringWheel\":-1,\"windowTint\":-1,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"modFender\":-1,\"modTrimB\":-1,\"liveryRoof\":-1,\"tankHealth\":1000.0592475178704,\"modArmor\":-1,\"modEngineBlock\":-1,\"modSeats\":-1,\"modSpeakers\":-1,\"modCustomTiresF\":false,\"pearlescentColor\":132,\"modBrakes\":-1,\"modExhaust\":-1,\"oilLevel\":7.94328234724281,\"neonEnabled\":[false,false,false,false],\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modOrnaments\":-1,\"color2\":132,\"modFrame\":-1,\"modDial\":-1,\"modStruts\":-1,\"modTank\":-1,\"modPlateHolder\":-1,\"modKit17\":-1,\"modAerials\":-1,\"modCustomTiresR\":false,\"interiorColor\":0,\"modArchCover\":-1,\"xenonColor\":255,\"fuelLevel\":19.85820586810703,\"modRoof\":-1,\"modHydrolic\":-1,\"tyreSmokeColor\":[255,255,255],\"modKit47\":-1,\"modFrontWheels\":-1,\"modLivery\":-1,\"modAPlate\":-1,\"modSuspension\":-1,\"modTrimA\":-1,\"dirtLevel\":0.0,\"engineHealth\":1000.0592475178704,\"modBackWheels\":-1,\"modKit49\":-1,\"model\":782665360,\"modShifterLeavers\":-1,\"modRightFender\":-1,\"modSmokeEnabled\":false,\"modGrille\":-1,\"modXenon\":false,\"wheelColor\":156,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modAirFilter\":-1,\"modTrunk\":-1,\"wheelWidth\":0.0,\"modTurbo\":false,\"modVanityPlate\":-1,\"modKit19\":-1,\"modDashboard\":-1,\"extras\":{\"1\":true,\"2\":true,\"3\":true,\"4\":true,\"9\":true,\"5\":true,\"6\":true,\"7\":true,\"8\":true},\"plateIndex\":4,\"wheelSize\":0.0,\"plate\":\"60STT218\",\"modKit21\":-1}', '60STT218', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, '{\"axle\":100,\"radiator\":100,\"fuel\":100,\"brakes\":100,\"clutch\":100}', 0, 0, 0, 0, NULL, NULL),
(44, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'nimbus', '-1295027632', '{\"modKit17\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modHydrolic\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modXenon\":false,\"windowTint\":-1,\"modFrontWheels\":-1,\"tankHealth\":981.7896981192118,\"modHorns\":-1,\"liveryRoof\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":7.14895411251853,\"modHood\":-1,\"color1\":111,\"windowStatus\":{\"1\":false,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"modEngine\":-1,\"modFender\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modBrakes\":-1,\"modKit19\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"oilLevel\":4.76596940834568,\"modWindows\":-1,\"engineHealth\":914.271798167648,\"modKit49\":-1,\"color2\":126,\"wheelWidth\":1.0,\"modVanityPlate\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"0KG951RL\",\"neonColor\":[255,0,255],\"bodyHealth\":907.1228440551295,\"interiorColor\":0,\"modShifterLeavers\":-1,\"fuelLevel\":99.29102934053518,\"modOrnaments\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheels\":0,\"modKit21\":-1,\"plateIndex\":4,\"modTransmission\":-1,\"wheelColor\":90,\"modCustomTiresF\":false,\"modTrimA\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":911.1807250976563,\"3\":799.5068969726563,\"0\":1000.0},\"modAPlate\":-1,\"modKit47\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modCustomTiresR\":false,\"modDial\":-1,\"modSuspension\":-1,\"modArchCover\":-1,\"pearlescentColor\":0,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"model\":-1295027632,\"modRearBumper\":-1,\"modRoof\":-1,\"modStruts\":-1,\"dashboardColor\":0,\"extras\":[],\"wheelSize\":1.0,\"modRightFender\":-1,\"xenonColor\":255,\"modDashboard\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modAirFilter\":-1}', '0KG951RL', NULL, 'pillboxgarage', 100, 915, 907, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(45, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'luxor2', '-1214293858', '{\"modKit17\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modHydrolic\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modXenon\":false,\"windowTint\":-1,\"modFrontWheels\":-1,\"tankHealth\":1000.0592475178704,\"modHorns\":-1,\"liveryRoof\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":0.0,\"modHood\":-1,\"color1\":159,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":false,\"0\":true},\"modEngine\":-1,\"modFender\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modBrakes\":-1,\"modKit19\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"oilLevel\":4.76596940834568,\"modWindows\":-1,\"engineHealth\":1000.0592475178704,\"modKit49\":-1,\"color2\":0,\"wheelWidth\":1.0,\"modVanityPlate\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"5NJ180WK\",\"neonColor\":[255,0,255],\"bodyHealth\":1000.0592475178704,\"interiorColor\":0,\"modShifterLeavers\":-1,\"fuelLevel\":100.08535757525947,\"modOrnaments\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheels\":0,\"modKit21\":-1,\"plateIndex\":4,\"modTransmission\":-1,\"wheelColor\":156,\"modCustomTiresF\":false,\"modTrimA\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":0.0,\"0\":1000.0},\"modAPlate\":-1,\"modKit47\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modCustomTiresR\":false,\"modDial\":-1,\"modSuspension\":-1,\"modArchCover\":-1,\"pearlescentColor\":160,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"model\":-1214293858,\"modRearBumper\":-1,\"modRoof\":-1,\"modStruts\":-1,\"dashboardColor\":0,\"extras\":[],\"wheelSize\":1.0,\"modRightFender\":-1,\"xenonColor\":255,\"modDashboard\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modAirFilter\":-1}', '5NJ180WK', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(46, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'luxor2', '-1214293858', '{\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modTank\":-1,\"xenonColor\":255,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modSuspension\":-1,\"modAPlate\":-1,\"modTurbo\":false,\"wheelSize\":0.0,\"modCustomTiresR\":false,\"modSpeakers\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":false,\"0\":true},\"modDoorSpeaker\":-1,\"dashboardColor\":0,\"modWindows\":-1,\"color1\":159,\"modDial\":-1,\"wheelWidth\":0.0,\"interiorColor\":0,\"modHood\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"modXenon\":false,\"plate\":\"5FM277PQ\",\"modHorns\":-1,\"modKit19\":-1,\"wheels\":0,\"modHydrolic\":-1,\"modLivery\":-1,\"model\":-1214293858,\"modSpoilers\":-1,\"modArchCover\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"dirtLevel\":0.0,\"modSideSkirt\":-1,\"modKit49\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"bodyHealth\":1000.0592475178704,\"oilLevel\":4.76596940834568,\"modGrille\":-1,\"neonEnabled\":[false,false,false,false],\"modFrame\":-1,\"modCustomTiresF\":false,\"modKit17\":-1,\"wheelColor\":156,\"neonColor\":[255,0,255],\"modShifterLeavers\":-1,\"modTransmission\":-1,\"modKit47\":-1,\"modTrimB\":-1,\"modTrimA\":-1,\"modKit21\":-1,\"pearlescentColor\":160,\"modFrontBumper\":-1,\"modStruts\":-1,\"modAirFilter\":-1,\"engineHealth\":1000.0592475178704,\"modEngine\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plateIndex\":4,\"modTrunk\":-1,\"color2\":0,\"modRearBumper\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modFrontWheels\":-1,\"modArmor\":-1,\"modRoof\":-1,\"modSmokeEnabled\":false,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":0.0,\"0\":1000.0},\"modFender\":-1,\"extras\":[],\"modRightFender\":-1,\"fuelLevel\":96.90804463636234,\"modExhaust\":-1,\"tankHealth\":1000.0592475178704,\"liveryRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modAerials\":-1}', '5FM277PQ', NULL, 'intairport', 97, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(47, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'cargoplane', '368211810', '{\"modSteeringWheel\":-1,\"modBackWheels\":-1,\"modTank\":-1,\"xenonColor\":255,\"modFrontWheels\":-1,\"modSuspension\":-1,\"modAPlate\":-1,\"modTurbo\":false,\"wheelSize\":0.0,\"modCustomTiresR\":false,\"modSpeakers\":-1,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"modDoorSpeaker\":-1,\"dashboardColor\":0,\"fuelLevel\":100.08535757525947,\"modKit17\":-1,\"modDial\":-1,\"wheelWidth\":0.0,\"interiorColor\":0,\"modHood\":-1,\"modVanityPlate\":-1,\"modDashboard\":-1,\"tankHealth\":972.2577593025205,\"modExhaust\":-1,\"plate\":\"5AG171RU\",\"modHorns\":-1,\"neonEnabled\":[false,false,false,false],\"wheels\":0,\"modHydrolic\":-1,\"modLivery\":-1,\"model\":368211810,\"modSpoilers\":-1,\"modArchCover\":-1,\"modPlateHolder\":-1,\"modOrnaments\":-1,\"dirtLevel\":6.35462587779425,\"modSideSkirt\":-1,\"modKit49\":-1,\"modEngineBlock\":-1,\"windowTint\":-1,\"modArmor\":-1,\"oilLevel\":4.76596940834568,\"modGrille\":-1,\"modXenon\":false,\"modFrame\":-1,\"liveryRoof\":-1,\"plateIndex\":4,\"wheelColor\":156,\"modTrimB\":-1,\"modShifterLeavers\":-1,\"neonColor\":[255,0,255],\"modKit47\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modTrimA\":-1,\"modKit21\":-1,\"modBrakes\":-1,\"modFrontBumper\":-1,\"modStruts\":-1,\"engineHealth\":857.0801652674996,\"modSeats\":-1,\"modEngine\":-1,\"modAirFilter\":-1,\"modRearBumper\":-1,\"modRightFender\":-1,\"color2\":87,\"modSmokeEnabled\":false,\"pearlescentColor\":17,\"modTrunk\":-1,\"modWindows\":-1,\"modAerials\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modTransmission\":-1,\"modFender\":-1,\"extras\":{\"7\":false,\"8\":true},\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"bodyHealth\":655.3207936475322,\"modRoof\":-1,\"color1\":132,\"modKit19\":-1,\"tyreSmokeColor\":[255,255,255],\"modCustomTiresF\":false,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false}}', '5AG171RU', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(48, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'GOF52094', 'luxor', '621481054', '{\"fuelLevel\":100.08535757525947,\"modAPlate\":-1,\"neonEnabled\":[false,false,false,false],\"modCustomTiresF\":false,\"windowTint\":-1,\"modOrnaments\":-1,\"modFrame\":-1,\"modFrontWheels\":-1,\"interiorColor\":0,\"model\":621481054,\"modKit47\":-1,\"modTrunk\":-1,\"modDial\":-1,\"modShifterLeavers\":-1,\"dashboardColor\":0,\"plateIndex\":4,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modSteeringWheel\":-1,\"wheelSize\":0.0,\"wheelColor\":156,\"modLivery\":-1,\"modSeats\":-1,\"wheelWidth\":0.0,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":7.14895411251853,\"modRightFender\":-1,\"modKit49\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"modHorns\":-1,\"modArchCover\":-1,\"modGrille\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":false,\"0\":true},\"modAerials\":-1,\"pearlescentColor\":4,\"modRoof\":-1,\"neonColor\":[255,0,255],\"modSpoilers\":-1,\"modCustomTiresR\":false,\"modFrontBumper\":-1,\"modHood\":-1,\"modTransmission\":-1,\"modEngineBlock\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"color2\":0,\"plate\":\"4KX336RJ\",\"modFender\":-1,\"modRearBumper\":-1,\"modPlateHolder\":-1,\"modDashboard\":-1,\"modTurbo\":false,\"modKit19\":-1,\"modTrimB\":-1,\"modWindows\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":0.0,\"0\":1000.0},\"modXenon\":false,\"modAirFilter\":-1,\"bodyHealth\":1000.0592475178704,\"engineHealth\":1000.0592475178704,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modVanityPlate\":-1,\"color1\":112,\"modKit21\":-1,\"modHydrolic\":-1,\"liveryRoof\":-1,\"extras\":[],\"modTank\":-1,\"wheels\":0,\"modExhaust\":-1,\"modBrakes\":-1,\"modBackWheels\":-1,\"xenonColor\":255,\"modKit17\":-1,\"modArmor\":-1,\"tankHealth\":1000.0592475178704,\"modEngine\":-1,\"modTrimA\":-1,\"tyreSmokeColor\":[255,255,255],\"modSuspension\":-1,\"modSideSkirt\":-1,\"oilLevel\":4.76596940834568}', '4KX336RJ', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(49, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'rhino', '782665360', '{\"modKit17\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modHydrolic\":-1,\"modTrimB\":-1,\"modGrille\":-1,\"modXenon\":false,\"windowTint\":-1,\"modFrontWheels\":-1,\"tankHealth\":1000.0592475178704,\"modHorns\":-1,\"liveryRoof\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"dirtLevel\":0.0,\"modHood\":-1,\"color1\":131,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"modEngine\":-1,\"modFender\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"modBrakes\":-1,\"modKit19\":-1,\"modSteeringWheel\":-1,\"modTrunk\":-1,\"modExhaust\":-1,\"oilLevel\":7.94328234724281,\"modWindows\":-1,\"engineHealth\":1000.0592475178704,\"modKit49\":-1,\"color2\":132,\"wheelWidth\":0.0,\"modVanityPlate\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"plate\":\"89LZA631\",\"neonColor\":[255,0,255],\"bodyHealth\":1000.0592475178704,\"interiorColor\":0,\"modShifterLeavers\":-1,\"fuelLevel\":99.29102934053518,\"modOrnaments\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheels\":0,\"modKit21\":-1,\"plateIndex\":4,\"modTransmission\":-1,\"wheelColor\":156,\"modCustomTiresF\":false,\"modTrimA\":-1,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modAPlate\":-1,\"modKit47\":-1,\"modTurbo\":false,\"modAerials\":-1,\"modDoorSpeaker\":-1,\"modSpeakers\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modCustomTiresR\":false,\"modDial\":-1,\"modSuspension\":-1,\"modArchCover\":-1,\"pearlescentColor\":132,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"model\":782665360,\"modRearBumper\":-1,\"modRoof\":-1,\"modStruts\":-1,\"dashboardColor\":0,\"extras\":{\"8\":true,\"7\":true,\"9\":true,\"4\":true,\"3\":true,\"6\":true,\"5\":true,\"2\":true,\"1\":true},\"wheelSize\":0.0,\"modRightFender\":-1,\"xenonColor\":255,\"modDashboard\":-1,\"modSeats\":-1,\"modFrame\":-1,\"modAirFilter\":-1}', '89LZA631', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"brakes\":90,\"axle\":92,\"fuel\":88,\"radiator\":90,\"clutch\":92}', 0, 0, 0, 0, NULL, NULL),
(50, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'policeb', '-34623805', '{}', '9IP440NV', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, '{\"radiator\":100,\"fuel\":100,\"axle\":100,\"clutch\":100,\"brakes\":100}', 0, 0, 0, 0, NULL, NULL),
(51, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'nimbus', '-1295027632', '{\"modFender\":-1,\"model\":-1295027632,\"color1\":111,\"modSteeringWheel\":-1,\"dashboardColor\":0,\"modTrunk\":-1,\"modLivery\":-1,\"modKit17\":-1,\"modSpeakers\":-1,\"dirtLevel\":4.76596940834568,\"modKit21\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"wheelWidth\":0.0,\"modSeats\":-1,\"modTrimA\":-1,\"oilLevel\":4.76596940834568,\"modKit47\":-1,\"modSuspension\":-1,\"modTurbo\":false,\"modSideSkirt\":-1,\"modGrille\":-1,\"modShifterLeavers\":-1,\"modDial\":-1,\"tankHealth\":1000.0592475178704,\"modSmokeEnabled\":false,\"extras\":[],\"modXenon\":false,\"plate\":\"5UR812KJ\",\"modOrnaments\":-1,\"modAerials\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modEngineBlock\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit49\":-1,\"pearlescentColor\":0,\"modFrame\":-1,\"modSpoilers\":-1,\"modAPlate\":-1,\"modDashboard\":-1,\"engineHealth\":1000.0592475178704,\"modPlateHolder\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modVanityPlate\":-1,\"modWindows\":-1,\"fuelLevel\":100.08535757525947,\"modTank\":-1,\"neonEnabled\":[false,false,false,false],\"modHood\":-1,\"modKit19\":-1,\"modCustomTiresR\":false,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"bodyHealth\":1000.0592475178704,\"wheels\":0,\"color2\":126,\"modHydrolic\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modCustomTiresF\":false,\"modStruts\":-1,\"windowTint\":-1,\"wheelSize\":0.0,\"modEngine\":-1,\"modArmor\":-1,\"xenonColor\":255,\"modBrakes\":-1,\"modTransmission\":-1,\"modRightFender\":-1,\"liveryRoof\":-1,\"tyreSmokeColor\":[255,255,255],\"interiorColor\":0,\"neonColor\":[255,0,255],\"modRoof\":-1,\"plateIndex\":4,\"modHorns\":-1,\"modTrimB\":-1,\"modFrontWheels\":-1,\"modExhaust\":-1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"wheelColor\":90,\"modRearBumper\":-1,\"modArchCover\":-1}', '5UR812KJ', NULL, 'pillboxgarage', 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `glovebox`, `trunk`) VALUES
(52, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'bifta', '-349601129', '{\"modSmokeEnabled\":false,\"modTrunk\":-1,\"wheelColor\":92,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modGrille\":-1,\"dashboardColor\":0,\"modPlateHolder\":-1,\"modSpoilers\":1,\"modHood\":-1,\"modLivery\":-1,\"modKit17\":-1,\"bodyHealth\":895.2079205342652,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"interiorColor\":0,\"modDial\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"xenonColor\":255,\"modStruts\":-1,\"dirtLevel\":8.73761058196709,\"fuelLevel\":75.46118229880674,\"modKit47\":-1,\"windowTint\":0,\"modShifterLeavers\":-1,\"modRoof\":0,\"modFender\":-1,\"pearlescentColor\":55,\"wheelWidth\":0.43811330199241,\"modTank\":-1,\"liveryRoof\":-1,\"tankHealth\":997.6762628136975,\"modAerials\":-1,\"modArmor\":-1,\"modOrnaments\":-1,\"modSeats\":-1,\"neonColor\":[255,0,255],\"modAirFilter\":-1,\"modBackWheels\":-1,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"modXenon\":false,\"windowStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modEngineBlock\":-1,\"modSuspension\":-1,\"modAPlate\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"extras\":[],\"modFrontWheels\":7,\"modTrimA\":-1,\"modWindows\":-1,\"plateIndex\":0,\"plate\":\"65HHB010\",\"modHorns\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"modCustomTiresF\":false,\"color1\":140,\"modHydrolic\":-1,\"modKit21\":-1,\"wheels\":4,\"wheelSize\":0.588543176651,\"modKit49\":-1,\"modRightFender\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrame\":-1,\"modTurbo\":false,\"engineHealth\":1000.0592475178704,\"modKit19\":-1,\"modSideSkirt\":0,\"modDashboard\":-1,\"modEngine\":-1,\"modExhaust\":0,\"oilLevel\":7.94328234724281,\"model\":-349601129,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":988.2074584960938},\"color2\":137,\"modCustomTiresR\":false}', '65HHB010', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(53, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'luxor2', '-1214293858', '{\"wheels\":0,\"modArmor\":-1,\"modSideSkirt\":-1,\"modBrakes\":-1,\"extras\":[],\"modSpoilers\":-1,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit49\":-1,\"modLivery\":-1,\"color2\":0,\"modSuspension\":-1,\"modVanityPlate\":-1,\"model\":-1214293858,\"modTrimA\":-1,\"modRoof\":-1,\"modRearBumper\":-1,\"modKit19\":-1,\"wheelColor\":156,\"modKit47\":-1,\"dirtLevel\":4.76596940834568,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0592475178704,\"modHydrolic\":-1,\"modSeats\":-1,\"modGrille\":-1,\"modSteeringWheel\":-1,\"modHorns\":-1,\"modTrunk\":-1,\"modFrontWheels\":-1,\"wheelSize\":0.0,\"modTurbo\":false,\"windowTint\":-1,\"pearlescentColor\":160,\"modKit21\":-1,\"modFrame\":-1,\"modCustomTiresR\":false,\"dashboardColor\":0,\"plate\":\"5AF207UP\",\"modFender\":-1,\"oilLevel\":4.76596940834568,\"modBackWheels\":-1,\"modRightFender\":-1,\"modAPlate\":-1,\"modDial\":-1,\"modPlateHolder\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":0.0,\"0\":1000.0},\"liveryRoof\":-1,\"modOrnaments\":-1,\"color1\":159,\"modTank\":-1,\"xenonColor\":255,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modTransmission\":-1,\"modAirFilter\":-1,\"modDoorSpeaker\":-1,\"windowStatus\":{\"1\":true,\"2\":true,\"3\":true,\"4\":false,\"5\":false,\"6\":true,\"7\":false,\"0\":true},\"modExhaust\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"wheelWidth\":0.0,\"modArchCover\":-1,\"modAerials\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modHood\":-1,\"modTrimB\":-1,\"fuelLevel\":100.08535757525947,\"modSpeakers\":-1,\"modEngine\":-1,\"modXenon\":false,\"modEngineBlock\":-1,\"modStruts\":-1,\"modKit17\":-1,\"engineHealth\":1000.0592475178704,\"interiorColor\":0,\"modCustomTiresF\":false,\"modWindows\":-1,\"neonEnabled\":[false,false,false,false],\"modFrontBumper\":-1,\"plateIndex\":4,\"tankHealth\":1000.0592475178704,\"neonColor\":[255,0,255],\"modDashboard\":-1}', '5AF207UP', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(54, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'police2', '-1627000575', '{}', '3QC342FJ', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, '{\"axle\":98,\"brakes\":100,\"fuel\":100,\"clutch\":100,\"radiator\":98}', 0, 0, 0, 0, NULL, NULL),
(55, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'police', '2046537925', '{}', '8ML491ME', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL),
(56, 'license:d33a5b39d8cd6e9d8ad1aa03247445abcbce52d6', 'ZSR82681', 'police2', '-1627000575', '{}', '4KN625SX', NULL, 'pillboxgarage', 100, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT (NULL),
  `targetIdentifier` varchar(50) DEFAULT (NULL),
  `reason` text DEFAULT (NULL),
  `warnId` varchar(50) DEFAULT (NULL),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `renzu_stores`
--

DROP TABLE IF EXISTS `renzu_stores`;
CREATE TABLE IF NOT EXISTS `renzu_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shop` varchar(60) DEFAULT NULL,
  `owner` varchar(64) DEFAULT NULL,
  `money` longtext,
  `items` longtext,
  `employee` longtext,
  `cashier` longtext,
  `customitems` longtext,
  `job` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
CREATE TABLE IF NOT EXISTS `society` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `money` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `society`
--

INSERT INTO `society` (`id`, `name`, `money`) VALUES
(1, 'police', '0'),
(2, 'lostmc', '0');

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

DROP TABLE IF EXISTS `stashitems`;
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stash` (`stash`)
) ENGINE=InnoDB AUTO_INCREMENT=2499 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stashitems`
--

INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
(1, '[blackmarket(1)]', '[{\"slot\":1,\"label\":\"Radio Scanner\",\"description\":\"With this you can get some police alerts. Not 100% effective however\",\"weight\":1000,\"name\":\"radioscanner\",\"useable\":false,\"amount\":4,\"image\":\"radioscanner.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Electronic Kit\",\"description\":\"If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?\",\"weight\":100,\"name\":\"electronickit\",\"useable\":true,\"amount\":3,\"image\":\"electronickit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Trojan USB\",\"description\":\"Handy software to shut down some systems\",\"weight\":0,\"name\":\"trojan_usb\",\"useable\":false,\"amount\":5,\"image\":\"usb_device.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Drill\",\"description\":\"The real deal...\",\"weight\":20000,\"name\":\"drill\",\"useable\":false,\"amount\":4,\"image\":\"drill.png\",\"unique\":false,\"type\":\"item\"}]'),
(2, '[blackmarket(2)]', '[{\"slot\":1,\"label\":\"Radio Scanner\",\"description\":\"With this you can get some police alerts. Not 100% effective however\",\"weight\":1000,\"name\":\"radioscanner\",\"useable\":false,\"amount\":1,\"image\":\"radioscanner.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Electronic Kit\",\"description\":\"If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?\",\"weight\":100,\"name\":\"electronickit\",\"useable\":true,\"amount\":2,\"image\":\"electronickit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Trojan USB\",\"description\":\"Handy software to shut down some systems\",\"weight\":0,\"name\":\"trojan_usb\",\"useable\":false,\"amount\":2,\"image\":\"usb_device.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Drill\",\"description\":\"The real deal...\",\"weight\":20000,\"name\":\"drill\",\"useable\":false,\"amount\":4,\"image\":\"drill.png\",\"unique\":false,\"type\":\"item\"}]'),
(3, '[blackmarket(3)]', '[{\"slot\":1,\"label\":\"Radio Scanner\",\"description\":\"With this you can get some police alerts. Not 100% effective however\",\"weight\":1000,\"name\":\"radioscanner\",\"useable\":false,\"amount\":5,\"image\":\"radioscanner.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Electronic Kit\",\"description\":\"If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?\",\"weight\":100,\"name\":\"electronickit\",\"useable\":true,\"amount\":2,\"image\":\"electronickit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Trojan USB\",\"description\":\"Handy software to shut down some systems\",\"weight\":0,\"name\":\"trojan_usb\",\"useable\":false,\"amount\":2,\"image\":\"usb_device.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Drill\",\"description\":\"The real deal...\",\"weight\":20000,\"name\":\"drill\",\"useable\":false,\"amount\":4,\"image\":\"drill.png\",\"unique\":false,\"type\":\"item\"}]'),
(4, '[blackmarket(4)]', '[{\"slot\":1,\"label\":\"Radio Scanner\",\"description\":\"With this you can get some police alerts. Not 100% effective however\",\"weight\":1000,\"name\":\"radioscanner\",\"useable\":false,\"amount\":1,\"image\":\"radioscanner.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Electronic Kit\",\"description\":\"If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?\",\"weight\":100,\"name\":\"electronickit\",\"useable\":true,\"amount\":3,\"image\":\"electronickit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Trojan USB\",\"description\":\"Handy software to shut down some systems\",\"weight\":0,\"name\":\"trojan_usb\",\"useable\":false,\"amount\":1,\"image\":\"usb_device.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Drill\",\"description\":\"The real deal...\",\"weight\":20000,\"name\":\"drill\",\"useable\":false,\"amount\":3,\"image\":\"drill.png\",\"unique\":false,\"type\":\"item\"}]'),
(5, '[blackmarket(5)]', '[{\"slot\":1,\"label\":\"Radio Scanner\",\"description\":\"With this you can get some police alerts. Not 100% effective however\",\"weight\":1000,\"name\":\"radioscanner\",\"useable\":false,\"amount\":5,\"image\":\"radioscanner.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Electronic Kit\",\"description\":\"If you\'ve always wanted to build a robot you can maybe start here. Maybe you\'ll be the new Elon Musk?\",\"weight\":100,\"name\":\"electronickit\",\"useable\":true,\"amount\":3,\"image\":\"electronickit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Trojan USB\",\"description\":\"Handy software to shut down some systems\",\"weight\":0,\"name\":\"trojan_usb\",\"useable\":false,\"amount\":5,\"image\":\"usb_device.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Drill\",\"description\":\"The real deal...\",\"weight\":20000,\"name\":\"drill\",\"useable\":false,\"amount\":2,\"image\":\"drill.png\",\"unique\":false,\"type\":\"item\"}]'),
(6, '[lostmc(1)]', '[{\"slot\":1,\"label\":\"Coffee\",\"description\":\"Pump 4 Caffeine\",\"weight\":200,\"name\":\"coffee\",\"useable\":true,\"amount\":318,\"image\":\"coffee.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":39,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"}]'),
(7, '[digitalden(1)]', '[{\"type\":\"item\",\"weight\":700,\"image\":\"phone.png\",\"useable\":false,\"amount\":36,\"label\":\"Phone\",\"slot\":1,\"description\":\"Neat phone ya got there\",\"unique\":true,\"name\":\"phone\"},{\"type\":\"item\",\"weight\":2000,\"image\":\"radio.png\",\"useable\":true,\"amount\":2,\"label\":\"Radio\",\"slot\":2,\"description\":\"You can communicate with this through a signal\",\"unique\":true,\"name\":\"radio\"},{\"type\":\"item\",\"weight\":1000,\"image\":\"screwdriverset.png\",\"useable\":false,\"amount\":3,\"label\":\"Toolkit\",\"slot\":3,\"description\":\"Very useful to screw... screws...\",\"unique\":false,\"name\":\"screwdriverset\"},{\"type\":\"item\",\"weight\":600,\"image\":\"binoculars.png\",\"useable\":true,\"amount\":20,\"label\":\"Binoculars\",\"slot\":4,\"description\":\"Sneaky Breaky...\",\"unique\":false,\"name\":\"binoculars\"},{\"type\":\"item\",\"weight\":500,\"image\":\"fitbit.png\",\"useable\":true,\"amount\":113,\"label\":\"Fitbit\",\"slot\":5,\"description\":\"I like fitbit\",\"unique\":true,\"name\":\"fitbit\"}]'),
(8, '[digitalden(2)]', '[{\"type\":\"item\",\"weight\":700,\"image\":\"phone.png\",\"useable\":false,\"amount\":22,\"label\":\"Phone\",\"slot\":1,\"description\":\"Neat phone ya got there\",\"unique\":true,\"name\":\"phone\"},{\"type\":\"item\",\"weight\":2000,\"image\":\"radio.png\",\"useable\":true,\"amount\":10,\"label\":\"Radio\",\"slot\":2,\"description\":\"You can communicate with this through a signal\",\"unique\":true,\"name\":\"radio\"},{\"type\":\"item\",\"weight\":1000,\"image\":\"screwdriverset.png\",\"useable\":false,\"amount\":1,\"label\":\"Toolkit\",\"slot\":3,\"description\":\"Very useful to screw... screws...\",\"unique\":false,\"name\":\"screwdriverset\"},{\"type\":\"item\",\"weight\":600,\"image\":\"binoculars.png\",\"useable\":true,\"amount\":38,\"label\":\"Binoculars\",\"slot\":4,\"description\":\"Sneaky Breaky...\",\"unique\":false,\"name\":\"binoculars\"},{\"type\":\"item\",\"weight\":500,\"image\":\"fitbit.png\",\"useable\":true,\"amount\":98,\"label\":\"Fitbit\",\"slot\":5,\"description\":\"I like fitbit\",\"unique\":true,\"name\":\"fitbit\"}]'),
(9, '[digitalden(3)]', '[{\"type\":\"item\",\"weight\":700,\"image\":\"phone.png\",\"useable\":false,\"amount\":49,\"label\":\"Phone\",\"slot\":1,\"description\":\"Neat phone ya got there\",\"unique\":true,\"name\":\"phone\"},{\"type\":\"item\",\"weight\":2000,\"image\":\"radio.png\",\"useable\":true,\"amount\":38,\"label\":\"Radio\",\"slot\":2,\"description\":\"You can communicate with this through a signal\",\"unique\":true,\"name\":\"radio\"},{\"type\":\"item\",\"weight\":1000,\"image\":\"screwdriverset.png\",\"useable\":false,\"amount\":46,\"label\":\"Toolkit\",\"slot\":3,\"description\":\"Very useful to screw... screws...\",\"unique\":false,\"name\":\"screwdriverset\"},{\"type\":\"item\",\"weight\":600,\"image\":\"binoculars.png\",\"useable\":true,\"amount\":38,\"label\":\"Binoculars\",\"slot\":4,\"description\":\"Sneaky Breaky...\",\"unique\":false,\"name\":\"binoculars\"},{\"type\":\"item\",\"weight\":500,\"image\":\"fitbit.png\",\"useable\":true,\"amount\":4,\"label\":\"Fitbit\",\"slot\":5,\"description\":\"I like fitbit\",\"unique\":true,\"name\":\"fitbit\"}]'),
(10, '[digitalden(4)]', '[{\"type\":\"item\",\"weight\":700,\"image\":\"phone.png\",\"useable\":false,\"amount\":23,\"label\":\"Phone\",\"slot\":1,\"description\":\"Neat phone ya got there\",\"unique\":true,\"name\":\"phone\"},{\"type\":\"item\",\"weight\":2000,\"image\":\"radio.png\",\"useable\":true,\"amount\":25,\"label\":\"Radio\",\"slot\":2,\"description\":\"You can communicate with this through a signal\",\"unique\":true,\"name\":\"radio\"},{\"type\":\"item\",\"weight\":1000,\"image\":\"screwdriverset.png\",\"useable\":false,\"amount\":10,\"label\":\"Toolkit\",\"slot\":3,\"description\":\"Very useful to screw... screws...\",\"unique\":false,\"name\":\"screwdriverset\"},{\"type\":\"item\",\"weight\":600,\"image\":\"binoculars.png\",\"useable\":true,\"amount\":2,\"label\":\"Binoculars\",\"slot\":4,\"description\":\"Sneaky Breaky...\",\"unique\":false,\"name\":\"binoculars\"},{\"type\":\"item\",\"weight\":500,\"image\":\"fitbit.png\",\"useable\":true,\"amount\":19,\"label\":\"Fitbit\",\"slot\":5,\"description\":\"I like fitbit\",\"unique\":true,\"name\":\"fitbit\"}]'),
(11, '[digitalden(5)]', '[{\"type\":\"item\",\"weight\":700,\"image\":\"phone.png\",\"useable\":false,\"amount\":11,\"label\":\"Phone\",\"slot\":1,\"description\":\"Neat phone ya got there\",\"unique\":true,\"name\":\"phone\"},{\"type\":\"item\",\"weight\":2000,\"image\":\"radio.png\",\"useable\":true,\"amount\":28,\"label\":\"Radio\",\"slot\":2,\"description\":\"You can communicate with this through a signal\",\"unique\":true,\"name\":\"radio\"},{\"type\":\"item\",\"weight\":1000,\"image\":\"screwdriverset.png\",\"useable\":false,\"amount\":38,\"label\":\"Toolkit\",\"slot\":3,\"description\":\"Very useful to screw... screws...\",\"unique\":false,\"name\":\"screwdriverset\"},{\"type\":\"item\",\"weight\":600,\"image\":\"binoculars.png\",\"useable\":true,\"amount\":27,\"label\":\"Binoculars\",\"slot\":4,\"description\":\"Sneaky Breaky...\",\"unique\":false,\"name\":\"binoculars\"},{\"type\":\"item\",\"weight\":500,\"image\":\"fitbit.png\",\"useable\":true,\"amount\":37,\"label\":\"Fitbit\",\"slot\":5,\"description\":\"I like fitbit\",\"unique\":true,\"name\":\"fitbit\"}]'),
(12, '[delvecchioliquor(1)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":43,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":8,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":49,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":20,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":38,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":39,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":17,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":16,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":3,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":32,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":40,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":3907,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(13, '[leisureshop(1)]', '[{\"slot\":1,\"label\":\"Parachute\",\"description\":\"The sky is the limit! Woohoo!\",\"weight\":30000,\"name\":\"parachute\",\"useable\":true,\"amount\":2,\"image\":\"parachute.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":28,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Diving Gear\",\"description\":\"An oxygen tank and a rebreather\",\"weight\":30000,\"name\":\"diving_gear\",\"useable\":true,\"amount\":5,\"image\":\"diving_gear.png\",\"unique\":true,\"type\":\"item\"}]'),
(14, '[247supermarket(1)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":47,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":50,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":32,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":34,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":30,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":28,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":45,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":46,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":50,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":1,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":18,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":1360,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(15, '[247supermarket(2)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":41,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":19,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":35,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":6,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":45,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":40,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":24,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":4,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":20,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":26,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":6,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":473,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(16, '[247supermarket(3)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":41,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":46,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":31,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":14,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":50,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":29,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":14,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":18,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":18,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":4,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":50,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":1722,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(17, '[247supermarket(4)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":37,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":15,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":13,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":17,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":25,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":20,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":29,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":5,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":41,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":49,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":39,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":2416,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(18, '[247supermarket(5)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":5,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":46,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":31,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":41,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":27,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":24,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":24,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":24,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":42,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":27,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":31,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":352,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(19, '[247supermarket(6)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":10,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":35,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":7,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":13,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":33,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":11,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":31,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":24,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":7,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":27,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":12,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":2872,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(20, '[247supermarket(7)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":34,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":47,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":22,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":35,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":4,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":35,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":6,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":29,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":37,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":32,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":4,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":3719,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(21, '[247supermarket(8)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":14,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":36,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":20,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":21,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":31,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":45,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":48,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":2,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":7,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":23,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":7,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":2313,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(22, '[247supermarket(9)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":16,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":49,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":10,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":44,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":45,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":28,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":44,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":15,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":19,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":11,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":12,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":1176,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(23, '[247supermarket(10)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":24,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":33,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":31,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":26,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":2,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":5,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":22,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":21,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":49,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":26,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":4,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":2309,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(24, '[247supermarket(11)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":6,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":4,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":40,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":8,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":45,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":28,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":50,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":1,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":49,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":18,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":12,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":4562,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(25, '[casino(1)]', '[{\"slot\":1,\"label\":\"Casino Chips\",\"description\":\"Chips For Casino Gambling\",\"weight\":0,\"name\":\"casinochips\",\"useable\":false,\"amount\":999999,\"image\":\"casinochips.png\",\"unique\":false,\"type\":\"item\"}]'),
(26, '[casino(2)]', '[{\"slot\":1,\"label\":\"Casino Chips\",\"description\":\"Chips For Casino Gambling\",\"weight\":0,\"name\":\"casinochips\",\"useable\":false,\"amount\":999999,\"image\":\"casinochips.png\",\"unique\":false,\"type\":\"item\"}]'),
(27, '[casino2(1)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":14,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":42,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":35,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":36,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(28, '[hardware(1)]', '[{\"slot\":1,\"label\":\"Lockpick\",\"description\":\"Very useful if you lose your keys a lot.. or if you want to use it for something else...\",\"weight\":300,\"name\":\"lockpick\",\"useable\":true,\"amount\":41,\"image\":\"lockpick.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Wrench\",\"description\":\"A tool used for gripping and turning nuts, bolts, pipes, etc\",\"weight\":1000,\"name\":\"weapon_wrench\",\"useable\":false,\"amount\":7,\"image\":\"weapon_wrench.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hammer\",\"description\":\"Used for jobs such as breaking things (legs) and driving in nails\",\"weight\":1000,\"name\":\"weapon_hammer\",\"useable\":false,\"amount\":84,\"image\":\"weapon_hammer.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":31,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":2500,\"name\":\"repairkit\",\"useable\":true,\"amount\":18,\"image\":\"repairkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":41,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":39,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":8,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":29,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":9,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":13,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"2Brothers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework1\",\"useable\":true,\"amount\":1,\"image\":\"firework1.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Poppelers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework2\",\"useable\":true,\"amount\":48,\"image\":\"firework2.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"WipeOut\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework3\",\"useable\":true,\"amount\":22,\"image\":\"firework3.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":13,\"label\":\"Weeping Willow\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework4\",\"useable\":true,\"amount\":9,\"image\":\"firework4.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":14,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":129,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":15,\"label\":\"Cleaning Kit\",\"description\":\"A microfiber cloth with some soap will let your car sparkle again!\",\"weight\":250,\"name\":\"cleaningkit\",\"useable\":true,\"amount\":52,\"image\":\"cleaningkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":16,\"label\":\"Advanced Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":4000,\"name\":\"advancedrepairkit\",\"useable\":true,\"amount\":23,\"image\":\"advancedkit.png\",\"unique\":false,\"type\":\"item\"}]');
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
(29, '[hardware(2)]', '[{\"slot\":1,\"label\":\"Lockpick\",\"description\":\"Very useful if you lose your keys a lot.. or if you want to use it for something else...\",\"weight\":300,\"name\":\"lockpick\",\"useable\":true,\"amount\":39,\"image\":\"lockpick.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Wrench\",\"description\":\"A tool used for gripping and turning nuts, bolts, pipes, etc\",\"weight\":1000,\"name\":\"weapon_wrench\",\"useable\":false,\"amount\":207,\"image\":\"weapon_wrench.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hammer\",\"description\":\"Used for jobs such as breaking things (legs) and driving in nails\",\"weight\":1000,\"name\":\"weapon_hammer\",\"useable\":false,\"amount\":179,\"image\":\"weapon_hammer.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":10,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":2500,\"name\":\"repairkit\",\"useable\":true,\"amount\":43,\"image\":\"repairkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":4,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":12,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":8,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":11,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":9,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":14,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"2Brothers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework1\",\"useable\":true,\"amount\":10,\"image\":\"firework1.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Poppelers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework2\",\"useable\":true,\"amount\":12,\"image\":\"firework2.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"WipeOut\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework3\",\"useable\":true,\"amount\":38,\"image\":\"firework3.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":13,\"label\":\"Weeping Willow\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework4\",\"useable\":true,\"amount\":24,\"image\":\"firework4.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":14,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":18,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":15,\"label\":\"Cleaning Kit\",\"description\":\"A microfiber cloth with some soap will let your car sparkle again!\",\"weight\":250,\"name\":\"cleaningkit\",\"useable\":true,\"amount\":36,\"image\":\"cleaningkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":16,\"label\":\"Advanced Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":4000,\"name\":\"advancedrepairkit\",\"useable\":true,\"amount\":44,\"image\":\"advancedkit.png\",\"unique\":false,\"type\":\"item\"}]'),
(30, '[hardware(3)]', '[{\"slot\":1,\"label\":\"Lockpick\",\"description\":\"Very useful if you lose your keys a lot.. or if you want to use it for something else...\",\"weight\":300,\"name\":\"lockpick\",\"useable\":true,\"amount\":48,\"image\":\"lockpick.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Wrench\",\"description\":\"A tool used for gripping and turning nuts, bolts, pipes, etc\",\"weight\":1000,\"name\":\"weapon_wrench\",\"useable\":false,\"amount\":72,\"image\":\"weapon_wrench.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hammer\",\"description\":\"Used for jobs such as breaking things (legs) and driving in nails\",\"weight\":1000,\"name\":\"weapon_hammer\",\"useable\":false,\"amount\":242,\"image\":\"weapon_hammer.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":27,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":2500,\"name\":\"repairkit\",\"useable\":true,\"amount\":4,\"image\":\"repairkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":21,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":22,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":8,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":26,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":9,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":30,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"2Brothers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework1\",\"useable\":true,\"amount\":1,\"image\":\"firework1.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Poppelers\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework2\",\"useable\":true,\"amount\":25,\"image\":\"firework2.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"WipeOut\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework3\",\"useable\":true,\"amount\":26,\"image\":\"firework3.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":13,\"label\":\"Weeping Willow\",\"description\":\"Fireworks\",\"weight\":1000,\"name\":\"firework4\",\"useable\":true,\"amount\":32,\"image\":\"firework4.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":14,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":122,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":15,\"label\":\"Cleaning Kit\",\"description\":\"A microfiber cloth with some soap will let your car sparkle again!\",\"weight\":250,\"name\":\"cleaningkit\",\"useable\":true,\"amount\":127,\"image\":\"cleaningkit.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":16,\"label\":\"Advanced Repairkit\",\"description\":\"A nice toolbox with stuff to repair your vehicle\",\"weight\":4000,\"name\":\"advancedrepairkit\",\"useable\":true,\"amount\":41,\"image\":\"advancedkit.png\",\"unique\":false,\"type\":\"item\"}]'),
(31, '[weedshop(1)]', '[{\"slot\":1,\"label\":\"Joint\",\"description\":\"Sidney would be very proud at you\",\"weight\":0,\"name\":\"joint\",\"useable\":true,\"amount\":4,\"image\":\"joint.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Poolcue\",\"description\":\"A stick used to strike a ball, usually the cue ball (or other things)\",\"weight\":1000,\"name\":\"weapon_poolcue\",\"useable\":false,\"amount\":979,\"image\":\"weapon_poolcue.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Plant Fertilizer\",\"description\":\"Plant nutrition\",\"weight\":2000,\"name\":\"weed_nutrition\",\"useable\":true,\"amount\":352,\"image\":\"weed_nutrition.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Empty Weed Bag\",\"description\":\"A small empty bag\",\"weight\":0,\"name\":\"empty_weed_bag\",\"useable\":true,\"amount\":491,\"image\":\"weed_baggy_empty.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":623,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(32, '[ammunation(1)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":20,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":180,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":65,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":5,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":89,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(33, '[ammunation(2)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":222,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":78,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":106,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":171,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(34, '[ammunation(3)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":240,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":79,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":18,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":155,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(35, '[ammunation(4)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":72,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":159,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":71,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":57,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(36, '[ammunation(5)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":130,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":83,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":204,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":80,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(37, '[ammunation(6)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":88,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":58,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":72,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":4,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":27,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(38, '[ammunation(7)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":104,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":137,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":226,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":4,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":4,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":5,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":7,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(39, '[ammunation(8)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":9,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":124,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":169,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":99,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(40, '[ammunation(9)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":90,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":215,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":70,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":1,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":5,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":207,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(41, '[ammunation(10)]', '[{\"slot\":1,\"label\":\"Knife\",\"description\":\"An instrument composed of a blade fixed into a handle, used for cutting or as a weapon\",\"weight\":1000,\"name\":\"weapon_knife\",\"useable\":false,\"amount\":77,\"image\":\"weapon_knife.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":2,\"label\":\"Bat\",\"description\":\"Used for hitting a ball in sports (or other things)\",\"weight\":1000,\"name\":\"weapon_bat\",\"useable\":false,\"amount\":49,\"image\":\"weapon_bat.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":3,\"label\":\"Hatchet\",\"description\":\"A small axe with a short handle for use in one hand\",\"weight\":1000,\"name\":\"weapon_hatchet\",\"useable\":false,\"amount\":179,\"image\":\"weapon_hatchet.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":4,\"label\":\"Walther P99\",\"description\":\"A small firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_pistol\",\"useable\":false,\"amount\":3,\"image\":\"weapon_pistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":5,\"label\":\"SNS Pistol\",\"description\":\"A very small firearm designed to be easily concealed\",\"weight\":1000,\"name\":\"weapon_snspistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_snspistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":6,\"label\":\"Vintage Pistol\",\"description\":\"An antique firearm designed to be held in one hand\",\"weight\":1000,\"name\":\"weapon_vintagepistol\",\"useable\":false,\"amount\":2,\"image\":\"weapon_vintagepistol.png\",\"unique\":true,\"type\":\"weapon\"},{\"slot\":7,\"label\":\"Pistol ammo\",\"description\":\"Ammo for Pistols\",\"weight\":200,\"name\":\"pistol_ammo\",\"useable\":true,\"amount\":222,\"image\":\"pistol_ammo.png\",\"unique\":false,\"type\":\"item\"}]'),
(42, '[ltdgasoline(1)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":14,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":8,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":32,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":46,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":5,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":47,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":7,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":13,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":33,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":32,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":28,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":1161,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(43, '[ltdgasoline(2)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":48,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":41,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":7,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":25,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":27,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":10,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":47,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":41,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":27,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":27,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":40,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":370,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(44, '[ltdgasoline(3)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":12,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":6,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":37,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":43,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":13,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":29,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":49,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":35,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":14,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":5,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":7,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":632,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(45, '[ltdgasoline(4)]', '[{\"slot\":1,\"label\":\"Grilled Cheese Sandwich\",\"description\":\"Nice to eat\",\"weight\":200,\"name\":\"tosti\",\"useable\":true,\"amount\":37,\"image\":\"tosti.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":49,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Cola\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"kurkakola\",\"useable\":true,\"amount\":19,\"image\":\"cola.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Twerks\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"twerks_candy\",\"useable\":true,\"amount\":6,\"image\":\"twerks_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Snikkel\",\"description\":\"Some delicious candy :O\",\"weight\":100,\"name\":\"snikkel_candy\",\"useable\":true,\"amount\":22,\"image\":\"snikkel_candy.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":6,\"label\":\"Sandwich\",\"description\":\"Nice bread for your stomach\",\"weight\":200,\"name\":\"sandwich\",\"useable\":true,\"amount\":45,\"image\":\"sandwich.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":7,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":39,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":8,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":22,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":9,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":22,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":10,\"label\":\"Bandage\",\"description\":\"A bandage works every time\",\"weight\":0,\"name\":\"bandage\",\"useable\":true,\"amount\":28,\"image\":\"bandage.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":11,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":47,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":12,\"label\":\"Rolling Paper\",\"description\":\"Paper made specifically for encasing and smoking tobacco or cannabis.\",\"weight\":0,\"name\":\"rolling_paper\",\"useable\":false,\"amount\":39,\"image\":\"rolling_paper.png\",\"unique\":false,\"type\":\"item\"}]'),
(46, '[seaworld(1)]', '[{\"slot\":1,\"label\":\"Diving Gear\",\"description\":\"An oxygen tank and a rebreather\",\"weight\":30000,\"name\":\"diving_gear\",\"useable\":true,\"amount\":6,\"image\":\"diving_gear.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Jerrycan 20L\",\"description\":\"A can full of Fuel\",\"weight\":20000,\"name\":\"jerry_can\",\"useable\":true,\"amount\":14,\"image\":\"jerry_can.png\",\"unique\":false,\"type\":\"item\"}]'),
(47, '[robsliquor(1)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":42,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":38,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":1,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":18,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(48, '[robsliquor(2)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":32,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":8,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":33,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":50,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(49, '[robsliquor(3)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":8,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":49,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":14,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":42,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(50, '[robsliquor(4)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":34,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":33,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":48,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":21,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(51, '[robsliquor(5)]', '[{\"slot\":1,\"label\":\"Bottle of Water\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"water_bottle\",\"useable\":true,\"amount\":9,\"image\":\"water_bottle.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Beer\",\"description\":\"Nothing like a good cold beer!\",\"weight\":500,\"name\":\"beer\",\"useable\":true,\"amount\":48,\"image\":\"beer.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":3,\"label\":\"Whiskey\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"whiskey\",\"useable\":true,\"amount\":19,\"image\":\"whiskey.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Vodka\",\"description\":\"For all the thirsty out there\",\"weight\":500,\"name\":\"vodka\",\"useable\":true,\"amount\":10,\"image\":\"vodka.png\",\"unique\":false,\"type\":\"item\"}]'),
(52, '[beancoffee(1)]', '[{\"slot\":1,\"label\":\"Coffee\",\"description\":\"Pump 4 Caffeine\",\"weight\":200,\"name\":\"coffee\",\"useable\":true,\"amount\":263,\"image\":\"coffee.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":3,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"}]'),
(53, '[beancoffee(2)]', '[{\"slot\":1,\"label\":\"Coffee\",\"description\":\"Pump 4 Caffeine\",\"weight\":200,\"name\":\"coffee\",\"useable\":true,\"amount\":426,\"image\":\"coffee.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":2,\"label\":\"Lighter\",\"description\":\"On new years eve a nice fire to stand next to\",\"weight\":0,\"name\":\"lighter\",\"useable\":false,\"amount\":16,\"image\":\"lighter.png\",\"unique\":false,\"type\":\"item\"}]'),
(1042, '[Apple(1)]', '[{\"slot\":1,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"useable\":false,\"image\":\"phone.png\",\"amount\":49,\"name\":\"phone\",\"info\":\"\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"useable\":true,\"image\":\"radio.png\",\"amount\":9,\"name\":\"radio\",\"info\":\"\",\"unique\":true,\"type\":\"item\"},{\"slot\":3,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"useable\":false,\"image\":\"screwdriverset.png\",\"amount\":28,\"name\":\"screwdriverset\",\"info\":\"\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"useable\":true,\"image\":\"binoculars.png\",\"amount\":48,\"name\":\"binoculars\",\"info\":\"\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"useable\":true,\"image\":\"fitbit.png\",\"amount\":146,\"name\":\"fitbit\",\"info\":\"\",\"unique\":true,\"type\":\"item\"}]'),
(1043, '[Apple(2)]', '[{\"slot\":1,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":38,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":17,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":3,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":44,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":31,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":119,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"}]'),
(1044, '[Apple(3)]', '[{\"slot\":1,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":4,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":26,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":3,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":1,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":45,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":7,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"}]'),
(1045, '[Apple(4)]', '[{\"slot\":1,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":25,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":43,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":3,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":47,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":16,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":142,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"}]'),
(1046, '[Apple(5)]', '[{\"slot\":1,\"label\":\"Phone\",\"description\":\"Neat phone ya got there\",\"weight\":700,\"name\":\"phone\",\"useable\":false,\"amount\":46,\"image\":\"phone.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":2,\"label\":\"Radio\",\"description\":\"You can communicate with this through a signal\",\"weight\":2000,\"name\":\"radio\",\"useable\":true,\"amount\":20,\"image\":\"radio.png\",\"unique\":true,\"type\":\"item\"},{\"slot\":3,\"label\":\"Toolkit\",\"description\":\"Very useful to screw... screws...\",\"weight\":1000,\"name\":\"screwdriverset\",\"useable\":false,\"amount\":17,\"image\":\"screwdriverset.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":4,\"label\":\"Binoculars\",\"description\":\"Sneaky Breaky...\",\"weight\":600,\"name\":\"binoculars\",\"useable\":true,\"amount\":6,\"image\":\"binoculars.png\",\"unique\":false,\"type\":\"item\"},{\"slot\":5,\"label\":\"Fitbit\",\"description\":\"I like fitbit\",\"weight\":500,\"name\":\"fitbit\",\"useable\":true,\"amount\":144,\"image\":\"fitbit.png\",\"unique\":true,\"type\":\"item\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `stashitemsnew`
--

DROP TABLE IF EXISTS `stashitemsnew`;
CREATE TABLE IF NOT EXISTS `stashitemsnew` (
  `id` int NOT NULL,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_history`
--

DROP TABLE IF EXISTS `transaction_history`;
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `trans_id` int NOT NULL,
  `account` text NOT NULL,
  `amount` int NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

DROP TABLE IF EXISTS `trunkitems`;
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitemsnew`
--

DROP TABLE IF EXISTS `trunkitemsnew`;
CREATE TABLE IF NOT EXISTS `trunkitemsnew` (
  `id` int NOT NULL,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pefcl_shared_accounts`
--
ALTER TABLE `pefcl_shared_accounts`
  ADD CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pefcl_transactions`
--
ALTER TABLE `pefcl_transactions`
  ADD CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
