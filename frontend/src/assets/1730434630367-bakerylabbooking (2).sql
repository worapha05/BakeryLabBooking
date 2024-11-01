-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2024 at 03:12 AM
-- Server version: 5.7.24
-- PHP Version: 8.3.1

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
  `booking_id` int(11) NOT NULL,
  `approval_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `cancel_reason` text,
  `approval_status` enum('0','1','2','3','8','9') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `approval`
--

INSERT INTO `approval` (`booking_id`, `approval_datetime`, `cancel_reason`, `approval_status`) VALUES
(27, '2024-11-01 08:48:13', NULL, '0'),
(32, '2024-11-01 08:49:07', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `bakery_equipment`
--

CREATE TABLE `bakery_equipment` (
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `equipment_status` enum('operational','broken') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `bakery_equipment`
--

INSERT INTO `bakery_equipment` (`equipment_id`, `equipment_name`, `equipment_status`) VALUES
(1, 'เครื่องนวดแป้ง', 'operational'),
(2, 'ไม้ตีแป้ง', 'operational'),
(19, 'เตาอบ', 'operational'),
(20, 'เครื่องนวด', 'operational'),
(21, 'นนน', 'operational'),
(22, 'น้ำ', 'operational'),
(23, 'ถาด', 'operational');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
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

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `usage_date`, `booking_datetime`, `priority_status`, `request_pdf`, `referent_number`, `usage_reason`, `use_category`, `clean_status`, `usage_time_start`, `usage_time_end`, `booking_status`) VALUES
(18, '2024-11-07', '2024-11-01 04:04:33', 'low', '1730408673707-images.jpg', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:13', 'รออนุมัติ'),
(19, '2024-11-14', '2024-11-01 04:10:44', 'low', '1730409044664-Piglet.webp', NULL, 'aaaa', 'การแข่งขัน', NULL, '00:00:11', '00:00:12', 'รออนุมัติ'),
(20, '2024-11-15', '2024-11-01 04:14:07', 'low', '1730409247826-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:12', 'รออนุมัติ'),
(21, '2024-11-15', '2024-11-01 04:18:43', 'low', '1730409523175-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:12', 'รออนุมัติ'),
(22, '2024-11-15', '2024-11-01 04:22:18', 'low', '1730409738056-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:12', 'รออนุมัติ'),
(23, '2024-11-15', '2024-11-01 04:23:00', 'low', '1730409780247-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:12', 'รออนุมัติ'),
(24, '2024-10-31', '2024-11-01 04:27:19', 'low', '1730410039792-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:11', '00:00:11', 'รออนุมัติ'),
(25, '2024-10-31', '2024-11-01 04:30:12', 'low', '1730410212009-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:11', 'รออนุมัติ'),
(26, '2024-10-31', '2024-11-01 04:30:57', 'low', '1730410257237-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:11', 'รออนุมัติ'),
(27, '2024-11-07', '2024-11-01 04:31:59', 'low', '1730410318991-Piglet.webp', NULL, 'aaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:11', 'รออนุมัติ'),
(28, '2024-10-31', '2024-11-01 08:37:03', 'low', '1730425023346-Piglet.webp', NULL, 'aaaa', 'การแข่งขัน', NULL, '00:00:10', '00:00:13', 'รออนุมัติ'),
(29, '2024-11-15', '2024-11-01 08:38:05', 'low', '1730425085798-Piglet.webp', NULL, 'aa', 'การแข่งขัน', NULL, '00:00:11', '00:00:15', 'รออนุมัติ'),
(30, '2024-11-15', '2024-11-01 08:40:57', 'low', '1730425257285-Piglet.webp', NULL, 'aa', 'การแข่งขัน', NULL, '00:00:11', '00:00:15', 'รออนุมัติ'),
(31, '2024-11-13', '2024-11-01 08:45:30', 'low', '1730425530912-Piglet.webp', NULL, 'aaaa', 'การแข่งขัน', NULL, '00:00:11', '00:00:13', 'รออนุมัติ'),
(32, '2024-11-14', '2024-11-01 08:49:05', 'low', '1730425745827-Piglet.webp', NULL, 'ใช้ทำงาน', 'การแข่งขัน', NULL, '00:00:12', '00:00:13', 'รออนุมัติ');

-- --------------------------------------------------------

--
-- Table structure for table `booking_list`
--

CREATE TABLE `booking_list` (
  `booking_id` int(11) NOT NULL,
  `student_id` varchar(15) NOT NULL,
  `KU_email` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` enum('ผู้จอง','สมาชิก') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking_list`
--

INSERT INTO `booking_list` (`booking_id`, `student_id`, `KU_email`, `first_name`, `last_name`, `position`) VALUES
(18, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(19, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(19, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(20, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(20, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(21, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(21, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(22, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(22, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(23, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(23, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(24, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(24, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(25, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(26, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(27, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(27, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(28, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(28, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(29, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(29, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(30, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(30, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(31, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(31, 'aa', 'aa', 'aa', 'aa', 'สมาชิก'),
(32, '6510405733', 'phatawan.su@ku.th', 'phaptawan', 'sukhum', 'ผู้จอง'),
(32, 'ฟฟ', 'ฟฟ', 'ฟฟ', 'ฟฟ', 'สมาชิก');

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
('admin@ku.th', '$2b$10$DZB9ZBh5q1kPNjg.uro6eePgxkSYgryDJc9CKDBKmNVXGQl7jQgau', 'admin', 'enabled', 'default-user.png', 'admin', 'admin'),
('panisara.poo@ku.th', '$2b$10$WS4sXJ36dGZ01sqAU3U9wuzgYOGbwQ3UOmkv1ktE1vPrHn7E71upu', 'professor', 'enabled', '1730422504739-Piglet.webp', 'panisara', 'poo'),
('phatawan.su@ku.th', '$2b$10$oGhG6Ll7GPq7O1ikyhMSaODJg1p6a0ubwqypLSoGXXcaBda6Jcp36', 'student', 'enabled', '1730422453253-Piglet.webp', 'phaptawan', 'sukhum'),
('worapha', '$2b$10$v4jIJrwOZUr.WHOYt8yUVuxhqU4lFFREYnpftTIH6thTNG5kqlpuW', 'professor', 'enabled', '1730424326919-Piglet.webp', 'ww', 'ww'),
('worapha.c@ku.th', '$2b$10$cwgoM4itl4W5TsDRuAX1SuqSsZV5HvBcprDaKWV1WH15bb6jhObtO', 'professor', 'enabled', '1730424269479-Piglet.webp', 'worapha', 'charnklang'),
('ww', '$2b$10$s/qmVB1uOVOXA3s5MTla/eLLYvj7dah9Qx.qGBQtw6u.y3WnOH7W2', 'student', 'enabled', 'default-user.png', 'aa', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `professor_id` int(11) NOT NULL,
  `KU_email` varchar(255) NOT NULL,
  `department` enum('เทคโนโลยีอุตสาหกรรมเกษตร','เทคโนโลยีชีวภาพ','วิทยาศาสตร์และเทคโนโลยีการอาหาร','เทคโนโลยีการบรรจุและวัสดุ','พัฒนาผลิตภัณฑ์','วิทยาการสิ่งทอ') NOT NULL,
  `position` enum('หัวหน้าภาควิชา','หัวหน้าห้องเบเกอรี่') NOT NULL,
  `phone_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`professor_id`, `KU_email`, `department`, `position`, `phone_number`) VALUES
