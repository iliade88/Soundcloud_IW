-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2016 a las 11:15:55
-- Versión del servidor: 10.1.8-MariaDB
-- Versión de PHP: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `soundcloud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `category`
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
-- Estructura de tabla para la tabla `group`
--

CREATE TABLE `group` (
  `OID` int(11) NOT NULL,
  `Group_Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group`
--

INSERT INTO `group` (`OID`, `Group_Name`) VALUES
(1, 'Pop fan club'),
(2, 'Rock fan club'),
(3, 'Metal fan club');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_track`
--

CREATE TABLE `group_track` (
  `OID_Group` int(11) NOT NULL,
  `OID_Track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group_track`
--

INSERT INTO `group_track` (`OID_Group`, `OID_Track`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

CREATE TABLE `module` (
  `OID` int(11) NOT NULL,
  `Module_ID` varchar(250) NOT NULL,
  `Module_Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `N_Followers` int(11) NOT NULL,
  `Image` varchar(300) NOT NULL,
  `N_Tracks` int(11) NOT NULL,
  `Author` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `playlist`
--

INSERT INTO `playlist` (`OID`, `Name`, `N_Followers`, `Image`, `N_Tracks`, `Author`) VALUES
(1, 'Pop songs', 0, '', 0, ''),
(2, 'Sogns relax', 0, '', 0, ''),
(3, 'Rock', 0, '', 0, 'AAA'),
(4, 'Metal', 124, '', 0, 'AAA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist_tracks`
--

CREATE TABLE `playlist_tracks` (
  `OID_Playlist` int(11) NOT NULL,
  `OID_Track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `playlist_tracks`
--

INSERT INTO `playlist_tracks` (`OID_Playlist`, `OID_Track`) VALUES
(1, 3),
(1, 8),
(1, 17),
(1, 18),
(1, 21),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `timeline`
--

CREATE TABLE `timeline` (
  `OID` int(11) NOT NULL,
  `Comentario` varchar(500) NOT NULL,
  `Time` time NOT NULL,
  `User` int(11) NOT NULL,
  `Track` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_user`
--

CREATE TABLE `tipo_user` (
  `OID` int(11) NOT NULL,
  `Tipo` varchar(250) NOT NULL,
  `Description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `track`
--

CREATE TABLE `track` (
  `OID` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `Artist` varchar(250) NOT NULL,
  `Image` varchar(300) NOT NULL,
  `Length` int(11) NOT NULL,
  `Uploaded` date NOT NULL,
  `Listened` tinyint(1) NOT NULL,
  `Top_Category` varchar(250) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `N_Like` int(11) NOT NULL,
  `N_Plays` int(11) NOT NULL,
  `Trending` tinyint(1) NOT NULL,
  `Uploader` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `track`
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
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
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
  `Image` varchar(300) NOT NULL,
  `Admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`OID`, `User_Name`, `Password`, `Full_Name`, `Date_Of_Birth`, `Email`, `Location`, `Gender`, `N_Followers`, `N_Following`, `N_Tracks`, `Image`, `Admin`) VALUES
(1, 'AUCAN', '$2a$10$lesFWL6h1NUSSHOP16UGd.4jdwpN.tnC55lZnDravCIJFr31F7ct.', 'Marco Ferrè', '1990-01-12', 'aucan@gmail.com', 'Bergamo', 'male', 0, 0, 0, '', 0),
(2, 'Venetian Snares', '$2a$10$uLQqqScy9tKOnfHR7yiP6.I019tefar/LDvw6jRagdRzbCZKo6st2', 'Vincenzo Twin', '1985-12-24', 'vincennzo.t@gmail.com', 'Verana', 'male', 0, 0, 0, '', 0),
(3, 'Aphex Jauz', '$2a$10$gYM2mOmnNN1U/nD808lLKeOAkXV3TCFkL6iF5.bpU3yazeKmHTMPG', 'Alfonso Ziq', '1990-02-25', 'aphex.jauz@gmail.com', 'New York', 'male', 0, 0, 0, '', 0),
(4, 'Aria San', '$2a$10$rQDXwToHwNLH1cdi4LmRJep2RIDJUf72Kz0TJszSuNICY7qSQP2BG', 'Arianna Santa', '1978-03-21', 'arianna.s@hotmail.com', 'Longuelo', 'female', 0, 0, 0, '', 0),
(5, 'Pomo', '$2a$10$E3qdnEuFHHiYDr/TZ6cje.x.bCH6U7dbKNsSTtp/mP17uO.pBf5K6', 'Riccardo Erikson', '1983-05-01', 'erik.rik@tiscali.it', 'Milano', 'male', 0, 0, 0, '', 0),
(6, 'Clap! Clap!', '$2a$10$CeTTF5K1SNUlNhEr1PkxZurkappgxb9vUDdGZvfO2KbxFKY6L7m1K', 'Giovanni Belloni', '1989-09-23', 'belloni.g@gmail.com', 'Firenze', 'male', 0, 0, 0, '', 0),
(7, 'Diplo', '$2a$10$Evx1gcnBrc9lshyr9Kyoj.feFVziN/dOsgr2FZ27had393.A8448.', 'Igor Smith', '1989-02-16', 'diplo89@hotmail.com', 'San Francisco', 'male', 0, 0, 0, '', 0),
(8, 'Bjork', '$2a$10$.1EknK2VxfyimHwfJjdhPenmqRDyxbaeACt6GEdkAuF3NGCt/ASBy', 'Erika Schimdt', '1974-12-23', 'bjork.musik@roman.com', 'Oslo', 'female', 0, 0, 0, '', 0),
(9, 'Gellarty', '$2a$10$y4rboyhyamPkLEWo/GoL8.H1LLVVL46YyEDKK/sh7MBnwQVu0wt8O', 'Sam Gellaitry', '1995-12-11', 'Gell.sam@hotmail.com', 'Berlin', 'male', 0, 0, 0, '', 0),
(10, 'Gorgon City', '$2a$10$43jtBZBeYLXndf8Lc8RDSeUctCrt8IOT8YTYz.2acPvycYf9x1w3.', 'George Welsh', '1986-12-15', 'welsh.george@musicmngmt.com', 'London', 'male', 0, 0, 0, '', 0),
(11, 'Faith Maker', '$2a$10$yvm8H9/xRwqIHKwXGOTjDO5UWrZR8xVcsx5V5QZGLLrBUkTWYeDl.', 'Fred Norm', '1983-11-11', 'faith.maker@gmail.com', 'Manchester', 'male', 0, 0, 0, '', 0),
(12, 'Hudson Mohawke', '$2a$10$4dnz9EOESpvF/0e6DPda/uP9fLM.pjXcPd1OSl1AIlX4z3jigTiW2', 'John Hudgson', '1998-01-04', 'hudmo.production@mngmt.com', 'London', 'male', 0, 0, 0, '', 0),
(13, 'P.Morris', '$2a$10$DY81WGqWA6.gxA1gu5wbfOB/qTAeFoXh4o.mH6d.YIQoLImlh/3im', 'Morris Smith', '1964-08-18', 'MSmith@hotmail.com', 'London', 'male', 0, 0, 0, '', 0),
(14, 'Empire of the Sun', '$2a$10$NAR00/qcjKv8dypJ.5pq9Or8ywBfrydrD60Jz4L5KfZ.y2Ai7E9ge', 'Sara Jinny', '1984-02-14', 'sara.jinny@gmail.com', 'Brighton', 'female', 0, 0, 0, '', 0),
(15, 'Broke One', '$2a$10$QwNaJIb7EX4YtNzv08kKL.5rkK.Vij8.i3ga7IqM6aPGp380TM7wG', 'Fabio Broccato', '1989-01-23', 'fabio.broccato@gmail.com', 'Milano', 'male', 0, 0, 0, '', 0),
(16, 'Ryan James Music', '$2a$10$.6kAQKngHuR5A4Q9w1IfH.foZ9Ol1LIu90MYU8h6tiUTmas/2o97O', 'Ryan James Erikson', '1987-07-31', 'ryan.james@music.com', 'California', 'male', 0, 0, 0, '', 0),
(17, 'Zeds Dead', '$2a$10$gSvZGVTgly1VVrhAYhjEEOkavuGflzLvuNqyufFWaid0jzn5RCt0e', 'Charlie Westbrom', '1983-06-07', 'charly83@hotmail.com', 'Boston', 'male', 0, 0, 0, '', 0),
(18, 'FedericaElmi', '$2a$10$UaDjyZAyJUZsW2NLuz.o3.w.B6rULjlC7Y.8oZQNDRGt6x9HKV37C', 'Federica Elmi', '1990-05-09', 'fede.elmi@gmail.com', 'Roma', 'female', 0, 0, 0, '', 0),
(19, 'BRO SAFARI', '$2a$10$kfd1oIVpMhAShBIzBoiVh.Uh/.5Dt21BSZvmlNRYqZ.w2ecEKDa9K', 'Christian Geody', '1990-03-14', 'geody.c@hotmail.com', 'Bristol', 'male', 0, 0, 0, '', 0),
(20, 'Dusky', '$2a$10$L5umJMdYa5rZJxAvnSiqx.WZHqolbIs6wfZZl07.nKyxvk0QGWyAq', 'John Calling', '1978-10-14', 'calling.vip@gmail.com', 'Paris', 'male', 0, 0, 0, '', 0),
(21, 'Steve Aoki', '$2a$10$IWGmNIilwaT/sf0.hw2ekuqpaeItNXJNDRx/LOzO/Tv5oxmN9PPnK', 'Stepehn Ray Aoking', '1999-12-18', 'steve.aoki@bookings.com', 'Miami', 'male', 0, 0, 0, '', 0),
(22, 'The Weeknd', '$2a$10$d2kKPpBwk303g.a.8St4EOWHtFdbHZSsQyVjo5CVjsFFEuyEInU6C', 'Delia Smiths', '1990-12-30', 'theweeknd@hotmail.com', 'Boston', 'female', 0, 0, 0, '', 0),
(23, 'Yoko Ono', '$2a$10$gvftFpEKznfNuo2m37Mjnuefs7XWZYhpohK7I4Bpa8bwSBKS6eMzK', 'Yoko Ono', '1949-11-23', 'yoko.ono@mngmt.com', 'New York', 'female', 0, 0, 0, '', 0),
(24, 'Tokimonsta', '$2a$10$RR5XBR34aDzDHEKqUYJhfedTxaPhxMlvFfXpTzWHoVG1us0vqY4hC', 'Irina Ellington', '1990-10-23', 'tokibookings@mngmt.com', 'San Francisco', 'female', 0, 0, 0, '', 0),
(25, 'AAA', '$2a$10$TgYv./wkmDvr0oY6dw4Mse9wuC8SCtj5WKv2.qA2zNWNifffbp5X6', 'Prova', '1999-01-01', 'prova@gmail.com', 'Alicante', 'male', 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_group`
--

CREATE TABLE `user_group` (
  `OID_Group` int(11) NOT NULL,
  `Name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_group`
--

INSERT INTO `user_group` (`OID_Group`, `Name`) VALUES
(2, 'AAA'),
(3, 'AAA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`);

--
-- Indices de la tabla `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`,`Group_Name`);

--
-- Indices de la tabla `group_track`
--
ALTER TABLE `group_track`
  ADD PRIMARY KEY (`OID_Group`,`OID_Track`);

--
-- Indices de la tabla `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`,`Module_ID`,`Module_Name`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`,`Name`);

--
-- Indices de la tabla `playlist_tracks`
--
ALTER TABLE `playlist_tracks`
  ADD PRIMARY KEY (`OID_Playlist`,`OID_Track`);

--
-- Indices de la tabla `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`);

--
-- Indices de la tabla `tipo_user`
--
ALTER TABLE `tipo_user`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`);

--
-- Indices de la tabla `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`,`Artist`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`OID`),
  ADD UNIQUE KEY `OID` (`OID`,`User_Name`,`Email`);

--
-- Indices de la tabla `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`Name`,`OID_Group`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `group`
--
ALTER TABLE `group`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `module`
--
ALTER TABLE `module`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `timeline`
--
ALTER TABLE `timeline`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_user`
--
ALTER TABLE `tipo_user`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `track`
--
ALTER TABLE `track`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `OID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
