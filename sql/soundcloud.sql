-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dic 26, 2015 alle 18:20
-- Versione del server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `soundcloud`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE IF NOT EXISTS `category` (
`OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `group`
--

CREATE TABLE IF NOT EXISTS `group` (
`OID` int(11) NOT NULL,
  `Group_Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `module`
--

CREATE TABLE IF NOT EXISTS `module` (
`OID` int(11) NOT NULL,
  `Module_ID` varchar(250) NOT NULL,
  `Module_Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `playlist`
--

CREATE TABLE IF NOT EXISTS `playlist` (
`OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `N_Followers` int(11) NOT NULL,
  `Image` blob NOT NULL,
  `N_Tracks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
`OID` int(11) NOT NULL,
  `Comentario` varchar(500) NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `tipo_user`
--

CREATE TABLE IF NOT EXISTS `tipo_user` (
`OID` int(11) NOT NULL,
  `Tipo` varchar(250) NOT NULL,
  `Description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `track`
--

CREATE TABLE IF NOT EXISTS `track` (
`OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Artist` varchar(250) NOT NULL,
  `Image` blob NOT NULL,
  `Length` int(11) NOT NULL,
  `Uploaded` date NOT NULL,
  `Listened` tinyint(1) NOT NULL,
  `Top_Category` varchar(250) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `N_Like` int(11) NOT NULL,
  `N_Plays` int(11) NOT NULL,
  `Trending` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`OID` int(11) NOT NULL,
  `User_Name` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Full_Name` varchar(250) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Location` varchar(250) NOT NULL,
  `Gender` varchar(50) NOT NULL,
  `N_Followers` int(11) NOT NULL,
  `N_Following` int(11) NOT NULL,
  `N_Tracks` int(11) NOT NULL,
  `Image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struttura della tabella `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
`OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`,`Group_Name`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`,`Module_ID`,`Module_Name`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`,`Name`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`);

--
-- Indexes for table `tipo_user`
--
ALTER TABLE `tipo_user`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`,`Artist`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`,`User_Name`,`Email`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
 ADD PRIMARY KEY (`OID`), ADD UNIQUE KEY `OID` (`OID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timeline`
--
ALTER TABLE `timeline`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tipo_user`
--
ALTER TABLE `tipo_user`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
