-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2022 at 04:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jwt_auth`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(13,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lands`
--

INSERT INTO `lands` (`id`, `name`, `detail`, `images`, `price`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'ĐẤT MINH TRÍ, SÓC SƠN', '- Diện tích: Từ 100m2 tới 2000m2.\r\n- Đặc điểm & Vị trí đất:\r\n+ Gần nhiều vị trí đẹp như: Sân golf Hà Nội, khu nghỉ dưỡng Đồng Đò, khu công nghiệp sạch...\r\n+ Đặc biệt đất nằm trên trục đường to và rộng (2 ô tô tránh nhau thoải mái).\r\n+ Đất vuông vắn, đất có tường vây bao quanh và nằm trong trung tâm khu dân cư, trường học, chợ, sân vận động....\r\n+ Hệ thống tiện ích xung quanh đầy đủ, đường to rộng đẹp 7m. Thích hợp phân lô để bán.\r\n- Pháp lý: Rõ ràng - Sổ đỏ chính chủ.\r\n- Giá bán từ 5tr/m2 đến 10tr/m2.', 'images/land-photo-1653400370.png', '1689438612000', 21, '2022-05-19 00:53:43', '2022-05-24 06:52:50'),
(2, 'ĐẤT THỔ CƯ GẦN TRƯỜNG TH LONG KHÊ', 'Bán gấp lô đất thổ cư gần đường ĐT 830 xã Long Khê, huyện Cần Đước, tỉnh Long An.\r\nĐường trải đá mi 5m.\r\nDiện tích: 120m2.\r\nGiá chỉ: 10 triệu/m2.\r\nGần kề: UBND xã Long Khê, trạm y tế xã Long Khê, trường tiểu học Long Khê, trường tiểu học Long Trạch, trường THCS Long Trạch, Bách Hoá Xanh, chợ Gò Đen,...\r\nKhu đô thị xung quanh đầy đủ tiện ích, dân cư đông đúc, giao thông thuận tiện.\r\nSổ hồng riêng, bao sang tên công chứng.', 'images/land-photo-1653400383.png', '6666', 6, '2022-05-19 00:54:22', '2022-05-24 06:53:03'),
(5, 'Bất động sản 1234', 'Bất động sản 1234', 'images/land-photo-1653366838.png', '1234', 14, '2022-05-19 03:32:24', '2022-05-23 21:33:58'),
(6, 'ĐẤT MẶT TIỀN ĐƯỜNG NGUYỄN VĂN CỪ', 'Đất nền trong khu dân cư ở Bảo Lâm - Nơi đầu tư an cư nghỉ dưỡng chỉ từ 950 triệu - 1,2 tỷ/nền, sổ hồng công chứng ngay.\r\n\r\n- Diện tích: Ngang 5m, 7m (có sẵn 100m2 thổ cư), giá thật 100% không qua trung gian.\r\n- Cách trung tâm Tp. Bảo Lộc chỉ 20 phút đi xe.\r\n- Diện tích đa dạng: 125m2; 200m2; 250m; 500m2.\r\n- Hạ tầng đã hoàn chỉnh, quy hoạch đồng bộ đầu tiên tại Bảo Lộc với hệ thống đường nhựa, điện, nước, công viên hồ điều hòa, công viên chủ đề hoa theo mùa trong nội khu tuyệt đẹp... Tất cả tạo nên một không gian sống xanh - đẳng cấp.', 'images/land-photo-1652966288.png', '5424523452', 1, '2022-05-19 06:18:08', '2022-05-19 06:18:08'),
(11, 'ĐẤT NỀN HÒA LẠC', 'Giao thông đi lại thuận tiện, dễ dàng di chuyển ra Quốc lộ 21, Tỉnh lộ 420, ĐH FPT, khu Công nghệ cao Hòa Lạc.\r\n- Cách Công nghệ cao Hòa Lạc chỉ 5p đi xe.\r\n- Cách Quốc lộ 21 chỉ 700m, Tỉnh lộ 420 đúng 400m.\r\n- Từ đây ra ngã 3 chợ Hòa Lạc đúng 1km.\r\n- Nằm cạnh khu dân cư, gần chợ, trường học, Ủy ban nhân dân.\r\n\r\nTiềm năng tăng giá vượt trội bởi cơ sở hạ tầng được quy hoạch bài bản, đất đẹp, diện tích phù hợp nhiều mục đích sử dụng.\r\n+ Diện tích: 100m2.\r\n+ Tình trạng: Full thổ cư, sổ đỏ có sẵn từng lô.\r\n+ Đường rộng 8m - 20m, vỉa hè 3m - 5m rộng nhất Hòa Lạc.\r\n+ Hệ thống điện, nước, cây xanh thoáng mát, dân cư đông đúc.\r\n+ Thích hợp mua để ở, đầu tư hay xây trọ rất tốt.\r\n\r\nVới sự phát triển từng ngày của khu Công nghệ cao Hòa Lạc cùng với việc mở rộng TL 420 lên 24m sẽ thúc đẩy giá đất quanh khu vực phát triển mạnh mẽ trong tương lai.\r\n\r\nCòn 1 lô duy nhất cho khách hàng nhanh tay với số vốn chỉ nhỉnh 1 tỷ.', 'images/land-photo-1653321918.png', '3547537853', 11, '2022-05-23 09:05:18', '2022-05-23 09:05:18'),
(12, 'LÔ ĐẤT GÓC, 2 MẶT TIỀN HẺM LỚN BÙI ĐÌNH TUÝ, BÌNH THẠNH', 'Vị trí kỳ đẹp vô cùng đắc địa, 3 đường lớn vào tới đất: Hẻm chùa Long Vân 194 Bạch Đằng, hẻm chợ 125 Bùi Đình Tuý, hẻm rạch Cầu Sơn 47 Bùi Đình Tuý.\r\n\r\nĐặc biệt vô cùng tiềm năng trong tương lai: Dãy nhà đối diện lô đất quy hoạch công viên cây xanh, thẳng ra bờ kênh xanh xanh.\r\n\r\nHẻm xe hơi 7m, hẻm hông 4m.\r\nGần chợ, trường học, bệnh viện, ngân hàng...\r\nDiện tích: 5 X 12m, vuông vức.\r\nGiá ra đi: 8,2 tỷ. TL nhẹ.\r\nSổ hồng riêng.', 'images/land-photo-1653321961.png', '8200524377', 12, '2022-05-23 09:06:01', '2022-05-23 09:06:01'),
(13, 'CHÍNH CHỦ BÁN 10.5HA ĐẤT KHU VỰC VỊNH VÂN PHONG', 'Chính chủ bán gấp Khu đất có 30 m mặt tiền đường Quốc lộ 1A, Xã Ninh Thọ, Ninh Hòa, Khánh Hòa.\r\n- Khu đất theo quy hoạch sử dụng đất đến năm 2030 thuộc quy hoạch đất cơ sở sản xuất phi nông nghiệp.\r\n- Vị trí lô đất nằm tại ngay khu kinh tế Vân Phong, tiềm năng phát triển cực cao.\r\n- Cách UBND xã Ninh Thọ 3 km.\r\n- Dân cư đông đúc đầy đủ tiện ích.\r\n- Pháp lý đầy đủ sang tên nhanh chóng.\r\n- Diện tích: 10.5 ha.\r\n- Giá bán: 1.2 triệu/m2.', 'images/land-photo-1653322003.png', '126673562457', 5, '2022-05-23 09:06:43', '2022-05-23 09:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(33, '2014_10_12_000000_create_users_table', 1),
(34, '2014_10_12_100000_create_password_resets_table', 1),
(35, '2019_08_19_000000_create_failed_jobs_table', 1),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(37, '2022_04_27_022838_create_articles_table', 1),
(39, '2022_04_27_022855_create_lands_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `age` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `email_verified_at`, `age`, `gender`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Cuong0611', 'Phạm Tiến Cường', 'Cuong0611@gmail.com', NULL, 23, 0, '$2y$10$NiDpuadCI9G64/YHQkUukOZtf.RAbLAkw/pAeRsD8asc7a6EOwTxa', NULL, '2022-04-26 19:57:20', '2022-05-26 03:32:36'),
(2, 'Cuoedrfgsdfgsdfgsdfg5', 'Cuong45624356', 'Cuonsdfgsdfgg0611@gmail.com', NULL, 18, 1, '$2y$10$reYSwbh4xcXj5EBA8lOzu.YI2om54JBiujPYlaP4W/NAKfjM6e05.', NULL, '2022-04-27 02:41:42', '2022-05-26 03:07:04'),
(4, 'Minhfuckboi', 'Minh fuckboi phố cổ hà nội', 'Minhfuckboi@gmail.com', NULL, 22, 1, '$2y$10$bTKb7jr84qjm10hf4tz.4uy5lK7y8UGgEdVpwnZWmeKsZAGlJ4aXe', NULL, '2022-04-29 06:50:17', '2022-04-29 06:50:17'),
(6, 'Cuongzzzzzzzzz', 'Cường nghèo', 'Cuongzzzzzzzzz@gmail.com', NULL, 22, 0, '$2y$10$zu3KRkIPe6l0tUaigS8fxOi24JtAzp3hvz.iVULni4JF7.TDb1uhq', NULL, '2022-05-19 06:47:37', '2022-05-19 06:47:37'),
(11, 'trangciu', 'Trần Thị Trang', 'trangciu@outlook.com', NULL, 22, 1, '$2y$10$rzyEUz0OtzI4rCgH1cN5veEVvvcD/7X1ASzEigHO3o3ROr6octgc2', NULL, '2022-05-23 06:59:07', '2022-05-24 05:28:38'),
(12, 'vanlinh', 'Đoàn văn linh', 'vanlinh@gmail.com', NULL, 23, 0, '$2y$10$v0paekFPyuzMPQgAgb9ih.ZHyxRqhuxoluZfirtFRABJjzmWO06bm', NULL, '2022-05-23 08:56:01', '2022-05-23 08:56:01'),
(13, 'minhnguyen', 'Minh phố cổ', 'minhnguyen@gmail.com', NULL, 40, 0, '$2y$10$Wo08yJHtBuegfr2WIfJdTOahRl0ylezYL5oFEm2RKnZ0QfrY.ekWq', NULL, '2022-05-23 09:07:26', '2022-05-23 09:07:26'),
(14, 'Thanhmombacgiang', 'Nguyễn Thị Vân Ly', 'Lyly@gmail.com', NULL, 21, 1, '$2y$10$Myj.6b6KQ7xUkdpgyQ0/f.wa9OVT.gwPkPUGX5IuwU/jTlIsgW4g.', NULL, '2022-05-23 09:08:27', '2022-05-26 03:05:04'),
(15, 'chienprovip', 'Nguyễn Văn Chiến', 'chienprovip@gmail.com', NULL, 21, 0, '$2y$10$XSGMDAMRdjKKGRy2nMkmw.U7zPsi0iQZSAWQQXjo3iuVEiwHEakYu', NULL, '2022-05-23 09:09:47', '2022-05-23 09:09:47'),
(17, 'vanhmtp', 'Vân anh', 'vanhmtp@gmail.com', NULL, 26, 1, '$2y$10$7bZKZhJ4PtIl.5Gp31My1uQPQBfb5/YjYnI1Pg.fO6Y.Y36vKz3NO', NULL, '2022-05-23 09:11:35', '2022-05-23 09:11:35'),
(20, 'thanhmomxunghe', 'Hoàng Yến', 'thanhmomxunghe@gmail.com', NULL, 22, 1, '$2y$10$ULaq8TTbfY3lhb3lHY2nv.rEx32IA.SrGkQhI7XH4grerj0FTw.Ue', NULL, '2022-05-24 05:13:20', '2022-05-24 05:13:20'),
(21, 'thanhmomphoco', 'Nguyễn Công Minh', 'thanhmomphoco@gmail.com', NULL, 23, 0, '$2y$10$ew.o8Bciep.aUSRV6KC4eeZLBOEoD4c6elCSPXVzZ.JmZYHAYpp1u', NULL, '2022-05-24 05:16:24', '2022-05-24 05:16:24'),
(22, 'Lethithutrang', 'Trang pro víp', 'Lethithutrang@gmail.com', NULL, 20, 1, '$2y$10$OJc/iPvBBWejSw.JGV0ufOFuV0mkn1KCkFCqQZxJXDdUAJFjvkAPu', NULL, '2022-05-24 19:56:24', '2022-05-24 19:56:24'),
(23, 'Lethithutrang1', 'Trang pro víp', 'Lethithutrang1@gmail.com', NULL, 20, 1, '$2y$10$f9INQU99NWbVNaBsH6Ggt.tjTWmSbAsFnJIJStD6P51TdgURheuqe', NULL, '2022-05-24 19:58:19', '2022-05-24 19:58:19'),
(24, 'Cuong3z', 'Cường', 'Cuong3z@gmail.com', NULL, 22, 0, '$2y$10$fyR3Z/kytXFOxOniN/rLMe4mFc8FSzjCLkxWt5vBpzzJpcWOIJAZK', NULL, '2022-05-26 03:09:31', '2022-05-26 03:09:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
