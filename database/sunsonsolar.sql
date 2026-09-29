-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2026 at 03:10 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sunsonsolar`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_name` varchar(200) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `clock_in_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_services`
--

CREATE TABLE `products_services` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `category` enum('product','service') NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products_services`
--

INSERT INTO `products_services` (`id`, `name`, `category`, `type`, `description`) VALUES
(1, 'Solar Panel', 'product', 'panels', 'High efficiency solar panels'),
(2, 'Inverter Unit', 'product', 'inverters', 'Power conversion inverters'),
(3, 'Storage Battery', 'product', 'batteries', 'High capacity energy storage'),
(4, 'Racking & Mounting Kit', 'product', 'racking & mounting', 'Hardware for panel installation'),
(5, 'Wiring & Cabling Set', 'product', 'wires', 'Heavy-duty solar cables'),
(6, 'Solar Consultation', 'service', 'consultation', 'Professional energy assessment'),
(7, 'System Design', 'service', 'designing', 'Customized layout and capacity design'),
(8, 'Permit Acquisition', 'service', 'permitting', 'Official documentation and permits handling'),
(9, 'System Installation', 'service', 'installation', 'On-site hardware setup'),
(10, 'System Maintenance', 'service', 'maintenance', 'Routine system health checks'),
(11, 'System Repair', 'service', 'repair', 'On-site troubleshooting and component repair'),
(12, 'Performance Monitoring', 'service', 'monitoring', 'Real-time performance tracking');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `department` enum('Administration', 'IT', 'Dispatch', 'Accounting', 'Hr', 'Marketing', 'Sales', 'Costumer Service') DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `birthdate`, `gender`, `email`, `phone_num`, `address`, `username`, `password`, `department`, `created_at`) VALUES
(1, 'Kitty', 'Kat', 'User', '1998-05-16', 'Female', 'kittykat16@example.com', '09123456789', '123 Main St', 'KittyKat16', 'K@tSunShine16', NULL, '2026-09-29 09:07:07'),
(2, 'Sol', 'S', 'Solis', '1967/01/08', 'Male', 'sol.solis@sunsonsolar.com', '09987654321', 'Solar HQ Office', 'Sol Solis', 'admin123', 'IT', '2026-09-29 09:07:22'),
(3, 'Katherine', 'O', 'Sinigaraw', '1990/01/07', 'Female', 'katherine.sinigaraw@sunsonsolar.com', '09291230983', 'Client', 'Sol Solis', 'admin123', 'IT', '2026-09-29 09:02:39');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products_services`
--
ALTER TABLE `products_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_services`
--
ALTER TABLE `products_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
