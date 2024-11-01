-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 01, 2024 at 05:27 AM
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`professor_id`),
  ADD KEY `KU_email` (`KU_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `professor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `professor`
--
ALTER TABLE `professor`
  ADD CONSTRAINT `professor_ibfk_1` FOREIGN KEY (`KU_email`) REFERENCES `person` (`KU_email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
