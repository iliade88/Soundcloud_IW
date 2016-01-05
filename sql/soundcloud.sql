-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Gen 05, 2016 alle 15:57
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`OID`, `Name`) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'House'),
(4, 'Eletronica'),
(5, 'Prog Rock'),
(6, 'Punk'),
(7, 'New Wave'),
(8, 'Drum&Bass'),
(9, 'Classical'),
(10, 'World'),
(11, 'Hip Hop'),
(12, 'Heavy Metal'),
(13, 'Folk');

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
-- Struttura della tabella `group_track`
--

CREATE TABLE IF NOT EXISTS `group_track` (
  `OID_Group` int(11) NOT NULL,
  `OID_Track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Struttura della tabella `playlist_tracks`
--

CREATE TABLE IF NOT EXISTS `playlist_tracks` (
  `OID_Playlist` int(11) NOT NULL,
  `OID_Track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `timeline`
--

CREATE TABLE IF NOT EXISTS `timeline` (
`OID` int(11) NOT NULL,
  `Comentario` varchar(500) NOT NULL,
  `Time` time NOT NULL,
  `User` int(11) NOT NULL,
  `Track` int(11) NOT NULL
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
  `Trending` tinyint(1) NOT NULL,
  `Uploader` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dump dei dati per la tabella `track`
--

INSERT INTO `track` (`OID`, `Name`, `Artist`, `Image`, `Length`, `Uploaded`, `Listened`, `Top_Category`, `Description`, `N_Like`, `N_Plays`, `Trending`, `Uploader`) VALUES
(1, 'Season', 'Ross', '', 230, '2016-01-03', 1, 'Rock', 'Season a rock song by Ross.', 13344, 123425, 1, 0),
(2, 'Logic ft. Jhene', 'Louis Fouton', '', 313, '2015-12-11', 1, 'Eletronica', 'Eletronica song featuring Khene', 12, 1234, 0, 0),
(3, 'Valentino', 'Dj Snake & Aluna George', '', 123, '2014-12-11', 1, 'Pop', 'Dj snake remixes Alunageorge', 543, 54326, 0, 0),
(4, 'Lance ', 'Neptuner', '', 412, '2016-01-03', 1, 'Drum&Bass', 'Drum&bass by Neptune', 12445, 194838, 1, 0),
(5, 'Jaded', 'Disclosure', '', 235, '2015-09-22', 1, 'House', 'New release by Disclosure ', 4002, 100456, 1, 0),
(6, 'Close to You', 'Soy Sauce', '', 146, '2015-11-24', 1, 'Folk', 'Folk and country stile music', 13, 5232, 0, 0),
(7, 'Sleepy Tom', 'Fool''s Gold', '', 432, '2014-01-03', 1, 'Rock', 'A classic rock ballad', 234, 53642, 0, 0),
(8, 'Talking', 'Tove Lo', '', 412, '2016-01-03', 0, 'Pop', 'New Realese', 0, 0, 0, 0),
(9, 'Broken Record', 'Basstracks', '', 243, '2015-12-12', 1, 'Heavy Metal', 'Heavy Metal track from Basstracks', 645, 60598, 0, 0),
(10, 'Six Days', 'Dj Shadow', '', 342, '2013-01-06', 1, 'Hip Hop', 'Rapping with Dj Shadow', 2545, 123442, 1, 0),
(11, 'Richmond park', 'Cymbals Eat Guitars', '', 234, '2014-09-20', 1, 'Rock', 'Rock song by C.E.G.', 2342, 439821, 1, 0),
(12, 'Airglow Fires', 'Lone', '', 423, '2015-12-12', 1, 'Eletronica', 'Eletronica house by Lone', 23462, 3032341, 1, 0),
(13, 'Deon Costume', 'wARREN XCL', '', 521, '2016-01-07', 0, 'Eletronica', 'New and good.', 0, 0, 0, 0),
(14, 'Jump', 'Van Halen', '', 235, '2012-01-23', 1, 'Rock', 'Classic Rock song from the 80s.', 42542, 2352342, 0, 0),
(15, 'Dive Bomb', 'Optiv & BTK', '', 432, '2014-05-12', 1, 'Drum&Bass', '172bpm drumd and bass song.\r\n', 2134, 134012, 1, 0),
(16, 'Feel the noize', 'Mary j Blige', '', 234, '2012-12-15', 1, 'Hip Hop', 'Mary j Blige and RNB.', 523, 938372, 0, 0),
(17, 'Promesses', 'Kaytranada', '', 352, '2011-08-18', 1, 'Pop', 'Kaytranada 4 to floor.', 6342, 23456749, 0, 0),
(18, 'Grot', 'Sam Gellaitry', '', 180, '2009-11-12', 1, 'Pop', 'Sam about Grot', 1352, 25124, 0, 0),
(19, 'Meeker', 'Lone', '', 324, '2008-09-23', 1, 'Eletronica', 'House eletronica by Lone', 52345, 32984298, 1, 0),
(20, 'Company ', 'Lxury', '', 243, '2016-01-12', 0, 'Folk', 'Folk song by Lxury', 0, 0, 0, 0),
(21, 'Swahnts', 'TC', '', 2434, '2007-02-13', 1, 'Pop', 'Pop song from 2007.', 142, 12402, 0, 0),
(22, 'Money', 'Pink Floyd', '', 634, '2002-03-05', 1, 'Prog Rock', 'Classic prog rock from the Floyd', 42762, 2344821, 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`OID`, `User_Name`, `Password`, `Full_Name`, `Date_Of_Birth`, `Email`, `Location`, `Gender`, `N_Followers`, `N_Following`, `N_Tracks`, `Image`) VALUES
(1, 'AUCAN', 'Aucan1234', 'Marco Ferrè', '1990-01-12', 'aucan@gmail.com', 'Bergamo', 'male', 0, 0, 0, ''),
(2, 'Venetian Snares', 'venetian', 'Vincenzo Twin', '1985-12-24', 'vincennzo.t@gmail.com', 'Verana', 'male', 0, 0, 0, ''),
(3, 'Aphex Jauz', 'Aphex234', 'Alfonso Ziq', '1990-02-25', 'aphex.jauz@gmail.com', 'New York', 'male', 0, 0, 0, ''),
(4, 'Aria San', 'Aria1234', 'Arianna Santa', '1978-03-21', 'arianna.s@hotmail.com', 'Longuelo', 'female', 0, 0, 0, ''),
(5, 'Pomo', 'pomoricky', 'Riccardo Erikson', '1983-05-01', 'erik.rik@tiscali.it', 'Milano', 'male', 0, 0, 0, ''),
(6, 'Clap! Clap!', 'clapclap', 'Giovanni Belloni', '1989-09-23', 'belloni.g@gmail.com', 'Firenze', 'male', 0, 0, 0, ''),
(7, 'Diplo', 'diplo89', 'Igor Smith', '1989-02-16', 'diplo89@hotmail.com', 'San Francisco', 'male', 0, 0, 0, ''),
(8, 'Bjork', 'BjorkErika', 'Erika Schimdt', '1974-12-23', 'bjork.musik@roman.com', 'Oslo', 'female', 0, 0, 0, ''),
(9, 'Gellarty', 'Gell1995', 'Sam Gellaitry', '1995-12-11', 'Gell.sam@hotmail.com', 'Berlin', 'male', 0, 0, 0, ''),
(10, 'Gorgon City', 'gorogoncitymusic', 'George Welsh', '1986-12-15', 'welsh.george@musicmngmt.com', 'London', 'male', 0, 0, 0, ''),
(11, 'Faith Maker', 'freddy12', 'Fred Norm', '1983-11-11', 'faith.maker@gmail.com', 'Manchester', 'male', 0, 0, 0, ''),
(12, 'Hudson Mohawke', 'hudmo', 'John Hudgson', '1998-01-04', 'hudmo.production@mngmt.com', 'London', 'male', 0, 0, 0, ''),
(13, 'P.Morris', 'Morrissey', 'Morris Smith', '1964-08-18', 'MSmith@hotmail.com', 'London', 'male', 0, 0, 0, ''),
(14, 'Empire of the Sun', 'EMPofTSun', 'Sara Jinny', '1984-02-14', 'sara.jinny@gmail.com', 'Brighton', 'female', 0, 0, 0, ''),
(15, 'Broke One', 'reminiscens', 'Fabio Broccato', '1989-01-23', 'fabio.broccato@gmail.com', 'Milano', 'male', 0, 0, 0, ''),
(16, 'Ryan James Music', 'ryanjamesmusic', 'Ryan James Erikson', '1987-07-31', 'ryan.james@music.com', 'California', 'male', 0, 0, 0, ''),
(17, 'Zeds Dead', 'zeddy-d', 'Charlie Westbrom', '1983-06-07', 'charly83@hotmail.com', 'Boston', 'male', 0, 0, 0, ''),
(18, 'FedericaElmi', 'Fedeelmuz', 'Federica Elmi', '1990-05-09', 'fede.elmi@gmail.com', 'Roma', 'female', 0, 0, 0, ''),
(19, 'BRO SAFARI', 'safari90s', 'Christian Geody', '1990-03-14', 'geody.c@hotmail.com', 'Bristol', 'male', 0, 0, 0, ''),
(20, 'Dusky', 'duskycall', 'John Calling', '1978-10-14', 'calling.vip@gmail.com', 'Paris', 'male', 0, 0, 0, ''),
(21, 'Steve Aoki', 'AOKIDJ', 'Stepehn Ray Aoking', '1999-12-18', 'steve.aoki@bookings.com', 'Miami', 'male', 0, 0, 0, ''),
(22, 'The Weeknd', 'weeknd2015', 'Delia Smiths', '1990-12-30', 'theweeknd@hotmail.com', 'Boston', 'female', 0, 0, 0, ''),
(23, 'Yoko Ono', 'yokoono1949', 'Yoko Ono', '1949-11-23', 'yoko.ono@mngmt.com', 'New York', 'female', 0, 0, 0, ''),
(24, 'Tokimonsta', 'tokiwoki', 'Irina Ellington', '1990-10-23', 'tokibookings@mngmt.com', 'San Francisco', 'female', 0, 0, 0, '');

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
-- Indexes for table `group_track`
--
ALTER TABLE `group_track`
 ADD PRIMARY KEY (`OID_Group`,`OID_Track`);

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
-- Indexes for table `playlist_tracks`
--
ALTER TABLE `playlist_tracks`
 ADD PRIMARY KEY (`OID_Playlist`,`OID_Track`);

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
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
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
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
