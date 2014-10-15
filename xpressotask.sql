-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2014 at 05:45 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `xpressotask`
--

-- --------------------------------------------------------

--
-- Table structure for table `acc_type`
--

CREATE TABLE IF NOT EXISTS `acc_type` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acc_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `acc_type_acc_type` (`acc_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `acc_type`
--

INSERT INTO `acc_type` (`_id`, `acc_type`) VALUES
(1, 'Admin'),
(2, 'Manager'),
(3, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `ed_level`
--

CREATE TABLE IF NOT EXISTS `ed_level` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ed_level` varchar(60) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `createdby` (`createdby`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ed_level`
--

INSERT INTO `ed_level` (`_id`, `ed_level`, `cdate`, `createdby`) VALUES
(2, 'Master in Computer Science', '2014-10-13 00:00:00', 1),
(3, 'Information Technology', '2014-10-13 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ed_subject`
--

CREATE TABLE IF NOT EXISTS `ed_subject` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ed_level_id` int(10) unsigned NOT NULL,
  `subject` varchar(60) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `subject_FKIndex1` (`ed_level_id`),
  KEY `createdby` (`createdby`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ed_subject`
--

INSERT INTO `ed_subject` (`_id`, `ed_level_id`, `subject`, `cdate`, `createdby`) VALUES
(2, 3, 'Oracle', '2014-10-13 00:00:00', 1),
(3, 2, 'Math', '2014-10-13 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question` text,
  `questiontype` int(10) unsigned DEFAULT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `ed_level_id` int(10) unsigned NOT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `createdby` (`createdby`),
  KEY `questiontype` (`questiontype`),
  KEY `subject_id` (`subject_id`),
  KEY `ed_level_id` (`ed_level_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`_id`, `question`, `questiontype`, `subject_id`, `ed_level_id`, `createdby`) VALUES
(1, 'What is the sum of 2+2', 2, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questiontype`
--

CREATE TABLE IF NOT EXISTS `questiontype` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `listtitle` varchar(20) DEFAULT NULL,
  `createdby` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `listtitle` (`listtitle`),
  KEY `createdby` (`createdby`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `questiontype`
--

INSERT INTO `questiontype` (`_id`, `listtitle`, `createdby`) VALUES
(1, 'Multiple choice, Mul', 1),
(2, 'Multiple choice, Sin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_option`
--

CREATE TABLE IF NOT EXISTS `question_option` (
  `_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `questions_id` int(10) unsigned NOT NULL,
  `q_opt` text,
  `createdby` int(10) unsigned DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `rightoption` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`_id`),
  KEY `answer_FKIndex1` (`questions_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `question_option`
--

INSERT INTO `question_option` (`_id`, `questions_id`, `q_opt`, `createdby`, `date`, `rightoption`) VALUES
(3, 1, 'Sum of 2+2=1', 1, '2014-10-13 00:00:00', 0),
(4, 1, 'Sum of 2+2=2', 1, '2014-10-13 00:00:00', 0),
(5, 1, 'Sum of 2+2=3', 1, '2014-10-13 00:00:00', 0),
(6, 1, 'Sum of 2+2=4', 1, '2014-10-13 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sessiontoken` varchar(60) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `browsertype` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `logout` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `session_FKIndex1` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `userauth`
--

CREATE TABLE IF NOT EXISTS `userauth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usrname` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `lastIP` varchar(20) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `acc_type` int(10) unsigned NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `remember_token` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `acc_type` (`acc_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `userauth`
--

INSERT INTO `userauth` (`id`, `usrname`, `email`, `password`, `lastIP`, `active`, `verified`, `acc_type`, `updated_at`, `created_at`, `remember_token`) VALUES
(1, 'saqib', 'saqibbaig@gmail.com', '$2y$10$dSpkcGKOON45OQ0tKW/gley0zVvbcWtLykodtBGYCB1Yc2ukG0FhS', NULL, 1, 1, 1, '2014-10-15 03:41:23', '0000-00-00 00:00:00', 'pH8rsaAbFPprrlmCUb1DPXiW335rkA3bBigZQNxDGv8nXZxjvI2r70SgwB16'),
(4, 'saqibmgr', 'saqib@manager.com', '$2y$10$u4ExZsQrdW0RZPhDRJtwkeBy/9A4cj7il0Jux7dvdCToJA/JQ7lsi', '::1', 1, 1, 2, '2014-10-15 03:08:38', '2014-10-14 18:56:15', 'YViCjYK1huMmN4ifmNLVROF44o4Mn3QwQo355jdwsinM2jZZmosvw7cHhcqv'),
(5, 'saqibusr', 'saqib@user.com', '$2y$10$O6QI9iPOzW17.x01vuCkcOTTi8SFHChldLRoPN.s7/ENVMJJAAC7.', '::1', 1, 1, 3, '2014-10-15 03:08:21', '2014-10-14 18:57:29', 'F9An8pND64J1ohGg1gmQQKJ2NE7XTJG07th5qstSnEkBB0SaK7Wf1IBYYhkC');

-- --------------------------------------------------------

--
-- Table structure for table `userdetail`
--

CREATE TABLE IF NOT EXISTS `userdetail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `address1` varchar(60) DEFAULT NULL,
  `address2` varchar(60) DEFAULT NULL,
  `County` varchar(15) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `landline` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserDetail_FKIndex1` (`firstname`,`lastname`,`country`,`County`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `userdetail`
--

INSERT INTO `userdetail` (`id`, `user_id`, `firstname`, `lastname`, `address1`, `address2`, `County`, `country`, `landline`, `mobile`) VALUES
(1, 1, 'mirza saqib', 'baig', 'ard abhainn', '', 'Cork', 'Ireland', '876350875', '444433'),
(2, 4, 'Manager', 'Account', NULL, NULL, 'Cork', NULL, NULL, NULL),
(3, 5, 'User', 'Account', NULL, NULL, 'Cork', 'ire', '00', '00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ed_level`
--
ALTER TABLE `ed_level`
  ADD CONSTRAINT `ed_level_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `userauth` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ed_subject`
--
ALTER TABLE `ed_subject`
  ADD CONSTRAINT `ed_subject_ibfk_1` FOREIGN KEY (`ed_level_id`) REFERENCES `ed_level` (`_id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `ed_subject_ibfk_2` FOREIGN KEY (`createdby`) REFERENCES `userauth` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `userauth` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`questiontype`) REFERENCES `questiontype` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `ed_subject` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `questions_ibfk_4` FOREIGN KEY (`ed_level_id`) REFERENCES `ed_level` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `questiontype`
--
ALTER TABLE `questiontype`
  ADD CONSTRAINT `questiontype_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `userauth` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `question_option`
--
ALTER TABLE `question_option`
  ADD CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userauth` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `userauth`
--
ALTER TABLE `userauth`
  ADD CONSTRAINT `userauth_ibfk_1` FOREIGN KEY (`acc_type`) REFERENCES `acc_type` (`_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `userdetail`
--
ALTER TABLE `userdetail`
  ADD CONSTRAINT `userdetail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userauth` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