(13, 'panisara.poo@ku.th', 'เทคโนโลยีอุตสาหกรรมเกษตร', 'หัวหน้าภาควิชา', '08890136349'),
(14, 'worapha.c@ku.th', 'วิทยาศาสตร์และเทคโนโลยีการอาหาร', 'หัวหน้าห้องเบเกอรี่', '0889013634'),
(15, 'worapha', 'เทคโนโลยีชีวภาพ', 'หัวหน้าภาควิชา', '088');

-- --------------------------------------------------------

--
-- Table structure for table `room_availability`
--

CREATE TABLE `room_availability` (
  `time` time NOT NULL,
  `date` date NOT NULL,
  `booking_id` int(11) DEFAULT NULL
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
  `booking_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(255) NOT NULL,
  `post_usage_status` enum('operational','broken') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `used_equipment`
--

INSERT INTO `used_equipment` (`booking_id`, `equipment_id`, `equipment_name`, `post_usage_status`) VALUES
(26, 1, 'เครื่องนวดแป้ง', 'operational'),
(26, 2, 'ไม้ตีแป้ง', 'operational'),
(26, 19, 'เตาอบ', 'operational'),
(27, 1, 'เครื่องนวดแป้ง', 'operational'),
(27, 2, 'ไม้ตีแป้ง', 'operational'),
(27, 19, 'เตาอบ', 'operational'),
(28, 1, 'เครื่องนวดแป้ง', 'operational'),
(28, 2, 'ไม้ตีแป้ง', 'operational'),
(28, 19, 'เตาอบ', 'operational'),
(29, 1, 'เครื่องนวดแป้ง', 'operational'),
(29, 2, 'ไม้ตีแป้ง', 'operational'),
(30, 1, 'เครื่องนวดแป้ง', 'operational'),
(30, 2, 'ไม้ตีแป้ง', 'operational'),
(31, 1, 'เครื่องนวดแป้ง', 'operational'),
(31, 2, 'ไม้ตีแป้ง', 'operational'),
(31, 19, 'เตาอบ', 'operational'),
(32, 1, 'เครื่องนวดแป้ง', 'operational'),
(32, 2, 'ไม้ตีแป้ง', 'operational'),
(32, 19, 'เตาอบ', 'operational');

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
  MODIFY `equipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `professor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
