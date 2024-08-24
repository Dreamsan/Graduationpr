-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2024 at 04:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aloneinthedarkness`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_level` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gamesettings`
--

CREATE TABLE `gamesettings` (
  `settings_id` int(50) NOT NULL,
  `difficulty_level` int(10) NOT NULL,
  `sound_options` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hint`
--

CREATE TABLE `hint` (
  `hint_id` int(50) NOT NULL,
  `hint_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(50) NOT NULL,
  `item_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(50) NOT NULL,
  `level_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levelprogress`
--

CREATE TABLE `levelprogress` (
  `progress_id` int(50) NOT NULL,
  `player_id` int(50) NOT NULL,
  `level_id` int(50) NOT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(50) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `total_score` time(6) NOT NULL,
  `current_level` int(5) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_name`, `total_score`, `current_level`, `last_login`, `email`, `password`) VALUES
(1, 'testuser', '00:00:00.000000', 1, '0000-00-00 00:00:00.000000', 'testuser@test.com', 123456),
(2, 'testuser1', '00:00:00.000000', 1, '0000-00-00 00:00:00.000000', 'testuse1r@test.com', 1234561),
(3, 'testuser3', '00:00:00.000000', 1, '0000-00-00 00:00:00.000000', 'testuser3@email.com', 1234561),
(4, 'seif', '00:00:00.000000', 0, '0000-00-00 00:00:00.000000', '123@gmail.com', 123);

-- --------------------------------------------------------

--
-- Table structure for table `playerinventory`
--

CREATE TABLE `playerinventory` (
  `Inventory_id` int(50) NOT NULL,
  `player_id` int(50) NOT NULL,
  `item_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(50) NOT NULL,
  `room_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roomconnection`
--

CREATE TABLE `roomconnection` (
  `connection_id` int(50) NOT NULL,
  `room_id_1` int(10) NOT NULL,
  `room_id_2` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `timer`
--

CREATE TABLE `timer` (
  `timer_id` int(50) NOT NULL,
  `start_time` int(3) NOT NULL,
  `end_time` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `gamesettings`
--
ALTER TABLE `gamesettings`
  ADD PRIMARY KEY (`settings_id`);

--
-- Indexes for table `hint`
--
ALTER TABLE `hint`
  ADD PRIMARY KEY (`hint_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `levelprogress`
--
ALTER TABLE `levelprogress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `playerinventory`
--
ALTER TABLE `playerinventory`
  ADD PRIMARY KEY (`Inventory_id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `roomconnection`
--
ALTER TABLE `roomconnection`
  ADD PRIMARY KEY (`connection_id`),
  ADD KEY `room_id_1` (`room_id_1`),
  ADD KEY `room_id_2` (`room_id_2`);

--
-- Indexes for table `timer`
--
ALTER TABLE `timer`
  ADD PRIMARY KEY (`timer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gamesettings`
--
ALTER TABLE `gamesettings`
  MODIFY `settings_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hint`
--
ALTER TABLE `hint`
  MODIFY `hint_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `levelprogress`
--
ALTER TABLE `levelprogress`
  MODIFY `progress_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `player_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `playerinventory`
--
ALTER TABLE `playerinventory`
  MODIFY `Inventory_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roomconnection`
--
ALTER TABLE `roomconnection`
  MODIFY `connection_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timer`
--
ALTER TABLE `timer`
  MODIFY `timer_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `levelprogress`
--
ALTER TABLE `levelprogress`
  ADD CONSTRAINT `levelprogress_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `levelprogress_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `playerinventory`
--
ALTER TABLE `playerinventory`
  ADD CONSTRAINT `playerinventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `playerinventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roomconnection`
--
ALTER TABLE `roomconnection`
  ADD CONSTRAINT `roomconnection_ibfk_1` FOREIGN KEY (`room_id_1`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `roomconnection_ibfk_2` FOREIGN KEY (`room_id_2`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
