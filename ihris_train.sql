-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 29, 2021 at 04:58 PM
-- Server version: 5.7.32-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ihris_train`
--

-- --------------------------------------------------------

--
-- Table structure for table `access`
--

CREATE TABLE `access` (
  `user` int(11) NOT NULL,
  `role` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `config_alt`
--

CREATE TABLE `config_alt` (
  `path_hash` char(32) NOT NULL,
  `parent` text NOT NULL,
  `name` text NOT NULL,
  `type` tinyint(4) NOT NULL,
  `value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted_record`
--

CREATE TABLE `deleted_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `last_modified` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `form` int(10) UNSIGNED NOT NULL,
  `parent_form` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `entry`
--

CREATE TABLE `entry` (
  `record` int(10) UNSIGNED NOT NULL,
  `form_field` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `who` int(10) UNSIGNED NOT NULL,
  `change_type` tinyint(3) UNSIGNED NOT NULL,
  `string_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `text_value` text COLLATE utf8_bin,
  `date_value` datetime DEFAULT NULL,
  `blob_value` longblob,
  `float_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `field`
--

CREATE TABLE `field` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `type` varchar(16) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `field_sequence`
--

CREATE TABLE `field_sequence` (
  `form_field` int(11) NOT NULL,
  `sequence` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `form`
--

CREATE TABLE `form` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `form_field`
--

CREATE TABLE `form_field` (
  `id` int(10) UNSIGNED NOT NULL,
  `form` int(10) UNSIGNED NOT NULL,
  `field` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `form_history`
--

CREATE TABLE `form_history` (
  `formid` text NOT NULL,
  `history` blob NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `version` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `form_relationship_importer`
--

CREATE TABLE `form_relationship_importer` (
  `hash` char(32) NOT NULL,
  `relationship` text NOT NULL,
  `id` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_academic_institution`
--

CREATE TABLE `hippo_academic_institution` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_academic_level`
--

CREATE TABLE `hippo_academic_level` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_access_provider`
--

CREATE TABLE `hippo_access_provider` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `provider` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_archived_report`
--

CREATE TABLE `hippo_archived_report` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `report` longblob,
  `report_view` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_area_specialization`
--

CREATE TABLE `hippo_area_specialization` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_cadre`
--

CREATE TABLE `hippo_cadre` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_classification`
--

CREATE TABLE `hippo_classification` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_contact`
--

CREATE TABLE `hippo_contact` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_contact_group`
--

CREATE TABLE `hippo_contact_group` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_council`
--

CREATE TABLE `hippo_council` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_country`
--

CREATE TABLE `hippo_country` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alpha_two` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `primary` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_county`
--

CREATE TABLE `hippo_county` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_currency`
--

CREATE TABLE `hippo_currency` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `symbol` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_demographic`
--

CREATE TABLE `hippo_demographic` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `birth_date` datetime DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `marital_status` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_district`
--

CREATE TABLE `hippo_district` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_education`
--

CREATE TABLE `hippo_education` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `academic_institution` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `academic_level` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area_specialization` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `school` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `year` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_exampaper`
--

CREATE TABLE `hippo_exampaper` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paper` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_exam_grade`
--

CREATE TABLE `hippo_exam_grade` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_exam_result`
--

CREATE TABLE `hippo_exam_result` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_exam_try`
--

CREATE TABLE `hippo_exam_try` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_facility`
--

CREATE TABLE `hippo_facility` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facility_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_facility_contact`
--

CREATE TABLE `hippo_facility_contact` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_facility_owner`
--

CREATE TABLE `hippo_facility_owner` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_facility_type`
--

CREATE TABLE `hippo_facility_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_fee`
--

CREATE TABLE `hippo_fee` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `fee_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_fee_type`
--

CREATE TABLE `hippo_fee_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_length_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_fuat_result`
--

CREATE TABLE `hippo_fuat_result` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_funder`
--

CREATE TABLE `hippo_funder` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_gender`
--

CREATE TABLE `hippo_gender` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_health_facility`
--

CREATE TABLE `hippo_health_facility` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facility_owner` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `facility_type` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_id_type`
--

CREATE TABLE `hippo_id_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pattern` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_job`
--

CREATE TABLE `hippo_job` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `cadre` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_job_category`
--

CREATE TABLE `hippo_job_category` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_locale`
--

CREATE TABLE `hippo_locale` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `selectable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_marital_status`
--

CREATE TABLE `hippo_marital_status` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_ownership`
--

CREATE TABLE `hippo_ownership` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_paper`
--

CREATE TABLE `hippo_paper` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person`
--

CREATE TABLE `hippo_person` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `othername` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pmis` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `residence` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `village` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_contact_emergency`
--

CREATE TABLE `hippo_person_contact_emergency` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_contact_other`
--

CREATE TABLE `hippo_person_contact_other` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_contact_personal`
--

CREATE TABLE `hippo_person_contact_personal` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_contact_work`
--

CREATE TABLE `hippo_person_contact_work` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_group` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `mobile_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_exam`
--

CREATE TABLE `hippo_person_exam` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `exam_date` datetime DEFAULT NULL,
  `exam_grade` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `paper` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `results` int(11) DEFAULT NULL,
  `try` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_id`
--

CREATE TABLE `hippo_person_id` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `id_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `id_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL,
  `place` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_instance`
--

CREATE TABLE `hippo_person_instance` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `attending` int(11) DEFAULT NULL,
  `av_mark` float DEFAULT NULL,
  `comments` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exam_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `exam_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `provider_instance` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `try` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `certificate` longblob,
  `fuat_result` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fuat_date` datetime DEFAULT NULL,
  `fuat_document` longblob,
  `fuat_point` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_person_photo_passport`
--

CREATE TABLE `hippo_person_photo_passport` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `date` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `image` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_position`
--

CREATE TABLE `hippo_position` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `grade` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `job_category` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `job_code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `train_profession` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `classification` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_providertraining`
--

CREATE TABLE `hippo_providertraining` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `trainingprovider` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_provider_instance`
--

CREATE TABLE `hippo_provider_instance` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `academic_year` int(11) DEFAULT NULL,
  `calender_year` datetime DEFAULT NULL,
  `cancelled` int(11) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `job` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `participants_evaluation` longblob,
  `participants_list` longblob,
  `providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `trainer_evaluation` longblob,
  `trainer_information` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_deliver_method` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_evaluation` longblob,
  `training_material` longblob,
  `training_sponsor` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_venue_information` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_classification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_type` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_qualification`
--

CREATE TABLE `hippo_qualification` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_region`
--

CREATE TABLE `hippo_region` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_registration`
--

CREATE TABLE `hippo_registration` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `council` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registration_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `license_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `license_expiration` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_role`
--

CREATE TABLE `hippo_role` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `trickle_up` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `assignable` int(11) DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_status`
--

CREATE TABLE `hippo_status` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_trainer_information`
--

CREATE TABLE `hippo_trainer_information` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alternate_phone_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `qualification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area_specialization` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_point` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training`
--

CREATE TABLE `hippo_training` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `contactperson` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cpd_credit` int(11) DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_classification` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_length` int(11) DEFAULT NULL,
  `training_length_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_area` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_trainingprovider`
--

CREATE TABLE `hippo_trainingprovider` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `alt_telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contact_person` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ownership` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider_type` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_trainingprovider_type`
--

CREATE TABLE `hippo_trainingprovider_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_area`
--

CREATE TABLE `hippo_training_area` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_classification`
--

CREATE TABLE `hippo_training_classification` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_curriculum`
--

CREATE TABLE `hippo_training_curriculum` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_length` int(11) DEFAULT NULL,
  `training_length_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_responsible` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_deliver_method`
--

CREATE TABLE `hippo_training_deliver_method` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_length_type`
--

CREATE TABLE `hippo_training_length_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_modules`
--

CREATE TABLE `hippo_training_modules` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_length` int(11) DEFAULT NULL,
  `training_length_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_responsible` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_curriculum` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_sponsor`
--

CREATE TABLE `hippo_training_sponsor` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_type`
--

CREATE TABLE `hippo_training_type` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_training_venue_information`
--

CREATE TABLE `hippo_training_venue_information` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `location_details` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `intake_capacity` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `venue_details` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_train_profession`
--

CREATE TABLE `hippo_train_profession` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_unit`
--

CREATE TABLE `hippo_unit` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_user`
--

CREATE TABLE `hippo_user` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `i2ce_hidden` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `creator` varchar(255) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `hippo_user_alert`
--

CREATE TABLE `hippo_user_alert` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `parent` varchar(255) COLLATE utf8_bin DEFAULT '|',
  `last_modified` datetime DEFAULT '1900-01-01 00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `alert_type` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `link_text` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `repeated` int(11) DEFAULT NULL,
  `time_ack` datetime DEFAULT NULL,
  `time_sent` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `last_entry`
--

CREATE TABLE `last_entry` (
  `record` int(10) UNSIGNED NOT NULL,
  `form_field` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `who` int(10) UNSIGNED NOT NULL,
  `change_type` tinyint(3) UNSIGNED NOT NULL,
  `string_value` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `text_value` text COLLATE utf8_bin,
  `date_value` datetime DEFAULT NULL,
  `blob_value` longblob,
  `float_value` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `id` int(10) UNSIGNED NOT NULL,
  `last_modified` datetime NOT NULL,
  `created` datetime DEFAULT NULL,
  `form` int(10) UNSIGNED NOT NULL,
  `parent_form` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `temp_upload`
--

CREATE TABLE `temp_upload` (
  `key` varchar(32) COLLATE utf8_bin NOT NULL,
  `value` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `default_password` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_log`
--

CREATE TABLE `user_log` (
  `user` int(11) NOT NULL,
  `login` datetime NOT NULL,
  `logout` datetime DEFAULT NULL,
  `session_id` varchar(50) NOT NULL,
  `activity` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_data_formadores`
--

CREATE TABLE `zebra_data_formadores` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+area_specialization` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+training_area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+remap` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area_espesializasaun+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `area_espesializasaun+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area_formasaun+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `area_formasaun+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `naran_formadores+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `naran_formadores+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `naran_formadores+area_specialization` text COLLATE utf8_bin,
  `naran_formadores+country` text COLLATE utf8_bin,
  `naran_formadores+name` text COLLATE utf8_bin,
  `nasaun_fomadores+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `nasaun_fomadores+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `nasaun_fomadores+location` int(11) DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_healtworkers_by_position`
--

CREATE TABLE `zebra_healtworkers_by_position` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `provider_training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `provider_training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `provider_training+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_participants_by_Position`
--

CREATE TABLE `zebra_participants_by_Position` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+attending` int(11) DEFAULT NULL,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+job` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `health_facility+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `health_facility+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `district+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_Reports_by_Profession`
--

CREATE TABLE `zebra_Reports_by_Profession` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+attending` int(11) DEFAULT NULL,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+train_profession` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `health_facility+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `health_facility+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `district+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_Reports_Particiapant_by_Gender`
--

CREATE TABLE `zebra_Reports_Particiapant_by_Gender` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+fullname` text COLLATE utf8_bin,
  `primary_form+pmis` text COLLATE utf8_bin,
  `Demographic+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `Demographic+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Demographic+gender` text COLLATE utf8_bin,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_scheduled_training`
--

CREATE TABLE `zebra_scheduled_training` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+end_date` datetime DEFAULT NULL,
  `primary_form+start_date` datetime DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+name` text COLLATE utf8_bin,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+name` text COLLATE utf8_bin,
  `trainingprovider+trainingprovider_type` text COLLATE utf8_bin,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+name` text COLLATE utf8_bin,
  `training+training_classification` text COLLATE utf8_bin,
  `training+training_length` int(11) DEFAULT NULL,
  `training+training_length_type` text COLLATE utf8_bin,
  `training+training_type` text COLLATE utf8_bin,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL,
  `+completed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_search_person`
--

CREATE TABLE `zebra_search_person` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+fullname` text COLLATE utf8_bin,
  `primary_form+nationality` text COLLATE utf8_bin,
  `primary_form+pmis` text COLLATE utf8_bin,
  `demographic+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `demographic+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `demographic+birth_date` datetime DEFAULT NULL,
  `demographic+gender` text COLLATE utf8_bin,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `registraion+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `registraion+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `registraion+license_expiration` datetime DEFAULT NULL,
  `registraion+license_number` text COLLATE utf8_bin,
  `registraion+registration_date` datetime DEFAULT NULL,
  `registraion+registration_number` text COLLATE utf8_bin,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_search_trainer`
--

CREATE TABLE `zebra_search_trainer` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+area_specialization` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+country` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+training_area` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `area_specialization+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `area_specialization+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `country+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `country+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training_area+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training_area+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_search_training_provider`
--

CREATE TABLE `zebra_search_training_provider` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+name` text COLLATE utf8_bin,
  `primary_form+trainingprovider_type` text COLLATE utf8_bin,
  `provider_training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `provider_training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `provider_training+training` text COLLATE utf8_bin,
  `provider_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `provider_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `provider_instance+end_date` datetime DEFAULT NULL,
  `provider_instance+location` text COLLATE utf8_bin,
  `provider_instance+providertraining` text COLLATE utf8_bin,
  `provider_instance+start_date` datetime DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_Test`
--

CREATE TABLE `zebra_Test` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+fullname` text COLLATE utf8_bin,
  `Demog+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `Demog+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Demog+gender` text COLLATE utf8_bin,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_test`
--

CREATE TABLE `zebra_test` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+attending` int(11) DEFAULT NULL,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+train_profession` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `health_facility+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `health_facility+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `district+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_trainingparticipant_by_profession`
--

CREATE TABLE `zebra_trainingparticipant_by_profession` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+attending` int(11) DEFAULT NULL,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+train_profession` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `health_facility+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `health_facility+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `district+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `zebra_training_participant`
--

CREATE TABLE `zebra_training_participant` (
  `last_modified` datetime DEFAULT NULL,
  `primary_form+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `primary_form+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+funder` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+providertraining` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `primary_form+end_date` datetime DEFAULT NULL,
  `primary_form+start_date` datetime DEFAULT NULL,
  `funder+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `funder+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `funder+name` text COLLATE utf8_bin,
  `person_instance+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person_instance+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person_instance+attending` int(11) DEFAULT NULL,
  `providertraining+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `providertraining+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `providertraining+training` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `trainingprovider+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `trainingprovider+name` text COLLATE utf8_bin,
  `trainingprovider+trainingprovider_type` text COLLATE utf8_bin,
  `person+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `person+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `person+fullname` text COLLATE utf8_bin,
  `person+pmis` text COLLATE utf8_bin,
  `training+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `training+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `training+name` text COLLATE utf8_bin,
  `training+training_classification` text COLLATE utf8_bin,
  `training+training_length` int(11) DEFAULT NULL,
  `training+training_length_type` text COLLATE utf8_bin,
  `training+training_type` text COLLATE utf8_bin,
  `position+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `position+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+health_facility` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+job` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `position+start_date` datetime DEFAULT NULL,
  `health_facility+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `health_facility+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+location` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `health_facility+name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+id` varchar(255) COLLATE utf8_bin DEFAULT '',
  `district+parent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `district+name` text COLLATE utf8_bin,
  `last_md5` binary(16) DEFAULT NULL,
  `md5` binary(16) DEFAULT NULL,
  `+participant` int(11) DEFAULT NULL,
  `+completed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access`
--
ALTER TABLE `access`
  ADD PRIMARY KEY (`user`);

--
-- Indexes for table `config_alt`
--
ALTER TABLE `config_alt`
  ADD PRIMARY KEY (`path_hash`),
  ADD KEY `parent` (`parent`(130)),
  ADD KEY `path` (`parent`(130),`name`(30));

--
-- Indexes for table `deleted_record`
--
ALTER TABLE `deleted_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_form` (`parent_form`,`parent_id`);

--
-- Indexes for table `entry`
--
ALTER TABLE `entry`
  ADD KEY `record` (`record`),
  ADD KEY `date` (`date`),
  ADD KEY `form_field` (`form_field`);

--
-- Indexes for table `field`
--
ALTER TABLE `field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_type` (`name`,`type`);

--
-- Indexes for table `field_sequence`
--
ALTER TABLE `field_sequence`
  ADD PRIMARY KEY (`form_field`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `form_field`
--
ALTER TABLE `form_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form` (`form`,`field`);

--
-- Indexes for table `form_relationship_importer`
--
ALTER TABLE `form_relationship_importer`
  ADD KEY `hash_rey` (`hash`,`relationship`(130));

--
-- Indexes for table `hippo_academic_institution`
--
ALTER TABLE `hippo_academic_institution`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `hippo_academic_level`
--
ALTER TABLE `hippo_academic_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_access_provider`
--
ALTER TABLE `hippo_access_provider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `hippo_archived_report`
--
ALTER TABLE `hippo_archived_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_area_specialization`
--
ALTER TABLE `hippo_area_specialization`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_cadre`
--
ALTER TABLE `hippo_cadre`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_classification`
--
ALTER TABLE `hippo_classification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_contact`
--
ALTER TABLE `hippo_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_contact_group`
--
ALTER TABLE `hippo_contact_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_council`
--
ALTER TABLE `hippo_council`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_country`
--
ALTER TABLE `hippo_country`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_county`
--
ALTER TABLE `hippo_county`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `district` (`district`);

--
-- Indexes for table `hippo_currency`
--
ALTER TABLE `hippo_currency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `hippo_demographic`
--
ALTER TABLE `hippo_demographic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `gender` (`gender`),
  ADD KEY `marital_status` (`marital_status`);

--
-- Indexes for table `hippo_district`
--
ALTER TABLE `hippo_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `region` (`region`);

--
-- Indexes for table `hippo_education`
--
ALTER TABLE `hippo_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `academic_institution` (`academic_institution`),
  ADD KEY `academic_level` (`academic_level`),
  ADD KEY `area_specialization` (`area_specialization`),
  ADD KEY `qualification` (`qualification`);

--
-- Indexes for table `hippo_exampaper`
--
ALTER TABLE `hippo_exampaper`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `paper` (`paper`),
  ADD KEY `training` (`training`);

--
-- Indexes for table `hippo_exam_grade`
--
ALTER TABLE `hippo_exam_grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_exam_result`
--
ALTER TABLE `hippo_exam_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_exam_try`
--
ALTER TABLE `hippo_exam_try`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_facility`
--
ALTER TABLE `hippo_facility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `location` (`location`),
  ADD KEY `facility_type` (`facility_type`);

--
-- Indexes for table `hippo_facility_contact`
--
ALTER TABLE `hippo_facility_contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_facility_owner`
--
ALTER TABLE `hippo_facility_owner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_facility_type`
--
ALTER TABLE `hippo_facility_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_fee`
--
ALTER TABLE `hippo_fee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `fee_type` (`fee_type`),
  ADD KEY `amount` (`amount`);

--
-- Indexes for table `hippo_fee_type`
--
ALTER TABLE `hippo_fee_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `training_length_type` (`training_length_type`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `hippo_fuat_result`
--
ALTER TABLE `hippo_fuat_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_funder`
--
ALTER TABLE `hippo_funder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_gender`
--
ALTER TABLE `hippo_gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_health_facility`
--
ALTER TABLE `hippo_health_facility`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `location` (`location`),
  ADD KEY `facility_owner` (`facility_owner`),
  ADD KEY `facility_type` (`facility_type`);

--
-- Indexes for table `hippo_id_type`
--
ALTER TABLE `hippo_id_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_job`
--
ALTER TABLE `hippo_job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `cadre` (`cadre`);

--
-- Indexes for table `hippo_job_category`
--
ALTER TABLE `hippo_job_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_locale`
--
ALTER TABLE `hippo_locale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_marital_status`
--
ALTER TABLE `hippo_marital_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_ownership`
--
ALTER TABLE `hippo_ownership`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_paper`
--
ALTER TABLE `hippo_paper`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_person`
--
ALTER TABLE `hippo_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `nationality` (`nationality`),
  ADD KEY `residence` (`residence`);

--
-- Indexes for table `hippo_person_contact_emergency`
--
ALTER TABLE `hippo_person_contact_emergency`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_person_contact_other`
--
ALTER TABLE `hippo_person_contact_other`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_person_contact_personal`
--
ALTER TABLE `hippo_person_contact_personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_person_contact_work`
--
ALTER TABLE `hippo_person_contact_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `contact_group` (`contact_group`);

--
-- Indexes for table `hippo_person_exam`
--
ALTER TABLE `hippo_person_exam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `exam_grade` (`exam_grade`),
  ADD KEY `paper` (`paper`),
  ADD KEY `try` (`try`);

--
-- Indexes for table `hippo_person_id`
--
ALTER TABLE `hippo_person_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `country` (`country`),
  ADD KEY `id_type` (`id_type`);

--
-- Indexes for table `hippo_person_instance`
--
ALTER TABLE `hippo_person_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `provider_instance` (`provider_instance`),
  ADD KEY `try` (`try`),
  ADD KEY `fuat_result` (`fuat_result`);

--
-- Indexes for table `hippo_person_photo_passport`
--
ALTER TABLE `hippo_person_photo_passport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `hippo_position`
--
ALTER TABLE `hippo_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `health_facility` (`health_facility`),
  ADD KEY `job` (`job`),
  ADD KEY `job_category` (`job_category`),
  ADD KEY `train_profession` (`train_profession`),
  ADD KEY `classification` (`classification`);

--
-- Indexes for table `hippo_providertraining`
--
ALTER TABLE `hippo_providertraining`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `trainingprovider` (`trainingprovider`),
  ADD KEY `training` (`training`);

--
-- Indexes for table `hippo_provider_instance`
--
ALTER TABLE `hippo_provider_instance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `funder` (`funder`),
  ADD KEY `job` (`job`),
  ADD KEY `providertraining` (`providertraining`),
  ADD KEY `trainer_information` (`trainer_information`),
  ADD KEY `training_deliver_method` (`training_deliver_method`),
  ADD KEY `training_sponsor` (`training_sponsor`),
  ADD KEY `training_venue_information` (`training_venue_information`),
  ADD KEY `training_classification` (`training_classification`),
  ADD KEY `training_type` (`training_type`);

--
-- Indexes for table `hippo_qualification`
--
ALTER TABLE `hippo_qualification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_region`
--
ALTER TABLE `hippo_region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `hippo_registration`
--
ALTER TABLE `hippo_registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `council` (`council`);

--
-- Indexes for table `hippo_role`
--
ALTER TABLE `hippo_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `trickle_up` (`trickle_up`);

--
-- Indexes for table `hippo_status`
--
ALTER TABLE `hippo_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_trainer_information`
--
ALTER TABLE `hippo_trainer_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `qualification` (`qualification`),
  ADD KEY `area_specialization` (`area_specialization`),
  ADD KEY `training_area` (`training_area`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `hippo_training`
--
ALTER TABLE `hippo_training`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `training_classification` (`training_classification`),
  ADD KEY `training_length_type` (`training_length_type`),
  ADD KEY `training_type` (`training_type`),
  ADD KEY `training_area` (`training_area`);

--
-- Indexes for table `hippo_trainingprovider`
--
ALTER TABLE `hippo_trainingprovider`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `ownership` (`ownership`),
  ADD KEY `trainingprovider_type` (`trainingprovider_type`);

--
-- Indexes for table `hippo_trainingprovider_type`
--
ALTER TABLE `hippo_trainingprovider_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_area`
--
ALTER TABLE `hippo_training_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_classification`
--
ALTER TABLE `hippo_training_classification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_curriculum`
--
ALTER TABLE `hippo_training_curriculum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `status` (`status`),
  ADD KEY `training_length_type` (`training_length_type`);

--
-- Indexes for table `hippo_training_deliver_method`
--
ALTER TABLE `hippo_training_deliver_method`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_length_type`
--
ALTER TABLE `hippo_training_length_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_modules`
--
ALTER TABLE `hippo_training_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `status` (`status`),
  ADD KEY `training_length_type` (`training_length_type`),
  ADD KEY `training_curriculum` (`training_curriculum`);

--
-- Indexes for table `hippo_training_sponsor`
--
ALTER TABLE `hippo_training_sponsor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_type`
--
ALTER TABLE `hippo_training_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_training_venue_information`
--
ALTER TABLE `hippo_training_venue_information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `location` (`location`);

--
-- Indexes for table `hippo_train_profession`
--
ALTER TABLE `hippo_train_profession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_unit`
--
ALTER TABLE `hippo_unit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`);

--
-- Indexes for table `hippo_user`
--
ALTER TABLE `hippo_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `remap` (`remap`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `hippo_user_alert`
--
ALTER TABLE `hippo_user_alert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `last_entry`
--
ALTER TABLE `last_entry`
  ADD PRIMARY KEY (`record`,`form_field`),
  ADD KEY `record` (`record`),
  ADD KEY `form_field` (`form_field`),
  ADD KEY `ff_string_value` (`form_field`,`string_value`),
  ADD KEY `ff_integer_value` (`form_field`,`integer_value`),
  ADD KEY `date` (`date`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_form` (`parent_form`,`parent_id`);

--
-- Indexes for table `temp_upload`
--
ALTER TABLE `temp_upload`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD KEY `user` (`user`),
  ADD KEY `login` (`login`);

--
-- Indexes for table `zebra_data_formadores`
--
ALTER TABLE `zebra_data_formadores`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+area_specialization` (`primary_form+area_specialization`),
  ADD KEY `primary_form+training_area` (`primary_form+training_area`),
  ADD KEY `primary_form+remap` (`primary_form+remap`),
  ADD KEY `primary_form+country` (`primary_form+country`);

--
-- Indexes for table `zebra_healtworkers_by_position`
--
ALTER TABLE `zebra_healtworkers_by_position`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `provider_training+training` (`provider_training+training`),
  ADD KEY `person_instance+parent` (`person_instance+parent`);

--
-- Indexes for table `zebra_participants_by_Position`
--
ALTER TABLE `zebra_participants_by_Position`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `person_instance+parent` (`person_instance+parent`),
  ADD KEY `person_instance+attending` (`person_instance+attending`),
  ADD KEY `providertraining+training` (`providertraining+training`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+job` (`position+job`),
  ADD KEY `position+start_date` (`position+start_date`),
  ADD KEY `health_facility+location` (`health_facility+location`);

--
-- Indexes for table `zebra_Reports_by_Profession`
--
ALTER TABLE `zebra_Reports_by_Profession`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `person_instance+parent` (`person_instance+parent`),
  ADD KEY `person_instance+attending` (`person_instance+attending`),
  ADD KEY `providertraining+training` (`providertraining+training`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+train_profession` (`position+train_profession`),
  ADD KEY `position+start_date` (`position+start_date`),
  ADD KEY `health_facility+location` (`health_facility+location`);

--
-- Indexes for table `zebra_Reports_Particiapant_by_Gender`
--
ALTER TABLE `zebra_Reports_Particiapant_by_Gender`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `zebra_scheduled_training`
--
ALTER TABLE `zebra_scheduled_training`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `primary_form+end_date` (`primary_form+end_date`),
  ADD KEY `primary_form+start_date` (`primary_form+start_date`),
  ADD KEY `providertraining+training` (`providertraining+training`);

--
-- Indexes for table `zebra_search_person`
--
ALTER TABLE `zebra_search_person`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+start_date` (`position+start_date`);

--
-- Indexes for table `zebra_search_trainer`
--
ALTER TABLE `zebra_search_trainer`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+area_specialization` (`primary_form+area_specialization`),
  ADD KEY `primary_form+country` (`primary_form+country`),
  ADD KEY `primary_form+training_area` (`primary_form+training_area`),
  ADD KEY `primary_form+name` (`primary_form+name`);

--
-- Indexes for table `zebra_search_training_provider`
--
ALTER TABLE `zebra_search_training_provider`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `zebra_Test`
--
ALTER TABLE `zebra_Test`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`);

--
-- Indexes for table `zebra_test`
--
ALTER TABLE `zebra_test`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `person_instance+parent` (`person_instance+parent`),
  ADD KEY `person_instance+attending` (`person_instance+attending`),
  ADD KEY `providertraining+training` (`providertraining+training`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+train_profession` (`position+train_profession`),
  ADD KEY `position+start_date` (`position+start_date`),
  ADD KEY `health_facility+location` (`health_facility+location`);

--
-- Indexes for table `zebra_trainingparticipant_by_profession`
--
ALTER TABLE `zebra_trainingparticipant_by_profession`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `person_instance+parent` (`person_instance+parent`),
  ADD KEY `person_instance+attending` (`person_instance+attending`),
  ADD KEY `providertraining+training` (`providertraining+training`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+train_profession` (`position+train_profession`),
  ADD KEY `position+start_date` (`position+start_date`),
  ADD KEY `health_facility+location` (`health_facility+location`);

--
-- Indexes for table `zebra_training_participant`
--
ALTER TABLE `zebra_training_participant`
  ADD UNIQUE KEY `last_md5` (`last_md5`),
  ADD UNIQUE KEY `md5` (`md5`),
  ADD KEY `primary_form+id` (`primary_form+id`),
  ADD KEY `last_modified` (`last_modified`),
  ADD KEY `primary_form+funder` (`primary_form+funder`),
  ADD KEY `primary_form+providertraining` (`primary_form+providertraining`),
  ADD KEY `primary_form+parent` (`primary_form+parent`),
  ADD KEY `primary_form+end_date` (`primary_form+end_date`),
  ADD KEY `primary_form+start_date` (`primary_form+start_date`),
  ADD KEY `person_instance+parent` (`person_instance+parent`),
  ADD KEY `person_instance+attending` (`person_instance+attending`),
  ADD KEY `providertraining+training` (`providertraining+training`),
  ADD KEY `position+health_facility` (`position+health_facility`),
  ADD KEY `position+job` (`position+job`),
  ADD KEY `position+start_date` (`position+start_date`),
  ADD KEY `health_facility+location` (`health_facility+location`),
  ADD KEY `health_facility+name` (`health_facility+name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deleted_record`
--
ALTER TABLE `deleted_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `field`
--
ALTER TABLE `field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;
--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `form_field`
--
ALTER TABLE `form_field`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=392;
--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21285;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
