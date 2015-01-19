-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2015 at 02:22 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `image`) VALUES
(1, 'Xboct', '/static/images/players/xboct.jpeg'),
(2, 'Dendi', '/static/images/players/dendi.jpeg'),
(3, 'Funn1k', '/static/images/players/funnik.jpeg'),
(4, 'Vanskor', '/static/images/players/vanskor.jpeg'),
(5, 'Goblak', '/static/images/players/goblak.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `image`, `content`) VALUES
(1, 'Natus Vincere', '/static/images/teams/navi.jpeg', 'Natus Vincere (Latin for "born to win"), often abbreviated as Na`Vi, is a Ukranian multigaming organization which was founded in 2009 as a Counter-Strike team after the collapse of the team KerchNET.\r\n\r\nIts DotA section was created in October 2010 with the pickup of Goblak, XBOCT, Mag~, Deff-, and Axypa. After Mag~ and Deff- left the team they instead acquired Danylo "Dendi" Ishutin and Ivan "Artstyle" Antonov. The team was later invited to the first version of The International 2011, eventually winning it after defeating the Chinese team EHOME 3-1 in the finals.');

-- --------------------------------------------------------

--
-- Table structure for table `teams_players`
--

CREATE TABLE IF NOT EXISTS `teams_players` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  KEY `tid` (`tid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams_players`
--

INSERT INTO `teams_players` (`tid`, `pid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
