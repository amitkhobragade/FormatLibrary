-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2016 at 11:49 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `try`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `created_on`) VALUES
(1, 'admin@gmail.com', 'e6e061838856bf47e1de730719fb2609', '2016-07-23 08:04:25'),
(2, 'admin@seequestor.com', 'e6e061838856bf47e1de730719fb2609', '2016-07-27 10:22:05');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `file_id` int(50) NOT NULL,
  `video_info_id` int(50) NOT NULL,
  `video_file_path` varchar(500) NOT NULL,
  `file_size` varchar(50) NOT NULL,
  `file_uploaded_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_files`
--

INSERT INTO `uploaded_files` (`file_id`, `video_info_id`, `video_file_path`, `file_size`, `file_uploaded_date`) VALUES
(240, 345, 'nvf/21095 - 2013_10_08_05_25 - 2013_10_08_05_35.NVF', '33.836315', '2016-08-11 08:45:16'),
(241, 345, 'nvf/21096 - 2013_10_08_05_25 - 2013_10_08_05_35.NVF', '44.680843', '2016-08-11 08:45:16'),
(242, 345, 'Sony 4K Demo.mp4', '13.306451', '2016-08-11 08:45:16'),
(243, 346, 'nvf/21095 - 2013_10_08_05_25 - 2013_10_08_05_35.NVF', '33.836315', '2016-08-11 09:00:14'),
(244, 346, 'nvf/21096 - 2013_10_08_05_25 - 2013_10_08_05_35.NVF', '44.680843', '2016-08-11 09:00:14'),
(245, 346, 'nvf/data/test.avi', '0.37908173', '2016-08-11 09:00:14'),
(246, 346, 'Sony 4K Demo.mp4', '13.306451', '2016-08-11 09:00:14'),
(247, 347, 'nvf/case1.NVF', '33.836315', '2016-08-11 09:12:11'),
(248, 347, 'nvf/case2.NVF', '44.680843', '2016-08-11 09:12:11'),
(249, 347, 'nvf/New folder/test1.mp4', '4.628805', '2016-08-11 09:12:11'),
(250, 347, 'Sony 4K Demo.mp4', '13.306451', '2016-08-11 09:12:11'),
(251, 348, 'nvf/case1.NVF', '33.836315', '2016-08-11 10:26:22'),
(252, 348, 'nvf/case2.NVF', '44.680843', '2016-08-11 10:26:22'),
(253, 348, 'nvf/New folder/test1.mp4', '4.628805', '2016-08-11 10:26:22'),
(254, 348, 'Sony 4K Demo.mp4', '13.306451', '2016-08-11 10:26:22'),
(255, 349, 'nvf/case1.NVF', '33.836315', '2016-08-11 10:26:30'),
(256, 349, 'nvf/case2.NVF', '44.680843', '2016-08-11 10:26:30'),
(257, 349, 'nvf/New folder/test1.mp4', '4.628805', '2016-08-11 10:26:30'),
(258, 349, 'Sony 4K Demo.mp4', '13.306451', '2016-08-11 10:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `uploaded_file_info`
--

CREATE TABLE `uploaded_file_info` (
  `video_info_id` int(100) NOT NULL,
  `user_id` int(50) NOT NULL,
  `primary_file_ext` varchar(30) NOT NULL,
  `sec_file_ext` varchar(30) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `version_name` varchar(100) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `manufacture_web` varchar(100) DEFAULT NULL,
  `modelno` varchar(100) DEFAULT NULL,
  `videofile_type` varchar(100) DEFAULT NULL,
  `decoder_conv` varchar(100) DEFAULT NULL,
  `conv_file` varchar(100) DEFAULT NULL,
  `file_source` varchar(100) DEFAULT NULL,
  `total_size` varchar(100) NOT NULL,
  `no_of_cameras` varchar(100) DEFAULT NULL,
  `uploaded_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploaded_file_info`
--

INSERT INTO `uploaded_file_info` (`video_info_id`, `user_id`, `primary_file_ext`, `sec_file_ext`, `player_name`, `version_name`, `manufacturer`, `manufacture_web`, `modelno`, `videofile_type`, `decoder_conv`, `conv_file`, `file_source`, `total_size`, `no_of_cameras`, `uploaded_date`) VALUES
(345, 141, 'mm', 'mm', 'm', 'm', 'mm', 'm', 'm', 'm', 'm', 'm', 'm', '13.306451', 'm', '2016-08-11 08:45:16'),
(346, 142, 'Mp3', 'mkv - Vista Qulu', 'mkv player', 'mkv 3.1.0', 'Vista Qulu', 'unknown.com', '82', 'CCTV', 'Capita FLAC', 'Mitsubushi V2', '264 - Lancs - Barbers', '13.306451', '20', '2016-08-11 09:00:14'),
(347, 145, 'avi', '264 (H264 Raw)', 'avi player', 'avi 9.2.1', 'Samsung', 'samsung.com', '640', 'Generic', 'DVD video', 'DVD video', 'avi - BTP - Highb2', '13.306451', '10', '2016-08-11 09:12:11'),
(348, 143, 'mp4', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '13.306451', '10', '2016-08-11 10:26:22'),
(349, 143, 'mp4', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '13.306451', '10', '2016-08-11 10:26:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `country` varchar(20) NOT NULL,
  `approved` tinyint(1) DEFAULT '0',
  `created_on` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `company`, `address`, `country`, `approved`, `created_on`) VALUES
(1, 'adminfirstname', 'adminlastname', 'admin@gmail.com', 'e6e061838856bf47e1de730719fb2609', 'Acuiti', 'Pune', 'India', 1, '2016-07-25 04:36:03'),
(40, 'Amit', 'Khobragade', 'amit@gmail.com', '62aff5e676a5c89f4203ecd2ae6478c8', 'Acuiti', 'Pune', 'India', 1, '2016-07-25 04:36:03'),
(41, 'Vaibhav', 'Rajput', 'vaibhav@gmail.com', 'e71ecfa8207e139406b520bcf80d390b', 'Acuiti', 'Pune', 'India', 1, '2016-07-25 04:51:36'),
(44, 'manoj', 'harbhajanka', 'manoj@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'acuiti consultants india pvt ltd', '401, Deron Hills Survey No. 6 Hissa 1/1 of Baner Off Baner Road Pune-411 045', 'india', 1, '2016-07-25 08:46:19'),
(68, 'sameer', 'deshmukh', 'sameer@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'acuiti consultants india pvt ltd', '401, Deron Hills Survey ', 'india', 0, '2016-07-26 12:12:05'),
(69, 'Sneha', 'Joshi', 'sneha@gmail.com', '202cb962ac59075b964b07152d234b70', 'acuiti consultants india pvt ltd', '401, Deron Hills Survey No. 6 Hissa 1/1 of Baner Off Baner Road Pune-411 045', 'india', 1, '2016-07-26 12:15:15'),
(70, 'Max', 'Harb', 'max@harbhajanka.com', '025711f4026c000040f8fcbb6d647926', 'acuiti consultants india pvt ltd', '401, Deron Hills Survey No. 6 Hissa 1/1 of Baner Off Baner Road Pune-411 045', 'India', 1, '2016-07-26 12:28:04'),
(71, 'Mayur', 'Borase', 'mayur@gmail.com', '6f8f57715090da2632453988d9a1501b', 'Acuiti', 'Pune', 'India', 1, '2016-07-26 12:57:21'),
(141, 'user7', 'user7last name', 'user7@gmail.com', '202cb962ac59075b964b07152d234b70', 'acuiti consultants india pvt ltd', 'Pune', 'India', 1, '2016-08-11 08:43:50'),
(142, 'user8', 'Sonwane', 'user8@gmail.com', '202cb962ac59075b964b07152d234b70', 'acuiti consultants india pvt ltd', 'Pune', 'India', 1, '2016-08-11 08:58:04'),
(143, 'user1', 'user1last name', 'user1@gmail.com', '202cb962ac59075b964b07152d234b70', 'Acuiti Lab', 'Pune', 'India', 1, '2016-08-11 09:05:02'),
(144, 'user2', 'user2last name', 'user2@gmail.com', '202cb962ac59075b964b07152d234b70', 'Acuiti consultants india pvt ltd', 'Pune', 'India', 1, '2016-08-11 09:06:13'),
(145, 'user9', 'user9last name', 'user9@gmail.com', '202cb962ac59075b964b07152d234b70', 'Acuiti Lab', 'Pune', 'India', 1, '2016-08-11 09:08:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `uploaded_file_info`
--
ALTER TABLE `uploaded_file_info`
  ADD PRIMARY KEY (`video_info_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `file_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;
--
-- AUTO_INCREMENT for table `uploaded_file_info`
--
ALTER TABLE `uploaded_file_info`
  MODIFY `video_info_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
