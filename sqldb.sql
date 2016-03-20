-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2013 at 04:59 PM
-- Server version: 5.1.50
-- PHP Version: 5.3.9-ZS5.6.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `pid` int(11) NOT NULL,
  `ctid` int(11) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`pid`,`ctid`),
  KEY `ctid` (`ctid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`pid`, `ctid`, `value`) VALUES
(1, 1, 'jbloggs@web.com'),
(1, 2, '+1 800 121 2222'),
(2, 1, 'pmiller@pms.co.uk'),
(2, 2, '+44 7777 123 657'),
(2, 3, '10 Wee Lane\r\nNewtown\r\nAX10 5BG\r\nUK'),
(3, 1, 'jpalmer@web.com'),
(3, 2, '+1 800 121 2255'),
(4, 1, 'ejames@facebook.com'),
(4, 2, '+49 89 3324 44-0'),
(5, 1, 'rwalker@web.com'),
(5, 2, '+1 800 121 2200'),
(5, 3, 'Web.com\r\n425 Rodeo Av\r\nSan Francisco CA, 94437'),
(6, 1, 'sbaker@web.com'),
(6, 2, '+1 800 121 2201');

-- --------------------------------------------------------

--
-- Table structure for table `contacttype`
--

CREATE TABLE IF NOT EXISTS `contacttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `contacttype`
--

INSERT INTO `contacttype` (`id`, `label`) VALUES
(1, 'Email'),
(2, 'Phone'),
(3, 'Address'),
(4, 'IM');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `managerid` int(11) DEFAULT NULL,
  `notes` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `firstname`, `lastname`, `dob`, `managerid`, `notes`, `created`) VALUES
(1, 'Joe', 'Bloggs', '1975-02-07', 5, NULL, '2013-02-07 08:29:31'),
(2, 'Paul', 'Miller', '1980-08-20', 4, NULL, '2013-02-07 09:30:10'),
(3, 'Jenny', 'Palmer', '1990-04-29', 5, NULL, '2013-02-07 09:30:10'),
(4, 'Jenny', 'James', '1970-11-03', 5, NULL, '2013-02-07 09:31:07'),
(5, 'Rick', 'Walker', '1960-10-10', NULL, 'Rick Walker is the CEO of web.com.', '2013-02-07 09:31:57'),
(6, 'Susan', 'Baker', NULL, 5, 'Rick Walker''s assistant, no project involvement', '2013-02-19 12:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `label`, `budget`) VALUES
(1, 'Website', 2000),
(2, 'Facebook App', 999.95),
(3, 'Google+', 250);

-- --------------------------------------------------------

--
-- Table structure for table `projectperson`
--

CREATE TABLE IF NOT EXISTS `projectperson` (
  `prid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`prid`,`pid`,`rid`),
  KEY `pid` (`pid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectperson`
--

INSERT INTO `projectperson` (`prid`, `pid`, `rid`) VALUES
(1, 1, 3),
(2, 2, 3),
(2, 2, 4),
(1, 3, 4),
(2, 4, 2),
(2, 4, 4),
(1, 5, 1),
(1, 5, 2),
(2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `label`) VALUES
(1, 'Product Manager'),
(2, 'Project Manager'),
(3, 'Developer'),
(4, 'Tester');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`ctid`) REFERENCES `contacttype` (`id`);

--
-- Constraints for table `projectperson`
--
ALTER TABLE `projectperson`
  ADD CONSTRAINT `projectperson_ibfk_1` FOREIGN KEY (`prid`) REFERENCES `project` (`id`),
  ADD CONSTRAINT `projectperson_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `projectperson_ibfk_3` FOREIGN KEY (`rid`) REFERENCES `role` (`id`);
