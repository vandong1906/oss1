-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2024 at 11:31 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bugs`
--
CREATE DATABASE IF NOT EXISTS `bugs` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bugs`;

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE IF NOT EXISTS `attachments` (
  `attach_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `creation_ts` datetime NOT NULL,
  `modification_time` datetime NOT NULL,
  `description` tinytext NOT NULL,
  `mimetype` tinytext NOT NULL,
  `ispatch` tinyint(4) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL,
  `submitter_id` mediumint(9) NOT NULL,
  `isobsolete` tinyint(4) NOT NULL DEFAULT '0',
  `isprivate` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attach_id`),
  KEY `attachments_bug_id_idx` (`bug_id`),
  KEY `attachments_creation_ts_idx` (`creation_ts`),
  KEY `attachments_modification_time_idx` (`modification_time`),
  KEY `attachments_submitter_id_idx` (`submitter_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `attach_data`
--

CREATE TABLE IF NOT EXISTS `attach_data` (
  `id` mediumint(9) NOT NULL,
  `thedata` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 MAX_ROWS=100000 AVG_ROW_LENGTH=1000000;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE IF NOT EXISTS `audit_log` (
  `user_id` mediumint(9) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `object_id` int(11) NOT NULL,
  `field` varchar(64) NOT NULL,
  `removed` mediumtext,
  `added` mediumtext,
  `at_time` datetime NOT NULL,
  KEY `audit_log_class_idx` (`class`,`at_time`),
  KEY `fk_audit_log_user_id_profiles_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`user_id`, `class`, `object_id`, `field`, `removed`, `added`, `at_time`) VALUES
