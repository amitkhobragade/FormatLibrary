-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2016 at 08:46 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sq_format_library`
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
(1, 'admin@acuiticonsultants.com', 'e6e061838856bf47e1de730719fb2609', '2016-07-23 08:04:25'),
(2, 'admin@seequestor.com', 'e6e061838856bf47e1de730719fb2609', '2016-07-27 10:22:05');

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
(80, 'Rakesh', 'Sharma', 'rakesh.sharma@acuiticonsultants.com', '67a05e3822ce48a6386746388e6c81f5', 'Acuiti consultants india pvt ltd', 'Pune', 'India', 1, '2016-07-27 07:08:17'),
(86, 'maximus', 'roman', 'maximus@seequestor.com', 'e10adc3949ba59abbe56e057f20f883e', 'Seequestor', 'London', 'UK', 1, '2016-07-27 10:26:50'),
(87, 'Shubahm', 'Deshpande', 'shubham@gmail.com', '3b6beb51e76816e632a40d440eab0097', 'Acutilabs', 'Baner Road Pune', 'India', 1, '2016-07-27 10:40:24'),
(90, 'henry', 'thomson', 'henry@seequestor.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Seequestor ltd', 'london', 'uk', 1, '2016-07-27 12:20:42'),
(116, 'sam', 'sam', 'sam@gmail.com', '332532dcfaa1cbf61e2a266bd723612c', 'sam', 'sam', 'sam', 1, '2016-08-04 11:07:26'),
(117, 'zz', 'zz', 'z@z', 'fbade9e36a3f36d3d676c1b808451dd7', 'zz', 'zzz', 'zzz', 1, '2016-08-05 07:07:09'),
(118, 'oliver', 'queen', 'oliver@gmail.com', '3db9007f5acd91bf68373c0128dc0724', 'oli', 'oli', 'US', 0, '2016-08-08 03:59:33'),
(119, 'pp', 'pp', 'p@p', '83878c91171338902e0fe0fb97a8c47a', 'p', 'p', 'p', 1, '2016-08-08 04:13:59'),
(120, 'cxb', 'xcb', 'aa@ss', '698d51a19d8a121ce581499d7b701668', '11', '11', '11', 0, '2016-08-08 06:44:53'),
(121, 'qq', 'qq', 'qq@qq', '99b3b060154898840f0ebdfb46ec78f', 'qq', 'qq', 'qq', 0, '2016-08-08 06:49:36'),
(122, 'gds', 'dsg', 'sdg@dgzxg', '6512bd43d9caa6e02c990b0a82652dca', '11', '11', '11', 0, '2016-08-08 07:06:56'),
(123, 'jkk', 'jmk', 'k@ssxcmv', '6512bd43d9caa6e02c990b0a82652dca', '1111', '11', '11', 0, '2016-08-08 07:08:36'),
(124, 'zz', 'zz', 'czxv@zxcgv', '310dcbbf4cce62f762a2aaa148d556bd', '33', '33', '33', 0, '2016-08-08 07:09:24'),
(125, 'qws', 'qs', 'fhbd@dszfv', '698d51a19d8a121ce581499d7b701668', '11', 'gh', 'fhd', 0, '2016-08-08 07:14:47'),
(126, 'dfxh', 'fdh', 'fdhx@cb', '698d51a19d8a121ce581499d7b701668', '1111vm', 'fg', 'gfj', 0, '2016-08-08 07:22:39'),
(127, 'sd', 'SDGg', 'dgs@fh', '6512bd43d9caa6e02c990b0a82652dca', 'dfh', 'fdhh', 'dhf', 0, '2016-08-08 07:25:13'),
(128, 'sd', 'SDGg', 'dgs@fh', '6512bd43d9caa6e02c990b0a82652dca', 'dfh', 'fdhh', 'dhf', 0, '2016-08-08 07:26:04'),
(129, 'imtiyaz', 'imtiyaz', 'imtiyaz@gmail.com', '202cb962ac59075b964b07152d234b70', 'imtiyaz', 'imtiyaz', 'imtiyaz', 1, '2016-08-09 04:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `video_file_data`
--

CREATE TABLE `video_file_data` (
  `file_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `video_file_path` varchar(500) NOT NULL,
  `size` varchar(50) NOT NULL,
  `created_on` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_file_data`
--

INSERT INTO `video_file_data` (`file_id`, `user_id`, `video_file_path`, `size`, `created_on`) VALUES
(3342343, 129, 'C:/Users/Admin/Desktop/\\43\\test.avi', '4.628805', '2016-08-08 07:34:45');

-- --------------------------------------------------------

--
-- Table structure for table `video_file_information`
--

CREATE TABLE `video_file_information` (
  `id` int(100) NOT NULL,
  `user_id` int(50) NOT NULL,
  `file_id` int(100) NOT NULL,
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
  `size` varchar(100) NOT NULL,
  `no_of_cameras` varchar(100) DEFAULT NULL,
  `video_path` varchar(500) DEFAULT NULL,
  `created_on` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video_file_information`
--

