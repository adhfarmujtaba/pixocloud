-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2023 at 04:58 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_name`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloudimg`
--

CREATE TABLE `cloudimg` (
  `id` int(11) NOT NULL,
  `unique_filename` varchar(255) NOT NULL,
  `original_filename` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `upload_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cloudimg`
--

INSERT INTO `cloudimg` (`id`, `unique_filename`, `original_filename`, `username`, `upload_date`) VALUES
(145, '3cb3447c-c92b-4076-9ee9-7a3e601cc5d0.jpg', 'a-shuau-obofili-vuFzbaTpR7s-unsplash.jpg', 'admin', '2023-10-24 13:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `filename`, `title`, `category`) VALUES
(5, 'antoine-beauvillain-qrPqGP-SG8w-unsplash.jpg', 'hii1', 'nature'),
(52, 'a-shuau-obofili-vuFzbaTpR7s-unsplash.jpg', 'Image Title 52', 'Android Wallpapers'),
(54, 'a-shuau-obofili-vuFzbaTpR7s-unsplash.jpg', 'hii', 'Android Wallpapers'),
(55, 'a-shuau-obofili-vuFzbaTpR7s-unsplash.jpg', 'ss', 'nature'),
(56, 'casey-horner-vPiz8ZQ9Wf8-unsplash.jpg', 'cc', 'nature'),
(57, 'alex-green-OdEdGWr0EkM-unsplash.jpg', 'aa', 'nature'),
(58, 'alex-green-OdEdGWr0EkM-unsplash.jpg', 'aa', 'nature'),
(59, 'alex-green-OdEdGWr0EkM-unsplash.jpg', 'aa', 'nature'),
(60, 'monika-grabkowska-TAj4X5-eRqE-unsplash.jpg', 'aa', 'nature'),
(61, 'luke-leung-14BVc2mD9Bk-unsplash.jpg', 'aa', 'nature'),
(62, 'trail-l4MwmH8QIxk-unsplash.jpg', 'aa', 'nature'),
(63, 'leonardo-elmosta-qtKsuL3Hods-unsplash.jpg', 'aa', 'nature'),
(64, 'ivan-bandura-GBW67ToiEG0-unsplash.jpg', 'aa', 'nature'),
(65, 'daniel-minarik-Sk1x2a-xKKY-unsplash.jpg', 'aa', 'Car Wallpapers'),
(66, 'thom-milkovic-sGj7xKpukpQ-unsplash.jpg', 'aa', 'HD Wallpapers'),
(67, '20230101_200857.png', 'aa', 'nature'),
(68, 'WhatsApp Image 2023-10-06 at 6.34.01 PM.jpeg', 'Umer', 'nature'),
(69, 'pngwing.com (1).png', 'ee', 'nature');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile_number` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `name`, `address`, `mobile_number`) VALUES
(0, 'adhfarrajput@gmail.com', 's', 'adhfarrajput@gmail.com', 'adhfar mujtaba', 'aa', '0849xxx4011335'),
(1, 'admin', '1234', 'admin@exampl.com', 'Adhfar Mujtabaa', 'khan colony chanapora Srinagar', '8494011335'),
(0, 'admin12', '1234', 'admin@gmail.com', 'admin12', 'aa', '1234511111');

-- --------------------------------------------------------

--
-- Table structure for table `user_storage`
--

CREATE TABLE `user_storage` (
  `username` varchar(255) NOT NULL,
  `storage_used` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cloudimg`
--
ALTER TABLE `cloudimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_storage`
--
ALTER TABLE `user_storage`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cloudimg`
--
ALTER TABLE `cloudimg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
