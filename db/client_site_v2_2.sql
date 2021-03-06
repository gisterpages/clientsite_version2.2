-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2016 at 06:04 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `client_site_v2.2`
--
CREATE DATABASE IF NOT EXISTS `client_site_v2.2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `client_site_v2.2`;

-- --------------------------------------------------------

--
-- Table structure for table `active_users`
--

DROP TABLE IF EXISTS `active_users`;
CREATE TABLE IF NOT EXISTS `active_users` (
`active_users_id` int(11) NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `full_name` varchar(45) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advisers`
--

DROP TABLE IF EXISTS `advisers`;
CREATE TABLE IF NOT EXISTS `advisers` (
  `adviserID` int(11) NOT NULL,
  `adviserReference` varchar(45) DEFAULT NULL,
  `userID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advisers`
--

INSERT IGNORE INTO `advisers` (`adviserID`, `adviserReference`, `userID`) VALUES
(1, '213', 1);

-- --------------------------------------------------------

--
-- Table structure for table `adviser_has_client`
--

DROP TABLE IF EXISTS `adviser_has_client`;
CREATE TABLE IF NOT EXISTS `adviser_has_client` (
`adviserHasClientID` int(11) NOT NULL,
  `clientID` int(11) NOT NULL,
  `adviserID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adviser_has_client`
--

INSERT IGNORE INTO `adviser_has_client` (`adviserHasClientID`, `clientID`, `adviserID`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
`applicationID` int(11) NOT NULL,
  `applicationType` varchar(15) NOT NULL,
  `applicationReference` varchar(45) NOT NULL,
  `clientID` int(11) NOT NULL,
  `application_date` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `applications`
--

INSERT IGNORE INTO `applications` (`applicationID`, `applicationType`, `applicationReference`, `clientID`, `application_date`) VALUES
(1, 'sipp', '70646', 1, '2016-05-02'),
(4, 'sipp', '55841', 1, '2016-05-02'),
(5, 'sipp', '68475', 1, '2016-05-02'),
(6, 'sipp', '82930', 1, '2016-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `audit_logins`
--

DROP TABLE IF EXISTS `audit_logins`;
CREATE TABLE IF NOT EXISTS `audit_logins` (
`auditLoginID` int(11) NOT NULL,
  `sourceIP` varchar(16) NOT NULL,
  `loginSuccessful` int(11) NOT NULL DEFAULT '1',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `users_userID` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `audit_logins`
--

INSERT IGNORE INTO `audit_logins` (`auditLoginID`, `sourceIP`, `loginSuccessful`, `timestamp`, `users_userID`) VALUES
(6, '127.0.0.1', 1, '2016-04-29 11:44:48', 1),
(7, '127.0.0.1', 1, '2016-05-02 09:06:00', 1),
(8, '127.0.0.1', 1, '2016-05-02 09:08:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

DROP TABLE IF EXISTS `auth_permissions`;
CREATE TABLE IF NOT EXISTS `auth_permissions` (
`permID` int(10) unsigned NOT NULL,
  `permDesc` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT IGNORE INTO `auth_permissions` (`permID`, `permDesc`) VALUES
(1, 'canAddUser'),
(3, 'canDeleteUser'),
(4, 'canEditRoles'),
(2, 'canEditUser'),
(5, 'canSearch');

-- --------------------------------------------------------

--
-- Table structure for table `auth_roles`
--

DROP TABLE IF EXISTS `auth_roles`;
CREATE TABLE IF NOT EXISTS `auth_roles` (
`roleID` int(10) unsigned NOT NULL,
  `roleName` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_roles`
--

INSERT IGNORE INTO `auth_roles` (`roleID`, `roleName`) VALUES
(1, 'Administrator'),
(2, 'Adviser'),
(3, 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `auth_role_perm`
--

DROP TABLE IF EXISTS `auth_role_perm`;
CREATE TABLE IF NOT EXISTS `auth_role_perm` (
  `roleID` int(10) unsigned NOT NULL,
  `permID` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_role_perm`
--

INSERT IGNORE INTO `auth_role_perm` (`roleID`, `permID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_role`
--

DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE IF NOT EXISTS `auth_user_role` (
  `userID` int(11) NOT NULL,
  `roleID` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user_role`
--

INSERT IGNORE INTO `auth_user_role` (`userID`, `roleID`) VALUES
(4, 3),
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
`clientID` int(11) NOT NULL,
  `adviserID` int(11) NOT NULL,
  `clientReference` varchar(45) DEFAULT NULL,
  `clientRetirementAge` int(11) DEFAULT NULL,
  `userID` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT IGNORE INTO `clients` (`clientID`, `adviserID`, `clientReference`, `clientRetirementAge`, `userID`) VALUES
(1, 1, 'asdfsdaf', 64, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contributions`
--

DROP TABLE IF EXISTS `contributions`;
CREATE TABLE IF NOT EXISTS `contributions` (
`contributionID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `fund_type` varchar(255) NOT NULL,
  `lump_sum_amount` varchar(255) NOT NULL,
  `regular_amount` varchar(255) NOT NULL,
  `frequency_regular` varchar(255) NOT NULL,
  `account_holder` varchar(255) NOT NULL,
  `society_account_holder` varchar(255) NOT NULL,
  `sorrt_code` varchar(45) NOT NULL,
  `postal_address` varchar(255) NOT NULL,
  `contributionsReference` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `docs_view_history`
--

DROP TABLE IF EXISTS `docs_view_history`;
CREATE TABLE IF NOT EXISTS `docs_view_history` (
`docsViewHistoryID` int(11) NOT NULL,
  `docViewHistoryDate` datetime DEFAULT NULL,
  `sourceIP` varchar(45) DEFAULT NULL,
  `userAgent` varchar(255) DEFAULT NULL,
  `document_documentID` int(11) NOT NULL,
  `viewedBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
`documentID` int(11) NOT NULL,
  `docName` varchar(155) NOT NULL,
  `docPath` varchar(255) NOT NULL,
  `docType` varchar(45) NOT NULL,
  `docSize` decimal(10,2) NOT NULL DEFAULT '0.00',
  `docDateAdded` datetime DEFAULT NULL,
  `docIsViewed` datetime DEFAULT NULL,
  `clientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

DROP TABLE IF EXISTS `email`;
CREATE TABLE IF NOT EXISTS `email` (
`emailMessageID` int(10) NOT NULL,
  `emailMessageFrom` varchar(50) DEFAULT NULL,
  `emailMessageDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `emailMessageSubject` varchar(20) DEFAULT NULL,
  `emailMessageBody` mediumtext,
  `emailMessageCC` tinytext,
  `emailMessageTo` tinytext,
  `emailMessageViewed` datetime DEFAULT NULL,
  `users_userID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
CREATE TABLE IF NOT EXISTS `glossary` (
`idglossary` int(11) NOT NULL,
  `term` varchar(45) NOT NULL,
  `definition` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `investment_intructions`
--

DROP TABLE IF EXISTS `investment_intructions`;
CREATE TABLE IF NOT EXISTS `investment_intructions` (
`investmentIntructionID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `investment_options` varchar(255) NOT NULL,
  `percentage_of_investment` varchar(255) NOT NULL,
  `target_date` date NOT NULL,
  `investmentReference` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `login_blacklist`
--

DROP TABLE IF EXISTS `login_blacklist`;
CREATE TABLE IF NOT EXISTS `login_blacklist` (
`loginBlacklistID` int(11) NOT NULL,
  `ipaddress` varchar(16) NOT NULL,
  `lastAttempt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `blackIsArchive` int(11) NOT NULL DEFAULT '0' COMMENT 'achive the black for record purpose\nset to 1 if achive ',
  `users_userID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
`messageID` int(10) NOT NULL,
  `messageDate` datetime DEFAULT NULL,
  `messageBody` mediumtext,
  `messageViewedDate` datetime DEFAULT NULL,
  `messageSentOrReceived` enum('sent','received') DEFAULT NULL,
  `clientID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `terms_definitions`
--

DROP TABLE IF EXISTS `terms_definitions`;
CREATE TABLE IF NOT EXISTS `terms_definitions` (
`terms_definitionID` int(11) NOT NULL,
  `terms` varchar(155) NOT NULL,
  `definition` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE IF NOT EXISTS `transfers` (
`transferID` int(11) NOT NULL,
  `applicationID` int(11) NOT NULL,
  `pensionProvider` varchar(255) NOT NULL,
  `transferReferrence` varchar(45) NOT NULL,
  `approximateValue` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`userID` int(10) NOT NULL,
  `userIsActive` int(1) NOT NULL DEFAULT '0',
  `userTtitle` varchar(45) DEFAULT NULL,
  `userFirstName` varchar(45) DEFAULT NULL,
  `userLastName` varchar(45) DEFAULT NULL,
  `userDOB` date DEFAULT NULL,
  `userAddressLine1` varchar(120) DEFAULT NULL,
  `userAddressLine2` varchar(120) DEFAULT NULL,
  `userPostcode` varchar(10) DEFAULT NULL,
  `userCounty` varchar(120) DEFAULT NULL,
  `userTown` varchar(120) DEFAULT NULL,
  `userTel` varchar(120) DEFAULT NULL,
  `userMobile` varchar(120) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userNinum` varchar(45) DEFAULT NULL,
  `userUsername` varchar(45) DEFAULT NULL,
  `userPwordHash` varchar(65) DEFAULT NULL,
  `userPasswordChanged` int(1) NOT NULL DEFAULT '0',
  `userBaseUrl` varchar(85) NOT NULL COMMENT 'unique code to identify client',
  `userDateCreated` date DEFAULT NULL,
  `groupID` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT IGNORE INTO `users` (`userID`, `userIsActive`, `userTtitle`, `userFirstName`, `userLastName`, `userDOB`, `userAddressLine1`, `userAddressLine2`, `userPostcode`, `userCounty`, `userTown`, `userTel`, `userMobile`, `userEmail`, `userNinum`, `userUsername`, `userPwordHash`, `userPasswordChanged`, `userBaseUrl`, `userDateCreated`, `groupID`) VALUES
(1, 1, 'mr', 'adv1', 'user1', '2006-12-12', 'asdf', 'asdfsf', '12313', 'india', 'town', '1231414', '123214124', 'adv1user1@gp.com', '213213', 'adv1user1', '$2y$10$ISalZprMNt4OuUi1h9FCv.SDifLd2dC54fFKbdUGq7B/iN6klUol2', 0, 'asdf', '2016-04-22', 1),
(2, 2, 'mr', 'client2', 'user2', '2006-12-12', '123', '1123', '123', 'india', 'town', '67896789', '6879679', 'client2user2@gp.com', '567567', 'adv2user2', '$2y$10$ISalZprMNt4OuUi1h9FCv.SDifLd2dC54fFKbdUGq7B/iN6klUol2', 0, 'asdf1', '2016-04-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
`groupID` int(11) NOT NULL,
  `groupName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group`
--

INSERT IGNORE INTO `user_group` (`groupID`, `groupName`) VALUES
(1, 'group1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_users`
--
ALTER TABLE `active_users`
 ADD PRIMARY KEY (`active_users_id`), ADD KEY `index2` (`active_users_id`,`last_active`,`full_name`,`ip_address`), ADD KEY `fk_active_users_users1_idx` (`user_id`);

--
-- Indexes for table `advisers`
--
ALTER TABLE `advisers`
 ADD PRIMARY KEY (`adviserID`), ADD KEY `fk_advisers_users1_idx` (`userID`);

--
-- Indexes for table `adviser_has_client`
--
ALTER TABLE `adviser_has_client`
 ADD PRIMARY KEY (`adviserHasClientID`), ADD KEY `fk_adviserHasClient_clients1_idx` (`clientID`), ADD KEY `fk_adviserHasClient_advisers1_idx` (`adviserID`);

--
-- Indexes for table `applications`
--
ALTER TABLE `applications`
 ADD PRIMARY KEY (`applicationID`), ADD KEY `fk_applications_clients1_idx` (`clientID`);

--
-- Indexes for table `audit_logins`
--
ALTER TABLE `audit_logins`
 ADD PRIMARY KEY (`auditLoginID`), ADD KEY `fk_audit_logins_users1_idx` (`users_userID`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
 ADD PRIMARY KEY (`permID`), ADD UNIQUE KEY `permDesc_UNIQUE` (`permDesc`);

--
-- Indexes for table `auth_roles`
--
ALTER TABLE `auth_roles`
 ADD PRIMARY KEY (`roleID`), ADD UNIQUE KEY `roleName_UNIQUE` (`roleName`);

--
-- Indexes for table `auth_role_perm`
--
ALTER TABLE `auth_role_perm`
 ADD KEY `roleID` (`roleID`), ADD KEY `permID` (`permID`);

--
-- Indexes for table `auth_user_role`
--
ALTER TABLE `auth_user_role`
 ADD KEY `fk_ac_user_role_users1_idx` (`userID`), ADD KEY `fk_ac_user_role_ac_roles1_idx` (`roleID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`clientID`), ADD KEY `fk_clients_users1_idx` (`userID`);

--
-- Indexes for table `contributions`
--
ALTER TABLE `contributions`
 ADD PRIMARY KEY (`contributionID`), ADD KEY `fk_contributions_applications1_idx` (`applicationID`);

--
-- Indexes for table `docs_view_history`
--
ALTER TABLE `docs_view_history`
 ADD PRIMARY KEY (`docsViewHistoryID`), ADD KEY `fk_docs_view_history_document1_idx` (`document_documentID`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
 ADD PRIMARY KEY (`documentID`), ADD KEY `fk_document_clients1_idx` (`clientID`);

--
-- Indexes for table `email`
--
ALTER TABLE `email`
 ADD PRIMARY KEY (`emailMessageID`);

--
-- Indexes for table `glossary`
--
ALTER TABLE `glossary`
 ADD PRIMARY KEY (`idglossary`);

--
-- Indexes for table `investment_intructions`
--
ALTER TABLE `investment_intructions`
 ADD PRIMARY KEY (`investmentIntructionID`), ADD KEY `fk_investment_intructions_applications1_idx` (`applicationID`);

--
-- Indexes for table `login_blacklist`
--
ALTER TABLE `login_blacklist`
 ADD PRIMARY KEY (`loginBlacklistID`), ADD KEY `fk_login_blacklist_users1_idx` (`users_userID`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`messageID`), ADD KEY `fk_messages_clients1_idx` (`clientID`);

--
-- Indexes for table `terms_definitions`
--
ALTER TABLE `terms_definitions`
 ADD PRIMARY KEY (`terms_definitionID`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
 ADD PRIMARY KEY (`transferID`), ADD KEY `fk_transfers_applications1_idx` (`applicationID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userID`), ADD KEY `fk_users_userGroup1_idx` (`groupID`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
 ADD PRIMARY KEY (`groupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_users`
--
ALTER TABLE `active_users`
MODIFY `active_users_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adviser_has_client`
--
ALTER TABLE `adviser_has_client`
MODIFY `adviserHasClientID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `applications`
--
ALTER TABLE `applications`
MODIFY `applicationID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `audit_logins`
--
ALTER TABLE `audit_logins`
MODIFY `auditLoginID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
MODIFY `permID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `auth_roles`
--
ALTER TABLE `auth_roles`
MODIFY `roleID` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contributions`
--
ALTER TABLE `contributions`
MODIFY `contributionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `docs_view_history`
--
ALTER TABLE `docs_view_history`
MODIFY `docsViewHistoryID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
MODIFY `documentID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email`
--
ALTER TABLE `email`
MODIFY `emailMessageID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `glossary`
--
ALTER TABLE `glossary`
MODIFY `idglossary` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `investment_intructions`
--
ALTER TABLE `investment_intructions`
MODIFY `investmentIntructionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login_blacklist`
--
ALTER TABLE `login_blacklist`
MODIFY `loginBlacklistID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
MODIFY `messageID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `terms_definitions`
--
ALTER TABLE `terms_definitions`
MODIFY `terms_definitionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
MODIFY `transferID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `userID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
MODIFY `groupID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