(NULL, 'Bugzilla::Field', 1, '__create__', NULL, 'bug_id', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 2, '__create__', NULL, 'short_desc', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 3, '__create__', NULL, 'classification', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 4, '__create__', NULL, 'product', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 5, '__create__', NULL, 'version', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 6, '__create__', NULL, 'rep_platform', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 7, '__create__', NULL, 'bug_file_loc', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 8, '__create__', NULL, 'op_sys', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 9, '__create__', NULL, 'bug_status', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 10, '__create__', NULL, 'status_whiteboard', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 11, '__create__', NULL, 'keywords', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 12, '__create__', NULL, 'resolution', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 13, '__create__', NULL, 'bug_severity', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 14, '__create__', NULL, 'priority', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 15, '__create__', NULL, 'component', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 16, '__create__', NULL, 'assigned_to', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 17, '__create__', NULL, 'reporter', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 18, '__create__', NULL, 'qa_contact', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 19, '__create__', NULL, 'assigned_to_realname', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 20, '__create__', NULL, 'reporter_realname', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 21, '__create__', NULL, 'qa_contact_realname', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 22, '__create__', NULL, 'cc', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 23, '__create__', NULL, 'dependson', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 24, '__create__', NULL, 'blocked', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 25, '__create__', NULL, 'attachments.description', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 26, '__create__', NULL, 'attachments.filename', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 27, '__create__', NULL, 'attachments.mimetype', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 28, '__create__', NULL, 'attachments.ispatch', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 29, '__create__', NULL, 'attachments.isobsolete', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 30, '__create__', NULL, 'attachments.isprivate', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 31, '__create__', NULL, 'attachments.submitter', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 32, '__create__', NULL, 'target_milestone', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 33, '__create__', NULL, 'creation_ts', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 34, '__create__', NULL, 'delta_ts', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 35, '__create__', NULL, 'longdesc', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 36, '__create__', NULL, 'longdescs.isprivate', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 37, '__create__', NULL, 'longdescs.count', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 38, '__create__', NULL, 'alias', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 39, '__create__', NULL, 'everconfirmed', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 40, '__create__', NULL, 'reporter_accessible', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 41, '__create__', NULL, 'cclist_accessible', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 42, '__create__', NULL, 'bug_group', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 43, '__create__', NULL, 'estimated_time', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 44, '__create__', NULL, 'remaining_time', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 45, '__create__', NULL, 'deadline', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 46, '__create__', NULL, 'commenter', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 47, '__create__', NULL, 'flagtypes.name', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 48, '__create__', NULL, 'requestees.login_name', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 49, '__create__', NULL, 'setters.login_name', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 50, '__create__', NULL, 'work_time', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 51, '__create__', NULL, 'percentage_complete', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 52, '__create__', NULL, 'content', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 53, '__create__', NULL, 'attach_data.thedata', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 54, '__create__', NULL, 'owner_idle_time', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 55, '__create__', NULL, 'see_also', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 56, '__create__', NULL, 'tag', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 57, '__create__', NULL, 'last_visit_ts', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 58, '__create__', NULL, 'comment_tag', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Field', 59, '__create__', NULL, 'days_elapsed', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Classification', 1, '__create__', NULL, 'Unclassified', '2024-11-30 11:47:38'),
(NULL, 'Bugzilla::Group', 1, '__create__', NULL, 'admin', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 2, '__create__', NULL, 'tweakparams', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 3, '__create__', NULL, 'editusers', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 4, '__create__', NULL, 'creategroups', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 5, '__create__', NULL, 'editclassifications', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 6, '__create__', NULL, 'editcomponents', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 7, '__create__', NULL, 'editkeywords', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 8, '__create__', NULL, 'editbugs', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 9, '__create__', NULL, 'canconfirm', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 10, '__create__', NULL, 'bz_canusewhineatothers', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 11, '__create__', NULL, 'bz_canusewhines', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 12, '__create__', NULL, 'bz_sudoers', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 13, '__create__', NULL, 'bz_sudo_protect', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::Group', 14, '__create__', NULL, 'bz_quip_moderators', '2024-11-30 11:47:41'),
(NULL, 'Bugzilla::User', 1, '__create__', NULL, 'dangtandat43@gmail.com', '2024-11-30 11:48:04'),
(NULL, 'Bugzilla::Product', 1, '__create__', NULL, 'TestProduct', '2024-11-30 11:48:04'),
(NULL, 'Bugzilla::Version', 1, '__create__', NULL, 'unspecified', '2024-11-30 11:48:04'),
(NULL, 'Bugzilla::Milestone', 1, '__create__', NULL, '---', '2024-11-30 11:48:04'),
(NULL, 'Bugzilla::Component', 1, '__create__', NULL, 'TestComponent', '2024-11-30 11:48:04'),
(1, 'Bugzilla::Product', 2, '__create__', NULL, 'Web Bán Giày', '2024-12-11 09:19:45'),
(1, 'Bugzilla::Version', 2, '__create__', NULL, 'unspecified', '2024-12-11 09:19:45'),
(1, 'Bugzilla::Milestone', 2, '__create__', NULL, '---', '2024-12-11 09:19:45'),
(1, 'Bugzilla::Component', 2, '__create__', NULL, 'mangingProduct', '2024-12-11 09:19:45'),
(1, 'Bugzilla::User', 2, '__create__', NULL, 'Minh@gmail.com', '2024-12-13 20:20:18'),
(1, 'Bugzilla::User', 3, '__create__', NULL, 'Dong@gmail.com', '2024-12-13 20:21:09'),
(1, 'Bugzilla::User', 4, '__create__', NULL, 'Phuong@gmail.com', '2024-12-13 20:21:52'),
(1, 'Bugzilla::Component', 3, '__create__', NULL, 'ProductCart', '2024-12-13 20:23:55'),
(1, 'Bugzilla::Component', 4, '__create__', NULL, 'Login and register', '2024-12-13 20:32:03'),
(1, 'Bugzilla::Component', 5, '__create__', NULL, 'DELETE', '2024-12-13 20:56:07'),
(1, 'Bugzilla::Product', 3, '__create__', NULL, 'Web Bán Giày(đồ án)', '2024-12-14 15:28:23'),
(1, 'Bugzilla::Version', 3, '__create__', NULL, 'unspecified', '2024-12-14 15:28:23'),
(1, 'Bugzilla::Milestone', 3, '__create__', NULL, '---', '2024-12-14 15:28:23'),
(1, 'Bugzilla::Component', 6, '__create__', NULL, 'mangingProduct', '2024-12-14 15:28:24'),
(1, 'Bugzilla::Component', 7, '__create__', NULL, 'ProductCart', '2024-12-14 15:28:48'),
(1, 'Bugzilla::Component', 8, '__create__', NULL, 'Login and register', '2024-12-14 15:29:10'),
(1, 'Bugzilla::Product', 2, 'name', 'Web Bán Giày', 'DELETE', '2024-12-14 15:52:07'),
(1, 'Bugzilla::Product', 2, 'description', 'đồ án web bán giày', 'Thư mục để xóa những thứ lỗi', '2024-12-14 15:52:53'),
(1, 'Bugzilla::Component', 7, 'name', 'ProductCart', 'ShoppingCart', '2024-12-20 17:11:40');

-- --------------------------------------------------------

--
-- Table structure for table `bugs`
--

CREATE TABLE IF NOT EXISTS `bugs` (
  `bug_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `assigned_to` mediumint(9) NOT NULL,
  `bug_file_loc` mediumtext NOT NULL,
  `bug_severity` varchar(64) NOT NULL,
  `bug_status` varchar(64) NOT NULL,
  `creation_ts` datetime DEFAULT NULL,
  `delta_ts` datetime NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `op_sys` varchar(64) NOT NULL,
  `priority` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `rep_platform` varchar(64) NOT NULL,
  `reporter` mediumint(9) NOT NULL,
  `version` varchar(64) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  `resolution` varchar(64) NOT NULL DEFAULT '',
  `target_milestone` varchar(64) NOT NULL DEFAULT '---',
  `qa_contact` mediumint(9) DEFAULT NULL,
  `status_whiteboard` mediumtext NOT NULL,
  `lastdiffed` datetime DEFAULT NULL,
  `everconfirmed` tinyint(4) NOT NULL,
  `reporter_accessible` tinyint(4) NOT NULL DEFAULT '1',
  `cclist_accessible` tinyint(4) NOT NULL DEFAULT '1',
  `estimated_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `remaining_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `deadline` datetime DEFAULT NULL,
  PRIMARY KEY (`bug_id`),
  KEY `bugs_assigned_to_idx` (`assigned_to`),
  KEY `bugs_creation_ts_idx` (`creation_ts`),
  KEY `bugs_delta_ts_idx` (`delta_ts`),
  KEY `bugs_bug_severity_idx` (`bug_severity`),
  KEY `bugs_bug_status_idx` (`bug_status`),
  KEY `bugs_op_sys_idx` (`op_sys`),
  KEY `bugs_priority_idx` (`priority`),
  KEY `bugs_product_id_idx` (`product_id`),
  KEY `bugs_reporter_idx` (`reporter`),
  KEY `bugs_version_idx` (`version`),
  KEY `bugs_component_id_idx` (`component_id`),
  KEY `bugs_resolution_idx` (`resolution`),
  KEY `bugs_target_milestone_idx` (`target_milestone`),
  KEY `bugs_qa_contact_idx` (`qa_contact`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `bugs`
--

INSERT INTO `bugs` (`bug_id`, `assigned_to`, `bug_file_loc`, `bug_severity`, `bug_status`, `creation_ts`, `delta_ts`, `short_desc`, `op_sys`, `priority`, `product_id`, `rep_platform`, `reporter`, `version`, `component_id`, `resolution`, `target_milestone`, `qa_contact`, `status_whiteboard`, `lastdiffed`, `everconfirmed`, `reporter_accessible`, `cclist_accessible`, `estimated_time`, `remaining_time`, `deadline`) VALUES
(1, 4, '', 'minor', 'IN_PROGRESS', '2024-12-11 09:22:00', '2024-12-14 08:25:01', 'Bug nhap sl san pham', 'All', '---', 2, 'All', 1, 'unspecified', 2, '', '---', NULL, '', '2024-12-11 09:22:01', 1, 1, 1, '0.00', '0.00', NULL),
(2, 1, '', 'enhancement', 'RESOLVED', '2024-12-13 20:13:18', '2024-12-13 21:32:38', 'Bug add 1 sp nhưng không tăng số lượng mà lại thêm 1 mục sản phẩm trong giỏ hàng', 'All', 'Low', 2, 'All', 1, 'unspecified', 3, 'FIXED', '---', NULL, '', '2024-12-13 20:13:18', 1, 1, 1, '0.00', '0.00', NULL),
(3, 4, '', 'enhancement', 'IN_PROGRESS', '2024-12-13 20:42:52', '2024-12-14 08:25:29', 'Bug không kiểm tra đuôi file', 'All', 'High', 2, 'All', 1, 'unspecified', 2, '', '---', NULL, '', '2024-12-13 20:43:03', 1, 1, 1, '0.00', '0.00', NULL),
(4, 2, '', 'enhancement', 'RESOLVED', '2024-12-13 20:44:36', '2024-12-14 08:23:46', 'Bug không kiểm tra email', 'All', '---', 2, 'All', 1, 'unspecified', 4, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(5, 1, '', 'enhancement', 'CONFIRMED', '2024-12-13 20:45:06', '2024-12-13 20:56:30', 'Bug không kiểm tra email', 'Windows', '---', 2, 'PC', 1, 'unspecified', 5, '', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(6, 2, '', 'enhancement', 'RESOLVED', '2024-12-13 21:06:00', '2024-12-14 08:24:27', 'Bug đăng ký nhiều tài cùng gmail', 'All', '---', 2, 'All', 1, 'unspecified', 4, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(7, 4, '', 'enhancement', 'VERIFIED', '2024-12-14 15:39:57', '2024-12-20 18:28:06', 'Bug không kiểm tra đuôi file', 'All', '---', 3, 'All', 1, 'unspecified', 6, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(8, 4, '', 'enhancement', 'VERIFIED', '2024-12-14 15:42:03', '2024-12-20 18:29:42', 'Bug nhap sl san pham', 'All', '---', 3, 'All', 1, 'unspecified', 6, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(9, 2, '', 'enhancement', 'RESOLVED', '2024-12-14 15:44:47', '2024-12-14 15:48:37', 'Bug không kiểm tra email', 'All', '---', 3, 'All', 4, 'unspecified', 8, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(10, 2, '', 'enhancement', 'IN_PROGRESS', '2024-12-14 15:47:33', '2024-12-14 15:49:10', 'Bug đăng ký nhiều tài cùng gmail', 'Windows', '---', 3, 'PC', 4, 'unspecified', 8, '', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(11, 1, '', 'enhancement', 'RESOLVED', '2024-12-14 15:50:09', '2024-12-20 15:32:52', 'Bug add 1 sp nhưng không tăng số lượng mà lại thêm 1 mục sản phẩm trong giỏ hàng', 'Windows', '---', 2, 'PC', 2, 'unspecified', 5, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL),
(12, 1, '', 'enhancement', 'VERIFIED', '2024-12-15 15:15:32', '2024-12-20 18:30:54', 'Bug ko remove duoc item trong order', 'All', '---', 3, 'All', 2, 'unspecified', 7, 'FIXED', '---', NULL, '', NULL, 1, 1, 1, '0.00', '0.00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_activity`
--

CREATE TABLE IF NOT EXISTS `bugs_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `added` varchar(255) DEFAULT NULL,
  `removed` varchar(255) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bugs_activity_bug_id_idx` (`bug_id`),
  KEY `bugs_activity_who_idx` (`who`),
  KEY `bugs_activity_bug_when_idx` (`bug_when`),
  KEY `bugs_activity_fieldid_idx` (`fieldid`),
  KEY `bugs_activity_added_idx` (`added`),
  KEY `bugs_activity_removed_idx` (`removed`),
  KEY `fk_bugs_activity_comment_id_longdescs_comment_id` (`comment_id`),
  KEY `fk_bugs_activity_attach_id_attachments_attach_id` (`attach_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `bugs_activity`
--

INSERT INTO `bugs_activity` (`id`, `bug_id`, `attach_id`, `who`, `bug_when`, `fieldid`, `added`, `removed`, `comment_id`) VALUES
(1, 2, NULL, 1, '2024-12-13 20:24:27', 22, 'Minh@gmail.com', '', NULL),
(2, 2, NULL, 1, '2024-12-13 20:24:27', 15, 'ProductCart', 'mangingProduct', NULL),
(3, 2, NULL, 1, '2024-12-13 20:24:27', 16, 'Minh@gmail.com', 'dangtandat43@gmail.com', NULL),
(4, 2, NULL, 1, '2024-12-13 20:25:17', 16, 'dangtandat43@gmail.com', 'Minh@gmail.com', NULL),
(5, 2, NULL, 1, '2024-12-13 20:25:33', 14, 'Low', '---', NULL),
(6, 2, NULL, 1, '2024-12-13 20:25:33', 16, 'Minh@gmail.com', 'dangtandat43@gmail.com', NULL),
(7, 3, NULL, 1, '2024-12-13 20:43:03', 14, 'High', '---', NULL),
(8, 5, NULL, 1, '2024-12-13 20:56:30', 15, 'DELETE', 'Login and register', NULL),
(9, 5, NULL, 1, '2024-12-13 20:56:30', 16, 'dangtandat43@gmail.com', 'Phuong@gmail.com', NULL),
(10, 2, NULL, 1, '2024-12-13 21:22:39', 9, 'IN_PROGRESS', 'CONFIRMED', NULL),
(11, 2, NULL, 1, '2024-12-13 21:32:38', 6, 'All', 'PC', NULL),
(12, 2, NULL, 1, '2024-12-13 21:32:38', 16, 'dangtandat43@gmail.com', 'Minh@gmail.com', NULL),
(13, 2, NULL, 1, '2024-12-13 21:32:38', 9, 'RESOLVED', 'IN_PROGRESS', NULL),
(14, 2, NULL, 1, '2024-12-13 21:32:38', 8, 'All', 'Windows', NULL),
(15, 2, NULL, 1, '2024-12-13 21:32:38', 12, 'FIXED', '', NULL),
(16, 4, NULL, 1, '2024-12-14 08:23:46', 16, 'Minh@gmail.com', 'Phuong@gmail.com', NULL),
(17, 4, NULL, 1, '2024-12-14 08:23:46', 9, 'RESOLVED', 'CONFIRMED', NULL),
(18, 4, NULL, 1, '2024-12-14 08:23:46', 12, 'FIXED', '', NULL),
(19, 4, NULL, 1, '2024-12-14 08:23:46', 6, 'All', 'PC', NULL),
(20, 4, NULL, 1, '2024-12-14 08:23:46', 8, 'All', 'Windows', NULL),
(21, 6, NULL, 1, '2024-12-14 08:24:27', 12, 'FIXED', '', NULL),
(22, 6, NULL, 1, '2024-12-14 08:24:27', 9, 'RESOLVED', 'CONFIRMED', NULL),
(23, 6, NULL, 1, '2024-12-14 08:24:27', 16, 'Minh@gmail.com', 'Phuong@gmail.com', NULL),
(24, 1, NULL, 1, '2024-12-14 08:25:01', 9, 'IN_PROGRESS', 'CONFIRMED', NULL),
(25, 1, NULL, 1, '2024-12-14 08:25:01', 8, 'All', 'Windows', NULL),
(26, 1, NULL, 1, '2024-12-14 08:25:01', 16, 'Phuong@gmail.com', 'dangtandat43@gmail.com', NULL),
(27, 1, NULL, 1, '2024-12-14 08:25:01', 6, 'All', 'PC', NULL),
(28, 3, NULL, 1, '2024-12-14 08:25:29', 9, 'IN_PROGRESS', 'CONFIRMED', NULL),
(29, 3, NULL, 1, '2024-12-14 08:25:29', 8, 'All', 'Windows', NULL),
(30, 3, NULL, 1, '2024-12-14 08:25:29', 16, 'Phuong@gmail.com', 'dangtandat43@gmail.com', NULL),
(31, 3, NULL, 1, '2024-12-14 08:25:29', 6, 'All', 'PC', NULL),
(32, 8, NULL, 4, '2024-12-14 15:43:00', 9, 'RESOLVED', 'CONFIRMED', NULL),
(33, 8, NULL, 4, '2024-12-14 15:43:00', 12, 'FIXED', '', NULL),
(34, 7, NULL, 4, '2024-12-14 15:43:34', 9, 'RESOLVED', 'CONFIRMED', NULL),
(35, 7, NULL, 4, '2024-12-14 15:43:34', 12, 'FIXED', '', NULL),
(36, 9, NULL, 2, '2024-12-14 15:48:37', 9, 'RESOLVED', 'CONFIRMED', NULL),
(37, 9, NULL, 2, '2024-12-14 15:48:37', 12, 'FIXED', '', NULL),
(38, 10, NULL, 2, '2024-12-14 15:49:10', 9, 'IN_PROGRESS', 'CONFIRMED', NULL),
(39, 11, NULL, 1, '2024-12-14 15:50:47', 12, 'FIXED', '', NULL),
(40, 11, NULL, 1, '2024-12-14 15:50:47', 9, 'RESOLVED', 'CONFIRMED', NULL),
(41, 12, NULL, 1, '2024-12-15 15:16:08', 9, 'RESOLVED', 'CONFIRMED', NULL),
(42, 12, NULL, 1, '2024-12-15 15:16:08', 12, 'FIXED', '', NULL),
(43, 11, NULL, 1, '2024-12-20 15:32:52', 15, 'DELETE', 'ProductCart', NULL),
(44, 11, NULL, 1, '2024-12-20 15:32:52', 4, 'DELETE', 'Web Bán Giày(đồ án)', NULL),
(45, 8, NULL, 1, '2024-12-20 16:22:29', 12, 'WONTFIX', 'FIXED', NULL),
(46, 7, NULL, 1, '2024-12-20 16:23:36', 12, 'WONTFIX', 'FIXED', NULL),
(47, 8, NULL, 4, '2024-12-20 18:23:10', 12, 'FIXED', 'WONTFIX', NULL),
(48, 7, NULL, 4, '2024-12-20 18:23:45', 12, 'FIXED', 'WONTFIX', NULL),
(49, 8, NULL, 1, '2024-12-20 18:24:29', 12, '', 'FIXED', NULL),
(50, 8, NULL, 1, '2024-12-20 18:24:29', 9, 'CONFIRMED', 'RESOLVED', NULL),
(51, 7, NULL, 1, '2024-12-20 18:28:06', 9, 'VERIFIED', 'RESOLVED', NULL),
(52, 8, NULL, 1, '2024-12-20 18:29:20', 9, 'RESOLVED', 'CONFIRMED', NULL),
(53, 8, NULL, 1, '2024-12-20 18:29:20', 12, 'FIXED', '', NULL),
(54, 8, NULL, 1, '2024-12-20 18:29:42', 9, 'VERIFIED', 'RESOLVED', NULL),
(55, 12, NULL, 4, '2024-12-20 18:30:54', 9, 'VERIFIED', 'RESOLVED', NULL),
(56, 12, NULL, 4, '2024-12-20 18:30:54', 22, 'Phuong@gmail.com', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bugs_aliases`
--

CREATE TABLE IF NOT EXISTS `bugs_aliases` (
  `alias` varchar(40) NOT NULL,
  `bug_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `bugs_aliases_alias_idx` (`alias`),
  KEY `bugs_aliases_bug_id_idx` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bugs_fulltext`
--

CREATE TABLE IF NOT EXISTS `bugs_fulltext` (
  `bug_id` mediumint(9) NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `comments` mediumtext,
  `comments_noprivate` mediumtext,
  PRIMARY KEY (`bug_id`),
  FULLTEXT KEY `bugs_fulltext_short_desc_idx` (`short_desc`),
  FULLTEXT KEY `bugs_fulltext_comments_idx` (`comments`),
  FULLTEXT KEY `bugs_fulltext_comments_noprivate_idx` (`comments_noprivate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bugs_fulltext`
--

INSERT INTO `bugs_fulltext` (`bug_id`, `short_desc`, `comments`, `comments_noprivate`) VALUES
(1, 'Bug nhap sl san pham', 'Khi add 1 số lượng là số âm nhưng vẫn nhận (chọn só lượng sản phẩm mua nhỏ hơn 0 )\nda xac nhan co loi', 'Khi add 1 số lượng là số âm nhưng vẫn nhận (chọn só lượng sản phẩm mua nhỏ hơn 0 )\nda xac nhan co loi'),
(2, 'Bug add 1 sp nhưng không tăng số lượng mà lại thêm 1 mục sản phẩm trong giỏ hàng', 'Khi đặt hàng sản phẩm không tăng số lượng mà lại thêm 1 mục sản phẩm trong danh sách sản phẩm\nLỗi ở bản 5e3cd74\nĐã sửa', 'Khi đặt hàng sản phẩm không tăng số lượng mà lại thêm 1 mục sản phẩm trong danh sách sản phẩm\nLỗi ở bản 5e3cd74\nĐã sửa'),
(3, 'Bug không kiểm tra đuôi file', 'Khi tôi add 1 ảnh nhưng ko phải đuôi img/jpeg nhưng nó vẫn thêm được\nda xac nhan co loi', 'Khi tôi add 1 ảnh nhưng ko phải đuôi img/jpeg nhưng nó vẫn thêm được\nda xac nhan co loi'),
(4, 'Bug không kiểm tra email', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo\nda fix', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo\nda fix'),
(5, 'Bug không kiểm tra email', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo'),
(6, 'Bug đăng ký nhiều tài cùng gmail', 'Khi đăng ký nhiều tài khoản khác nhau dùng chung 1 gmail thì web vẫn chấp nhận thay vì 1 gmail chỉ đi được 1 tài khoản\nda fix', 'Khi đăng ký nhiều tài khoản khác nhau dùng chung 1 gmail thì web vẫn chấp nhận thay vì 1 gmail chỉ đi được 1 tài khoản\nda fix'),
(7, 'Bug không kiểm tra đuôi file', 'Trong mục thêm sản phẩm có phần thêm ảnh để hiển thị hình ảnh sản phẩm nhưng vẫn có thể thêm những hình ảnh ngoài đuôi file JPEG và JPG nhưng vẫn nhận\nđã xác nhận và sử lý\nvẫn còn lỗi\nđã fix lại\nđã xác nhận không còn lỗi', 'Trong mục thêm sản phẩm có phần thêm ảnh để hiển thị hình ảnh sản phẩm nhưng vẫn có thể thêm những hình ảnh ngoài đuôi file JPEG và JPG nhưng vẫn nhận\nđã xác nhận và sử lý\nvẫn còn lỗi\nđã fix lại\nđã xác nhận không còn lỗi'),
(8, 'Bug nhap sl san pham', 'Khi thêm 1 sản phẩm: nhập số lượng sản phẩm là số âm nhưng vẫn nhận\nđã xác nhận và sử lý\nvân còn lỗi chưa fix được\nđã fix lại\nxác nhận đã fix', 'Khi thêm 1 sản phẩm: nhập số lượng sản phẩm là số âm nhưng vẫn nhận\nđã xác nhận và sử lý\nvân còn lỗi chưa fix được\nđã fix lại\nxác nhận đã fix'),
(9, 'Bug không kiểm tra email', 'Khi đăng ký tài khoản, dùng gmail Phuong@@gmail.com nhưng vẫn chấp nhận\nĐã xác nhận và xử lý', 'Khi đăng ký tài khoản, dùng gmail Phuong@@gmail.com nhưng vẫn chấp nhận\nĐã xác nhận và xử lý'),
(10, 'Bug đăng ký nhiều tài cùng gmail', 'Khi dùng tài khoản Phuong@gmail.com thì có thể đăng ký nhiều tài khoản với tên khác nhau thay vì 1 gmail chỉ dùng được 1 tài khoản\nĐã xác nhận nhưng chưa tìm được cách sử lý', 'Khi dùng tài khoản Phuong@gmail.com thì có thể đăng ký nhiều tài khoản với tên khác nhau thay vì 1 gmail chỉ dùng được 1 tài khoản\nĐã xác nhận nhưng chưa tìm được cách sử lý'),
(11, 'Bug add 1 sp nhưng không tăng số lượng mà lại thêm 1 mục sản phẩm trong giỏ hàng', 'Khi thêm sản phẩm A 2 lần thay vì tăng số lượng thì lại có tận 2 sản phẩm A với số lượng là 1\nXác nhận có lỗi và đã sử lý', 'Khi thêm sản phẩm A 2 lần thay vì tăng số lượng thì lại có tận 2 sản phẩm A với số lượng là 1\nXác nhận có lỗi và đã sử lý'),
(12, 'Bug ko remove duoc item trong order', 'khi them 2 sp khac nhau vao trang order item :\nthi doi y xoa 1 item nhung sau khi f5 lai thi item duoc xoa lai xuat hien tro lai\nXác nhận và đã fix\nxác nhận đã hết lỗi', 'khi them 2 sp khac nhau vao trang order item :\nthi doi y xoa 1 item nhung sau khi f5 lai thi item duoc xoa lai xuat hien tro lai\nXác nhận và đã fix\nxác nhận đã hết lỗi');

-- --------------------------------------------------------

--
-- Table structure for table `bug_group_map`
--

CREATE TABLE IF NOT EXISTS `bug_group_map` (
  `bug_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_group_map_bug_id_idx` (`bug_id`,`group_id`),
  KEY `bug_group_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bug_see_also`
--

CREATE TABLE IF NOT EXISTS `bug_see_also` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `value` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_see_also_bug_id_idx` (`bug_id`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bug_severity`
--

CREATE TABLE IF NOT EXISTS `bug_severity` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_severity_value_idx` (`value`),
  KEY `bug_severity_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_severity_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bug_severity`
--

INSERT INTO `bug_severity` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'blocker', 100, 1, NULL),
(2, 'critical', 200, 1, NULL),
(3, 'major', 300, 1, NULL),
(4, 'normal', 400, 1, NULL),
(5, 'minor', 500, 1, NULL),
(6, 'trivial', 600, 1, NULL),
(7, 'enhancement', 700, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bug_status`
--

CREATE TABLE IF NOT EXISTS `bug_status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  `is_open` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_status_value_idx` (`value`),
  KEY `bug_status_sortkey_idx` (`sortkey`,`value`),
  KEY `bug_status_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bug_status`
--

INSERT INTO `bug_status` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`, `is_open`) VALUES
(1, 'UNCONFIRMED', 100, 1, NULL, 1),
(2, 'CONFIRMED', 200, 1, NULL, 1),
(3, 'IN_PROGRESS', 300, 1, NULL, 1),
(4, 'RESOLVED', 400, 1, NULL, 0),
(5, 'VERIFIED', 500, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bug_tag`
--

CREATE TABLE IF NOT EXISTS `bug_tag` (
  `bug_id` mediumint(9) NOT NULL,
  `tag_id` mediumint(9) NOT NULL,
  UNIQUE KEY `bug_tag_bug_id_idx` (`bug_id`,`tag_id`),
  KEY `fk_bug_tag_tag_id_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bug_user_last_visit`
--

CREATE TABLE IF NOT EXISTS `bug_user_last_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `last_visit_ts` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bug_user_last_visit_idx` (`user_id`,`bug_id`),
  KEY `bug_user_last_visit_last_visit_ts_idx` (`last_visit_ts`),
  KEY `fk_bug_user_last_visit_bug_id_bugs_bug_id` (`bug_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `bug_user_last_visit`
--

INSERT INTO `bug_user_last_visit` (`id`, `user_id`, `bug_id`, `last_visit_ts`) VALUES
(1, 1, 1, '2024-12-14 15:40:28'),
(2, 1, 2, '2024-12-14 11:46:17'),
(3, 1, 3, '2024-12-14 15:40:21'),
(4, 1, 4, '2024-12-14 15:35:05'),
(5, 1, 5, '2024-12-13 20:56:30'),
(6, 1, 6, '2024-12-14 08:24:27'),
(7, 1, 7, '2024-12-20 18:28:06'),
(8, 1, 8, '2024-12-20 18:29:42'),
(9, 4, 8, '2024-12-20 18:23:35'),
(10, 4, 7, '2024-12-20 18:23:45'),
(11, 4, 9, '2024-12-14 15:44:47'),
(12, 4, 10, '2024-12-14 15:47:33'),
(13, 2, 9, '2024-12-14 15:48:37'),
(14, 2, 10, '2024-12-14 15:49:10'),
(15, 2, 11, '2024-12-14 15:50:09'),
(16, 1, 11, '2024-12-20 15:32:52'),
(17, 2, 12, '2024-12-15 15:15:32'),
(18, 1, 12, '2024-12-20 18:30:01'),
(19, 4, 12, '2024-12-20 18:30:54');

-- --------------------------------------------------------

--
-- Table structure for table `bz_schema`
--

CREATE TABLE IF NOT EXISTS `bz_schema` (
  `schema_data` longblob NOT NULL,
  `version` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bz_schema`
--

INSERT INTO `bz_schema` (`schema_data`, `version`) VALUES
(0x2456415231203d207b0a20202020202020202020276174746163685f6461746127203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774686564617461272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276174746163686d656e747327203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f74696d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d696d6574797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769737061746368272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766696c656e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626d69747465725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769736f62736f6c657465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027697370726976617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6372656174696f6e5f74735f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f6d6f64696669636174696f6e5f74696d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163686d656e74735f7375626d69747465725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626d69747465725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202761756469745f6c6f6727203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276f626a6563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202761745f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202761756469745f6c6f675f636c6173735f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202761745f74696d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f67726f75705f6d617027203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f67726f75705f6d61705f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f67726f75705f6d61705f67726f75705f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f7365655f616c736f27203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365655f616c736f5f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f736576657269747927203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f73657665726974795f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f73746174757327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6f70656e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f76616c75655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f736f72746b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7374617475735f7669736962696c6974795f76616c75655f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f74616727203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277461675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027746167272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7461675f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277461675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a20202020202020202020276275675f757365725f6c6173745f766973697427203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f76697369745f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f757365725f6c6173745f76697369745f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f757365725f6c6173745f76697369745f6c6173745f76697369745f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f76697369745f7473270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276275677327203d3e207b0a20202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202761737369676e65645f746f272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f66696c655f6c6f63272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365766572697479272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276275675f737461747573272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202764656c74615f7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276f705f737973272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265706f72746572272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f6d696c6573746f6e65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c272d2d2d5c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202771615f636f6e74616374272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277374617475735f7768697465626f617264272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020276c617374646966666564272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202765766572636f6e6669726d6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020277265706f727465725f61636365737369626c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202763636c6973745f61636365737369626c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027657374696d617465645f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202772656d61696e696e675f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027646561646c696e65272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61737369676e65645f746f5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202761737369676e65645f746f270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6372656174696f6e5f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f7473270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f64656c74615f74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202764656c74615f7473270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6275675f73657665726974795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7365766572697479270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6275675f7374617475735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f737461747573270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f6f705f7379735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f737973270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7072696f726974795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7265706f727465725f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277265706f72746572270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f76657273696f6e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f636f6d706f6e656e745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7265736f6c7574696f6e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f7461726765745f6d696c6573746f6e655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f6d696c6573746f6e65270a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027627567735f71615f636f6e746163745f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202771615f636f6e74616374270a202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f616374697669747927203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6275675f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f77686f5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6275675f7768656e5f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f6669656c6469645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f61646465645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f61637469766974795f72656d6f7665645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f616c696173657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c696173272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f616c69617365735f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f616c69617365735f616c6961735f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c696173270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627567735f66756c6c7465787427203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e74735f6e6f70726976617465272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f73686f72745f646573635f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773686f72745f64657363270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f636f6d6d656e74735f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e7473270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027627567735f66756c6c746578745f636f6d6d656e74735f6e6f707269766174655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e74735f6e6f70726976617465270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202746554c4c54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027627a5f736368656d6127203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736368656d615f64617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28332c3229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a202020202020202020202763617465676f72795f67726f75705f6d617027203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f67726f75705f6d61705f63617465676f72795f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f72795f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636327203d3e207b0a2020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202763635f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202763635f77686f5f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202777686f270a20202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020207d2c0a2020202020202020202027636c617373696669636174696f6e7327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373696669636174696f6e735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636f6d706f6e656e745f636327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f63635f757365725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027636f6d706f6e656e747327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027696e697469616c6f776e6572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027696e697469616c7161636f6e74616374272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e74735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e74735f6e616d655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027646570656e64656e6369657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626c6f636b6564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64656e636965735f626c6f636b65645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626c6f636b6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64656e636965735f646570656e64736f6e5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027646570656e64736f6e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276475706c69636174657327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027647570655f6f66272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202764757065272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027656d61696c5f6275675f69676e6f726527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656d61696c5f6275675f69676e6f72655f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027656d61696c5f73657474696e6727203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656c6174696f6e73686970272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e74272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656d61696c5f73657474696e675f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656c6174696f6e73686970272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e74270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276669656c645f7669736962696c69747927203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f7669736962696c6974795f6669656c645f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276669656c646465667327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027637573746f6d272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e675f64657363272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c68656164272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276f62736f6c657465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027656e7465725f627567272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275676c697374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f6669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6669656c645f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027726576657273655f64657363272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d616e6461746f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6e756d65726963272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f76616c75655f6669656c645f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c75655f6669656c645f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c64646566735f69735f6d616e6461746f72795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d616e6461746f7279270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c61676578636c7573696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027666c61676578636c7573696f6e735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c6167696e636c7573696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167696e636c7573696f6e735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706f6e656e745f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027666c61677327203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027666c61677479706573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027737461747573272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202763686172283129270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276174746163685f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276174746163686d656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276372656174696f6e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020276d6f64696669636174696f6e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020277365747465725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020277265717565737465655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276174746163685f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f7365747465725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277365747465725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f7265717565737465655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265717565737465655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027666c6167735f747970655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027747970655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a2020202020202020202027666c6167747970657327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228353029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202763635f6c697374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832303029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277461726765745f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c27625c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202763686172283129270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f7265717565737461626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f726571756573746565626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f6d756c7469706c696361626c65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f67726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027726571756573745f67726f75705f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75705f636f6e74726f6c5f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027656e747279272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d626572636f6e74726f6c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f74686572636f6e74726f6c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763616e65646974272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202765646974636f6d706f6e656e7473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276564697462756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763616e636f6e6669726d272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f636f6e74726f6c5f6d61705f70726f647563745f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f636f6e74726f6c5f6d61705f67726f75705f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75705f67726f75705f6d617027203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d6265725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e746f725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f67726f75705f6d61705f6d656d6265725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d656d6265725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e746f725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202767726f75707327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027697362756767726f7570272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202775736572726567657870272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202769636f6e5f75726c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202767726f7570735f6e616d655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020276b6579776f72646465667327203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264646566735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276b6579776f72647327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276b6579776f726464656673272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264735f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f7264735f6b6579776f726469645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276b6579776f72646964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f67696e5f6661696c75726527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202769705f61646472272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6661696c7572655f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f67696e636f6f6b69657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6f6b6965272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027697061646472272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228343029270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c61737475736564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e636f6f6b6965735f6c617374757365645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c61737475736564270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e67646573637327203d3e207b0a202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027776f726b5f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027646563696d616c28372c3229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774686574657874272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027697370726976617465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027616c72656164795f77726170706564272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202765787472615f64617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f6275675f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027776f726b5f74696d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f77686f5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f6275675f7768656e5f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f7461677327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f746167735f616374697669747927203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276275675f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202762756773272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d6d656e745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027636f6d6d656e745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276c6f6e676465736373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f7768656e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276164646564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772656d6f766564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f61637469766974795f6275675f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276c6f6e6764657363735f746167735f7765696768747327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228323429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027776569676874272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f6e6764657363735f746167735f776569676874735f7461675f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027746167270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276d61696c5f73746167696e6727203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d657373616765272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276d696c6573746f6e657327203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d696c6573746f6e65735f70726f647563745f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d65647175657269657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f74657227203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276e616d656471756572696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f7465725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d6564717565726965735f6c696e6b5f696e5f666f6f7465725f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276e616d656471756572795f67726f75705f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276e616d656471756572696573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f67726f75705f6d61705f6e616d656471756572795f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d656471756572795f67726f75705f6d61705f67726f75705f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020276f705f73797327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276f705f7379735f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020277072696f7269747927203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f76616c75655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f736f72746b65795f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020277072696f726974795f7669736962696c6974795f76616c75655f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f647563747327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027636c617373696669636174696f6e5f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202731272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027636c617373696669636174696f6e73272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764656661756c746d696c6573746f6e65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c272d2d2d5c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027616c6c6f77735f756e636f6e6669726d6564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f64756374735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c655f73656172636827203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276275675f6c697374272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6973745f6f72646572272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c655f7365617263685f757365725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c655f73657474696e6727203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f6e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202773657474696e67272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c655f73657474696e675f76616c75655f756e697175655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f6e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c657327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202027637279707470617373776f7264272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265616c6e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764697361626c656474657874272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202764697361626c655f6d61696c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276d79627567736c696e6b272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202765787465726e5f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202769735f656e61626c6564272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f7365656e5f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f6c6f67696e5f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6f67696e5f6e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f65787465726e5f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202765787465726e5f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202770726f66696c65735f616374697669747927203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777686f272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f7768656e272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276669656c6464656673272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c6476616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e657776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f7573657269645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f70726f66696c65735f7768656e5f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f7768656e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f66696c65735f61637469766974795f6669656c6469645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276669656c646964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027717569707327203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202027717569706964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e2027534554204e554c4c272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202771756970272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722835313229270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202027617070726f766564272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a20202020202020202020277265705f706c6174666f726d27203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f76616c75655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f736f72746b65795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265705f706c6174666f726d5f7669736962696c6974795f76616c75655f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277265706f72747327203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e4754455854270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020277265706f7274735f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a20202020202020202020277265736f6c7574696f6e27203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f76616c75655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f736f72746b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265736f6c7574696f6e5f7669736962696c6974795f76616c75655f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277669736962696c6974795f76616c75655f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a202020202020202020202773657269657327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202763726561746f72272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202773756263617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277365726965735f63617465676f72696573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276672657175656e6379272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277175657279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202769735f7075626c6963272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63726561746f725f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202763726561746f72270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63617465676f72795f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202763617465676f7279272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773756263617465676f7279272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a20202020202020202020277365726965735f63617465676f7269657327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027534d414c4c53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f63617465676f726965735f6e616d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277365726965735f6461746127203d3e207b0a2020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20277365726965735f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e2027736572696573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f64617465272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f76616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f646174615f7365726965735f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277365726965735f64617465270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202773657474696e6727203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202764656661756c745f76616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202769735f656e61626c6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202027737562636c617373272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a202020202020202020202773657474696e675f76616c756527203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202773657474696e67272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f7274696e646578272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c75655f6e765f756e697175655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202773657474696e675f76616c75655f6e735f756e697175655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f7274696e646578270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277374617475735f776f726b666c6f7727203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c645f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276275675f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e65775f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20276275675f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027726571756972655f636f6d6d656e74272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277374617475735f776f726b666c6f775f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6c645f737461747573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e65775f737461747573270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774616727203d3e207b0a202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020276e616d65272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a20202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020277461675f757365725f69645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e616d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020207d2c0a2020202020202020202027746f6b656e7327203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027697373756564617465272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228313629270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020276576656e7464617461272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e202754494e5954455854270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202027746f6b656e735f7573657269645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365726964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6572726f7227203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276d657373616765272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f66756e6369645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f6572726f725f74696d655f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276572726f725f74696d65270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6572726f725f6a6f6269645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964270a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6578697473746174757327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027737461747573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f6d706c6574696f6e5f74696d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202764656c6574655f6166746572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f657869747374617475735f66756e6369645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f657869747374617475735f64656c6574655f61667465725f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202764656c6574655f6166746572270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f66756e636d617027203d3e207b0a20202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f66756e636d61705f66756e636e616d655f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636e616d65270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6a6f6227203d3e207b0a202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027617267272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027756e69716b6579272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027696e736572745f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6166746572272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027677261626265645f756e74696c272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020277072696f72697479272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202027636f616c65736365272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a20202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f66756e6369645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027756e69716b6579270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f72756e5f61667465725f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6166746572272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6a6f625f636f616c657363655f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202027636f616c65736365272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202766756e636964270a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020207d2c0a202020202020202020202774735f6e6f746527203d3e207b0a20202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5434270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020276e6f74656b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274c4f4e47424c4f42270a2020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202774735f6e6f74655f6a6f6269645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276a6f626964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276e6f74656b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020207d2c0a2020202020202020202027757365725f6170695f6b65797327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5453455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276170695f6b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20275641524348415228343029270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276465736372697074696f6e272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027564152434841522832353529270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277265766f6b6564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276c6173745f75736564272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6170695f6b6579735f6170695f6b65795f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276170695f6b6579270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6170695f6b6579735f757365725f69645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202027757365725f67726f75705f6d617027203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202767726f757073272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973626c657373272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20302c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5431270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f67726f75705f6d61705f757365725f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027757365725f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202767726f75705f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276772616e745f74797065272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276973626c657373270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202776657273696f6e7327203d3e207b0a2020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f6475637473272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020276973616374697665272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202754525545272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202776657273696f6e735f70726f647563745f69645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202770726f647563745f6964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202776616c7565270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020207d2c0a2020202020202020202027776174636827203d3e207b0a2020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202777617463686572272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564272c0a202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a202020202020202020202020202020202020202020202020202020202020202020202020207d0a20202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202777617463685f776174636865725f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686572272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027554e49515545270a20202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202777617463685f776174636865645f696478272c0a20202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202777617463686564270a20202020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020202020202020202020202020202020205d0a2020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f6576656e747327203d3e207b0a202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f776e65725f757365726964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e2027757365726964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e202770726f66696c6573272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277375626a656374272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027626f6479272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d54455854270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c69666e6f62756773272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f7175657269657327203d3e207b0a20202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277768696e655f6576656e7473272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202771756572795f6e616d65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228363429270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027736f72746b6579272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276f6e656d61696c706572627567272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202746414c5345272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027424f4f4c45414e270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277469746c65272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e20275c275c27272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027766172636861722831323829270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a2020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f717565726965735f6576656e7469645f696478272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964270a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a20202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020277768696e655f7363686564756c657327203d3e207b0a202020202020202020202020202020202020202020202020202020202020202020274649454c445327203d3e205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275052494d4152594b455927203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274d454449554d53455249414c270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275245464552454e43455327203d3e207b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027434f4c554d4e27203d3e20276964272c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454c45544527203d3e202743415343414445272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275441424c4527203d3e20277768696e655f6576656e7473272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276372656174656427203d3e20310a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f646179272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f74696d65272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20277661726368617228333229270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6e657874272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e20274441544554494d45270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c746f272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5433270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d2c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276d61696c746f5f74797065272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202744454641554c5427203d3e202730272c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020274e4f544e554c4c27203d3e20312c0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020275459504527203d3e2027494e5432270a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020207d0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a20202020202020202020202020202020202020202020202020202020202020202027494e444558455327203d3e205b0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f7363686564756c65735f72756e5f6e6578745f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202772756e5f6e657874270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d2c0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020277768696e655f7363686564756c65735f6576656e7469645f696478272c0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205b0a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020276576656e746964270a2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205d0a202020202020202020202020202020202020202020202020202020202020207d0a20202020202020207d3b0a, '3.00');

-- --------------------------------------------------------

--
-- Table structure for table `category_group_map`
--

CREATE TABLE IF NOT EXISTS `category_group_map` (
  `category_id` smallint(6) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `category_group_map_category_id_idx` (`category_id`,`group_id`),
  KEY `fk_category_group_map_group_id_groups_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cc`
--

CREATE TABLE IF NOT EXISTS `cc` (
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  UNIQUE KEY `cc_bug_id_idx` (`bug_id`,`who`),
  KEY `cc_who_idx` (`who`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cc`
--

INSERT INTO `cc` (`bug_id`, `who`) VALUES
(3, 1),
(2, 2),
(4, 4),
(5, 4),
(6, 4),
(12, 4);

-- --------------------------------------------------------

--
-- Table structure for table `classifications`
--

CREATE TABLE IF NOT EXISTS `classifications` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `classifications_name_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `classifications`
--

INSERT INTO `classifications` (`id`, `name`, `description`, `sortkey`) VALUES
(1, 'Unclassified', 'Not assigned to any classification', 0);

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE IF NOT EXISTS `components` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `initialowner` mediumint(9) NOT NULL,
  `initialqacontact` mediumint(9) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_product_id_idx` (`product_id`,`name`),
  KEY `components_name_idx` (`name`),
  KEY `fk_components_initialowner_profiles_userid` (`initialowner`),
  KEY `fk_components_initialqacontact_profiles_userid` (`initialqacontact`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `product_id`, `initialowner`, `initialqacontact`, `description`, `isactive`) VALUES
(1, 'TestComponent', 1, 1, NULL, 'This is a test component in the test product database. This ought to be blown away and replaced with real stuff in a finished installation of Bugzilla.', 1),
(2, 'mangingProduct', 2, 1, NULL, 'Quản lý product', 1),
(3, 'ProductCart', 2, 2, NULL, 'Quản lý giỏ hàng', 1),
(4, 'Login and register', 2, 4, NULL, 'Quản lý đăng ký và đăng nhập', 1),
(5, 'DELETE', 2, 1, NULL, 'delete', 1),
(6, 'mangingProduct', 3, 4, NULL, 'Quản lý sản phẩm', 1),
(7, 'ShoppingCart', 3, 1, NULL, 'Quản lý giỏ hàng', 1),
(8, 'Login and register', 3, 2, NULL, 'Quản lý đăng nhập và đăng ký', 1);

-- --------------------------------------------------------

--
-- Table structure for table `component_cc`
--

CREATE TABLE IF NOT EXISTS `component_cc` (
  `user_id` mediumint(9) NOT NULL,
  `component_id` mediumint(9) NOT NULL,
  UNIQUE KEY `component_cc_user_id_idx` (`component_id`,`user_id`),
  KEY `fk_component_cc_user_id_profiles_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `component_cc`
--

INSERT INTO `component_cc` (`user_id`, `component_id`) VALUES
(1, 2),
(2, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `dependencies`
--

CREATE TABLE IF NOT EXISTS `dependencies` (
  `blocked` mediumint(9) NOT NULL,
  `dependson` mediumint(9) NOT NULL,
  UNIQUE KEY `dependencies_blocked_idx` (`blocked`,`dependson`),
  KEY `dependencies_dependson_idx` (`dependson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `duplicates`
--

CREATE TABLE IF NOT EXISTS `duplicates` (
  `dupe_of` mediumint(9) NOT NULL,
  `dupe` mediumint(9) NOT NULL,
  PRIMARY KEY (`dupe`),
  KEY `fk_duplicates_dupe_of_bugs_bug_id` (`dupe_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_bug_ignore`
--

CREATE TABLE IF NOT EXISTS `email_bug_ignore` (
  `user_id` mediumint(9) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  UNIQUE KEY `email_bug_ignore_user_id_idx` (`user_id`,`bug_id`),
  KEY `fk_email_bug_ignore_bug_id_bugs_bug_id` (`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_setting`
--

CREATE TABLE IF NOT EXISTS `email_setting` (
  `user_id` mediumint(9) NOT NULL,
  `relationship` tinyint(4) NOT NULL,
  `event` tinyint(4) NOT NULL,
  UNIQUE KEY `email_setting_user_id_idx` (`user_id`,`relationship`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_setting`
--

INSERT INTO `email_setting` (`user_id`, `relationship`, `event`) VALUES
(1, 0, 0),
(1, 0, 1),
(1, 0, 2),
(1, 0, 3),
(1, 0, 4),
(1, 0, 5),
(1, 0, 6),
(1, 0, 7),
(1, 0, 9),
(1, 0, 10),
(1, 0, 11),
(1, 0, 50),
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(1, 1, 4),
(1, 1, 5),
(1, 1, 6),
(1, 1, 7),
(1, 1, 9),
(1, 1, 10),
(1, 1, 11),
(1, 1, 50),
(1, 2, 0),
(1, 2, 1),
(1, 2, 2),
(1, 2, 3),
(1, 2, 4),
(1, 2, 5),
(1, 2, 6),
(1, 2, 7),
(1, 2, 8),
(1, 2, 9),
(1, 2, 10),
(1, 2, 11),
(1, 2, 50),
(1, 3, 0),
(1, 3, 1),
(1, 3, 2),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 3, 6),
(1, 3, 7),
(1, 3, 9),
(1, 3, 10),
(1, 3, 11),
(1, 3, 50),
(1, 5, 0),
(1, 5, 1),
(1, 5, 2),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 5, 6),
(1, 5, 7),
(1, 5, 9),
(1, 5, 10),
(1, 5, 11),
(1, 5, 50),
(1, 100, 100),
(1, 100, 101),
(2, 0, 0),
(2, 0, 1),
(2, 0, 2),
(2, 0, 3),
(2, 0, 4),
(2, 0, 5),
(2, 0, 6),
(2, 0, 7),
(2, 0, 9),
(2, 0, 10),
(2, 0, 11),
(2, 0, 50),
(2, 1, 0),
(2, 1, 1),
(2, 1, 2),
(2, 1, 3),
(2, 1, 4),
(2, 1, 5),
(2, 1, 6),
(2, 1, 7),
(2, 1, 9),
(2, 1, 10),
(2, 1, 11),
(2, 1, 50),
(2, 2, 0),
(2, 2, 1),
(2, 2, 2),
(2, 2, 3),
(2, 2, 4),
(2, 2, 5),
(2, 2, 6),
(2, 2, 7),
(2, 2, 8),
(2, 2, 9),
(2, 2, 10),
(2, 2, 11),
(2, 2, 50),
(2, 3, 0),
(2, 3, 1),
(2, 3, 2),
(2, 3, 3),
(2, 3, 4),
(2, 3, 5),
(2, 3, 6),
(2, 3, 7),
(2, 3, 9),
(2, 3, 10),
(2, 3, 11),
(2, 3, 50),
(2, 5, 0),
(2, 5, 1),
(2, 5, 2),
(2, 5, 3),
(2, 5, 4),
(2, 5, 5),
(2, 5, 6),
(2, 5, 7),
(2, 5, 9),
(2, 5, 10),
(2, 5, 11),
(2, 5, 50),
(2, 100, 100),
(2, 100, 101),
(3, 0, 0),
(3, 0, 1),
(3, 0, 2),
(3, 0, 3),
(3, 0, 4),
(3, 0, 5),
(3, 0, 6),
(3, 0, 7),
(3, 0, 9),
(3, 0, 10),
(3, 0, 11),
(3, 0, 50),
(3, 1, 0),
(3, 1, 1),
(3, 1, 2),
(3, 1, 3),
(3, 1, 4),
(3, 1, 5),
(3, 1, 6),
(3, 1, 7),
(3, 1, 9),
(3, 1, 10),
(3, 1, 11),
(3, 1, 50),
(3, 2, 0),
(3, 2, 1),
(3, 2, 2),
(3, 2, 3),
(3, 2, 4),
(3, 2, 5),
(3, 2, 6),
(3, 2, 7),
(3, 2, 8),
(3, 2, 9),
(3, 2, 10),
(3, 2, 11),
(3, 2, 50),
(3, 3, 0),
(3, 3, 1),
(3, 3, 2),
(3, 3, 3),
(3, 3, 4),
(3, 3, 5),
(3, 3, 6),
(3, 3, 7),
(3, 3, 9),
(3, 3, 10),
(3, 3, 11),
(3, 3, 50),
(3, 5, 0),
(3, 5, 1),
(3, 5, 2),
(3, 5, 3),
(3, 5, 4),
(3, 5, 5),
(3, 5, 6),
(3, 5, 7),
(3, 5, 9),
(3, 5, 10),
(3, 5, 11),
(3, 5, 50),
(3, 100, 100),
(3, 100, 101),
(4, 0, 0),
(4, 0, 1),
(4, 0, 2),
(4, 0, 3),
(4, 0, 4),
(4, 0, 5),
(4, 0, 6),
(4, 0, 7),
(4, 0, 9),
(4, 0, 10),
(4, 0, 11),
(4, 0, 50),
(4, 1, 0),
(4, 1, 1),
(4, 1, 2),
(4, 1, 3),
(4, 1, 4),
(4, 1, 5),
(4, 1, 6),
(4, 1, 7),
(4, 1, 9),
(4, 1, 10),
(4, 1, 11),
(4, 1, 50),
(4, 2, 0),
(4, 2, 1),
(4, 2, 2),
(4, 2, 3),
(4, 2, 4),
(4, 2, 5),
(4, 2, 6),
(4, 2, 7),
(4, 2, 8),
(4, 2, 9),
(4, 2, 10),
(4, 2, 11),
(4, 2, 50),
(4, 3, 0),
(4, 3, 1),
(4, 3, 2),
(4, 3, 3),
(4, 3, 4),
(4, 3, 5),
(4, 3, 6),
(4, 3, 7),
(4, 3, 9),
(4, 3, 10),
(4, 3, 11),
(4, 3, 50),
(4, 5, 0),
(4, 5, 1),
(4, 5, 2),
(4, 5, 3),
(4, 5, 4),
(4, 5, 5),
(4, 5, 6),
(4, 5, 7),
(4, 5, 9),
(4, 5, 10),
(4, 5, 11),
(4, 5, 50),
(4, 100, 100),
(4, 100, 101);

-- --------------------------------------------------------

--
-- Table structure for table `fielddefs`
--

CREATE TABLE IF NOT EXISTS `fielddefs` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `description` tinytext NOT NULL,
  `long_desc` varchar(255) NOT NULL DEFAULT '',
  `mailhead` tinyint(4) NOT NULL DEFAULT '0',
  `sortkey` smallint(6) NOT NULL,
  `obsolete` tinyint(4) NOT NULL DEFAULT '0',
  `enter_bug` tinyint(4) NOT NULL DEFAULT '0',
  `buglist` tinyint(4) NOT NULL DEFAULT '0',
  `visibility_field_id` mediumint(9) DEFAULT NULL,
  `value_field_id` mediumint(9) DEFAULT NULL,
  `reverse_desc` tinytext,
  `is_mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `is_numeric` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fielddefs_name_idx` (`name`),
  KEY `fielddefs_sortkey_idx` (`sortkey`),
  KEY `fielddefs_value_field_id_idx` (`value_field_id`),
  KEY `fielddefs_is_mandatory_idx` (`is_mandatory`),
  KEY `fk_fielddefs_visibility_field_id_fielddefs_id` (`visibility_field_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `fielddefs`
--

INSERT INTO `fielddefs` (`id`, `name`, `type`, `custom`, `description`, `long_desc`, `mailhead`, `sortkey`, `obsolete`, `enter_bug`, `buglist`, `visibility_field_id`, `value_field_id`, `reverse_desc`, `is_mandatory`, `is_numeric`) VALUES
(1, 'bug_id', 0, 0, 'Bug #', '', 1, 100, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(2, 'short_desc', 0, 0, 'Summary', '', 1, 200, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(3, 'classification', 2, 0, 'Classification', '', 1, 300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(4, 'product', 2, 0, 'Product', '', 1, 400, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(5, 'version', 0, 0, 'Version', '', 1, 500, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(6, 'rep_platform', 2, 0, 'Platform', '', 1, 600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(7, 'bug_file_loc', 0, 0, 'URL', '', 1, 700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(8, 'op_sys', 2, 0, 'OS/Version', '', 1, 800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(9, 'bug_status', 2, 0, 'Status', '', 1, 900, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(10, 'status_whiteboard', 0, 0, 'Status Whiteboard', '', 1, 1000, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(11, 'keywords', 8, 0, 'Keywords', '', 1, 1100, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(12, 'resolution', 2, 0, 'Resolution', '', 0, 1200, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(13, 'bug_severity', 2, 0, 'Severity', '', 1, 1300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(14, 'priority', 2, 0, 'Priority', '', 1, 1400, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(15, 'component', 2, 0, 'Component', '', 1, 1500, 0, 0, 1, NULL, NULL, NULL, 1, 0),
(16, 'assigned_to', 0, 0, 'AssignedTo', '', 1, 1600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(17, 'reporter', 0, 0, 'ReportedBy', '', 1, 1700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(18, 'qa_contact', 0, 0, 'QAContact', '', 1, 1800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(19, 'assigned_to_realname', 0, 0, 'AssignedToName', '', 0, 1900, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(20, 'reporter_realname', 0, 0, 'ReportedByName', '', 0, 2000, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(21, 'qa_contact_realname', 0, 0, 'QAContactName', '', 0, 2100, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(22, 'cc', 0, 0, 'CC', '', 1, 2200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(23, 'dependson', 0, 0, 'Depends on', '', 1, 2300, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(24, 'blocked', 0, 0, 'Blocks', '', 1, 2400, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(25, 'attachments.description', 0, 0, 'Attachment description', '', 0, 2500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(26, 'attachments.filename', 0, 0, 'Attachment filename', '', 0, 2600, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(27, 'attachments.mimetype', 0, 0, 'Attachment mime type', '', 0, 2700, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(28, 'attachments.ispatch', 0, 0, 'Attachment is patch', '', 0, 2800, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(29, 'attachments.isobsolete', 0, 0, 'Attachment is obsolete', '', 0, 2900, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(30, 'attachments.isprivate', 0, 0, 'Attachment is private', '', 0, 3000, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(31, 'attachments.submitter', 0, 0, 'Attachment creator', '', 0, 3100, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(32, 'target_milestone', 0, 0, 'Target Milestone', '', 1, 3200, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(33, 'creation_ts', 0, 0, 'Creation date', '', 0, 3300, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(34, 'delta_ts', 0, 0, 'Last changed date', '', 0, 3400, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(35, 'longdesc', 0, 0, 'Comment', '', 0, 3500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(36, 'longdescs.isprivate', 0, 0, 'Comment is private', '', 0, 3600, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(37, 'longdescs.count', 0, 0, 'Number of Comments', '', 0, 3700, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(38, 'alias', 0, 0, 'Alias', '', 0, 3800, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(39, 'everconfirmed', 0, 0, 'Ever Confirmed', '', 0, 3900, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(40, 'reporter_accessible', 0, 0, 'Reporter Accessible', '', 0, 4000, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(41, 'cclist_accessible', 0, 0, 'CC Accessible', '', 0, 4100, 0, 0, 0, NULL, NULL, NULL, 0, 1),
(42, 'bug_group', 0, 0, 'Group', '', 1, 4200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(43, 'estimated_time', 0, 0, 'Estimated Hours', '', 1, 4300, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(44, 'remaining_time', 0, 0, 'Remaining Hours', '', 0, 4400, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(45, 'deadline', 5, 0, 'Deadline', '', 1, 4500, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(46, 'commenter', 0, 0, 'Commenter', '', 0, 4600, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(47, 'flagtypes.name', 0, 0, 'Flags', '', 0, 4700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(48, 'requestees.login_name', 0, 0, 'Flag Requestee', '', 0, 4800, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(49, 'setters.login_name', 0, 0, 'Flag Setter', '', 0, 4900, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(50, 'work_time', 0, 0, 'Hours Worked', '', 0, 5000, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(51, 'percentage_complete', 0, 0, 'Percentage Complete', '', 0, 5100, 0, 0, 1, NULL, NULL, NULL, 0, 1),
(52, 'content', 0, 0, 'Content', '', 0, 5200, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(53, 'attach_data.thedata', 0, 0, 'Attachment data', '', 0, 5300, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(54, 'owner_idle_time', 0, 0, 'Time Since Assignee Touched', '', 0, 5400, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(55, 'see_also', 7, 0, 'See Also', '', 0, 5500, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(56, 'tag', 8, 0, 'Personal Tags', '', 0, 5600, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(57, 'last_visit_ts', 5, 0, 'Last Visit', '', 0, 5700, 0, 0, 1, NULL, NULL, NULL, 0, 0),
(58, 'comment_tag', 0, 0, 'Comment Tag', '', 0, 5800, 0, 0, 0, NULL, NULL, NULL, 0, 0),
(59, 'days_elapsed', 0, 0, 'Days since bug changed', '', 0, 5900, 0, 0, 0, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `field_visibility`
--

CREATE TABLE IF NOT EXISTS `field_visibility` (
  `field_id` mediumint(9) DEFAULT NULL,
  `value_id` smallint(6) NOT NULL,
  UNIQUE KEY `field_visibility_field_id_idx` (`field_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flagexclusions`
--

CREATE TABLE IF NOT EXISTS `flagexclusions` (
  `type_id` smallint(6) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flagexclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flagexclusions_component_id_components_id` (`component_id`),
  KEY `fk_flagexclusions_product_id_products_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flaginclusions`
--

CREATE TABLE IF NOT EXISTS `flaginclusions` (
  `type_id` smallint(6) NOT NULL,
  `product_id` smallint(6) DEFAULT NULL,
  `component_id` mediumint(9) DEFAULT NULL,
  UNIQUE KEY `flaginclusions_type_id_idx` (`type_id`,`product_id`,`component_id`),
  KEY `fk_flaginclusions_component_id_components_id` (`component_id`),
  KEY `fk_flaginclusions_product_id_products_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE IF NOT EXISTS `flags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) NOT NULL,
  `status` char(1) NOT NULL,
  `bug_id` mediumint(9) NOT NULL,
  `attach_id` mediumint(9) DEFAULT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime DEFAULT NULL,
  `setter_id` mediumint(9) NOT NULL,
  `requestee_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_bug_id_idx` (`bug_id`,`attach_id`),
  KEY `flags_setter_id_idx` (`setter_id`),
  KEY `flags_requestee_id_idx` (`requestee_id`),
  KEY `flags_type_id_idx` (`type_id`),
  KEY `fk_flags_attach_id_attachments_attach_id` (`attach_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flagtypes`
--

CREATE TABLE IF NOT EXISTS `flagtypes` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` mediumtext NOT NULL,
  `cc_list` varchar(200) DEFAULT NULL,
  `target_type` char(1) NOT NULL DEFAULT 'b',
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_requestable` tinyint(4) NOT NULL DEFAULT '0',
  `is_requesteeble` tinyint(4) NOT NULL DEFAULT '0',
  `is_multiplicable` tinyint(4) NOT NULL DEFAULT '0',
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `grant_group_id` mediumint(9) DEFAULT NULL,
  `request_group_id` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_flagtypes_grant_group_id_groups_id` (`grant_group_id`),
  KEY `fk_flagtypes_request_group_id_groups_id` (`request_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `isbuggroup` tinyint(4) NOT NULL,
  `userregexp` tinytext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `icon_url` tinytext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_name_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`, `isbuggroup`, `userregexp`, `isactive`, `icon_url`) VALUES
(1, 'admin', 'Administrators', 0, '', 1, NULL),
(2, 'tweakparams', 'Can change Parameters', 0, '', 1, NULL),
(3, 'editusers', 'Can edit or disable users', 0, '', 1, NULL),
(4, 'creategroups', 'Can create and destroy groups', 0, '', 1, NULL),
(5, 'editclassifications', 'Can create, destroy, and edit classifications', 0, '', 1, NULL),
(6, 'editcomponents', 'Can create, destroy, and edit components', 0, '', 1, NULL),
(7, 'editkeywords', 'Can create, destroy, and edit keywords', 0, '', 1, NULL),
(8, 'editbugs', 'Can edit all bug fields', 0, '.*', 1, NULL),
(9, 'canconfirm', 'Can confirm a bug or mark it a duplicate', 0, '', 1, NULL),
(10, 'bz_canusewhineatothers', 'Can configure whine reports for other users', 0, '', 1, NULL),
(11, 'bz_canusewhines', 'User can configure whine reports for self', 0, '', 1, NULL),
(12, 'bz_sudoers', 'Can perform actions as other users', 0, '', 1, NULL),
(13, 'bz_sudo_protect', 'Can not be impersonated by other users', 0, '', 1, NULL),
(14, 'bz_quip_moderators', 'Can moderate quips', 0, '', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `group_control_map`
--

CREATE TABLE IF NOT EXISTS `group_control_map` (
  `group_id` mediumint(9) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `entry` tinyint(4) NOT NULL DEFAULT '0',
  `membercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `othercontrol` tinyint(4) NOT NULL DEFAULT '0',
  `canedit` tinyint(4) NOT NULL DEFAULT '0',
  `editcomponents` tinyint(4) NOT NULL DEFAULT '0',
  `editbugs` tinyint(4) NOT NULL DEFAULT '0',
  `canconfirm` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_control_map_product_id_idx` (`product_id`,`group_id`),
  KEY `group_control_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_group_map`
--

CREATE TABLE IF NOT EXISTS `group_group_map` (
  `member_id` mediumint(9) NOT NULL,
  `grantor_id` mediumint(9) NOT NULL,
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_group_map_member_id_idx` (`member_id`,`grantor_id`,`grant_type`),
  KEY `fk_group_group_map_grantor_id_groups_id` (`grantor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `group_group_map`
--

INSERT INTO `group_group_map` (`member_id`, `grantor_id`, `grant_type`) VALUES
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 0),
(1, 2, 1),
(1, 2, 2),
(1, 3, 0),
(1, 3, 1),
(1, 3, 2),
(1, 4, 0),
(1, 4, 1),
(1, 4, 2),
(1, 5, 0),
(1, 5, 1),
(1, 5, 2),
(1, 6, 0),
(1, 6, 1),
(1, 6, 2),
(1, 7, 0),
(1, 7, 1),
(1, 7, 2),
(1, 8, 0),
(1, 8, 1),
(1, 8, 2),
(1, 9, 0),
(1, 9, 1),
(1, 9, 2),
(1, 10, 0),
(1, 10, 1),
(1, 10, 2),
(1, 11, 0),
(1, 11, 1),
(1, 11, 2),
(8, 11, 0),
(10, 11, 0),
(1, 12, 0),
(1, 12, 1),
(1, 12, 2),
(1, 13, 0),
(1, 13, 1),
(1, 13, 2),
(12, 13, 0),
(1, 14, 0),
(1, 14, 1),
(1, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `keyworddefs`
--

CREATE TABLE IF NOT EXISTS `keyworddefs` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyworddefs_name_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE IF NOT EXISTS `keywords` (
  `bug_id` mediumint(9) NOT NULL,
  `keywordid` smallint(6) NOT NULL,
  UNIQUE KEY `keywords_bug_id_idx` (`bug_id`,`keywordid`),
  KEY `keywords_keywordid_idx` (`keywordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logincookies`
--

CREATE TABLE IF NOT EXISTS `logincookies` (
  `cookie` varchar(16) NOT NULL,
  `userid` mediumint(9) NOT NULL,
  `ipaddr` varchar(40) DEFAULT NULL,
  `lastused` datetime NOT NULL,
  PRIMARY KEY (`cookie`),
  KEY `logincookies_lastused_idx` (`lastused`),
  KEY `fk_logincookies_userid_profiles_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `logincookies`
--

INSERT INTO `logincookies` (`cookie`, `userid`, `ipaddr`, `lastused`) VALUES
('b9ChMYYw6z', 4, NULL, '2024-12-20 18:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `login_failure`
--

CREATE TABLE IF NOT EXISTS `login_failure` (
  `user_id` mediumint(9) NOT NULL,
  `login_time` datetime NOT NULL,
  `ip_addr` varchar(40) NOT NULL,
  KEY `login_failure_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs`
--

CREATE TABLE IF NOT EXISTS `longdescs` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `work_time` decimal(7,2) NOT NULL DEFAULT '0.00',
  `thetext` mediumtext NOT NULL,
  `isprivate` tinyint(4) NOT NULL DEFAULT '0',
  `already_wrapped` tinyint(4) NOT NULL DEFAULT '0',
  `type` smallint(6) NOT NULL DEFAULT '0',
  `extra_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `longdescs_bug_id_idx` (`bug_id`,`work_time`),
  KEY `longdescs_who_idx` (`who`,`bug_id`),
  KEY `longdescs_bug_when_idx` (`bug_when`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `longdescs`
--

INSERT INTO `longdescs` (`comment_id`, `bug_id`, `who`, `bug_when`, `work_time`, `thetext`, `isprivate`, `already_wrapped`, `type`, `extra_data`) VALUES
(1, 1, 1, '2024-12-11 09:22:00', '0.00', 'Khi add 1 số lượng là số âm nhưng vẫn nhận (chọn só lượng sản phẩm mua nhỏ hơn 0 )', 0, 0, 0, NULL),
(2, 2, 1, '2024-12-13 20:13:18', '0.00', 'Khi đặt hàng sản phẩm không tăng số lượng mà lại thêm 1 mục sản phẩm trong danh sách sản phẩm', 0, 0, 0, NULL),
(3, 3, 1, '2024-12-13 20:42:52', '0.00', 'Khi tôi add 1 ảnh nhưng ko phải đuôi img/jpeg nhưng nó vẫn thêm được', 0, 0, 0, NULL),
(4, 4, 1, '2024-12-13 20:44:36', '0.00', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo', 0, 0, 0, NULL),
(5, 5, 1, '2024-12-13 20:45:06', '0.00', 'Khi người dùng đăng ký thì không check được mail đăng ký đúng hoặc mail ảo', 0, 0, 0, NULL),
(6, 6, 1, '2024-12-13 21:06:00', '0.00', 'Khi đăng ký nhiều tài khoản khác nhau dùng chung 1 gmail thì web vẫn chấp nhận thay vì 1 gmail chỉ đi được 1 tài khoản', 0, 0, 0, NULL),
(7, 2, 1, '2024-12-13 21:22:39', '0.00', 'Lỗi ở bản 5e3cd74', 0, 0, 0, NULL),
(8, 2, 1, '2024-12-13 21:32:38', '0.00', 'Đã sửa', 0, 0, 0, NULL),
(9, 4, 1, '2024-12-14 08:23:46', '0.00', 'da fix', 0, 0, 0, NULL),
(10, 6, 1, '2024-12-14 08:24:27', '0.00', 'da fix', 0, 0, 0, NULL),
(11, 1, 1, '2024-12-14 08:25:01', '0.00', 'da xac nhan co loi', 0, 0, 0, NULL),
(12, 3, 1, '2024-12-14 08:25:29', '0.00', 'da xac nhan co loi', 0, 0, 0, NULL),
(13, 7, 1, '2024-12-14 15:39:57', '0.00', 'Trong mục thêm sản phẩm có phần thêm ảnh để hiển thị hình ảnh sản phẩm nhưng vẫn có thể thêm những hình ảnh ngoài đuôi file JPEG và JPG nhưng vẫn nhận', 0, 0, 0, NULL),
(14, 8, 1, '2024-12-14 15:42:03', '0.00', 'Khi thêm 1 sản phẩm: nhập số lượng sản phẩm là số âm nhưng vẫn nhận', 0, 0, 0, NULL),
(15, 8, 4, '2024-12-14 15:43:00', '0.00', 'đã xác nhận và sử lý', 0, 0, 0, NULL),
(16, 7, 4, '2024-12-14 15:43:34', '0.00', 'đã xác nhận và sử lý', 0, 0, 0, NULL),
(17, 9, 4, '2024-12-14 15:44:47', '0.00', 'Khi đăng ký tài khoản, dùng gmail Phuong@@gmail.com nhưng vẫn chấp nhận', 0, 0, 0, NULL),
(18, 10, 4, '2024-12-14 15:47:33', '0.00', 'Khi dùng tài khoản Phuong@gmail.com thì có thể đăng ký nhiều tài khoản với tên khác nhau thay vì 1 gmail chỉ dùng được 1 tài khoản', 0, 0, 0, NULL),
(19, 9, 2, '2024-12-14 15:48:37', '0.00', 'Đã xác nhận và xử lý', 0, 0, 0, NULL),
(20, 10, 2, '2024-12-14 15:49:10', '0.00', 'Đã xác nhận nhưng chưa tìm được cách sử lý', 0, 0, 0, NULL),
(21, 11, 2, '2024-12-14 15:50:09', '0.00', 'Khi thêm sản phẩm A 2 lần thay vì tăng số lượng thì lại có tận 2 sản phẩm A với số lượng là 1', 0, 0, 0, NULL),
(22, 11, 1, '2024-12-14 15:50:47', '0.00', 'Xác nhận có lỗi và đã sử lý', 0, 0, 0, NULL),
(23, 12, 2, '2024-12-15 15:15:32', '0.00', 'khi them 2 sp khac nhau vao trang order item :\nthi doi y xoa 1 item nhung sau khi f5 lai thi item duoc xoa lai xuat hien tro lai', 0, 0, 0, NULL),
(24, 12, 1, '2024-12-15 15:16:08', '0.00', 'Xác nhận và đã fix', 0, 0, 0, NULL),
(25, 8, 1, '2024-12-20 16:22:29', '0.00', 'vân còn lỗi chưa fix được', 0, 0, 0, NULL),
(26, 7, 1, '2024-12-20 16:23:36', '0.00', 'vẫn còn lỗi', 0, 0, 0, NULL),
(27, 8, 4, '2024-12-20 18:23:10', '0.00', 'đã fix lại', 0, 0, 0, NULL),
(28, 7, 4, '2024-12-20 18:23:45', '0.00', 'đã fix lại', 0, 0, 0, NULL),
(29, 8, 1, '2024-12-20 18:24:29', '0.00', 'xác nhận đã fix', 0, 0, 0, NULL),
(30, 7, 1, '2024-12-20 18:28:06', '0.00', 'đã xác nhận không còn lỗi', 0, 0, 0, NULL),
(31, 12, 4, '2024-12-20 18:30:54', '0.00', 'xác nhận đã hết lỗi', 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags`
--

CREATE TABLE IF NOT EXISTS `longdescs_tags` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) DEFAULT NULL,
  `tag` varchar(24) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_idx` (`comment_id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags_activity`
--

CREATE TABLE IF NOT EXISTS `longdescs_tags_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `bug_id` mediumint(9) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `who` mediumint(9) NOT NULL,
  `bug_when` datetime NOT NULL,
  `added` varchar(24) DEFAULT NULL,
  `removed` varchar(24) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `longdescs_tags_activity_bug_id_idx` (`bug_id`),
  KEY `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` (`comment_id`),
  KEY `fk_longdescs_tags_activity_who_profiles_userid` (`who`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `longdescs_tags_weights`
--

CREATE TABLE IF NOT EXISTS `longdescs_tags_weights` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `tag` varchar(24) NOT NULL,
  `weight` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `longdescs_tags_weights_tag_idx` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail_staging`
--

CREATE TABLE IF NOT EXISTS `mail_staging` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `milestones`
--

CREATE TABLE IF NOT EXISTS `milestones` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `product_id` smallint(6) NOT NULL,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `milestones_product_id_idx` (`product_id`,`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `milestones`
--

INSERT INTO `milestones` (`id`, `product_id`, `value`, `sortkey`, `isactive`) VALUES
(1, 1, '---', 0, 1),
(2, 2, '---', 0, 1),
(3, 3, '---', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `namedqueries`
--

CREATE TABLE IF NOT EXISTS `namedqueries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namedqueries_userid_idx` (`userid`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `namedqueries_link_in_footer`
--

CREATE TABLE IF NOT EXISTS `namedqueries_link_in_footer` (
  `namedquery_id` mediumint(9) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedqueries_link_in_footer_id_idx` (`namedquery_id`,`user_id`),
  KEY `namedqueries_link_in_footer_userid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `namedquery_group_map`
--

CREATE TABLE IF NOT EXISTS `namedquery_group_map` (
  `namedquery_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  UNIQUE KEY `namedquery_group_map_namedquery_id_idx` (`namedquery_id`),
  KEY `namedquery_group_map_group_id_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `op_sys`
--

CREATE TABLE IF NOT EXISTS `op_sys` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `op_sys_value_idx` (`value`),
  KEY `op_sys_sortkey_idx` (`sortkey`,`value`),
  KEY `op_sys_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `op_sys`
--

INSERT INTO `op_sys` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'All', 100, 1, NULL),
(2, 'Windows', 200, 1, NULL),
(3, 'Mac OS', 300, 1, NULL),
(4, 'Linux', 400, 1, NULL),
(5, 'Other', 500, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE IF NOT EXISTS `priority` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `priority_value_idx` (`value`),
  KEY `priority_sortkey_idx` (`sortkey`,`value`),
  KEY `priority_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'Highest', 100, 1, NULL),
(2, 'High', 200, 1, NULL),
(3, 'Normal', 300, 1, NULL),
(4, 'Low', 400, 1, NULL),
(5, 'Lowest', 500, 1, NULL),
(6, '---', 600, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `classification_id` smallint(6) NOT NULL DEFAULT '1',
  `description` mediumtext NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `defaultmilestone` varchar(64) NOT NULL DEFAULT '---',
  `allows_unconfirmed` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_name_idx` (`name`),
  KEY `fk_products_classification_id_classifications_id` (`classification_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `classification_id`, `description`, `isactive`, `defaultmilestone`, `allows_unconfirmed`) VALUES
(1, 'TestProduct', 1, 'This is a test product. This ought to be blown away and replaced with real stuff in a finished installation of bugzilla.', 1, '---', 1),
(2, 'DELETE', 1, 'Thư mục để xóa những thứ lỗi', 1, '---', 1),
(3, 'Web Bán Giày(đồ án)', 1, 'Đồ án thực hành mã nguồn mở', 1, '---', 1);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE IF NOT EXISTS `profiles` (
  `userid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) NOT NULL,
  `cryptpassword` varchar(128) DEFAULT NULL,
  `realname` varchar(255) NOT NULL DEFAULT '',
  `disabledtext` mediumtext NOT NULL,
  `disable_mail` tinyint(4) NOT NULL DEFAULT '0',
  `mybugslink` tinyint(4) NOT NULL DEFAULT '1',
  `extern_id` varchar(64) DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `last_seen_date` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `profiles_login_name_idx` (`login_name`),
  UNIQUE KEY `profiles_extern_id_idx` (`extern_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`userid`, `login_name`, `cryptpassword`, `realname`, `disabledtext`, `disable_mail`, `mybugslink`, `extern_id`, `is_enabled`, `last_seen_date`) VALUES
(1, 'dangtandat43@gmail.com', '9JleHYbe,wiE0j2XTeZ9Mxy9GuDpQhcFQcNVbSAsQHHNAkgb9z8I{SHA-256}', 'dat', '', 0, 1, NULL, 1, '2024-12-20 00:00:00'),
(2, 'Minh@gmail.com', 'PtaAmSLg,FdiuRFvHkT4McwBfGRXDFKMQM+qQ1l1vcxbUULvPLek{SHA-256}', 'Minh', '', 0, 1, NULL, 1, '2024-12-15 00:00:00'),
(3, 'Dong@gmail.com', 'PUGU4bQm,DyKDHqJ83xL2CNKH7M1i29VDpK3w9wg1vRv2QwRFLtE{SHA-256}', 'Dong', '', 0, 1, NULL, 1, NULL),
(4, 'Phuong@gmail.com', 'VgoCwGlT,89sdY178r0N1mmNvqokTiQAXEp1/+e7t0V/JENQq4aM{SHA-256}', 'Phuong', '', 0, 1, NULL, 1, '2024-12-20 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `profiles_activity`
--

CREATE TABLE IF NOT EXISTS `profiles_activity` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) NOT NULL,
  `who` mediumint(9) NOT NULL,
  `profiles_when` datetime NOT NULL,
  `fieldid` mediumint(9) NOT NULL,
  `oldvalue` tinytext,
  `newvalue` tinytext,
  PRIMARY KEY (`id`),
  KEY `profiles_activity_userid_idx` (`userid`),
  KEY `profiles_activity_profiles_when_idx` (`profiles_when`),
  KEY `profiles_activity_fieldid_idx` (`fieldid`),
  KEY `fk_profiles_activity_who_profiles_userid` (`who`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `profiles_activity`
--

INSERT INTO `profiles_activity` (`id`, `userid`, `who`, `profiles_when`, `fieldid`, `oldvalue`, `newvalue`) VALUES
(1, 1, 1, '2024-11-30 11:48:04', 33, NULL, '2024-11-30 11:48:04'),
(2, 2, 1, '2024-12-13 20:20:18', 33, NULL, '2024-12-13 20:20:18'),
(3, 2, 1, '2024-12-13 20:20:46', 42, '', 'canconfirm, bz_sudoers, editcomponents, bz_canusewhines, editusers, creategroups, editclassifications, bz_canusewhineatothers, admin, editkeywords, bz_quip_moderators, tweakparams, bz_sudo_protect, editbugs'),
(4, 3, 1, '2024-12-13 20:21:09', 33, NULL, '2024-12-13 20:21:09'),
(5, 3, 1, '2024-12-13 20:21:33', 42, '', 'editclassifications, bz_sudoers, bz_canusewhineatothers, tweakparams, editusers, canconfirm, editkeywords, bz_canusewhines, editcomponents, bz_quip_moderators, editbugs, creategroups, bz_sudo_protect, admin'),
(6, 4, 1, '2024-12-13 20:21:52', 33, NULL, '2024-12-13 20:21:52'),
(7, 4, 1, '2024-12-13 20:22:13', 42, '', 'editcomponents, admin, canconfirm, editusers, creategroups, bz_canusewhines, tweakparams, editkeywords, editclassifications, bz_sudo_protect, bz_quip_moderators, editbugs, bz_sudoers, bz_canusewhineatothers');

-- --------------------------------------------------------

--
-- Table structure for table `profile_search`
--

CREATE TABLE IF NOT EXISTS `profile_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `bug_list` mediumtext NOT NULL,
  `list_order` mediumtext,
  PRIMARY KEY (`id`),
  KEY `profile_search_user_id_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `profile_search`
--

INSERT INTO `profile_search` (`id`, `user_id`, `bug_list`, `list_order`) VALUES
(27, 4, '7,8', 'component DESC,changeddate,bug_id DESC'),
(28, 4, '8,7', 'component DESC,changeddate,bug_id DESC'),
(29, 4, '8,7', 'component DESC,changeddate,bug_id DESC'),
(30, 4, '8,7,9', 'component DESC,changeddate,bug_id DESC'),
(31, 2, '9,10', 'component DESC,changeddate,bug_id DESC'),
(32, 2, '10', 'component DESC,changeddate,bug_id DESC'),
(33, 2, '', NULL),
(34, 2, '', NULL),
(37, 2, '', NULL),
(44, 1, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(45, 1, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(46, 1, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(47, 1, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(48, 1, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(49, 4, '', NULL),
(50, 4, '', NULL),
(51, 4, '', NULL),
(52, 4, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(53, 4, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(54, 1, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(55, 1, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(56, 1, '12,8,7,9,10', 'component DESC,changeddate,bug_id DESC'),
(57, 1, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(58, 1, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC'),
(59, 4, '12,7,8,9,10', 'component DESC,changeddate,bug_id DESC');

-- --------------------------------------------------------

--
-- Table structure for table `profile_setting`
--

CREATE TABLE IF NOT EXISTS `profile_setting` (
  `user_id` mediumint(9) NOT NULL,
  `setting_name` varchar(32) NOT NULL,
  `setting_value` varchar(32) NOT NULL,
  UNIQUE KEY `profile_setting_value_unique_idx` (`user_id`,`setting_name`),
  KEY `fk_profile_setting_setting_name_setting_name` (`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quips`
--

CREATE TABLE IF NOT EXISTS `quips` (
  `quipid` mediumint(9) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(9) DEFAULT NULL,
  `quip` varchar(512) NOT NULL,
  `approved` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`quipid`),
  KEY `fk_quips_userid_profiles_userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `name` varchar(64) NOT NULL,
  `query` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reports_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rep_platform`
--

CREATE TABLE IF NOT EXISTS `rep_platform` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rep_platform_value_idx` (`value`),
  KEY `rep_platform_sortkey_idx` (`sortkey`,`value`),
  KEY `rep_platform_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rep_platform`
--

INSERT INTO `rep_platform` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, 'All', 100, 1, NULL),
(2, 'PC', 200, 1, NULL),
(3, 'Macintosh', 300, 1, NULL),
(4, 'Other', 400, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resolution`
--

CREATE TABLE IF NOT EXISTS `resolution` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  `visibility_value_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `resolution_value_idx` (`value`),
  KEY `resolution_sortkey_idx` (`sortkey`,`value`),
  KEY `resolution_visibility_value_id_idx` (`visibility_value_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `resolution`
--

INSERT INTO `resolution` (`id`, `value`, `sortkey`, `isactive`, `visibility_value_id`) VALUES
(1, '', 100, 1, NULL),
(2, 'FIXED', 200, 1, NULL),
(3, 'INVALID', 300, 1, NULL),
(4, 'WONTFIX', 400, 1, NULL),
(5, 'DUPLICATE', 500, 1, NULL),
(6, 'WORKSFORME', 600, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE IF NOT EXISTS `series` (
  `series_id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `creator` mediumint(9) DEFAULT NULL,
  `category` smallint(6) NOT NULL,
  `subcategory` smallint(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `frequency` smallint(6) NOT NULL,
  `query` mediumtext NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`series_id`),
  UNIQUE KEY `series_category_idx` (`category`,`subcategory`,`name`),
  KEY `series_creator_idx` (`creator`),
  KEY `fk_series_subcategory_series_categories_id` (`subcategory`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`series_id`, `creator`, `category`, `subcategory`, `name`, `frequency`, `query`, `is_public`) VALUES
(1, 1, 1, 2, 'UNCONFIRMED', 1, 'bug_status=UNCONFIRMED&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(2, 1, 1, 2, 'CONFIRMED', 1, 'bug_status=CONFIRMED&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(3, 1, 1, 2, 'IN_PROGRESS', 1, 'bug_status=IN_PROGRESS&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(4, 1, 1, 2, 'RESOLVED', 1, 'bug_status=RESOLVED&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(5, 1, 1, 2, 'VERIFIED', 1, 'bug_status=VERIFIED&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(6, 1, 1, 2, 'FIXED', 1, 'resolution=FIXED&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(7, 1, 1, 2, 'INVALID', 1, 'resolution=INVALID&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(8, 1, 1, 2, 'WONTFIX', 1, 'resolution=WONTFIX&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(9, 1, 1, 2, 'DUPLICATE', 1, 'resolution=DUPLICATE&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(10, 1, 1, 2, 'WORKSFORME', 1, 'resolution=WORKSFORME&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(11, 1, 1, 2, 'All Open', 1, 'bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=IN_PROGRESS&product=Web%20B%C3%A1n%20Gi%C3%A0y', 1),
(12, 1, 1, 3, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=mangingProduct', 1),
(13, 1, 1, 3, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=mangingProduct', 1),
(14, 1, 1, 4, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=ProductCart', 1),
(15, 1, 1, 4, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=ProductCart', 1),
(16, 1, 1, 5, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=Login%20and%20register', 1),
(17, 1, 1, 5, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=Login%20and%20register', 1),
(18, 1, 1, 6, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=DELETE', 1),
(19, 1, 1, 6, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y&component=DELETE', 1),
(20, 1, 7, 2, 'UNCONFIRMED', 1, 'bug_status=UNCONFIRMED&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(21, 1, 7, 2, 'CONFIRMED', 1, 'bug_status=CONFIRMED&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(22, 1, 7, 2, 'IN_PROGRESS', 1, 'bug_status=IN_PROGRESS&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(23, 1, 7, 2, 'RESOLVED', 1, 'bug_status=RESOLVED&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(24, 1, 7, 2, 'VERIFIED', 1, 'bug_status=VERIFIED&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(25, 1, 7, 2, 'FIXED', 1, 'resolution=FIXED&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(26, 1, 7, 2, 'INVALID', 1, 'resolution=INVALID&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(27, 1, 7, 2, 'WONTFIX', 1, 'resolution=WONTFIX&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(28, 1, 7, 2, 'DUPLICATE', 1, 'resolution=DUPLICATE&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(29, 1, 7, 2, 'WORKSFORME', 1, 'resolution=WORKSFORME&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(30, 1, 7, 2, 'All Open', 1, 'bug_status=UNCONFIRMED&bug_status=CONFIRMED&bug_status=IN_PROGRESS&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29', 1),
(31, 1, 7, 3, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=mangingProduct', 1),
(32, 1, 7, 3, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=mangingProduct', 1),
(33, 1, 7, 4, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=ProductCart', 1),
(34, 1, 7, 4, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=ProductCart', 1),
(35, 1, 7, 5, 'All Open', 1, 'field0-0-0=resolution&type0-0-0=notregexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=Login%20and%20register', 1),
(36, 1, 7, 5, 'All Closed', 1, 'field0-0-0=resolution&type0-0-0=regexp&value0-0-0=.&product=Web%20B%C3%A1n%20Gi%C3%A0y%28%C4%91%E1%BB%93%20%C3%A1n%29&component=Login%20and%20register', 1);

-- --------------------------------------------------------

--
-- Table structure for table `series_categories`
--

CREATE TABLE IF NOT EXISTS `series_categories` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series_categories_name_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `series_categories`
--

INSERT INTO `series_categories` (`id`, `name`) VALUES
(2, '-All-'),
(6, 'DELETE'),
(5, 'Login and register'),
(3, 'mangingProduct'),
(4, 'ProductCart'),
(1, 'Web Bán Giày'),
(7, 'Web Bán Giày(đồ án)');

-- --------------------------------------------------------

--
-- Table structure for table `series_data`
--

CREATE TABLE IF NOT EXISTS `series_data` (
  `series_id` mediumint(9) NOT NULL,
  `series_date` datetime NOT NULL,
  `series_value` mediumint(9) NOT NULL,
  UNIQUE KEY `series_data_series_id_idx` (`series_id`,`series_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `name` varchar(32) NOT NULL,
  `default_value` varchar(32) NOT NULL,
  `is_enabled` tinyint(4) NOT NULL DEFAULT '1',
  `subclass` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`name`, `default_value`, `is_enabled`, `subclass`) VALUES
('bugmail_new_prefix', 'on', 1, NULL),
('comment_box_position', 'before_comments', 1, NULL),
('comment_sort_order', 'oldest_to_newest', 1, NULL),
('csv_colsepchar', ',', 1, NULL),
('display_quips', 'on', 1, NULL),
('email_format', 'html', 1, NULL),
('lang', 'en', 1, 'Lang'),
('possible_duplicates', 'on', 1, NULL),
('post_bug_submit_action', 'next_bug', 1, NULL),
('quicksearch_fulltext', 'on', 1, NULL),
('quote_replies', 'quoted_reply', 1, NULL),
('requestee_cc', 'on', 1, NULL),
('skin', 'Dusk', 1, 'Skin'),
('state_addselfcc', 'cc_unless_role', 1, NULL),
('timezone', 'local', 1, 'Timezone'),
('zoom_textareas', 'on', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_value`
--

CREATE TABLE IF NOT EXISTS `setting_value` (
  `name` varchar(32) NOT NULL,
  `value` varchar(32) NOT NULL,
  `sortindex` smallint(6) NOT NULL,
  UNIQUE KEY `setting_value_nv_unique_idx` (`name`,`value`),
  UNIQUE KEY `setting_value_ns_unique_idx` (`name`,`sortindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting_value`
--

INSERT INTO `setting_value` (`name`, `value`, `sortindex`) VALUES
('bugmail_new_prefix', 'on', 5),
('bugmail_new_prefix', 'off', 10),
('comment_box_position', 'before_comments', 5),
('comment_box_position', 'after_comments', 10),
('comment_sort_order', 'oldest_to_newest', 5),
('comment_sort_order', 'newest_to_oldest', 10),
('comment_sort_order', 'newest_to_oldest_desc_first', 15),
('csv_colsepchar', ',', 5),
('csv_colsepchar', ';', 10),
('display_quips', 'on', 5),
('display_quips', 'off', 10),
('email_format', 'html', 5),
('email_format', 'text_only', 10),
('possible_duplicates', 'on', 5),
('possible_duplicates', 'off', 10),
('post_bug_submit_action', 'next_bug', 5),
('post_bug_submit_action', 'same_bug', 10),
('post_bug_submit_action', 'nothing', 15),
('quicksearch_fulltext', 'on', 5),
('quicksearch_fulltext', 'off', 10),
('quote_replies', 'quoted_reply', 5),
('quote_replies', 'simple_reply', 10),
('quote_replies', 'off', 15),
('requestee_cc', 'on', 5),
('requestee_cc', 'off', 10),
('state_addselfcc', 'always', 5),
('state_addselfcc', 'never', 10),
('state_addselfcc', 'cc_unless_role', 15),
('zoom_textareas', 'on', 5),
('zoom_textareas', 'off', 10);

-- --------------------------------------------------------

--
-- Table structure for table `status_workflow`
--

CREATE TABLE IF NOT EXISTS `status_workflow` (
  `old_status` smallint(6) DEFAULT NULL,
  `new_status` smallint(6) NOT NULL,
  `require_comment` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `status_workflow_idx` (`old_status`,`new_status`),
  KEY `fk_status_workflow_new_status_bug_status_id` (`new_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status_workflow`
--

INSERT INTO `status_workflow` (`old_status`, `new_status`, `require_comment`) VALUES
(NULL, 1, 0),
(NULL, 2, 0),
(NULL, 3, 0),
(1, 2, 0),
(1, 3, 0),
(1, 4, 0),
(2, 3, 0),
(2, 4, 0),
(3, 2, 0),
(3, 4, 0),
(4, 1, 0),
(4, 2, 0),
(4, 5, 0),
(5, 1, 0),
(5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `user_id` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE IF NOT EXISTS `tokens` (
  `userid` mediumint(9) DEFAULT NULL,
  `issuedate` datetime NOT NULL,
  `token` varchar(16) NOT NULL,
  `tokentype` varchar(16) NOT NULL,
  `eventdata` tinytext,
  PRIMARY KEY (`token`),
  KEY `tokens_userid_idx` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`userid`, `issuedate`, `token`, `tokentype`, `eventdata`) VALUES
(1, '2024-12-20 18:24:01', '0UuBotZKY5', 'session', 'edit_product'),
(4, '2024-12-20 18:22:39', '0X9ZGU5Inz', 'session', 'edit_product'),
(1, '2024-12-13 20:20:46', '2Lv5Iswqse', 'session', 'edit_user'),
(1, '2024-12-13 20:39:22', '2T8jFZtlxV', 'session', 'edit_component'),
(1, '2024-12-13 20:56:42', '366HVLqjpp', 'session', 'edit_component'),
(1, '2024-12-13 21:20:38', '3gISQwMnuo', 'api_token', ''),
(1, '2024-12-13 20:47:52', '4lF1fDNVrD', 'session', 'edit_product'),
(1, '2024-12-13 20:28:10', '6jmvolTgK3', 'session', 'edit_component'),
(4, '2024-12-14 15:42:38', '7phZ4LkcO4', 'api_token', ''),
(1, '2024-12-14 15:34:18', '8QgLPcPBYJ', 'session', 'edit_product'),
(1, '2024-12-13 21:22:48', '97Rkfu2UF4', 'session', 'edit_product'),
(4, '2024-12-14 15:45:22', '9EjTh1FNE4', 'session', 'edit_product'),
(4, '2024-12-20 18:22:38', '9kryaWiwBH', 'session', 'edit_product'),
(1, '2024-12-13 20:55:33', '9vL7TjtpgJ', 'session', 'edit_product'),
(1, '2024-12-14 15:26:30', 'ac1hDPAJsm', 'session', 'add_product'),
(1, '2024-12-20 17:10:45', 'aG1XMQAGBo', 'session', 'edit_product'),
(4, '2024-12-14 15:43:10', 'AnSxK2S1FP', 'session', 'edit_product'),
(1, '2024-12-14 15:34:20', 'asuVbfN0u9', 'session', 'edit_component'),
(1, '2024-12-20 18:29:27', 'aTQjdC1u3v', 'session', 'edit_product'),
(1, '2024-12-13 20:22:13', 'ATyk8BaEhs', 'session', 'edit_user'),
(1, '2024-12-13 20:39:09', 'auA5P06yIG', 'session', 'edit_component'),
(1, '2024-12-14 15:37:24', 'BUaqZ0OFaj', 'session', 'edit_product'),
(1, '2024-12-14 08:21:52', 'C5YciKSqDl', 'session', 'edit_product'),
(1, '2024-12-14 15:52:24', 'CFOqzzWZDs', 'session', 'delete_component'),
(1, '2024-12-13 20:14:03', 'CvahiZs0aZ', 'session', 'create_bug'),
(4, '2024-12-20 18:30:30', 'd6YBw5AbWw', 'session', 'edit_product'),
(4, '2024-12-20 18:20:55', 'DnyJBqk1U2', 'session', 'create_bug'),
(1, '2024-12-16 09:14:23', 'DQRyWmY0mG', 'session', 'edit_product'),
(4, '2024-12-14 15:42:31', 'e3JYYpQDaz', 'session', 'edit_product'),
(1, '2024-12-11 09:18:06', 'ei0TWSHNrn', 'session', 'create_bug'),
(1, '2024-12-14 15:40:10', 'eK6FEpU5On', 'session', 'edit_component'),
(1, '2024-12-14 15:40:36', 'Em2S94YVp7', 'session', 'edit_product'),
(1, '2024-12-14 08:25:06', 'EQ6CtrY3cQ', 'session', 'edit_product'),
(1, '2024-12-13 20:18:22', 'FAAp82OPW9', 'session', 'edit_product'),
(1, '2024-12-20 16:13:36', 'FUndjLsoem', 'session', 'edit_product'),
(4, '2024-12-20 18:20:55', 'GAUl9lfZ9D', 'api_token', ''),
(1, '2024-12-20 18:29:49', 'GKjA8uwUn1', 'session', 'edit_product'),
(4, '2024-12-14 15:43:10', 'Gr58MjjTWy', 'session', 'edit_product'),
(1, '2024-12-13 20:21:33', 'GZy6K8P09Q', 'session', 'edit_user'),
(1, '2024-12-20 16:23:10', 'hdyf9lYOhf', 'session', 'edit_product'),
(1, '2024-12-11 09:19:45', 'I1MAgSCnT4', 'session', 'edit_product'),
(1, '2024-12-14 15:26:14', 'IG3VSMza6j', 'session', 'edit_product'),
(1, '2024-12-13 20:55:40', 'j9sF1CcQQA', 'session', 'add_product'),
(1, '2024-12-13 20:17:22', 'JBHkQOoUeD', 'session', 'create_bug'),
(1, '2024-12-11 09:17:37', 'JGuXcXkgdk', 'api_token', ''),
(1, '2024-12-14 15:40:07', 'jpG1VFXTNl', 'session', 'edit_product'),
(1, '2024-12-13 20:18:32', 'jXG7N2KKGa', 'session', 'add_component'),
(1, '2024-12-13 20:32:11', 'L6OXFlHEvf', 'session', 'edit_component'),
(2, '2024-12-14 15:47:53', 'lOAJOzyTw7', 'api_token', ''),
(1, '2024-12-13 20:56:38', 'MCUQOpTVBt', 'session', 'edit_product'),
(1, '2024-12-14 09:36:20', 'nfBSLNBTLN', 'session', 'edit_product'),
(4, '2024-12-14 15:43:49', 'nvfFbwwzqD', 'session', 'edit_product'),
(1, '2024-12-20 18:27:13', 'oolt3eCkn0', 'session', 'edit_product'),
(2, '2024-12-14 15:47:53', 'Q0ao8HVLiN', 'session', 'create_bug'),
(1, '2024-12-13 21:06:10', 'Q7WPZbDFGJ', 'session', 'edit_product'),
(1, '2024-12-20 17:18:57', 'qB3AiE6ONB', 'session', 'edit_product'),
(1, '2024-12-14 08:23:53', 'qJ5r5gxp9p', 'session', 'edit_product'),
(1, '2024-12-13 20:22:25', 'QM1NbUpPld', 'session', 'edit_product'),
(1, '2024-12-20 17:11:43', 'RA6xaV2fnG', 'session', 'edit_component'),
(1, '2024-12-11 09:18:01', 'RjT8Jj7KDe', 'session', 'edit_user_prefs'),
(1, '2024-12-13 20:24:00', 'TByjttWV9U', 'session', 'edit_component'),
(1, '2024-12-14 15:52:17', 'tEAmK6jOlz', 'session', 'delete_component'),
(4, '2024-12-14 15:45:00', 'U4Lm4HzeHz', 'session', 'delete_product'),
(1, '2024-12-14 15:52:58', 'uE5TssaMBi', 'session', 'edit_product'),
(1, '2024-12-14 15:28:24', 'Ugfv42GP5j', 'session', 'edit_product'),
(1, '2024-12-13 20:55:44', 'V1W4DWljiW', 'session', 'edit_product'),
(1, '2024-12-13 20:56:13', 'v3Sf94UJSL', 'session', 'edit_component'),
(1, '2024-12-15 15:23:01', 'veg2Z9csZx', 'session', 'edit_product'),
(1, '2024-12-14 15:52:14', 'VUBPEt3M76', 'session', 'edit_component'),
(1, '2024-12-14 15:51:30', 'vW4fDOYTAe', 'session', 'delete_product'),
(4, '2024-12-14 15:44:55', 'VxjjGjoxWp', 'session', 'edit_product'),
(1, '2024-12-14 15:37:28', 'wDtlBzTPMS', 'session', 'edit_component'),
(1, '2024-12-14 08:24:33', 'wq3uYfFBFM', 'session', 'edit_product'),
(1, '2024-12-14 15:52:12', 'WTPTCqDiru', 'session', 'edit_product'),
(1, '2024-12-14 15:51:47', 'WWC0mqTlTS', 'session', 'delete_product'),
(1, '2024-12-20 18:28:12', 'WWH7U7O7xk', 'session', 'edit_product'),
(1, '2024-12-13 20:28:13', 'xfKsqYayJQ', 'session', 'edit_component'),
(4, '2024-12-20 18:23:28', 'XNXv65BiHs', 'session', 'edit_product'),
(1, '2024-12-11 09:17:37', 'xsgJ5t0ZrL', 'session', 'create_bug'),
(1, '2024-12-13 20:10:01', 'xty8CDpjnG', 'session', 'create_bug'),
(1, '2024-12-13 21:32:52', 'xxj6ntlpLy', 'session', 'edit_product'),
(1, '2024-12-20 15:32:59', 'yeUupjG66x', 'session', 'edit_product'),
(1, '2024-12-13 20:46:11', 'yiRflJN1zl', 'session', 'edit_product'),
(1, '2024-12-14 08:25:36', 'yuGlTspGgs', 'session', 'edit_product'),
(1, '2024-12-20 15:32:18', 'Z6Qsr2pNlo', 'session', 'edit_product'),
(1, '2024-12-11 09:17:48', 'ZAYn0NWZDj', 'session', 'create_bug'),
(1, '2024-12-20 18:23:56', 'zMBJRfFUW0', 'session', 'edit_user_prefs'),
(1, '2024-12-20 15:32:27', 'Zq9V2CjNPA', 'api_token', ''),
(1, '2024-12-14 15:51:24', 'ZUcVsNcVre', 'session', 'create_bug');

-- --------------------------------------------------------

--
-- Table structure for table `ts_error`
--

CREATE TABLE IF NOT EXISTS `ts_error` (
  `error_time` int(11) NOT NULL,
  `jobid` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `funcid` int(11) NOT NULL DEFAULT '0',
  KEY `ts_error_funcid_idx` (`funcid`,`error_time`),
  KEY `ts_error_error_time_idx` (`error_time`),
  KEY `ts_error_jobid_idx` (`jobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ts_exitstatus`
--

CREATE TABLE IF NOT EXISTS `ts_exitstatus` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL DEFAULT '0',
  `status` smallint(6) DEFAULT NULL,
  `completion_time` int(11) DEFAULT NULL,
  `delete_after` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  KEY `ts_exitstatus_funcid_idx` (`funcid`),
  KEY `ts_exitstatus_delete_after_idx` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ts_funcmap`
--

CREATE TABLE IF NOT EXISTS `ts_funcmap` (
  `funcid` int(11) NOT NULL AUTO_INCREMENT,
  `funcname` varchar(255) NOT NULL,
  PRIMARY KEY (`funcid`),
  UNIQUE KEY `ts_funcmap_funcname_idx` (`funcname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ts_job`
--

CREATE TABLE IF NOT EXISTS `ts_job` (
  `jobid` int(11) NOT NULL AUTO_INCREMENT,
  `funcid` int(11) NOT NULL,
  `arg` longblob,
  `uniqkey` varchar(255) DEFAULT NULL,
  `insert_time` int(11) DEFAULT NULL,
  `run_after` int(11) NOT NULL,
  `grabbed_until` int(11) NOT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `coalesce` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`jobid`),
  UNIQUE KEY `ts_job_funcid_idx` (`funcid`,`uniqkey`),
  KEY `ts_job_run_after_idx` (`run_after`,`funcid`),
  KEY `ts_job_coalesce_idx` (`coalesce`,`funcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ts_note`
--

CREATE TABLE IF NOT EXISTS `ts_note` (
  `jobid` int(11) NOT NULL,
  `notekey` varchar(255) DEFAULT NULL,
  `value` longblob,
  UNIQUE KEY `ts_note_jobid_idx` (`jobid`,`notekey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_api_keys`
--

CREATE TABLE IF NOT EXISTS `user_api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(9) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `revoked` tinyint(4) NOT NULL DEFAULT '0',
  `last_used` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_api_keys_api_key_idx` (`api_key`),
  KEY `user_api_keys_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_map`
--

CREATE TABLE IF NOT EXISTS `user_group_map` (
  `user_id` mediumint(9) NOT NULL,
  `group_id` mediumint(9) NOT NULL,
  `isbless` tinyint(4) NOT NULL DEFAULT '0',
  `grant_type` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_group_map_user_id_idx` (`user_id`,`group_id`,`grant_type`,`isbless`),
  KEY `fk_user_group_map_group_id_groups_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_map`
--

INSERT INTO `user_group_map` (`user_id`, `group_id`, `isbless`, `grant_type`) VALUES
(1, 1, 0, 0),
(1, 1, 1, 0),
(2, 1, 0, 0),
(2, 1, 1, 0),
(3, 1, 0, 0),
(3, 1, 1, 0),
(4, 1, 0, 0),
(4, 1, 1, 0),
(2, 2, 0, 0),
(2, 2, 1, 0),
(3, 2, 0, 0),
(3, 2, 1, 0),
(4, 2, 0, 0),
(4, 2, 1, 0),
(1, 3, 0, 0),
(2, 3, 0, 0),
(2, 3, 1, 0),
(3, 3, 0, 0),
(3, 3, 1, 0),
(4, 3, 0, 0),
(4, 3, 1, 0),
(2, 4, 0, 0),
(2, 4, 1, 0),
(3, 4, 0, 0),
(3, 4, 1, 0),
(4, 4, 0, 0),
(4, 4, 1, 0),
(2, 5, 0, 0),
(2, 5, 1, 0),
(3, 5, 0, 0),
(3, 5, 1, 0),
(4, 5, 0, 0),
(4, 5, 1, 0),
(2, 6, 0, 0),
(2, 6, 1, 0),
(3, 6, 0, 0),
(3, 6, 1, 0),
(4, 6, 0, 0),
(4, 6, 1, 0),
(2, 7, 0, 0),
(2, 7, 1, 0),
(3, 7, 0, 0),
(3, 7, 1, 0),
(4, 7, 0, 0),
(4, 7, 1, 0),
(1, 8, 0, 2),
(2, 8, 0, 0),
(2, 8, 1, 0),
(2, 8, 0, 2),
(3, 8, 0, 0),
(3, 8, 1, 0),
(3, 8, 0, 2),
(4, 8, 0, 0),
(4, 8, 1, 0),
(4, 8, 0, 2),
(2, 9, 0, 0),
(2, 9, 1, 0),
(3, 9, 0, 0),
(3, 9, 1, 0),
(4, 9, 0, 0),
(4, 9, 1, 0),
(2, 10, 0, 0),
(2, 10, 1, 0),
(3, 10, 0, 0),
(3, 10, 1, 0),
(4, 10, 0, 0),
(4, 10, 1, 0),
(2, 11, 0, 0),
(2, 11, 1, 0),
(3, 11, 0, 0),
(3, 11, 1, 0),
(4, 11, 0, 0),
(4, 11, 1, 0),
(2, 12, 0, 0),
(2, 12, 1, 0),
(3, 12, 0, 0),
(3, 12, 1, 0),
(4, 12, 0, 0),
(4, 12, 1, 0),
(2, 13, 0, 0),
(2, 13, 1, 0),
(3, 13, 0, 0),
(3, 13, 1, 0),
(4, 13, 0, 0),
(4, 13, 1, 0),
(2, 14, 0, 0),
(2, 14, 1, 0),
(3, 14, 0, 0),
(3, 14, 1, 0),
(4, 14, 0, 0),
(4, 14, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `value` varchar(64) NOT NULL,
  `product_id` smallint(6) NOT NULL,
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `versions_product_id_idx` (`product_id`,`value`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`id`, `value`, `product_id`, `isactive`) VALUES
(1, 'unspecified', 1, 1),
(2, 'unspecified', 2, 1),
(3, 'unspecified', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `watch`
--

CREATE TABLE IF NOT EXISTS `watch` (
  `watcher` mediumint(9) NOT NULL,
  `watched` mediumint(9) NOT NULL,
  UNIQUE KEY `watch_watcher_idx` (`watcher`,`watched`),
  KEY `watch_watched_idx` (`watched`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `whine_events`
--

CREATE TABLE IF NOT EXISTS `whine_events` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `owner_userid` mediumint(9) NOT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `mailifnobugs` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_whine_events_owner_userid_profiles_userid` (`owner_userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `whine_queries`
--

CREATE TABLE IF NOT EXISTS `whine_queries` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `query_name` varchar(64) NOT NULL DEFAULT '',
  `sortkey` smallint(6) NOT NULL DEFAULT '0',
  `onemailperbug` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `whine_queries_eventid_idx` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `whine_schedules`
--

CREATE TABLE IF NOT EXISTS `whine_schedules` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `eventid` mediumint(9) NOT NULL,
  `run_day` varchar(32) DEFAULT NULL,
  `run_time` varchar(32) DEFAULT NULL,
  `run_next` datetime DEFAULT NULL,
  `mailto` mediumint(9) NOT NULL,
  `mailto_type` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `whine_schedules_run_next_idx` (`run_next`),
  KEY `whine_schedules_eventid_idx` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `fk_attachments_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_attachments_submitter_id_profiles_userid` FOREIGN KEY (`submitter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `attach_data`
--
ALTER TABLE `attach_data`
  ADD CONSTRAINT `fk_attach_data_id_attachments_attach_id` FOREIGN KEY (`id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_log_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `bugs`
--
ALTER TABLE `bugs`
  ADD CONSTRAINT `fk_bugs_assigned_to_profiles_userid` FOREIGN KEY (`assigned_to`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_qa_contact_profiles_userid` FOREIGN KEY (`qa_contact`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_reporter_profiles_userid` FOREIGN KEY (`reporter`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `bugs_activity`
--
ALTER TABLE `bugs_activity`
  ADD CONSTRAINT `fk_bugs_activity_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bugs_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `bugs_aliases`
--
ALTER TABLE `bugs_aliases`
  ADD CONSTRAINT `fk_bugs_aliases_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_group_map`
--
ALTER TABLE `bug_group_map`
  ADD CONSTRAINT `fk_bug_group_map_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_see_also`
--
ALTER TABLE `bug_see_also`
  ADD CONSTRAINT `fk_bug_see_also_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_tag`
--
ALTER TABLE `bug_tag`
  ADD CONSTRAINT `fk_bug_tag_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_tag_tag_id_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bug_user_last_visit`
--
ALTER TABLE `bug_user_last_visit`
  ADD CONSTRAINT `fk_bug_user_last_visit_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bug_user_last_visit_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_group_map`
--
ALTER TABLE `category_group_map`
  ADD CONSTRAINT `fk_category_group_map_category_id_series_categories_id` FOREIGN KEY (`category_id`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_category_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cc`
--
ALTER TABLE `cc`
  ADD CONSTRAINT `fk_cc_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cc_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `fk_components_initialowner_profiles_userid` FOREIGN KEY (`initialowner`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_components_initialqacontact_profiles_userid` FOREIGN KEY (`initialqacontact`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_components_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `component_cc`
--
ALTER TABLE `component_cc`
  ADD CONSTRAINT `fk_component_cc_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_component_cc_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dependencies`
--
ALTER TABLE `dependencies`
  ADD CONSTRAINT `fk_dependencies_blocked_bugs_bug_id` FOREIGN KEY (`blocked`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dependencies_dependson_bugs_bug_id` FOREIGN KEY (`dependson`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duplicates`
--
ALTER TABLE `duplicates`
  ADD CONSTRAINT `fk_duplicates_dupe_bugs_bug_id` FOREIGN KEY (`dupe`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_duplicates_dupe_of_bugs_bug_id` FOREIGN KEY (`dupe_of`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_bug_ignore`
--
ALTER TABLE `email_bug_ignore`
  ADD CONSTRAINT `fk_email_bug_ignore_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_email_bug_ignore_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_setting`
--
ALTER TABLE `email_setting`
  ADD CONSTRAINT `fk_email_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fielddefs`
--
ALTER TABLE `fielddefs`
  ADD CONSTRAINT `fk_fielddefs_value_field_id_fielddefs_id` FOREIGN KEY (`value_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_fielddefs_visibility_field_id_fielddefs_id` FOREIGN KEY (`visibility_field_id`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `field_visibility`
--
ALTER TABLE `field_visibility`
  ADD CONSTRAINT `fk_field_visibility_field_id_fielddefs_id` FOREIGN KEY (`field_id`) REFERENCES `fielddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagexclusions`
--
ALTER TABLE `flagexclusions`
  ADD CONSTRAINT `fk_flagexclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagexclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagexclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flaginclusions`
--
ALTER TABLE `flaginclusions`
  ADD CONSTRAINT `fk_flaginclusions_component_id_components_id` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flaginclusions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flaginclusions_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flags`
--
ALTER TABLE `flags`
  ADD CONSTRAINT `fk_flags_attach_id_attachments_attach_id` FOREIGN KEY (`attach_id`) REFERENCES `attachments` (`attach_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_requestee_id_profiles_userid` FOREIGN KEY (`requestee_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_setter_id_profiles_userid` FOREIGN KEY (`setter_id`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flags_type_id_flagtypes_id` FOREIGN KEY (`type_id`) REFERENCES `flagtypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flagtypes`
--
ALTER TABLE `flagtypes`
  ADD CONSTRAINT `fk_flagtypes_grant_group_id_groups_id` FOREIGN KEY (`grant_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_flagtypes_request_group_id_groups_id` FOREIGN KEY (`request_group_id`) REFERENCES `groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `group_control_map`
--
ALTER TABLE `group_control_map`
  ADD CONSTRAINT `fk_group_control_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_group_control_map_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `group_group_map`
--
ALTER TABLE `group_group_map`
  ADD CONSTRAINT `fk_group_group_map_grantor_id_groups_id` FOREIGN KEY (`grantor_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_group_group_map_member_id_groups_id` FOREIGN KEY (`member_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `fk_keywords_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_keywords_keywordid_keyworddefs_id` FOREIGN KEY (`keywordid`) REFERENCES `keyworddefs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `logincookies`
--
ALTER TABLE `logincookies`
  ADD CONSTRAINT `fk_logincookies_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login_failure`
--
ALTER TABLE `login_failure`
  ADD CONSTRAINT `fk_login_failure_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `longdescs`
--
ALTER TABLE `longdescs`
  ADD CONSTRAINT `fk_longdescs_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `longdescs_tags`
--
ALTER TABLE `longdescs_tags`
  ADD CONSTRAINT `fk_longdescs_tags_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `longdescs_tags_activity`
--
ALTER TABLE `longdescs_tags_activity`
  ADD CONSTRAINT `fk_longdescs_tags_activity_bug_id_bugs_bug_id` FOREIGN KEY (`bug_id`) REFERENCES `bugs` (`bug_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_tags_activity_comment_id_longdescs_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `longdescs` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_longdescs_tags_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `milestones`
--
ALTER TABLE `milestones`
  ADD CONSTRAINT `fk_milestones_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedqueries`
--
ALTER TABLE `namedqueries`
  ADD CONSTRAINT `fk_namedqueries_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedqueries_link_in_footer`
--
ALTER TABLE `namedqueries_link_in_footer`
  ADD CONSTRAINT `fk_namedqueries_link_in_footer_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_namedqueries_link_in_footer_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `namedquery_group_map`
--
ALTER TABLE `namedquery_group_map`
  ADD CONSTRAINT `fk_namedquery_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_namedquery_group_map_namedquery_id_namedqueries_id` FOREIGN KEY (`namedquery_id`) REFERENCES `namedqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_classification_id_classifications_id` FOREIGN KEY (`classification_id`) REFERENCES `classifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profiles_activity`
--
ALTER TABLE `profiles_activity`
  ADD CONSTRAINT `fk_profiles_activity_fieldid_fielddefs_id` FOREIGN KEY (`fieldid`) REFERENCES `fielddefs` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profiles_activity_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profiles_activity_who_profiles_userid` FOREIGN KEY (`who`) REFERENCES `profiles` (`userid`) ON UPDATE CASCADE;

--
-- Constraints for table `profile_search`
--
ALTER TABLE `profile_search`
  ADD CONSTRAINT `fk_profile_search_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_setting`
--
ALTER TABLE `profile_setting`
  ADD CONSTRAINT `fk_profile_setting_setting_name_setting_name` FOREIGN KEY (`setting_name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profile_setting_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quips`
--
ALTER TABLE `quips`
  ADD CONSTRAINT `fk_quips_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `series`
--
ALTER TABLE `series`
  ADD CONSTRAINT `fk_series_category_series_categories_id` FOREIGN KEY (`category`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_series_creator_profiles_userid` FOREIGN KEY (`creator`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_series_subcategory_series_categories_id` FOREIGN KEY (`subcategory`) REFERENCES `series_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `series_data`
--
ALTER TABLE `series_data`
  ADD CONSTRAINT `fk_series_data_series_id_series_series_id` FOREIGN KEY (`series_id`) REFERENCES `series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `setting_value`
--
ALTER TABLE `setting_value`
  ADD CONSTRAINT `fk_setting_value_name_setting_name` FOREIGN KEY (`name`) REFERENCES `setting` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `status_workflow`
--
ALTER TABLE `status_workflow`
  ADD CONSTRAINT `fk_status_workflow_new_status_bug_status_id` FOREIGN KEY (`new_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_status_workflow_old_status_bug_status_id` FOREIGN KEY (`old_status`) REFERENCES `bug_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tag`
--
ALTER TABLE `tag`
  ADD CONSTRAINT `fk_tag_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `fk_tokens_userid_profiles_userid` FOREIGN KEY (`userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_api_keys`
--
ALTER TABLE `user_api_keys`
  ADD CONSTRAINT `fk_user_api_keys_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group_map`
--
ALTER TABLE `user_group_map`
  ADD CONSTRAINT `fk_user_group_map_group_id_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_group_map_user_id_profiles_userid` FOREIGN KEY (`user_id`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `versions`
--
ALTER TABLE `versions`
  ADD CONSTRAINT `fk_versions_product_id_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `watch`
--
ALTER TABLE `watch`
  ADD CONSTRAINT `fk_watch_watched_profiles_userid` FOREIGN KEY (`watched`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_watch_watcher_profiles_userid` FOREIGN KEY (`watcher`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_events`
--
ALTER TABLE `whine_events`
  ADD CONSTRAINT `fk_whine_events_owner_userid_profiles_userid` FOREIGN KEY (`owner_userid`) REFERENCES `profiles` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_queries`
--
ALTER TABLE `whine_queries`
  ADD CONSTRAINT `fk_whine_queries_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `whine_schedules`
--
ALTER TABLE `whine_schedules`
  ADD CONSTRAINT `fk_whine_schedules_eventid_whine_events_id` FOREIGN KEY (`eventid`) REFERENCES `whine_events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