INSERT INTO `video_file_information` (`id`, `user_id`, `file_id`, `primary_file_ext`, `sec_file_ext`, `player_name`, `version_name`, `manufacturer`, `manufacture_web`, `modelno`, `videofile_type`, `decoder_conv`, `conv_file`, `file_source`, `size`, `no_of_cameras`, `video_path`, `created_on`) VALUES
(71, 40, 1, 'mp4', 'AVI', 'VLC', '2.4.5', 'opensource', 'opensource', '111', 'CCTV', 'h264', 'yes', 'Source of file ', '2323', '5', 'C:/Users/Admin/Desktop/40/hiiii.mp4', '2016-07-25 04:40:55'),
(75, 43, 2, 'arc', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '11', '10', 'C:/Users/Admin/Desktop/\\43\\test.avi', '2016-07-25 07:45:29'),
(76, 44, 3, 'arc', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '1', '15', 'C:/Users/Admin/Desktop/\\44\\test.avi', '2016-07-25 08:48:43'),
(125, 87, 280505490, 'h264', 'vob', 'vlc', '2.5.4', 'Generic FFMPEG', 'FFMPEG.com', '356', 'cctv', 'Dedicated Micros Observer', 'par - BTP - Brom South', 'avi - BTP - Highb2', '0.37908173', '100', 'C:/Users/Admin/Desktop/\\87\\test.avi', '2016-07-27 10:46:36'),
(127, 89, 832824805, 'psf', 'mp4', 'psf - Xeno Nitro', 'unknown', 'Xeno Nitro', '', '256', '', 'Generic FFMPEG', 'STRG', 'nvf - BTP - Gatw North', '4.628805', '100', 'C:/Users/Admin/Desktop/\\89\\hiiii.mp4', '2016-07-27 11:09:57'),
(210, 71, 382912521, 'arc', 'SAd', 'DA', 'da', 'As', 'as', 'AS', 'as', 'As', 'as', 'AS', '2.85921', 'as', 'C:/Users/Admin/Desktop/\\71\\website25_07_11am.rar', '2016-07-29 09:14:00'),
(214, 71, 336616616, 'test', 'Faiveley X Track', 'vlc', 'a', 'a', 'aaaaa', 'aaa', 'a', 'aaa', 'aaa', 'a', '0.37908173', 'a', 'C:/Users/Admin/Desktop/\\71\\hiiii.mp4', '2016-07-29 10:43:11'),
(215, 71, 913138010, 'safs', 'sfafas', 'safsfa', 'sfa', 'saf', 'saf', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '4.628805', '10', 'C:/Users/Admin/Desktop/\\71\\hiiii.mp4', '2016-07-29 11:37:33'),
(230, 116, 716683452, 'sama', 'sama', 'sama', 'sama', 'sama', 'sama', 'sama', 'sama', 'sama', 'sama', 'samasama', '4.628805', 'sama', 'C:/Users/Admin/Desktop/\\116\\hiiii.mp4', '2016-08-04 11:10:32'),
(231, 116, 217024687, 'sam1', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '0.37908173', '10', 'C:/Users/Admin/Desktop/\\116\\test.avi', '2016-08-04 11:11:12'),
(232, 116, 793668254, 'arc', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '0.37908173', '10', 'C:/Users/Admin/Desktop/\\116\\hiiii.mp4', '2016-08-04 11:25:34'),
(233, 116, 475507139, 'arc11', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '0.37908173', '10', 'C:/Users/Admin/Desktop/\\116\\hiiii.mp4', '2016-08-04 11:28:27'),
(234, 116, 665319515, 'arc11', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '47.34907', '10', 'C:/Users/Admin/Desktop/\\116\\.DS_Store', '2016-08-04 11:31:38'),
(235, 116, 429382829, 'arc', 'Faiveley X Track', 'kk', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '47.34907', '10', 'C:/Users/Admin/Desktop/\\116\\.DS_Store', '2016-08-04 11:36:21'),
(252, 119, 0, 'dwaqsfs', 'aff', 'saf', 'asf', 'asf', 'asf', 'asf', 'asf', 'saf', 'afs', 'fas', '0.0350523', 'asf', '', '2016-08-08 04:17:40'),
(258, 119, 260996021, 'sdg', 'dgs', 'dsg', 'sdgsSsssS', 'S', 'S', 'SS', 'FG', 'S', 'SS', 'S', '0.29567528', 'S', 'C:/Users/Admin/Desktop/\\119\\bkc_g64\\.DS_Store', '2016-08-08 06:35:36'),
(259, 71, 416357335, 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', 'mayur', '0.42879772', 'mayur', 'C:/Users/Admin/Desktop/\\71\\bwh_264\\.DS_Store', '2016-08-08 11:46:55'),
(260, 129, 569524950, 'arc', 'Faiveley X Track', 'vlc', '5.02.1', 'Adpro FastTrace', 'http://xtralis.com/', '256', 'cctv', 'Generic FFMPEG', 'avi - BTP - TurnP', 'avi - BTP - Highb2', '3.5858154E-4', '10', 'C:/Users/Admin/Desktop/\\129\\bkc_g64\\.DS_Store', '2016-08-09 04:30:34'),
(261, 129, 553591655, '1111', '11111111', '1111', '11', '1', '1', '1', '1', '1', '1', '1', '3.5858154E-4', '1', 'C:/Users/Admin/Desktop/\\129\\71/bwh_264\\.DS_Store', '2016-08-09 05:54:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `video_file_data`
--
ALTER TABLE `video_file_data`
  ADD PRIMARY KEY (`file_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `video_file_information`
--
ALTER TABLE `video_file_information`
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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `video_file_data`
--
ALTER TABLE `video_file_data`
  MODIFY `file_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3342345;
--
-- AUTO_INCREMENT for table `video_file_information`
--
ALTER TABLE `video_file_information`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=262;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
