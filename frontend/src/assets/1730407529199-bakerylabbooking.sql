-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 31, 2024 at 10:24 AM
-- Server version: 8.0.35
-- PHP Version: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakerylabbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `approval`
--

CREATE TABLE `approval` (
  `booking_id` int NOT NULL,
  `approval_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `cancel_reason` text,
  `approval_status` enum('0','1','2','3','8','9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `bakery_equipment`
--

CREATE TABLE `bakery_equipment` (
  `equipment_id` int NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `equipment_status` enum('operational','broken') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `usage_date` date NOT NULL,
  `booking_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `priority_status` enum('high','low') NOT NULL,
  `request_pdf` varchar(255) NOT NULL,
  `referent_number` varchar(100) DEFAULT NULL,
  `usage_reason` text NOT NULL,
  `use_category` enum('การแข่งขัน','การทดลอง') NOT NULL,
  `clean_status` enum('สะอาด','ไม่สะอาด') DEFAULT NULL,
  `usage_time_start` time NOT NULL,
  `usage_time_end` time NOT NULL,
  `booking_status` enum('ถูกยกเลิก','รออนุมัติ','อนุมัติ') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `booking_id` int NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `KU_email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` enum('ผู้จอง','สมาชิก') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `competition_history`
--

CREATE TABLE `competition_history` (
  `student_id` varchar(15) NOT NULL,
  `competition_name` varchar(255) NOT NULL,
  `certificate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `KU_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','student','professor') NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `profile_image` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`KU_email`, `password`, `role`, `status`, `profile_image`, `first_name`, `last_name`) VALUES
('admin@ku.th', '$2b$10$ujgbaBKN.q14KaoO28MS3uKwR6psELz6yuRe.cyJPuMt1Z0S3ZqIq', 'admin', 'enabled', NULL, 'admin', 'admin'),
('panisara.poo@ku.th', '$2b$10$WS4sXJ36dGZ01sqAU3U9wuzgYOGbwQ3UOmkv1ktE1vPrHn7E71upu', 'professor', 'enabled', NULL, 'panisara', 'poo'),
('phatawan.su@ku.th', '$2b$10$oGhG6Ll7GPq7O1ikyhMSaODJg1p6a0ubwqypLSoGXXcaBda6Jcp36', 'student', 'enabled', NULL, 'phaptawan', 'sukhum'),
('ww', '$2b$10$s/qmVB1uOVOXA3s5MTla/eLLYvj7dah9Qx.qGBQtw6u.y3WnOH7W2', 'student', 'enabled', NULL, 'aa', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `professor_id` int NOT NULL,
  `KU_email` varchar(255) NOT NULL,
  `department` enum('เทคโนโลยีอุตสาหกรรมเกษตร','เทคโนโลยีชีวภาพ','วิทยาศาสตร์และเทคโนโลยีการอาหาร','เทคโนโลยีการบรรจุและวัสดุ','พัฒนาผลิตภัณฑ์','วิทยาการสิ่งทอ') NOT NULL,
  `position` enum('หัวหน้าภาควิชา','หัวหน้าห้องเบเกอรี่') NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `KU_email`, `department`, `position`, `phone_number`) VALUES
(13, 'panisara.poo@ku.th', 'เทคโนโลยีอุตสาหกรรมเกษตร', 'หัวหน้าภาควิชา', '0889013634');

-- --------------------------------------------------------

--
-- Table structure for table `room_availability`
--

CREATE TABLE `room_availability` (
  `time` time NOT NULL,
  `date` date NOT NULL,
  `booking_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(15) NOT NULL,
  `KU_email` varchar(255) NOT NULL,
  `department` enum('เทคโนโลยีอุตสาหกรรมเกษตร','เทคโนโลยีชีวภาพ','วิทยาศาสตร์และเทคโนโลยีการอาหาร','เทคโนโลยีการบรรจุและวัสดุ','พัฒนาผลิตภัณฑ์','วิทยาการสิ่งทอ') NOT NULL,
  `blacklist_status` enum('blacklisted','nonblacklisted') NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `KU_email`, `department`, `blacklist_status`, `phone_number`) VALUES
('65', 'ww', 'เทคโนโลยีชีวภาพ', 'nonblacklisted', 'ww'),
('6510405733', 'phatawan.su@ku.th', 'เทคโนโลยีอุตสาหกรรมเกษตร', 'nonblacklisted', '0889013634');

-- --------------------------------------------------------

--
-- Table structure for table `used_equipment`
--

CREATE TABLE `used_equipment` (
  `booking_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `post_usage_status` enum('operational','broken') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approval`
--
ALTER TABLE `approval`
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `bakery_equipment`
--
ALTER TABLE `bakery_equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `booking_list`
--
ALTER TABLE `booking_list`
  ADD PRIMARY KEY (`booking_id`,`student_id`);

--
-- Indexes for table `competition_history`
--
ALTER TABLE `competition_history`
  ADD PRIMARY KEY (`student_id`,`competition_name`,`certificate`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`KU_email`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`),
  ADD KEY `KU_email` (`KU_email`);

--
-- Indexes for table `room_availability`
--
ALTER TABLE `room_availability`
  ADD PRIMARY KEY (`time`,`date`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `KU_email` (`KU_email`);

--
-- Indexes for table `used_equipment`
--
ALTER TABLE `used_equipment`
  ADD PRIMARY KEY (`booking_id`,`equipment_id`),
  ADD KEY `equipment_id` (`equipment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bakery_equipment`
--
ALTER TABLE `bakery_equipment`
  MODIFY `equipment_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `professor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approval`
--
ALTER TABLE `approval`
  ADD CONSTRAINT `approval_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `competition_history`
--
ALTER TABLE `competition_history`
  ADD CONSTRAINT `competition_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE;

--
-- Constraints for table `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`KU_email`) REFERENCES `person` (`KU_email`) ON DELETE CASCADE;

--
-- Constraints for table `room_availability`
--
ALTER TABLE `room_availability`
  ADD CONSTRAINT `room_availability_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE SET NULL;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`KU_email`) REFERENCES `person` (`KU_email`) ON DELETE CASCADE;

--
-- Constraints for table `used_equipment`
--
ALTER TABLE `used_equipment`
  ADD CONSTRAINT `used_equipment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `used_equipment_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `bakery_equipment` (`equipment_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
