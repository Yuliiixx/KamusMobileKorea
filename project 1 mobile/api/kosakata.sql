-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2024 at 05:08 PM
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
-- Database: `kamus`
--

-- --------------------------------------------------------

--
-- Table structure for table `kosakata`
--

CREATE TABLE `kosakata` (
  `id` int(11) NOT NULL,
  `indonesia` varchar(100) NOT NULL,
  `korea` varchar(100) NOT NULL,
  `hangeul` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kosakata`
--

INSERT INTO `kosakata` (`id`, `indonesia`, `korea`, `hangeul`) VALUES
(1, 'Halo', 'Annyeonghaseyo', '안녕하세요'),
(2, 'Cinta', 'Sarang', '사랑'),
(3, 'Terima kasih', 'Gamsahamnida', '감사합니다'),
(4, 'Makanan', 'Eumsik', '음식'),
(5, 'Teman', 'Chingu', '친구 '),
(6, 'Keluarga', 'Gajok', '가족'),
(7, 'Sekolah', 'Hakgyo', '학교'),
(8, 'Kota', 'Dosi', '도시'),
(9, 'Kebebasan', 'Jayu', '자유'),
(10, 'Selamat datang', 'Hwanyeonghamnida', '환영합니다'),
(11, 'Indah', 'Areumdaun', '아름다운'),
(12, 'Kucing', 'Goyangi', '고양이'),
(13, 'Anjing', 'Gae', '개'),
(14, 'Foto', 'Sajin', '사진'),
(15, 'Musik', 'Eumak', '음악'),
(16, 'Film', 'Yeonghwa', '영화'),
(17, 'Buku', 'Chaek', '책 '),
(18, 'Perjalanan', 'Yeohaeng', '여행'),
(19, 'Hujan', 'Bi', '비'),
(20, 'Matahari', 'Taeyang', '태양');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kosakata`
--
ALTER TABLE `kosakata`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kosakata`
--
ALTER TABLE `kosakata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
