-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2020 at 04:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maslow_structure`
--

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `eventID` decimal(10,0) NOT NULL DEFAULT 0,
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_date` date NOT NULL,
  `end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event_task`
--

CREATE TABLE `event_task` (
  `eventID` decimal(10,0) NOT NULL DEFAULT 0,
  `taskID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `groupID` decimal(10,0) NOT NULL DEFAULT 0,
  `group_name` varchar(255) NOT NULL DEFAULT '(No title)',
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_user`
--

CREATE TABLE `group_user` (
  `groupID` decimal(10,0) NOT NULL DEFAULT 0,
  `userID` varchar(32) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `own_list`
--

CREATE TABLE `own_list` (
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `listID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `own_task`
--

CREATE TABLE `own_task` (
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `taskID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_list`
--

CREATE TABLE `share_list` (
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `listID` decimal(10,0) NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT 'r'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `share_task`
--

CREATE TABLE `share_task` (
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `taskID` decimal(10,0) NOT NULL DEFAULT 0,
  `permission` varchar(1) NOT NULL DEFAULT 'r'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subgroup_of`
--

CREATE TABLE `subgroup_of` (
  `parent_groupID` decimal(10,0) NOT NULL DEFAULT 0,
  `sub_groupID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tagID` decimal(10,0) NOT NULL DEFAULT 0,
  `tag_name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag_list`
--

CREATE TABLE `tag_list` (
  `tagID` decimal(10,0) NOT NULL DEFAULT 0,
  `listID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `taskID` decimal(10,0) NOT NULL DEFAULT 0,
  `task_name` varchar(255) NOT NULL,
  `date_created` date NOT NULL,
  `time_created` time NOT NULL,
  `due_date` date NOT NULL,
  `due_time` time NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `priority` decimal(1,0) NOT NULL DEFAULT 0 CHECK (`priority` >= 0 and `priority` <= 5),
  `location` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `taskID` decimal(10,0) NOT NULL DEFAULT 0,
  `listID` decimal(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tdlist`
--

CREATE TABLE `tdlist` (
  `listID` decimal(10,0) NOT NULL DEFAULT 0,
  `list_name` varchar(255) NOT NULL DEFAULT '(No title)',
  `description` varchar(255) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` varchar(32) NOT NULL DEFAULT '0',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `event_task`
--
ALTER TABLE `event_task`
  ADD PRIMARY KEY (`eventID`,`taskID`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`groupID`);

--
-- Indexes for table `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`groupID`,`userID`);

--
-- Indexes for table `own_list`
--
ALTER TABLE `own_list`
  ADD PRIMARY KEY (`userID`,`listID`);

--
-- Indexes for table `own_task`
--
ALTER TABLE `own_task`
  ADD PRIMARY KEY (`userID`,`taskID`);

--
-- Indexes for table `share_list`
--
ALTER TABLE `share_list`
  ADD PRIMARY KEY (`userID`,`listID`);

--
-- Indexes for table `share_task`
--
ALTER TABLE `share_task`
  ADD PRIMARY KEY (`userID`,`taskID`);

--
-- Indexes for table `subgroup_of`
--
ALTER TABLE `subgroup_of`
  ADD PRIMARY KEY (`parent_groupID`,`sub_groupID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tagID`);

--
-- Indexes for table `tag_list`
--
ALTER TABLE `tag_list`
  ADD PRIMARY KEY (`tagID`,`listID`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`taskID`);

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`taskID`,`listID`);

--
-- Indexes for table `tdlist`
--
ALTER TABLE `tdlist`
  ADD PRIMARY KEY (`listID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
